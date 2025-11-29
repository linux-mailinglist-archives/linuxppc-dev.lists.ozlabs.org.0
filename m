Return-Path: <linuxppc-dev+bounces-14549-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88182C9468C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Nov 2025 19:36:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dJf5d3cxTz2yx7;
	Sun, 30 Nov 2025 05:36:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764441413;
	cv=none; b=YHXEZjP55VFneFWKmNfFG4pNuV4csVynRSTo4GuO7gK5cIeKhhtyulk1Ss8qqsWuvevd7JnPqJvKxv76QBuecYN5eo1Kxkya1Pum8bSZWfy7z6SpubUv4xTvYly0YXkBNno+YamcUQKb+6KMtvOU76Y4vUZPGTWOOYnBwezCgxGb4qoZQyCEeUHer5emlY0YaEpFsxBrJcRlqyjwilZW7+BTjJ0qeJRskftxtrdkZ9t/pmU1fWwZI6dWZoEh34ZUvqkPxwQ6KQDzIw3d8tXrYkWX6qFmQ8auDD3M9N7uJQL+LGETk0uSomp+3frKCUitVArJ73+JZ3xYnCyL9HmYlA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764441413; c=relaxed/relaxed;
	bh=I4HSeLrbi/Wup23FaVMWBDazatczLZ6rLut4vQXiYVM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hn68KvqyOstZ34FXXbjFaHwvS7V8wT4etKGoFrmprW66DLul5Ht0GCJsv4gqzKmEQ0dySaDxz/kHpB8CIGZHl4IO1CBwZggrWKCrpPYonLzaMXk5VvwSL42TmDW3NXf+qC02r8hu/NpPNPeKjDwy4vGRDelc04TgJfJ0McwaR4A7aqnyskoA9cHEoGRw6wP5AEhser3kkG1jMnsrmPOYTSudxkeWUeFqn5O3fvocWthfDbWNv0C1LN2haueVdu1a2O5mFue29KDY8U8JzL7tyIJUR6/VMzoOOlXQeOVKL1+xUUIcUMa/BQVQ1j/L2d1QINb+z+511ADI0yZlrUnYQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=infradead.org; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dJf5V359Lz2yjx
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Nov 2025 05:36:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=I4HSeLrbi/Wup23FaVMWBDazatczLZ6rLut4vQXiYVM=; b=Vmepr18dlTR205knLzFZXQH6bH
	uG5F4Ugn+pglKNbt7/ceCbRVEVHKMjP4lRSQbA32J/6zijHpT/N8vBKuxtP065VnPe8kEAejmQj4n
	8trLHgeQCnqswd80+80MXyPbXbCda2oQgmBGpUgOhRyOBGx7SEUZrk91XoXNaFDASzhl2sSGhs6Np
	NkAiUMBhitif1knbm+P2lNnh77UCiCNju2Ny64BiSA5E3YbhF5Q2+SX2oMmO1bVUBEqVzpgGvX8/S
	r8J+heAD1OJQw8uRy0OIFwnuYRXQPPOzZdfWn0grQ0q2640/t5lE/MbYJlRolzpoB2gELTp6Gv///
	FmFdLwmg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPPoD-00000001jMX-0Mto;
	Sat, 29 Nov 2025 18:36:37 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linuxppc-dev@lists.ozlabs.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Geoff Levand <geoff@infradead.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: [PATCH v2] powerpc/ps3: fix ps3.h kernel-doc warnings
Date: Sat, 29 Nov 2025 10:36:36 -0800
Message-ID: <20251129183636.1893634-1-rdunlap@infradead.org>
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
- move intervening "struct ps3_system_bus_device;" from between
  kernel-doc for ps3_dma_region_init() and the function declaration

to eliminate these warnings:

Warning: arch/powerpc/include/asm/ps3.h:96 struct member 'dev' not
 described in 'ps3_dma_region'
Warning: arch/powerpc/include/asm/ps3.h:118 struct ps3_system_bus_device;
 error: Cannot parse struct or union!
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
v2: move intervening "struct ps3_system_bus_device;"

Cc: Geoff Levand <geoff@infradead.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/include/asm/ps3.h |   15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

--- linux-next-20251128.orig/arch/powerpc/include/asm/ps3.h
+++ linux-next-20251128/arch/powerpc/include/asm/ps3.h
@@ -65,6 +65,7 @@ struct ps3_dma_region_ops;
 
 /**
  * struct ps3_dma_region - A per device dma state variables structure
+ * @dev: device structure
  * @did: The HV device id.
  * @page_size: The ioc pagesize.
  * @region_type: The HV region type.
@@ -108,15 +109,15 @@ struct ps3_dma_region_ops {
 		     dma_addr_t bus_addr,
 		     unsigned long len);
 };
+
+struct ps3_system_bus_device;
+
 /**
  * struct ps3_dma_region_init - Helper to initialize structure variables
  *
  * Helper to properly initialize variables prior to calling
  * ps3_system_bus_device_register.
  */
-
-struct ps3_system_bus_device;
-
 int ps3_dma_region_init(struct ps3_system_bus_device *dev,
 	struct ps3_dma_region *r, enum ps3_dma_page_size page_size,
 	enum ps3_dma_region_type region_type, void *addr, unsigned long len);
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
 

