Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8BE9125C9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 14:45:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=kgplcSdq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W5HBc58cbz3cYt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 22:45:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=kgplcSdq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=timesys.com (client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com; envelope-from=piotr.wojtaszczyk@timesys.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5H9w4YBbz3cBx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 22:44:33 +1000 (AEST)
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6f977acff19so922918a34.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 05:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718973872; x=1719578672; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5l08J6QwTAydc1Q035PbR16J+Enp8p+H6+DUEul73Uc=;
        b=kgplcSdqXUSp48WFgfbNLTlXteZ2ffZol/r5NRLbSp0cwM3K0HRZWV914h6Afh7THT
         YgA96BPuTi1dpMHA8xF6gdnVfp3VRZ/ZaFGqjdxB32SXdsPSKlDD5dRtqX2cjezfJbHs
         Lx3I5Y+xNxwjyMUVSx6CzN2GuGTd5QudpAN4kbIQ9AUiDyywTVYTiqaB13RhphXv2UZO
         2cbqn/NAtI8ba3Ipa4rA5/U0gscJcZjlsA9LX5DoAPWEGwQRWSG9G6kjdYOHEWQefgmM
         k3Vg33JfULCSa9/wPD+kMV4HeEF+3V7ta9vuKU9tgGcGmlkZqe9FdDx1UC7GuDrhGyAo
         DTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718973872; x=1719578672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5l08J6QwTAydc1Q035PbR16J+Enp8p+H6+DUEul73Uc=;
        b=R7UIjZn91DAxfMvQvQFLEpaWTGq4eP5HEx45TjcYlTHNwT50VQh8CTeQSAZWnhVPb3
         qgUhqS7uXYlMSvKlIEh9y6eUu+WS7bjQptxGPSgwnsjLHXqS7wvNrk1CUBpm6F4jDczf
         vASmt8bMwRRhG/L3gfhuxPFhG8KfHaoFoSX09LpBfAuHcVPb8SSpkI3wSVnGYzXE46qU
         5wfgv3k07FhPbYc2/0BkgiNogABMvUO9nFue/CvDm3u0DYUFYwcv32chPtbL5ZxTlYvw
         u/QqFinjCXJI8RBedAwFtIrS1/2GTIpUkvNpG870YqpvnAq0q013b70MXFzsX5AbPFEr
         /geA==
X-Forwarded-Encrypted: i=1; AJvYcCWZT4noXuZ23ZLWzTtjqdTIMIvgWlwQQxTDm0iuarFL8Fq/4wtRpPXW4dwfYDssCWKOAZGadxQfeCSK8hVn4+UAiZs/LLaLvrXN50Amhg==
X-Gm-Message-State: AOJu0YxzTvcJe0UDhJNBToRm8FI7sZzxZVbRLEottB40X5DTr2zL7i6h
	OlacjlqMoW1hAhuKOVfOGe3dGKhFgFe/Hx3ZxI05apBJYcqV/Qc+PnOn6ACwqx/K0zThsdIgVnC
	Hjk8NH93zxEUTvmFv7rX+lGQzKMGoawB0yZbkMA==
X-Google-Smtp-Source: AGHT+IEOZNlyLp+OxVrBD22Lk7qV9DoUmsFRWzsrduGbMG3NGbu8paAH4Nzg2EEG9ozpibJTiN4vqzTSJCMR3pLWBf8=
X-Received: by 2002:a9d:76cd:0:b0:6f9:e6a5:dad2 with SMTP id
 46e09a7af769-70074dc525emr9327837a34.17.1718973872714; Fri, 21 Jun 2024
 05:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-9-piotr.wojtaszczyk@timesys.com> <20240621103019.783271f4@xps-13>
In-Reply-To: <20240621103019.783271f4@xps-13>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Fri, 21 Jun 2024 14:44:21 +0200
Message-ID: <CAG+cZ06GSxPsTzRLXSk23qWXMkp-qxYq7Z9av5-2cPHSJmVAHg@mail.gmail.com>
Subject: Re: [Patch v4 08/10] mtd: rawnand: lpx32xx: Request DMA channels
 using DT entries
To: Miquel Raynal <miquel.raynal@bootlin.com>
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
Cc: alsa-devel@alsa-project.org, Vignesh Raghavendra <vigneshr@ti.com>, Michael Turquette <mturquette@baylibre.com>, Li Zetao <lizetao1@huawei.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, "J.M.B. Downing" <jonathan.downing@nautel.com>, Markus Elfring <Markus.Elfring@web.de>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Yangtao Li <frank.li@vivo.com>, linux-sound@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Chancel Liu <chancel.liu@nxp.com>, dmaengine@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 21, 2024 at 10:30=E2=80=AFAM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
>
> Hi Piotr,
>
> piotr.wojtaszczyk@timesys.com wrote on Thu, 20 Jun 2024 19:56:39 +0200:
>
> > Move away from pl08x platform data towards device tree.
> >
> > Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
>
> I don't see any change regarding the NAND controller node in the device
> tree, is there any dependency with other patches from the same patchset
> or may I apply this directly to nand/next?
>
> Thanks,
> Miqu=C3=A8l

Yes, this patch depends on "[v4,04/10] ARM: dts: lpc32xx: Add missing
dma and i2s properties"
which will be splitted into two or more separate patches per request
in the comments.
I'd like to keep driver changes and corresponding changes in DTS in
the same patch
but I've made a separate patch for DTS per request from v2 of the patch set=
.

--
Piotr Wojtaszczyk
Timesys
