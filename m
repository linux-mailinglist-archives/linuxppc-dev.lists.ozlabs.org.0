Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D86F36E3A4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 05:20:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FW13G1rftz3cXr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 13:20:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=DqkKvelm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DqkKvelm; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FW0zW63Bvz3048
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Apr 2021 13:17:11 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id e15so8365130pfv.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Apr 2021 20:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bh3GYwzVJGIJgwazIOcTiNKN+2ll7ziRWPH1ydWZCoc=;
 b=DqkKvelmgA77Lrb1iHnn3La7iPkNEwLTu4T6RpSVeMSpF9HUvWaJzjsXJcNydwh9aU
 M4y1lqLtRmxva1Y6SlQ8Dc7zFc5wKsOjhbczJIdikrp1QDUnBHJ4o+ncAopwcTAKNmga
 3tGGYczlbL6stv3A7lVv7Gx/+xy/1cVorHKEJ2+h+4+ZyYZmEFzZxV4uEpLVM8YnE6qU
 GmKqVrFHa5CxDzMepTWGJGmPDZjXdWaX2epDZjHRYsBm3FMoXQycWA8ynEvNA76QEjLV
 VORiO7r2x7UoAteHbWERA8YqO+/DtA6dbYe6U5K0RBjqfbN3liLh831Q2EiYrlR84KQL
 EbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bh3GYwzVJGIJgwazIOcTiNKN+2ll7ziRWPH1ydWZCoc=;
 b=FJARZLf+Idsvmrmz+eU1zpdg+msa29jWcQpAn3KXnRdvoA5OSy+y2mOhpzg4GFGc+L
 ocZnLMqpiQUMkbtoTcq/7fE3Y4ku6MkgrAAzPLOAseVmOmygpA1wKqLlwYqCxP49hRY6
 DxjDchtcEw627p/M5o1mBNoRFkx+YLUT3WJYuJ2V4G4/18883l0eXeH38796t7ZS6QE8
 zJclsOjMkm8gUWaZfRf6RUPIRyCwX3eeQSiUbiVu6SxCPqzlmjOARJWCHt6e9ThU4GiU
 oPmloT00njIHja5ndmsD/z1wj5Vn9kmh9hKLU5xZmGxu6DNad1BJxHqEeFZ3tvq9ezmH
 QSWw==
X-Gm-Message-State: AOAM53310dghmQgy2JgUt0nCCUsKvXlXv0qQq/qDnu3P7SXGGMZiibK7
 IuqPSHrCvwNCKIyWJhIZMSf3gLTkET7Pyg==
X-Google-Smtp-Source: ABdhPJx0PnG17qHk2fIOFPFWOPalfsvExqBEnGhmH/tivxjmU0E8s6WBszdJfraCtL0u4hVAdqGygA==
X-Received: by 2002:a62:170e:0:b029:1fa:7161:fd71 with SMTP id
 14-20020a62170e0000b02901fa7161fd71mr30759885pfx.35.1619666229135; 
 Wed, 28 Apr 2021 20:17:09 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id l16sm3650742pjl.32.2021.04.28.20.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 20:17:08 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v11 8/9] powerpc/mm: implement set_memory_attr()
Date: Thu, 29 Apr 2021 13:16:01 +1000
Message-Id: <20210429031602.2606654-9-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429031602.2606654-1-jniethe5@gmail.com>
References: <20210429031602.2606654-1-jniethe5@gmail.com>
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
Cc: ajd@linux.ibm.com, cmr@codefail.de, kbuild test robot <lkp@intel.com>,
 npiggin@gmail.com, aneesh.kumar@linux.ibm.com, naveen.n.rao@linux.ibm.com,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

In addition to the set_memory_xx() functions which allows to change
the memory attributes of not (yet) used memory regions, implement a
set_memory_attr() function to:
- set the final memory protection after init on currently used
kernel regions.
- enable/disable kernel memory regions in the scope of DEBUG_PAGEALLOC.

Unlike the set_memory_xx() which can act in three step as the regions
are unused, this function must modify 'on the fly' as the kernel is
executing from them. At the moment only PPC32 will use it and changing
page attributes on the fly is not an issue.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reported-by: kbuild test robot <lkp@intel.com>
[ruscur: cast "data" to unsigned long instead of int]
Signed-off-by: Russell Currey <ruscur@russell.cc>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/include/asm/set_memory.h |  2 ++
 arch/powerpc/mm/pageattr.c            | 33 +++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/arch/powerpc/include/asm/set_memory.h b/arch/powerpc/include/asm/set_memory.h
index d1cd69b1a43a..a738e86f34bd 100644
--- a/arch/powerpc/include/asm/set_memory.h
+++ b/arch/powerpc/include/asm/set_memory.h
@@ -7,4 +7,6 @@ int set_memory_rw(unsigned long addr, int numpages);
 int set_memory_nx(unsigned long addr, int numpages);
 int set_memory_x(unsigned long addr, int numpages);
 
+int set_memory_attr(unsigned long addr, int numpages, pgprot_t prot);
+
 #endif
diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
index 3b4aa72e555e..9098066bc113 100644
--- a/arch/powerpc/mm/pageattr.c
+++ b/arch/powerpc/mm/pageattr.c
@@ -103,3 +103,36 @@ int set_memory_x(unsigned long addr, int numpages)
 {
 	return change_memory_attr(addr, numpages, pte_mkexec);
 }
+
+/*
+ * Set the attributes of a page:
+ *
+ * This function is used by PPC32 at the end of init to set final kernel memory
+ * protection. It includes changing the maping of the page it is executing from
+ * and data pages it is using.
+ */
+static int set_page_attr(pte_t *ptep, unsigned long addr, void *data)
+{
+	pgprot_t prot = __pgprot((unsigned long)data);
+
+	spin_lock(&init_mm.page_table_lock);
+
+	set_pte_at(&init_mm, addr, ptep, pte_modify(*ptep, prot));
+	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
+
+	spin_unlock(&init_mm.page_table_lock);
+
+	return 0;
+}
+
+int set_memory_attr(unsigned long addr, int numpages, pgprot_t prot)
+{
+	unsigned long start = ALIGN_DOWN(addr, PAGE_SIZE);
+	unsigned long sz = numpages * PAGE_SIZE;
+
+	if (numpages <= 0)
+		return 0;
+
+	return apply_to_existing_page_range(&init_mm, start, sz, set_page_attr,
+					    (void *)pgprot_val(prot));
+}
-- 
2.25.1

