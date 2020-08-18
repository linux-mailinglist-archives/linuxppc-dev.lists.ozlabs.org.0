Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F23249198
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 01:56:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWSW64nBLzDqtN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 09:56:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gMyjMFHM; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWST70r8bzDqrW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 09:55:06 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id 74so10728710pfx.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 16:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=7422GZO6a07uIkKor7gPEwTDJ5nsCQ3Ry5yAt5O8lbE=;
 b=gMyjMFHMZ82HKryOjvxwx+F/WntkodrlGmMyg6R7N0IHb5pHbZJ2k0ralLblXfYqL/
 HQZjT2RKaUaN3Uk3JabTmTarIRkc3O68LG7LcQH8kYO86uTGmkxmC9Ytu/uttNCVZa2o
 x3obkAAD8V+AhQ0gZu2rje3wjt0tugdGmVYAwn1DUd2a0Lt/pCFhkrAI/1sFTvK2+ZrH
 8bsq4C+a5mGB7fkRfk8nDdyDoV7XhBrorbH+5b5BDCVx6zy1RK7cx4R2mmh8fIFE+Lba
 qsiBqHi5nQQiyojMGEz1nD9G4jfH0RSejMBTfanRtuUDRIbO/WFS5JiKmxNHmj5fbCNB
 fxow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=7422GZO6a07uIkKor7gPEwTDJ5nsCQ3Ry5yAt5O8lbE=;
 b=PmRW9QRdhWoZnI5ARFvfzCu5n0BEbdFrpxHVdiGKf6CTkzl0jgLShgD8zAzfmpinj9
 9DLL5426dbaTPL/4fuBHu0vJRiOEpCMUBNsekjGmELnU+N2z7xFYkYFPxnTS3Qdrenma
 3FyXt3Y63i0tJfHWlqJHL9egk2eCmVht7UX34jucRWwv+J0lKjo+DV/9pxdTzo665TCL
 cvkyE8tr2YlqibKKPn9fpDgHkw1UZC7xHoGj/BsyRm3Ug3K923s+XbsOJIGXpO7SCniW
 WOGZ7ZbOIaAmxbj8x4JDcDhffmyTu6S98nj1CFJ72ceAaySYzsFYljE7hUasAasCOR4h
 wcTg==
X-Gm-Message-State: AOAM532vGkhyuBYJFMQfy51U91AVZBDMu04931jB5dPVKk8vlP6y2qO6
 lXQufUlfQJICD5nYs7pomgw=
X-Google-Smtp-Source: ABdhPJyzpeAN/fom5Hv0bXjaUwSL/42Sf1RXPTAqHPvb7BVJcMMUtDCYGB20BWOdQLzx7mJ5D5fnvg==
X-Received: by 2002:a63:471b:: with SMTP id u27mr14757480pga.139.1597794903474; 
 Tue, 18 Aug 2020 16:55:03 -0700 (PDT)
Received: from localhost (193-116-193-175.tpgi.com.au. [193.116.193.175])
 by smtp.gmail.com with ESMTPSA id q12sm27030752pfg.135.2020.08.18.16.55.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 16:55:02 -0700 (PDT)
Date: Wed, 19 Aug 2020 09:54:57 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] lockdep: improve current->(hard|soft)irqs_enabled
 synchronisation with actual irq state
To: peterz@infradead.org
References: <20200723105615.1268126-1-npiggin@gmail.com>
 <20200807111126.GI2674@hirez.programming.kicks-ass.net>
 <1597220073.mbvcty6ghk.astroid@bobo.none>
 <20200812103530.GL2674@hirez.programming.kicks-ass.net>
 <1597735273.s0usqkrlsk.astroid@bobo.none>
 <20200818154143.GT2674@hirez.programming.kicks-ass.net>
In-Reply-To: <20200818154143.GT2674@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Message-Id: <1597793862.l8c4pmmzpq.astroid@bobo.none>
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

Excerpts from peterz@infradead.org's message of August 19, 2020 1:41 am:
> On Tue, Aug 18, 2020 at 05:22:33PM +1000, Nicholas Piggin wrote:
>> Excerpts from peterz@infradead.org's message of August 12, 2020 8:35 pm:
>> > On Wed, Aug 12, 2020 at 06:18:28PM +1000, Nicholas Piggin wrote:
>> >> Excerpts from peterz@infradead.org's message of August 7, 2020 9:11 p=
m:
>> >> >=20
>> >> > What's wrong with something like this?
>> >> >=20
>> >> > AFAICT there's no reason to actually try and add IRQ tracing here, =
it's
>> >> > just a hand full of instructions at the most.
>> >>=20
>> >> Because we may want to use that in other places as well, so it would
>> >> be nice to have tracing.
>> >>=20
>> >> Hmm... also, I thought NMI context was free to call local_irq_save/re=
store
>> >> anyway so the bug would still be there in those cases?
>> >=20
>> > NMI code has in_nmi() true, in which case the IRQ tracing is disabled
>> > (except for x86 which has CONFIG_TRACE_IRQFLAGS_NMI).
>> >=20
>>=20
>> That doesn't help. It doesn't fix the lockdep irq state going out of
>> synch with the actual irq state. The code which triggered this with the
>> special powerpc irq disable has in_nmi() true as well.
>=20
> Urgh, you're talking about using lockdep_assert_irqs*() from NMI
> context?
>=20
> If not, I'm afraid I might've lost the plot a little on what exact
> failure case we're talking about.
>=20

Hm, I may have been a bit confused actually. Since your Fix=20
TRACE_IRQFLAGS vs NMIs patch it might now work.

I'm worried powerpc disables trace irqs trace_hardirqs_off()
before nmi_enter() might still be a problem, but not sure
actually. Alexey did you end up re-testing with Peter's patch
or current upstream?

Thanks,
Nick
