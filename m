Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A145C8F7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 07:58:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dD6s6VlDzDqWq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 15:57:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OeyxLYqU"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dD5F46n9zDqJq
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 15:56:33 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id z75so7136572pgz.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2019 22:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N4Yi0JwBC/ApCOxvQsLAdkd8qy2U4gWbK9Poc7semBk=;
 b=OeyxLYqU9uzpLEv7tQ0xA6XMgrNaKkNGIkI+X+6cjp5YB3TXnn6huHB+axZseoBBgU
 U6lBcAxPsJRa5P1RGzaPSyk0VSg+sB9NxgQ6yJmpmS3Ab26WrTlBgQOcKh/JuO93TnsW
 jWAfeIdmJd/OOTD89F5f1Loq5mt+A/fG8wq83SPEJMgLaCMCC4911z+M5wiCLYrxfP1E
 mgHoo4sHicSns5oWSSpJEm0Dp5hXld0sPRJyJiu8AYCLgj3BQJijR9sgEn5D7VbYoyrF
 GgSobnv621NXrhdGm9zBJAMPw6ffGzUJFF2JaKpSyNoj6yxvXt+Ff+3g3uPJt3eTS+xC
 hd1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N4Yi0JwBC/ApCOxvQsLAdkd8qy2U4gWbK9Poc7semBk=;
 b=ppzb16luPVyz9dIzK4CAcCkWMjLPLMf+HaYVOiUU/AlFZNBEahHyvB8V47Jm/0Y0lW
 DfI3o3WLOjAbkt81B1+4m7ZY0PjNE/l8T9+Jn0ZuqEXSqcl/o4PWAaMiaH/OP6KTbvZy
 oNSBqS85A9QV+MKDdjOusZl0q/Lj4iqyKdJlIgKe2u9GLqq+WrtcV+zozI9XAira7nfD
 102Sq1ckPHQN8q8NgDxFs0TbDaPB6PtsGV7/M7HrxcdJFASLkZi5NpQOvKIQQ2VWAOnI
 ifXD9mFwCb20cecZsP4g0HqcZU1i8aI6yZjRHd8x1qFg0sDYH+8JMAb1yhnY1I6jCuBz
 dnaA==
X-Gm-Message-State: APjAAAVxuZMmpI4CcnCE/UuvtYEBgINnrV18gVyzE5YLay0NlLRFq1wI
 NOATxTenqK6b+xf/fuaYEoI7M1xV
X-Google-Smtp-Source: APXvYqy3X3jvtfZHabX+ucjJW9qGgAUKDnHbP308zi9KgVUZftFIMrufhh55kLCoQKV31CMQQvffZQ==
X-Received: by 2002:a63:34c3:: with SMTP id
 b186mr28642420pga.294.1562046989890; 
 Mon, 01 Jul 2019 22:56:29 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([175.45.73.101])
 by smtp.gmail.com with ESMTPSA id u5sm11231250pgp.19.2019.07.01.22.56.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 22:56:29 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/64s: Make boot look nicer
Date: Tue,  2 Jul 2019 15:56:03 +1000
Message-Id: <20190702055603.9716-1-npiggin@gmail.com>
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

It's misleading to see hash-mmu there. After fix:

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

Hash has the same text misalignment problem which is also corrected.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
v2: avoid adding an ifdef to generic code.

 arch/powerpc/mm/book3s64/hash_utils.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 28ced26f2a00..54f2d6acf6da 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1946,11 +1946,20 @@ machine_device_initcall(pseries, hash64_debugfs);
 
 void __init print_system_hash_info(void)
 {
-	pr_info("ppc64_pft_size    = 0x%llx\n", ppc64_pft_size);
+#undef pr_fmt
+#define pr_fmt(fmt) fmt
 
-	if (htab_hash_mask)
-		pr_info("htab_hash_mask    = 0x%lx\n", htab_hash_mask);
-	pr_info("kernel vmalloc start   = 0x%lx\n", KERN_VIRT_START);
-	pr_info("kernel IO start        = 0x%lx\n", KERN_IO_START);
-	pr_info("kernel vmemmap start   = 0x%lx\n", (unsigned long)vmemmap);
+	if (!early_radix_enabled()) {
+		pr_info("ppc64_pft_size    = 0x%llx\n", ppc64_pft_size);
+
+		if (htab_hash_mask)
+			pr_info("htab_hash_mask    = 0x%lx\n", htab_hash_mask);
+	}
+
+	pr_info("vmalloc start     = 0x%lx\n", KERN_VIRT_START);
+	pr_info("IO start          = 0x%lx\n", KERN_IO_START);
+	pr_info("vmemmap start     = 0x%lx\n", (unsigned long)vmemmap);
+
+#undef pr_fmt
+#define pr_fmt(fmt) "hash-mmu: " fmt
 }
-- 
2.20.1

