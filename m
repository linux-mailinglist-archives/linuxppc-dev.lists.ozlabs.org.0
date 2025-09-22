Return-Path: <linuxppc-dev+bounces-12508-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8448EB91DBB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Sep 2025 17:10:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVmlG63Z9z2yr6;
	Tue, 23 Sep 2025 01:10:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758553850;
	cv=none; b=mBT62ThL9plrLSCd26jDTD5RHr9wROjbh2Hsv7AhSuJc5IUYsgc535eJTYKLwBBFWoITIDzCzCU4bZ1rHHB+xt5Dr3jGlND9iAYSRNjL6MYTuXNz9VsY325TNflgjTTmH4MwD4VqWcPYeDsfzaNr74ddE+QBs5qnVy1AEQkwKVgNbyNR00UoAmS94DWQUZPefmmm5XjZ0XwMcGs5f/kUSFVHoB23ZI2eBVLRw1NsguIk5iFLD2mA90CSMQbRXJelSzERhRw3H7rWSY1l8g1qbOid00BFpSzN0gorotXLeaUZlRP6Ocfilv0a31Y/Z/1z/Zhm135VgZK7W/me3RLmNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758553850; c=relaxed/relaxed;
	bh=QeKEMoq0INFY9SFzoLjx1GtUOLFalE390u+VhOEOs1M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dUbD9vIIhC97cbK1o9G3gOfhvVfKoX3ftkOx6zxNphzDUcA5NtLzJQGoWmAh/pvClEIu+S3CU6i0/DA+SxMJjFeeMwq0o3lhO7FG0TLTjKfoiC+CRLowWIbIf7xHfUPYx3SZxvH+XCOYDW3FfC9AM2zQG15+tOeUQlxGbSXQ6WUCJ0PEEu0pE905jjtL+t/mZV8SnYyhzLm+Lur8hR2tlru+G5gv87jYbvviUdCIXrvDRmHTnHxABA9GqLtEUubTPnzSmtx4m2cdRlRKKeGRKaCZsZoEw9U2534dZofW8ZnCCmzLW7xaF6J4nBW3RdGpRVnqt/nJZjx0t13kAYVWCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F1KBL2WZ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=lgs201920130244@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F1KBL2WZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=lgs201920130244@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cVmlF66c0z2xK1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 01:10:48 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-269639879c3so45346965ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Sep 2025 08:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758553844; x=1759158644; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QeKEMoq0INFY9SFzoLjx1GtUOLFalE390u+VhOEOs1M=;
        b=F1KBL2WZUNX6BTiEk4PZ3rxg6ydcjHIq25Ty/UdMPD7ZMuplLyYf8QgbrZH0skwYXa
         RFkKzYMW1SWUCa5Wc+i1RzIAFI0uv+eUjDwhI6mRh6pkGu4LTdqMI+GJ4T5QvWoM9vt3
         WrKv5eNn7VUuJkVh3HgbdQsYKBqEwi/jG1f/ZztEfBu5EcWed34N7d9uBAPF2kmY9/WP
         c28zwtf0cvxEZ1Dmv1d655Cc2bUjTxbTwdh39FPDLH1m/qUbDR0uKT6rC2pJSlSzfmaQ
         yMS0q2QGJXJxy1m9ppEEHZwwhgdLw34zIrnTQxtY8K0J4i6S+pqypK39J9N3dDo/xcQt
         o0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758553844; x=1759158644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QeKEMoq0INFY9SFzoLjx1GtUOLFalE390u+VhOEOs1M=;
        b=d93E2aSkNjsjyK1e3/tkqnGdWd+ShRRW0F/EABYlhjtIC1USF9ShPFgxBoinwQWd+2
         0BfgpQXErqPC3le2Ao9lwAINyv682yTXZQzzncHn3rwqlALJmEiErVdA33c6dzSVVQNq
         yd1aDzs6Y9scuetTC7UfqpBAAqwqzseXhcypy0Pi9kpARCdcz2LFzSWLqV4uHs6IzfBH
         CaCLI6WuqWyWbM+F3rqVz8McDS/K9S+rhdV61m6T65zOCsIQdRtciMjkNvRPWh6/F2EL
         7BGyd7q1xdGmVoKLwEXehYo8nT4gpbpvzHRSTJDGkltJlGUvo7XaK9qys9nFNCyppKs7
         NjYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5QQcjLojcdNnhaTAxCtY4QE3wTbm6UgivZEC7LUCy9kVy7s8A/OBeQRn2bG6376FAAAnDxM+bbOeboX8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwCjSBBk5HfA3BUjldZ5FY5hBmsEzWPvT8xH/aARnwc0xSZpmr6
	7W85V1Li3wPwuQcFlPE2FXg1L3FvobTzyv4xVwql0RvUW2RNvpZqu2Fp
X-Gm-Gg: ASbGncth0yXDNjPWhLKLUao12Z3aMteukWLrv/66rx5ashpDawpGKpWeVwOxVQBqMA0
	8WrgRZnG/2Lbx8Zoe/TvcDSENNJ+nXf+PgH2jNCxRpUvFQWmBfFKUh8KeA6n9cjbl3HDm7AQec6
	cwfnGe2nUBSUACrhxkVcGxPgLGJJGPbbUBOdMNtIHuL/rCw3YYQbWjhCgLgtvFA9GTzCHW/eEpA
	1gyzceqCWaSucPg5lw7is5p1hryXnfVED6p8QbAN7HtieQHTwoqT40se6VVIMW4Fbwp2YRIjrbW
	0a7opofGFcFLlAX8BrUkHxLalBHMGKtVRNowuwIo6PCPiuQvTptCh1uaFii+gKtwPXpTn/ehBBT
	osulaK+6SZs0t9OKWyd88OM4s
X-Google-Smtp-Source: AGHT+IEvD9hsVBCMMBEEbvP8hFwp/v5gBhfqce58IDIzHbs1uD6mT1IGXhLlfqK/ToCU+antLZSz6Q==
X-Received: by 2002:a17:902:db0e:b0:267:cdc8:b30b with SMTP id d9443c01a7336-269ba554c27mr147031635ad.53.1758553844543;
        Mon, 22 Sep 2025 08:10:44 -0700 (PDT)
Received: from lgs.. ([2408:8418:1100:9530:3d9f:679e:4ddb:a104])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980180bdesm134733995ad.56.2025.09.22.08.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 08:10:44 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	"Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2] powerpc/smp: Add check for kcalloc() failure in parse_thread_groups()
Date: Mon, 22 Sep 2025 23:10:25 +0800
Message-ID: <20250922151025.1821411-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

As kcalloc() may fail, check its return value to avoid a NULL pointer
dereference when passing it to of_property_read_u32_array().

Fixes: 790a1662d3a26 ("powerpc/smp: Parse ibm,thread-groups with multiple properties")
Cc: stable@vger.kernel.org
---
changelog:
v2:
- Return -ENOMEM directly on allocation failure.

Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 arch/powerpc/kernel/smp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 5ac7084eebc0..cfccb9389760 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -822,6 +822,8 @@ static int parse_thread_groups(struct device_node *dn,
 
 	count = of_property_count_u32_elems(dn, "ibm,thread-groups");
 	thread_group_array = kcalloc(count, sizeof(u32), GFP_KERNEL);
+	if (!thread_group_array)
+		return -ENOMEM;
 	ret = of_property_read_u32_array(dn, "ibm,thread-groups",
 					 thread_group_array, count);
 	if (ret)
-- 
2.43.0


