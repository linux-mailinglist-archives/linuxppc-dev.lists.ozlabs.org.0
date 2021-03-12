Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA97338695
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 08:32:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxcwQ0863z3cX6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 18:32:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=WnrHTrQ9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732;
 helo=mail-qk1-x732.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WnrHTrQ9; dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxcvY6N3hz3cjq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 18:31:53 +1100 (AEDT)
Received: by mail-qk1-x732.google.com with SMTP id x10so23383249qkm.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 23:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fc4O5pv8w+UBOc7tpUHlG/tnzkEXWGcP/NkkMTj4HMY=;
 b=WnrHTrQ9rMGxhYK4b0QrGskBKMQhbpuaGqvmnn4rgSgmcAL3savA+xCqvbdGpvcgnE
 QDZWdRutIOgzjvPUmDleii6sqx+ju3o9ARd8iDbi/nH0zSrCM0TPYBiIfPp62qct0FRx
 s6r15iEep1O0HBzOd3W3cjg8zI6TSrLMj68rufPiOosq2deyRLPkw9RdXIJaUzI0tu8w
 sui28kyfCiSCYb66GXwEEPcaAezV7TXvqdYpuVq7usm7e/wnTOjO83e4Iq7sB6Oic79f
 xI5LWhh/V5SKNELDQ+jZYu7XrT9UWE4iEocRsY4UU6dh6U3pS55WxP/ZbCfuRR0y1w7u
 A4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fc4O5pv8w+UBOc7tpUHlG/tnzkEXWGcP/NkkMTj4HMY=;
 b=FsBI72MHRA5bMBG4CvWxweAFTRbxSg0e4ttV5uy6bJl8CWVqOjjJBFtILYIw+zajgT
 3/UGoDVx5At1qr8rKdiT84uBAS/TAXmIvXrFHMtr1zpBEmcC2BEEFMV3qui1309rHIMf
 B2kTUoujZoodQLPqt4GWzgAuT5qltzZ459r3Pyx2A1bI1PKxIeLfiKnmgqNnicmit5xp
 lTmmYJfMBsamvkstO7sGHwKIPZyuRL6/3cXsnZ9ErkrtEy6sTZtf7GyjqdZAkg9kF3yR
 4ej37RbUpUn9/EdixMFGnlxVQBo4xyPHOKsmOHzJtdRiJzSryuPbSLziJZpVaQq4yS+/
 a0oQ==
X-Gm-Message-State: AOAM530cRxvrtnL3KP4BsrZjN4eSZRWt2DS4D/g72mnp9m3ghe3XZc5Y
 qz0bFxpQ4EvZUZUGQ+VOge8=
X-Google-Smtp-Source: ABdhPJxPASBlXNxbx3G4ZP89CIihfT21I2UHj792PRIeqO9rwGBCFMzd1o926upif/uvr4znSkrsOA==
X-Received: by 2002:a05:620a:31c:: with SMTP id
 s28mr11303310qkm.342.1615534308550; 
 Thu, 11 Mar 2021 23:31:48 -0800 (PST)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com.com
 (177-131-89-8.dynamic.desktop.com.br. [177.131.89.8])
 by smtp.gmail.com with ESMTPSA id t6sm3434026qti.2.2021.03.11.23.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 23:31:48 -0800 (PST)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Leonardo Bras <leobras.c@gmail.com>, Sandipan Das <sandipan@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Logan Gunthorpe <logang@deltatee.com>, Mike Rapoport <rppt@kernel.org>,
 Bharata B Rao <bharata@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Nicholas Piggin <npiggin@gmail.com>, Nathan Lynch <nathanl@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Laurent Dufour <ldufour@linux.ibm.com>,
 Scott Cheloha <cheloha@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 1/3] powerpc/mm/hash: Avoid resizing-down HPT on first memory
 hotplug
Date: Fri, 12 Mar 2021 04:29:39 -0300
Message-Id: <20210312072940.598696-2-leobras.c@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210312072940.598696-1-leobras.c@gmail.com>
References: <20210312072940.598696-1-leobras.c@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Because hypervisors may need to create HPTs without knowing the guest
page size, the smallest used page-size (4k) may be chosen, resulting in
a HPT that is possibly bigger than needed.

On a guest with bigger page-sizes, the amount of entries for HTP may be
too high, causing the guest to ask for a HPT resize-down on the first
hotplug.

This becomes a problem when HPT resize-down fails, and causes the
HPT resize to be performed on every LMB added, until HPT size is
compatible to guest memory size, causing a major slowdown.

So, avoiding HPT resizing-down on hot-add significantly improves memory
hotplug times.

As an example, hotplugging 256GB on a 129GB guest took 710s without this
patch, and 21s after applied.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 36 ++++++++++++++++-----------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 73b06adb6eeb..cfb3ec164f56 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -794,7 +794,7 @@ static unsigned long __init htab_get_table_size(void)
 }
 
 #ifdef CONFIG_MEMORY_HOTPLUG
-static int resize_hpt_for_hotplug(unsigned long new_mem_size)
+static int resize_hpt_for_hotplug(unsigned long new_mem_size, bool shrinking)
 {
 	unsigned target_hpt_shift;
 
@@ -803,19 +803,25 @@ static int resize_hpt_for_hotplug(unsigned long new_mem_size)
 
 	target_hpt_shift = htab_shift_for_mem_size(new_mem_size);
 
-	/*
-	 * To avoid lots of HPT resizes if memory size is fluctuating
-	 * across a boundary, we deliberately have some hysterisis
-	 * here: we immediately increase the HPT size if the target
-	 * shift exceeds the current shift, but we won't attempt to
-	 * reduce unless the target shift is at least 2 below the
-	 * current shift
-	 */
-	if (target_hpt_shift > ppc64_pft_size ||
-	    target_hpt_shift < ppc64_pft_size - 1)
-		return mmu_hash_ops.resize_hpt(target_hpt_shift);
+	if (shrinking) {
 
-	return 0;
+		/*
+		 * To avoid lots of HPT resizes if memory size is fluctuating
+		 * across a boundary, we deliberately have some hysterisis
+		 * here: we immediately increase the HPT size if the target
+		 * shift exceeds the current shift, but we won't attempt to
+		 * reduce unless the target shift is at least 2 below the
+		 * current shift
+		 */
+
+		if (target_hpt_shift >= ppc64_pft_size - 1)
+			return 0;
+
+	} else if (target_hpt_shift <= ppc64_pft_size) {
+		return 0;
+	}
+
+	return mmu_hash_ops.resize_hpt(target_hpt_shift);
 }
 
 int hash__create_section_mapping(unsigned long start, unsigned long end,
@@ -828,7 +834,7 @@ int hash__create_section_mapping(unsigned long start, unsigned long end,
 		return -1;
 	}
 
-	resize_hpt_for_hotplug(memblock_phys_mem_size());
+	resize_hpt_for_hotplug(memblock_phys_mem_size(), false);
 
 	rc = htab_bolt_mapping(start, end, __pa(start),
 			       pgprot_val(prot), mmu_linear_psize,
@@ -847,7 +853,7 @@ int hash__remove_section_mapping(unsigned long start, unsigned long end)
 	int rc = htab_remove_mapping(start, end, mmu_linear_psize,
 				     mmu_kernel_ssize);
 
-	if (resize_hpt_for_hotplug(memblock_phys_mem_size()) == -ENOSPC)
+	if (resize_hpt_for_hotplug(memblock_phys_mem_size(), true) == -ENOSPC)
 		pr_warn("Hash collision while resizing HPT\n");
 
 	return rc;
-- 
2.29.2

