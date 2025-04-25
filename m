Return-Path: <linuxppc-dev+bounces-7977-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC8AA9C287
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Apr 2025 10:58:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZkRZy0X50z2yYd;
	Fri, 25 Apr 2025 18:58:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745571514;
	cv=none; b=JWqX8Uj5yKmyLOCHxY0MWwA5tRMegeHdbu8mJsunzBhegy6+WwJzXJKIm5p5wiehClJ/OuiIwMj7J8RoZM2EUH32DnkBeSuhHANmrm9mgd7qO7uhq99Sw2e/Mzf1u6EaE27T5aoE5SqHEse+wE7QzQOVlW/oD1mz+Yy3cAxKqlA0ZTRQ/8ojEEaRm69aRYJuRTGpIfw+VP8AtnM/pP8tKHXyCdOWIJnPyuL6CpOfolLC0JO9iAI6LmM4e0QvCjA8W/rcIqagmdZOUXBI6GGvPAsj8jSlanmSp9Wgs64bIn9GPhCmPIZmB7zU+lzsTQgJ4yONY3qeNNB88zDOygEOsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745571514; c=relaxed/relaxed;
	bh=ATfcjqmEpZVuHsa5QpDh67huEWYjcYeodgb6v929ags=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PuDROH7MAk3dqJqoSha/pRsgcGTi1ljq5X8t5Z6zSXMLJBrq9oYNWGa7Z0HEnBl4se0Ck6glUL6/2qOYEyXR385DcXjaLYQATuFJVDhQxXJRdEFkbEnluPyxF6pF1JJwrMMATSuBa6T+w4oS/eqJXacriOJmeuRMFi2es3f/14b4q8k+98LPkp08XM2LFIKnVr5iQAqaz3FhwWeKZ2glcGR/pHJRKeVM2eTtxQMppix+BOgqC0k4J3qFo08PLadWHlvzkbnsqj68+TnCt1YUyHAu6J6Jq3X0En9G8fnTg2jArI3RxVuZAWHzR4AO1qRRMHV/1wqEmrpbgzL7Z1Or9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=HU4R34XW; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=7XArD6Wj; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=HU4R34XW;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=7XArD6Wj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4ZkRZw3RxZz2xqG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Apr 2025 18:58:32 +1000 (AEST)
Date: Fri, 25 Apr 2025 10:58:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745571507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ATfcjqmEpZVuHsa5QpDh67huEWYjcYeodgb6v929ags=;
	b=HU4R34XWPsRtuS+3Zwu+6pVRQWVMFmxkaCcTmym9py7QNM++iH/bagLUa0+oEik1YKv2gc
	UHbotcL98O9ikjHmMU/44dLq1bIzLbodJnWaWplbnLjKP2l5Jp7pMctgPld3nhULvx2xjq
	SSpVMBpo3+Ny8GJqDZoAujkPlS4CFvZS/XoAUr3TVGIyqqV/ewAqbtWjY6cXVcfcUkK1cY
	kl+5OVrKKLXBSvbEBVsNXdQvlyeE14HQtEiu6InpADVeXWWCL/eflTyGhNgSsIBrgjKwM9
	WEk22FPX16vSHQ/F6WOftfJSbKHADUV4E8pt5BgDripLSHkasGrISR4oOEMFmA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745571507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ATfcjqmEpZVuHsa5QpDh67huEWYjcYeodgb6v929ags=;
	b=7XArD6WjX4uOO9tTtLNvnmGGElYoy9J1l9VWBSDKN7R0iSfDuSVzvyX20AxViBwVjXd0ou
	kK8BmCvOyct1fWBw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Jan Stancek <jstancek@redhat.com>
Cc: Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH 08/19] vdso/gettimeofday: Prepare do_hres_timens() for
 introduction of struct vdso_clock
Message-ID: <20250425104552-07539a73-8f56-44d2-97a2-e224c567a2fc@linutronix.de>
References: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
 <20250303-vdso-clock-v1-8-c1b5c69a166f@linutronix.de>
 <aApGPAoctq_eoE2g@t14ultra>
 <20250424173908-ffca1ea2-e292-4df3-9391-24bfdaab33e7@linutronix.de>
 <CAASaF6xsMOWkhPrzKQWNz5SXaROSpxzFVBz+MOA-MNiEBty7gQ@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAASaF6xsMOWkhPrzKQWNz5SXaROSpxzFVBz+MOA-MNiEBty7gQ@mail.gmail.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Apr 24, 2025 at 11:57:02PM +0200, Jan Stancek wrote:
> On Thu, Apr 24, 2025 at 5:49 PM Thomas Weißschuh
> <thomas.weissschuh@linutronix.de> wrote:
> >
> > On Thu, Apr 24, 2025 at 04:10:04PM +0200, Jan Stancek wrote:
> > > On Mon, Mar 03, 2025 at 12:11:10PM +0100, Thomas Weißschuh wrote:
> > > > From: Anna-Maria Behnsen <anna-maria@linutronix.de>
> > > >
> > > > To support multiple PTP clocks, the VDSO data structure needs to be
> > > > reworked. All clock specific data will end up in struct vdso_clock and in
> > > > struct vdso_time_data there will be array of it. By now, vdso_clock is
> > > > simply a define which maps vdso_clock to vdso_time_data.
> > > >
> > > > Prepare for the rework of these structures by adding struct vdso_clock
> > > > pointer argument to do_hres_timens(), and replace the struct vdso_time_data
> > > > pointer with the new pointer arugment whenever applicable.
> > > >
> > > > No functional change.
> > > >
> > > > Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
> > > > Signed-off-by: Nam Cao <namcao@linutronix.de>
> > > > Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> > > > ---
> > > > lib/vdso/gettimeofday.c | 35 ++++++++++++++++++-----------------
> > > > 1 file changed, 18 insertions(+), 17 deletions(-)
> > > >
> > >
> > > starting with this patch, I'm seeing user-space crashes when using clock_gettime():
> > >   BAD  -> 83a2a6b8cfc5 vdso/gettimeofday: Prepare do_hres_timens() for introduction of struct vdso_clock
> > >   GOOD -> 64c3613ce31a vdso/gettimeofday: Prepare do_hres() for introduction of struct vdso_clock
> > >
> > > It appears to be unique to aarch64 with 64k pages, and can be reproduced with
> > > LTP clock_gettime03 [1]:
> > >   command: clock_gettime03   tst_kconfig.c:88: TINFO: Parsing kernel config '/lib/modules/6.15.0-0.rc3.20250423gitbc3372351d0c.30.eln147.aarch64+64k/build/.config'
> > >   tst_test.c:1903: TINFO: LTP version: 20250130-231-gd02c2aea3
> > >   tst_test.c:1907: TINFO: Tested kernel: 6.15.0-0.rc3.20250423gitbc3372351d0c.30.eln147.aarch64+64k #1 SMP PREEMPT_DYNAMIC Wed Apr 23 23:23:54 UTC 2025 aarch64
> > >   tst_kconfig.c:88: TINFO: Parsing kernel config '/lib/modules/6.15.0-0.rc3.20250423gitbc3372351d0c.30.eln147.aarch64+64k/build/.config'
> > >   tst_test.c:1720: TINFO: Overall timeout per run is 0h 05m 24s
> > >   clock_gettime03.c:121: TINFO: Testing variant: vDSO or syscall with libc spec
> > >   clock_gettime03.c:76: TPASS: Offset (CLOCK_MONOTONIC) is correct 10000ms
> > >   clock_gettime03.c:86: TPASS: Offset (CLOCK_MONOTONIC) is correct 0ms
> > >   clock_gettime03.c:76: TPASS: Offset (CLOCK_BOOTTIME) is correct 10000ms
> > >   clock_gettime03.c:86: TPASS: Offset (CLOCK_BOOTTIME) is correct 0ms
> > >   clock_gettime03.c:76: TPASS: Offset (CLOCK_MONOTONIC) is correct -10000ms
> > >   clock_gettime03.c:86: TPASS: Offset (CLOCK_MONOTONIC) is correct 0ms
> > >   clock_gettime03.c:76: TPASS: Offset (CLOCK_BOOTTIME) is correct -10000ms
> > >   clock_gettime03.c:86: TPASS: Offset (CLOCK_BOOTTIME) is correct 0ms
> > >   tst_test.c:438: TBROK: Child (233649) killed by signal SIGSEGV
> > >
> > > or with:
> > > --------------------- 8< ----------------------
> > > #define _GNU_SOURCE
> > > #include <sched.h>
> > > #include <time.h>
> > > #include <unistd.h>                                                                                                                                                                                                                          #include <sys/wait.h>
> > >
> > > int main(void)
> > > {
> > >         struct timespec tp;
> > >         pid_t child;
> > >         int status;
> > >
> > >         unshare(CLONE_NEWTIME);
> > >
> > >         child = fork();
> > >         if (child == 0) {
> > >                 clock_gettime(CLOCK_MONOTONIC_RAW, &tp);
> > >         }
> > >
> > >         wait(&status);
> > >         return status;
> > > }
> > >
> > > # ./a.out ; echo $?
> > > 139
> > > --------------------- >8 ----------------------
> > >
> > > RPMs and configs can be found at Fedora koji, latest build is at [2] (look for kernel-64k).
> >
> > Hi Jan,
> >
> > Thanks for the great error report.
> >
> > Can you try the following change (on top of v6.15-rc1, should also work with current master)?
> >
> > diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
> > index 93ef801a97ef..867ce53cca94 100644
> > --- a/lib/vdso/gettimeofday.c
> > +++ b/lib/vdso/gettimeofday.c
> > @@ -85,14 +85,18 @@ static __always_inline
> >  int do_hres_timens(const struct vdso_time_data *vdns, const struct vdso_clock *vcns,
> >                    clockid_t clk, struct __kernel_timespec *ts)
> >  {
> > -       const struct vdso_time_data *vd = __arch_get_vdso_u_timens_data(vdns);
> >         const struct timens_offset *offs = &vcns->offset[clk];
> > -       const struct vdso_clock *vc = vd->clock_data;
> > +       const struct vdso_time_data *vd;
> > +       const struct vdso_clock *vc;
> >         const struct vdso_timestamp *vdso_ts;
> >         u64 cycles, ns;
> >         u32 seq;
> >         s64 sec;
> >
> > +       vd = vdns - (clk == CLOCK_MONOTONIC_RAW ? CS_RAW : CS_HRES_COARSE);
> > +       vd = __arch_get_vdso_u_timens_data(vd);
> > +       vc = vd->clock_data;
> > +
> >         if (clk != CLOCK_MONOTONIC_RAW)
> >                 vc = &vc[CS_HRES_COARSE];
> >         else
> >
> >
> > I'll do some proper testing tomorrow.
> 
> That does seem to work for the 2 reproducers I have.

Thanks for testing.

> But why is this change needed?

So far the only thing that I can say is that this logic was there before the
patch and was removed accidentally, so it should be restored.
Why the logic was there in the first place I'll have to investigate.

> Isn't 'vdns' here equal to 'vdso_u_time_data'?

That is true, but in a time namespace the namespaced time structure is mapped
in place of the normal structure and vice-versa.
So __arch_get_vdso_u_timens_data() will get the "real" time datastructure based
on a namespaced one.

I can't explain the special logic for CLOCK_MONOTONIC_RAW yet.
To me it looks wrong to calculate on a 'struct vdso_time_data *' in terms of
CS_RAW/CS_HRES_COARSE.


Another change that "fixes" the crash for me is:

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 93ef801a97ef..cdc3988a0ace 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -93,6 +118,8 @@ int do_hres_timens(const struct vdso_time_data *vdns, const struct vdso_clock *v
        u32 seq;
        s64 sec;
 
+       OPTIMIZER_HIDE_VAR(vc);
+
        if (clk != CLOCK_MONOTONIC_RAW)
                vc = &vc[CS_HRES_COARSE];
        else


This is obviously not an actual fix but indicates that something weird is going on.
Could you run this second change also through LTP to see if it would pass?


Thomas

> > > [1] https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscalls/clock_gettime/clock_gettime03.c
> > > [2] https://koji.fedoraproject.org/koji/buildinfo?buildID=2704401
> >

