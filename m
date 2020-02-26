Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0174D16F83F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 07:56:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S6682j74zDqvw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 17:56:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm1 header.b=L6CsOItH; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=mPi9H+PU; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S5gH1Kn1zDqGn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 17:36:43 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id B81D3633;
 Wed, 26 Feb 2020 01:36:39 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 26 Feb 2020 01:36:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=W5XsVjL9tIlpR
 T/rT1hidYf17YF0ZVTADr8UzRX/C3A=; b=L6CsOItH9rQDK40ZHxDDveX5ypsBb
 ClDy6mOULobhKgxQ/qGVMtg2cTCduu15RGWQ0RiNC/kBaW1AMi57bWUw6+9dJfYB
 7xRzUmj7wR4T2s5LkZ+YDGHgLSrONf1efS8f9RhSlN8j1LoxZ1G1x2d0j7+5ZMSK
 5CwCgI4qulW8qY6kGY+lw5Ug247ZQiWCCyag6sQponpXELmWKKqG96qEj0i8+ARt
 wkdiqFmpNEEFGo8wFcvZUT42/VcmX4v+WIWn2N/MC0o0XC8tvGLsEYqIqMsyOXan
 CbnwAbuusu38Ia8TYTjej/hgOJVAvnvEQgF8wmBO4+LQwaOUL/hOCTv3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=W5XsVjL9tIlpRT/rT1hidYf17YF0ZVTADr8UzRX/C3A=; b=mPi9H+PU
 Lo6fKgNX1fUhBf5pFZ4LuC5/rQ+GQd+XxQ2z907YbMN3MczhyNJDu2V8PHsb5Z5b
 aN0KiGH65+3CrmJ/oOjU4XpCBTDsSaFBs6DZK6AxEkJr/L6ou8dQuXi2c8iAh5os
 K6sVWnETfMNetfgDmJ2AjggJLUcv9GhN5wwOlzF3VIupjwHcZVwffvfsBoVnRsbK
 HtLrZAB+3Xp0/CZh+/3EG3o0KZhBu7v3ZamOVpLsDxlm/pbTBcjPV9rs/AoCPDsq
 EG+htObDHZIFaogUcYLNWc2Kq/T72sjJBwhm4cFukWrGgnWWypp5BFAqLD0oMG0D
 HcMyqF32PK3SrA==
X-ME-Sender: <xms:9xFWXmLen64EiRKs67CERxHZDNLtCtjR8pnmMP-az16IDUtQaFJ12A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrleefgdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdduhedmnecujfgurhephffvuf
 ffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgv
 hicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucfkphepuddvvddrleelrdekvd
 druddtnecuvehluhhsthgvrhfuihiivgepjeenucfrrghrrghmpehmrghilhhfrhhomhep
 rhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:9xFWXrg7ylTU1z3kmYOiT2xAUcjWNBF8UnDN8w6AiR0xaH8SBWztyQ>
 <xmx:9xFWXr53YHUhApAyMVE1rzVpUeYu4pwB5zZV0tYr8qI1Ty86OTpS7g>
 <xmx:9xFWXozKpB9fuvw4zogOXXgT8sFpF1AUHMxgMUj8GxMAIr7Ad-c3dQ>
 <xmx:9xFWXvU3Xzvcn16NikFrKtmGDko3NSRmSEOJ6SBfS-slCUt4fVxysg>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 04FFC3060FE0;
 Wed, 26 Feb 2020 01:36:35 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 8/8] powerpc/mm: Disable set_memory() routines when strict
 RWX isn't enabled
Date: Wed, 26 Feb 2020 17:35:51 +1100
Message-Id: <20200226063551.65363-9-ruscur@russell.cc>
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
 Russell Currey <ruscur@russell.cc>, npiggin@gmail.com, joel@jms.id.au,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are a couple of reasons that the set_memory() functions are
problematic when STRICT_KERNEL_RWX isn't enabled:

 - The linear mapping is a different size and apply_to_page_range()
	may modify a giant section, breaking everything
 - patch_instruction() doesn't know to work around a page being marked
 	RO, and will subsequently crash

The latter can be replicated by building a kernel with the set_memory()
patches but with STRICT_KERNEL_RWX off and running ftracetest.

Reported-by: Jordan Niethe <jniethe5@gmail.com>
Signed-off-by: Russell Currey <ruscur@russell.cc>
---
v5: Apply to both set_memory_attr() and change_memory_attr()
v4: New

 arch/powerpc/mm/pageattr.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
index ee6b5e3b7604..49b8e2e0581d 100644
--- a/arch/powerpc/mm/pageattr.c
+++ b/arch/powerpc/mm/pageattr.c
@@ -64,13 +64,18 @@ static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
 
 int change_memory_attr(unsigned long addr, int numpages, long action)
 {
-	unsigned long start = ALIGN_DOWN(addr, PAGE_SIZE);
-	unsigned long sz = numpages * PAGE_SIZE;
+	unsigned long start, size;
+
+	if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
+		return 0;
 
 	if (!numpages)
 		return 0;
 
-	return apply_to_page_range(&init_mm, start, sz, change_page_attr, (void *)action);
+	start = ALIGN_DOWN(addr, PAGE_SIZE);
+	size = numpages * PAGE_SIZE;
+
+	return apply_to_page_range(&init_mm, start, size, change_page_attr, (void *)action);
 }
 
 /*
@@ -96,12 +101,17 @@ static int set_page_attr(pte_t *ptep, unsigned long addr, void *data)
 
 int set_memory_attr(unsigned long addr, int numpages, pgprot_t prot)
 {
-	unsigned long start = ALIGN_DOWN(addr, PAGE_SIZE);
-	unsigned long sz = numpages * PAGE_SIZE;
+	unsigned long start, size;
+
+	if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
+		return 0;
 
 	if (!numpages)
 		return 0;
 
-	return apply_to_page_range(&init_mm, start, sz, set_page_attr,
+	start = ALIGN_DOWN(addr, PAGE_SIZE);
+	size = numpages * PAGE_SIZE;
+
+	return apply_to_page_range(&init_mm, start, size, set_page_attr,
 				   (void *)pgprot_val(prot));
 }
-- 
2.25.1

