Return-Path: <linuxppc-dev+bounces-11618-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D92EBB4049A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Sep 2025 15:44:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGRmr1q90z2yN1;
	Tue,  2 Sep 2025 23:44:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::129"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756820668;
	cv=none; b=B+UGQ3EOCp6JB+dwhfcudwpWx53hlN6OGtYHahv81god7p8Zyojzp08WAf3t9WA/Z2PZAvR1WoRx7vckft4TaMRz2npI/W9o3gxQNrpKF9YtsxPLBk0D2fBETxApPfJZqDIjYHySv/pidOhGYE+s15tXNiXZEQl5mhHTM7K60BhTej1+LH48F2OanFO1CsXqwZfGfuTMjQ/owhi1qIG7GI0blCRXmAdpLEgexBzedQ7cCt8vzcBEFEG8SYxgPYagNf23dNdpL/cBAd3yXVy0vGdR9GIoqK1vHKC29Rb732+OL0+XpGHuXtQxR8gKTlLR82n1ZDBjCEa98hjGevdt7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756820668; c=relaxed/relaxed;
	bh=dE+y6IouNTFh5LnCQS36Be2cwV132cRumEEcY15HKHQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GiIrCBj+RUHNr+O2A++PZy+OmoyneZWUp8Dtf0NRYB+GxBAl1KMtin5NSewSB+QzHZiMBF8G5eLlzw/Uly30I3ugbkGay/SIfJCuCmZ6ncy89Hl+NwVMTZiBgNJi6gv+PMhG9hlpBu2nDcOH91ZTJIgCzLi99J/cd+JZF5Su6nDbAdD6GlvEA9gBcQU6Wngo3V454ktP5NtORNiwD1SbcfjnMQek/Po41lmRp2i3QkxXi/wxvtfTlzYasJfkVdd6ZEDmjDHjTjhUUhEGHmpAZRYYYXt+DCO+9uIejObxHBpd+aYHe/TOGGK/nAPLIRGFw/XSRVZS8072hypC2IbKCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Ac4enTai; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Ac4enTai;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGRmp2BHDz2xnn
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Sep 2025 23:44:25 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-55f76454f69so2300854e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Sep 2025 06:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756820661; x=1757425461; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dE+y6IouNTFh5LnCQS36Be2cwV132cRumEEcY15HKHQ=;
        b=Ac4enTaiLwLohs3BGDKt9ldVay9kuIYy9skYs/LQG5YznrOTCcDbzbRC4pLsCAUtF3
         QXOeiWuY+qEQHgU0JLE69YJ9FhIPSnlGRp7c7Fw3Q2gQMpGJ+fa/fTO/73YD+UeNPj2P
         f3+K8TcnAcAty+Nxl3srAClAHO7agIRaK+ium6PnqC1RIZL3vU0wg5dHhTctVEn3xQdO
         dJOQKjyrGsj3sSDL0lefDbtOGpxvrN/p1EkDkYJ9/6YtLgSxDRu19xiCrSHtOMrjWOOI
         kfkctBBtdHDem2c50a2dKWn6/27Kuhq4JFN7n/lbfZ57PoVnPp+3C7HvO4C+DY6cXfHy
         L/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756820661; x=1757425461;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dE+y6IouNTFh5LnCQS36Be2cwV132cRumEEcY15HKHQ=;
        b=LX1La9i+A9BzCAnjI5J79nWS6tW34IXc+WvUXO9yFGiYF7bha740SNJvKYrG4uyzWN
         ZS9kQfVdX3DSGXmeMA1S90Hm9BqgLFPuasUqkrTZWJw9ZRRA3HGHRCZI94l2gCb0G9NW
         PzQdlVXgV/L6I/Az5Hr22z8Dh+9QtBVpS3JPo9VOxYT16wMbxAGBC46ETY843mzD+D2c
         xRV9hJn2GiNwG/A29J2sm5MRoe6tqL//TqzHDNAWTe+za6c49RrLZOGwnUMi/YpGA7pg
         8upa1DP1HpRv3rimpEcFTmgjzJUzO+nBBUbOesA3SzZ4Xfl6aTkAga7t5jY7enYJCAIG
         6gGw==
X-Forwarded-Encrypted: i=1; AJvYcCUBtJFc5w4iB4dXLB2nUiGda5cxehGlpkDyuorKmPJ1W8IfdmrCybbGDZtS+YHigKmaI+6SZwfd3W07jc0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxaf+GnKr+a9rrGGH5sEhGFBoZVICOhYNGvtty/QU76z5PlXPAd
	GztKuSBjV8VipJ8WL2YCh7mG3F18b8Ob1iRWrCnnRinOy/tlx8KxVSoIzY2lwq6rcZxniav5dPF
	fnElBOTKpSB+4fs/WFfUEsGyKzJPMi+1r+qAXBQgUdA==
X-Gm-Gg: ASbGncvynjWdCYRgE4qFSBu03TB2kmaZJ4/MiM5PhpCfkhzxC5TWzBKondLFcbUkgpn
	7MGv8kHBIqos0lA0Fl/sfZHQcCcgeLNpkYOu+a9f8TbAxuK2eNs/wKrchDLbbcA6+BCcSOjhryx
	W6JPbF9kBh18oYclirKahCHTWM8PhAGermegvZmQOxzn6BLf7AKWfjeP3CGAwsP39tHhfMFl3I1
	hB//3i6rMj3w2MtmxCbNNzEi3oHnBcyn3wfYGk=
X-Google-Smtp-Source: AGHT+IFjWoO0id3PcP1NXpHfcbubOLclGZa+2gjsa6UEJt7qXSImOMZixhyJgYfyt1Hb98CHs/tfLZNBHaEkOWQql88=
X-Received: by 2002:a05:6512:3d10:b0:55f:4bf6:eff1 with SMTP id
 2adb3069b0e04-55f709482f9mr3675040e87.39.1756820659308; Tue, 02 Sep 2025
 06:44:19 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Sep 2025 09:44:17 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Sep 2025 09:44:17 -0400
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <c5788504a473625faeb9f99b08d3bca5e7135120.1756727747.git.christophe.leroy@csgroup.eu>
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
References: <cover.1756727747.git.christophe.leroy@csgroup.eu> <c5788504a473625faeb9f99b08d3bca5e7135120.1756727747.git.christophe.leroy@csgroup.eu>
Date: Tue, 2 Sep 2025 09:44:17 -0400
X-Gm-Features: Ac12FXy_COZhtMDYkikD9QbVVClX9tOwpv2fAavRIrHRKcbOHQym28lIfpzYJKk
Message-ID: <CAMRc=MfwNr+B-gxkN4ApGX5-k-0=aH=03Aw==WHVSYydy+iHkg@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] soc: fsl: qe: Drop legacy-of-mm-gpiochip.h header
 from GPIO driver
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, Qiang Zhao <qiang.zhao@nxp.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 1 Sep 2025 14:05:10 +0200, Christophe Leroy
<christophe.leroy@csgroup.eu> said:
> Remove legacy-of-mm-gpiochip.h header file. The above mentioned
> file provides an OF API that's deprecated. There is no agnostic
> alternatives to it and we have to open code the logic which was
> hidden behind of_mm_gpiochip_add_data(). Note, most of the GPIO
> drivers are using their own labeling schemas and resource retrieval
> that only a few may gain of the code deduplication, so whenever
> alternative is appear we can move drivers again to use that one.
>
> As a side effect this change fixes a potential memory leak on
> an error path, if of_mm_gpiochip_add_data() fails.
>
> [Text copied from commit 34064c8267a6 ("powerpc/8xx: Drop
> legacy-of-mm-gpiochip.h header")]
>
> Suggested-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

