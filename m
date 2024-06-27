Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9538691AA53
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 17:04:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=s+4aoLi8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W920p0BxLz3dW6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 01:04:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=s+4aoLi8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=timesys.com (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=piotr.wojtaszczyk@timesys.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W91yS4jgsz3cfT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2024 01:02:40 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a72585032f1so618988066b.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2024 08:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719500558; x=1720105358; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f9ppopi9ppNssy3Y6kMvZbEvjKhcjUNqGrL0dAUL4ao=;
        b=s+4aoLi8si5Ed9evIl1OVIUYT99oYi2kuZPq+XzPR6/lHA5xJVBU9b06CCnWZ++rhz
         0qhks4VfuuDxYAt5YFHjPlF5SqarWBW0frBlRVwDYNvnGeStGJ803J17bJR5hoiyKWRY
         MLNxcf9lujy45kxYF7LhNAL20zQDh9doUNQkK3VwhHe5AyssWS/UlKyA+hW14PDHN2cu
         dWdliQmn5cYEP/da8/gr0Q3CToMRpGNFVdvdc6fK5SoTjRRUDdknX/nID5+ThZlvBwKC
         Il2rmAB2RB2wFUi3A3d0oMe2JYYsQWcGh+tAyi4sdLVFgyA/diaWHWXkRfxfsUt/b0mk
         gS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500558; x=1720105358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9ppopi9ppNssy3Y6kMvZbEvjKhcjUNqGrL0dAUL4ao=;
        b=Ih5dThImoQmXnWUW+OGZpmU5w+GuC+m60ML5hrvt+MRF82hYqR9v/xygVMd5uOyfaW
         AncQH9oqFMvH7UnvfwJXnNq33kTAsc27e1qpie6FYAv36e9BM7cG/RsCxvlPOBQA5zpc
         SaRSHrXplu7tBDfabm0TDNeJzNnhJMSOmRam64vPh2v4n3JGJJ6O5DgiwuBJ2Fv84nuj
         1v37304u8tEN+uNXzxiATw2nVgvI8WPlrYQ8KcO7bZnnhsOY0IL+DpuU35ZsZAiCDHW8
         G8P23q9+Yf/VbbcESq73IEvp9CC2CzeHJP91rZqZIapXHYXAlK4qUF4KDr7ht8kp91i+
         gUnw==
X-Forwarded-Encrypted: i=1; AJvYcCUf6sYxxE1kq8m2jJD57Zx3yh2yi35kry5qYBg2n3CidcayPPOzlDqxa+aFjYb32QuXz5NOlLw+ZxrwBx6KHhrZXvJMpIrIigjBH4kaFw==
X-Gm-Message-State: AOJu0YxZ2g0TtRilwW04VYpDv0wLcwkeqAFmUFroWmaHyu1xkidRpXs3
	sBakgN2AufVjTdza1pbnC8p6QWDXHQIGtoYzrRYwOST7xv4CwMfYBs2mSxefo9k=
X-Google-Smtp-Source: AGHT+IHNxN4PmRPFk0RxdcCHSntPRfVHwfmOqM6zTS7G+/s/UPca4WGfngbQvLyYCR5O6HreQqUr+w==
X-Received: by 2002:a17:907:6a0e:b0:a72:8296:ca42 with SMTP id a640c23a62f3a-a728296d1cfmr421637966b.49.1719500557261;
        Thu, 27 Jun 2024 08:02:37 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a729d7ca289sm67189066b.222.2024.06.27.08.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:02:36 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yangtao Li <frank.li@vivo.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Li Zetao <lizetao1@huawei.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Corentin Labbe <clabbe@baylibre.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [Patch v5 04/12] ARM: dts: lpc32xx: Use simple-mfd for clock control block
Date: Thu, 27 Jun 2024 17:00:22 +0200
Message-Id: <20240627150046.258795-5-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
References: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The clock control block shares registers with other Soc components

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v5:
- This patch is new in v5
- Split previous patch for lpc32xx.dtsi in to 3 patches

 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 974410918f35..8bf88d141e5b 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -312,18 +312,17 @@ fab {
 			compatible = "simple-bus";
 			ranges = <0x20000000 0x20000000 0x30000000>;
 
-			/* System Control Block */
-			scb {
-				compatible = "simple-bus";
-				ranges = <0x0 0x40004000 0x00001000>;
+			syscon@40004000 {
+				compatible = "nxp,lpc3220-creg", "syscon", "simple-mfd";
+				reg = <0x40004000 0x114>;
 				#address-cells = <1>;
 				#size-cells = <1>;
+				ranges = <0 0x40004000 0x114>;
 
 				clk: clock-controller@0 {
 					compatible = "nxp,lpc3220-clk";
 					reg = <0x00 0x114>;
 					#clock-cells = <1>;
-
 					clocks = <&xtal_32k>, <&xtal>;
 					clock-names = "xtal_32k", "xtal";
 				};
-- 
2.25.1

