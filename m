Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6152617EDE3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 02:16:04 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48bxxF0HhhzDrdf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 12:16:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm1 header.b=B0i6gA3e; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=bMS9HYmT; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48bxgr3yyxzDqRZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2020 12:04:24 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7EACB22200;
 Mon,  9 Mar 2020 21:04:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 09 Mar 2020 21:04:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=PJ4GD5sq6sfgG
 Ir8/J3SozJ2hDdFuOLXDRL5tWTpJn8=; b=B0i6gA3eneT+TW4RWr+aSYDEBt63g
 wgSD+pvFCViekCCd1pTSgozVlF7Hd62C/dlkSPDtTwqjkZItV/EjaUvDze4lcFFP
 +0FgodaAa3ngPTdyty1pO0XlDJNBXW2FDwGJ/pAUdIS0qYYoRf1BiQXog8pfr5lV
 CRDikYK73WxUUdUxzSKD+KvzQJo2lYdQODX1yDWyHo4Gh5QycyEhV0exOhMQ050o
 dLppM6C2L9gv61Wx0AlPc9tCDN5PGpND8zyPrQftIgZfmzUy4bN8DSzyPHAMAD0f
 4BixeSSbWNYTKufhQmTQ5DsSWMYVj5bbh0uy5wuj3OIKLeIiCqWvhC1zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=PJ4GD5sq6sfgGIr8/J3SozJ2hDdFuOLXDRL5tWTpJn8=; b=bMS9HYmT
 O+/3EHpnzRLb2DNIhxA7w5OiSjG5LD12mb2Ca5oduRYWUBIcMDg3C6vS42F2jDuA
 w2yLxk8XQ3/bbRKcKkXBrBO0qJTxEkzsiHzgVndxo3JqK4j8WPGH48JAGgXbBxRp
 QnPr3qVSDp4PGyIgPie/uTCQCP3gfiw+oykJkMbiM5t24wP11O3KwBSr3hHW6bay
 vzMEsVZrzLDJm60+YhHIPmGsM7QtvO3wqi8IZHjfmBAm22gMM/dg9ibucXBg551E
 M8IxGM+cm2vU7lXzPK/QGsKUWguziB7uMqqMdBZeR6ZBh5gfWXzxeJU+RE8k8vUK
 dAtel2b9CTmVvQ==
X-ME-Sender: <xms:ludmXodvRl869zspg9OMTKqL2D5tv-4HQ7ME10SamdtIVBc0YmdDkg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudduledgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdluddtmdenucfjughrpefhvffufffkofgjfhgggfestdekredtredt
 tdenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruhhssh
 gvlhhlrdgttgeqnecukfhppeduvddvrdelledrkedvrddutdenucevlhhushhtvghrufhi
 iigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrhhushhsvghllh
 drtggt
X-ME-Proxy: <xmx:ludmXqZ9elj2ezda431dHqsfmfLtPa_-QBwc7v7QWn0Bq6Y4GIsItg>
 <xmx:ludmXvRRHguqIZjy64ku6fkHlW4rzMwU8OIOzfWYHSTJx_Qckn4Kog>
 <xmx:ludmXhyTMvgQ9AAL82hDHn10GP_kUkI-gqHAuUXEs-cnirkV9XPiXA>
 <xmx:ludmXksUW3g3Ysq_DASKJkTFjYGPKcYZXjWThAsdmBoQxgcb4p4VRQ>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 49C9A3280059;
 Mon,  9 Mar 2020 21:04:19 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 6/7] powerpc/mm: implement set_memory_attr()
Date: Tue, 10 Mar 2020 12:03:37 +1100
Message-Id: <20200310010338.21205-7-ruscur@russell.cc>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200310010338.21205-1-ruscur@russell.cc>
References: <20200310010338.21205-1-ruscur@russell.cc>
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
Cc: ajd@linux.ibm.com, kernel-hardening@lists.openwall.com, npiggin@gmail.com,
 kbuild test robot <lkp@intel.com>, joel@jms.id.au,
 Russell Currey <ruscur@russell.cc>, dja@axtens.net
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
index 748fa56d9db0..60139fedc6cc 100644
--- a/arch/powerpc/mm/pageattr.c
+++ b/arch/powerpc/mm/pageattr.c
@@ -77,3 +77,36 @@ int change_memory_attr(unsigned long addr, int numpages, long action)
 
 	return apply_to_page_range(&init_mm, start, sz, change_page_attr, (void *)action);
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
+	if (!numpages)
+		return 0;
+
+	return apply_to_page_range(&init_mm, start, sz, set_page_attr,
+				   (void *)pgprot_val(prot));
+}
-- 
2.25.1

