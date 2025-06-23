Return-Path: <linuxppc-dev+bounces-9631-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 514F3AE3B45
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jun 2025 11:56:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQk4H44Gfz2xHW;
	Mon, 23 Jun 2025 19:56:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::134"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750672575;
	cv=none; b=e7cLXxL7znib92mkZ3UnnzBza1Xud8QHkx8Tzfrj1ldXwZWrcSHB9MWH49YMZDYZBioXhg9o8OlmPvU14Vv9K9aDGCVHUlWEEKR9czZh5x0bKoEglK7HvjAcGU+5ehveT3E8VDTP68ujMP/GZPjnU/N2grvdxnpvPyULFmFU7L6tks98jGOLlJ1VNFfrZN6o+C/ACBjEWfz4ZxQXwgHyhX5V6ZOHknHmJgTeLvjSKAA9dqQJiCwdUhYyVrSBpUVUOz19gHzp2oREEcCpjoL1fmiqC9F2fZSRAoMrZGLFwbJ71UdyghZyDKhW2tYzP7gLYzfy/Q/8Xzo5P79cPb7Xkw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750672575; c=relaxed/relaxed;
	bh=LPeDtzputbBG8BYmPS4Q6TNFFvEXgzemPhqRvBeZ31Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y4FhJe4IlKKaHQ94ECmuvYi4Cxkw/rvNSUnQJb2e4QDAipl7kL8Z6hP8kIfRxLDITAn7lwTH2FyNKxjWDvegsTqWOpt4WBEESN+ars7/JayZsLNCfCWfCxVPQ30DoGa/Z70hgQvT7CVQN7b6d1s5Da79gxXtwf11LcDJ+qnrk/3QmvkqVGFxcfJth3xEeVokYBVwPyy5FcWqB56rLR4zUKlivlEmHEFTMRRJKVUqJtavVhP/PT4FwAAAIKW/gwn/DAvuskqLyleNq0jHPevziTauWf3hdqNwuHTWo64ZhCZ/TI0nORGV6i9k+iDOHAI4WDB3B87IyygYddaWjsR4gA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=LVZ31njS; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=LVZ31njS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bQk4F3WC6z2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jun 2025 19:56:12 +1000 (AEST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-553b6a349ccso3857835e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jun 2025 02:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750672569; x=1751277369; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPeDtzputbBG8BYmPS4Q6TNFFvEXgzemPhqRvBeZ31Y=;
        b=LVZ31njSNZNw8dJUEwmykPuBHHWqbVZkx7Dvw8dMiUJsuVolUBwlsxro7myzbuNR8o
         ApgsQKGEkcg14FURIE0lvOqAH9JCjrgiJXKEFltVy0WFDs0nGQw7AIDHcNSZ8RAHfLEw
         JNdT/weAjMkwpii9rL0bYpt/wgKV9ags1oxFUtJQw3L/eVevit+D30Ymj7WdlwX6hVJI
         IsPlANsM2WSzTY2lSCdmO7pFTWNfl666ZHraxoJifolSYBc2OxD1psZl0KkLZoDoscDl
         xZOnSfjFFEtyVcqWJ1BwBj809MH6juJm7yE0cBpKI2DwCzGeR534OMH2LXB4Y9YjLB5r
         0iEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750672569; x=1751277369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPeDtzputbBG8BYmPS4Q6TNFFvEXgzemPhqRvBeZ31Y=;
        b=Q0KGVhXI0F2JmRA36ZVMuOBfUmSuQ7RxNqedQKidvlsOcb3jIg3i0cEaMpruhmoB0d
         lTEu/tadGgJBeedJOqfXjh1alQmBw1P1DG4MraHMIVjSHSnZv7zWJlXGlaKGfViP1ECL
         T24LZg9Vy17dlEMkiLv81lmI+WbEUFlMoKN/+JuzJD8lRRNJTqiEI69vFVpZ9y8lInwn
         Eh7pw0lvtW8xG4BgtSffm0ZaQFA4k69KxQXK6O6qT4Hrd+TkKllzwQGK1k/gaN0Nuyqu
         2qK5tR+76LFrhym/7mnFv/+d0M3vWDNX3EDjiNocIlo4I3+WSlaRp201+KQF2MoVTD/I
         M2OQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbAZXXoo5eXM6OlR+RQFdLg2qNyyx3Medc4TRXvNiHKqDXpaJuldnEc1fFvTdM+/vhrRzTIS9PLS0Ed3I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwIlWNWj8LgKKr5/av3QJzTogt7IvWqmKxEJqEyymrHZaw38Eeh
	Nl0oceAE6bhLW7iyBlNaU48vNsEAybyGmZvEcjUeiezCfs2IYcO0a6Ff6IOOCnRHfDI/VyDuB1X
	iFSecq2rXdatS7rxfW3ydomLEFG1gdSV5j9NNNGFEnQ==
X-Gm-Gg: ASbGncssekSal19Xx0+Rd9F4/iYnxC3X9TPtDdz7Msaa5M6MpKH8Hex/y+JBsMjFYQv
	7VsENV+Rj7vYvqhoRjJNK0aB8YK9iLOzQ0HpM75obVAkAdIMO1rsty2IH7qfVvORbnAgF9PzU5W
	eyswy7a02J1jKVgimavxAREyvqUE8iwtGvTp2tNF3BF6vCaOn+t3DMCOCOU1bxtrGCAmeualUCz
	g==
X-Google-Smtp-Source: AGHT+IGMaE9K7TjoPvRiPlXWOuU8YRsnFELOXhWXUfRnOBAE1HlGniGGtDxisVHNWEEQuzgyMBQMIN/+AwV3/43kfW8=
X-Received: by 2002:a05:6512:3c88:b0:553:cc61:1724 with SMTP id
 2adb3069b0e04-553e3bb51camr3441310e87.24.1750672569238; Mon, 23 Jun 2025
 02:56:09 -0700 (PDT)
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
References: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
 <CAMRc=McVV=VBw0DRiz-4tTjh7ZtRLWg=N_LQ2-7O1sKyW30rxw@mail.gmail.com> <c6eece57-8767-4435-beda-c9f399e3fa80@csgroup.eu>
In-Reply-To: <c6eece57-8767-4435-beda-c9f399e3fa80@csgroup.eu>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 23 Jun 2025 11:55:58 +0200
X-Gm-Features: AX0GCFuwq80YRRas_rerTXxamhsQCeIBZVM5a2xh0c93mD5kLuLbXD7aaKlDuiI
Message-ID: <CAMRc=MdYuk_O3P1QtepvF-6m01jn3xpDP4YxttQSp1-J-J2GvA@mail.gmail.com>
Subject: Re: [PATCH 0/2] soc: use new GPIO line value setter callbacks
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jun 23, 2025 at 11:54=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> Hi,
>
>
> Le 23/06/2025 =C3=A0 09:33, Bartosz Golaszewski a =C3=A9crit :
> > On Tue, Jun 10, 2025 at 2:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:
> >>
> >> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that retur=
n
> >> values") added new line setter callbacks to struct gpio_chip. They all=
ow
> >> to indicate failures to callers. We're in the process of converting al=
l
> >> GPIO controllers to using them before removing the old ones. This seri=
es
> >> converts all GPIO chips implemented under drivers/soc/.
> >>
> >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >> ---
> >> Bartosz Golaszewski (2):
> >>        soc: fsl: qe: use new GPIO line value setter callbacks
> >>        soc: renesas: pwc-rzv2m: use new GPIO line value setter callbac=
ks
> >>
> >>   drivers/soc/fsl/qe/gpio.c       | 6 ++++--
> >>   drivers/soc/renesas/pwc-rzv2m.c | 8 +++++---
> >>   2 files changed, 9 insertions(+), 5 deletions(-)
> >> ---
> >> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> >> change-id: 20250523-gpiochip-set-rv-soc-14e1d9414f70
> >>
> >> Best regards,
> >> --
> >> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>
> >
> > I see Geert queued patch 2/2, who would take patch 1/2?
>
>
> It is in my pipe for v6.17 but if someone else wants to take it I can
> Ack it instead.
>
> Christophe

No, that's alright, I just didn't get any notification nor is it in
linux-next yet.

Bart

