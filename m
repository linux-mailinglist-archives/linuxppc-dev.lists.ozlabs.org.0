Return-Path: <linuxppc-dev+bounces-17267-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oASAJhg8oGmagwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17267-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 13:27:04 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A75001A5AB9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 13:27:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fM9gg1FVfz309y;
	Thu, 26 Feb 2026 23:26:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::430"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772108815;
	cv=none; b=atnKfb9sSV4y8uCzRhytaLTUByO2Xq1y+NbKjvp/Qdn1aneZSuQ4W+INFu7gpIgzEY9DHvr+FkK123HCnqxZpwzGAR2AnoNvDKpRC5+649w3tdNYNQPvUpln68GCqbvRGQAwKWL+a7bYMU0kukm7AFdPAw6rp9m+WpVF3DN4xx/EMC+BcQBqPFSihY1AX04h6qskOiyKqR5cTGz4TCbb9JlNjIPSdfUgNeqr+UC/+VMkCdvcIzPQpc9TDAj6JkVva8NvI1w/8lxLBIF7w/cpXNnPcV4I8xVmTM/uuHNp1u7JQ16vhvH9Wi5Fq5MDEa4msxaWb5ZKcxH/PCskUxp5sA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772108815; c=relaxed/relaxed;
	bh=keG28VRg7hb2nWNj2uJ8lKl/FGoScXVGvErAk96Ikwo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cH9vBs8Rnk6u9op+MbZ+8qj14phcCGxQ5ccwVr7L2sAE2BWCJ112EqILU6wnAgXnsVzQydLeFavx6igeXiZCeve0h56d5q6naf82Yc+QVJeteoTp63b0ZFU4u2cOUR9uNDTs9fvMsdIWT2GDZt/BAnqn3NC0iFcahNaAiVVexfrvTbh9aO3OLk33JUSfVV0a4wjFKrcB8mI3VfxhRJvuPmu3pg1aLh21Sl7jxEokruKCkc+kidnM5/PUmL1s9jkhT33KAK5QCJ/imALxWXQC19XwJfTE8LfCP7ZA3XepNS0bPz0r1UyxURywta2fju7okAzLvHbYKQcAl51xJ5I0ng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TVMqtxQP; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TVMqtxQP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fM9gd4xxtz2xLv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 23:26:53 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-827307b12dfso411035b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 04:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772108811; x=1772713611; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=keG28VRg7hb2nWNj2uJ8lKl/FGoScXVGvErAk96Ikwo=;
        b=TVMqtxQPIUkxfVpvocrKjorimIDo9QeUVGOIpHGpg/aC181smqjzsAKenPqOzie1FX
         j0NpNDWlIU37YirRhpO7T7V3ojXePZB7ThT8ttPhf7aO8+xxopgVyxH+2HrNbfvJcFiV
         mIBqxAgOP9MFEAB4GVaUIfJ4hpH59nLccjUIBG3RNGTkit1zpoa/AxZgCE2uAkcko8uE
         WD2iBNuO5W0is15eabcu/esMS2cG3qlbWvkaElWoguhTY4wG0xv4Gow4I18SIBTlCFrK
         qe52bjyV4MqZnXIjyYlLTBZBoZTDtcM/wrexvhuQTGLCiUr26olKqQDrO33TZSjAv/nx
         Twpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772108811; x=1772713611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keG28VRg7hb2nWNj2uJ8lKl/FGoScXVGvErAk96Ikwo=;
        b=jkrXM+GmdO//VqP8VsZIbGwPJUI5XflmJ/A6Nk6VG+zCKsPJZGplfLdSMPYEXkLSvM
         4PU2vRinY/nDJlI//YJKTwkDmGvcKXG7RXfNn8YYXGlh0iKqTNNYWNcrLqIWWS5XQFUh
         sWklrvyRVbDigUKPXqS2gfMGEieIV5kyI9h5Za2xSvwet+fDNMDbthIixege29kuGeFi
         Dp6p4NXBdqx+voPxbPxohnaHH7HznDYwpcW+bOfTGn0CVvHkNGO1iDmg5d1NgWXodAFx
         L3jI8d/E/jI8CfsKO3+2BtXB/GlH4m1nAJOOl++EDwLvElsneazbJk2g99hip2caFcNq
         lmFw==
X-Forwarded-Encrypted: i=1; AJvYcCXonExDYQyWKIXRy+z2cLiX0ehoAmKj2yHfuMaPMlAl4fewuBsLi057IHdS4UMd6eN0g8/UFvxYOeUJNJg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwRD6be8/Tv49IuI2tNICyi7k6FXOi1KSaigG/9tYKN1/l6rXe/
	SiHifYSOZUIlj81qboyPYZHXLPJjdrPceLK/MqnESGPqGsOUbHA0Iik5R1DzDg==
X-Gm-Gg: ATEYQzwhkJQNxUckgpdXhG5pxyG/Imn0tUKrGZp11DLoMsvUggDzYE9Lzj8U7BKHk6W
	EdHoDH79AXqPSxxxDHLJX2PEo5B0xXmmRWfiSpewZXMAdC5jUNd+gL4yj8UY9H7eCpuG9jEaap0
	9qZxThT/hBugaimAmmjn39x7lZkJ7BldxJYPZCMFEuqmHMAffZzGKeOldIB4ctGEa39tHo8GW3p
	gmsJBEv7fD6HZhYuk/+RYOwKQvsvf+B4c8Dz06+AlJyXa0Z4niVRYNGcmT6vcIlvuQ4TNyXb6Pn
	Ra9umEc3TK/t0MbczM9FFchVEKgptrY3M8IxJVZ/ybpmXy11uevxpbBwpaN33VP+n3KS61z7ra3
	DSwmv07AwMcSPnXaK1aOVdfkTrlqFX8lC1ee7Wr3dB35HCtzb3NRVhvacRUYKLbDAzHxz2M6bIi
	R4sKVkT9Mic6hA1K/O6A==
X-Received: by 2002:a05:6a00:1d14:b0:7e8:3fcb:9b00 with SMTP id d2e1a72fcca58-827398063bemr1923995b3a.22.1772108810592;
        Thu, 26 Feb 2026 04:26:50 -0800 (PST)
Received: from dw-tp ([203.81.243.177])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a01aa09sm2958494b3a.48.2026.02.26.04.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:26:48 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linux-mm@kvack.org
Cc: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linuxppc-dev@lists.ozlabs.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH] mm/hugetlb.c: Use __pa() instead of virt_to_phys() in early bootmem alloc code
Date: Thu, 26 Feb 2026 17:56:30 +0530
Message-ID: <b4a7d2c6c4c1dd81dddc904fc21f01303290a4b8.1772107852.git.riteshh@linux.ibm.com>
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
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17267-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:rppt@kernel.org,m:akpm@linux-foundation.org,m:linuxppc-dev@lists.ozlabs.org,m:ritesh.list@gmail.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,lists.ozlabs.org,gmail.com];
	NEURAL_HAM(-0.00)[-0.982];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.ibm.com:mid]
X-Rspamd-Queue-Id: A75001A5AB9
X-Rspamd-Action: no action

Architecture like powerpc, checks for pfn_valid() in their
virt_to_phys() implementation (when CONFIG_DEBUG_VIRTUAL is enabled) [1].
Commit d49004c5f0c1 "arch, mm: consolidate initialization of nodes, zones and memory map"
changed the order of initialization between hugetlb_bootmem_alloc() and
free_area_init(). This means, pfn_valid() can now return false in
alloc_bootmem() path, since sparse_init() is not yet done.

Since, alloc_bootmem() uses memblock_alloc(.., MEMBLOCK_ALLOC_ACCESSIBLE), this
means these allocations are always going to happen below high_memory, where
__pa() should return valid physical addresses. Hence this patch converts
the two callers of virt_to_phys() in alloc_bootmem() path to __pa() to avoid
this bootup warning:

 ------------[ cut here ]------------
 WARNING: arch/powerpc/include/asm/io.h:879 at virt_to_phys+0x44/0x1b8, CPU#0: swapper/0
 Modules linked in:
 <...>
 NIP [c000000000601584] virt_to_phys+0x44/0x1b8
 LR [c000000004075de4] alloc_bootmem+0x144/0x1a8
 Call Trace:
 [c000000004d1fb50] [c000000004075dd4] alloc_bootmem+0x134/0x1a8
 [c000000004d1fba0] [c000000004075fac] __alloc_bootmem_huge_page+0x164/0x230
 [c000000004d1fbe0] [c000000004030bc4] alloc_bootmem_huge_page+0x44/0x138
 [c000000004d1fc10] [c000000004076e48] hugetlb_hstate_alloc_pages+0x350/0x5ac
 [c000000004d1fd30] [c0000000040782f0] hugetlb_bootmem_alloc+0x15c/0x19c
 [c000000004d1fd70] [c00000000406d7b4] mm_core_init_early+0x7c/0xdf4
 [c000000004d1ff30] [c000000004011d84] start_kernel+0xac/0xc58
 [c000000004d1ffe0] [c00000000000e99c] start_here_common+0x1c/0x20

[1]: https://lore.kernel.org/linuxppc-dev/87tsv5h544.ritesh.list@gmail.com/

Fixes: d49004c5f0c1 ("arch, mm: consolidate initialization of nodes, zones and memory map")
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 mm/hugetlb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 6e855a32de3d..43e0c95738a6 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3101,7 +3101,7 @@ static __init void *alloc_bootmem(struct hstate *h, int nid, bool node_exact)
 			 * extract the actual node first.
 			 */
 			if (m)
-				listnode = early_pfn_to_nid(PHYS_PFN(virt_to_phys(m)));
+				listnode = early_pfn_to_nid(PHYS_PFN(__pa(m)));
 		}

 		if (m) {
@@ -3160,7 +3160,7 @@ int __alloc_bootmem_huge_page(struct hstate *h, int nid)
 	 * The head struct page is used to get folio information by the HugeTLB
 	 * subsystem like zone id and node id.
 	 */
-	memblock_reserved_mark_noinit(virt_to_phys((void *)m + PAGE_SIZE),
+	memblock_reserved_mark_noinit(__pa((void *)m + PAGE_SIZE),
 		huge_page_size(h) - PAGE_SIZE);

 	return 1;
--
2.53.0


