Return-Path: <linuxppc-dev+bounces-10142-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3E5AFAEC3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jul 2025 10:41:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bbHlG5lnWz30VZ;
	Mon,  7 Jul 2025 18:41:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::132"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751877674;
	cv=none; b=U/4HNMJCC2ciGp/cSt7nIbm6z4sOhIpfvNwpb3R/XfKSrGfjW+R288PJy9BBXzceedy0eNVVERCHpLonVwtWCWg9NFNaFUzcMQQ/TMNA0WCdsOhrun/lo0yRhswVpuJFX+4FxE0jRCQtcesC45ZTcwLLwoBBvyL0ti8H2ZOC6x9IDIRU4maZzRnGY0GAlacsO2U/hQnd7mjF/2JC8A4MRbIxLpDCvl+CWikhzFjjgy9JQlqHMPUHUNzAKulrR2hbRQ5QQJrKmDaHx0X6LLmf68uYNXFRpT0tBf/QulHNUKzDLTtnNQbGQn16BW5/iBYhF1LwPXcH5GEXeJ0Ce0ZVzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751877674; c=relaxed/relaxed;
	bh=M2ty42UaDUqlMkiP5xE2a1tdArjdzwbm7ssbtaWE4oU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MAMfpMgw5Fbis9HVVRYHRX4bchZ3RuxTuz4fWloqyQPaXjA/F9sJkkkxWSi83fT0r/LaDOq42FbUscFohkhAiqBY1cF0cOXxTbMWW7Q5VNNEU4QufXaMXOWQXGL60dQ7aUAjLB0PtxQhJxrbpJxQEpUAPp63EUl3gvP4dgAT5qpKgIBywmSCAUWVK24V2rSOhpn4LDv3nGfSwxXqmzy3QmT+6/0MCSqfq7jyQxUJStGkMu4wasqiXXR2Z3LI3K9Cg/3nNCbdd8KTJ32AfeezkqFpr5eLCgt0IgeLz3Y37jffo6G/U0lulzmuZ5qj19VHbTHxQFKBTVXuV2pbu/E2+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=gGaIr/MO; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=gGaIr/MO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bbHlD2Zdrz30V7
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jul 2025 18:41:11 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-553b9eb2299so3177921e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Jul 2025 01:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751877666; x=1752482466; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2ty42UaDUqlMkiP5xE2a1tdArjdzwbm7ssbtaWE4oU=;
        b=gGaIr/MOst14JClLZkBg6GYUZk562Hh+/WT+wLHHiDwFpRHMraSiGE7ON/xBgpW202
         G27zuYJoZpGQRcbX+z5RCsB3dLr1Av0WSxf07uTWBfRElI/r9M6YozTm3cvkwuCSNKDN
         7hmRAfvC7d1RuP9ToDmwMHLVhlrtlTXH3/MhYTf9UJIlB7sMKY3/y9WHIHODmrRTol4u
         xHXXgJas+P0tmQ8YkcSoay9wxJaXVhM3wIk+Ff7plNqPUSAh9ZJd8zmW8osWl3NOajUf
         1oCO/N+nzBA0PSMzYWoF7Y6foc2z9BEoukr7DT/i8cjCx7XGBgaQuBMUr6j6/jPnHgXM
         J49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751877666; x=1752482466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2ty42UaDUqlMkiP5xE2a1tdArjdzwbm7ssbtaWE4oU=;
        b=ere3HIZGP2xZisJZFdPDP6wJ0FDuQMVNMUohJVMk/gnii68ghuvxELiNLNI0zY3drL
         8aXcU8Pq4Sl7dKrNVYKUgZfFGss3t+Pr07UnWlt4wJ9BcJcVl/qjKowH67qgzBvhaRIZ
         0GVrjpuqwBH28SDntP4hR6ggdRpZNmEPiZXeWL9JZfZN9FxyfxHs3dxfUzjVALzniLm8
         ZD+w2cZFshyKnzq2ncqJ1KxDZ86n6i5oZ9OkdYWYJ7u6Hg0IzsnUMeVXEQgXg4CZH8mQ
         rpfGV4fKLUvNC+pJD4jEEP7ddBQIeJg5lVUl8PdNah/d2AYbBr02O+QztBYXBGiFjmvs
         4Wdg==
X-Forwarded-Encrypted: i=1; AJvYcCVV/kXtyIx1TuQhukFrw/n2zxBkPakss7S5IA8H3sxv6rDx7f8XcbFmDtaDbBjCUQsJRd5sT2K3kXwUwes=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyG1arGqnKKryr94TGy6L1WznzK64Ul6viwomHcBWMgM+KRQkrw
	5PMnPDdCMqMVjgj6u7U+1/mzmOiAX7VtaAR7U0+M84kni6vHIfCE4Mk8vtOx2MXfpMqt9hqJeHV
	rF/UDJGQREAuiw/wzrpwQZGYMjxUEyWPvWk2jWRQG7w==
X-Gm-Gg: ASbGnctIXAbKIcMFaY/FenOdJxIdSV54F9LiGaIy//rX7czJl9uZ9ab5UKzRo4jSL0d
	X9/XJ63SpV+EkOevGuqEKsS2tEaRwtdKWo8OVbD5DKH1H/YsVbz9/0LfSPjCk3zwf+T1ktU9750
	EgKEs1XrVoiTZA2FVqF9z6QbdFNqvcJmMj2nXVCjcGJ950IEp7sFNt/dFWoIg0gP0Pj71ThU4JQ
	7Y=
X-Google-Smtp-Source: AGHT+IEBQJMgjjxGPUxNMZyf6ChFNk5EekGKfeAHU3z/3d2roa2tlgeHgq/aGpK6K+cYyFTqaK6iHRGTmDCxnni6ogY=
X-Received: by 2002:a05:6512:b24:b0:554:f82f:181a with SMTP id
 2adb3069b0e04-55658402866mr3009050e87.2.1751877666314; Mon, 07 Jul 2025
 01:41:06 -0700 (PDT)
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
 <CAMRc=McVV=VBw0DRiz-4tTjh7ZtRLWg=N_LQ2-7O1sKyW30rxw@mail.gmail.com>
 <c6eece57-8767-4435-beda-c9f399e3fa80@csgroup.eu> <CAMRc=MdYuk_O3P1QtepvF-6m01jn3xpDP4YxttQSp1-J-J2GvA@mail.gmail.com>
 <f527c6a8-faf2-45b8-81f5-03def802e485@csgroup.eu>
In-Reply-To: <f527c6a8-faf2-45b8-81f5-03def802e485@csgroup.eu>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 7 Jul 2025 10:40:55 +0200
X-Gm-Features: Ac12FXzfvvERymQK11WeRhKmee48-1A3WRn820qRFk7sl4RxseqyIge4xppkQTw
Message-ID: <CAMRc=McCu=VdHAEaYwdD5OLTy9MrFO=Mqq-drU1Dnr=-KfJHJw@mail.gmail.com>
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

On Mon, Jun 23, 2025 at 12:05=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 23/06/2025 =C3=A0 11:55, Bartosz Golaszewski a =C3=A9crit :
> > On Mon, Jun 23, 2025 at 11:54=E2=80=AFAM Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> >>
> >> Hi,
> >>
> >>
> >> Le 23/06/2025 =C3=A0 09:33, Bartosz Golaszewski a =C3=A9crit :
> >>> On Tue, Jun 10, 2025 at 2:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgd=
ev.pl> wrote:
> >>>>
> >>>> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that ret=
urn
> >>>> values") added new line setter callbacks to struct gpio_chip. They a=
llow
> >>>> to indicate failures to callers. We're in the process of converting =
all
> >>>> GPIO controllers to using them before removing the old ones. This se=
ries
> >>>> converts all GPIO chips implemented under drivers/soc/.
> >>>>
> >>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>> ---
> >>>> Bartosz Golaszewski (2):
> >>>>         soc: fsl: qe: use new GPIO line value setter callbacks
> >>>>         soc: renesas: pwc-rzv2m: use new GPIO line value setter call=
backs
> >>>>
> >>>>    drivers/soc/fsl/qe/gpio.c       | 6 ++++--
> >>>>    drivers/soc/renesas/pwc-rzv2m.c | 8 +++++---
> >>>>    2 files changed, 9 insertions(+), 5 deletions(-)
> >>>> ---
> >>>> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> >>>> change-id: 20250523-gpiochip-set-rv-soc-14e1d9414f70
> >>>>
> >>>> Best regards,
> >>>> --
> >>>> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>>
> >>>
> >>> I see Geert queued patch 2/2, who would take patch 1/2?
> >>
> >>
> >> It is in my pipe for v6.17 but if someone else wants to take it I can
> >> Ack it instead.
> >>
> >> Christophe
> >
> > No, that's alright, I just didn't get any notification nor is it in
> > linux-next yet.
>
> Don't worry, it is not lost, see
> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D&submitt=
er=3D&state=3D&q=3D&archive=3D&delegate=3D61610

Hi,

This is still not in linux-next and the status on patchwork didn't
change. This will be the last remaining patch not under drivers/gpio/
that's needed to complete this rework by the next cycle. Would you
mind just Acking it and I can take it through the GPIO tree?

Bart

