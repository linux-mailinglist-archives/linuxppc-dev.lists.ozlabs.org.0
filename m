Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDF6DA33E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 03:37:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tsHN2lHpzDqsX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2019 12:37:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="kPLzGqgg"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ts1J6H01zDr7J
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2019 12:25:40 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id e5so279582pls.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 18:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OYfGHq7Ua8XlIFWVnYrWlfnb+Qaiu3AuIcv4KZ3ENBU=;
 b=kPLzGqggNUsPFDxV/H8ftNKVOlHtZarUZ2uO5M1Cl+hwXsMbW/vTrWwIjhfQ+3DWYJ
 BAJOSuNbGvc+wZSDF5mXHgUtEzM/UBmDJTY+ncpQRCjrnopVjD47CaQs12J79yMzbmaJ
 2HoVzjwx6/PntMBB3luM9yU1+3Xh96sr83vp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OYfGHq7Ua8XlIFWVnYrWlfnb+Qaiu3AuIcv4KZ3ENBU=;
 b=SrMr04U3D11xsaDxXftndyHW1Gk78Vm9k+dZJHL8dOwNTsDPKvk+OIKsc04th6PO0W
 QJy6+VhkT72EjSrTEImGoNKvfzUCsyTf5b3SC1yKk/wezVVHy9Jfm/+L3u91oST2+Qpj
 gOthSAsMzzRM7zmPgbNTrLx5ocquOI6+FSV5vDzLNbaxnw7I+L4Ok1OcpalQRdSQiLx+
 sGBrqspgf1PgvvJeOKRSmRFXghqkN+Cq+bXMx1NNQ9UIVQEedt7kbKmAOs6LSe5Df5Kr
 oU3oPZEv9y38seuOruQKssf5UNbwY7l5CNA9unc/5p8Cs97WoiVv7qLQ5fFj9ZjRxX4f
 xKZg==
X-Gm-Message-State: APjAAAWvXLASogXMCARjjh7Jc/1okcYcaTQLn8vYIDJ/oqn7H9MTqnwa
 zFxESJwUbcMHy7m0rEAKyhCuog==
X-Google-Smtp-Source: APXvYqwQlBhRRBicY30cw6VPEISaJYd+4/odDPgj5HED+MoQwNbayPMmtq4wGs1t8T3sUU1Hp+309g==
X-Received: by 2002:a17:902:8ec1:: with SMTP id
 x1mr1189452plo.314.1571275537371; 
 Wed, 16 Oct 2019 18:25:37 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id d4sm381964pjs.9.2019.10.16.18.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 18:25:36 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: kasan-dev@googlegroups.com, linux-mm@kvack.org, x86@kernel.org,
 aryabinin@virtuozzo.com, glider@google.com, luto@kernel.org,
 linux-kernel@vger.kernel.org, mark.rutland@arm.com, dvyukov@google.com,
 christophe.leroy@c-s.fr
Subject: [PATCH v9 5/5] kasan debug: track pages allocated for vmalloc shadow
Date: Thu, 17 Oct 2019 12:25:06 +1100
Message-Id: <20191017012506.28503-6-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017012506.28503-1-dja@axtens.net>
References: <20191017012506.28503-1-dja@axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, gor@linux.ibm.com,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Provide the current number of vmalloc shadow pages in
/sys/kernel/debug/kasan/vmalloc_shadow_pages.

Signed-off-by: Daniel Axtens <dja@axtens.net>

---

v8: rename kasan_vmalloc/shadow_pages -> kasan/vmalloc_shadow_pages

On v4 (no dynamic freeing), I saw the following approximate figures
on my test VM:

 - fresh boot: 720
 - after test_vmalloc: ~14000

With v5 (lazy dynamic freeing):

 - boot: ~490-500
 - running modprobe test_vmalloc pushes the figures up to sometimes
    as high as ~14000, but they drop down to ~560 after the test ends.
    I'm not sure where the extra sixty pages are from, but running the
    test repeately doesn't cause the number to keep growing, so I don't
    think we're leaking.
 - with vmap_stack, spawning tasks pushes the figure up to ~4200, then
    some clearing kicks in and drops it down to previous levels again.
---
 mm/kasan/common.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git mm/kasan/common.c mm/kasan/common.c
index 81521d180bec..ac05038afa5a 100644
--- mm/kasan/common.c
+++ mm/kasan/common.c
@@ -35,6 +35,7 @@
 #include <linux/vmalloc.h>
 #include <linux/bug.h>
 #include <linux/uaccess.h>
+#include <linux/debugfs.h>
 
 #include <asm/tlbflush.h>
 
@@ -750,6 +751,8 @@ core_initcall(kasan_memhotplug_init);
 #endif
 
 #ifdef CONFIG_KASAN_VMALLOC
+static u64 vmalloc_shadow_pages;
+
 static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
 				      void *unused)
 {
@@ -782,6 +785,7 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
 	if (likely(pte_none(*ptep))) {
 		set_pte_at(&init_mm, addr, ptep, pte);
 		page = 0;
+		vmalloc_shadow_pages++;
 	}
 	spin_unlock(&init_mm.page_table_lock);
 	if (page)
@@ -836,6 +840,7 @@ static int kasan_depopulate_vmalloc_pte(pte_t *ptep, unsigned long addr,
 		pte_clear(&init_mm, addr, ptep);
 		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
 		free_page(page);
+		vmalloc_shadow_pages--;
 	}
 	spin_unlock(&init_mm.page_table_lock);
 
@@ -954,4 +959,25 @@ void kasan_release_vmalloc(unsigned long start, unsigned long end,
 				       (unsigned long)shadow_end);
 	}
 }
+
+static __init int kasan_init_debugfs(void)
+{
+	struct dentry *root, *count;
+
+	root = debugfs_create_dir("kasan", NULL);
+	if (IS_ERR(root)) {
+		if (PTR_ERR(root) == -ENODEV)
+			return 0;
+		return PTR_ERR(root);
+	}
+
+	count = debugfs_create_u64("vmalloc_shadow_pages", 0444, root,
+				   &vmalloc_shadow_pages);
+
+	if (IS_ERR(count))
+		return PTR_ERR(root);
+
+	return 0;
+}
+late_initcall(kasan_init_debugfs);
 #endif
-- 
2.20.1

