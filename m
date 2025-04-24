Return-Path: <linuxppc-dev+bounces-7961-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD11A9B2E9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Apr 2025 17:49:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zk0lm3Gdgz3bsL;
	Fri, 25 Apr 2025 01:49:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745509780;
	cv=none; b=DwuZF6gWN6dvuTjJntQ6YOnfKLEphLcgdk4lQNuyDW5LRzydydxkyV4SgFf/OpdJ1Mgh0RVXypslte/Sl3IGjpmQ/gcfYQRQgzL4vLUWKG6+gaQdwyBlMd1zyd/lbj6D5lzU/kFuOmQ8kMYeNhq+z0RJ75UobKMjiN6mSr946llx7N93FkOMQ5LIPpbvr/lJWaZAabh2TVBXNo/pJyJOw61ioqrphmNGzZY2EUs7HqyuMWvy7BYhO7sDrhv609rEHcqVyk8mnx6gQ1r8LjfFrF+D7fAlHTEzYyKzgVbHZhN31N1HiPxzmAAYa5opXDzSlKOLEYWNKMQgW6VlG4Ir+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745509780; c=relaxed/relaxed;
	bh=nDo39tt+n8ATYguGedpesmJZxZJLtDSDAKicoCO2cI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b12YPhuC/MqSpbfWs/oHrILsMukvR6f91BAW3g4QuqGlMMFyUkPcXvbsV8ZOW+1s1OxlWde3D+jgF6MI53UQLK4iicO8g+++gmLP5uc27uJaTJ/AOfT+seqyceV+XAKL7FQwHZkLWcujmtCAQgtCunFFfOFt+u2M/cZfllsPGk1RWH21AgsWv/3ZMEkMw1mUevlQfDKMvcxdlQIb5PXDLcbPGFmMgmPvkrVkzyY8AhxwJBqFsJe8vPsXjnv7ZZ2rxB8y9M3PoWzBoz2by4cP2+B7PTFvgPXYlKP4VAWkKxMfCbFrKzhA3qktPDRST2hzael9KJ6lmFAcLHFM/yVmuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lK/QryIi; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=2M6vSdvp; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lK/QryIi;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=2M6vSdvp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 367 seconds by postgrey-1.37 at boromir; Fri, 25 Apr 2025 01:49:38 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4Zk0lk2s3Mz2yfx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Apr 2025 01:49:38 +1000 (AEST)
Date: Thu, 24 Apr 2025 17:43:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745509401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nDo39tt+n8ATYguGedpesmJZxZJLtDSDAKicoCO2cI8=;
	b=lK/QryIiV998Da/Rm919TzKOYxMOJx62tzbf+B+2e6sDZ6HfuEIr7nmMyICIJlvXLJGrSx
	EJFEso6phLHBprXv1tluC3gRUAmPLUBwoEiSt1hYoXjVg38TTfXv9TANLhUfnZv/ISg6a1
	Bn44d2bh/6y3Yn7pqBmkB+Ru9qpmiTtzE5h1UE8cjtRNtg63LPCOYNypxU2jIdTUxbAEG9
	WUan0+TuDsYhyZ69GSqI3Wj4ekINOeGLpIcIiUeYKRuEO5VFVHS+iP4aediB64wTBHliqD
	KG55Vr+C+5idEzISLVT8PzdA9d3RNjZnN3ZfcI5PWVLp9t/iVkc9RHRvMxuEtQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745509401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nDo39tt+n8ATYguGedpesmJZxZJLtDSDAKicoCO2cI8=;
	b=2M6vSdvpglYLR21147amU66kDvqCzLdGxNK0wSXT0/szoFczg5Yrh111Vgpo7OOJT/82rR
	K7u6DAGFSh65nTBw==
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
Message-ID: <20250424173908-ffca1ea2-e292-4df3-9391-24bfdaab33e7@linutronix.de>
References: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
 <20250303-vdso-clock-v1-8-c1b5c69a166f@linutronix.de>
 <aApGPAoctq_eoE2g@t14ultra>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aApGPAoctq_eoE2g@t14ultra>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Apr 24, 2025 at 04:10:04PM +0200, Jan Stancek wrote:
> On Mon, Mar 03, 2025 at 12:11:10PM +0100, Thomas Weiﬂschuh wrote:
> > From: Anna-Maria Behnsen <anna-maria@linutronix.de>
> > 
> > To support multiple PTP clocks, the VDSO data structure needs to be
> > reworked. All clock specific data will end up in struct vdso_clock and in
> > struct vdso_time_data there will be array of it. By now, vdso_clock is
> > simply a define which maps vdso_clock to vdso_time_data.
> > 
> > Prepare for the rework of these structures by adding struct vdso_clock
> > pointer argument to do_hres_timens(), and replace the struct vdso_time_data
> > pointer with the new pointer arugment whenever applicable.
> > 
> > No functional change.
> > 
> > Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
> > Signed-off-by: Nam Cao <namcao@linutronix.de>
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > ---
> > lib/vdso/gettimeofday.c | 35 ++++++++++++++++++-----------------
> > 1 file changed, 18 insertions(+), 17 deletions(-)
> > 
> 
> starting with this patch, I'm seeing user-space crashes when using clock_gettime():
>   BAD  -> 83a2a6b8cfc5 vdso/gettimeofday: Prepare do_hres_timens() for introduction of struct vdso_clock
>   GOOD -> 64c3613ce31a vdso/gettimeofday: Prepare do_hres() for introduction of struct vdso_clock
> 
> It appears to be unique to aarch64 with 64k pages, and can be reproduced with
> LTP clock_gettime03 [1]:
>   command: clock_gettime03   tst_kconfig.c:88: TINFO: Parsing kernel config '/lib/modules/6.15.0-0.rc3.20250423gitbc3372351d0c.30.eln147.aarch64+64k/build/.config'
>   tst_test.c:1903: TINFO: LTP version: 20250130-231-gd02c2aea3
>   tst_test.c:1907: TINFO: Tested kernel: 6.15.0-0.rc3.20250423gitbc3372351d0c.30.eln147.aarch64+64k #1 SMP PREEMPT_DYNAMIC Wed Apr 23 23:23:54 UTC 2025 aarch64
>   tst_kconfig.c:88: TINFO: Parsing kernel config '/lib/modules/6.15.0-0.rc3.20250423gitbc3372351d0c.30.eln147.aarch64+64k/build/.config'
>   tst_test.c:1720: TINFO: Overall timeout per run is 0h 05m 24s
>   clock_gettime03.c:121: TINFO: Testing variant: vDSO or syscall with libc spec
>   clock_gettime03.c:76: TPASS: Offset (CLOCK_MONOTONIC) is correct 10000ms
>   clock_gettime03.c:86: TPASS: Offset (CLOCK_MONOTONIC) is correct 0ms
>   clock_gettime03.c:76: TPASS: Offset (CLOCK_BOOTTIME) is correct 10000ms
>   clock_gettime03.c:86: TPASS: Offset (CLOCK_BOOTTIME) is correct 0ms
>   clock_gettime03.c:76: TPASS: Offset (CLOCK_MONOTONIC) is correct -10000ms
>   clock_gettime03.c:86: TPASS: Offset (CLOCK_MONOTONIC) is correct 0ms
>   clock_gettime03.c:76: TPASS: Offset (CLOCK_BOOTTIME) is correct -10000ms
>   clock_gettime03.c:86: TPASS: Offset (CLOCK_BOOTTIME) is correct 0ms
>   tst_test.c:438: TBROK: Child (233649) killed by signal SIGSEGV
> 
> or with:
> --------------------- 8< ----------------------
> #define _GNU_SOURCE
> #include <sched.h>
> #include <time.h>
> #include <unistd.h>                                                                                                                                                                                                                          #include <sys/wait.h>
> 
> int main(void)
> {
>         struct timespec tp;
>         pid_t child;
>         int status;
> 
>         unshare(CLONE_NEWTIME);
> 
>         child = fork();
>         if (child == 0) {
>                 clock_gettime(CLOCK_MONOTONIC_RAW, &tp);
>         }
> 
>         wait(&status);
>         return status;
> }
> 
> # ./a.out ; echo $?
> 139
> --------------------- >8 ----------------------
> 
> RPMs and configs can be found at Fedora koji, latest build is at [2] (look for kernel-64k).

Hi Jan,

Thanks for the great error report.

Can you try the following change (on top of v6.15-rc1, should also work with current master)?

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 93ef801a97ef..867ce53cca94 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -85,14 +85,18 @@ static __always_inline
 int do_hres_timens(const struct vdso_time_data *vdns, const struct vdso_clock *vcns,
 		   clockid_t clk, struct __kernel_timespec *ts)
 {
-	const struct vdso_time_data *vd = __arch_get_vdso_u_timens_data(vdns);
 	const struct timens_offset *offs = &vcns->offset[clk];
-	const struct vdso_clock *vc = vd->clock_data;
+	const struct vdso_time_data *vd;
+	const struct vdso_clock *vc;
 	const struct vdso_timestamp *vdso_ts;
 	u64 cycles, ns;
 	u32 seq;
 	s64 sec;
 
+	vd = vdns - (clk == CLOCK_MONOTONIC_RAW ? CS_RAW : CS_HRES_COARSE);
+	vd = __arch_get_vdso_u_timens_data(vd);
+	vc = vd->clock_data;
+
 	if (clk != CLOCK_MONOTONIC_RAW)
 		vc = &vc[CS_HRES_COARSE];
 	else


I'll do some proper testing tomorrow.


Thomas

> [1] https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscalls/clock_gettime/clock_gettime03.c
> [2] https://koji.fedoraproject.org/koji/buildinfo?buildID=2704401

