Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B79705A5ED4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 11:02:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MH1XX574qz3c1S
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 19:02:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ksrEMwGo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ksrEMwGo;
	dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MH1Wx0wrDz3bd4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 19:01:48 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id v5so4266136plo.9
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 02:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc;
        bh=ZsM+Pubh86dNJZPbNsb1xubr5PluY9cW5aAlTnyyxiM=;
        b=ksrEMwGox/KdS8tnvTJL1LuPVoMIKREyu/DU/fJRvdnheYItSIfp/iQzhq338blCNr
         eNRkBd60PyxI4prFnqg1qvB6eb8MU1U2tvgwskptoNmSL2oZGs22/tJmLIWeUJu8h8gl
         yMN5FHBHPyewwbe5irx28Cq7oN3zpeUMtvwR+YCpEaM1Gja/OG7QHDfaLxmqd14JDN0h
         XwR0xnKYyXP10vrC4ofLR/aUACg2Hr6GuJ/6hnEPe3YvTNS1DYrd5kkQh8Wi6HsW15kC
         94Ok8a1MnYr8aBjMZU7S2c9sRXzPorWr8pD9RBk9CqwOG7gIVrVq94t1gMUuBFNo5T2I
         erKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc;
        bh=ZsM+Pubh86dNJZPbNsb1xubr5PluY9cW5aAlTnyyxiM=;
        b=7SwqZppQ8/FxJOO9HhIJiXMzXURwD9jQz63lQxvHsJP6UBFT4NGmMPuY1buHV4M4e4
         ZTNPmY1nE4UdZs02pzoU7VOfZWqVjoKyVGBpv9bDO3rXvSGagmbrnDGMu8WZqjQ74Jfe
         H7h4rjA/L8XLguIDxxa56hVUQcn2Wn6y2FKV0CLbzbTnGOVTf0hCAMVTz/jjgwYeilZz
         +8d3cvuAYWYahaSxMEC2z+ygMoeyt2WlwRV/7SBKCtF/jUTRHRhNwZaSEWufNtUQb6ol
         Dr9jcRRdxI3pOAuRir42mdmNiOcoa+a1zZ26Vg7lrH/+ga1vC6vkT3EhIYcFlhuCdu+l
         D9aw==
X-Gm-Message-State: ACgBeo351u7bpW2IFiWBnqSeqxJ6/1ey0YDC5jbdK0XlgQ/kK/nU3uR2
	rTcvJQMkECp6bLjxHoY81kA=
X-Google-Smtp-Source: AA6agR6DLFbyWQ/quE3yh/lHCixblbHmTVBpnk7eHKlpzdJgcFTirVtyqhxEuQ4sJvCN7xrr9cHreg==
X-Received: by 2002:a17:902:70c6:b0:173:c64:c03b with SMTP id l6-20020a17090270c600b001730c64c03bmr19752192plt.34.1661850105106;
        Tue, 30 Aug 2022 02:01:45 -0700 (PDT)
Received: from localhost (110-175-65-113.tpgi.com.au. [110.175.65.113])
        by smtp.gmail.com with ESMTPSA id a13-20020a170902b58d00b00172f4835f60sm8974438pls.189.2022.08.30.02.01.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 02:01:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Aug 2022 19:01:39 +1000
Message-Id: <CMJ8P06JA9OY.1S8VDV2XRU3W5@bobo>
Subject: Re: [PATCH v2] powerpc: Fix irq_soft_mask_set() and
 irq_soft_mask_return() with sanitizer
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>, "Michael Ellerman"
 <mpe@ellerman.id.au>, "Segher Boessenkool" <segher@kernel.crashing.org>
X-Mailer: aerc 0.11.0
References: <c0b486e782b6695092dcdb2cd340a3d44c8c266d.1661272738.git.christophe.leroy@csgroup.eu> <CMJ3VICKD1CI.SVFJOKYJPKZQ@bobo> <e022754d-b4d3-bc9f-cc79-2cf556180459@csgroup.eu>
In-Reply-To: <e022754d-b4d3-bc9f-cc79-2cf556180459@csgroup.eu>
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
Cc: Zhouyi
 Zhou <zhouzhouyi@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Aug 30, 2022 at 3:24 PM AEST, Christophe Leroy wrote:
>
>
> Le 30/08/2022 =C3=A0 07:15, Nicholas Piggin a =C3=A9crit=C2=A0:
> > On Wed Aug 24, 2022 at 2:39 AM AEST, Christophe Leroy wrote:
> >> In ppc, compiler based sanitizer will generate instrument instructions
> >> around statement WRITE_ONCE(local_paca->irq_soft_mask, mask):
> >>
>
> [...]
>
> >>
> >> If there is a context switch before "stb     r9,2354(r31)", r31 may
> >> not equal to r13, in such case, irq soft mask will not work.
> >>
> >> The same problem occurs in irq_soft_mask_return() with
> >> READ_ONCE(local_paca->irq_soft_mask).
> >=20
> > WRITE_ONCE doesn't require address generation to be atomic with the
> > store so this is a bug without sanitizer too. I have seen gcc put r13
> > into a nvgpr before.
> >=20
> > READ_ONCE maybe could be argued is safe in this case because data
> > could be stale when you use it anyway, but pointless and risky
> > in some cases (imagine cpu offline -> store poison value to irq soft
> > mask.
> >=20
> >> This patch partially reverts commit ef5b570d3700 ("powerpc/irq: Don't
> >> open code irq_soft_mask helpers") with a more modern inline assembly.
> >>
> >> Reported-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> >> Fixes: ef5b570d3700 ("powerpc/irq: Don't open code irq_soft_mask helpe=
rs")
> >> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> >> ---
> >> v2: Use =3Dm constraint for stb instead of m constraint
> >> ---
> >>   arch/powerpc/include/asm/hw_irq.h | 9 ++++++---
> >>   1 file changed, 6 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/=
asm/hw_irq.h
> >> index 26ede09c521d..815420988ef3 100644
> >> --- a/arch/powerpc/include/asm/hw_irq.h
> >> +++ b/arch/powerpc/include/asm/hw_irq.h
> >> @@ -113,7 +113,11 @@ static inline void __hard_RI_enable(void)
> >>  =20
> >>   static inline notrace unsigned long irq_soft_mask_return(void)
> >>   {
> >> -	return READ_ONCE(local_paca->irq_soft_mask);
> >> +	unsigned long flags;
> >> +
> >> +	asm volatile("lbz%X1 %0,%1" : "=3Dr" (flags) : "m" (local_paca->irq_=
soft_mask));
> >> +
> >> +	return flags;
> >>   }
> >>  =20
> >>   /*
> >> @@ -140,8 +144,7 @@ static inline notrace void irq_soft_mask_set(unsig=
ned long mask)
> >>   	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
> >>   		WARN_ON(mask && !(mask & IRQS_DISABLED));
> >>  =20
> >> -	WRITE_ONCE(local_paca->irq_soft_mask, mask);
> >> -	barrier();
> >> +	asm volatile("stb%X0 %1,%0" : "=3Dm" (local_paca->irq_soft_mask) : "=
r" (mask) : "memory");
> >=20
> > This is still slightly concerning to me. Is there any guarantee that th=
e
> > compiler would not use a different sequence for the address here?
> >=20
> > Maybe explicit r13 is required.
> >=20
>
> local_paca is defined as:
>
> 	register struct paca_struct *local_paca asm("r13");
>
> Why would the compiler use another register ?

Hopefully it doesn't. Is it guaranteed that it won't?

> If so, do we also have an=20
> issue with the use of current_stack_pointer in irq.c ?

What problems do you think it might have?  I think it may be okay
because we're only using it to check what stack we are using so doesn't
really matter what value it is when we sample it.

The overflow check similarly probably doesn't matter the exact value.

> Segher ?

I'm sure Segher will be delighted with the creative asm in __do_IRQ
and call_do_irq :) *Grabs popcorn*

Thanks,
Nick
