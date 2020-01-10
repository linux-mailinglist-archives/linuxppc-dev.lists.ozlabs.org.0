Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FD11379D1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 23:43:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47vdLh3XWDzDq9p
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2020 09:43:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linutronix.de
 (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de;
 envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47vdK22c4SzDqhm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2020 09:42:14 +1100 (AEDT)
Received: from p5b06da22.dip0.t-ipconnect.de ([91.6.218.34]
 helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1iq2yj-0006Fk-RI; Fri, 10 Jan 2020 23:42:05 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
 id 3A41A105BDB; Fri, 10 Jan 2020 23:42:05 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [RFC PATCH] powerpc/32: Switch VDSO to C implementation.
In-Reply-To: <09d07ad3-47a2-db2f-2f14-e002b22d8d9e@c-s.fr>
References: <8ce3582f7f7da9ff0286ced857e5aa2e5ae6746e.1571662378.git.christophe.leroy@c-s.fr>
 <alpine.DEB.2.21.1910212312520.2078@nanos.tec.linutronix.de>
 <f4486e86-3c0c-0eec-1639-0e5956cdb8f1@c-s.fr>
 <95bd2367-8edc-29db-faa3-7729661e05f2@c-s.fr>
 <alpine.DEB.2.21.1910261751140.10190@nanos.tec.linutronix.de>
 <439bce37-9c2c-2afe-9c9e-2f500472f9f8@c-s.fr>
 <alpine.DEB.2.21.1910262026340.10190@nanos.tec.linutronix.de>
 <207cef10-3da8-6a52-139c-0620b21b64af@c-s.fr>
 <87d0bslo7b.fsf@nanos.tec.linutronix.de>
 <09d07ad3-47a2-db2f-2f14-e002b22d8d9e@c-s.fr>
Date: Fri, 10 Jan 2020 23:42:05 +0100
Message-ID: <87h813rl1e.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
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
Cc: linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 luto@kernel.org, vincenzo.frascino@arm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe,

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> On 01/09/2020 02:05 PM, Thomas Gleixner wrote:
>> The reason why this is implemented in this way is that
>> __arch_get_hw_counter() needs a way to express that the clocksource of
>> the moment is not suitable for VDSO so that the syscall fallback gets
>> invoked.
>> 
>> Sure we could have used a pointer for the value and a return value
>> indicating the validity, but given the required uptime the resulting
>> code overhead seemed to be not worth it. At least not for me as I'm not
>> planning to be around 58 years from now :)
>> 
>
> I managed to get better code and better performance by splitting out the 
> validity check as follows. Would it be suitable for all arches ?

A quick test on x86 shows only a minimal impact, but it's in the
noise. So from my side that's fine, but I can't talk for ARM[64]/MIPS

> diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h 
> b/arch/powerpc/include/asm/vdso/gettimeofday.h
> index 689f51b0d8c9..11cdd6faa4ad 100644
> --- a/arch/powerpc/include/asm/vdso/gettimeofday.h
> +++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
> @@ -114,15 +114,17 @@ int clock_getres32_fallback(clockid_t _clkid, 
> struct old_timespec32 *_ts)
>   	return ret;
>   }
>
> -static __always_inline u64 __arch_get_hw_counter(s32 clock_mode)
> +static __always_inline bool __arch_is_hw_counter_valid(s32 clock_mode)
>   {
>   	/*
>   	 * clock_mode == 0 implies that vDSO are enabled otherwise
>   	 * fallback on syscall.
>   	 */
> -	if (clock_mode)
> -		return ULLONG_MAX;
> +	return clock_mode ? false : true;

I don't think we need an arch specific function here. I rather convert
the boolean of ARM[64] to the x86/MIPS way of VCLOCK_* modes and let the
generic code check for clock_mode == VCLOCK_NONE.

There is some magic in ARM and MIPS which wants to be able to disable
the whole thing at compile time, but that can be handled in the generic
code with just an extra config switch.

I'll have a stab at that tomorrow.

Thanks,

        tglx
