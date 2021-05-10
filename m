Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C74E3779BF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 03:22:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fdjvy1kPYz3ckR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 11:22:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=b4dL80BP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=b4dL80BP; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FdjrP33qzz3bns
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 11:19:17 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id h11so12692235pfn.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 May 2021 18:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WjGcNjb6oA1W/bvbtJ/Dd4cOQCUaC7aLSDHcpE8LVho=;
 b=b4dL80BPMQ7VESTvCVj2Ru5DeE5g8q9y63XD5QbsennvcsDUbBTrZvruzNDWSwlzF7
 9oO0scRJ61NtxJoeqWk1Xlmujqy767DNYQbrew0pVhf6q/Tsa5FuCQlQs+yAOHxNXvYF
 dyUOaUego1d1w49Pwi+J5GwcwnxydMAv0/bNOMf6VzLvmEGrHUYOMdLuRxVODyE8Y6h2
 46Sho2isVAL77FtUElGiNAQS1uuTNaVWaWxwQRkF7m560ELRMOL+bowXgvzjb1GjgyWF
 4dnTUltTH1RR/wgbuQMatVpVbBcKQF+Za+aKyPGAHf5BHnmQw8lbEMaVwjv2sPT9eK5W
 YCiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WjGcNjb6oA1W/bvbtJ/Dd4cOQCUaC7aLSDHcpE8LVho=;
 b=Ie0oQ1MohnpeyU3j4vCWy8VpD5g5dU4c1jJakGmXRv6X+LXLvM/q5gDLVUvtS79OXu
 ZFWnIp1QqjyI8+lkMJVIWCmOy9p9HxH8f7e9YZ2zoLwy/r1WhBaaRz8EZX4H5sdY5YOz
 s/8uiWTS/KM+V6y6sFJhjKe0tbnDgubfwI+xUYFxMPQ18Btl+i4YrNYUs1X/4sa1ylUq
 4cQiIwhDY0f4mcV0RH2/KILYQgjnu4y1THahtZ8ByqJh3FpzSuP/611c3g844Oj/5QeF
 6l4gTsIoF08JO+X4wT0MMhlmkw9Njr2htEWVHKNpi+mWtb5uZs36rPdmV401nuIeZKSa
 PRhw==
X-Gm-Message-State: AOAM530IiHwrEqeIJb3o3lisB8uE9MhiehliEiAszgCn14KOFLcVTlyp
 sXB3ef6tEWK/1iXCq0UvQtKBwXX6TP0=
X-Google-Smtp-Source: ABdhPJxsFXgckRP4Tp8gAkFNpfhcWq9rdiKzh7dXIjA8CJkabEC/K9ssXPajW4cjlfzKhfgnEc5nxA==
X-Received: by 2002:a62:7648:0:b029:28e:db2a:9f14 with SMTP id
 r69-20020a6276480000b029028edb2a9f14mr23024969pfc.6.1620609554871; 
 Sun, 09 May 2021 18:19:14 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id n129sm9887649pfn.54.2021.05.09.18.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 18:19:14 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v13 7/8] powerpc/mm: implement set_memory_attr()
Date: Mon, 10 May 2021 11:18:27 +1000
Message-Id: <20210510011828.4006623-8-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510011828.4006623-1-jniethe5@gmail.com>
References: <20210510011828.4006623-1-jniethe5@gmail.com>
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
index acfdde78e0fb..7dee30cd6b48 100644
--- a/arch/powerpc/mm/pageattr.c
+++ b/arch/powerpc/mm/pageattr.c
@@ -98,3 +98,36 @@ int change_memory_attr(unsigned long addr, int numpages, long action)
 	return apply_to_existing_page_range(&init_mm, start, size,
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

