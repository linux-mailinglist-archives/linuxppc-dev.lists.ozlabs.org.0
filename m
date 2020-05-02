Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F06731C2259
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 04:42:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49DYLR0tnnzDrPK
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 12:42:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YP74+PsJ; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49DYJq2rJtzDrF0
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 May 2020 12:40:58 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id d24so4325435pll.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 May 2020 19:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=yl0NmRAPt/corybZfKso38uM2aqqxL5PZ2hABKdQ7SY=;
 b=YP74+PsJfaxz9JUEd2YWTVelZEI0LRDqfdwryBCj6CUfTjqdbP8IDhsUqdgr5p48n4
 ylkHqSKE0+CAXmRPWBqAB78fl5BOWjF7DAkqB8Z36LTni9BsNJAQ3BiTQef9V+MAP8Tu
 9rLOlNsSnIR9UQqcuIuLO89K07i6JFyPCXIixuwu1zmkD9fCkyUeKCxk9q4W+tApCJe+
 90wGY19Dod1FqX4RCShLXW+XMkBbHp8fd/C6tizQOMZZsU6oCIMX5wvfFzAIRTpdxolp
 UBYHfvqMKSBlKaR9Oz14fvzAhLc1u+0KU64kQhOHKL3e7ASNu0rDn3c4xTJ/dfBoAC3x
 eN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=yl0NmRAPt/corybZfKso38uM2aqqxL5PZ2hABKdQ7SY=;
 b=G0jKdZov8hQLGz4On9O11sIrfHxO1Ogy31yEgLOyKkhBlg7ITvxN0e4mWy0u4jzhBY
 brPOSKNW3X3IlFoZndYjCcwiQ9MyNay2EUUVLLg/OCJmlI1+oFyBdDOUSTbofdYTzFKt
 64HjPIFpKjq52LqYJKYaOcP7RETUrHm7kJYi81tsoBlh4jMbGvtqbE7av6Hl4eVzt65D
 HlJLzzdqfEPgrWQeG3M0ALAxHdnaqn15cQlZUgN0dMizofn+o4hVZ5RLN+Sw3uzPu5J4
 FNFF8mKISybXObd3YYzBNDddKyq3sziQD0keBGOpq6Iw86TRyqVkC0kfIjGgxAGCxhL/
 pLcw==
X-Gm-Message-State: AGi0PuaI8kB0+29pnF1yZ9fzaoW5jS9ha6MRmb2woTkZ+B094/48zg9L
 g59R7KFEYRxyxsX5z3BKnhQ=
X-Google-Smtp-Source: APiQypLmaCY8tZPEjJga3GQVCrsSiQt4ZgxhJn/DCgosnCbK6pDlyrANryn+nFFM58ptlhM3sY4+VQ==
X-Received: by 2002:a17:90a:ba84:: with SMTP id
 t4mr3100214pjr.81.1588387254786; 
 Fri, 01 May 2020 19:40:54 -0700 (PDT)
Received: from localhost ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id gv7sm821538pjb.16.2020.05.01.19.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 19:40:54 -0700 (PDT)
Date: Sat, 02 May 2020 12:40:34 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: 5.7-rc interrupt_return Unrecoverable exception 380
To: Hugh Dickins <hughd@google.com>
References: <alpine.LSU.2.11.2005011253250.3734@eggly.anvils>
In-Reply-To: <alpine.LSU.2.11.2005011253250.3734@eggly.anvils>
MIME-Version: 1.0
Message-Id: <1588386603.8cl0cdd0nk.astroid@bobo.none>
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
Cc: Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Hugh Dickins's message of May 2, 2020 6:38 am:
> Hi Nick,
>=20
> I've been getting an "Unrecoverable exception 380" after a few hours
> of load on the G5 (yes, that G5!) with 5.7-rc: when interrupt_return
> checks lazy_irq_pending, it crashes at check_preemption_disabled+0x24
> with CONFIG_DEBUG_PREEMPT=3Dy.
>=20
> check_preemption_disabled():
> lib/smp_processor_id.c:13
>    0:	7c 08 02 a6 	mflr    r0
>    4:	fb e1 ff f8 	std     r31,-8(r1)
>    8:	fb 61 ff d8 	std     r27,-40(r1)
>    c:	fb 81 ff e0 	std     r28,-32(r1)
>   10:	fb a1 ff e8 	std     r29,-24(r1)
>   14:	fb c1 ff f0 	std     r30,-16(r1)
> get_current():
> arch/powerpc/include/asm/current.h:20
>   18:	eb ed 01 88 	ld      r31,392(r13)
> check_preemption_disabled():
> lib/smp_processor_id.c:13
>   1c:	f8 01 00 10 	std     r0,16(r1)
>   20:	f8 21 ff 61 	stdu    r1,-160(r1)
> __read_once_size():
> include/linux/compiler.h:199
>   24:	81 3f 00 00 	lwz     r9,0(r31)
> check_preemption_disabled():
> lib/smp_processor_id.c:14
>   28:	a3 cd 00 02 	lhz     r30,2(r13)
>=20
> I don't read ppc assembly, and have not jotted down the registers,
> but hope you can make sense of it. I get around it with the patch
> below (just avoiding the debug), but have no idea whether it's a
> necessary fix or a hacky workaround.

Hi Hugh,

Thanks for the report, nice catch. Your fix is actually the correct one=20
(well, we probably want a __lazy_irq_pending() variant which is to be=20
used in these cases).

Problem is MSR[RI] is cleared here, ready to do the last few things for=20
interrupt return where we're not allowed to take any other interrupts.

SLB interrupts can happen just about anywhere aside from kernel text,=20
global variables, and stack. When that hits, it appears to be=20
unrecoverable due to RI=3D0.

We could clear just MSR[EE] for asynchronous interrupts, then check=20
lazy_irq_pending(), and then clear MSR[RI] ready to return, and the
SLB miss in the debug check would be fine. But that's two mtmsr=20
instructions, which is slower. So we'll skip the check.

I tested hash, and preempt, possibly even preempt+hash, but clearly not=20
preempt+preempt_debug+hash+slb thrashing!

Thanks,
Nick

>=20
> Hugh
>=20
> --- 5.7-rc3/arch/powerpc/include/asm/hw_irq.h	2020-04-12 16:24:29.8027697=
27 -0700
> +++ linux/arch/powerpc/include/asm/hw_irq.h	2020-04-27 11:31:10.000000000=
 -0700
> @@ -252,7 +252,7 @@ static inline bool arch_irqs_disabled(vo
> =20
>  static inline bool lazy_irq_pending(void)
>  {
> -	return !!(get_paca()->irq_happened & ~PACA_IRQ_HARD_DIS);
> +	return !!(local_paca->irq_happened & ~PACA_IRQ_HARD_DIS);
>  }
> =20
>  /*
>=20
