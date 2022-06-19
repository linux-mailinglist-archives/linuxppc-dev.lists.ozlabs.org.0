Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD17E550CF7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jun 2022 22:33:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LR4Gh5Gwwz3cdT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 06:33:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=GqC6I5Te;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=4s8v=w2=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=GqC6I5Te;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LR4G25T7Lz3bZc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jun 2022 06:32:26 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A930861274
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jun 2022 20:32:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6727C3411D
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jun 2022 20:32:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="GqC6I5Te"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1655670738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E43yYKQ93Nj8ZBsO2wdXwId/ptjpjzHFd5icsbHgVck=;
	b=GqC6I5TerNfh9l2Mcco256Fmef6HflorZBDQ0NDeoojcq/i8GEPcoS17TNYd8LL4kkFkzf
	slNAYwQY65wwc87Bo4QEkItaLLXchOLYKbatW4DhYm7Pgf7V5QpaqVZBRBQBdwYknSDYMa
	HCM2mSVrkR2dXiW7PMnwjZ5HaAN6mJ8=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 34cc8f0e (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
	for <linuxppc-dev@lists.ozlabs.org>;
	Sun, 19 Jun 2022 20:32:18 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id l66so14279238ybl.10
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jun 2022 13:32:17 -0700 (PDT)
X-Gm-Message-State: AJIora/UKeFceo+CXHauW7iuDLo3xXgbC4tcrZ/I53lngKZJd/9LG7Op
	zSNvk6qZgwIDpiRBF0K5QI0gfpFVso30MFfHMUA=
X-Google-Smtp-Source: AGRyM1tZ32bZ28frjHDR0YYsFFJW4/YL3Si9ca7cVn+cWmRP8nzQzoDRZHpvCijN6G+esDqpLb1Q0ccATdsA4PgL8nU=
X-Received: by 2002:a5b:dcf:0:b0:64a:6923:bbba with SMTP id
 t15-20020a5b0dcf000000b0064a6923bbbamr22761168ybr.398.1655670737153; Sun, 19
 Jun 2022 13:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220611151015.548325-1-Jason@zx2c4.com> <20220611151015.548325-3-Jason@zx2c4.com>
 <87czf4c1q1.fsf@mpe.ellerman.id.au>
In-Reply-To: <87czf4c1q1.fsf@mpe.ellerman.id.au>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 19 Jun 2022 22:32:06 +0200
X-Gmail-Original-Message-ID: <CAHmME9rWkvDDYHPi-TJR-ATts6pLPY6D8LUaYDJ-=7w7qsFCvg@mail.gmail.com>
Message-ID: <CAHmME9rWkvDDYHPi-TJR-ATts6pLPY6D8LUaYDJ-=7w7qsFCvg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] powerpc/powernv: wire up rng during setup_arch
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On Sun, Jun 19, 2022 at 1:49 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
> This crashes on power8 because it's too early to call kzalloc() in
> rng_create(), and it's also too early to setup the percpu variables in
> there.
>
> I'll rework it and post a v4.

Oh, darn. Sorry about that. Thanks for reworking it.

Jason
