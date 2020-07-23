Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF4922B364
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 18:22:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCHff2hByzDrQZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 02:22:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CLFlyE2I; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCHcX3zsPzDrHG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 02:20:28 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id u5so3239440pfn.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 09:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=dWKUB0kRohvexbkkPgRM1qwRkgK/3Sd5V3qmYHkfVHc=;
 b=CLFlyE2INNHRtu0udQhGXB/xueYWvsHUKQOa7BhUp+CQibOINf6pl9x8l8tzZnhdso
 ra1AtKgGgUmh80B1VBWFNou9SX1AkDMjVJPKEd6z7bXtYEtL4VtsWvWBKt85CviMvodt
 BCPDK7o0NLHmmMijpm4MSZoDNzKJgXcYkyPwgQI94LaTdG3ZWY8hKiJp0FQZTwHSGX68
 03TQQk4bUoK7KOZGgWGPD5qw1ZjGeDnIGEuePIN3oPvkWPaQfDouRmp3sEiQiRAei0kZ
 iuFRqCxyVbeCBhNxZt0y4ohF4dbrYNqIKL71S9OHION9X5XkwajhSEhjg2H7M3QCdc2S
 CGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=dWKUB0kRohvexbkkPgRM1qwRkgK/3Sd5V3qmYHkfVHc=;
 b=GKwF1oQ/B0xvcEsWpy8qq3XgN4xXoMngMJ6SL/QXwvOBTxUk87hnwdcv6P4hNESzAs
 kRaUNJma8xqOIM/U++4Md8Ds4JcSaqOYG1qAUhKHuH3ttWgTEg60nBu1F0lWIHKkbUxT
 5BK1s2ng8RhDd5q7pNBiCbZsySx3Tt07pqZF4PPqv7aeAsaPWvcZ6zDm/LHMnF4qr+ra
 mCuIsN21j2CVUoo2SZWjBNwpO49UGHBhw7Lg7jsT1x+PXTIHESQBJ9xOe4g5gEqhworf
 9ZRjVyN30HPRqYSJITxv13PBT6d9ZMG0uxcm3RFhCeYkfIPeyUJHNM7+L7IauWCAoeKQ
 UVtw==
X-Gm-Message-State: AOAM531hi2mLzx6XFYdv13NmF7NeYG+V7CfqwBeElOS69w0xAETMcRAR
 cD6qSLVv2M3pVlYXIiWllVY=
X-Google-Smtp-Source: ABdhPJysDWhvIJQomw/DqEdIwc2bVMwxFcnItkq2Ze5+GnmO9BChUUQuuGE4h+UgCL2QhudHR2afgw==
X-Received: by 2002:a65:6246:: with SMTP id q6mr4842817pgv.133.1595521226642; 
 Thu, 23 Jul 2020 09:20:26 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id z11sm3376688pfr.71.2020.07.23.09.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 09:20:26 -0700 (PDT)
Date: Fri, 24 Jul 2020 02:20:20 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] lockdep: improve current->(hard|soft)irqs_enabled
 synchronisation with actual irq state
To: Peter Zijlstra <peterz@infradead.org>
References: <20200723105615.1268126-1-npiggin@gmail.com>
 <20200723114010.GO5523@worktop.programming.kicks-ass.net>
 <1595506730.3mvrxktem5.astroid@bobo.none>
 <20200723145904.GU5523@worktop.programming.kicks-ass.net>
In-Reply-To: <20200723145904.GU5523@worktop.programming.kicks-ass.net>
MIME-Version: 1.0
Message-Id: <1595520766.9z4077xel7.astroid@bobo.none>
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
Cc: linux-arch@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Peter Zijlstra's message of July 24, 2020 12:59 am:
> On Thu, Jul 23, 2020 at 11:11:03PM +1000, Nicholas Piggin wrote:
>> Excerpts from Peter Zijlstra's message of July 23, 2020 9:40 pm:
>> > On Thu, Jul 23, 2020 at 08:56:14PM +1000, Nicholas Piggin wrote:
>> >=20
>> >> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include=
/asm/hw_irq.h
>> >> index 3a0db7b0b46e..35060be09073 100644
>> >> --- a/arch/powerpc/include/asm/hw_irq.h
>> >> +++ b/arch/powerpc/include/asm/hw_irq.h
>> >> @@ -200,17 +200,14 @@ static inline bool arch_irqs_disabled(void)
>> >>  #define powerpc_local_irq_pmu_save(flags)			\
>> >>  	 do {							\
>> >>  		raw_local_irq_pmu_save(flags);			\
>> >> -		trace_hardirqs_off();				\
>> >> +		if (!raw_irqs_disabled_flags(flags))		\
>> >> +			trace_hardirqs_off();			\
>> >>  	} while(0)
>> >>  #define powerpc_local_irq_pmu_restore(flags)			\
>> >>  	do {							\
>> >> -		if (raw_irqs_disabled_flags(flags)) {		\
>> >> -			raw_local_irq_pmu_restore(flags);	\
>> >> -			trace_hardirqs_off();			\
>> >> -		} else {					\
>> >> +		if (!raw_irqs_disabled_flags(flags))		\
>> >>  			trace_hardirqs_on();			\
>> >> -			raw_local_irq_pmu_restore(flags);	\
>> >> -		}						\
>> >> +		raw_local_irq_pmu_restore(flags);		\
>> >>  	} while(0)
>> >=20
>> > You shouldn't be calling lockdep from NMI context!
>>=20
>> After this patch it doesn't.
>=20
> You sure, trace_hardirqs_{on,off}() calls into lockdep.

At least for irq enable/disable functions yes. NMI runs with
interrupts disabled so these will never call trace_hardirqs_on/off
after this patch.

> (FWIW they're
> also broken vs entry ordering, but that's another story).
>=20
>> trace_hardirqs_on/off implementation appears to expect to be called in N=
MI=20
>> context though, for some reason.
>=20
> Hurpm, not sure.. I'll have to go grep arch code now :/ The generic NMI
> code didn't touch that stuff.
>=20
> Argh, yes, there might be broken there... damn! I'll go frob around.
>=20

Thanks,
Nick
