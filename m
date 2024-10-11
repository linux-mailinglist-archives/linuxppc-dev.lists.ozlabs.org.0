Return-Path: <linuxppc-dev+bounces-2124-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DB799A712
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 17:00:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQ8v04SnTz3bxR;
	Sat, 12 Oct 2024 02:00:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728658828;
	cv=none; b=A/k0GdElSPYRmLfJpUWaI1uROa7bw4sjthw9JBPDcARI04HoqXDWZZTjMz6zP4cpYJzs/WCxQzjioEX08CVTNq6rayrKmJFzy/OFWEGsPnN7wK7ifW8Q8fRz51zKhw7e7kr/Sylow7UXLgtmfyMYF/W+oTa7T0E+ZxQjbeyuppKZbNnVtp4HT+eG/1O0abqHbGzq6qFgJEkeyA1SCtt85Zj4AJU6wFLesnZ8KlduFeSEmq0dRYhhNo6khVJl1AnTRahseZiRAAq/3KrmSzUHT2S1/2d4SvW08rjTemwh6/wVwZRFF1NThlr0LH66TxznNq98ofzkj16FznQCRMuRPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728658828; c=relaxed/relaxed;
	bh=SU6Z8cvJobq05V76diaI6hL+YRyehnIANBYxgVSeFp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dF7IYcsCTUrlL+5NZ79pqfABOyPsjtRfgDyXBAw0Aacw0MLEa2lT5KEmJ9KqCADgStUmEY7EFhvUMCj8Val45dP1XYQxABAT9IjMXefPk7IoZBS83kXs0PUFZv5wRUgHuHHyK0hlMoeDMo1caviftEOsK3x2sLT7A6+XyOv2iI9Ln4AtEiIpKv6+915glfw/SNmoL1AZrxxQqMW/9pN5TGmiY7zc34OemDm2oh6ZxF2IJkIVwRd3g8CQGOEUR+tIIMIDf5FqaQE2U0CT90V6onzs9rjld8V7/nO5LXakq/TbPKRAudMGMZxQJhVQnz1KP4zmSawswUOMYnNC2dP7tQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Z5AMKoHO; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Z5AMKoHO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQ8tz5gQZz3c2k
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 02:00:27 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-71de9e1f374so1570378b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 08:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728658825; x=1729263625; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SU6Z8cvJobq05V76diaI6hL+YRyehnIANBYxgVSeFp8=;
        b=Z5AMKoHOGUQ7QnFKBCULRjJvt91sW1NJPmj4hJIRMMx8wMWIS4mvqdYgKrQv/gVFMz
         xMkneIGcZNOjcNVwR6xX4D5NoQ2JBOZewTF/zNFpw6m+EiSR+IrU1tZkEL1DXwOJLafw
         MfoWHfqbz+Bw/gAnpkC7uGuawq4Q5iZc/xS29Puo5gfX5QTbOWgFeyRJVU/1OMvcab0O
         JvNfAnQJWZY1/Lm2i6odfjp5btJ2jUzV8Bey3IYeraHLDrI78D3WJqis9ciQBDcjEf30
         o1BrI3EefXsB8Y03SF5CpDWxEebZG7+TTVctLSe84HDNodUxLHq6x85OK+hK6fpSvx2E
         hZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728658825; x=1729263625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SU6Z8cvJobq05V76diaI6hL+YRyehnIANBYxgVSeFp8=;
        b=h4+RZOpjG5FlPhFGHeT/mgW2eOaw7c3og8PGrTb9UYVvmjZHdftICGwmZ9A4PtdZiS
         fv3SYVoMVbEPonn+lw6sxB1Z7BQ+WqzFA7D5sA7GGYir/fovfvGJaSpkNmId4H/ojdQO
         Stp9iQVeIgewvuIeNSV0+4kp6Y6WBH05HSfa1PI6KZq1IEYfTINwnUg+FRGRtfFty4nd
         GShcwEWpWneNFUWlr3L8klCNBSVlVSOlXBtubiaSknUbX2TdDxFsiWzvZRiEjju96irK
         uglu0HmuV4w3na1zcNyFHA8oKCjRNcZauYmDEiCdYyVclcK6zyo4rirdLiZ2hhwfE685
         M5ZA==
X-Gm-Message-State: AOJu0YwgRskRFVSUrfwNjX3klFCuE2Zf6+oRq/le9jj1iWsWzD/NbbbQ
	2rdex79xSxW/O1dXSFoMIW1IiriPdItYTg427PNNeNZ7GSbR56NtxUpIzQ==
X-Google-Smtp-Source: AGHT+IHIUtDDWU1ylOOcQb4+U5VINFQKXV7ELQ0WwbOcryePVBd3VxH1zwAA7jKr8WsXcEzg2aapfg==
X-Received: by 2002:a05:6a00:1941:b0:710:5848:8ae1 with SMTP id d2e1a72fcca58-71e37e28ad2mr5574776b3a.4.1728658825459;
        Fri, 11 Oct 2024 08:00:25 -0700 (PDT)
Received: from dw-tp.. ([171.76.85.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e4a2c9767sm146561b3a.85.2024.10.11.08.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 08:00:24 -0700 (PDT)
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
Subject: [RFC v3 3/3] fadump: Move fadump_cma_init to setup_arch() after initmem_init()
Date: Fri, 11 Oct 2024 20:30:06 +0530
Message-ID: <759d0fc37d9fedca6cfe78ea7061447ecbf1bc77.1728658614.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <030b6d46fddac126a6cf7e119bea48055338f0ed.1728658614.git.ritesh.list@gmail.com>
References: <030b6d46fddac126a6cf7e119bea48055338f0ed.1728658614.git.ritesh.list@gmail.com>
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
Acked-by: Hari Bathini <hbathini@linux.ibm.com>
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
index 4bd2f87616ba..9f1e6f2e299e 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -996,9 +996,11 @@ void __init setup_arch(char **cmdline_p)
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


