Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 454984F6279
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 17:01:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYSPt1Gf1z3bxf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 01:01:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bMwKw67c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYSLl486Kz2yZC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 00:58:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=bMwKw67c; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KYSLl3BRzz4xcH;
 Thu,  7 Apr 2022 00:58:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1649257103;
 bh=V71zMXwoqSeQ58zFzPNBvyRnbEEKXk3ZVOSK2J/4mKM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bMwKw67cwP1Qnza2AVyprtS4dDz3O1jb6o2/4+4/zls0y7j2vGTs/pCxhzRa4RwFV
 iATrXo9OPotx73VlxnlEUlGcv3w61iQjgotux6X1X7HmEq27bi9tc+EOLdS0QS7UsT
 oIgM3zYFByfu7VW8Gv3iP+ZNvXYykJrHrvXY1N4v4ueWSTKLhmT/AxqvKyJ4JvtxpZ
 Umat9GluSmBv1e3XnYxk/WBC8iBUmVeGgmlgEIdLaoUJ9bnDpf5iRt2ckzdQq2NAc0
 I30ZsF2o2pOtbwBuwDvw77Rxdeq4n4Pt1E3KKgMs2eUq+9VbhcvFXTjYwEE573zQbs
 Ke7+OANEkcUwg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC PATCH 6/6] powerpc/mm: Add virt_addr_valid() checks
Date: Thu,  7 Apr 2022 00:58:02 +1000
Message-Id: <20220406145802.538416-6-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220406145802.538416-1-mpe@ellerman.id.au>
References: <20220406145802.538416-1-mpe@ellerman.id.au>
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
Cc: erhard_f@mailbox.org, wangkefeng.wang@huawei.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We've had several bugs now with virt_addr_valid() being wrong, so lets
add some always-enabled boot time checks that it behaves as expected.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/mm/mem.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 4d221d033804..81e9d948a8e8 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -305,6 +305,13 @@ void __init mem_init(void)
 		MODULES_VADDR, MODULES_END);
 #endif
 #endif /* CONFIG_PPC32 */
+
+	// Check virt_addr_valid() works as expected
+	WARN_ON(!virt_addr_valid(PAGE_OFFSET));
+	WARN_ON(virt_addr_valid(PAGE_OFFSET - 1));
+	WARN_ON(virt_addr_valid(high_memory));
+	WARN_ON(virt_addr_valid(VMALLOC_START));
+	WARN_ON(virt_addr_valid(VMALLOC_END - 1));
 }
 
 void free_initmem(void)
-- 
2.34.1

