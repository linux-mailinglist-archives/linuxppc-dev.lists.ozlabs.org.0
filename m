Return-Path: <linuxppc-dev+bounces-5643-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C47DA20EE7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 17:47:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjB5b3sl3z305c;
	Wed, 29 Jan 2025 03:46:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b2d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738082819;
	cv=none; b=lTFHXYuNhsrsMlB6lK6MOZvzWi/iq5NAFKm7/sXG9/6SMbSOwQHfIa1+QiN1jGBRPi/3O9zsy1EH4AXEiyXTwdLIlY5iu/VRn3jGLzsw61+1f9kan8sxXhi7o+jXfmz8/VpbCtdwgUhjTmqMDgFMNOwAXYRCgOb4DoRYOCmU789FU4JpKQYwZNkUcHoYooYE6JpM51T7L32hpJA/7cHOiBEUxyq4C189+iQ09rIB4QBAZtHK3qMds5ohEJxx1PiM+enDwP4kKU078XT4i+2xqSqqkocWvkDqHLWglPiTp1J3C+y42Gq5PLVO9JVrFHN20TjhWP/tz1ExoMwBTR8G4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738082819; c=relaxed/relaxed;
	bh=9jlrAcgdlcuse8iCe0f260piXpVGsuWUSordlnIs6v8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dLgsS+t3L7qdtDLl7Z8k83TXIXM04L6xsRTbAh6G137OPskQi9Vd2YEAaIkLrqGWD696bJRgZ2ZujQQ/VNKOtfptf1YfqCKjCA+8oNkqnaTXbiZhTKSovpuH7ZiZdgPgKMW6RO4lm60dnL2COM+uNvo/CI3bzXssnn4KgHT9AzyuolMzDhjH+yw8xr60w7skL+EQP28PU44rVt0qnLLYKGV4Scqu6oCStDL6xnvy4WhlS+t3p5RYaa4O3jSd5/viD0qGBy4VCt4iZKUdUZ/M24Vy7P8ndbj2u4x3YFSXpHrA0mdB7f4xt4mTpaKg5ocxWHv7cixpVwsAUFuuWBPt2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WgT+qGL+; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WgT+qGL+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjB5Z5R9lz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 03:46:58 +1100 (AEDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-e549b0f8d57so9888053276.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2025 08:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738082816; x=1738687616; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jlrAcgdlcuse8iCe0f260piXpVGsuWUSordlnIs6v8=;
        b=WgT+qGL+7ZliECIsm3pyYevbhuTDqE7QGRISv7TaFEMjZ+jn/0labzt+apWZ74LPam
         J0t0/f/E2/1XvE7fn+eXRH2aWiGD29G5I68rhw7PAfhpWj4IpPEs+cyg+bwjoiecrD5O
         eSBC5euGPzjme2cqEiEQAb1JBdOfGF2Lu9n6pAY/jgOz3OgYCThCFkIP/AtNASxhyl59
         8dVMOCPz3kLuElrV1hwDqQuBajI6erVf+E1G1DcG+Q9hsKTVmnhkz88Js0g5J7T6gf07
         PrKm/cx/wuxHPshUbwk+SXxnLvvvsEYK1xX1LxMepatGhJ2R481mTPv0PQZV0A1GdSJ/
         EeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738082816; x=1738687616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9jlrAcgdlcuse8iCe0f260piXpVGsuWUSordlnIs6v8=;
        b=DNeqSqLtTkLCOZpngIcGdIeEvKirkGQKpvTYRbabBmfiwPjbGW5FMxafyoykUULVBB
         XCdg7me3MKJbyey2IArV+Wucdd847hAhXvB8vFfWNIiYZZN5Vbx1j51gZj7mPNuyTs5E
         L7Zio4pY3eVRbXCPFCLCr4pQ5GUTRJRaY9nX+z4jYtOc3ZtYmZswJG0l219QqV+NxH/V
         wCRTHVk1zHRREX6GU3hxP8BbeqFyZ4iVtfjhP4RvZ8DmMnG8G5kR7om59lfOkz4rrQ+L
         hstuo1KHDZ12q6w9YBkZRNfYrr34Rynbp3hStZ6Aus5cwgryUcOW5JT/n4hYrd8p6Zyt
         5H/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVA55RNkw1s+NzYiSUTu0zdcsVRKGppyZyyeYIh8sAjZ6YNr8IKuuSCoxAdNVbR2XI7u0dHwWRtMNgu3w=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyM/ze/b/lKN40UPpyC+9RW8DycR//AHqU2Y7ptoxli2fIoZ4Bd
	ykMyGgnvThhYSyJYOzByHUZwVqaSa4BaHhiAXp8XYUMblitIeus7
X-Gm-Gg: ASbGncvOKrGYuWUhVGsMIScuOEjq/InUO1U6demiBYlcy5XEj1XmIi65h/WCW/wZafp
	B5TC3zHwr4z3Mnd3b8lXkrmat4U5cUE8NrhxB+jLQWmiFChdOOhQDyEXY9HH+zPFczcqRn8mNGL
	OgT+3Jy3GHGzEgiEdo73oUix3sldlp6r2YXqzkAoSShWCA6VhQH3p4ZHKeh1qd94ZP0AD7JFYzY
	iJ+vSNI0KaMh7JpcRoJ4zJKM3k0+d9tFZ23EwqixCO+c48qJTosR+k0RIszgNtdoIiMlnoEGYMY
	IlBwbza9ORf3hUWOC/nrce7mVld+5VlKEvjzaoJXL0eN9wMzzwH+nCEXat956Q==
X-Google-Smtp-Source: AGHT+IHgsJ3cSZTT2IUcyxNcM0FxGg/w0v9YU63CYMxP8tpt4cmfiPqHRC1Hgkmpm4IjqQ+OplZzew==
X-Received: by 2002:a05:690c:46c2:b0:6f0:237e:fc4c with SMTP id 00721157ae682-6f6eb677db4mr335746597b3.12.1738082816017;
        Tue, 28 Jan 2025 08:46:56 -0800 (PST)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f75788d7d9sm19386767b3.27.2025.01.28.08.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 08:46:55 -0800 (PST)
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
	Christoph Hellwig <hch@lst.de>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH v2 03/13] ibmvnic: simplify ibmvnic_set_queue_affinity()
Date: Tue, 28 Jan 2025 11:46:32 -0500
Message-ID: <20250128164646.4009-4-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250128164646.4009-1-yury.norov@gmail.com>
References: <20250128164646.4009-1-yury.norov@gmail.com>
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

CC: Nick Child <nnac123@linux.ibm.com>
Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index e95ae0d39948..bef18ff69065 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -234,11 +234,17 @@ static int ibmvnic_set_queue_affinity(struct ibmvnic_sub_crq_queue *queue,
 		(*stragglers)--;
 	}
 	/* atomic write is safer than writing bit by bit directly */
-	for (i = 0; i < stride; i++) {
-		cpumask_set_cpu(*cpu, mask);
-		*cpu = cpumask_next_wrap(*cpu, cpu_online_mask,
-					 nr_cpu_ids, false);
+	for_each_online_cpu_wrap(i, *cpu) {
+		if (!stride--) {
+			/* For the next queue we start from the first
+			 * unused CPU in this queue
+			 */
+			*cpu = i;
+			break;
+		}
+		cpumask_set_cpu(i, mask);
 	}
+
 	/* set queue affinity mask */
 	cpumask_copy(queue->affinity_mask, mask);
 	rc = irq_set_affinity_and_hint(queue->irq, queue->affinity_mask);
@@ -256,7 +262,7 @@ static void ibmvnic_set_affinity(struct ibmvnic_adapter *adapter)
 	int num_rxqs = adapter->num_active_rx_scrqs, i_rxqs = 0;
 	int num_txqs = adapter->num_active_tx_scrqs, i_txqs = 0;
 	int total_queues, stride, stragglers, i;
-	unsigned int num_cpu, cpu;
+	unsigned int num_cpu, cpu = 0;
 	bool is_rx_queue;
 	int rc = 0;
 
@@ -274,8 +280,6 @@ static void ibmvnic_set_affinity(struct ibmvnic_adapter *adapter)
 	stride = max_t(int, num_cpu / total_queues, 1);
 	/* number of leftover cpu's */
 	stragglers = num_cpu >= total_queues ? num_cpu % total_queues : 0;
-	/* next available cpu to assign irq to */
-	cpu = cpumask_next(-1, cpu_online_mask);
 
 	for (i = 0; i < total_queues; i++) {
 		is_rx_queue = false;
-- 
2.43.0


