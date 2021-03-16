Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F8833CC07
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 04:21:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dzz8s616Qz3bnH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 14:21:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=vVx00bkD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vVx00bkD; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dzz5q430Xz304d
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 14:18:55 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id w8so9881612pjf.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 20:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DFPFwskMgOwuE5JL50xDAn2mcaMHZ6gcwX67pveQD28=;
 b=vVx00bkDXB75MFBoJ2sYxxJ758RaqTx7Gu1DV2E6IJy/ATjlbH2kqPoTeIZKz/6XfC
 HUHXWmEH8Y0rxT67mJR1sLnrHouUfUyo6umZO9yQqr1bKKqy3qIE33stpEhoFJPfmD0q
 8h+9iFmR4hY9A0BDKP3NL/kWkLCpJJiuUuPJuyKPbVx+pBIxlqof5g/pit16ouTW3U1r
 H1AeWL+EGwEx1VNEUP9IsrvJuKQsnbIUC0JC9EtsN+KNFVBmLykM43kevV5iHaezJNCp
 viROb5fAjii01+q+/QTZki70LdqcDyki/cdPjLxZ2atDFX4SIAktJxge0zmKAg+pmhoI
 wFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DFPFwskMgOwuE5JL50xDAn2mcaMHZ6gcwX67pveQD28=;
 b=EP9JXaqPAvs99WrKRtcmyH5X9Ts+qHpoUbmogUenQ5nmTvlCOsLHNLq/E4tV43fHYy
 INlIb3E0xnd9pJ6wj5sO7yz6WvahkBOCbXDbW9qEhZkAHRJXM4jxfEpW7yeQPD6rXo4/
 qxzyYjNqawGmbYEjnFl7jLFRAzop7vYQAr+vzrJJrY6TFwNHY62zl4eYeEA5gu84OQJj
 ucm+7L0Q4XlyXJetlbZGoMnfuBZIYgh/ng6Jbz6y96gd7VyW4LydcOKfDuTvz5djcDgQ
 e9G+wuM8iI5Su0+HDWRlGlnOKPWGStsGwjYupwyD86XjCklvadCEyiaycJC4ujEorRef
 6Mig==
X-Gm-Message-State: AOAM530Ty/bn0qGQczy5IuNeyxt3aNLabjzFxy7zGfo7I+qSIe7VrSeM
 9jOqdjBowONlWFeVQ92oJMvPTbXmhD4vOX17
X-Google-Smtp-Source: ABdhPJzY1yIw55kTyd4OS+HvHzriFNqieyV7pZtASrmGDhbQBEWopAJhn6+01M7Wy+ztVpVyXM7LBQ==
X-Received: by 2002:a17:902:e545:b029:e6:6499:cd19 with SMTP id
 n5-20020a170902e545b02900e66499cd19mr14490997plf.53.1615864733333; 
 Mon, 15 Mar 2021 20:18:53 -0700 (PDT)
Received: from localhost.localdomain
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id o13sm15098809pgv.40.2021.03.15.20.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 20:18:53 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v9 7/8] powerpc/mm: implement set_memory_attr()
Date: Tue, 16 Mar 2021 14:17:40 +1100
Message-Id: <20210316031741.1004850-7-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316031741.1004850-1-jniethe5@gmail.com>
References: <20210316031741.1004850-1-jniethe5@gmail.com>
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
Cc: christophe.leroy@c-s.fr, ajd@linux.ibm.com, npiggin@gmail.com,
 kbuild test robot <lkp@intel.com>, naveen.n.rao@linux.ibm.com,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@c-s.fr>

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

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Reported-by: kbuild test robot <lkp@intel.com>
[ruscur: cast "data" to unsigned long instead of int]
Signed-off-by: Russell Currey <ruscur@russell.cc>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/include/asm/set_memory.h |  2 ++
 arch/powerpc/mm/pageattr.c            | 33 +++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/arch/powerpc/include/asm/set_memory.h b/arch/powerpc/include/asm/set_memory.h
index 64011ea444b4..b040094f7920 100644
--- a/arch/powerpc/include/asm/set_memory.h
+++ b/arch/powerpc/include/asm/set_memory.h
@@ -29,4 +29,6 @@ static inline int set_memory_x(unsigned long addr, int numpages)
 	return change_memory_attr(addr, numpages, SET_MEMORY_X);
 }
 
+int set_memory_attr(unsigned long addr, int numpages, pgprot_t prot);
+
 #endif
diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
index 2da3fbab6ff7..2fde1b195c85 100644
--- a/arch/powerpc/mm/pageattr.c
+++ b/arch/powerpc/mm/pageattr.c
@@ -79,3 +79,36 @@ int change_memory_attr(unsigned long addr, int numpages, long action)
 	return apply_to_existing_page_range(&init_mm, start, sz,
 					    change_page_attr, (void *)action);
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

