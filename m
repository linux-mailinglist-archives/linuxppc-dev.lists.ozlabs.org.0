Return-Path: <linuxppc-dev+bounces-12806-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E72BD725B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 05:12:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4clzm92lFSz3cZ0;
	Tue, 14 Oct 2025 14:12:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760411545;
	cv=none; b=Oz5kwJNnsh/7EW95Gsk/1ixofdEXGywX+hQCuWEqqaxlj8Uxhv12BqM2tJv/o1KTSRs0Fsln7sIcuc3Hrwd8Hfrk3KVXOsRx432BV+cuVueMv5bnNYUpnPWux3Pc0xC1DXuph0nQPQGCa09EN1R4Y+dMKAwhmCqQswcIKBlZLqyI3LGhGfeQ6cKdRfdfZIlYGZQYDk5Z7VRKY/2yZ1oGuuiFO5otbSVt4EnArn5B7QYVvLv3mWZ/9zN4GAd7qeGuS70ICALrDccnAskBz3Vg1Di+ZSnYzVHHQR6qJqaPOpg4byq71F7ohkb9KNXm2IShT5p564gUWpRu0fSX82r63Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760411545; c=relaxed/relaxed;
	bh=Zk1/jOtAJjGXriY1QIj9/1i2pa/kKwh++HrQqEhwTbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mmATe2v9DPky9i3onC89zFG/KshTGFbLtoZAiS+QZ/N6R4B7Kivnp05TAsxubsrqBOEePmuDhyk89Tj639JRYSeaVpTDLJ1VpslqqqKtYbtMFJDNzLJ8JFWZYcNLzATMyW41KIduTRgXhZPDDRTmTjA13hZSgeCCH8zoXtrMRg2GqB2XPerCvP/a25Je/5m6plpx7m8pO3Y4j8RDwjkJl7L1eQZ7Cdl7/hXSWAOIX8/G3PWrjZllG8rPPTMOUNqhun8OOba1Kmf7sHvINhwJe7/iKR0hQrC9WAH3UDCB1OS9QUzP+gG7N16JVozSjWnzzcIrU5UZTMRdWhIFnNp2RA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=pXQnjJC2; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=pXQnjJC2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4clzm84YTpz2yr9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 14:12:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Zk1/jOtAJjGXriY1QIj9/1i2pa/kKwh++HrQqEhwTbs=; b=pXQnjJC2oFxKlczed4292ahRZN
	xjOVDwwSxWZxQDHRJqWNJ0WA10Zl4dqPl1toERoVcPuAmrnwQfwLTg99Sm+iudzCRvuk5F2xvvO0o
	vlNGToV8GYLk6GDvPEE6TxZU1VRgL752qgAL70jzY8MANbmfZb+SixL033RM62SCLkldL0+rEjGmq
	v6CbrdFenQ1jcI4iqx6kdpEEnZqrnQZ7okT5yn3/tEE6tCKglp9gNBucZZ6YP64rWj8FD0hzy5Nxz
	Db6/Jts60b0yvUwo1ggstZChSHTK1KmBRw6EOIETAIu1LNmQ+aXYk8F+/PcnZk2v9Si+EW+1e5Umx
	rsqUOLCg==;
Received: from [50.53.43.113] (helo=smtpauth.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8VSW-00000001b0v-0rLP;
	Tue, 14 Oct 2025 03:12:21 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linuxppc-dev@lists.ozlabs.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Geoff Levand <geoff@infradead.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/ps3: spu.c: fix enum and Return kernel-doc warnings
Date: Mon, 13 Oct 2025 20:12:17 -0700
Message-ID: <20251014031217.762837-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.51.0
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
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Fix enum and function return value kernel-doc warnings:

Warning: spu.c:36 Excess enum value '%spe_type_logical' description in 'spe_type'
Warning: spu.c:78 Excess enum value '%spe_ex_state_unexecutable' description in 'spe_ex_state'
Warning: spu.c:78 Excess enum value '%spe_ex_state_executable' description in 'spe_ex_state'
Warning: spu.c:78 Excess enum value '%spe_ex_state_executed' description in 'spe_ex_state'
Warning: spu.c:190 No description found for return value of 'setup_areas'

Fixes: de91a5342995 ("[POWERPC] ps3: add spu support")
Fixes: b47027795a22 ("powerpc/ps3: Fix ioremap of spu shadow regs")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Geoff Levand <geoff@infradead.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/platforms/ps3/spu.c |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

--- linux-next-20251013.orig/arch/powerpc/platforms/ps3/spu.c
+++ linux-next-20251013/arch/powerpc/platforms/ps3/spu.c
@@ -26,7 +26,7 @@
 
 /**
  * enum spe_type - Type of spe to create.
- * @spe_type_logical: Standard logical spe.
+ * @SPE_TYPE_LOGICAL: Standard logical spe.
  *
  * For use with lv1_construct_logical_spe().  The current HV does not support
  * any types other than those listed.
@@ -64,9 +64,9 @@ struct spe_shadow {
 
 /**
  * enum spe_ex_state - Logical spe execution state.
- * @spe_ex_state_unexecutable: Uninitialized.
- * @spe_ex_state_executable: Enabled, not ready.
- * @spe_ex_state_executed: Ready for use.
+ * @SPE_EX_STATE_UNEXECUTABLE: Uninitialized.
+ * @SPE_EX_STATE_EXECUTABLE: Enabled, not ready.
+ * @SPE_EX_STATE_EXECUTED: Ready for use.
  *
  * The execution state (status) of the logical spe as reported in
  * struct spe_shadow:spe_execution_status.
@@ -185,6 +185,8 @@ static void spu_unmap(struct spu *spu)
  *
  * The current HV requires the spu shadow regs to be mapped with the
  * PTE page protection bits set as read-only.
+ *
+ * Returns: %0 on success or -errno on error.
  */
 
 static int __init setup_areas(struct spu *spu)

