Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D8874ED77
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 13:59:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0fYm1Xkvz3clg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 21:59:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=207.211.30.44; helo=us-smtp-delivery-44.mimecast.com; envelope-from=legion@kernel.org; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-44.mimecast.com (unknown [207.211.30.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0dsw5gSxz30PD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 21:28:36 +1000 (AEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-136-RfFFoQQePe6MWI5MJJKy7Q-1; Tue, 11 Jul 2023 07:27:17 -0400
X-MC-Unique: RfFFoQQePe6MWI5MJJKy7Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14CA7185A78F;
	Tue, 11 Jul 2023 11:27:15 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.45.225.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7857FF66B9;
	Tue, 11 Jul 2023 11:27:03 +0000 (UTC)
From: Alexey Gladkov <legion@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	viro@zeniv.linux.org.uk
Subject: [PATCH v3 5/5] selftests: add fchmodat4(2) selftest
Date: Tue, 11 Jul 2023 13:25:46 +0200
Message-Id: <c3606ec38227d921fa8a3e11613ffdb2f3ea7636.1689074739.git.legion@kernel.org>
In-Reply-To: <cover.1689074739.git.legion@kernel.org>
References: <87o8pscpny.fsf@oldenburg2.str.redhat.com> <cover.1689074739.git.legion@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252; x-default=true
X-Mailman-Approved-At: Tue, 11 Jul 2023 21:56:57 +1000
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, fenghua.yu@intel.com, alexander.shishkin@linux.intel.com, palmer@sifive.com, heiko.carstens@de.ibm.com, x86@kernel.org, stefan@agner.ch, ldv@altlinux.org, dhowells@redhat.com, kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com, ysato@users.sourceforge.jp, deller@gmx.de, linux-sh@vger.kernel.org, linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com, geert@linux-m68k.org, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, jhogan@kernel.org, firoz.khan@linaro.org, mattst88@gmail.com, fweimer@redhat.com, gor@linux.ibm.com, peterz@infradead.org, glebfm@altlinux.org, tycho@tycho.ws, acme@kernel.org, linux-m68k@lists.linux-m68k.org, bp@alien8.de, luto@kernel.org, namhyung@kernel.org, tglx@linutronix.de, christian@brauner.io, rth@twiddle.net, axboe@kernel.dk, James.Bottomley@Hanse
 nPartnership.com, monstr@monstr.eu, tony.luck@intel.com, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, ralf@linux-mips.org, paul.burton@mips.com, linux-alpha@vger.kernel.org, schwidefsky@de.ibm.com, ink@jurassic.park.msu.ru, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The test marks as skipped if a syscall with the AT_SYMLINK_NOFOLLOW flag
fails. This is because not all filesystems support changing the mode
bits of symlinks properly. These filesystems return an error but change
the mode bits:

newfstatat(4, "regfile", {st_mode=3DS_IFREG|0640, st_size=3D0, ...}, AT_SYM=
LINK_NOFOLLOW) =3D 0
newfstatat(4, "symlink", {st_mode=3DS_IFLNK|0777, st_size=3D7, ...}, AT_SYM=
LINK_NOFOLLOW) =3D 0
syscall_0x1c3(0x4, 0x55fa1f244396, 0x180, 0x100, 0x55fa1f24438e, 0x34) =3D =
-1 EOPNOTSUPP (Operation not supported)
newfstatat(4, "regfile", {st_mode=3DS_IFREG|0640, st_size=3D0, ...}, AT_SYM=
LINK_NOFOLLOW) =3D 0

This happens with btrfs and xfs:

 $ /kernel/tools/testing/selftests/fchmodat4/fchmodat4_test
 TAP version 13
 1..1
 ok 1 # SKIP fchmodat4(symlink)
 # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:1 error:0

 $ stat /tmp/ksft-fchmodat4.*/symlink
   File: /tmp/ksft-fchmodat4.3NCqlE/symlink -> regfile
   Size: 7               Blocks: 0          IO Block: 4096   symbolic link
 Device: 7,0     Inode: 133         Links: 1
 Access: (0600/lrw-------)  Uid: (    0/    root)   Gid: (    0/    root)

Signed-off-by: Alexey Gladkov <legion@kernel.org>
---
 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/fchmodat4/.gitignore  |   2 +
 tools/testing/selftests/fchmodat4/Makefile    |   6 +
 .../selftests/fchmodat4/fchmodat4_test.c      | 151 ++++++++++++++++++
 4 files changed, 160 insertions(+)
 create mode 100644 tools/testing/selftests/fchmodat4/.gitignore
 create mode 100644 tools/testing/selftests/fchmodat4/Makefile
 create mode 100644 tools/testing/selftests/fchmodat4/fchmodat4_test.c

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Mak=
efile
index 90a62cf75008..fe61fa55412d 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -17,6 +17,7 @@ TARGETS +=3D drivers/net/bonding
 TARGETS +=3D drivers/net/team
 TARGETS +=3D efivarfs
 TARGETS +=3D exec
+TARGETS +=3D fchmodat4
 TARGETS +=3D filesystems
 TARGETS +=3D filesystems/binderfs
 TARGETS +=3D filesystems/epoll
diff --git a/tools/testing/selftests/fchmodat4/.gitignore b/tools/testing/s=
elftests/fchmodat4/.gitignore
new file mode 100644
index 000000000000..82a4846cbc4b
--- /dev/null
+++ b/tools/testing/selftests/fchmodat4/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+/*_test
diff --git a/tools/testing/selftests/fchmodat4/Makefile b/tools/testing/sel=
ftests/fchmodat4/Makefile
new file mode 100644
index 000000000000..3d38a69c3c12
--- /dev/null
+++ b/tools/testing/selftests/fchmodat4/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+CFLAGS +=3D -Wall -O2 -g -fsanitize=3Daddress -fsanitize=3Dundefined
+TEST_GEN_PROGS :=3D fchmodat4_test
+
+include ../lib.mk
diff --git a/tools/testing/selftests/fchmodat4/fchmodat4_test.c b/tools/tes=
ting/selftests/fchmodat4/fchmodat4_test.c
new file mode 100644
index 000000000000..50beb731d8ba
--- /dev/null
+++ b/tools/testing/selftests/fchmodat4/fchmodat4_test.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#define _GNU_SOURCE
+#include <fcntl.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <syscall.h>
+#include <unistd.h>
+
+#include "../kselftest.h"
+
+#ifndef __NR_fchmodat4
+=09#if defined __alpha__
+=09=09#define __NR_fchmodat4 561
+=09#elif defined _MIPS_SIM
+=09=09#if _MIPS_SIM =3D=3D _MIPS_SIM_ABI32=09/* o32 */
+=09=09=09#define __NR_fchmodat4 (451 + 4000)
+=09=09#endif
+=09=09#if _MIPS_SIM =3D=3D _MIPS_SIM_NABI32=09/* n32 */
+=09=09=09#define __NR_fchmodat4 (451 + 6000)
+=09=09#endif
+=09=09#if _MIPS_SIM =3D=3D _MIPS_SIM_ABI64=09/* n64 */
+=09=09=09#define __NR_fchmodat4 (451 + 5000)
+=09=09#endif
+=09#elif defined __ia64__
+=09=09#define __NR_fchmodat4 (451 + 1024)
+=09#else
+=09=09#define __NR_fchmodat4 451
+=09#endif
+#endif
+
+int sys_fchmodat4(int dfd, const char *filename, mode_t mode, int flags)
+{
+=09int ret =3D syscall(__NR_fchmodat4, dfd, filename, mode, flags);
+=09return ret >=3D 0 ? ret : -errno;
+}
+
+int setup_testdir(void)
+{
+=09int dfd, ret;
+=09char dirname[] =3D "/tmp/ksft-fchmodat4.XXXXXX";
+
+=09/* Make the top-level directory. */
+=09if (!mkdtemp(dirname))
+=09=09ksft_exit_fail_msg("setup_testdir: failed to create tmpdir\n");
+
+=09dfd =3D open(dirname, O_PATH | O_DIRECTORY);
+=09if (dfd < 0)
+=09=09ksft_exit_fail_msg("setup_testdir: failed to open tmpdir\n");
+
+=09ret =3D openat(dfd, "regfile", O_CREAT | O_WRONLY | O_TRUNC, 0644);
+=09if (ret < 0)
+=09=09ksft_exit_fail_msg("setup_testdir: failed to create file in tmpdir\n=
");
+=09close(ret);
+
+=09ret =3D symlinkat("regfile", dfd, "symlink");
+=09if (ret < 0)
+=09=09ksft_exit_fail_msg("setup_testdir: failed to create symlink in tmpdi=
r\n");
+
+=09return dfd;
+}
+
+int expect_mode(int dfd, const char *filename, mode_t expect_mode)
+{
+=09struct stat st;
+=09int ret =3D fstatat(dfd, filename, &st, AT_SYMLINK_NOFOLLOW);
+
+=09if (ret)
+=09=09ksft_exit_fail_msg("expect_mode: %s: fstatat failed\n", filename);
+
+=09return (st.st_mode =3D=3D expect_mode);
+}
+
+void test_regfile(void)
+{
+=09int dfd, ret;
+
+=09dfd =3D setup_testdir();
+
+=09ret =3D sys_fchmodat4(dfd, "regfile", 0640, 0);
+
+=09if (ret < 0)
+=09=09ksft_exit_fail_msg("test_regfile: fchmodat4(noflag) failed\n");
+
+=09if (!expect_mode(dfd, "regfile", 0100640))
+=09=09ksft_exit_fail_msg("test_regfile: wrong file mode bits after fchmoda=
t4\n");
+
+=09ret =3D sys_fchmodat4(dfd, "regfile", 0600, AT_SYMLINK_NOFOLLOW);
+
+=09if (ret < 0)
+=09=09ksft_exit_fail_msg("test_regfile: fchmodat4(AT_SYMLINK_NOFOLLOW) fai=
led\n");
+
+=09if (!expect_mode(dfd, "regfile", 0100600))
+=09=09ksft_exit_fail_msg("test_regfile: wrong file mode bits after fchmoda=
t4 with nofollow\n");
+
+=09ksft_test_result_pass("fchmodat4(regfile)\n");
+}
+
+void test_symlink(void)
+{
+=09int dfd, ret;
+
+=09dfd =3D setup_testdir();
+
+=09ret =3D sys_fchmodat4(dfd, "symlink", 0640, 0);
+
+=09if (ret < 0)
+=09=09ksft_exit_fail_msg("test_symlink: fchmodat4(noflag) failed\n");
+
+=09if (!expect_mode(dfd, "regfile", 0100640))
+=09=09ksft_exit_fail_msg("test_symlink: wrong file mode bits after fchmoda=
t4\n");
+
+=09if (!expect_mode(dfd, "symlink", 0120777))
+=09=09ksft_exit_fail_msg("test_symlink: wrong symlink mode bits after fchm=
odat4\n");
+
+=09ret =3D sys_fchmodat4(dfd, "symlink", 0600, AT_SYMLINK_NOFOLLOW);
+
+=09/*
+=09 * On certain filesystems (xfs or btrfs), chmod operation fails. So we
+=09 * first check the symlink target but if the operation fails we mark th=
e
+=09 * test as skipped.
+=09 *
+=09 * https://sourceware.org/legacy-ml/libc-alpha/2020-02/msg00467.html
+=09 */
+=09if (ret =3D=3D 0 && !expect_mode(dfd, "symlink", 0120600))
+=09=09ksft_exit_fail_msg("test_symlink: wrong symlink mode bits after fchm=
odat4 with nofollow\n");
+
+=09if (!expect_mode(dfd, "regfile", 0100640))
+=09=09ksft_exit_fail_msg("test_symlink: wrong file mode bits after fchmoda=
t4 with nofollow\n");
+
+=09if (ret !=3D 0)
+=09=09ksft_test_result_skip("fchmodat4(symlink)\n");
+=09else
+=09=09ksft_test_result_pass("fchmodat4(symlink)\n");
+}
+
+#define NUM_TESTS 2
+
+int main(int argc, char **argv)
+{
+=09ksft_print_header();
+=09ksft_set_plan(NUM_TESTS);
+
+=09test_regfile();
+=09test_symlink();
+
+=09if (ksft_get_fail_cnt() + ksft_get_error_cnt() > 0)
+=09=09ksft_exit_fail();
+=09else
+=09=09ksft_exit_pass();
+}
--=20
2.33.8

