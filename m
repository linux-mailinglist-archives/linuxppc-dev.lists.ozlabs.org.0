Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCBE5FA7A6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 00:27:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmYSV53j7z3dtQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 09:27:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=mPRyN+Tj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=srs0=yjjh=2l=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=mPRyN+Tj;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmYRX5HbBz2xvJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Oct 2022 09:26:32 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D2FB3B810FE;
	Mon, 10 Oct 2022 22:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96FF5C433D6;
	Mon, 10 Oct 2022 22:26:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="mPRyN+Tj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1665440780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VUzvUqSNatlxX9gNd/YDNJ1TNF7Czge+HXCXVSv6YMc=;
	b=mPRyN+TjE4Xfv27gOFAYKxgtAA61Xfc4uYJrGqzLxXMp4g3L5CEdQomfowvEy2rDPDksps
	5y+SG7QNMNpGbQLkt/P1Ls3QS748lF5ru/de5m6lDZi1VAd7gxPC7cGHzto0+oTdm6otkq
	SrMAwLxccTnLuBJsjk+iGfJk+vnZ1ec=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3e47577a (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 10 Oct 2022 22:26:19 +0000 (UTC)
Date: Mon, 10 Oct 2022 16:26:10 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Michael Ellerman <mpe@ellerman.id.au>, rmclure@linux.ibm.com
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-1 tag
Message-ID: <Y0ScAhqysKK6Hrks@zx2c4.com>
References: <87edvhntv0.fsf@mpe.ellerman.id.au>
 <Y0RxpSFyn9m68zIb@zx2c4.com>
 <Y0R6fcvgGA858TQA@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y0R6fcvgGA858TQA@zx2c4.com>
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
Cc: david@redhat.com, linux-kernel@vger.kernel.org, wsa+renesas@sang-engineering.com, nicholas@linux.ibm.com, windhl@126.com, cuigaosheng1@huawei.com, mikey@neuling.org, paul@paul-moore.com, aneesh.kumar@linux.ibm.com, haren@linux.ibm.com, joel@jms.id.au, lukas.bulwahn@gmail.com, linux@roeck-us.net, nathanl@linux.ibm.com, ajd@linux.ibm.com, ye.xingchen@zte.com.cn, npiggin@gmail.com, nathan@kernel.org, rmclure@linux.ibm.com, hbathini@linux.ibm.com, atrajeev@linux.vnet.ibm.com, yuanjilin@cdjrlc.com, pali@kernel.org, farosas@linux.ibm.com, geoff@infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, gustavoars@kernel.org, lihuafei1@huawei.com, zhengyongjun3@huawei.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 10, 2022 at 02:03:09PM -0600, Jason A. Donenfeld wrote:
> On Mon, Oct 10, 2022 at 01:25:25PM -0600, Jason A. Donenfeld wrote:
> > Hi Michael,
> > 
> > On Sun, Oct 09, 2022 at 10:01:39PM +1100, Michael Ellerman wrote:
> > > powerpc updates for 6.1
> > > 
> > >  - Remove our now never-true definitions for pgd_huge() and p4d_leaf().
> > > 
> > >  - Add pte_needs_flush() and huge_pmd_needs_flush() for 64-bit.
> > > 
> > >  - Add support for syscall wrappers.
> > > 
> > >  - Add support for KFENCE on 64-bit.
> > > 
> > >  - Update 64-bit HV KVM to use the new guest state entry/exit accounting API.
> > > 
> > >  - Support execute-only memory when using the Radix MMU (P9 or later).
> > > 
> > >  - Implement CONFIG_PARAVIRT_TIME_ACCOUNTING for pseries guests.
> > > 
> > >  - Updates to our linker script to move more data into read-only sections.
> > > 
> > >  - Allow the VDSO to be randomised on 32-bit.
> > > 
> > >  - Many other small features and fixes.
> > 
> > FYI, something in here broke the wireguard test suite, which runs the
> > iperf3 networking utility. The full log is here [1], but the relevant part
> > is: 
> > 
> > [+] NS1: iperf3 -Z -t 3 -c 192.168.241.2
> > Connecting to host 192.168.241.2, port 5201
> > iperf3: error - failed to read /dev/urandom: Bad address
> > 
> > I'll see if I can narrow it down a bit more and bisect. But just FYI, in
> > case you have an intuition.
> 
> Huh. From iov_iter.c:
> 
> static int copyout(void __user *to, const void *from, size_t n)
> {
>         size_t before = n;
>         if (should_fail_usercopy())
>                 return n;
>         if (access_ok(to, n)) {
>                 instrument_copy_to_user(to, from, n);
>                 n = raw_copy_to_user(to, from, n);
>                 if (n == before)
>                         pr_err("SARU n still %zu pointer is %lx\n", n, (unsigned long)to);
>         }
>         return n;
> }
> 
> I added the pr_err() there to catch the failure:
> [    3.443506] SARU n still 64 pointer is b78db000
> 
> Also I managed to extract the failing portion of iperf3 into something
> smaller:
> 
>         int temp;
>         char *x;
>         ssize_t l;
>         FILE *f;
>         char template[] = "/blah-XXXXXX";
> 
>         temp = mkstemp(template);
>         if (temp < 0)
>                 panic("mkstemp");
>         if (unlink(template) < 0)
>                 panic("unlink");
>         if (ftruncate(temp, 0x20000) < 0)
>                 panic("ftruncate");
>         x = mmap(NULL, 0x20000, PROT_READ|PROT_WRITE, MAP_PRIVATE, temp, 0);
>         if (x == MAP_FAILED)
>                 panic("mmap");
>         f = fopen("/dev/urandom", "rb");
>         if (!f)
>                 panic("fopen");
>         setbuf(f, NULL);
>         if (fread(x, 1, 0x20000, f) != 0x20000)
>                 panic("fread");
> 
> Jason

Bisected:

7e92e01b724526b98cbc7f03dd4afa0295780d56 is the first bad commit
commit 7e92e01b724526b98cbc7f03dd4afa0295780d56
Author: Rohan McLure <rmclure@linux.ibm.com>
Date:   Wed Sep 21 16:56:01 2022 +1000

    powerpc: Provide syscall wrapper

    Implement syscall wrapper as per s390, x86, arm64. When enabled
    cause handlers to accept parameters from a stack frame rather than
    from user scratch register state. This allows for user registers to be
    safely cleared in order to reduce caller influence on speculation
    within syscall routine. The wrapper is a macro that emits syscall
    handler symbols that call into the target handler, obtaining its
    parameters from a struct pt_regs on the stack.

    As registers are already saved to the stack prior to calling
    system_call_exception, it appears that this function is executed more
    efficiently with the new stack-pointer convention than with parameters
    passed by registers, avoiding the allocation of a stack frame for this
    method. On a 32-bit system, we see >20% performance increases on the
    null_syscall microbenchmark, and on a Power 8 the performance gains
    amortise the cost of clearing and restoring registers which is
    implemented at the end of this series, seeing final result of ~5.6%
    performance improvement on null_syscall.

    Syscalls are wrapped in this fashion on all platforms except for the
    Cell processor as this commit does not provide SPU support. This can be
    quickly fixed in a successive patch, but requires spu_sys_callback to
    allocate a pt_regs structure to satisfy the wrapped calling convention.

    Co-developed-by: Andrew Donnellan <ajd@linux.ibm.com>
    Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
    Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
    Reviewed-by: Nicholas Piggin <npiggin@gmai.com>
    [mpe: Make incompatible with COMPAT to retain clearing of high bits of args]
    Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
    Link: https://lore.kernel.org/r/20220921065605.1051927-22-rmclure@linux.ibm.com

 arch/powerpc/Kconfig                       |  1 +
 arch/powerpc/include/asm/syscall.h         |  4 +++
 arch/powerpc/include/asm/syscall_wrapper.h | 51 ++++++++++++++++++++++++++++++
 arch/powerpc/include/asm/syscalls.h        | 24 ++++++++++++--
 arch/powerpc/kernel/syscall.c              | 34 ++++++++++----------
 arch/powerpc/kernel/systbl.c               |  7 ++++
 arch/powerpc/kernel/vdso.c                 |  2 ++
 7 files changed, 105 insertions(+), 18 deletions(-)
 create mode 100644 arch/powerpc/include/asm/syscall_wrapper.h
