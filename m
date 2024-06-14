Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BF2909080
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 18:37:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=QQD7ez7d;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W14gl1gknz3cZy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2024 02:37:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=QQD7ez7d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=timesys.com (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=piotr.wojtaszczyk@timesys.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W14f16dqrz3cYS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2024 02:35:53 +1000 (AEST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-57a4d7ba501so2966280a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 09:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718382952; x=1718987752; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1mZ6Xg3BCF5HN9VBGCY2svS6vlfsx+tF7JIqIcFeQo=;
        b=QQD7ez7d6O/lHWdmV8h2/6l+KKkKjnUKQzF+dEZ/UEiMz+Yc9VWjbLszRfm4LknVru
         y2FQyv0VdNDbjWQLcy/AkUN4RJ8CRrfBYHFvb4cKEr8YcorNA+R/WrLu55hv7JznlWLN
         cHXhssOW6VPDTK1LGTVuARtRLJ3PnZ2aSijRdS8DrIMJoHqGs1s46GSEul8rYrM2RGj3
         FOJ74pRPMLxUoXXol81JSiY3e+ASd4TIEfRcMkTbfz+WUNg3NA/uKrQsTngM38u+d8td
         X86bfcA2wWzF2ZUfNK2kljnpI5tqYLIOKJn6pjegCVcBJ/jxWGDB39sWqJPIhH7gTk1u
         2h+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718382952; x=1718987752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D1mZ6Xg3BCF5HN9VBGCY2svS6vlfsx+tF7JIqIcFeQo=;
        b=YNTp8Bokn+ZKB6ZwwnpdLmbwIl5RB65l69y/dzwbj7/8HLdNo34Bhnx+rGckFUSGqs
         rueTBTG1CoNsrU+KQeIFcjx3o/+hFLFgy6YUKxJs07sOC8QoEzri3LOCW/jKS/keDqWL
         +7c2pRkEBd3XqSxucFgXTod+dpxAxv9peWJ7y0RD6xW9227ZPlNkdwVjH9MthHcT4p0H
         S/+RYjl7ZlA7UCMAvHqtZFru10gVGkExHyKreBCWWJBYqbRFILXqnA7bznEr62Yc4mND
         8D/1GIQHsayK9Y0XkG8xKKcQkcQjY9yLli0IP4chQ1sVzHZvkvpEFxl0Me8otuEYOKtd
         FtbA==
X-Forwarded-Encrypted: i=1; AJvYcCXw/CYWhBWmMHil868bQi5aSlWesqG3E4HDNSix7ihA9Jb5X/Bq/hN/LEnLiPTqR/BIjR22asJZkEtMHm0GAXR2N//ST06PoRqwy8STFQ==
X-Gm-Message-State: AOJu0YyWgGg1t/QCUOjluqfHCPlBQAC2Tt0+vydQegc982m/eSHMJWho
	9E4i0uf9x+Ig9Y3/wX01ZKwjlItaI2C9LaTf973a7XtvMxTPNo0OYWQ7NsGPEFc=
X-Google-Smtp-Source: AGHT+IFU7jz24QjE0aD7m2kTzDTqVT4xFAQAa5WztkGdzqrtdSmWclJ5lx57DK5AVkuZNzL75iIn+Q==
X-Received: by 2002:aa7:d298:0:b0:57c:c3db:2a5c with SMTP id 4fb4d7f45d1cf-57cc3db2c52mr1787153a12.10.1718382952002;
        Fri, 14 Jun 2024 09:35:52 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72da156sm2462893a12.22.2024.06.14.09.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 09:35:51 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: 
Subject: [PATCH v3 2/4] ARM: dts: lpc32xx: Add missing properties for the i2s interfaces
Date: Fri, 14 Jun 2024 18:34:50 +0200
Message-Id: <20240614163500.386747-3-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240614163500.386747-1-piotr.wojtaszczyk@timesys.com>
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <20240614163500.386747-1-piotr.wojtaszczyk@timesys.com>
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

The 'dma-vc-names' correspond to virtual pl08x dma channels declared in
the 'phy3250.c' platform file.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v3:
- Split previous commit for separate subsystems
- Add properties to match dt binding

 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 974410918f35..bbd2b8b6963c 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -221,6 +221,10 @@ spi2: spi@20090000 {
 			i2s0: i2s@20094000 {
 				compatible = "nxp,lpc3220-i2s";
 				reg = <0x20094000 0x1000>;
+				interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk LPC32XX_CLK_I2S0>;
+				dma-vc-names = "i2s0-tx", "i2s0-rx";
+				#sound-dai-cells = <0>;
 				status = "disabled";
 			};
 
@@ -237,6 +241,10 @@ sd: sd@20098000 {
 			i2s1: i2s@2009c000 {
 				compatible = "nxp,lpc3220-i2s";
 				reg = <0x2009c000 0x1000>;
+				interrupts = <23 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk LPC32XX_CLK_I2S1>;
+				dma-vc-names = "i2s1-tx", "i2s1-rx";
+				#sound-dai-cells = <0>;
 				status = "disabled";
 			};
 
-- 
2.25.1

