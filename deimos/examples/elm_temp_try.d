module elm_temp_try;
extern (C)  {
int         elm_init(int argc, char** argv);
int       elm_shutdown();
void      elm_run();


template ELM_MAIN(string e_CALL =   "return elm_main(argc, &argv); ") {
    immutable string ELM_MAIN =     "int main(string[] Targ1)    {
                                        string Targ2;
                                        foreach(string temp; Targ1[])
                                            Targ2 ~= temp;
                                        char* argv  = cast(char*)Targ2.toStringz();
                                        int argc    = cast(int)Targ1.length;
                                        elm_init(argc, &argv); "
                                        ~ e_CALL
                                    ~ "}";
}
}
