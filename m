Return-Path: <linuxppc-dev+bounces-2961-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D88559BFF2C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 08:33:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkYj520Wdz3bjr;
	Thu,  7 Nov 2024 18:33:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730964825;
	cv=none; b=X2VBDAJJRoaBs0oVZ3cB/VbWbQRm8vFKXAIWMDKY6tbABLpLMugzpYYHxyROm8+csmBoGToXe/Afhv2tt/Ny3/vvFKXjrqeRETqIgGhyMX+Aimx/ju1oIKiW42x6DKslzKyPQzRb6JgNjzd7Ey6B45YLuShzr7c2VsFqv0xh5B9HNJrwLMpM2JOCXM730NMCV3k+72K9M/H8nO0OF+jAsxEf2F4OSxR800zRT+tjTRlhQc42MK6lxJXBLyWaHNFCloFEyhKRAYoOC3AVeSkbHfftO/7co5zlU7Y5bdBjaqvb7JwOZFMrycjtVCrILkNLnkK+6R6956ClJPLSriYGZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730964825; c=relaxed/relaxed;
	bh=Cifp0rn2qGdoKpwmibPEe4Qvvr2gJ9r0FgdR3PBIPx4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eyHIaa/v83aAnl/Ibgcqiw7tWt75PGuBOXzCdTjYzODxZ5zwlDYK3HxNjd2usF4INR5lxA82iKh0UFqGxOpL07qfE2ZVp+2a0eTd1sLti/T5UyfPRtR72w91hP3A17Ak3/S589FTofiI4x2mUQ8gz+fTpdUMTlGS6JpEeXe0LT8oiipfZ0xddu1XS7CIh7giPqoM7C1TFc540afELa+6X94U6NH2J/SWE529HTaQg+7bK2PK/gEOhc4wHVM8HpjNzJTZdsEtixYVrRmz5wMxKeobDdolIoh9OgUsAUnx4nLsWWWdI5PzbOU1eqBALfQHbsUcmA2+LfF08kgwQAKBkA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass (client-ip=111.22.67.151; helo=cmccmta1.chinamobile.com; envelope-from=liujing@cmss.chinamobile.com; receiver=lists.ozlabs.org) smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cmss.chinamobile.com (client-ip=111.22.67.151; helo=cmccmta1.chinamobile.com; envelope-from=liujing@cmss.chinamobile.com; receiver=lists.ozlabs.org)
Received: from cmccmta1.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkYj22bTBz3bjg
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 18:33:40 +1100 (AEDT)
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee2672c6d4d3d3-1c3eb;
	Thu, 07 Nov 2024 15:33:36 +0800 (CST)
X-RM-TRANSID:2ee2672c6d4d3d3-1c3eb
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee9672c6d4f48a-59aaf;
	Thu, 07 Nov 2024 15:33:36 +0800 (CST)
X-RM-TRANSID:2ee9672c6d4f48a-59aaf
From: liujing <liujing@cmss.chinamobile.com>
To: mpe@ellerman.id.au
Cc: npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	naveen@kernel.org,
	maddy@linux.ibm.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	liujing <liujing@cmss.chinamobile.com>
Subject: [PATCH] tty: hvc: Fix incorrect formatted output
Date: Thu,  7 Nov 2024 15:33:32 +0800
Message-Id: <20241107073332.5483-1-liujing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.27.0
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The termno parameter is defined as an unsigned int 
in hvc_opal_probe(), So the output format should be %u instead of %d.

Signed-off-by: liujing <liujing@cmss.chinamobile.com>

---
v1 -> V2: Modified the description of commit.

diff --git a/drivers/tty/hvc/hvc_opal.c b/drivers/tty/hvc/hvc_opal.c
index 095c33ad10f8..1d2e7f2ce088 100644
--- a/drivers/tty/hvc/hvc_opal.c
+++ b/drivers/tty/hvc/hvc_opal.c
@@ -199,7 +199,7 @@ static int hvc_opal_probe(struct platform_device *dev)
 		/* Instanciate now to establish a mapping index==vtermno */
 		hvc_instantiate(termno, termno, ops);
 	} else {
-		pr_err("hvc_opal: Device %pOF has duplicate terminal number #%d\n",
+		pr_err("hvc_opal: Device %pOF has duplicate terminal number #%u\n",
 		       dev->dev.of_node, termno);
 		return -ENXIO;
 	}
-- 
2.27.0




