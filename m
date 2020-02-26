Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BED16F84A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 08:01:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S6D14KzJzDqxh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 18:01:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=64.147.123.27;
 helo=wnew2-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm1 header.b=fzJATGDo; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=qRtBUCWh; 
 dkim-atps=neutral
X-Greylist: delayed 298 seconds by postgrey-1.36 at bilbo;
 Wed, 26 Feb 2020 17:41:31 AEDT
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S5mq62QCzDqmq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 17:41:31 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id DE560475;
 Wed, 26 Feb 2020 01:36:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 26 Feb 2020 01:36:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=kp8u9qL5i5T1m
 QUU2K/sNa+O6ICOZSqNmkNONM8HCIA=; b=fzJATGDokN1+R+MlmNqqa13I3oLTq
 OkzLJ7lhs5ghIs1tFaMk0ljnYHBPpfoygjxDUDw97FJBJJSPGdkoQN8W2VqM3MF+
 OINrLWpgpgBYy6LmdnpU0fz49+qlnDJAgq3BVz1PjdFt0mFr6gl31d4t1O70PZXC
 Tfcv5P5ApNbE3EIoNF+udZYV9TNFgdgir2EdR0/Lj6dDWBNpP1j7h71LArZRnoRY
 G33RK5MNlC9z4HFpa+S/CoUSbd1I4PxoxawB8SZM8eBDi3N7kSOHRLTkSdli3Qb2
 N5biH5UpTcG3FRdM/laciMGA4S6wgpZ8fLoNPYW/WnlWd6+LkAjFiU6Qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=kp8u9qL5i5T1mQUU2K/sNa+O6ICOZSqNmkNONM8HCIA=; b=qRtBUCWh
 6sRn7gRUKt9JnHKqRL1rmrGS6E2TgS5qT0MvRFBnqqPnneowNTCpNcHbDyaVfpxx
 uRB+jwq8dM+q/20vhRIHcOBN6IQfk35vxx6WBqw8LJyV9GX2sC0ohsgEjbcqs2E0
 mjdw3YEnBaLh1RpKYLeKXX7Y3E34Xx9WyMmrH84Sw8fGftD+BxNm5wjcHD+5IOVc
 oICmk7iNicWKTfSOubPkNyItxPx4j5RPkwgNB/wHCVUkXcWvF/iDu/fugQFHUOh8
 5R/oXt6+S6RjwZ/ZK+C4LOFGXZm8Bv8L5n7A83gjCyY75katBdLbGCqeKtNrm8Fz
 QJa5Qi4B2JI1tw==
X-ME-Sender: <xms:8BFWXh-14232arNZb80RwQozkVJEQgPpZX3bPHtrLfDAOTGEeb7vcw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrleefgdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddutddmnecujfgurhephffvufffkffojghfggfgsedtkeertdertddt
 necuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgvhicuoehruhhstghurhesrhhushhsvg
 hllhdrtggtqeenucfkphepuddvvddrleelrdekvddruddtnecuvehluhhsthgvrhfuihii
 vgepheenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrd
 gttg
X-ME-Proxy: <xmx:8BFWXmN_qLxEeTlILR3cGdlJaZbu378a6u9S6OLG00QNmw0wLKBlNw>
 <xmx:8BFWXgsZ3RjlblJzAEmdfA8hfAEcDF5hrAUajFRipE9nxdksNqsbXA>
 <xmx:8BFWXg3BaG2cXgkoPtj8XvK9gG7p2V_Lv_fKBmTO9d_7hIxwLpX4Ig>
 <xmx:8BFWXrdwf5Y7SRUCpXhobxrqsFZ7EoUO8LtYQl9N7e0FPtzvsypxb-rYWF8>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id E365030610DB;
 Wed, 26 Feb 2020 01:36:28 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 6/8] powerpc/mm: implement set_memory_attr()
Date: Wed, 26 Feb 2020 17:35:49 +1100
Message-Id: <20200226063551.65363-7-ruscur@russell.cc>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200226063551.65363-1-ruscur@russell.cc>
References: <20200226063551.65363-1-ruscur@russell.cc>
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
Cc: ajd@linux.ibm.com, kernel-hardening@lists.openwall.com, jniethe5@gmail.com,
 Russell Currey <ruscur@russell.cc>, npiggin@gmail.com,
 kbuild test robot <lkp@intel.com>, joel@jms.id.au, dja@axtens.net
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
v4: cast "data" to unsigned long instead of int

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
index 2b573768a7f7..ee6b5e3b7604 100644
--- a/arch/powerpc/mm/pageattr.c
+++ b/arch/powerpc/mm/pageattr.c
@@ -72,3 +72,36 @@ int change_memory_attr(unsigned long addr, int numpages, long action)
 
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

