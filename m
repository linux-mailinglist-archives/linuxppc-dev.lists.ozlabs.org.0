Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D55013B969
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 07:17:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yHDW1KzfzDqSd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 17:17:31 +1100 (AEDT)
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
 header.s=mail header.b=UntR+ovd; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yHBZ0Rq3zDqRN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2020 17:15:49 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47yHBT0bNKz9v9Dm;
 Wed, 15 Jan 2020 07:15:45 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=UntR+ovd; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id uRhu0hEJc6dc; Wed, 15 Jan 2020 07:15:45 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47yHBS5m1Pz9v9Dk;
 Wed, 15 Jan 2020 07:15:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579068944; bh=dLb+n74DT6jZUD4ec0gfhmKuZ7wdMUymXTZD+f3ESjs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=UntR+ovdUgNuiOCdaG492qpGkB1inQlUzwXmUjovM/oqM/Vp3a/K3ppEYvczfO2ls
 w8S4Mabi06ZQ75T5HTmKpob6aRUwzfUY5vsQRUL7Zw5MJvFZAX1RNry5Mv2FWFVr5b
 rxL2XadbeDGNcEyFm+pdcDnM/FQoG26VHqpC1L64=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9A0E88B77E;
 Wed, 15 Jan 2020 07:15:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 3sLM6Sb2GP2Q; Wed, 15 Jan 2020 07:15:45 +0100 (CET)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6976D8B774;
 Wed, 15 Jan 2020 07:15:45 +0100 (CET)
Subject: Re: [RFC PATCH v3 08/12] lib: vdso: allow arches to provide vdso data
 pointer
To: Thomas Gleixner <tglx@linutronix.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 arnd@arndb.de, vincenzo.frascino@arm.com, luto@kernel.org
References: <cover.1578934751.git.christophe.leroy@c-s.fr>
 <381e547dbb3c48fd39d6cf208033bba38ad048fb.1578934751.git.christophe.leroy@c-s.fr>
 <87ftghbpuu.fsf@nanos.tec.linutronix.de>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <d2de3211-9d7c-513e-fe0f-8bdce623fb65@c-s.fr>
Date: Wed, 15 Jan 2020 07:15:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <87ftghbpuu.fsf@nanos.tec.linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/01/2020 à 00:06, Thomas Gleixner a écrit :
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>>   
>>   static __maybe_unused int
>> +#ifdef VDSO_GETS_VD_PTR_FROM_ARCH
>> +__cvdso_clock_gettime_common(const struct vdso_data *vd, clockid_t clock,
>> +		      struct __kernel_timespec *ts)
>> +{
>> +#else
>>   __cvdso_clock_gettime_common(clockid_t clock, struct __kernel_timespec *ts)
>>   {
>>   	const struct vdso_data *vd = __arch_get_vdso_data();
>> +#endif
>>   	u32 msk;
> 
> If we do that, then there is no point in propagating this to the inner
> functions. It's perfectly fine to have this distinction at the outermost
> level.

In v2, I did it at the arch level (see 
https://patchwork.ozlabs.org/patch/1214983/). Andy was concerned about 
it being suboptimal for arches which (unlike powerpc) have PC related 
data addressing mode.

Wouldn't it be the same issue if doing it at the outermost level of 
generic VDSO ?

> 
> As a related question, I noticed that you keep all that ASM voodoo in
> the PPC specific code which provides the actual entry points. Is that
> ASM code really still necessary? All current users of the generic VDSO
> just do something like:
> 
> int __vdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts)
> {
>          return __cvdso_clock_gettime(clock, ts);
> }
> 
> in the architecture code. Is there a reason why this can't work on PPC?

The problem with powerpc is that VDSO functions have to (just like 
system calls) set the SO bit in CR register in case of error, or clear 
it if no error. There is no way to do that from the C function, because 
there is no way to tell GCC to not play up with CR register on function 
return.

Refer discussion at https://gcc.gnu.org/bugzilla/show_bug.cgi?id=92769

Christophe
