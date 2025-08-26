Return-Path: <linuxppc-dev+bounces-11312-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C58B359A6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 11:58:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cB34t69Xfz3dRj;
	Tue, 26 Aug 2025 19:58:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756202286;
	cv=none; b=kddSBOzT21L03gxV+UpmahoAhwy8gBs00MSOlpzOT0q6yOVjSS4xPerjZYI+oSDoYsyIO7/NVYfNx2o8OCemmSeKAqJXoztgDE4zUsg6EGZdK9znTWQaD20OMid2PqgQJ0mD6k2xQ1z7EoI1Z4dYuOPGFQYMXpmwno/cYAg5ng/XVtOAKd54vpX57nxSjCJrhZrCtS3aON6PjsfB7ileD3WXcLY3BZNy0UUu/MKiUEGitKdZYsRloXXezYvmH4iiS8/o/DemmA1yMh3p1jLBgCF0JXjt0okwEVpjzfE37104BZzlx8059rGb6Jzjtd8PByv9eBdhUlQgqxEjZu8qsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756202286; c=relaxed/relaxed;
	bh=uOUXkb1uF8zQdB/sKiLIuRwWdep4Dp9YFQhPpYg7e7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cZxb044r/vxbUzmP5BKjmC2iiN5BmtDwAFlp999gkEJNVHiWe99G/7AHMgXt7T1MO6MKwaVKdRjeliXQppVZI/xhlcHrrYO0JK7RPry646OvJFNaDGiEnSpYrP9shVoFdSGj/11wFqOAlXkZ1h4Fu/2xMobe4m9sr3VBzpAYpmDiVX3mo8pPXFEZxxrhQbn2m1/CoRw57FE1h69oBpHMap3lOS768PU1sNbxMPnMShPfj5xQ1YuxTKV2zrkbPF4V6361edMzOmGSrMME28kE2E0Rwk/8rpL828ERCQChOTiv6loHPPZ6/WSpJyWtFG451u8qRTcdED6Lxl3T8uHUCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=bOLR3SZF; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=bOLR3SZF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cB34r71cLz3dJn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 19:58:04 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-55f474af957so1786799e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 02:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756202279; x=1756807079; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOUXkb1uF8zQdB/sKiLIuRwWdep4Dp9YFQhPpYg7e7o=;
        b=bOLR3SZFVAubO0QM8j0qP9RyO65W+lyFoND/BrDcpFqfLdInh9whuWci2jSaUM1UEk
         qYRx4Gs6HIa1BSbtvsqXx8oc1HMucyCcbSNt09rMzN5sH7zTbJL0s/6F0LTFNI8lxD//
         hIKHE2YQNJCZwFbydzf/O83jNsI6Ym/mOTO2W2DMqKS9VsMjNXSTs++G+2kOl25CxuD0
         Vftie21q9Y959UgdSgiiK66OZpwWW9JSo8m5a/3qgaGnxANay4uCSbMJHln62OkCpIDM
         IwazlgjwrqdBcVyQYjicdrK++SAgzZdbtszvfBZu5Sp/uLVCrhF0oGIM684hlQOSpKpg
         brng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756202279; x=1756807079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uOUXkb1uF8zQdB/sKiLIuRwWdep4Dp9YFQhPpYg7e7o=;
        b=CNacVTIBraQHhvP0JKOvkBXosQNTaSgFgRLk38cJBYSACQtbJdK2971IACAa1dL80X
         XMCQJJ6FEPPfG9X8XEzY06o6f5awVTIMMJP7JuK/1nIbB/yksjoWKrZ16p31/UnUJpV+
         ++8sCGdX54c1G8JGE7Gds0ytrc7qycZ6zZoXaSn24b1opuMDUNlZK2nnzuRIiPYnq6Ni
         MhNaXrgENBNtbAQTHZUeRyEj1WJ+ReudV8KBAh5282jwZrLvvQzRYXAsGTaA2qbEhU2W
         AVx0dvnOvM8PKGkEj7hLFWAsBBsffRXJMSZnBkhQ5R34IGiiotLX0YKcGG0WK1aA1QAH
         2h1w==
X-Forwarded-Encrypted: i=1; AJvYcCWyHYLSUCoCDCsJNNSV+f/TW1OsuCSBe2jEr3R1/+Zzbc6pEhf98CXmv7D/OsDNU9s3pyUXF+KnSHrAnYs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyYcEyXI7kI4SeQRrF8Ptj1PShO49w80W5qxXZQQ1NEgsSFRV2D
	0mi/DrLF7ueezMdRwDpqByuvy+y6YngUtnuiGolq1TSmGwb97bV6aKY73KUjaXxKNb52JZ8gvo+
	V2eUF8mZlKhRH0sl0Fr61kKijyBaQVIIPEZjywVdYlQ==
X-Gm-Gg: ASbGncs2e92jF2u1OQ+u+T4rWocY+7h4zFVQaicruWVPlSE+xRsOeEjca0FiA1CwX5X
	7b8Lp6/2RV/5vmkCUPq6j2QWsWtiRxQIOVFe1SSwgs7MpcuqrSg8pZlDwbCckv3yrdkJDuPwYgd
	Iq5VeOblHcv4MIGE13o44t/4884uZTA0EN8hxmt3r+da8ByUOn1FCUKnLSHJ5UMTNA4YTra0oZB
	L1Dd3QovnjWjY3OHsgLJiC0dMTFw1fsG8tl/ghD8jRvO5RjNQ==
X-Google-Smtp-Source: AGHT+IHZlig7uTIvb1Hm0+VQCqd18Uy1yI/ilX78XfwZSj12J+ieVVBnbFx5cn43CrziQFS1Bp5XyB1Kt9NlfkCCxzM=
X-Received: by 2002:a05:6512:440e:b0:55f:42ca:cc03 with SMTP id
 2adb3069b0e04-55f42cacd56mr3019395e87.56.1756202279297; Tue, 26 Aug 2025
 02:57:59 -0700 (PDT)
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
References: <372550a2633586d2f98b077d3f520f3262ca0e2a.1756104334.git.christophe.leroy@csgroup.eu>
 <ac7c79b3491cb48ef7c193420b9a9e4614b88436.1756197502.git.christophe.leroy@csgroup.eu>
In-Reply-To: <ac7c79b3491cb48ef7c193420b9a9e4614b88436.1756197502.git.christophe.leroy@csgroup.eu>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:57:47 +0200
X-Gm-Features: Ac12FXy4Ibm7fbO9KiNfYE73-dyWntHoWbLgchN6hbkj2Va2bGEIGeT9v8x9Fxc
Message-ID: <CAMRc=MchS5d3RHjtpc-fAVzKyhMchdUhvZCgTNsJ94u5Cc5FWw@mail.gmail.com>
Subject: Re: [PATCH v4] soc: fsl: qe: Add support of IRQ in QE GPIO
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 26, 2025 at 10:41=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> In the QE, a few GPIOs are IRQ capable. Similarly to
> commit 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx
> GPIO"), add IRQ support to QE GPIO.
>
> Add property 'fsl,qe-gpio-irq-mask' similar to
> 'fsl,cpm1-gpio-irq-mask' that define which of the GPIOs have IRQs.
>
> Here is an exemple for port B of mpc8323 which has IRQs for
> GPIOs PB7, PB9, PB25 and PB27.
>
>         qe_pio_b: gpio-controller@1418 {
>                 compatible =3D "fsl,mpc8323-qe-pario-bank";
>                 reg =3D <0x1418 0x18>;
>                 interrupts =3D <4 5 6 7>;
>                 interrupt-parent =3D <&qepic>;
>                 gpio-controller;
>                 #gpio-cells =3D <2>;
>                 fsl,qe-gpio-irq-mask =3D <0x01400050>;
>         };
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

