Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD34774ED71
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 13:58:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0fX951ykz3c5W
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 21:58:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=207.211.30.44; helo=us-smtp-delivery-44.mimecast.com; envelope-from=legion@kernel.org; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-44.mimecast.com (unknown [207.211.30.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0dsM4dlKz30N3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 21:28:07 +1000 (AEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-NWZC1GziNDq7Lz0JPSLZRg-1; Tue, 11 Jul 2023 07:26:40 -0400
X-MC-Unique: NWZC1GziNDq7Lz0JPSLZRg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4FAB088D1B7;
	Tue, 11 Jul 2023 11:26:38 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.45.225.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C5A9463F3C;
	Tue, 11 Jul 2023 11:26:25 +0000 (UTC)
From: Alexey Gladkov <legion@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	viro@zeniv.linux.org.uk
Subject: [PATCH v3 2/5] fs: Add fchmodat4()
Date: Tue, 11 Jul 2023 13:25:43 +0200
Message-Id: <d11b93ad8e3b669afaff942e25c3fca65c6a983c.1689074739.git.legion@kernel.org>
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, fenghua.yu@intel.com, alexander.shishkin@linux.intel.com, Palmer Dabbelt <palmer@sifive.com>, heiko.carstens@de.ibm.com, x86@kernel.org, stefan@agner.ch, ldv@altlinux.org, dhowells@redhat.com, kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com, ysato@users.sourceforge.jp, deller@gmx.de, linux-sh@vger.kernel.org, linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com, geert@linux-m68k.org, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, jhogan@kernel.org, firoz.khan@linaro.org, mattst88@gmail.com, fweimer@redhat.com, gor@linux.ibm.com, peterz@infradead.org, glebfm@altlinux.org, tycho@tycho.ws, acme@kernel.org, linux-m68k@lists.linux-m68k.org, bp@alien8.de, luto@kernel.org, namhyung@kernel.org, tglx@linutronix.de, christian@brauner.io, rth@twiddle.net, axboe@kernel.dk, Jame
 s.Bottomley@HansenPartnership.com, monstr@monstr.eu, tony.luck@intel.com, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, ralf@linux-mips.org, paul.burton@mips.com, linux-alpha@vger.kernel.org, schwidefsky@de.ibm.com, ink@jurassic.park.msu.ru, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Palmer Dabbelt <palmer@sifive.com>

On the userspace side fchmodat(3) is implemented as a wrapper
function which implements the POSIX-specified interface. This
interface differs from the underlying kernel system call, which does not
have a flags argument. Most implementations require procfs [1][2].

There doesn't appear to be a good userspace workaround for this issue
but the implementation in the kernel is pretty straight-forward.

The new fchmodat4() syscall allows to pass the AT_SYMLINK_NOFOLLOW flag,
unlike existing fchmodat.

[1] https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob;f=3Dsysdeps/unix/sys=
v/linux/fchmodat.c;h=3D17eca54051ee28ba1ec3f9aed170a62630959143;hb=3Da492b1=
e5ef7ab50c6fdd4e4e9879ea5569ab0a6c#l35
[2] https://git.musl-libc.org/cgit/musl/tree/src/stat/fchmodat.c?id=3D718f3=
63bc2067b6487900eddc9180c84e7739f80#n28

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Alexey Gladkov <legion@kernel.org>
---
 fs/open.c                | 18 ++++++++++++++----
 include/linux/syscalls.h |  2 ++
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/fs/open.c b/fs/open.c
index 4478adcc4f3a..58bb88c6afb6 100644
--- a/fs/open.c
+++ b/fs/open.c
@@ -671,11 +671,11 @@ SYSCALL_DEFINE2(fchmod, unsigned int, fd, umode_t, mo=
de)
 =09return err;
 }
=20
-static int do_fchmodat(int dfd, const char __user *filename, umode_t mode)
+static int do_fchmodat4(int dfd, const char __user *filename, umode_t mode=
, int lookup_flags)
 {
 =09struct path path;
 =09int error;
-=09unsigned int lookup_flags =3D LOOKUP_FOLLOW;
+
 retry:
 =09error =3D user_path_at(dfd, filename, lookup_flags, &path);
 =09if (!error) {
@@ -689,15 +689,25 @@ static int do_fchmodat(int dfd, const char __user *fi=
lename, umode_t mode)
 =09return error;
 }
=20
+SYSCALL_DEFINE4(fchmodat4, int, dfd, const char __user *, filename,
+=09=09umode_t, mode, int, flags)
+{
+=09if (unlikely(flags & ~AT_SYMLINK_NOFOLLOW))
+=09=09return -EINVAL;
+
+=09return do_fchmodat4(dfd, filename, mode,
+=09=09=09flags & AT_SYMLINK_NOFOLLOW ? 0 : LOOKUP_FOLLOW);
+}
+
 SYSCALL_DEFINE3(fchmodat, int, dfd, const char __user *, filename,
 =09=09umode_t, mode)
 {
-=09return do_fchmodat(dfd, filename, mode);
+=09return do_fchmodat4(dfd, filename, mode, LOOKUP_FOLLOW);
 }
=20
 SYSCALL_DEFINE2(chmod, const char __user *, filename, umode_t, mode)
 {
-=09return do_fchmodat(AT_FDCWD, filename, mode);
+=09return do_fchmodat4(AT_FDCWD, filename, mode, LOOKUP_FOLLOW);
 }
=20
 /**
diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index 497bdd968c32..b17d37d2bad6 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -466,6 +466,8 @@ asmlinkage long sys_chroot(const char __user *filename)=
;
 asmlinkage long sys_fchmod(unsigned int fd, umode_t mode);
 asmlinkage long sys_fchmodat(int dfd, const char __user *filename,
 =09=09=09     umode_t mode);
+asmlinkage long sys_fchmodat4(int dfd, const char __user *filename,
+=09=09=09     umode_t mode, int flags);
 asmlinkage long sys_fchownat(int dfd, const char __user *filename, uid_t u=
ser,
 =09=09=09     gid_t group, int flag);
 asmlinkage long sys_fchown(unsigned int fd, uid_t user, gid_t group);
--=20
2.33.8

