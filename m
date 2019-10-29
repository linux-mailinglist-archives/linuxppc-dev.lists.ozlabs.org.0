Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E831E7F3A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 05:34:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472Jdd0s4czF14X
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 15:34:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="q37hvvFE"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472JLg2hHwzDsVH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 15:21:31 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id u9so3854184pfn.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2019 21:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E6G/cbdwI55VRIDPH2MzPtSSwLNnlVDKj+xUqyB9XvU=;
 b=q37hvvFEaBAuDhdw8f9RGZPAKbEe6zMTpH1vieG+zpL2j/QDs8RghoIx9JE+q4QWze
 TAruY1QMB+c1d5affF47SiBVcB02uLSf31ZZ6pl18sMLuLqjyMUqrZhipq3ZGdu16JlP
 nJAdQq+06ElZPTzvTwKeK7V2Y0q4KaKOeZi5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E6G/cbdwI55VRIDPH2MzPtSSwLNnlVDKj+xUqyB9XvU=;
 b=B29pCFYuWL65Z2R7ZSRpdZMmsMbPPaTLYoWMV0tmwdUIpJbVyb9/+x0YOpLEPYhZrT
 Y9ALz6WOgihBPk0uGP5bgEGozc5pvjfUzkzbhGvUYXTkOohoKhPoQaMhWIYq/CqNOmqf
 LhYPJV0dmmYirWsV6eWkviAXVumd3Taxk3NOu+bm8dCsCCeSl0pyffbIR+dTOcFfMAqj
 kmMzRek37Cs9E5ggSWXSwpvGOEgxOCnq01lnxl3b8k8ZyA/wbX3dnnsoPTX+fRv+6bEZ
 zHe/Q6F+sVPTXRBlx13zr9AJaN4YNb7JSAG92dyrVJpBOuyIO+npRyg592C4RYLNZeMI
 sTgA==
X-Gm-Message-State: APjAAAVKr1NPIbCwiKoGlU8iBwVN1hEH7BuKgqUf7TWqvjIl5vHPUKmE
 RcjF6eSKN//CwHZiU+KDMvj6rA==
X-Google-Smtp-Source: APXvYqxNDS1dIEPkNBGrfTraoXwMKGGsjqxNiWzOEOkJlq5Mx5SitV2hc6VnXEFqIfQN/nkn2AOfVQ==
X-Received: by 2002:a63:e60b:: with SMTP id g11mr23118732pgh.119.1572322888371; 
 Mon, 28 Oct 2019 21:21:28 -0700 (PDT)
Received: from localhost ([2001:44b8:802:1120:783a:2bb9:f7cb:7c3c])
 by smtp.gmail.com with ESMTPSA id z4sm957607pjt.20.2019.10.28.21.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 21:21:27 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: kasan-dev@googlegroups.com, linux-mm@kvack.org, x86@kernel.org,
 aryabinin@virtuozzo.com, glider@google.com, luto@kernel.org,
 linux-kernel@vger.kernel.org, mark.rutland@arm.com, dvyukov@google.com,
 christophe.leroy@c-s.fr
Subject: [PATCH v10 5/5] kasan debug: track pages allocated for vmalloc shadow
Date: Tue, 29 Oct 2019 15:20:59 +1100
Message-Id: <20191029042059.28541-6-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191029042059.28541-1-dja@axtens.net>
References: <20191029042059.28541-1-dja@axtens.net>
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

v10: rebase on linux-next/master.

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
 mm/kasan/common.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index 6e7bc5d3fa83..a4b5c64da16f 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
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
@@ -770,6 +773,7 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
 	if (likely(pte_none(*ptep))) {
 		set_pte_at(&init_mm, addr, ptep, pte);
 		page = 0;
+		vmalloc_shadow_pages++;
 	}
 	spin_unlock(&init_mm.page_table_lock);
 	if (page)
@@ -858,6 +862,7 @@ static int kasan_depopulate_vmalloc_pte(pte_t *ptep, unsigned long addr,
 	if (likely(!pte_none(*ptep))) {
 		pte_clear(&init_mm, addr, ptep);
 		free_page(page);
+		vmalloc_shadow_pages--;
 	}
 	spin_unlock(&init_mm.page_table_lock);
 
@@ -974,4 +979,22 @@ void kasan_release_vmalloc(unsigned long start, unsigned long end,
 				       (unsigned long)shadow_end);
 	}
 }
+
+static __init int kasan_init_debugfs(void)
+{
+	struct dentry *root;
+
+	root = debugfs_create_dir("kasan", NULL);
+	if (IS_ERR(root)) {
+		if (PTR_ERR(root) == -ENODEV)
+			return 0;
+		return PTR_ERR(root);
+	}
+
+	debugfs_create_u64("vmalloc_shadow_pages", 0444, root,
+			   &vmalloc_shadow_pages);
+
+	return 0;
+}
+late_initcall(kasan_init_debugfs);
 #endif
-- 
2.20.1

