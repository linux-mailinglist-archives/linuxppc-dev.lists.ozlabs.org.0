Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B95FB909071
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 18:36:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=CGS5vXlo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W14fB3yBfz3cZy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2024 02:36:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=CGS5vXlo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=timesys.com (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=piotr.wojtaszczyk@timesys.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W14dT2w2kz3cXF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2024 02:35:23 +1000 (AEST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-57c714a1e24so2674423a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 09:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718382916; x=1718987716; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYP4VucbC2/Jnuz/5Y5TpJxKEc0YEshxNGoLKrFr67Y=;
        b=CGS5vXlom3geqovD7tmuDLu9ON9xw3otKQlKErOPVKBGBmocRnbcHnliBcGqHFdy6D
         aslzfzlq/XPWQytRSXnb2DkcoKNYVHWZRYoBMxgH8vl6/coIrtQjG8/K9rnYn+pcvomV
         pSZc2ZGBpGZGFs+qA1SRAsm/pR0K8s00hDaZ3fo9Xm1me3jkizX+O499XdTzxgN7VY3N
         sjia1JmVdXTKx1YE4b9GlWFlsYsqQR3kbuJtrTXbpPD7tlxqw0uQNrxhRQusONNJ9wGn
         OHx1TD/rijnjzWVDu9SECz6e+5f3V6EWiB0L+sT0w0cqsnGaNJIAP31aT+w9HFB81gzN
         iW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718382916; x=1718987716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYP4VucbC2/Jnuz/5Y5TpJxKEc0YEshxNGoLKrFr67Y=;
        b=shk/S+VuKApItTjh8Y5jIGd2t2jQx/6r3AbA8+lVE1pVprwFZmlA9d+1dJpECBqTEQ
         xACAaSPI0XSzrEL+RA8AZchL9UjKET8+Uo5tRamFuzre4LjyspFSdrRj46XUgHmp0c89
         AvnQOLbaqbDKLkuoIBU3Grb6RRB8dGU0XlX9oKxmTOiJPxCFpThszqCsESKjXCPZO6ty
         vTOo24LbF2eSOlh2xxKxTd0j/H4ImxXc6NLtHat1ED5bbiNqh/yu/r7uyFxCnI23m+FF
         cqJiavG/JMoDWO8sK/cmuPujeH24FbvawmaULxyrRn7o3fu46sv0lLfKZuiRvGEe3an3
         vLDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWi1v8CrmG/D+HwTZ6GOCYlx8Qrtg2L0lvSi5ZUgTbWFLOpj3MiVnp89yGLESID3/q7b4TfTfJdtd2lBpVw5EOphMfPSnpMtsG9MWY/DQ==
X-Gm-Message-State: AOJu0YxJ13VBSIG0Ua3dSZfMlPzREcg245kLHmwXtajHYk9sT0oYPwFq
	jALI0gZxNJP4E+vUIhMH3Wz+tjcn94YYC3KdpuurblfGjALGp069Hgi2/sAm3Bs=
X-Google-Smtp-Source: AGHT+IFQDhA6L9B70v4e6G80Nc6QL8RMeX1jv/kC5wcXSX1xgpnIA6zLuA7OULi82c0Ut96o3OIgbQ==
X-Received: by 2002:a50:a6ca:0:b0:579:e7c5:1001 with SMTP id 4fb4d7f45d1cf-57cbd68ffe3mr1913077a12.23.1718382915504;
        Fri, 14 Jun 2024 09:35:15 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72da156sm2462893a12.22.2024.06.14.09.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 09:35:15 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: 
Subject: [PATCH v3 0/4] Add audio support for LPC32XX CPUs
Date: Fri, 14 Jun 2024 18:34:48 +0200
Message-Id: <20240614163500.386747-1-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, "J.M.B. Downing" <jonathan.downing@nautel.com>, Vladimir Zapolskiy <vz@mleia.com>, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>, Chancel Liu <chancel.liu@nxp.com>, linux-sound@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This pach set is to bring back audio to machines with a LPC32XX CPU.
The legacy LPC32XX SoC used to have audio spport in linux 2.6.27.
The support was dropped due to lack of interest from mainaeners.

Piotr Wojtaszczyk (4):
  ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT binding
  ARM: dts: lpc32xx: Add missing properties for the i2s interfaces
  ARM: lpc32xx: Add pl08x virtual dma channels for spi and i2s
  ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs

 .../bindings/sound/nxp,lpc3220-i2s.yaml       |  69 +++
 MAINTAINERS                                   |   8 +
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi        |   8 +
 arch/arm/mach-lpc32xx/phy3250.c               | 111 ++++-
 sound/soc/fsl/Kconfig                         |   7 +
 sound/soc/fsl/Makefile                        |   2 +
 sound/soc/fsl/lpc3xxx-i2s.c                   | 393 ++++++++++++++++++
 sound/soc/fsl/lpc3xxx-i2s.h                   |  79 ++++
 sound/soc/fsl/lpc3xxx-pcm.c                   |  74 ++++
 9 files changed, 750 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
 create mode 100644 sound/soc/fsl/lpc3xxx-i2s.c
 create mode 100644 sound/soc/fsl/lpc3xxx-i2s.h
 create mode 100644 sound/soc/fsl/lpc3xxx-pcm.c

-- 
2.25.1

