Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A8B2E2DDD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Dec 2020 10:59:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D2znC4ZsxzDqFm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Dec 2020 20:59:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D2zlg2981zDqFm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Dec 2020 20:58:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4D2zld2BXvz8w86
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Dec 2020 20:58:21 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4D2zld1g8cz9sWy; Sat, 26 Dec 2020 20:58:21 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nefkom.net (client-ip=2001:a60:0:28:0:1:25:1;
 helo=mail-out.m-online.net; envelope-from=whitebox@nefkom.net;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
X-Greylist: delayed 485 seconds by postgrey-1.36 at bilbo;
 Sat, 26 Dec 2020 20:58:20 AEDT
Received: from mail-out.m-online.net (mail-out.m-online.net
 [IPv6:2001:a60:0:28:0:1:25:1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4D2zlc3JKCz9sWw
 for <linuxppc-dev@ozlabs.org>; Sat, 26 Dec 2020 20:58:16 +1100 (AEDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4D2zZ11KtDz1rvBT;
 Sat, 26 Dec 2020 10:50:00 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4D2zZ03K4Hz1qr4j;
 Sat, 26 Dec 2020 10:50:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id c3_oiDhxysEo; Sat, 26 Dec 2020 10:49:59 +0100 (CET)
X-Auth-Info: 2EEmDzUlXOxjxOJGfx6FKHaSNBbYrfnTInfA+yJb7gWjx4jhYW00c4TYsKS2AS5x
Received: from hase.home (ppp-46-244-161-5.dynamic.mnet-online.de
 [46.244.161.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sat, 26 Dec 2020 10:49:59 +0100 (CET)
Received: by hase.home (Postfix, from userid 1000)
 id E90CB102A62; Sat, 26 Dec 2020 10:49:57 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v14 6/9] powerpc/vdso: Prepare for switching VDSO to
 generic C implementation.
References: <20201126131006.2431205-1-mpe@ellerman.id.au>
 <20201126131006.2431205-6-mpe__7176.90246399201$1606398872$gmane$org@ellerman.id.au>
X-Yow: Gee, I feel kind of LIGHT in the head now, knowing I can't make
 my satellite dish PAYMENTS!
Date: Sat, 26 Dec 2020 10:49:57 +0100
In-Reply-To: <20201126131006.2431205-6-mpe__7176.90246399201$1606398872$gmane$org@ellerman.id.au>
 (Michael Ellerman's message of "Fri, 27 Nov 2020 00:10:03 +1100")
Message-ID: <87czywsxq2.fsf@linux-m68k.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1.90 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Nov 27 2020, Michael Ellerman wrote:

> diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h b/arch/powerpc/include/asm/vdso/gettimeofday.h
> new file mode 100644
> index 000000000000..43dd1dc47c37
> --- /dev/null
> +++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
> @@ -0,0 +1,187 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_POWERPC_VDSO_GETTIMEOFDAY_H
> +#define _ASM_POWERPC_VDSO_GETTIMEOFDAY_H
> +
> +#ifdef __ASSEMBLY__
> +
> +#include <asm/ppc_asm.h>
> +
> +/*
> + * The macros sets two stack frames, one for the caller and one for the callee
> + * because there are no requirement for the caller to set a stack frame when
> + * calling VDSO so it may have omitted to set one, especially on PPC64
> + */
> +
> +.macro cvdso_call funct
> +  .cfi_startproc
> +	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
> +	mflr		r0
> +  .cfi_register lr, r0
> +	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
> +	PPC_STL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
> +	get_datapage	r5, r0
> +	addi		r5, r5, VDSO_DATA_OFFSET
> +	bl		DOTSYM(\funct)
> +	PPC_LL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
> +	cmpwi		r3, 0
> +	mtlr		r0
> +  .cfi_restore lr
> +	addi		r1, r1, 2 * PPC_MIN_STKFRM
> +	crclr		so
> +	beqlr+
> +	crset		so
> +	neg		r3, r3
> +	blr
> +  .cfi_endproc
> +.endm
> +
> +.macro cvdso_call_time funct
> +  .cfi_startproc
> +	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
> +	mflr		r0
> +  .cfi_register lr, r0
> +	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
> +	PPC_STL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
> +	get_datapage	r4, r0
> +	addi		r4, r4, VDSO_DATA_OFFSET
> +	bl		DOTSYM(\funct)
> +	PPC_LL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
> +	crclr		so
> +	mtlr		r0
> +  .cfi_restore lr
> +	addi		r1, r1, 2 * PPC_MIN_STKFRM
> +	blr
> +  .cfi_endproc
> +.endm
> +
> +#else
> +
> +#include <asm/vdso/timebase.h>
> +#include <asm/barrier.h>
> +#include <asm/unistd.h>
> +#include <uapi/linux/time.h>
> +
> +#define VDSO_HAS_CLOCK_GETRES		1
> +
> +#define VDSO_HAS_TIME			1
> +
> +static __always_inline int do_syscall_2(const unsigned long _r0, const unsigned long _r3,
> +					const unsigned long _r4)
> +{
> +	register long r0 asm("r0") = _r0;
> +	register unsigned long r3 asm("r3") = _r3;
> +	register unsigned long r4 asm("r4") = _r4;
> +	register int ret asm ("r3");
> +
> +	asm volatile(
> +		"       sc\n"
> +		"	bns+	1f\n"
> +		"	neg	%0, %0\n"
> +		"1:\n"
> +	: "=r" (ret), "+r" (r4), "+r" (r0)
> +	: "r" (r3)
> +	: "memory", "r5", "r6", "r7", "r8", "r9", "r10", "r11", "r12", "cr0", "ctr");
> +
> +	return ret;
> +}
> +
> +static __always_inline
> +int gettimeofday_fallback(struct __kernel_old_timeval *_tv, struct timezone *_tz)
> +{
> +	return do_syscall_2(__NR_gettimeofday, (unsigned long)_tv, (unsigned long)_tz);
> +}
> +
> +static __always_inline
> +int clock_gettime_fallback(clockid_t _clkid, struct __kernel_timespec *_ts)
> +{
> +	return do_syscall_2(__NR_clock_gettime, _clkid, (unsigned long)_ts);

Doesn't that need to be __NR_clock_gettime64 for ppc32?

> +}
> +
> +static __always_inline
> +int clock_getres_fallback(clockid_t _clkid, struct __kernel_timespec *_ts)
> +{
> +	return do_syscall_2(__NR_clock_getres, _clkid, (unsigned long)_ts);

And here __NR_clock_getres_time64?

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
