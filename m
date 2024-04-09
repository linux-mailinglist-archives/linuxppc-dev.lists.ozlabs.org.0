Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7689D89D268
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 08:27:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256 header.s=default header.b=X694B3Zv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDGGn1tQQz3vbC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 16:27:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256 header.s=default header.b=X694B3Zv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tkos.co.il (client-ip=84.110.109.230; helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=lists.ozlabs.org)
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDGDN3Hwyz3bbW
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Apr 2024 16:25:40 +1000 (AEST)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.tkos.co.il (Postfix) with ESMTPS id E92AA4402AF;
	Tue,  9 Apr 2024 09:17:43 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1712643464;
	bh=gBrssBZlXRFpb/uFLqMMzn9TEci+17z5aWBNXa2ngBU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X694B3ZvoBbd8hdHi7EzW+8J3OhjQ3vGjltGuIcjUGUE2fwOJptEAEdfejjw64iAN
	 lijKzF39aagDuh+BBzePRq6AGkXS7wMIDboXTR/qyUZYG1iR9j9UE4FLbS4my6aExL
	 grP8xNQYjxSa+353MHFEkx5KeiJJyzng3Lgxngls4wOIpTyqxeAo3aYtRUotgD1s+b
	 RNnGfxtA9aNNWIO47r3iSmqxFw6TwBTMJsLU7SAtgqv66YixNdry2dmyQ981D42CIR
	 ZrkL6mcP1A3ER8fnpQtJ/cjZInpCjfyeUkRT4Puuvkm3pNUJm2LFMZoHx58lBg0eEA
	 IEQfxVkwMVY+g==
From: Baruch Siach <baruch@tkos.co.il>
To: Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH RFC v2 3/5] of: unittest: add test for of_dma_get_cpu_limits() 'min' param
Date: Tue,  9 Apr 2024 09:17:56 +0300
Message-ID: <945ff87c765a461d46f0033fbef422e97f9aede0.1712642324.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1712642324.git.baruch@tkos.co.il>
References: <cover.1712642324.git.baruch@tkos.co.il>
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
Cc: devicetree@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, Ramon Fried <ramon@neureality.ai>, linux-s390@vger.kernel.org, =?UTF-8?q?Petr=20Tesa=C5=99=C3=ADk?= <petr@tesarici.cz>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, Elad Nachman <enachman@marvell.com>, Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Verify that of_dma_get_cpu_limits() sets this new parameter to the
expected result.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/of/unittest.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 2d632d4ec5b1..8fabb445a62a 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -924,7 +924,7 @@ static void __init of_unittest_changeset(void)
 static void __init of_unittest_dma_get_cpu_limits(void)
 {
 	struct device_node *np;
-	phys_addr_t cpu_addr;
+	phys_addr_t cpu_addr_max, cpu_addr_min;
 
 	if (!IS_ENABLED(CONFIG_OF_ADDRESS))
 		return;
@@ -935,10 +935,13 @@ static void __init of_unittest_dma_get_cpu_limits(void)
 		return;
 	}
 
-	of_dma_get_cpu_limits(np, &cpu_addr, NULL);
-	unittest(cpu_addr == 0x4fffffff,
-		 "of_dma_get_cpu_limits: wrong CPU addr %pad (expecting %x)\n",
-		 &cpu_addr, 0x4fffffff);
+	of_dma_get_cpu_limits(np, &cpu_addr_max, &cpu_addr_min);
+	unittest(cpu_addr_max == 0x4fffffff,
+		 "of_dma_get_cpu_limits: wrong CPU max addr %pad (expecting %x)\n",
+		 &cpu_addr_max, 0x4fffffff);
+	unittest(cpu_addr_min == 0x40000000,
+		 "of_dma_get_cpu_limits: wrong CPU min addr %pad (expecting %x)\n",
+		 &cpu_addr_min, 0x40000000);
 }
 
 static void __init of_unittest_dma_ranges_one(const char *path,
-- 
2.43.0

