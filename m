Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAAE579D21
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 14:47:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnJWf4B5lz3chx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 22:47:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=orkHbPvm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=tnjg=xy=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=orkHbPvm;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LnJW10Sc9z2xmw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jul 2022 22:46:52 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 92F3B61737
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jul 2022 12:46:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB0FC341CF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jul 2022 12:46:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="orkHbPvm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1658234804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0M1RG9G8cO37nst2CD7DZ89TkqR9zkT7SUAp4B3bFOM=;
	b=orkHbPvmh6q5POuNqNQH1spr0aScRPGyZ7oXanlg68fil/7h/19PejEl4f1pwSHLoAmcIV
	V2f6KVxx+ALuprKlhga/EvwF53pj8Mk52asCsYsis1Jj1IVNESFZl34vlmgnxJyLUhHuep
	27JHgQYYlRkZPwkVGBqhthNjepG1c3o=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b82755ec (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
	for <linuxppc-dev@lists.ozlabs.org>;
	Tue, 19 Jul 2022 12:46:44 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id e16so7093905qka.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jul 2022 05:46:43 -0700 (PDT)
X-Gm-Message-State: AJIora8wTuvhb619hTeQvhiIFjER8NEnZjC7UocPMrSPH3/iABdQYlJF
	FKhplRKohqirff+5Xrok12KhWiS8Cr2wjPQ8T5A=
X-Google-Smtp-Source: AGRyM1t2xq+LcMrIzmoeK42JgLdc9jD9mAg3j5fHR2WcBcobwuU+HIL3Q4G9gniTA5GYzRlJybQa0yDZOX953fr+g+E=
X-Received: by 2002:a05:620a:4552:b0:6b5:fc9f:e7a7 with SMTP id
 u18-20020a05620a455200b006b5fc9fe7a7mr2138601qkp.65.1658234802386; Tue, 19
 Jul 2022 05:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <YtP1+MJ1tNdJA60l@zx2c4.com> <20220717200356.75060-1-Jason@zx2c4.com>
 <YtamvPvl04ByTrVp@FVFF77S0Q05N>
In-Reply-To: <YtamvPvl04ByTrVp@FVFF77S0Q05N>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 19 Jul 2022 14:46:31 +0200
X-Gmail-Original-Message-ID: <CAHmME9qTA90=GEr6h1GZh0CjS+6tpe5uuqkYoJVv79h0zd0w1w@mail.gmail.com>
Message-ID: <CAHmME9qTA90=GEr6h1GZh0CjS+6tpe5uuqkYoJVv79h0zd0w1w@mail.gmail.com>
Subject: Re: [PATCH v2] random: handle archrandom in plural words
To: Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-s390@vger.kernel.org, "H . Peter Anvin" <hpa@zytor.com>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Heiko Carstens <hca@linux.ibm.com>, X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Johannes Berg <johannes@sipsolutions.net>, Catalin Marinas <catalin.marinas@arm.com>, Harald Freudenberger <freude@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Borislav Petkov <bp@suse.de>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mark,

On Tue, Jul 19, 2022 at 2:42 PM Mark Rutland <mark.rutland@arm.com> wrote:
> > -static inline bool __must_check arch_get_random_long(unsigned long *v)
> > +static inline size_t __must_check arch_get_random_words(unsigned long *v, size_t words)
>
> As others have suggested, could we please s/words/longs/? That's a smaller
> change from the existing name, and avoids amibugity were "word" has an
> architecture-specific meaning. e.g. the ARM ARM (ARM DDI 0487G.b) defines:

At first I had thought, "erm, I like 'words'" but decided to wait it
out, and now it's two people with the same probably good objection to
'words', so I'll send a v+1 with 'longs' instead. Thanks for your
feedback. Patch incoming.

> FWIW, other than the naming nits, the arm64 bits look fine to me.

Oh good. Can you send an Acked-by for v+1? Coming up shortly.

Jason
