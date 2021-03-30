Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 523BE34E067
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 06:56:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8cbT0W7Bz3c1S
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 15:56:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=mqQjkzrc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mqQjkzrc; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8cWJ6dwKz30BS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 15:52:28 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id w8so7099989pjf.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 21:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Oxm4SRLH3HUqxA6niuitTEqi4uzHYcC0mhjMSGvmbrw=;
 b=mqQjkzrcUMXnVVjNZ/zZVhP/vQmxc/0c6r6uO452ItyKYlqaYw03b6bSEji5cx4Dqu
 SzWoPQXH/6I4I4a8g17P6vlqOeIqlRy2OJZNJPfEYghhOXck5Vo0g8z4SgB3QGXUu8zH
 h1ZfaivvRoejci9dDd8AYnf7t5FROzsm8kuudq3nYY2VLowecz4DBmTxC6EihUlJJqaP
 VDvTidLfMQm184Ht71WRlsmvoP7jN9FBgDa58pbC0WARqumInbpM+GDDMqIE3M2Meh6p
 3+LRHqyCAvuOZHEANDGW/CV5E2rGjWf2Hnp0VVOH3hVZCv1+duAdj0GDUNLsF4ONji/A
 p4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Oxm4SRLH3HUqxA6niuitTEqi4uzHYcC0mhjMSGvmbrw=;
 b=jVu0L9kg8s5ePzFonx6QqQHsHizPAhKuzEXMKLlPBl1oJVWmKcmhHzEDeswiE3foyV
 2DH4SJoQUtxJ37BpJKIHJqKRutLNnfUbns/QJD5MVTi2vjA98mpuc3KBlCJnRKfJqpxT
 ua5rqLLQeRY886c420/CRRseG8QOoFZMuaypdq+SJ8KRMbPMe8sHqxPRojXrIVtQ7p9t
 0NBiRJsFzY7rUw54YaqFUXn0CUufyPuy/DO7FTJd1HO2g/P61CIfB4UlYWsSZs27LzUm
 /vARD/llE/f6FS9RV9C9Dk/t8c/+b62sSu3FQJr3y2R37CLXcSQpkZQBoH9IDjFAKSKr
 awhw==
X-Gm-Message-State: AOAM532ZZcxMCcUmjNTI7XL+BVu/pJWFz9p5mJ9g3SHG7Xyk3f4HvLZm
 txl6BriykHG+8h/J+fiLCiMPooDafm/sLxLj
X-Google-Smtp-Source: ABdhPJzPNf4Mc44gTKphNXGT/qHG8isgWnhs1EJ1zW1ab2FaBinvkHkH6h/8Mu06TY3N6rQhB61KQA==
X-Received: by 2002:a17:90a:f28e:: with SMTP id
 fs14mr2473381pjb.100.1617079946499; 
 Mon, 29 Mar 2021 21:52:26 -0700 (PDT)
Received: from tee480.ibm.com (159-196-117-139.9fc475.syd.nbn.aussiebb.net.
 [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id a18sm14136574pfa.18.2021.03.29.21.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 21:52:26 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v10 09/10] powerpc/mm: implement set_memory_attr()
Date: Tue, 30 Mar 2021 15:51:31 +1100
Message-Id: <20210330045132.722243-10-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210330045132.722243-1-jniethe5@gmail.com>
References: <20210330045132.722243-1-jniethe5@gmail.com>
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
 npiggin@gmail.com, naveen.n.rao@linux.ibm.com,
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
index 9efcb01088da..9611dfaebd45 100644
--- a/arch/powerpc/mm/pageattr.c
+++ b/arch/powerpc/mm/pageattr.c
@@ -86,3 +86,36 @@ int change_memory_attr(unsigned long addr, int numpages, long action)
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

