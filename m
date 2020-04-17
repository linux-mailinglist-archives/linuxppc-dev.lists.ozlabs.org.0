Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5799E1AD57E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 07:09:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493PJj4tMqzDr3M
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 15:09:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493PDK691vzDq9s
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 15:05:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=RuLi0DG9; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 493PDK4Rrqz9sSh;
 Fri, 17 Apr 2020 15:05:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1587099921;
 bh=SGDsMooCKthgLynOgiPZCU6S1HxQI02ZG+fxvrYWHCQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=RuLi0DG9yHq0r7rhGyoUtPN2V+YT1GMhTfsAADyYasbSpm8k5vbQnOHNtCmdWDXRe
 Z8kMwmEK0RwG1BzaHe5ph5GMz7df/lqESpDyWVOXh0cgb9uAWtF8/BAXF2vhCqU3F/
 9tZqRoiwItCZwyratJNuzUzkUcO3Nus35PRQTfBD3zS8djTF9ZhVcLYIqLYk+rPexv
 NsNgzQ+HnHiwDErQzcKJFm6pxuqFF5TkakEVYsdWr9BsAAb++terkElhLdUGQcPbdw
 1r/a2qG9swGS8IgbF290Sy9P8inDRGRdUoMM5YU/yKlUjfUccgWfVF1hU1BWatL/Ey
 xy1ibVjNPpZIg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Raphael Moreira Zinsly <rzinsly@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org, dja@axtens.net
Subject: Re: [PATCH V3 3/5] selftests/powerpc: Add NX-GZIP engine compress
 testcase
In-Reply-To: <20200413155916.16900-4-rzinsly@linux.ibm.com>
References: <20200413155916.16900-1-rzinsly@linux.ibm.com>
 <20200413155916.16900-4-rzinsly@linux.ibm.com>
Date: Fri, 17 Apr 2020 15:05:35 +1000
Message-ID: <87h7xiitwg.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: abali@us.ibm.com, haren@linux.ibm.com, herbert@gondor.apana.org.au,
 rzinsly@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Raphael,

Some comments below ...

Raphael Moreira Zinsly <rzinsly@linux.ibm.com> writes:
> Add a compression testcase for the powerpc NX-GZIP engine.
>
> Signed-off-by: Bulent Abali <abali@us.ibm.com>
> Signed-off-by: Raphael Moreira Zinsly <rzinsly@linux.ibm.com>
> ---
>  .../selftests/powerpc/nx-gzip/Makefile        |  21 +
>  .../selftests/powerpc/nx-gzip/gzfht_test.c    | 432 ++++++++++++++++++
>  .../selftests/powerpc/nx-gzip/gzip_vas.c      | 316 +++++++++++++
>  3 files changed, 769 insertions(+)
>  create mode 100644 tools/testing/selftests/powerpc/nx-gzip/Makefile
>  create mode 100644 tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c
>  create mode 100644 tools/testing/selftests/powerpc/nx-gzip/gzip_vas.c

You haven't added this to tools/testing/selftests/powerpc/Makefile,
which means it's not actually built as part of the selftests build.
Which makes it not really a selftest.

We need:

diff --git a/tools/testing/selftests/powerpc/Makefile b/tools/testing/selft=
ests/powerpc/Makefile
index 644770c3b754..0830e63818c1 100644
--- a/tools/testing/selftests/powerpc/Makefile
+++ b/tools/testing/selftests/powerpc/Makefile
@@ -19,6 +19,7 @@ SUB_DIRS =3D alignment		\
 	   copyloops		\
 	   dscr			\
 	   mm			\
+	   nx-gzip		\
 	   pmu			\
 	   signal		\
 	   primitives		\



> diff --git a/tools/testing/selftests/powerpc/nx-gzip/Makefile b/tools/tes=
ting/selftests/powerpc/nx-gzip/Makefile
> new file mode 100644
> index 000000000000..ab903f63bbbd
> --- /dev/null
> +++ b/tools/testing/selftests/powerpc/nx-gzip/Makefile
> @@ -0,0 +1,21 @@
> +CC =3D gcc
> +CFLAGS =3D -O3
> +INC =3D ./inc
> +SRC =3D gzfht_test.c
> +OBJ =3D $(SRC:.c=3D.o)
> +TESTS =3D gzfht_test
> +EXTRA_SOURCES =3D gzip_vas.c
> +
> +all:	$(TESTS)
> +
> +$(OBJ): %.o: %.c
> +	$(CC) $(CFLAGS) -I$(INC) -c $<
> +
> +$(TESTS): $(OBJ)
> +	$(CC) $(CFLAGS) -I$(INC) -o $@ $@.o $(EXTRA_SOURCES)
> +
> +run_tests: $(TESTS)
> +	./gzfht_test gzip_vas.c
> +
> +clean:
> +	rm -f $(TESTS) *.o *~ *.gz

We have an existing system for Makefiles for selftests.

Also the test programs need to be able to just run standalone with no
arguments in order for the selftest machinery to run them correctly.

The patch below should integrate the tests properly and add a wrapper
script to run the tests.

However I'm still getting some warnings from the build:

  gunz_test.c: In function =E2=80=98decompress_file=E2=80=99:
  gunz_test.c:914:12: error: =E2=80=98total_out=E2=80=99 may be used uninit=
ialized in this function [-Werror=3Dmaybe-uninitialized]
    914 |  total_out =3D total_out + tpbc;
        |  ~~~~~~~~~~^~~~~~~~~~~~~~~~~~
  gunz_test.c:287:11: error: =E2=80=98last_comp_ratio=E2=80=99 may be used =
uninitialized in this function [-Werror=3Dmaybe-uninitialized]
    287 |  uint64_t last_comp_ratio; /* 1000 max */
        |           ^~~~~~~~~~~~~~~
  gunz_test.c:519:8: error: =E2=80=98outf=E2=80=99 may be used uninitialize=
d in this function [-Werror=3Dmaybe-uninitialized]
    519 |    n =3D fwrite(fifo_out, 1, write_sz, outf);
        |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  gunz_test.c:68:20: error: =E2=80=98inpf=E2=80=99 may be used uninitialize=
d in this function [-Werror=3Dmaybe-uninitialized]
     68 | #define GETINPC(X) fgetc(X)
        |                    ^~~~~
  gunz_test.c:274:8: note: =E2=80=98inpf=E2=80=99 was declared here
    274 |  FILE *inpf;
        |        ^~~~
  cc1: all warnings being treated as errors
  make[2]: *** [../../lib.mk:142: /home/michael/build/adhoc/kselftest/power=
pc/nx-gzip/gunz_test] Error 1


Please send a fix for those. If you just need to initialise them to 0 or
NULL at the beginning of the function that's fine by me.

cheers




diff --git a/tools/testing/selftests/powerpc/nx-gzip/Makefile b/tools/testi=
ng/selftests/powerpc/nx-gzip/Makefile
index 82abc19a49a0..387ad3857c9d 100644
--- a/tools/testing/selftests/powerpc/nx-gzip/Makefile
+++ b/tools/testing/selftests/powerpc/nx-gzip/Makefile
@@ -1,22 +1,8 @@
-CC =3D gcc
-CFLAGS =3D -O3
-INC =3D ./inc
-SRC =3D gzfht_test.c gunz_test.c
-OBJ =3D $(SRC:.c=3D.o)
-TESTS =3D gzfht_test gunz_test
-EXTRA_SOURCES =3D gzip_vas.c
+CFLAGS +=3D -O3 -m64 -I./inc
=20
-all:   $(TESTS)
+TEST_GEN_FILES :=3D gzfht_test gunz_test
+TEST_PROGS :=3D nx-gzip-test.sh
=20
-$(OBJ): %.o: %.c
-       $(CC) $(CFLAGS) -I$(INC) -c $<
+include ../../lib.mk
=20
-$(TESTS): $(OBJ)
-       $(CC) $(CFLAGS) -I$(INC) -o $@ $@.o $(EXTRA_SOURCES)
-
-run_tests: $(TESTS)
-       ./gzfht_test gzip_vas.c
-       ./gunz_test gzip_vas.c.nx.gz
-
-clean:
-       rm -f $(TESTS) *.o *~ *.gz *.gunzip
+$(TEST_GEN_FILES): gzip_vas.c
diff --git a/tools/testing/selftests/powerpc/nx-gzip/gunz_test.c b/tools/te=
sting/selftests/powerpc/nx-gzip/gunz_test.c
index 94cb79616225..8196cf56df7a 100644
--- a/tools/testing/selftests/powerpc/nx-gzip/gunz_test.c
+++ b/tools/testing/selftests/powerpc/nx-gzip/gunz_test.c
@@ -36,6 +36,9 @@
  * vas:      virtual accelerator switch; the user mode interface
  */
=20
+#define _ISOC11_SOURCE // For aligned_alloc()
+#define _DEFAULT_SOURCE        // For endian.h
+
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -242,7 +245,6 @@ static int nx_touch_pages_dde(struct nx_dde_t *ddep, lo=
ng buf_sz, long page_sz,
 static int nx_submit_job(struct nx_dde_t *src, struct nx_dde_t *dst,
                         struct nx_gzip_crb_cpb_t *cmdp, void *handle)
 {
-       int cc;
        uint64_t csbaddr;
=20
        memset((void *)&cmdp->crb.csb, 0, sizeof(cmdp->crb.csb));
diff --git a/tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c b/tools/t=
esting/selftests/powerpc/nx-gzip/gzfht_test.c
index e60f743e2c6b..a3d90b2b1591 100644
--- a/tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c
+++ b/tools/testing/selftests/powerpc/nx-gzip/gzfht_test.c
@@ -41,6 +41,8 @@
  * vas:      virtual accelerator switch; the user mode interface
  */
=20
+#define _ISOC11_SOURCE // For aligned_alloc()
+#define _DEFAULT_SOURCE        // For endian.h
=20
 #include <stdio.h>
 #include <stdlib.h>
@@ -75,7 +77,6 @@ static int compress_fht_sample(char *src, uint32_t srclen=
, char *dst,
                                uint32_t dstlen, int with_count,
                                struct nx_gzip_crb_cpb_t *cmdp, void *handl=
e)
 {
-       int cc;
        uint32_t fc;
=20
        assert(!!cmdp);
diff --git a/tools/testing/selftests/powerpc/nx-gzip/nx-gzip-test.sh b/tool=
s/testing/selftests/powerpc/nx-gzip/nx-gzip-test.sh
new file mode 100755
index 000000000000..896428ea7800
--- /dev/null
+++ b/tools/testing/selftests/powerpc/nx-gzip/nx-gzip-test.sh
@@ -0,0 +1,45 @@
+#!/bin/bash
+
+if [[ ! -w /dev/crypto/nx-gzip ]]; then
+    echo "Can't access /dev/crypto/nx-gzip, skipping"
+    echo "skip: $0"
+    exit 4
+fi
+
+set -e
+
+function cleanup
+{
+    rm -f nx-tempfile*
+}
+
+trap cleanup EXIT
+
+function test_sizes
+{
+    local n=3D$1
+    local fname=3D"nx-tempfile.$n"
+
+    for size in 4K 64K 1M 64M
+    do
+        echo "Testing $size ($n) ..."
+        dd if=3D/dev/urandom of=3D$fname bs=3D$size count=3D1
+        ./gzfht_test $fname
+        ./gunz_test ${fname}.nx.gz
+    done
+}
+
+echo "Doing basic test of different sizes ..."
+test_sizes 0
+
+echo "Running tests in parallel ..."
+for i in {1..16}
+do
+       test_sizes $i &
+done
+
+wait
+
+echo "OK"
+
+exit 0
