Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 909B357FC96
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 11:38:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lrw2c42rhz3cfb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 19:38:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=SpfiMXzU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=5dt6=x6=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=SpfiMXzU;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lrw1z6cq8z2xjm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 19:37:43 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4FEBC612A0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 09:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB258C341C7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 09:37:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="SpfiMXzU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1658741856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3cUpfZrsKgEGJdkkpFrCNXEnszi93Av4FpAsIC0uCa0=;
	b=SpfiMXzUOpap0aBEfAfZZi7o1TEwaCATt4xLMdF0Zred+ymrbuL+5xvQwBCk/R+ObteizU
	ScP65Bn44eIbQOpKP6FA9erfr5zVNhclTelPIeQ09uYgfHkIibo7kdbhd/QmZgO51srDdk
	ROpeJfuW2p4cPnz4Ko230z76w+vfIPs=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f516eb2b (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
	for <linuxppc-dev@lists.ozlabs.org>;
	Mon, 25 Jul 2022 09:37:36 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id 65so4280983ybd.13
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 02:37:36 -0700 (PDT)
X-Gm-Message-State: AJIora8zmhebW3eRDwsOGoINokvMuQqoiPfjdhOkkL8SEre3t8UAZkQj
	G6scNaTOZFB5zEaxyZP4ca4e0l3S4GjdG7eoO/U=
X-Google-Smtp-Source: AGRyM1vtoTUXGG7Jo0TmtRIDj+cf9M1nxJdYxKMZn/u+8fRh8UlxuZYJsVFy/hmuvwvzi2boh3ezXgmA1ZUhN9Iv32Y=
X-Received: by 2002:a5b:70f:0:b0:670:7f57:e46b with SMTP id
 g15-20020a5b070f000000b006707f57e46bmr7841207ybq.24.1658741853953; Mon, 25
 Jul 2022 02:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9qTA90=GEr6h1GZh0CjS+6tpe5uuqkYoJVv79h0zd0w1w@mail.gmail.com>
 <20220719130207.147536-1-Jason@zx2c4.com> <Yt5gBZe9F1BE0MVF@zn.tnic>
 <Yt5hwxC1xgvA8Asw@zx2c4.com> <10561a841a7342c882aabb0fbdbfc762@AcuMS.aculab.com>
In-Reply-To: <10561a841a7342c882aabb0fbdbfc762@AcuMS.aculab.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 25 Jul 2022 11:37:23 +0200
X-Gmail-Original-Message-ID: <CAHmME9p_9j_B2d1h3cKVbv=ucNAa9_grBBW_jdWa8GTbm5WpZg@mail.gmail.com>
Message-ID: <CAHmME9p_9j_B2d1h3cKVbv=ucNAa9_grBBW_jdWa8GTbm5WpZg@mail.gmail.com>
Subject: Re: [PATCH v3] random: handle archrandom with multiple longs
To: David Laight <David.Laight@aculab.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Johannes Berg <johannes@sipsolutions.net>, Harald Freudenberger <freude@linux.ibm.com>, "H . Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Borislav Petkov <bp@suse.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Thomas Gleixner <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 25, 2022 at 11:36 AM David Laight <David.Laight@aculab.com> wrote:
>
> ...
> > More directly, the reason we don't want to error is because the use case
> > has fallbacks meant to handle errors. The cascade looks like this
> > (quoting from the other email):
> >
> >     unsigned long array[whatever];
> >     for (i = 0; i < ARRAY_SIZE(array);) {
> >         longs = arch_get_random_seed_longs(&array[i], ARRAY_SIZE(array) - i);
> >         if (longs) {
> >             i += longs;
> >             continue;
> >         }
> >         longs = arch_get_random_longs(&array[i], ARRAY_SIZE(array) - i);
> >         if (longs) {
> >             i += longs;
> >             continue;
> >         }
> >         array[i++] = random_get_entropy();
> >     }
> >
> > It tries to get the best that it can as much as it can, but isn't going
> > to block or do anything too nuts for that.
>
> Do you really want to retry the earlier calls that returned no data?

Does the above code do that?
