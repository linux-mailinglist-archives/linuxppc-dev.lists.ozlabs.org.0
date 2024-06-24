Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B20D91459E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 11:00:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=L1RpbCRf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W723W0PbPz3cYB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 19:00:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=L1RpbCRf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=timesys.com (client-ip=2607:f8b0:4864:20::f30; helo=mail-qv1-xf30.google.com; envelope-from=piotr.wojtaszczyk@timesys.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W722p22ZWz3cQL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2024 18:59:27 +1000 (AEST)
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6ad8243dba8so19737676d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2024 01:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719219563; x=1719824363; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdsmDqmNgGZQgfRkYZ6dfoEvN0ahnTXGnc7hhzCQrmg=;
        b=L1RpbCRfMz4smhXE7wGxD3c/3cia13jYOHTncmccCAnxkFRGTpSyKthJh7w9yt7Gj0
         ziyAQiN+Mo4Q1N+gNjI0RgyZqqxhX1uQsrxiSKpcCTaeXQB0KDMFZj4jrU0yqDuwXLrL
         FC4p5s/WUEPdMbG/RRp5/w8+Xhi54DubJ+Kj2NHnUr8qGi2aziH4EnGIYpJLsO9TatCD
         +0LUMJhJMwzGtNhk19l9p1j0QImjEsywSVyBOHd92BP4LbqDABA5DmJQ5trIzvktiSxQ
         mp5O/87AUeXWeH5OvAIrQISwUbRoqp+9gBpOgNQVuSrkX0tujc0XsnM4VkL+XvTzl20I
         j/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719219563; x=1719824363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hdsmDqmNgGZQgfRkYZ6dfoEvN0ahnTXGnc7hhzCQrmg=;
        b=fWOZ0ZgLTEEui/Py+6wLAvdmWR1vWWoKADEejHd+ZamRjH0qHV3czT1xA1R0vrqcDz
         ybfHMV8pmSG9eE58wM2k78nAuwd0mf+Fd0EuGoppHsIto6PTZSDJav7vEyqOlSRWjCut
         WawPiajKh2Tci2Fd/VXfSDzFWtaWG/jJYVRV62X/g4CBex0bckPt2mmBgGLcXhA7nZZp
         MNHv6dUwT9khqNw/VOJUKb31geLx2TF3BIE1Lv0frVicioJ4Mh+c22XjnDAkA5mJgTJ1
         7GVrNiUSqo50dwQAqKvB3vIqe/7repI6X70Cs8nnbtqN72aoUkPSyzRUPl2SMpIIewtk
         JgBg==
X-Forwarded-Encrypted: i=1; AJvYcCWqYh0AIUMfH7XaUCxbhmYmeP7b3eJQW1bd+vqHfMxJz503mjI7QO4ts8qpnp9JX+Ery8GIGlNPp76DJ+0nqu0MOEgfjrsP7pQF3CMQIA==
X-Gm-Message-State: AOJu0YyComCmj2pNW7nXX65v5vg39kdGnmhx4tC3KCGVSOoVglkJj5JV
	7h6ASZ+DXYz6OPUoHBC3tnoMwoouPgNPbG+BHKEloqY/EJS2Y+e+R3LGelniM1U1nyqLHt4POFV
	znsa29xQsku2QWTc547yhT/4UOAt8gWEnvyh9iw==
X-Google-Smtp-Source: AGHT+IHJdukmHTX31XZGqN8Ya5O7xqbZeOSn9ad1olNhKCpFsHEHdPHP6m4H5tAF93YKuWVFl5Mnqdf3Ba8kIeeVBLc=
X-Received: by 2002:a05:6214:4a45:b0:6b4:ff32:8287 with SMTP id
 6a1803df08f44-6b5409be0b9mr37950676d6.22.1719219562855; Mon, 24 Jun 2024
 01:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-7-piotr.wojtaszczyk@timesys.com> <ZnkGcwd8M1QFfmxl@matsya>
In-Reply-To: <ZnkGcwd8M1QFfmxl@matsya>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Mon, 24 Jun 2024 10:59:11 +0200
Message-ID: <CAG+cZ06R5P1g+1Pk3gbQ6Yod0mBM41dFTgvnBWg61HZFUtmx-w@mail.gmail.com>
Subject: Re: [Patch v4 06/10] dmaengine: Add dma router for pl08x in LPC32XX SoC
To: Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: alsa-devel@alsa-project.org, Vignesh Raghavendra <vigneshr@ti.com>, Michael Turquette <mturquette@baylibre.com>, Li Zetao <lizetao1@huawei.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, "J.M.B. Downing" <jonathan.downing@nautel.com>, Markus Elfring <Markus.Elfring@web.de>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Yangtao Li <frank.li@vivo.com>, linux-sound@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Chancel Liu <chancel.liu@nxp.com>, dmaengine@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 24, 2024 at 7:39=E2=80=AFAM Vinod Koul <vkoul@kernel.org> wrote=
:
> Any reason why dmaengine parts cant be sent separately, why are they
> clubbed together, I dont see any obvious dependencies...

The I2S driver depends on the dmaengine parts

> On 20-06-24, 19:56, Piotr Wojtaszczyk wrote:
> > LPC32XX connects few of its peripherals to pl08x DMA thru a multiplexer=
,
> > this driver allows to route a signal request line thru the multiplexer =
for
> > given peripheral.
>
> What is the difference b/w this and lpc18xx driver, why not reuse that
> one?

The lpc18xx used the same dma peripheral (pl08x) but the request signal
multiplexer around pl08x is completely different - there are no common part=
s.

--=20
Piotr Wojtaszczyk
Timesys
