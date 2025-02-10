Return-Path: <linuxppc-dev+bounces-6067-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F37D6A2FD93
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 23:43:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsKNr20Ylz2yGN;
	Tue, 11 Feb 2025 09:43:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::b4"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739227404;
	cv=none; b=LEHEZ0s58BkpJ4Ds8KiENH6eGqBmbIwfxGTJByjGatcjbT0HtnrmPA8+wwZi4JKg9XPE2X76nZVDXYDPZZdteTQWMAGan6NXTG4QYfTAvNczhJzP6vZzJ3im2bJKN+XMbzRu1qSm8uJGqamkRq8p+lrysc7UmagXWHipwf+Wqv2ZuVB+YIiXUttVaJM7Qi75zHZxwyQq19t9w78R4y7u3hZbRirPSlZdFk8A6x+9rIekJh4jE5LIvnqWy3v+Z53v1pXdTZePV5D/u70AoNopzRDfDeS9HOQzvBNyVbyiXe/N69UFDEJkGkHyQxDiB2mm8cGx+ZGrMY+WHtjHxI+Xzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739227404; c=relaxed/relaxed;
	bh=YZhQ2JMipPfK0C7SvJ4X1y2p34Ne5eOf0xju/PAVEgM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fff/MLMlS9QOe+rkSSGk2QuLdiDg26cM/5tJkShs/6u3cSfyGmx3hM3cO5CBj801gR6f06Lhrjv52I1mtgWknio39bIDYq/AFVZMWPOFHgqoD2thRcL2I+oUn+Uk93C3hrWQ2tCrxp2a7UkedvYbn3CR7mBXfKlHIlbO28j3SqLQv4gr0HF5uYnRHVbOR0eUlW2SmAcbFnWgry+hhvdgttlzeKkbiwCjfQGhCn21/bUoH/4plFeLb839C6Tm2E2oJZ+1wR1XvDlEcKpjKzqRs8YVYGe6WVbWsTvnPPkBIr2hOw+ABOQUdbh7L+jGJtGfz10bZOUYmGkbQFI7tb2rDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nXxFgAA0; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::b4; helo=out-180.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nXxFgAA0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::b4; helo=out-180.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [IPv6:2001:41d0:203:375::b4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YsKNm4w5lz2xsd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 09:43:19 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739227377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YZhQ2JMipPfK0C7SvJ4X1y2p34Ne5eOf0xju/PAVEgM=;
	b=nXxFgAA0saOIfIGqqMlqUuO0hqMX8oWX+vVvSMN286mIl1tb52GqSsZ1FTC2eV6AqWmiDj
	TA7yuvuzQC2bZ2EVToHRyY7aGc8W2zxgEwz0oZmJ+4Y6pkYmXfPcM6jY/XVNcFTXMh83c5
	MXFdazgQqH9rDpiIPHMya/Fkjob+CHI=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Shivaprasad G Bhat <sbhat@linux.ibm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Gaurav Batra <gbatra@linux.ibm.com>,
	Brian King <brking@linux.vnet.ibm.com>,
	Kent Overstreet <kent.overstreet@linux.dev>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/iommu: Use str_disabled_enabled() helper
Date: Mon, 10 Feb 2025 23:42:44 +0100
Message-ID: <20250210224246.363318-1-thorsten.blum@linux.dev>
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
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Remove hard-coded strings by using the str_disabled_enabled() helper.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/powerpc/kernel/iommu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index 0ebae6e4c19d..244eb4857e7f 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -16,6 +16,7 @@
 #include <linux/mm.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
+#include <linux/string_choices.h>
 #include <linux/dma-mapping.h>
 #include <linux/bitmap.h>
 #include <linux/iommu-helper.h>
@@ -769,8 +770,8 @@ struct iommu_table *iommu_init_table(struct iommu_table *tbl, int nid,
 	iommu_table_clear(tbl);
 
 	if (!welcomed) {
-		printk(KERN_INFO "IOMMU table initialized, virtual merging %s\n",
-		       novmerge ? "disabled" : "enabled");
+		pr_info("IOMMU table initialized, virtual merging %s\n",
+			str_disabled_enabled(novmerge));
 		welcomed = 1;
 	}
 
-- 
2.48.0


