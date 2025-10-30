Return-Path: <linuxppc-dev+bounces-13563-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C11FAC20CC4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 16:00:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cy6jm105yz3dWG;
	Fri, 31 Oct 2025 02:00:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761836428;
	cv=none; b=kjdkut/Tf/VM0aQc9YO8gcMZpmM7txlyHoHyKimkobvqfqGOUQcXwrNn3hMROYVqXHS58Q/oQqgfnBw9wZNnGBxgqUindxs9t/61p1l3mAQX58dBSwMNq0yojHiSWomMjtM5eA6vYa9hmIyI7CsomB93ANj2fDJFCDUExa8cs0SzdjsRpumpQJYFqFDYTF9q2enXF+Pmt0YI122RJ7+kKlPJ4ir4xu9SvKMu7zaeHXXCypWMU4qneFgSXbKhDgi31gNsZt8ohGL4apTKlchrIIDWtbHUuve0VDZrpnqnGoAYkYEGdk5XMk0oj7op90CUcOkDz0grm9HOJjaF1jg7Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761836428; c=relaxed/relaxed;
	bh=+4rAKv4PmZEJIFa4SGWj/sUuj+6CVYRuhRBQv6edEEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ML+80HsqErpIdvHYdqDgJnAqfC7yKlJO6cMQxcpLJgZPTtzK131Bhk+YNrc1LjVxLyxuQo/B8avYRWTt61sEDvRp79s+6z2krbQBXagoIZY/5HvLHf6N096NVv6E9O2yN/UuB6qU7EIfzrfSjEVFOZCU+rD7lRBBLw1Qldy3zBrJwOrh3Ygh1OZMj0oLglhCpwpWVEh7CE0SZXGBxdUEO21bHWqOzBwpK5/siP18QslasxULulsvO2qiYF+br7SSJt9qZrw3dthIYLpUvnozeytmYXPDd9MiJP4tJJbTMawnxg54mYub9iP3LzJquO7mOgi4ZAaKV0WjJ+grbxqUMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bksfjUwF; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bksfjUwF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cy6jl3wQWz3dV4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 02:00:27 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7a26b9a936aso962067b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 08:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761836425; x=1762441225; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4rAKv4PmZEJIFa4SGWj/sUuj+6CVYRuhRBQv6edEEw=;
        b=bksfjUwFg3b1QiDofpOszC3wVAR4vGCZEBCoMUru9uJAApRSK+P2ulrDaNm5IKbgtQ
         SHhu1+/WkOwpDS9cWYJPjCqztxeKAbz2zbXaM85HnqejIRxeoCGZmDLX4btuSKi8TmtK
         TvidwnVNBzPhCkxzxTYb5nt17DpnGRzkAUwuCeZjH+qpRlhmsUSphl/Jg4ONwyukFNKc
         BbZU3kVllRq8b4UG9ovfUVbdeebJMIDzOvKgmGe0vzB88mfHMuD3kz8GLT6vF9IlYPJ2
         T5hWbOPMNdP+jYWNroaX//Z4mOIdk2IUdimoOgKQYqmSHQxJvJO4PeZbipNzE8xEBo61
         1mqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761836425; x=1762441225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4rAKv4PmZEJIFa4SGWj/sUuj+6CVYRuhRBQv6edEEw=;
        b=lRIxkWxuK0Vxic90fnkwG+Usy2la131K9Kx81NMvEFinRY5Z/w8E/2hidWqAqrrsGS
         AaVv5xWwuNfXAYWBrEBQ1UXBdleCkjYS0gXbosJHxSKJtOMhmZ4Wb7yw031lqZ2SCQog
         siJmcd8LzCLUV+pINVzgiJCU8fP8rAd0O0wKHckXdrf1mg9TCV99H9hfB0Ke09ZV3o4l
         k44kQ5Hzn6hdqz6++9p3uRNqj1cwMT3H/GEEJ2peUQI6Q1W/KAH8uQE3f7hYJwjVxiiO
         wvoZ5supnnBvVZHvVljm94atFojP/dbiLmX358CjlaMbjK7FgO5Oq8FsWub8EKazEAHL
         euvA==
X-Gm-Message-State: AOJu0YxZuXitQiWfM4ceIgQYQg350CLbIwNsMjxtTZoUYgv6/lNlR16t
	/l7imQJcUCvLr9BIfHFg82UBMqTEmOzgBjuIKYgYzKT1zknLfBnY/ZjmBvUHXixK
X-Gm-Gg: ASbGnctljuZes0w+CjzNH0PhcILFSNs9F6GE8BkW7it+e38xug8fHRXf6DtxdIl00Jv
	tIslRcdXCY/QV5HP3R6yZNvaTxya/e8Cb7cFjpPzpMWKqcZd6o0JSkMKpTH+43mLdTxTOgoGxot
	pmmS6xQebJ9VY19ZrdvdYOUrkQN3Uy2yZMntXMj8m6N+DEVHwp1jbrmRMspCwgr1Qc3xQyO28sr
	PqmVUjZK7Sr1lz/Wjc3LPrWM/7HswgwBvsb+MLyRUcwrmlgx44Q5XcIDsctDmgNJXibktFUcGvW
	OHGzUd9ke4Gr99pTnTZAUw7O/pNyd/q3Zja+mf6i3/r2z6KYGdyIeK7+wp1LfEeeYGMqW4Dn96J
	/w8kG50iGQ5GGWYGOwnb0b97h2KcrUbeeDEc0LW1dLmGuAZESa2yeHvxJMB3lYuBlD4gpCWIqpU
	WNWoe/
X-Google-Smtp-Source: AGHT+IESLF7BCWq4voU+MY/FMoAHAjII1yDXkUgVqchViaQ6E9uP6Kk6PF22N1VqiRNoTUmoSzor2Q==
X-Received: by 2002:a05:6a20:7348:b0:262:c083:bb41 with SMTP id adf61e73a8af0-34784e3d3d7mr4839821637.3.1761836424796;
        Thu, 30 Oct 2025 08:00:24 -0700 (PDT)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41404987esm18594112b3a.36.2025.10.30.08.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 08:00:22 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Mackerras <paulus@ozlabs.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.ibm.com>,
	Pavithra Prakash <pavrampu@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v2 07/11] powerpc/64s/hash: Update directMap page counters for Hash
Date: Thu, 30 Oct 2025 20:27:32 +0530
Message-ID: <208e6f946d2ba9c1e2b8b4f665728abe5c891e7c.1761834163.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1761834163.git.ritesh.list@gmail.com>
References: <cover.1761834163.git.ritesh.list@gmail.com>
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

Update the directMap page counters for Hash. Hash by default always uses
mmu_linear_psize only, for it's directMap. However, once the kernel has
booted and the dmesg log is wrapped over there is no way of knowing the
kernel linear pagesize with Hash mmu. Features like debug_page_alloc can
make mmu_linear_psize to be PAGE_SIZE instead of PMD / PUD mappings. It
would be easier if we have this info printed in proc meminfo similar to
Radix for debugging purposes.

Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Paul Mackerras <paulus@ozlabs.org>
Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
Cc: Donet Tom <donettom@linux.ibm.com>
Cc: <linuxppc-dev@lists.ozlabs.org>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index e63befc96708..31162dbad05c 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -47,6 +47,7 @@
 #include <asm/mmu.h>
 #include <asm/mmu_context.h>
 #include <asm/page.h>
+#include <asm/pgalloc.h>
 #include <asm/types.h>
 #include <linux/uaccess.h>
 #include <asm/machdep.h>
@@ -449,6 +450,7 @@ static __init void hash_kfence_map_pool(void)
 {
 	unsigned long kfence_pool_start, kfence_pool_end;
 	unsigned long prot = pgprot_val(PAGE_KERNEL);
+	unsigned int pshift = mmu_psize_defs[mmu_linear_psize].shift;
 
 	if (!kfence_pool)
 		return;
@@ -459,6 +461,7 @@ static __init void hash_kfence_map_pool(void)
 	BUG_ON(htab_bolt_mapping(kfence_pool_start, kfence_pool_end,
 				    kfence_pool, prot, mmu_linear_psize,
 				    mmu_kernel_ssize));
+	update_page_count(mmu_linear_psize, KFENCE_POOL_SIZE >> pshift);
 	memblock_clear_nomap(kfence_pool, KFENCE_POOL_SIZE);
 }
 
@@ -1234,6 +1237,7 @@ int hash__create_section_mapping(unsigned long start, unsigned long end,
 				 int nid, pgprot_t prot)
 {
 	int rc;
+	unsigned int pshift = mmu_psize_defs[mmu_linear_psize].shift;
 
 	if (end >= H_VMALLOC_START) {
 		pr_warn("Outside the supported range\n");
@@ -1251,17 +1255,22 @@ int hash__create_section_mapping(unsigned long start, unsigned long end,
 					      mmu_kernel_ssize);
 		BUG_ON(rc2 && (rc2 != -ENOENT));
 	}
+	update_page_count(mmu_linear_psize, (end - start) >> pshift);
 	return rc;
 }
 
 int hash__remove_section_mapping(unsigned long start, unsigned long end)
 {
+	unsigned int pshift = mmu_psize_defs[mmu_linear_psize].shift;
+
 	int rc = htab_remove_mapping(start, end, mmu_linear_psize,
 				     mmu_kernel_ssize);
 
 	if (resize_hpt_for_hotplug(memblock_phys_mem_size()) == -ENOSPC)
 		pr_warn("Hash collision while resizing HPT\n");
 
+	if (!rc)
+		update_page_count(mmu_linear_psize, -((end - start) >> pshift));
 	return rc;
 }
 #endif /* CONFIG_MEMORY_HOTPLUG */
@@ -1304,6 +1313,7 @@ static void __init htab_initialize(void)
 	unsigned long prot;
 	phys_addr_t base = 0, size = 0, end, limit = MEMBLOCK_ALLOC_ANYWHERE;
 	u64 i;
+	unsigned int pshift = mmu_psize_defs[mmu_linear_psize].shift;
 
 	DBG(" -> htab_initialize()\n");
 
@@ -1404,6 +1414,8 @@ static void __init htab_initialize(void)
 
 		BUG_ON(htab_bolt_mapping(base, base + size, __pa(base),
 				prot, mmu_linear_psize, mmu_kernel_ssize));
+
+		update_page_count(mmu_linear_psize, size >> pshift);
 	}
 	hash_kfence_map_pool();
 	memblock_set_current_limit(MEMBLOCK_ALLOC_ANYWHERE);
@@ -1425,6 +1437,8 @@ static void __init htab_initialize(void)
 		BUG_ON(htab_bolt_mapping(tce_alloc_start, tce_alloc_end,
 					 __pa(tce_alloc_start), prot,
 					 mmu_linear_psize, mmu_kernel_ssize));
+		update_page_count(mmu_linear_psize,
+				  (tce_alloc_end - tce_alloc_start) >> pshift);
 	}
 
 
-- 
2.51.0


