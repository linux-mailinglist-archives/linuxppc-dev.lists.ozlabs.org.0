Return-Path: <linuxppc-dev+bounces-12065-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA9DB543DD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 09:29:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNQzZ49YXz3clh;
	Fri, 12 Sep 2025 17:29:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::130"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757662170;
	cv=none; b=K5TKqTljjrs4T82gKYDkUAn+gADCIEK6zB9ombJPmwoRHDBqG4bRUHm+dcFNx94RpEuoRXKnjgHDJzMpt+jm966bWfjoDDivrV50SUDSV4fw1sqyYcLih1GXPzlwG7yhbmu/PoMRdoJJkrb1UYa9qqrR/dDtjFjirDO+dc3WXofA5iONTvXiuJaQDAc6dgRaf1mKCki2j9PnEPXBwB6gBu4t61LQKNnV/34qfnc4NOoulQb5gsvGVwppMqXEI6JtKR2J0YQNqrbgYaDHHYpPbmFDn3GHQerEhFuRA/HiCONpr3cX1KS5CzxR3DInOOG0Mvfz4zKBacmUSOgYYG5OUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757662170; c=relaxed/relaxed;
	bh=FkCjzP4vhD32bSP1mBlLDiHz0GdzVd/VyBKFM+8O2pc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iHnCjmJxSjYqQFbjpWS3DHYwrj/y7jY8rXq5UsVAAmpA8j+muDNSLtnbj40LqelDy9S7PDCRNkwY7BtopZ+HNsbTLuZryJKCcm79o1tSHe5xEca+obxZ9XYO1M9kf2p8eBOTvOcTc6MuVWnegkSn4V0O1VTYqyed/HoPu+lRDle9AV9TVIsSywEAQmONoEt9yMShQsrjPbg2ha+6eFC9ou3N3tZuduGGXNkP8I7i0lvu2Vc9OUhe3Q0Ng+N83VYtmWDqW2Ecz3TCGM+3LXQTYvTW9r/RNiEDIowUQijURNouBOjpeW1DOIfitnpORmO3gHSaWxL0VekPV0Yje5o6mg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=2aEDqRYX; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=2aEDqRYX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNQzY2Zxtz3cjt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 17:29:29 +1000 (AEST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-55f68d7a98aso1747843e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 00:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757662165; x=1758266965; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FkCjzP4vhD32bSP1mBlLDiHz0GdzVd/VyBKFM+8O2pc=;
        b=2aEDqRYXYy8RLlepru9E518Ng6hzv4uTltflkFXy3ISAsTRCvsa3JpVLOnMKEjnVlc
         KIrwxlKOJvxiPo1T3uAYTxkkV6BdyMV3jV66YFjy6k4P2H3YIXpLn3adZ+SNVqiAwA97
         5vdpN96CspqK23oRwgy9rxMAzPlWmsLlNBc57FJ76j1ky7VAkxqxdlYyPSn9BD6UOiIn
         qtR3zg+tPWfp4xX8fe7SuWRFOsJvry9FVFabZP356WQoK9DWKubKXiVjN5AAJvIV2a9e
         FtnGefVNIdjRz+9Rmszkid6rODZdVsHNMNtqfNgrZv9OSuEcM27iO+istcGJ6ySBW69j
         +tJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757662165; x=1758266965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FkCjzP4vhD32bSP1mBlLDiHz0GdzVd/VyBKFM+8O2pc=;
        b=fyPtLzZpZVQdTObR5EWwNfLiBjvzcgBzszOWUvS7U72/EJnSIKLyqlbITkplWGrL9U
         8unAa9z2Qev54VuFTj7AivuLd+CbsqQwzJg/XFZHdmhkC7w5xJj7zTTTFYhJItflIoOD
         HZ8Bbq+TPZ/2VrzSM27cZyH93VTYEX/ONiJ8TNTgHzo4KgmFkNTwPjHop7ugMNMmixaZ
         eaztQtoUbCOzS/s/iTfHvU56/q1ZurXkYIXHFYd1RLOSr5EEP0JGWQeULKqlOAbaS9wH
         kCRrocsUPCm+SvXzxHME+U4xeqaUINr301JZkueuL/4ETT0qSP5rRBYt03rZeO08f0AM
         MUgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUybSA4n/UgmUaX6Mf0iI5kWwY5fk2QHyLSM3RAYale2fxHmyZNftFCJpt7EKKKtlDAse7YXkmbjI2MzNc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwEuGu3mLWKuaxzrjsxg/1I1hrvDGVuFGPUzkx4T5Na7IarHPrq
	1PA4ebngxF4b95wvv9j5H2NWis6cqlyO+5Qe3y52GPE6yU9AXk4HB1L6OISe5QleSUHd5kW/nRm
	HWgDKBvBYeBsnPps2Q/uZxWy4H7mpKEXymb95hZyIXQ==
X-Gm-Gg: ASbGncu1SLVYj1e0hnzm61UM1/z3M1xjAq8z1XY1c0ya44t0Vagve2ImE4oDl8BQevf
	oQbFEbTihBQmM/UOOvo9PX3RJhRijhWpqsddPES6IyWMFhi5Q5kZlO/XLtFp6OzBPJPFQCZg9pj
	nqwTB8FviBiPIJME7U2C3jkPKwFZPOlCmbZE0nBCR858G6JWQYcsjxjiJIMQ4Itn2XLvqPVo9WT
	DzJ1Rl5FTvxGdjdvLNGcWLZGsE09nLXTQyX8Q==
X-Google-Smtp-Source: AGHT+IFvPcTXQ6WIkQFzLqofqGaeCWwE5V3dpGC1EHzT5ohZgdbDh85iVg7RukP92bY0eYj/+7Dm5YzYYq8NvDagHtk=
X-Received: by 2002:a05:6512:3d25:b0:55f:4746:61d6 with SMTP id
 2adb3069b0e04-5704bec62f4mr779028e87.16.1757662164848; Fri, 12 Sep 2025
 00:29:24 -0700 (PDT)
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
Precedence: list
MIME-Version: 1.0
References: <9652736ef05b94d9113ea5ce7899734ef82343d1.1755520794.git.christophe.leroy@csgroup.eu>
 <175764920912.610338.13254301742963097094.b4-ty@linux.ibm.com>
In-Reply-To: <175764920912.610338.13254301742963097094.b4-ty@linux.ibm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 12 Sep 2025 09:29:12 +0200
X-Gm-Features: Ac12FXzlO0BlEMfk4QQsvjbiy-zbMbEg9ajjT3EbChQkXyCvmLeQtRGDcFX-Szw
Message-ID: <CAMRc=MchCnTusmP=1rKco908f7CxHcb6REXx7far=1Pp_dq9Aw@mail.gmail.com>
Subject: Re: [PATCH] gpio: mpc5200: Drop legacy-of-mm-gpiochip.h header
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Anatolij Gustschin <agust@denx.de>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Sep 12, 2025 at 5:55=E2=80=AFAM Madhavan Srinivasan <maddy@linux.ib=
m.com> wrote:
>
> On Mon, 18 Aug 2025 14:42:24 +0200, Christophe Leroy wrote:
> > Remove legacy-of-mm-gpiochip.h header file. The above mentioned
> > file provides an OF API that's deprecated. There is no agnostic
> > alternatives to it and we have to open code the logic which was
> > hidden behind of_mm_gpiochip_add_data(). Note, most of the GPIO
> > drivers are using their own labeling schemas and resource retrieval
> > that only a few may gain of the code deduplication, so whenever
> > alternative is appear we can move drivers again to use that one.
> >
> > [...]
>
> Applied to powerpc/next.
>
> [1/1] gpio: mpc5200: Drop legacy-of-mm-gpiochip.h header
>       https://git.kernel.org/powerpc/c/e7a6475cc0c32213e87ec190d90b8f1440=
ff05ae
>
> Thanks

Hi!

Looks like it flew under my radar but this should go through the GPIO
tree, can you please drop it from yours and I'll take it?

Bartosz

