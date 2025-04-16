Return-Path: <linuxppc-dev+bounces-7675-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B564EA8ADA5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Apr 2025 03:47:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZckSB32bLz3bkG;
	Wed, 16 Apr 2025 11:47:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744767557;
	cv=none; b=Lv0AQwD1Q12gz7OJyWRy8cHJtlZe0/Hgt7SYGxC4+u+1DnF4JUBFQzoaPN6VC9H9pRfKXozyae1hnLa7Y0nlyJ6Ohku8DCGOXSIGYLGy/+RQ6G9IF/XAD7wuwCWkfL4BDPVEi5zATRBAtQkBfSNORWhTIPUtl5ohQmQ40hTHGeB+ju+TyqJKo+5lSYOwNeKehQc9KFo8EnQoC8hgsNQSFDEqZU8ka+4X2Pql/D4wh3EFPEHO/YIRCld+kU3zlk+hpm+3Uq/PsKohQDJaKXO6CqOaGvLlUAR+VR5lkW0ZwKDeadmZ1rSX46bMoFfD5S7LfLUrSZcVQuQhUIIwgpRihQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744767557; c=relaxed/relaxed;
	bh=V1HXQ+Xi113ayzUNabjj8NTshwQmo5mZvOv0N53Neb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RpugTkOKd9AlgrWNiXbGW3NaiWXW+vt9vlP3RfdM6IEkikSIYRjks0U0l+vzwdvnVOue/f5dNpim2P4kuFbOiDlbvRalGeOsXEZxkNxq8MfMcMOjZOJAjFAuRmKAEJwJ55WrCbzs6QfcXKwGN0zM7RRZP3qen94BHQm0FCUUzg5srLLS03o1lj/JGGn3kjfEeqI1AM9LDWqAm4QZ+6nVIG6TDQ5aNo2dCZXxXuKSjch2Tf3hHKft4Ymke3t/mOIgrm8a8DzJR6WoNDdmQYbnWIXRg5cYU5v8u9VY6Du7z+kw97I1QCtOiB+GLAGQhUZD3Fuyoo8Fi2kvH8N3x2lcKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass (client-ip=209.85.218.54; helo=mail-ej1-f54.google.com; envelope-from=ngompa13@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.54; helo=mail-ej1-f54.google.com; envelope-from=ngompa13@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZckGD0101z3bkG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Apr 2025 11:39:15 +1000 (AEST)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abec8b750ebso1044751366b.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Apr 2025 18:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744767550; x=1745372350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V1HXQ+Xi113ayzUNabjj8NTshwQmo5mZvOv0N53Neb4=;
        b=YeebG2sUieTipW/Qm4isIiQTcAq+aSk29bXuEX4I5DiKkYKL7m3oIYA++8KlNCNVdY
         gmK8fPdOXAS71xhxtHsMwdvjQoZu76fS782B1kyUtZurYRcIMg+Av1hVAjBPYsFgByXv
         BmZVE/0d2ccO2WcQTeoNb1InLDqzn3QaU9/+iEWKh+Gl/kHeeZtGzdioYrWza+nIUBJs
         8mQukivYxvqnX8519CcRLmePX61cLNX+HX75jlcx7VEZpeI9KoSAcMBbYUtV2HwVcWX4
         Gyj2khlNRADxXCrzsuDkRLO4r2REpJXvIfW4Fv5dl9ScL9vBtntRuEdE+5xB9Tid57+f
         dhEA==
X-Forwarded-Encrypted: i=1; AJvYcCWTgSZ9kFO0FJtSHTBdpgq8IO6RwjG4VnA4JQsIQGXCFkNrdwjC+RdR0KIsb7y5UPFD6z9FanqRleSEJRo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yysid3v71rp0W9igZXjDftMwYHg4b1+prB70MHal+wR+XElVwML
	CmCcHn3XQ3UktrGSyCyB9/5n1petAd0aHdOfQiWT4Bjh0GsMr9bJOI3rWXMuuec=
X-Gm-Gg: ASbGncueoDKBdF/JBFra0pQEwBkLTigQuxNfn3wafMt8WRoLxBnBTd3sinxSdhvg2I/
	F/jrkx0MF8O+VbMAzvUAWRgEhC3Xnv42uZIy8IAuR4zD4XqrOfFQUYyjRqs+24jhvjtRSR8YhqJ
	onUGdv4hBhiX1hUtCNIo44eA+rQaQkVNUQbI18Q4GCYaqVckC3NnxV64Jy3bWHEBAsNws3WLWYq
	CPn+msiSOKjhUTsdBZcic8/AJvA4aZTYQmR0dgknBTg85Hn4hsdUD/My2yxpRa7YrjIcBA7EfMN
	hMMM2Qxk+WxAEDG02F3BvgBHHwrTNChmCVl6W2sXpXLvef6AofVUIQNsX07l8dghi3iyjsw=
X-Google-Smtp-Source: AGHT+IEFwTWRonoukiwbufi5ENweoMwsyw/+hXrSz8MMwwogzfFfL+IS8cIIvzfDn5/9r7UreFMh+g==
X-Received: by 2002:a17:907:9693:b0:ac8:14ad:f3cf with SMTP id a640c23a62f3a-acb38222e6emr89083366b.23.1744767549512;
        Tue, 15 Apr 2025 18:39:09 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cdda65asm29315066b.59.2025.04.15.18.39.08
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 18:39:08 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abec8b750ebso1044745466b.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Apr 2025 18:39:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV7RQCyf5A9ihON1xQbrPzvaR9CTMEAja3zPvqfdOG9f3RAK/dxsdITchjlG2s1/aMyTHM+RWWbY1S88Pw=@lists.ozlabs.org
X-Received: by 2002:a17:907:6ea1:b0:ac6:e327:8de7 with SMTP id
 a640c23a62f3a-acb3849df86mr88724666b.42.1744767548484; Tue, 15 Apr 2025
 18:39:08 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
In-Reply-To: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
From: Neal Gompa <neal@gompa.dev>
Date: Tue, 15 Apr 2025 21:38:32 -0400
X-Gmail-Original-Message-ID: <CAEg-Je9vfqKe8tThUNxy2hKGGMYR4F2RJaKXqaXJx8f856Oncg@mail.gmail.com>
X-Gm-Features: ATxdqUGM2YL7UPwB2q8EHrpPvcO9cfPSM4k-2kB4UVuY2Jof3nZs232BzqVAc98
Message-ID: <CAEg-Je9vfqKe8tThUNxy2hKGGMYR4F2RJaKXqaXJx8f856Oncg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Apple/PASemi i2c error recovery fixes
To: Sven Peter <sven@svenpeter.dev>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Hector Martin <marcan@marcan.st>, linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=2.2 required=3.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Apr 15, 2025 at 11:37=E2=80=AFAM Sven Peter via B4 Relay
<devnull+sven.svenpeter.dev@kernel.org> wrote:
>
> Hi,
>
> This series adds a few fixes/improvements to the error recovery for
> Apple/PASemi i2c controllers.
> The patches have been in our downstream tree and were originally used
> to debug a rare glitch caused by clock strechting but are useful in
> general. We haven't seen the controller misbehave since adding these.
>
> Best,
>
> Sven
>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
> Changes in v2:
> - Added commit to use the correct include (bits.h instead of bitfield.h)
> - Added commit to sort includes
> - Moved timeout explanations to code instead of just the commit log
> - Made timeout recovery also work correctly in the interrupt case when
>   waiting for the condition failed
> - Used readx_poll_timeout instead of open-coded alternative
> - Link to v1: https://lore.kernel.org/r/20250222-pasemi-fixes-v1-0-d7ea33=
d50c5e@svenpeter.dev
>
> ---
> Hector Martin (3):
>       i2c: pasemi: Improve error recovery
>       i2c: pasemi: Enable the unjam machine
>       i2c: pasemi: Log bus reset causes
>
> Sven Peter (3):
>       i2c: pasemi: Use correct bits.h include
>       i2c: pasemi: Sort includes alphabetically
>       i2c: pasemi: Improve timeout handling
>
>  drivers/i2c/busses/i2c-pasemi-core.c | 114 ++++++++++++++++++++++++++++-=
------
>  drivers/i2c/busses/i2c-pasemi-pci.c  |  10 +--
>  2 files changed, 96 insertions(+), 28 deletions(-)
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250220-pasemi-fixes-916cb77404ba
>

The series looks good to me, especially the new patches.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

