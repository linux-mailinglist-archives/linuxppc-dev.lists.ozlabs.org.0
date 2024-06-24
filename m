Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5975B91536E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 18:22:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7Ct96sqzz3dVq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 02:22:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.46; helo=mail-ej1-f46.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7CsL5MFTz3blb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 02:21:58 +1000 (AEST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a6fe118805dso218431466b.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2024 09:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719246114; x=1719850914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z5dYSmS+UlMvDH3osanHRgj0IFMR5noB3hmhQYLwPF0=;
        b=XiqvWr/PMiW7PtxAmCe2bI/Ld/j/sPXVp4VSOxlVlEs+SvBxREG551VRwgdixZvat8
         oqScsJZOVIOINLATtIWyJ7fIlnFa1IqqlxZfKPG/IA/HsBTJGh52mt3etah7Ly7mlfRQ
         Mba3r2pDZHjM+2ThGYYNzajgrNRG0ArJxYIwP91bI/oggeG7imD1CxkM+81Fj30ehH/P
         hnI4vUMFoxMZiVRXjMxuUDlkF5Jtp41lR0hocUAoTwk6XoFuhzqmYGdNmXTf4o8VRhJ0
         dfBruP0L6dVjgf8phqajX8I1GQSOki8MV6g64UhXPSVieB1/T4gl+94q6k4f1STC9Dhy
         AtMQ==
X-Gm-Message-State: AOJu0YwkIQNPE192S8QmjyIyZn3yq+njE0D8hixXyAhr1iWjpKMOZjTG
	nuQ/2Ysw/V6ZMa2VFHAgjIXs/JMj321mnXz7oamgDOpX+Jmg7M6cc/wUOdsX
X-Google-Smtp-Source: AGHT+IGAirccbr9ebRQ4r1Bpr+wLTdNcrvrtLbrlxOOhudvRIZe2BWJOZZT0opPHnukDV9nHPaB2Zg==
X-Received: by 2002:a17:907:8e93:b0:a6e:f62d:bd02 with SMTP id a640c23a62f3a-a7245c84f2emr309572466b.7.1719246113524;
        Mon, 24 Jun 2024 09:21:53 -0700 (PDT)
Received: from localhost (fwdproxy-lla-001.fbsv.net. [2a03:2880:30ff:1::face:b00c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a724d8a362fsm173519666b.158.2024.06.24.09.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 09:21:53 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
To: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org
Subject: [PATCH 1/4] soc: fsl: qbman: FSL_DPAA depends on COMPILE_TEST
Date: Mon, 24 Jun 2024 09:21:19 -0700
Message-ID: <20240624162128.1665620-1-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
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
Cc: kuba@kernel.org, Roy.Pledge@nxp.com, open list <linux-kernel@vger.kernel.org>, horms@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As most of the drivers that depend on ARCH_LAYERSCAPE, make FSL_DPAA
depend on COMPILE_TEST for compilation and testing.

	# grep -r depends.\*ARCH_LAYERSCAPE.\*COMPILE_TEST | wc -l
	29

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/soc/fsl/qbman/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qbman/Kconfig b/drivers/soc/fsl/qbman/Kconfig
index bdecb86bb656..27774ec6ff90 100644
--- a/drivers/soc/fsl/qbman/Kconfig
+++ b/drivers/soc/fsl/qbman/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig FSL_DPAA
 	bool "QorIQ DPAA1 framework support"
-	depends on ((FSL_SOC_BOOKE || ARCH_LAYERSCAPE) && ARCH_DMA_ADDR_T_64BIT)
+	depends on ((FSL_SOC_BOOKE || ARCH_LAYERSCAPE || COMPILE_TEST) && ARCH_DMA_ADDR_T_64BIT)
 	select GENERIC_ALLOCATOR
 	help
 	  The Freescale Data Path Acceleration Architecture (DPAA) is a set of
-- 
2.43.0

