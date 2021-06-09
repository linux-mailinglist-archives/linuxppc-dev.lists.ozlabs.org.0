Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 980043A0983
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 03:38:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G08rt13tkz3c7D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 11:38:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=LgbDTVSu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LgbDTVSu; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G08n30Cnkz3bxZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 11:35:18 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id 11so11669727plk.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Jun 2021 18:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=73lCnqrVhO1Rqxiqs9OGNpEuWzRE3MRG2Lu6lmhZPKo=;
 b=LgbDTVSuOADgitYqR6PNpU+eIjm/YYmwa4C596oh1kohgHQ8rtM3HPjHwHtIWNkEa3
 bV76iMHUluN3WVWSMqrj+Jdl5ptuSgaARZ2nSMQ7Hdzm3Y3j40u35KxUCzXdyWRjRZbf
 0Y8kiXpEQOF4HdEAQyL1g2+8fOirSKsNB4j7WZhaRZEIm1fCXd0GmW55kOlCjFPfPfBK
 AxbrNn4LViIq9tqH42uzCo7lQWgDXq0GupwGyLKUsJmamigFypQW4Yh6HU1EPkqlF4NL
 fE2XLfRRjhxilfx0GEtwdP5kC9V+ly2nXvLVXLxaq4U86Ci5C/zlJHxrMXVjELxgAuc1
 Ir9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=73lCnqrVhO1Rqxiqs9OGNpEuWzRE3MRG2Lu6lmhZPKo=;
 b=RrAkdUCBXo8L7wyIQbngHDjwhbyRQ7lih0NIdqKTByIoM6L55Tnjn2LDhsKEiLWof0
 8/mSjBiLCIYSLnATDUC/6hFa7ShgKa3X7jeSRKVLYp0Pe205YACLaIcQWm3CBLuScA+C
 K7qkzUebPD3sQ1KtvEsGxfhYSSSjTfWwVTSIZkkTTlbNtEDFxLB5eX756uMmGzc3TFve
 xQdSs3vt6xq+CG0wXuV5szycJZYGntrD56oPxaCf9n0AvAhV5iz//1tyJHmbSF7e5pBp
 XW+4vuugG6opry2252wKKb2lbI28Vy1oR8Aq/7EsjNhQdszi0S9/hqv4okLUx7yOsXTi
 IMpQ==
X-Gm-Message-State: AOAM531TWvwldP6CSSiSmuynjaau6Iihg+snytKnFnGwO9pslZBK/isC
 OxJiyFnZ1mVUZiSHrlRFDGN4HG2wYHU=
X-Google-Smtp-Source: ABdhPJwgkKF1o1a9CmlejC81aGDnRL04cxNHMR8HjwgWg88mYh+hkYgcdOE1nYjOqzzmIenK6HC4uQ==
X-Received: by 2002:a17:90b:4b51:: with SMTP id
 mi17mr7891637pjb.109.1623202515632; 
 Tue, 08 Jun 2021 18:35:15 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242])
 by smtp.gmail.com with ESMTPSA id s10sm11369406pfk.186.2021.06.08.18.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 18:35:15 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v15 8/9] powerpc/mm: implement set_memory_attr()
Date: Wed,  9 Jun 2021 11:34:30 +1000
Message-Id: <20210609013431.9805-9-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210609013431.9805-1-jniethe5@gmail.com>
References: <20210609013431.9805-1-jniethe5@gmail.com>
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
index 5e5ae50a7f23..0876216ceee6 100644
--- a/arch/powerpc/mm/pageattr.c
+++ b/arch/powerpc/mm/pageattr.c
@@ -99,3 +99,36 @@ int change_memory_attr(unsigned long addr, int numpages, long action)
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

