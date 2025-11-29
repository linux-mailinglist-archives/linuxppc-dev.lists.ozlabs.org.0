Return-Path: <linuxppc-dev+bounces-14546-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9621AC93502
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Nov 2025 01:25:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dJ9t34bDRz2yv6;
	Sat, 29 Nov 2025 11:25:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764375915;
	cv=none; b=cpxJQFNsG49buWCqPSG3cHs4m9XwXjLnXaEGO2neXglLFVxdpFqNxzCJLl+1+6rxiYM2Wo5rHPRaviJT4S3XQ2y9wSsAqHdBdyIv61b2jQa7laKWneys2YSdPKPAKJtyr46cfML6LvLFCBuOPs4axm4cEzatCOf7Xr8QYjH6sdiwnfYxBjztkJDRVk2X9R+/ynG7DS2u684Nx1gcotLrp6n7zisw41n0JqCJZorzKSfbOGSYtOXMRiiRE8FVh3+IS+VPUr3OesZKGvr/LzisXskOL2RAiYZI45OeCTMCCugMlj4wWfQhdDfi2FLE0QcYXDgkDDb7XJPi2rhu/XbWqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764375915; c=relaxed/relaxed;
	bh=nEVl7YW+0JO8Ze3XLP1YirpsPLuh/Xu0yJHJ9Z2e/cY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e/6g4Lt/iNWR0OLoFWSPBjRnONu6/4Uwnca16qUA3PLyNU6Z+QwFqh8Tsd4oBgbjXU0Z+9W6bOfHf8iyIJtj27jnBFDwknlRw07Qb/V1dKqVxjo27evgSP2d2Be6J8OQJU0vXCBeQJ9mxCCt/vPeA5ekovU9McpLuklfQKxbOExHUWxnqPq9g3lm1Sd/c32pZHZ4cNq4G/OucTNlnMDSYbz7utBhGOsn6896CUmQUfiTotJZuUa0EL7xp8qVHgLCcdj4YrtBVjMHG+3dR0/UJall+DUJs5WbXAEqW4b27MCDT6CbcZZ7XIAiF4C0WpDHqBHJ8T5ap3p+nQvYRN6c8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fU4u/9h+; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fU4u/9h+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dJ9sy2DR1z2yql
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Nov 2025 11:25:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=nEVl7YW+0JO8Ze3XLP1YirpsPLuh/Xu0yJHJ9Z2e/cY=; b=fU4u/9h+HgeIogWYjfFYXzwwRu
	AU2UVsDGonkW1lEP7ZmXn5QOh2oCGtQGO8VTVMhTQOPlllHz3Ij1Wy3+gaXz/HPRZSkvnVOFweUwC
	baO5xaaj0g4hP8Bucpsf/qr6lZrxL6Ntt6dN+1f4Y0xUXBQKo1sNnVVtLGmaHHeAaDtGjvfZKA8YI
	rmhmzh3jq9A3gq2akC5zrB9sVtA9KOxX9SK4jyWorT3vL41qstp6z62khsr0oMp/SFqRmUlehiVnG
	g1uL8fNrMUbviwbYcEUQyVMa71Mu/yjiBtSFRD+M3qMGo0f8l4wAdQqu5heyCJWCfyc4Y3P3FVf5V
	pPm/mOAQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP8lh-000000015Kn-18FO;
	Sat, 29 Nov 2025 00:24:53 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linuxppc-dev@lists.ozlabs.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Geoff Levand <geoff@infradead.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: [PATCH] powerpc/ps3: fix ps3.h kernel-doc warnings
Date: Fri, 28 Nov 2025 16:24:52 -0800
Message-ID: <20251129002452.1195777-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Fix some kernel-doc warnings in ps3.h:

- add @dev to struct ps3_dma_region
- don't mark a function as "struct"
- add Returns: description for one function
- add a short description for ps3_system_bus_set_drvdata()
- correct an enum @name

to eliminate these warnings:

Warning: arch/powerpc/include/asm/ps3.h:96 struct member 'dev' not
 described in 'ps3_dma_region'
Warning: arch/powerpc/include/asm/ps3.h:166 int
 ps3_mmio_region_init(struct ps3_system_bus_device *dev, struct
 ps3_mmio_region *r, unsigned long bus_addr, unsigned long len, enum
 ps3_mmio_page_size page_size); error: Cannot parse struct or union!
Warning: arch/powerpc/include/asm/ps3.h:167 No description found for
 return value of 'ps3_mmio_region_init'
Warning: arch/powerpc/include/asm/ps3.h:407 missing initial short
 description on line:
 * ps3_system_bus_set_drvdata -
Warning: arch/powerpc/include/asm/ps3.h:473 Enum value
 'PS3_LPM_TB_TYPE_INTERNAL' not described in enum 'ps3_lpm_tb_type'
Warning: arch/powerpc/include/asm/ps3.h:473 Excess enum value
 '@PS3_LPM_RIGHTS_USE_TB' description in 'ps3_lpm_tb_type'

This leaves struct members in several structs and function parameters in
one function still undescribed.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Geoff Levand <geoff@infradead.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
---
 arch/powerpc/include/asm/ps3.h |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

--- linux-next-20251128.orig/arch/powerpc/include/asm/ps3.h
+++ linux-next-20251128/arch/powerpc/include/asm/ps3.h
@@ -65,6 +65,7 @@ struct ps3_dma_region_ops;
 
 /**
  * struct ps3_dma_region - A per device dma state variables structure
+ * @dev: device structure
  * @did: The HV device id.
  * @page_size: The ioc pagesize.
  * @region_type: The HV region type.
@@ -156,10 +157,12 @@ struct ps3_mmio_region_ops {
 	int (*free)(struct ps3_mmio_region *);
 };
 /**
- * struct ps3_mmio_region_init - Helper to initialize structure variables
+ * ps3_mmio_region_init - Helper to initialize structure variables
  *
  * Helper to properly initialize variables prior to calling
  * ps3_system_bus_device_register.
+ *
+ * Returns: %0 on success, %-errno on error (or BUG())
  */
 
 int ps3_mmio_region_init(struct ps3_system_bus_device *dev,
@@ -405,7 +408,7 @@ static inline struct ps3_system_bus_driv
 }
 
 /**
- * ps3_system_bus_set_drvdata -
+ * ps3_system_bus_set_drvdata - set driver's private data for this device
  * @dev: device structure
  * @data: Data to set
  */
@@ -464,7 +467,7 @@ enum ps3_lpm_rights {
  * enum ps3_lpm_tb_type - Type of trace buffer lv1 should use.
  *
  * @PS3_LPM_TB_TYPE_NONE: Do not use a trace buffer.
- * @PS3_LPM_RIGHTS_USE_TB: Use the lv1 internal trace buffer.  Must have
+ * @PS3_LPM_TB_TYPE_INTERNAL: Use the lv1 internal trace buffer.  Must have
  *  rights @PS3_LPM_RIGHTS_USE_TB.
  */
 

