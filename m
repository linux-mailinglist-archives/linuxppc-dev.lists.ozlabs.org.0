Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A367135C95
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 16:23:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tqcl6NHTzDqbG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 02:23:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=LsSiqN4T; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tqZl6VG4zDqWl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 02:21:18 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47tqZc4Px8z9tyTJ;
 Thu,  9 Jan 2020 16:21:12 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=LsSiqN4T; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 4R6vrxeQFeFN; Thu,  9 Jan 2020 16:21:12 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47tqZc3MhMz9ttwm;
 Thu,  9 Jan 2020 16:21:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1578583272; bh=rlFk2/nVn6L86YvAEvyKd40+sLRN0EVlSLwY9Encz7o=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=LsSiqN4T6C+PabHJPB72/f2z78T+X0zDsDYVByArCv0kne1cpvCd7CLjXiwhn7Zaq
 JjLD8oOKEgmQlO7SNjrn3PcqPu0B5nafQulmD2CwNR73CGxgx85w4yPx3GR/FtnTFJ
 YxM3dwNKUxJyMEQp0xwxOom7OOsDUK4O0pXQ++m0=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F2F3E8B82B;
 Thu,  9 Jan 2020 16:21:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id jRRx2cg7etrd; Thu,  9 Jan 2020 16:21:13 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2E6B88B828;
 Thu,  9 Jan 2020 16:21:13 +0100 (CET)
Subject: Re: [RFC PATCH] powerpc/32: Switch VDSO to C implementation.
To: Thomas Gleixner <tglx@linutronix.de>
References: <8ce3582f7f7da9ff0286ced857e5aa2e5ae6746e.1571662378.git.christophe.leroy@c-s.fr>
 <alpine.DEB.2.21.1910212312520.2078@nanos.tec.linutronix.de>
 <f4486e86-3c0c-0eec-1639-0e5956cdb8f1@c-s.fr>
 <95bd2367-8edc-29db-faa3-7729661e05f2@c-s.fr>
 <alpine.DEB.2.21.1910261751140.10190@nanos.tec.linutronix.de>
 <439bce37-9c2c-2afe-9c9e-2f500472f9f8@c-s.fr>
 <alpine.DEB.2.21.1910262026340.10190@nanos.tec.linutronix.de>
 <207cef10-3da8-6a52-139c-0620b21b64af@c-s.fr>
 <87d0bslo7b.fsf@nanos.tec.linutronix.de>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <09d07ad3-47a2-db2f-2f14-e002b22d8d9e@c-s.fr>
Date: Thu, 9 Jan 2020 15:21:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <87d0bslo7b.fsf@nanos.tec.linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Hi Thomas,

On 01/09/2020 02:05 PM, Thomas Gleixner wrote:
> Christophe!
> 
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> In do_hres(), I see:
>>
>> 		cycles = __arch_get_hw_counter(vd->clock_mode);
>> 		ns = vdso_ts->nsec;
>> 		last = vd->cycle_last;
>> 		if (unlikely((s64)cycles < 0))
>> 			return -1;
>>
>> __arch_get_hw_counter() returns a u64 values. On the PPC, this is read
>> from the timebase which is a 64 bits counter.
>>
>> Why returning -1 if (s64)cycles < 0 ? Does it means we have to mask out
>> the most significant bit when reading the HW counter ?
> 
> Only if you expect the HW counter to reach a value which has bit 63
> set. That'd require:
> 
> uptime		counter frequency
> 
> ~292 years      1GHz
> ~ 58 years      5GHz
> 
> assumed that the HW counter starts at 0 when the box is powered on.
> 
> The reason why this is implemented in this way is that
> __arch_get_hw_counter() needs a way to express that the clocksource of
> the moment is not suitable for VDSO so that the syscall fallback gets
> invoked.
> 
> Sure we could have used a pointer for the value and a return value
> indicating the validity, but given the required uptime the resulting
> code overhead seemed to be not worth it. At least not for me as I'm not
> planning to be around 58 years from now :)
> 

I managed to get better code and better performance by splitting out the 
validity check as follows. Would it be suitable for all arches ?


diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h 
b/arch/powerpc/include/asm/vdso/gettimeofday.h
index 689f51b0d8c9..11cdd6faa4ad 100644
--- a/arch/powerpc/include/asm/vdso/gettimeofday.h
+++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
@@ -114,15 +114,17 @@ int clock_getres32_fallback(clockid_t _clkid, 
struct old_timespec32 *_ts)
  	return ret;
  }

-static __always_inline u64 __arch_get_hw_counter(s32 clock_mode)
+static __always_inline bool __arch_is_hw_counter_valid(s32 clock_mode)
  {
  	/*
  	 * clock_mode == 0 implies that vDSO are enabled otherwise
  	 * fallback on syscall.
  	 */
-	if (clock_mode)
-		return ULLONG_MAX;
+	return clock_mode ? false : true;
+}

+static __always_inline u64 __arch_get_hw_counter(s32 clock_mode)
+{
  	return get_tb();
  }

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index ee9da52a3e02..90bb5dfd0db0 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -46,11 +46,12 @@ static inline int do_hres(const struct vdso_data 
*vd, clockid_t clk,

  	do {
  		seq = vdso_read_begin(vd);
+		if (!__arch_is_hw_counter_valid(vd->clock_mode))
+			return -1;
+
  		cycles = __arch_get_hw_counter(vd->clock_mode);
  		ns = vdso_ts->nsec;
  		last = vd->cycle_last;
-		if (unlikely((s64)cycles < 0))
-			return -1;

  		ns += vdso_calc_delta(cycles, last, vd->mask, vd->mult);
  		ns >>= vd->shift;


Thanks
Christophe
