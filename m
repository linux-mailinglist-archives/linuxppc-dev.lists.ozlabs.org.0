Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE44FA2BAC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 02:49:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KLTz1XQmzF0kx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 10:49:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="nD1A5jPv"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KLGw2zl1zDrQS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2019 10:40:08 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id w26so3298510pfq.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 17:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=82Q/JFIZnRXp0gOKtGutBaFqGjeRYEXgiO+lMUV240Y=;
 b=nD1A5jPvsIP89nHBMvBHrNI1GqT/PDiCf4jxHaCbxxEnlAXlcBW7mkvaA6ZVlmKfzS
 NkBfs1H94Zz4smL76mncvLsIszMvMwN8JXpr2ZJU31OBYDVyPNcshJZWBWPg9+gdAgSF
 w4aZZ3y1NslYt7ctZc5tXH2Vuybo+Jx53VCXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=82Q/JFIZnRXp0gOKtGutBaFqGjeRYEXgiO+lMUV240Y=;
 b=Y4uT1ybr4S7Gpi7rMzbeEqd/+IynVbTvlihgo8YSO2kKk+Rdnxo4iwyGfu+er6X5gv
 hUDJLQc3T3xBd8GCiKporUJ1dlilZh+RtUH9xsNCHuNu369dWIxt7c87BKxvV1z+Yglf
 fgX8t1hNjZ3guvZqJJ3yMPWo01XuQfMnuOKy7pSWVdeDNwsPTIqp4aQtjSoKG43p79pW
 kZwg55yqL/HQ2KrbUlS2tBnO/mELFw7aBuzun1MwloV10EaBaVJpzo4RlliKLwcvLZM0
 PS37s4rV/3sL46ZwnWWqifVj1XR6y1q3SaO8asZEtnYYDqoeH+01dwMc8HDhrVGNWaij
 QYUQ==
X-Gm-Message-State: APjAAAU1fs1fKvsh6zg11i0mfic3gY/RRTW+zIcuNzt7LYqoZ0TSFsv3
 Ia+XMOS6PPd28qxR2f+06UbnGg==
X-Google-Smtp-Source: APXvYqzNoJGYFrsnYDroRSYoteG3iJDXlHgkj88MSgz63Rrn0+nV1EyQWSk/4Z2CmdbFPGnpPD4GHg==
X-Received: by 2002:a63:1908:: with SMTP id z8mr10423041pgl.433.1567125606413; 
 Thu, 29 Aug 2019 17:40:06 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id b19sm3452810pgs.10.2019.08.29.17.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 17:40:05 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: kasan-dev@googlegroups.com, linux-mm@kvack.org, x86@kernel.org,
 aryabinin@virtuozzo.com, glider@google.com, luto@kernel.org,
 linux-kernel@vger.kernel.org, mark.rutland@arm.com, dvyukov@google.com,
 christophe.leroy@c-s.fr
Subject: [PATCH v5 5/5] kasan debug: track pages allocated for vmalloc shadow
Date: Fri, 30 Aug 2019 10:38:21 +1000
Message-Id: <20190830003821.10737-6-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190830003821.10737-1-dja@axtens.net>
References: <20190830003821.10737-1-dja@axtens.net>
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
/sys/kernel/debug/kasan_vmalloc/shadow_pages.

Signed-off-by: Daniel Axtens <dja@axtens.net>

---

Merging this is probably overkill, but I leave it to the discretion
of the broader community.

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

diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index c12a2e6ecff5..69f32f2857b0 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -35,6 +35,7 @@
 #include <linux/vmalloc.h>
 #include <linux/bug.h>
 #include <linux/uaccess.h>
+#include <linux/debugfs.h>
 
 #include "kasan.h"
 #include "../slab.h"
@@ -748,6 +749,8 @@ core_initcall(kasan_memhotplug_init);
 #endif
 
 #ifdef CONFIG_KASAN_VMALLOC
+static u64 vmalloc_shadow_pages;
+
 static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
 				      void *unused)
 {
@@ -774,6 +777,7 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
 	if (likely(pte_none(*ptep))) {
 		set_pte_at(&init_mm, addr, ptep, pte);
 		page = 0;
+		vmalloc_shadow_pages++;
 	}
 	spin_unlock(&init_mm.page_table_lock);
 	if (page)
@@ -833,6 +837,7 @@ static int kasan_depopulate_vmalloc_pte(pte_t *ptep, unsigned long addr,
 
 	pte_clear(&init_mm, addr, ptep);
 	free_page(page);
+	vmalloc_shadow_pages--;
 	spin_unlock(&init_mm.page_table_lock);
 
 	return 0;
@@ -887,4 +892,25 @@ void kasan_release_vmalloc(unsigned long start, unsigned long end,
 				    (unsigned long)(shadow_end - shadow_start),
 				    kasan_depopulate_vmalloc_pte, NULL);
 }
+
+static __init int kasan_init_vmalloc_debugfs(void)
+{
+	struct dentry *root, *count;
+
+	root = debugfs_create_dir("kasan_vmalloc", NULL);
+	if (IS_ERR(root)) {
+		if (PTR_ERR(root) == -ENODEV)
+			return 0;
+		return PTR_ERR(root);
+	}
+
+	count = debugfs_create_u64("shadow_pages", 0444, root,
+				   &vmalloc_shadow_pages);
+
+	if (IS_ERR(count))
+		return PTR_ERR(root);
+
+	return 0;
+}
+late_initcall(kasan_init_vmalloc_debugfs);
 #endif
-- 
2.20.1

