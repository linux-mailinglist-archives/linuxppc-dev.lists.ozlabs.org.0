Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D314796EA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 23:14:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JG3Dw1lnqz3cbd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Dec 2021 09:14:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.50; helo=mail-ot1-f50.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JG3DQ3ty7z2xY1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Dec 2021 09:14:12 +1100 (AEDT)
Received: by mail-ot1-f50.google.com with SMTP id
 x19-20020a9d7053000000b0055c8b39420bso4613934otj.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 14:14:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HRPjZ6BCCRz8DgC5lU6t6/+QUdNthSGalR45oT3E+s4=;
 b=5CF+jAC4NV+GgqtdycjSP8WbSYPRe6sv7kAki7HVkhPSCE8DHSxZAXDQFFf3EH1CbI
 VmpvCNyTHB2LKT3wGwi/X2usoc0hyqy4MvTXN3He2lcQghnNsMi8r+Aj1LEYE23aOKq4
 RL/rIBJ+QevjxQ6ZxhraVLP/vsWm9WTl86yKNDQ2ZEo8voqXJXw42bR7wSLnrGuEgp+M
 lPnKkxBWSAMMD4bwWqyr+NmlttxemHBrFYCocLRvCPw8ZMRdFSI4Px0JPysUgZS9NQQB
 0kNI8/GlELO2GIVVPTyGMgt2Lf7lvC2tV4Nzv9jtcZk1BxQ7yR3j6PHKdIHeSCycfnqB
 p3lQ==
X-Gm-Message-State: AOAM532hamgP7DheTq/OLMeNhTDnoxeM77qD5BUiqKtLxPiipdf6Rs+m
 JoJPTgoL+XxQF4XhRR+Zxw==
X-Google-Smtp-Source: ABdhPJwh4Y9Lw6ei5ha5CA9qNLUhAYqUzn12Yng2m8cXlJN677jIVGkwJ+3t94R7Keqvk2kyYbmtMA==
X-Received: by 2002:a05:6830:2b14:: with SMTP id
 l20mr3649399otv.42.1639779248692; 
 Fri, 17 Dec 2021 14:14:08 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id a16sm1813248otj.79.2021.12.17.14.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 14:14:08 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: [PATCH] powerpc: dts: Remove "spidev" nodes
Date: Fri, 17 Dec 2021 16:14:00 -0600
Message-Id: <20211217221400.3667133-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
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
Cc: devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"spidev" is not a real device, but a Linux implementation detail. It has
never been documented either. The kernel has WARNed on the use of it for
over 6 years. Time to remove its usage from the tree.

Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/powerpc/boot/dts/digsy_mtc.dts | 8 --------
 arch/powerpc/boot/dts/o2d.dtsi      | 6 ------
 2 files changed, 14 deletions(-)

diff --git a/arch/powerpc/boot/dts/digsy_mtc.dts b/arch/powerpc/boot/dts/digsy_mtc.dts
index 57024a4c1e7d..dfaf974c0ce6 100644
--- a/arch/powerpc/boot/dts/digsy_mtc.dts
+++ b/arch/powerpc/boot/dts/digsy_mtc.dts
@@ -25,14 +25,6 @@ rtc@800 {
 			status = "disabled";
 		};
 
-		spi@f00 {
-			msp430@0 {
-				compatible = "spidev";
-				spi-max-frequency = <32000>;
-				reg = <0>;
-			};
-		};
-
 		psc@2000 {		// PSC1
 			status = "disabled";
 		};
diff --git a/arch/powerpc/boot/dts/o2d.dtsi b/arch/powerpc/boot/dts/o2d.dtsi
index b55a9e5bd828..7e52509fa506 100644
--- a/arch/powerpc/boot/dts/o2d.dtsi
+++ b/arch/powerpc/boot/dts/o2d.dtsi
@@ -34,12 +34,6 @@ psc@2000 {		// PSC1
 			#address-cells = <1>;
 			#size-cells = <0>;
 			cell-index = <0>;
-
-			spidev@0 {
-				compatible = "spidev";
-				spi-max-frequency = <250000>;
-				reg = <0>;
-			};
 		};
 
 		psc@2200 {		// PSC2
-- 
2.32.0

