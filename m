Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D28847AA7E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 14:41:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHgjJ1YHwz3c5f
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 00:41:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TRdshk0L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32b;
 helo=mail-wm1-x32b.google.com; envelope-from=thierry.reding@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TRdshk0L; dkim-atps=neutral
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHghf1qj4z2xs5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 00:40:48 +1100 (AEDT)
Received: by mail-wm1-x32b.google.com with SMTP id
 n14-20020a7bcbce000000b00332f4abf43fso5202974wmi.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Dec 2021 05:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lOKHr4M8GH4POVA6wGDp/sQJEDhJB1D5YusNPIcTnV8=;
 b=TRdshk0Ls9G3yxCdXzlyAYBiAIwi/glzUAHy1zkBYWOTGG47hOWM6R9g1/cO8RdrWa
 8b447PoK+3ObAZ2tIFsSmAnDdY9kkCG79AvTOmE/XQX28g87k7xtJpcSsJj8fjVRIq9e
 2WmGvMYbawhHWS6VA9j2hlsaOWo8SAMYcRLnZCzpvWjYMEvs8DnEZ7L4rfNVMXH2K3sl
 uxu/0ZVHz4C46hmlXU9KP2ywWksP2TLy6R2KeaaJ8VQqIqOaIux5Jo1zzB8+viSOrRty
 E/O81psfbUH+IpeLEMQBp4rHXT0r/l+jaxY/O49HEzlZY+RuWOHf1tofNGAFj14GKa0z
 9DoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lOKHr4M8GH4POVA6wGDp/sQJEDhJB1D5YusNPIcTnV8=;
 b=R1OdMdZjZ6IzUOcPUNbf/xnxah76z9xgTrbFFVXeUzzAyQIL21qsOetwM26USa8N8W
 RcWvHyMfO8yuojWvaq3xYp64M9jIjdI40DBtPO+kx0yUC1wTcIIYUW2YxgDGuewV78hD
 Yr5Cs/20gBk/0+n4TO3iz+B9VmMJnDbCNl+YZNKFD/+75SaP0smIcloFVQ+1nN+irb3l
 o5X02p4i0hEq1MukDyhWoT1X0fasWz2Zre1ZaLrztO0ynUy+a/FzPnFi2IYfuZHzbjpt
 FWCpg6FNnGplBsp5CW18P3jZfSZM/pss4iFVpZgFWOrEEqWiDpIzs4QC6DLmxWypdNpb
 pisg==
X-Gm-Message-State: AOAM530yR42nKuIQUpyTSUI4vko2wG96X5qIZHSxbmpsZ2QuB5H8nQrj
 LEqIx8opGnxSL7ifSuH3oc8=
X-Google-Smtp-Source: ABdhPJxSixlSyXgyg5g6e+BZWTVcP9HEpU2UqeXtQzwQ1r5GbXolyNkJHBhLSN6pz/LJ6C/nT7pM5w==
X-Received: by 2002:a05:600c:1987:: with SMTP id
 t7mr13976740wmq.24.1640007641300; 
 Mon, 20 Dec 2021 05:40:41 -0800 (PST)
Received: from localhost ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id m6sm19327640wrp.34.2021.12.20.05.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 05:40:40 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: [PATCH] powerpc: dts: Fix some I2C unit addresses
Date: Mon, 20 Dec 2021 14:40:36 +0100
Message-Id: <20211220134036.683309-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Thierry Reding <treding@nvidia.com>

The unit-address for the Maxim MAX1237 ADCs on XPedite5200 boards don't
match the value in the "reg" property and cause a DTC warning.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/powerpc/boot/dts/xpedite5200.dts      | 2 +-
 arch/powerpc/boot/dts/xpedite5200_xmon.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/dts/xpedite5200.dts b/arch/powerpc/boot/dts/xpedite5200.dts
index 840ea84bbb59..74b346f2d43c 100644
--- a/arch/powerpc/boot/dts/xpedite5200.dts
+++ b/arch/powerpc/boot/dts/xpedite5200.dts
@@ -132,7 +132,7 @@ rtc@68 {
 				reg = <0x68>;
 			};
 
-			dtt@48 {
+			dtt@34 {
 				compatible = "maxim,max1237";
 				reg = <0x34>;
 			};
diff --git a/arch/powerpc/boot/dts/xpedite5200_xmon.dts b/arch/powerpc/boot/dts/xpedite5200_xmon.dts
index 449fc1b5dc23..d491c7a8f979 100644
--- a/arch/powerpc/boot/dts/xpedite5200_xmon.dts
+++ b/arch/powerpc/boot/dts/xpedite5200_xmon.dts
@@ -136,7 +136,7 @@ rtc@68 {
 				reg = <0x68>;
 			};
 
-			dtt@48 {
+			dtt@34 {
 				compatible = "maxim,max1237";
 				reg = <0x34>;
 			};
-- 
2.34.1

