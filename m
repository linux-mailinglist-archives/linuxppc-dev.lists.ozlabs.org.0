Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A0122BDD4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 08:01:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCdqr10N8zDsMM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 16:01:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Pb4/uDyq; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCdnt4SL8zDrp4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 15:59:45 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id d7so3881077plq.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 22:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=2R0lW9dUL1nYb/9lgperk2g748vxQMNCmmnNHRKkl+M=;
 b=Pb4/uDyqpRTTP9b3ebYsdYcsxNScuYdJIPeDBdZdQ0oiVxIw9UIdugSoUtLX7SJ1/B
 3Xdajmy3uy5LYrQAe1LgIUmt9GE2Vm15HXVAfbSCg3F0Qeru3fAvX3RNB/iMTCee5YEf
 Adelh56xJuUYcwoXbqlzhH99jqeA0YOu72J/OiCuy0fBv5rjilfboH5Vdua2NoTnkgaP
 NSculWvNNeRGDKrLDX9WSmf3+GTuvKrepedSaFzEn9p46GRTm21RRPTHKGRdD+k0n+GM
 ofGi26OjkkbLfQt5mu++mN1BJa3/e/9cUcmQdOHUK+ZigZC4XvuAIo2C03brXMwXU575
 EKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=2R0lW9dUL1nYb/9lgperk2g748vxQMNCmmnNHRKkl+M=;
 b=PClI3xqNkFNRuTHOkr8in9A7Y23wbWMpXWCvn+/izDwuRk/6hm40t4EUn2p36qOUiz
 2QxzTUYvknKttm3N0xEeI0sJDEwtvLDX4V+ChR97K/pkcg8yALI12XmWaPo7Q3eg7Zyr
 iDOALhUMBLMWPTpTO6brgSI2jmR81F+EmU01gPWA6ZgeeEfKdYgKQy5CzFBdFpB49bBT
 d7osJqRCYLT5ZeW/segSWZWuNLgjxc0oawgjE76kvgbFsD2Qq9VOEoMnYDJb/m82E7kH
 6PnOki818SaywxH7fHfaRn3NgKTyPdxMfhvrszH7rqQVftmVC1/cYDWuPnokK4RhXR7y
 Hgvg==
X-Gm-Message-State: AOAM530Sfm4hu7l0Lq0EdDxrdJynqlSMD0dmrSPqNi/Yp/qRydkLA9re
 ejyWrBBx6q1/9BfB/4Bcq40=
X-Google-Smtp-Source: ABdhPJxbeH9FlO3dIACKcXGFcLekN350jP0rI0GOjOvxK+MH/SPj/LKJY2RwdAnGdzEYCg0FKF+/iQ==
X-Received: by 2002:a17:902:6181:: with SMTP id
 u1mr6767335plj.205.1595570381925; 
 Thu, 23 Jul 2020 22:59:41 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id y24sm4966404pfp.217.2020.07.23.22.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 22:59:41 -0700 (PDT)
Date: Fri, 24 Jul 2020 15:59:35 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] lockdep: improve current->(hard|soft)irqs_enabled
 synchronisation with actual irq state
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Peter Zijlstra <peterz@infradead.org>
References: <20200723105615.1268126-1-npiggin@gmail.com>
 <20200723114010.GO5523@worktop.programming.kicks-ass.net>
 <1595506730.3mvrxktem5.astroid@bobo.none>
 <1884dcea-9ecd-a1f3-21bb-213c655e2480@ozlabs.ru>
In-Reply-To: <1884dcea-9ecd-a1f3-21bb-213c655e2480@ozlabs.ru>
MIME-Version: 1.0
Message-Id: <1595568105.4eodjnxzwp.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Alexey Kardashevskiy's message of July 24, 2020 2:16 pm:
>=20
>=20
> On 23/07/2020 23:11, Nicholas Piggin wrote:
>> Excerpts from Peter Zijlstra's message of July 23, 2020 9:40 pm:
>>> On Thu, Jul 23, 2020 at 08:56:14PM +1000, Nicholas Piggin wrote:
>>>
>>>> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/=
asm/hw_irq.h
>>>> index 3a0db7b0b46e..35060be09073 100644
>>>> --- a/arch/powerpc/include/asm/hw_irq.h
>>>> +++ b/arch/powerpc/include/asm/hw_irq.h
>>>> @@ -200,17 +200,14 @@ static inline bool arch_irqs_disabled(void)
>>>>  #define powerpc_local_irq_pmu_save(flags)			\
>>>>  	 do {							\
>>>>  		raw_local_irq_pmu_save(flags);			\
>>>> -		trace_hardirqs_off();				\
>>>> +		if (!raw_irqs_disabled_flags(flags))		\
>>>> +			trace_hardirqs_off();			\
>>>>  	} while(0)
>>>>  #define powerpc_local_irq_pmu_restore(flags)			\
>>>>  	do {							\
>>>> -		if (raw_irqs_disabled_flags(flags)) {		\
>>>> -			raw_local_irq_pmu_restore(flags);	\
>>>> -			trace_hardirqs_off();			\
>>>> -		} else {					\
>>>> +		if (!raw_irqs_disabled_flags(flags))		\
>>>>  			trace_hardirqs_on();			\
>>>> -			raw_local_irq_pmu_restore(flags);	\
>>>> -		}						\
>>>> +		raw_local_irq_pmu_restore(flags);		\
>>>>  	} while(0)
>>>
>>> You shouldn't be calling lockdep from NMI context!
>>=20
>> After this patch it doesn't.
>>=20
>> trace_hardirqs_on/off implementation appears to expect to be called in N=
MI=20
>> context though, for some reason.
>>=20
>>> That is, I recently
>>> added suport for that on x86:
>>>
>>>   https://lkml.kernel.org/r/20200623083721.155449112@infradead.org
>>>   https://lkml.kernel.org/r/20200623083721.216740948@infradead.org
>>>
>>> But you need to be very careful on how you order things, as you can see
>>> the above relies on preempt_count() already having been incremented wit=
h
>>> NMI_MASK.
>>=20
>> Hmm. My patch seems simpler.
>=20
> And your patches fix my error while Peter's do not:
>=20
>=20
> IRQs not enabled as expected
> WARNING: CPU: 0 PID: 1377 at /home/aik/p/kernel/kernel/softirq.c:169
> __local_bh_enable_ip+0x118/0x190

I think they would have needed some powerpc bits as well. But I don't
see a reason we can't merge my patches, at least they fix this case and
don't seem to make things worse in any way.

Thanks,
Nick
