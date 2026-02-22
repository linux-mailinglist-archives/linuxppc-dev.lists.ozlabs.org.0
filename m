Return-Path: <linuxppc-dev+bounces-17002-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLOEHbGbmmkWdwMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17002-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Feb 2026 07:01:21 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1756316E88B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Feb 2026 07:01:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fJYJX3cggz30T8;
	Sun, 22 Feb 2026 17:01:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771740076;
	cv=none; b=BUa1Sw2AbZ5ZOCgWBBzyRl/9+TghxEPvaxsCkRre07gLT/2mhKSBMlbDskchav8n3Vu130NSFgS/jvznPp6y94SnxRy7WLbFoUvuY8kak108GPbismey927w1TfD1I7haanXpbAqZT2BOUNK8BTvQnCU+ogmzhvUo+dtPe96xnER7BxIUsrUVS4++lxps6/4fqr1sm6BWGi7ddt7YcPFjKvCB3Yh92Bw0pIUfc619s7eWaPZzVwAx20/O70zLNqXaGTnkcOOf7ujjIAmkMy6RDJn6z4SRXrGmLBko9Z45oViedlMz6OHK52DAvom122iIIkPNaPAcG/ks/BB1ZFuHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771740076; c=relaxed/relaxed;
	bh=SGUrJpT2snvrCrHF6oQDUX1NZznrc6QH9tpjEoGVdds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RjbDJNmZ5TAyXeCR65F2fq1XjvuoeopUV92zce2jI6mqC+Lw75XHB6uEtbhwdbC/vg7Rkmewkph5Osq1SODB7+ubAy0Tj6avrpIslWs4blV6sw9glfhnbZqFdNKaezXwhUG/5IKj4ib1/59mxCybZfBvepHSm+9rR/MDL2Pl3ygzic4xSL1nan/KiMHmhC1eRCaQIi9MV9/VB0JJMY32A8XV0mhTgVpxcXKnwyJiqzX/5QA09ixD50pUxKoy3oaVqc87JjlnCSm+zZ+EVjcDJdKdt3j7AqJuIaatSyADgymdvGAE1wiskNoPXlAzncWdix5fxF6HR3wm3apg/9k1oQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QpQ/5ii7; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QpQ/5ii7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fJYJR4gDWz2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Feb 2026 17:01:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=SGUrJpT2snvrCrHF6oQDUX1NZznrc6QH9tpjEoGVdds=; b=QpQ/5ii7leZxLHvs7muSYQSakB
	zvy/aaQ0m3HYxfTsHaCFJ402XdzRSzcUTUlT1rchx06MZEC3Xc2GwxF1zolh+ySlmhXmehbXBftCM
	vwbWnj0PEN6deZD6UOBshyyYTZv5yGtrNORrEQO2hgQv6PVLiWwjId46iQq+EhBKu3FGd1hGCavPi
	h0VbGehTmkn5t9BYSiqjzjqUyvnJZsBsFH0HF/Gdl6OrjqZonl+Kyin+V15zuWKYi5mIcWQuiFcsy
	gVX2NLh5u8VRt0q5CsJEFp1MFkKYUg70InlNr123KR3eo7kxuv/fAb8fVuA7ati0iSJW+Hy7WOrIP
	cST7ov0A==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vu2Wc-0000000GVXz-33hD;
	Sun, 22 Feb 2026 06:01:02 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Geoff Levand <geoff@infradead.org>,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/ps3: fix ps3.h kernel-doc warnings
Date: Sat, 21 Feb 2026 22:01:01 -0800
Message-ID: <20260222060101.2086504-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17002-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:rdunlap@infradead.org,m:geoff@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ozlabs.org:email]
X-Rspamd-Queue-Id: 1756316E88B
X-Rspamd-Action: no action

Eliminate all kernel-doc warnings in ps3.h:
- add one missing struct member description
- add one missing function short description
- correct one enum name typo
- change several incomplete kernel-doc comments to plain "/*" comments

Examples:

Warning: arch/powerpc/include/asm/ps3.h:96 struct member 'dev' not
 described in 'ps3_dma_region'
Warning: arch/powerpc/include/asm/ps3.h:408 missing initial short
 description on line: * ps3_system_bus_set_drvdata -
Warning: arch/powerpc/include/asm/ps3.h:473 Enum value
 'PS3_LPM_TB_TYPE_INTERNAL' not described in enum 'ps3_lpm_tb_type'
Warning: arch/powerpc/include/asm/ps3.h:473 Excess enum value
 '@PS3_LPM_RIGHTS_USE_TB' description in 'ps3_lpm_tb_type'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Geoff Levand <geoff@infradead.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>

 arch/powerpc/include/asm/ps3.h |   26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

--- linux-next-20260220.orig/arch/powerpc/include/asm/ps3.h
+++ linux-next-20260220/arch/powerpc/include/asm/ps3.h
@@ -65,6 +65,7 @@ struct ps3_dma_region_ops;
 
 /**
  * struct ps3_dma_region - A per device dma state variables structure
+ * @dev: The device that this struct describes.
  * @did: The HV device id.
  * @page_size: The ioc pagesize.
  * @region_type: The HV region type.
@@ -108,18 +109,19 @@ struct ps3_dma_region_ops {
 		     dma_addr_t bus_addr,
 		     unsigned long len);
 };
-/**
+
+struct ps3_system_bus_device;
+
+/*
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
+
 int ps3_dma_region_create(struct ps3_dma_region *r);
 int ps3_dma_region_free(struct ps3_dma_region *r);
 int ps3_dma_map(struct ps3_dma_region *r, unsigned long virt_addr,
@@ -136,7 +138,7 @@ enum ps3_mmio_page_size {
 };
 
 struct ps3_mmio_region_ops;
-/**
+/*
  * struct ps3_mmio_region - a per device mmio state variables structure
  *
  * Current systems can be supported with a single region per device.
@@ -155,13 +157,13 @@ struct ps3_mmio_region_ops {
 	int (*create)(struct ps3_mmio_region *);
 	int (*free)(struct ps3_mmio_region *);
 };
-/**
- * struct ps3_mmio_region_init - Helper to initialize structure variables
+
+/*
+ * ps3_mmio_region_init - Helper to initialize structure variables
  *
  * Helper to properly initialize variables prior to calling
  * ps3_system_bus_device_register.
  */
-
 int ps3_mmio_region_init(struct ps3_system_bus_device *dev,
 	struct ps3_mmio_region *r, unsigned long bus_addr, unsigned long len,
 	enum ps3_mmio_page_size page_size);
@@ -342,7 +344,7 @@ enum ps3_system_bus_device_type {
 	PS3_DEVICE_TYPE_LPM,
 };
 
-/**
+/*
  * struct ps3_system_bus_device - a device on the system bus
  */
 
@@ -371,7 +373,7 @@ struct ps3_system_bus_device {
 int ps3_open_hv_device(struct ps3_system_bus_device *dev);
 int ps3_close_hv_device(struct ps3_system_bus_device *dev);
 
-/**
+/*
  * struct ps3_system_bus_driver - a driver for a device on the system bus
  */
 
@@ -405,7 +407,7 @@ static inline struct ps3_system_bus_driv
 }
 
 /**
- * ps3_system_bus_set_drvdata -
+ * ps3_system_bus_set_drvdata - save driver private pointer in @dev
  * @dev: device structure
  * @data: Data to set
  */
@@ -464,7 +466,7 @@ enum ps3_lpm_rights {
  * enum ps3_lpm_tb_type - Type of trace buffer lv1 should use.
  *
  * @PS3_LPM_TB_TYPE_NONE: Do not use a trace buffer.
- * @PS3_LPM_RIGHTS_USE_TB: Use the lv1 internal trace buffer.  Must have
+ * @PS3_LPM_TB_TYPE_INTERNAL: Use the lv1 internal trace buffer.  Must have
  *  rights @PS3_LPM_RIGHTS_USE_TB.
  */
 

