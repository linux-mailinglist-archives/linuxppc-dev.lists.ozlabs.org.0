Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E10151FDA5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 04:06:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454FCB1FFWzDqWb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 12:06:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jgamNesH"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454F9X4XsLzDqVy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 12:04:46 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id h1so737292pgs.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 19:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9Twx/mkrh47iPEqgKXCY8jxCE/MeSIBsB4xJsbPqh+Q=;
 b=jgamNesHy6zrtLTAUXlRJKgeq7CvJ8E7jc+1Dt11JtYvCYys0I+YoZVC1I4W8zJOob
 HeRyV3MEiRR/FaqkmNdCzpsDrHaMXQgK872UZoHPesu06BQrKQdb4ad1AOaDCKGZ7rqu
 CbStu03Mm6431swLkY+ydIGMmvoxl0P4Wt3bu/vT9oF3m/KbV9jxmSNVJ/OlGF98CW9t
 32V9kRy06KhLfM9nm/qXKOwlpuwttL3J1KDwKxtIrcgXoHeNbRQgOFYGjPA33g8SEzfp
 ST0MM76Y7NN1iO0BrH3PADG0d2XgM7LlNmzXAjnGDt/01ImmXD0cHqCsAUhFgnV5ns1l
 x3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9Twx/mkrh47iPEqgKXCY8jxCE/MeSIBsB4xJsbPqh+Q=;
 b=EDhTNBqq7wSzOlCxH4KJgHF2qepy6w/KHoCoqdIOEk58vCd5JCoIUBbMB6AFopIjrB
 WXkzdgSjmKXCSGdU9Nu6stbhL59kHDHNkGPXGlgs+CXV44lbUKEr08Bv3G8ZPwTsNl1F
 GmwWhs+uMZa4BasJ+GXfTW2lJL3Elaz84zdq6LTIKBkyRjNW3ldKcn5Ex6lcWwEAxsMl
 Q6hUXDdwyB66cUgXyjw8XbWfbWpse3gTQZhxrA8XYkXePgqEGxuDKvV3hCv3Cc79icSA
 R7GYLoUdHmdOPo15KwvC9jIeTSlaSY6Sb7Aj2xQ9LBy1YHf5/NHcKhMiGRywr7+PNWW+
 nZAQ==
X-Gm-Message-State: APjAAAVfsBi+T4L6DhYUu0dVaNotfPoKe0+N0x7i/ym8iIR+BBQJuvMT
 ufFOnDX/CpjU2YIVIxi1SNJnaqej
X-Google-Smtp-Source: APXvYqzKmGnuZK2gOWma9ve73eWjxesAUXc/+sPgIhcVaC3XMABKPmk5T0g3QpmSb7ixXmLQxE20HQ==
X-Received: by 2002:a63:fd4a:: with SMTP id m10mr48311900pgj.302.1557972282141; 
 Wed, 15 May 2019 19:04:42 -0700 (PDT)
Received: from bobo.local0.net (193-116-124-212.tpgi.com.au. [193.116.124.212])
 by smtp.gmail.com with ESMTPSA id a26sm8045396pfl.177.2019.05.15.19.04.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 May 2019 19:04:41 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: Make boot look nice(r)
Date: Thu, 16 May 2019 12:04:37 +1000
Message-Id: <20190516020437.11783-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Radix boot looks like this:

 -----------------------------------------------------
 phys_mem_size     = 0x200000000
 dcache_bsize      = 0x80
 icache_bsize      = 0x80
 cpu_features      = 0x0000c06f8f5fb1a7
   possible        = 0x0000fbffcf5fb1a7
   always          = 0x00000003800081a1
 cpu_user_features = 0xdc0065c2 0xaee00000
 mmu_features      = 0xbc006041
 firmware_features = 0x0000000010000000
 hash-mmu: ppc64_pft_size    = 0x0
 hash-mmu: kernel vmalloc start   = 0xc008000000000000
 hash-mmu: kernel IO start        = 0xc00a000000000000
 hash-mmu: kernel vmemmap start   = 0xc00c000000000000
 -----------------------------------------------------

Fix:

 -----------------------------------------------------
 phys_mem_size     = 0x200000000
 dcache_bsize      = 0x80
 icache_bsize      = 0x80
 cpu_features      = 0x0000c06f8f5fb1a7
   possible        = 0x0000fbffcf5fb1a7
   always          = 0x00000003800081a1
 cpu_user_features = 0xdc0065c2 0xaee00000
 mmu_features      = 0xbc006041
 firmware_features = 0x0000000010000000
 vmalloc start     = 0xc008000000000000
 IO start          = 0xc00a000000000000
 vmemmap start     = 0xc00c000000000000
 -----------------------------------------------------

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/setup-common.c    | 8 +++++++-
 arch/powerpc/mm/book3s64/hash_utils.c | 3 ---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index aad9f5df6ab6..f2da8c809c85 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -810,9 +810,15 @@ static __init void print_system_info(void)
 	pr_info("mmu_features      = 0x%08x\n", cur_cpu_spec->mmu_features);
 #ifdef CONFIG_PPC64
 	pr_info("firmware_features = 0x%016lx\n", powerpc_firmware_features);
+#ifdef CONFIG_PPC_BOOK3S
+	pr_info("vmalloc start     = 0x%lx\n", KERN_VIRT_START);
+	pr_info("IO start          = 0x%lx\n", KERN_IO_START);
+	pr_info("vmemmap start     = 0x%lx\n", (unsigned long)vmemmap);
+#endif
 #endif
 
-	print_system_hash_info();
+	if (!early_radix_enabled())
+		print_system_hash_info();
 
 	if (PHYSICAL_START > 0)
 		pr_info("physical_start    = 0x%llx\n",
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 919a861a8ec0..8b307b796b83 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1954,7 +1954,4 @@ void __init print_system_hash_info(void)
 
 	if (htab_hash_mask)
 		pr_info("htab_hash_mask    = 0x%lx\n", htab_hash_mask);
-	pr_info("kernel vmalloc start   = 0x%lx\n", KERN_VIRT_START);
-	pr_info("kernel IO start        = 0x%lx\n", KERN_IO_START);
-	pr_info("kernel vmemmap start   = 0x%lx\n", (unsigned long)vmemmap);
 }
-- 
2.20.1

