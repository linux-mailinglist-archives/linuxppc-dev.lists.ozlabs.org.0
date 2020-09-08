Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 190EF260C63
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 09:49:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bly2k2SLRzDqQW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 17:49:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pLZi3/af; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bly0Z3XwMzDqNs
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Sep 2020 17:47:09 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id v15so9462580pgh.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Sep 2020 00:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=esWxwITpd48A7faZUHJwZ9TUfahg+Tdi9MtHhXdhMj0=;
 b=pLZi3/afb7HbD/9HfHNXuNaEOQcA3XkxQ4Cu65yzGQ2T9sqjX25pDoBDquT161zLnS
 ijBaQzHhCbpRzkJkkTQ9zF3XaT4YeB6aKjAzpPHzFXv096DZABaO9ERjV+qeBibCe/93
 g6EOGMvku0guNP3rF/aFt2+tIb3k6LsL6SF+0Gt4adzy5XFMo9796IqgZQvhVb5gm0Lm
 +uNzE7NfWtToEvtOedThkqe//lgstYf+iFf5LBHD0mfRz73w/4VX0FG5u0aQe7Gwo8wn
 0C18yu/8doOGv95Tjaqo8CzDUNrQhacxrg0lNiYme+YMtuZWPKjUobFvVnHfy5wjlw6b
 7Xmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=esWxwITpd48A7faZUHJwZ9TUfahg+Tdi9MtHhXdhMj0=;
 b=Ky0f6MtdNCZGLtPHi+rx9FQsWBkIozhqm45INO1kVGGo/NgXPcyHurItN9U38UJqPj
 prAMQO69gJePsdv5MVt+4F14Crwpn99yDL39MZcJEnzOtyBhj29fn5+JqYrZrl8hbqwn
 tT2Z7UrHsl4IO8DossGVdn1NHHcmeUPlSONMITho5ikKw1cEevl3lCCcvo7wBKKI8rRz
 SyVXsFRKm3wdh9CIX/9/5ExwEoOvCQtyPdhw5hTEv8HF39PLMItTOL1fqUTuwcGO1XFL
 T0Hqor3urjATQxLLiBYt4UR1Qegyg6ODLWHl3wt/eiHdF96t5Azf5/7Oax3ZzyAWV27u
 Y8lg==
X-Gm-Message-State: AOAM530WloiR2u20YJOvLSYffVMiKRC33Ow35hky8/cNF3FJbin/8ihV
 Ml5m/Z0Vl4G9G37ryBrRbMTD9FCYF60=
X-Google-Smtp-Source: ABdhPJzR9MjIvoxxFvUhB0KWuliPG1EQYoIGrlqd3YyhUxY+9j8CTlUjw+7qow0DGAFltEEL0IaUCw==
X-Received: by 2002:a62:7c82:0:b029:13c:1611:66b9 with SMTP id
 x124-20020a627c820000b029013c161166b9mr21961340pfc.4.1599551225882; 
 Tue, 08 Sep 2020 00:47:05 -0700 (PDT)
Received: from localhost ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id u27sm3160683pgm.60.2020.09.08.00.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 00:47:05 -0700 (PDT)
Date: Tue, 08 Sep 2020 17:46:58 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 02/12] powerpc: remove arguments from interrupt
 handler functions
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20200905174335.3161229-1-npiggin@gmail.com>
 <20200905174335.3161229-3-npiggin@gmail.com>
 <e34fead9-a356-3ae6-aa33-544380230bd5@csgroup.eu>
In-Reply-To: <e34fead9-a356-3ae6-aa33-544380230bd5@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1599550991.5091a1442f.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of September 7, 2020 7:20 pm:
>=20
>=20
> Le 05/09/2020 =C3=A0 19:43, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Make interrupt handlers all just take the pt_regs * argument and load
>> DAR/DSISR etc from that. Make those that return a value return long.
>=20
> I like this, it will likely simplify a bit the VMAP_STACK mess.
>=20
> Not sure it is that easy. My board is stuck after the start of init.
>=20
>=20
> On the 8xx, on Instruction TLB Error exception, we do
>=20
> 	andis.	r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 bits */
>=20
> On book3s/32, on ISI exception we do:
> 	andis.	r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 bits */
>=20
> On 40x and bookE, on ISI exception we do:
> 	li	r5,0			/* Pass zero as arg3 */
>=20
>=20
> And regs->dsisr will just contain nothing
>=20
> So it means we should at least write back r5 into regs->dsisr from there=20
> ? The performance impact should be minimal as we already write _DAR so=20
> the cache line should already be in the cache.

Yes, I think that would be required. Sorry I didn't look closely at
32 bit.

> A hacky 'stw r5, _DSISR(r1)' in handle_page_fault() does the trick,=20
> allthough we don't want to do it for both ISI and DSI at the end, so=20
> you'll have to do it in every head_xxx.S
>=20
>=20
> While you are at it, it would probably also make sense to do remove the=20
> address param of bad_page_fault(), there is no point in loading back=20
> regs->dar in handle_page_fault() and machine_check_8xx() and=20
> alignment_exception(), just read regs->dar in bad_page_fault()
>=20
> The case of do_break() should also be looked at.

Yeah that's valid, I didn't do that because bad_page_fault was also
being called from asm, but an incremental patch should be quite easy.

> Why changing return code from int to long ?

Oh it's to make the next patch work without any changes to function
prototypes. Some handlers are returning int, others long. There is
no reason not to just return long AFAIKS so that's what I changed to.

Thanks,
Nick
