Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC62B5FB147
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 13:14:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmtTK43ksz3dqx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 22:14:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I4hxr9Ew;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I4hxr9Ew;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmtPN6nsVz3bjJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Oct 2022 22:10:47 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id o9-20020a17090a0a0900b0020ad4e758b3so12840638pjo.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Oct 2022 04:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHyIMN1iJKuKxaWapejX7KW3IEYVAnQdHWVL/KYyVB0=;
        b=I4hxr9Ew74Hq1k7KtBzsSO1lgxBlfnI/tG9BSj5lnNkmcVWVFiSWNjei5diNfVDXH9
         /UqSFJOOoPHeaXPbSUosukjfCxJUadgryGcqAkJzubCSnoVqhIxeBHgVlsWmzv9HJCly
         vKuRpqtcqjs+WMGtPHfoanXA+sv95ikdC39Dx3cN4XhlOCymIL7bYvlIu6KxYNRbq+qF
         mZvEpnpakgOA+sJQNgAt2SZKA/h89UJFyfnzDieryPXNCUK0toTQ5gULLJ2X/rpzgFMt
         pgxE7QOqB2xTWz4RL81Sh3tQ2jTHWngulAcp0CS4pCHb5bkuU7bIka9t+j8fjWsQ59ap
         YP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CHyIMN1iJKuKxaWapejX7KW3IEYVAnQdHWVL/KYyVB0=;
        b=aO99tf8hNQys4hINJNZeoHbF8sR++JmnXdpYQpcqmOS5q1VMtj9wv0wYEQiCBb9iOG
         TRpb/a5Vk7MKz+FJrFYUwg36SYjf2x4nZGez3Syo4sM7+4nshWdYJfiOLAJYf8JwbaNc
         SDRUfkViIlo/k4ude8TjgrgQx2nXjfSlj9HCCWMnnaIlO32HKH92GBAgT/owXEz7ey8r
         gSSjRdqsaPVZjCfyRIIeNuZRHfF/P8axXfrr2kQ4CuH9mX17xSFTnAlA6n3jbNgBY8MX
         HrEs5e5JkI6nKoJs4XUG+wcPD3u8MoCH8g7KLMll0RbvEaamYIvU/imjkt2ZYTaz1HGw
         lOag==
X-Gm-Message-State: ACrzQf3rYNmkNKX2xoj8Rwy6oLLFAz1fhKCXRg9riayl0hAh2yY+6mvA
	ajQrbQ3iZep60+fMJ0kj50s=
X-Google-Smtp-Source: AMsMyM4Nf9dpj20Vym4lC5R2Tqid75cd2DteX96btWj/eZk7pyA/aOn4fd3O+YfP/ow8HWgVwiNPog==
X-Received: by 2002:a17:902:d589:b0:181:d0e4:3306 with SMTP id k9-20020a170902d58900b00181d0e43306mr12886545plh.28.1665486644671;
        Tue, 11 Oct 2022 04:10:44 -0700 (PDT)
Received: from localhost ([118.208.156.99])
        by smtp.gmail.com with ESMTPSA id u10-20020a170902e80a00b0017bb38e4588sm7700173plg.135.2022.10.11.04.10.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 04:10:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Oct 2022 21:10:29 +1000
Message-Id: <CNJ1QJAMW2EZ.1K9H3JQS9IKHU@bobo>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Michael Ellerman" <mpe@ellerman.id.au>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-1 tag
X-Mailer: aerc 0.11.0
References: <87edvhntv0.fsf@mpe.ellerman.id.au> <Y0RxpSFyn9m68zIb@zx2c4.com>
 <Y0R6fcvgGA858TQA@zx2c4.com> <874jwbnn1u.fsf@mpe.ellerman.id.au>
 <Y0Tbsh7Zeodxueux@zx2c4.com> <87y1tmn1mw.fsf@mpe.ellerman.id.au>
In-Reply-To: <87y1tmn1mw.fsf@mpe.ellerman.id.au>
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
Cc: david@redhat.com, linux-kernel@vger.kernel.org, wsa+renesas@sang-engineering.com, nicholas@linux.ibm.com, windhl@126.com, cuigaosheng1@huawei.com, mikey@neuling.org, paul@paul-moore.com, aneesh.kumar@linux.ibm.com, haren@linux.ibm.com, joel@jms.id.au, lukas.bulwahn@gmail.com, linux@roeck-us.net, nathanl@linux.ibm.com, ajd@linux.ibm.com, ye.xingchen@zte.com.cn, nathan@kernel.org, rmclure@linux.ibm.com, hbathini@linux.ibm.com, atrajeev@linux.vnet.ibm.com, yuanjilin@cdjrlc.com, pali@kernel.org, farosas@linux.ibm.com, geoff@infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, gustavoars@kernel.org, lihuafei1@huawei.com, zhengyongjun3@huawei.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Oct 11, 2022 at 7:35 PM AEST, Michael Ellerman wrote:
> "Jason A. Donenfeld" <Jason@zx2c4.com> writes:
> > On Tue, Oct 11, 2022 at 12:53:17PM +1100, Michael Ellerman wrote:
> >> "Jason A. Donenfeld" <Jason@zx2c4.com> writes:
> >> > On Mon, Oct 10, 2022 at 01:25:25PM -0600, Jason A. Donenfeld wrote:
> >> >> Hi Michael,
> >> >>=20
> >> >> On Sun, Oct 09, 2022 at 10:01:39PM +1100, Michael Ellerman wrote:
> >> >> > powerpc updates for 6.1
> >> >> >=20
> >> >> >  - Remove our now never-true definitions for pgd_huge() and p4d_l=
eaf().
> >> >> >=20
> >> >> >  - Add pte_needs_flush() and huge_pmd_needs_flush() for 64-bit.
> >> >> >=20
> >> >> >  - Add support for syscall wrappers.
> >> >> >=20
> >> >> >  - Add support for KFENCE on 64-bit.
> >> >> >=20
> >> >> >  - Update 64-bit HV KVM to use the new guest state entry/exit acc=
ounting API.
> >> >> >=20
> >> >> >  - Support execute-only memory when using the Radix MMU (P9 or la=
ter).
> >> >> >=20
> >> >> >  - Implement CONFIG_PARAVIRT_TIME_ACCOUNTING for pseries guests.
> >> >> >=20
> >> >> >  - Updates to our linker script to move more data into read-only =
sections.
> >> >> >=20
> >> >> >  - Allow the VDSO to be randomised on 32-bit.
> >> >> >=20
> >> >> >  - Many other small features and fixes.
> >> >>=20
> >> >> FYI, something in here broke the wireguard test suite, which runs t=
he
> >> >> iperf3 networking utility. The full log is here [1], but the releva=
nt part
> >> >> is:=20
> >> >>=20
> >> >> [+] NS1: iperf3 -Z -t 3 -c 192.168.241.2
> >> >> Connecting to host 192.168.241.2, port 5201
> >> >> iperf3: error - failed to read /dev/urandom: Bad address
> >> >>=20
> >> >> I'll see if I can narrow it down a bit more and bisect. But just FY=
I, in
> >> >> case you have an intuition.
> >> >
> >> > Huh. From iov_iter.c:
> >> >
> >> > static int copyout(void __user *to, const void *from, size_t n)
> >> > {
> >> >         size_t before =3D n;
> >> >         if (should_fail_usercopy())
> >> >                 return n;
> >> >         if (access_ok(to, n)) {
> >> >                 instrument_copy_to_user(to, from, n);
> >> >                 n =3D raw_copy_to_user(to, from, n);
> >> >                 if (n =3D=3D before)
> >> >                         pr_err("SARU n still %zu pointer is %lx\n", =
n, (unsigned long)to);
> >> >         }
> >> >         return n;
> >> > }
> >> >
> >> > I added the pr_err() there to catch the failure:
> >> > [    3.443506] SARU n still 64 pointer is b78db000
> >> >
> >> > Also I managed to extract the failing portion of iperf3 into somethi=
ng
> >> > smaller:
> >> >
> >> >         int temp;
> >> >         char *x;
> >> >         ssize_t l;
> >> >         FILE *f;
> >> >         char template[] =3D "/blah-XXXXXX";
> >> >
> >> >         temp =3D mkstemp(template);
> >> >         if (temp < 0)
> >> >                 panic("mkstemp");
> >> >         if (unlink(template) < 0)
> >> >                 panic("unlink");
> >> >         if (ftruncate(temp, 0x20000) < 0)
> >> >                 panic("ftruncate");
> >> >         x =3D mmap(NULL, 0x20000, PROT_READ|PROT_WRITE, MAP_PRIVATE,=
 temp, 0);
> >> >         if (x =3D=3D MAP_FAILED)
> >> >                 panic("mmap");
> >> >         f =3D fopen("/dev/urandom", "rb");
> >> >         if (!f)
> >> >                 panic("fopen");
> >> >         setbuf(f, NULL);
> >> >         if (fread(x, 1, 0x20000, f) !=3D 0x20000)
> >> >                 panic("fread");
> >>=20
> >> Does that fail for you reliably?
> >>=20
> >> It succeeds for me running under qemu ppce500, though I'm not using yo=
ur
> >> kernel config yet.
> >
> > Yes, every time without fail, across two systems and two qemu builds.
>
> OK. Joel worked out that it only fails when built with musl, so that's
> why it's succeeding for me (built with glibc).

This was independently discovered by several, but we worked out it's
because musl uses ftruncate64 here, while glibc doesn't seem to. And
ftruncate64 got broken by the syscall wrappers patch on ppc32. The
kernel is seeing a 0 length ftruncate call, so the user access sigbuses
and can't copy anything.

This quick hack gets the test program working again. Only very lightly
tested so far...

Thanks,
Nick

---
diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/include/asm=
/syscalls.h
index 9840d572da55..9578cc5e4f84 100644
--- a/arch/powerpc/include/asm/syscalls.h
+++ b/arch/powerpc/include/asm/syscalls.h
@@ -89,6 +89,27 @@ long compat_sys_rt_sigreturn(void);
  * responsible for combining parameter pairs.
  */
=20
+#ifdef CONFIG_PPC32
+long sys_ppc_pread64(unsigned int fd,
+		     char __user *ubuf, compat_size_t count,
+		     u32 reg6, u32 pos1, u32 pos2);
+long sys_ppc_pwrite64(unsigned int fd,
+		      const char __user *ubuf, compat_size_t count,
+		      u32 reg6, u32 pos1, u32 pos2);
+long sys_ppc_readahead(int fd, u32 r4,
+		       u32 offset1, u32 offset2, u32 count);
+long sys_ppc_truncate64(const char __user *path, u32 reg4,
+		        unsigned long len1, unsigned long len2);
+long sys_ppc_ftruncate64(unsigned int fd, u32 reg4,
+			 unsigned long len1, unsigned long len2);
+long sys_ppc32_fadvise64(int fd, u32 unused, u32 offset1, u32 offset2,
+			 size_t len, int advice);
+long sys_ppc_sync_file_range2(int fd, unsigned int flags,
+			      unsigned int offset1,
+			      unsigned int offset2,
+			      unsigned int nbytes1,
+			      unsigned int nbytes2);
+#endif
 #ifdef CONFIG_COMPAT
 long compat_sys_mmap2(unsigned long addr, size_t len,
 		      unsigned long prot, unsigned long flags,
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 1f121c188805..d382564034a7 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -73,6 +73,7 @@ obj-y				:=3D cputable.o syscalls.o \
 obj-y				+=3D ptrace/
 obj-$(CONFIG_PPC64)		+=3D setup_64.o irq_64.o\
 				   paca.o nvram_64.o note.o
+obj-$(CONFIG_PPC32)		+=3D sys_ppc32.o
 obj-$(CONFIG_COMPAT)		+=3D sys_ppc32.o signal_32.o
 obj-$(CONFIG_VDSO32)		+=3D vdso32_wrapper.o
 obj-$(CONFIG_PPC_WATCHDOG)	+=3D watchdog.o
diff --git a/arch/powerpc/kernel/sys_ppc32.c b/arch/powerpc/kernel/sys_ppc3=
2.c
index dcc3c9fd4cfd..f9ce13e6c5eb 100644
--- a/arch/powerpc/kernel/sys_ppc32.c
+++ b/arch/powerpc/kernel/sys_ppc32.c
@@ -47,7 +47,17 @@
 #include <asm/syscalls.h>
 #include <asm/switch_to.h>
=20
-COMPAT_SYSCALL_DEFINE6(ppc_pread64,
+#ifdef CONFIG_PPC32
+#define PPC32_SYSCALL_DEFINE4	SYSCALL_DEFINE4
+#define PPC32_SYSCALL_DEFINE5	SYSCALL_DEFINE5
+#define PPC32_SYSCALL_DEFINE6	SYSCALL_DEFINE6
+#else
+#define PPC32_SYSCALL_DEFINE4	COMPAT_SYSCALL_DEFINE4
+#define PPC32_SYSCALL_DEFINE5	COMPAT_SYSCALL_DEFINE5
+#define PPC32_SYSCALL_DEFINE6	COMPAT_SYSCALL_DEFINE6
+#endif
+
+PPC32_SYSCALL_DEFINE6(ppc_pread64,
 		       unsigned int, fd,
 		       char __user *, ubuf, compat_size_t, count,
 		       u32, reg6, u32, pos1, u32, pos2)
@@ -55,7 +65,7 @@ COMPAT_SYSCALL_DEFINE6(ppc_pread64,
 	return ksys_pread64(fd, ubuf, count, merge_64(pos1, pos2));
 }
=20
-COMPAT_SYSCALL_DEFINE6(ppc_pwrite64,
+PPC32_SYSCALL_DEFINE6(ppc_pwrite64,
 		       unsigned int, fd,
 		       const char __user *, ubuf, compat_size_t, count,
 		       u32, reg6, u32, pos1, u32, pos2)
@@ -63,28 +73,29 @@ COMPAT_SYSCALL_DEFINE6(ppc_pwrite64,
 	return ksys_pwrite64(fd, ubuf, count, merge_64(pos1, pos2));
 }
=20
-COMPAT_SYSCALL_DEFINE5(ppc_readahead,
+PPC32_SYSCALL_DEFINE5(ppc_readahead,
 		       int, fd, u32, r4,
 		       u32, offset1, u32, offset2, u32, count)
 {
 	return ksys_readahead(fd, merge_64(offset1, offset2), count);
 }
=20
-COMPAT_SYSCALL_DEFINE4(ppc_truncate64,
+PPC32_SYSCALL_DEFINE4(ppc_truncate64,
 		       const char __user *, path, u32, reg4,
 		       unsigned long, len1, unsigned long, len2)
 {
 	return ksys_truncate(path, merge_64(len1, len2));
 }
=20
-COMPAT_SYSCALL_DEFINE4(ppc_ftruncate64,
+PPC32_SYSCALL_DEFINE4(ppc_ftruncate64,
 		       unsigned int, fd, u32, reg4,
 		       unsigned long, len1, unsigned long, len2)
 {
+	printk("ppc_ftruncate64 len1=3D%lx len2=3D%lx\n", len1, len2);
 	return ksys_ftruncate(fd, merge_64(len1, len2));
 }
=20
-COMPAT_SYSCALL_DEFINE6(ppc32_fadvise64,
+PPC32_SYSCALL_DEFINE6(ppc32_fadvise64,
 		       int, fd, u32, unused, u32, offset1, u32, offset2,
 		       size_t, len, int, advice)
 {
@@ -92,7 +103,7 @@ COMPAT_SYSCALL_DEFINE6(ppc32_fadvise64,
 				 advice);
 }
=20
-COMPAT_SYSCALL_DEFINE6(ppc_sync_file_range2,
+PPC32_SYSCALL_DEFINE6(ppc_sync_file_range2,
 		       int, fd, unsigned int, flags,
 		       unsigned int, offset1, unsigned int, offset2,
 		       unsigned int, nbytes1, unsigned int, nbytes2)
diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kernel=
/syscalls/syscall.tbl
index 2bca64f96164..71d6e38e5a3a 100644
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@ -228,8 +228,8 @@
 176	64	rt_sigtimedwait			sys_rt_sigtimedwait
 177	nospu 	rt_sigqueueinfo			sys_rt_sigqueueinfo		compat_sys_rt_sigqueuein=
fo
 178	nospu 	rt_sigsuspend			sys_rt_sigsuspend		compat_sys_rt_sigsuspend
-179	common	pread64				sys_pread64			compat_sys_ppc_pread64
-180	common	pwrite64			sys_pwrite64			compat_sys_ppc_pwrite64
+179	common	pread64				sys_ppc_pread64			compat_sys_ppc_pread64
+180	common	pwrite64			sys_ppc_pwrite64		compat_sys_ppc_pwrite64
 181	common	chown				sys_chown
 182	common	getcwd				sys_getcwd
 183	common	capget				sys_capget
@@ -242,10 +242,10 @@
 188	common 	putpmsg				sys_ni_syscall
 189	nospu	vfork				sys_vfork
 190	common	ugetrlimit			sys_getrlimit			compat_sys_getrlimit
-191	common	readahead			sys_readahead			compat_sys_ppc_readahead
+191	common	readahead			sys_ppc_readahead		compat_sys_ppc_readahead
 192	32	mmap2				sys_mmap2			compat_sys_mmap2
-193	32	truncate64			sys_truncate64			compat_sys_ppc_truncate64
-194	32	ftruncate64			sys_ftruncate64			compat_sys_ppc_ftruncate64
+193	32	truncate64			sys_ppc_truncate64		compat_sys_ppc_truncate64
+194	32	ftruncate64			sys_ppc_ftruncate64		compat_sys_ppc_ftruncate64
 195	32	stat64				sys_stat64
 196	32	lstat64				sys_lstat64
 197	32	fstat64				sys_fstat64
@@ -288,7 +288,7 @@
 230	common	io_submit			sys_io_submit			compat_sys_io_submit
 231	common	io_cancel			sys_io_cancel
 232	nospu	set_tid_address			sys_set_tid_address
-233	common	fadvise64			sys_fadvise64			compat_sys_ppc32_fadvise64
+233	common	fadvise64			sys_ppc32_fadvise64		compat_sys_ppc32_fadvise64
 234	nospu	exit_group			sys_exit_group
 235	nospu	lookup_dcookie			sys_lookup_dcookie		compat_sys_lookup_dcookie
 236	common	epoll_create			sys_epoll_create
@@ -390,7 +390,7 @@
 305	common	signalfd			sys_signalfd			compat_sys_signalfd
 306	common	timerfd_create			sys_timerfd_create
 307	common	eventfd				sys_eventfd
-308	common	sync_file_range2		sys_sync_file_range2		compat_sys_ppc_sync_fil=
e_range2
+308	common	sync_file_range2		sys_ppc_sync_file_range2	compat_sys_ppc_sync_=
file_range2
 309	nospu	fallocate			sys_fallocate			compat_sys_fallocate
 310	nospu	subpage_prot			sys_subpage_prot
 311	32	timerfd_settime			sys_timerfd_settime32
