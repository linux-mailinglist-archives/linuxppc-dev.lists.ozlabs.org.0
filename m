Return-Path: <linuxppc-dev+bounces-2098-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 897DA999DCA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 09:23:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPym85yrqz2xbY;
	Fri, 11 Oct 2024 18:23:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728631432;
	cv=none; b=h7AUyMH3aG5bpKjaA1Ge+clhW69mfyTCHX9W1Gl1J/JWpwkRvgw760XAsQfvEoWDc40kLLyTx2S7YYbN1IkZWZe2DrnLTgB0gkKEBBRiwD3Yn8nkS9ZJE7WJ1NR64MctGIv2zSTZY99qpbtzJi/xtBZKqSwwPPc/WdTDNfOcYuG/ff0NLNgzQM4DtJ3ExpV5P3i64cLsvISmqvbRuBDahgqbibcttw7ejzY8oUcyYaZgQwQHAllTD7DU5a0Y/C+5+65OJnROdwvkSVAUMhT8dSgn4cB06+AzZgIYxJ5VVdLkXrsGaor/GWrpJWJ1QMP4DGH/dLwiwVgSiJB0gRBlDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728631432; c=relaxed/relaxed;
	bh=43KeZkjM4JRDWlxAgOLwxp7bBo4Ct6yjaya1Z8Z5TnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jpZoHip9OvcPxN7r+a1JwvPLpK7JW46uG5+qrdMkJBr+tJyf0pZnBoYyDV5aQmm7etmsrJw6/cT4mGOPjan57TksfLUNEsnSIEG50EGzc7UuuCCJhXgt8Ntx9FgRsi1kocne0gAfDTtybV4Ko4af99p2/DHGeJDBAUuxmz6xVl5D0wlhRKx93FJdDkgbhl8WGTHJLj8KxMrbShyAHKuNQ71ow72Vj+7RU/r+pYntZ04LB4brJxvdZh5XdALP8SNJN50uA6tJqSTeFDhChMbcV8ooGtd3lwe83bIgx9wBxWd3TxDUwiS86UU6wsEhjSwnJm/FhZA9zfLkqZ/glas9CQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gfcdsyjF; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gfcdsyjF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPym76Xjvz2xF0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 18:23:51 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20c7ee8fe6bso13427095ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 00:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728631429; x=1729236229; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43KeZkjM4JRDWlxAgOLwxp7bBo4Ct6yjaya1Z8Z5TnE=;
        b=gfcdsyjF26d2XprNxH3Ij9QqFYx3kNG/wc3fHbfrSqe4FsPLvjP4PToqGT0cm2g59l
         BUekYa5XhoQAYAFKxyr0W6VgKhaFX7pZ9nyEoVfI0EuUvUml/7VEu0O3hAOHAbCQIUqa
         jCBHWuD0RufmMmoI7GTZ2bo2TuDkGOQ4+dgePHa9Ymg28p2E2iz4xZctVziXx2z07GDm
         90g4cWJKw14w13fOCx9UcAWNh5YL9tKg0E8Q/cWR5s45hhX+uA1PRH0C/R7asYzVxx3c
         fgID5wXEMfqjhidIllmff8gZIHePafdw/pPF2yRD9yT3fruDvncesUvjc/tBkDL9Ivz2
         hEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728631429; x=1729236229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43KeZkjM4JRDWlxAgOLwxp7bBo4Ct6yjaya1Z8Z5TnE=;
        b=DdtXqbKbIT3XrL/868aAK9K1jPVucsMsLCPGRq1elAYLvvrvjClLeBi7iV8Lb8ViOe
         bzs8qQ6DVutx2SK0cWVoNOA7rpA0IhTdNwjeOJw3TE6BGwUgOKKfvpUGx4uDSW0Rsg+/
         Z4gPx4Q55wL2otyYo3AdZSNMDztd9VvGQhRewl9C7E5svjjo3oQKpTZWrktNBtmhr+PZ
         Lg1geVK/smr344vxGw5PJAkoA2czCeJOU2HM/gZ8HdU1KAQO85NiRVqdO0Go8/NedLld
         hhlDEFqALHtnoxH9IGkeBUP/yC+aTApE92qm11Cu2uWZOuJfgAhdVh1B+3eORpb1aBz2
         K02A==
X-Gm-Message-State: AOJu0YwDqoXyMYJIoTrxJhp3/t9YupFM42jP2IR1DxRynovYnE0ehV20
	TEtRfB3lJcrvDLIEfwtROUyDFLkVqpOz8BgdWYUX+DDX31Ff0IbCkoRmcw==
X-Google-Smtp-Source: AGHT+IHvKjtMrFH1g3CLZPdSwjhTqkQHVaREuW1zEqrR1VLtKD+N3w5sn140uSYgK0zgLCGlE26s+w==
X-Received: by 2002:a17:903:228b:b0:20b:fa34:7325 with SMTP id d9443c01a7336-20ca16c5acfmr22757985ad.43.1728631428668;
        Fri, 11 Oct 2024 00:23:48 -0700 (PDT)
Received: from dw-tp.ibmuc.com ([49.205.218.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8bad335dsm18825155ad.50.2024.10.11.00.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 00:23:48 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Zi Yan <ziy@nvidia.com>,
	David Hildenbrand <david@redhat.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.vnet.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Sachin P Bappalige <sachinpb@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC v2 4/4] fadump: Move fadump_cma_init to setup_arch() after initmem_init()
Date: Fri, 11 Oct 2024 12:53:12 +0530
Message-ID: <819b34cc6dd63e21f142c1adbc1a88bc57f3db54.1728585512.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1728585512.git.ritesh.list@gmail.com>
References: <cover.1728585512.git.ritesh.list@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

During early init CMA_MIN_ALIGNMENT_BYTES can be PAGE_SIZE,
since pageblock_order is still zero and it gets initialized
later during initmem_init() e.g.
setup_arch() -> initmem_init() -> sparse_init() -> set_pageblock_order()

One such use case where this causes issues is -
early_setup() -> early_init_devtree() -> fadump_reserve_mem() -> fadump_cma_init()

This causes CMA memory alignment check to be bypassed in
cma_init_reserved_mem(). Then later cma_activate_area() can hit
a VM_BUG_ON_PAGE(pfn & ((1 << order) - 1)) if the reserved memory
area was not pageblock_order aligned.

Fix it by moving the fadump_cma_init() after initmem_init(),
where other such cma reservations also gets called.

<stack trace>
==============
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x10010
flags: 0x13ffff800000000(node=1|zone=0|lastcpupid=0x7ffff) CMA
raw: 013ffff800000000 5deadbeef0000100 5deadbeef0000122 0000000000000000
raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: VM_BUG_ON_PAGE(pfn & ((1 << order) - 1))
------------[ cut here ]------------
kernel BUG at mm/page_alloc.c:778!

Call Trace:
__free_one_page+0x57c/0x7b0 (unreliable)
free_pcppages_bulk+0x1a8/0x2c8
free_unref_page_commit+0x3d4/0x4e4
free_unref_page+0x458/0x6d0
init_cma_reserved_pageblock+0x114/0x198
cma_init_reserved_areas+0x270/0x3e0
do_one_initcall+0x80/0x2f8
kernel_init_freeable+0x33c/0x530
kernel_init+0x34/0x26c
ret_from_kernel_user_thread+0x14/0x1c

Fixes: 11ac3e87ce09 ("mm: cma: use pageblock_order as the single alignment")
Suggested-by: David Hildenbrand <david@redhat.com>
Reported-by: Sachin P Bappalige <sachinpb@linux.ibm.com>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/include/asm/fadump.h  | 7 +++++++
 arch/powerpc/kernel/fadump.c       | 6 +-----
 arch/powerpc/kernel/setup-common.c | 6 ++++--
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/fadump.h b/arch/powerpc/include/asm/fadump.h
index ef40c9b6972a..3638f04447f5 100644
--- a/arch/powerpc/include/asm/fadump.h
+++ b/arch/powerpc/include/asm/fadump.h
@@ -34,4 +34,11 @@ extern int early_init_dt_scan_fw_dump(unsigned long node, const char *uname,
 				      int depth, void *data);
 extern int fadump_reserve_mem(void);
 #endif
+
+#if defined(CONFIG_FA_DUMP) && defined(CONFIG_CMA)
+void fadump_cma_init(void);
+#else
+static inline void fadump_cma_init(void) { }
+#endif
+
 #endif /* _ASM_POWERPC_FADUMP_H */
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index ffaec625b7a8..c42f89862893 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -78,7 +78,7 @@ static struct cma *fadump_cma;
  * But for some reason even if it fails we still have the memory reservation
  * with us and we can still continue doing fadump.
  */
-static void __init fadump_cma_init(void)
+void __init fadump_cma_init(void)
 {
 	unsigned long long base, size, end;
 	int rc;
@@ -139,8 +139,6 @@ static void __init fadump_cma_init(void)
 		fw_dump.boot_memory_size >> 20);
 	return;
 }
-#else
-static void __init fadump_cma_init(void) { }
 #endif /* CONFIG_CMA */

 /*
@@ -642,8 +640,6 @@ int __init fadump_reserve_mem(void)

 		pr_info("Reserved %lldMB of memory at %#016llx (System RAM: %lldMB)\n",
 			(size >> 20), base, (memblock_phys_mem_size() >> 20));
-
-		fadump_cma_init();
 	}

 	return ret;
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 943430077375..b6b01502e504 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -997,9 +997,11 @@ void __init setup_arch(char **cmdline_p)
 	initmem_init();

 	/*
-	 * Reserve large chunks of memory for use by CMA for KVM and hugetlb. These must
-	 * be called after initmem_init(), so that pageblock_order is initialised.
+	 * Reserve large chunks of memory for use by CMA for fadump, KVM and
+	 * hugetlb. These must be called after initmem_init(), so that
+	 * pageblock_order is initialised.
 	 */
+	fadump_cma_init();
 	kvm_cma_reserve();
 	gigantic_hugetlb_cma_reserve();

--
2.46.0


