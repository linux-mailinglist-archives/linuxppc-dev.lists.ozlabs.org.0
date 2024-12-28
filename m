Return-Path: <linuxppc-dev+bounces-4506-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 133669FDBE7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Dec 2024 19:50:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YLBHv2jXnz2xJ5;
	Sun, 29 Dec 2024 05:50:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b2d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735411803;
	cv=none; b=Qys02l02o7KiDJv43fTRFdcebYSC8oBFBC44sQ6hLuPtYEoAB7eivxp6QMKG7Wa1tWEodo5QYtCPEGBhS7Ohx4r3fhGAY0Fov3Fvt2n7GmLQ29y/PSC0NRfok9K2zh+2m0uijkvRqhzL1cx3xJqUcFuU2+W4rzkhXi9tJ9DTu7DqLFhu7RRBIG1jdLgksTj2n6Lp71J92Y8+fdA6Vb41VbBFmdOg+wGOLqrbCQP8L6HzmsVl6lIRVZ1Umi1l3fiab3BzZlI0t7VePUozkFixo5x0h+6jCBxkyfJWC46fxHjTspNkUx0HbSXy7OzqcWflx6j7niTu6vD1wPuqus7p9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735411803; c=relaxed/relaxed;
	bh=lL8rNecoxrOgRuhpm+UkLZuLqFEtoRoNCimf/pNjqjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SPNqm/4Q6ksLzV23YOXVeMxdj3uXQwxO+DEJyl/8IOE7/SkRgAU4v0P9vMIs3asHGaaKRTvRtKzWalUiZDCXeMW1IXC+4xiMe+cLF2oY5zibbP7vLypIivRohYC+LbcXNuXPsawnpyvou3Eiz8BFn/vWZYkEJR5K0ZfGMgl494OOpqozznOwiS6AnMpdVxlZF9fSvDkD+38ubSBrd07KDRdQzI4LDkPskSLN/KecdzVRHq8SZtPxaD7UlrEtWXfxU/mxqeABUP5nIQni2QA1pB8M3Z1KGi69r4MF0D9YTfftoIbf1dI5fr7zGwlM+GcOvfbS1u718rOEWjwPJh5EqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kBpUNeXl; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kBpUNeXl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YLBHt1x9zz2xJ8
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Dec 2024 05:50:01 +1100 (AEDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-e4a6b978283so10107375276.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Dec 2024 10:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735411799; x=1736016599; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lL8rNecoxrOgRuhpm+UkLZuLqFEtoRoNCimf/pNjqjs=;
        b=kBpUNeXljA3gJLUNlo7a2qgLcanBrJa7plmErT7FaymXn/79R9mpN3pUirorbZM3SV
         BFU58BxbHVGDKZm3FlL0nZAPNuVrDdxtaqWFY1JRfknnOTiBYvkXFCaCHKDRXy+LHNIw
         NWh6UgIgrV/bfyJwwNJiXOXJODCLTLtI2MzYbRKeuxoHwuPCr8I4Aph7DQMFvys4M3dN
         GLw9lQx5cswW10PD7dYhYOkbsMke4EduOXTgmbYVKE6RdxvWPVkOKGMZA1s+xk5QDeR5
         bkSLcfuvsyjGT+PaTdgkqMIu4By8+p+r10YJYRHgN1myVA++TBWTGQVx7SW00FjLL49C
         ZW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735411799; x=1736016599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lL8rNecoxrOgRuhpm+UkLZuLqFEtoRoNCimf/pNjqjs=;
        b=mn3zif/KV5ugMlBtOCG/FeuSp9iiXBvcvgupoXw6Cy3jCY+j0cqnguH4bNO4Np1beE
         y3cs+nXZOwSqA9INlGnquwVT+yYRTxtgLDiRU2iTFnxW2JK8l1dNY6xPCAietwtwRNSq
         czTmRRvimJJjgvw8JnGE8eBz5slEGB9Qolj0WMOnWvw+61KHoB7cHJlRB5MPlsLa3OSu
         supZsIqhx8NRNw0zD8ZayheNSFe5zHf+3or/3q12e4XF7CsW+SlmNFUryi3DTL10ZeN7
         ZqsEu6s2b+11MJYGvYOP+UAuiJWX6o8WeU6CMJE2CTofAtde6OrVMAJwrv/mDPA4MmZH
         5X+w==
X-Forwarded-Encrypted: i=1; AJvYcCWp2AoylQsA4HaVWt4lezLxvwIEhckNPSCsDfpA+WE5WeYqGVOfGsdr9xhND9zBJulYLT5BmPB1DVlHqD0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzLxXCuTOlh2xucP6sVOQfu2rKG5bbcfAQAiSNGbrz8nrnrbLVk
	Gp5/OFU5jl/Zzej0s9NMhbPHYy3tjaHFiw0zle7DQd3S2BXLeRUN
X-Gm-Gg: ASbGncsplXxoWseOvT2kBPxggmWirhyTW39XRL1ZAQxeP31ZatOx+utD1HRQJNTs9o9
	/gg0nv3J1jJvh43WF6nqWz0JnBOKZFjqHwf70IShW1z3SVzpgmowpfOncJjkYxjV2kAJbBCAEuE
	yg66Q7PGGNBe5qThzYArwGyAS5/ET3raHRjUNgzsU0s1EAll5fsj2wMbsYxYQWoYqWBYi3oLk4d
	tNG6e/dSRGnUpnP6cvPCZQISGed/YEoPPojSKjOUQ4aKVdtExc8sSpRPktmEA/OtB3yIs4Rg/Ck
	e4pQA3KQQ/Of/qFg
X-Google-Smtp-Source: AGHT+IGzd+E2S8x2gXxoaCvAStSmkZ51igXj24qQWSN3ZW4n/H7SUeu2mKOPhIyoM4H12slkJ1LXvQ==
X-Received: by 2002:a05:690c:4a0a:b0:6ee:5104:f43a with SMTP id 00721157ae682-6f3e2b8aeffmr257339587b3.20.1735411799162;
        Sat, 28 Dec 2024 10:49:59 -0800 (PST)
Received: from localhost (c-24-129-28-254.hsd1.fl.comcast.net. [24.129.28.254])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e71a8d26sm47945657b3.0.2024.12.28.10.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 10:49:58 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Haren Myneni <haren@linux.ibm.com>,
	Rick Lindsley <ricklind@linux.ibm.com>,
	Nick Child <nnac123@linux.ibm.com>,
	Thomas Falcon <tlfalcon@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH 03/14] ibmvnic: simplify ibmvnic_set_queue_affinity()
Date: Sat, 28 Dec 2024 10:49:35 -0800
Message-ID: <20241228184949.31582-4-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241228184949.31582-1-yury.norov@gmail.com>
References: <20241228184949.31582-1-yury.norov@gmail.com>
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

A loop based on cpumask_next_wrap() opencodes the dedicated macro
for_each_online_cpu_wrap(). Using the macro allows to avoid setting
bits affinity mask more than once when stride >= num_online_cpus.

This also helps to drop cpumask handling code in the caller function.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index e95ae0d39948..4cfd90fb206b 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -234,11 +234,16 @@ static int ibmvnic_set_queue_affinity(struct ibmvnic_sub_crq_queue *queue,
 		(*stragglers)--;
 	}
 	/* atomic write is safer than writing bit by bit directly */
-	for (i = 0; i < stride; i++) {
-		cpumask_set_cpu(*cpu, mask);
-		*cpu = cpumask_next_wrap(*cpu, cpu_online_mask,
-					 nr_cpu_ids, false);
+	for_each_online_cpu_wrap(i, *cpu) {
+		if (!stride--)
+			break;
+		cpumask_set_cpu(i, mask);
 	}
+
+	/* For the next queue we start from the first unused CPU in this queue */
+	if (i < nr_cpu_ids)
+		*cpu = i + 1;
+
 	/* set queue affinity mask */
 	cpumask_copy(queue->affinity_mask, mask);
 	rc = irq_set_affinity_and_hint(queue->irq, queue->affinity_mask);
@@ -256,7 +261,7 @@ static void ibmvnic_set_affinity(struct ibmvnic_adapter *adapter)
 	int num_rxqs = adapter->num_active_rx_scrqs, i_rxqs = 0;
 	int num_txqs = adapter->num_active_tx_scrqs, i_txqs = 0;
 	int total_queues, stride, stragglers, i;
-	unsigned int num_cpu, cpu;
+	unsigned int num_cpu, cpu = 0;
 	bool is_rx_queue;
 	int rc = 0;
 
@@ -274,8 +279,6 @@ static void ibmvnic_set_affinity(struct ibmvnic_adapter *adapter)
 	stride = max_t(int, num_cpu / total_queues, 1);
 	/* number of leftover cpu's */
 	stragglers = num_cpu >= total_queues ? num_cpu % total_queues : 0;
-	/* next available cpu to assign irq to */
-	cpu = cpumask_next(-1, cpu_online_mask);
 
 	for (i = 0; i < total_queues; i++) {
 		is_rx_queue = false;
-- 
2.43.0


