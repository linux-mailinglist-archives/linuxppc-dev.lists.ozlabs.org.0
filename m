Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2808968DB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 10:38:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iOajfwoF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8dRt3VJ6z3vZl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 19:38:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iOajfwoF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8dQW0cdMz3dVK
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 19:36:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 00DBF60DBF;
	Wed,  3 Apr 2024 08:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 212EAC433C7;
	Wed,  3 Apr 2024 08:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712133406;
	bh=gD+sFmpPjgeLaNs13abGToIsWYt6TnwbB3go/k3V6mk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iOajfwoFyvzlvsSLX1nh5OFWPMxG8b0AFKjVPgVkv/NBBlk7IP9rVZJjIY22JMq1v
	 H2udblEUf7NZOfUS9Ev4nv4nrqU9/cNoyg0TFF8RtfzbA78W+Z19i05bEGKI8gvbOb
	 IVd6qS5KikNBM8hkAFPuBOLPQxXTyjjA5qhu/iBT6ntFO4CtFbVphFGzqE8edmqGOe
	 zGbpXaxoqkNUFsgNtzeBC0jbljBLglNRzem304LVKm6JJs9NfkKsVlO9yd2cSlRJzY
	 gWZBhabPuMbj9jFsBD7lLpgzvZbtxPpijoqPddNFN3VZswAtiTYHn6o0I++ia61NWi
	 otLbfF/lnMw/g==
From: "Aneesh Kumar K.V (IBM)" <aneesh.kumar@kernel.org>
To: linuxppc-dev@lists.ozlabs.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu
Subject: [PATCH 2/3] powerpc/fadump: Don't update the user-specified memory limit
Date: Wed,  3 Apr 2024 14:06:10 +0530
Message-ID: <20240403083611.172833-2-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403083611.172833-1-aneesh.kumar@kernel.org>
References: <20240403083611.172833-1-aneesh.kumar@kernel.org>
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
Cc: "Aneesh Kumar K.V \(IBM\)" <aneesh.kumar@kernel.org>, Naveen N Rao <naveen@kernel.org>, Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If the user specifies the memory limit, the kernel should honor it such
that all allocation and reservations are made within the memory limit
specified. fadump was breaking that rule. Remove the code which updates
the memory limit such that fadump reservations are done within the
limit specified.

Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com> 
Signed-off-by: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
---
 arch/powerpc/kernel/fadump.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index d14eda1e8589..4e768d93c6d4 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -573,22 +573,6 @@ int __init fadump_reserve_mem(void)
 		}
 	}
 
-	/*
-	 * Calculate the memory boundary.
-	 * If memory_limit is less than actual memory boundary then reserve
-	 * the memory for fadump beyond the memory_limit and adjust the
-	 * memory_limit accordingly, so that the running kernel can run with
-	 * specified memory_limit.
-	 */
-	if (memory_limit && memory_limit < memblock_end_of_DRAM()) {
-		size = get_fadump_area_size();
-		if ((memory_limit + size) < memblock_end_of_DRAM())
-			memory_limit += size;
-		else
-			memory_limit = memblock_end_of_DRAM();
-		printk(KERN_INFO "Adjusted memory_limit for firmware-assisted"
-				" dump, now %#016llx\n", memory_limit);
-	}
 	if (memory_limit)
 		mem_boundary = memory_limit;
 	else
-- 
2.44.0

