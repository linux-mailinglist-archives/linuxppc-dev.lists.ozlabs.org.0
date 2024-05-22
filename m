Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A7C8D554E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 00:21:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=permerror header.d=gmail.com header.i=@gmail.com header.a=rsa-sha1 header.s=20230601 header.b=KxvRfnTJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vr11W1bHLz3dLW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 08:21:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KxvRfnTJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=pvkumar5749404@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vl1tc3L6Yz3fyD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2024 05:43:02 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6f4dcc3eeb3so1338910b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2024 12:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716406980; x=1717011780; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+l1jGRIHGLSOCzg1Hqtmq9RANsnqiXOnvKtLbcZF6nw=;
        b=KxvRfnTJ4/oiTrAENn90iVQ4MHeZE3geF7p6zH0nWxcVOzPS4qWJaa3JFRyB3b0xVa
         4U+q2JD2FHBgsY9bApJ6dO9Re7ePi9nhf1EECZYz8MAQ8BxmACuazPfZxhcnnwODEyEA
         OSln6Wdo9vf5SDkXJhpzMbQTQVUZx7ql7x19BOVJr1ubS6NuHarKOLUCXfCmHTgwfejB
         Q8WCPgmNxSqFfv5H0hyGlVsj5uMFAnw+6vSSTH2xz+vaIY6wjTWNXRMycFXt3j0GRL6I
         PT1o1GEuIEt5lVbQpHmuysJ4Tm3AqIYGQmr3+iCfFSVsfA+GILyzXyIadSHjVwaU3aP8
         nonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716406980; x=1717011780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+l1jGRIHGLSOCzg1Hqtmq9RANsnqiXOnvKtLbcZF6nw=;
        b=FFRgXCwc8CXJLD/RYmzM+EgACUvAq4uy7shnSizzXuNmJEur4odGaPQzUtY+IMjlr8
         6RyXGRnRcgZNqkpOWDwpsHIOrwljsocc2vw2k6rptbrr8i6NmMYAEu+NRW7J4Z1GByoT
         C+DUZPjyWLRvOqVGeoPeVpFYnVCf6CLotbyVFcVBSmXB9OReiPKifOWkrZUkRldSBI2q
         MpavNi9vi3gKDIPXoZQzjy9RDA8kFtGnGTd5vfqDLk4PJGt44J2MjG8NHduZbBbPZbU7
         ZmWm3i0H65xkoVxjQ98o+WrEgyMAdxJVhUAjrSRYxXmsdRisAs3J/TU6x+jWM+LUjBC2
         Metg==
X-Forwarded-Encrypted: i=1; AJvYcCVggtZE69hQMKWkglp3t1Kp5K8kdEFV3mvPIkfrlEGRcnXdp4dm6X8vzBBdM9G5k8Qo/G7+5mBEMJtn8xFfsamrA1F/0gRouLkNwTKW0w==
X-Gm-Message-State: AOJu0YxwJ+y9xUTZm0KGoCnfiHIevW9wVIH024wygiuM+DQG+5AUR6WB
	JdhDNKfOOwPhMUS3OBAZV3Rnj+Q8+g8CAFITj0CKNg1E9twNDPMK
X-Google-Smtp-Source: AGHT+IGahBLCjjQG1T2S2C1fP6BqgfIWhVb9z2cxp36QzXbpzt8+4YBsoWGn0Y1xbJP7uCm5/8JW3g==
X-Received: by 2002:a05:6a20:3217:b0:1b1:d2a5:c7b1 with SMTP id adf61e73a8af0-1b1f8b44af2mr2752771637.49.1716406980129;
        Wed, 22 May 2024 12:43:00 -0700 (PDT)
Received: from localhost.localdomain ([27.7.152.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-656f38b855esm10648576a12.8.2024.05.22.12.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 12:42:59 -0700 (PDT)
From: Prabhav Kumar Vaish <pvkumar5749404@gmail.com>
To: akpm@linux-foundation.org
Subject: [PATCH next] arch: powerpc: platforms: Remove unnecessary call to of_node_get
Date: Thu, 23 May 2024 01:12:50 +0530
Message-Id: <20240522194250.1165568-1-pvkumar5749404@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 31 May 2024 08:19:55 +1000
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
Cc: Prabhav Kumar Vaish <pvkumar5749404@gmail.com>, javier.carrasco.cruz@gmail.com, linux-kernel@vger.kernel.org, julia.lawall@inria.fr, npiggin@gmail.com, skhan@linuxfoundation.org, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

`dev->of_node` has a pointer to device node, of_node_get call seems
unnecessary.
It will automate the cleanup process allowing to remove the of_node_put
call.

Signed-off-by: Prabhav Kumar Vaish <pvkumar5749404@gmail.com>
---
 arch/powerpc/platforms/cell/iommu.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/platforms/cell/iommu.c b/arch/powerpc/platforms/cell/iommu.c
index 4cd9c0de22c2..5b794ce08689 100644
--- a/arch/powerpc/platforms/cell/iommu.c
+++ b/arch/powerpc/platforms/cell/iommu.c
@@ -780,14 +780,13 @@ static int __init cell_iommu_init_disabled(void)
 static u64 cell_iommu_get_fixed_address(struct device *dev)
 {
 	u64 cpu_addr, size, best_size, dev_addr = OF_BAD_ADDR;
-	struct device_node *np;
+	struct device_node *np = dev->of_node;
 	const u32 *ranges = NULL;
 	int i, len, best, naddr, nsize, pna, range_size;
 
 	/* We can be called for platform devices that have no of_node */
-	np = of_node_get(dev->of_node);
 	if (!np)
-		goto out;
+		return dev_addr;
 
 	while (1) {
 		naddr = of_n_addr_cells(np);
@@ -805,7 +804,7 @@ static u64 cell_iommu_get_fixed_address(struct device *dev)
 
 	if (!ranges) {
 		dev_dbg(dev, "iommu: no dma-ranges found\n");
-		goto out;
+		return dev_addr;
 	}
 
 	len /= sizeof(u32);
@@ -833,8 +832,6 @@ static u64 cell_iommu_get_fixed_address(struct device *dev)
 	} else
 		dev_dbg(dev, "iommu: no suitable range found!\n");
 
-out:
-	of_node_put(np);
 
 	return dev_addr;
 }
-- 
2.34.1

