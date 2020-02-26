Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AC316F81B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 07:41:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S5mb6w2ZzDqdD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 17:41:19 +1100 (AEDT)
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
 header.s=fm1 header.b=ig3tKLSd; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=frUbAQk+; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S5Pn5ynzzDqZl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 17:25:01 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 89CD2595;
 Wed, 26 Feb 2020 01:24:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 26 Feb 2020 01:24:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=gC9R82Z78vRPQ
 T2nLufVwEVT7hVhqTaScp+rv4N5psk=; b=ig3tKLSd8Raq/f9CKyLsyOtp2xg0p
 M6k3229pNXNqKc/4FZtRMabYp0SHheExoD/IVpmPh0Df1NVlLFg2l5oUxL4GfMZ6
 wLUuNqJsVmB8/MSkx3h6T6fbwxEOIz6FAFyuKT0CN06iElfG4X4DF+n0+vhqjRwO
 PUCGuiMmbjQcwIXZJWzKBvzrL0uGwtcfc6V2AZERdGp4PgjNzQIxElofoAkLk3t7
 P8o3PBPfthiAQhUtI/ewAi6+Fcj7ycBjZwIXt77022+NckTpEPpA9jTsGw/kJFaM
 wL5OSq7jybpA22SGyW8IKd6fZOsoOTKbAu1BlYHwnO50L7HzpeJGY7hxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=gC9R82Z78vRPQT2nLufVwEVT7hVhqTaScp+rv4N5psk=; b=frUbAQk+
 +WhF2mjFG6mqR7RrBSsHeEnZIwA9UxXrczy/gHnoTS7GInTQ6elwiolhgKeEliX0
 wIh9kputHoQkGkADEBHBRCDnBFo4xULfJZwhMvoZ0rVmKawksIHlsfuKE53ohxaA
 DP7NJXlYhgM7Vr3cfCV/QOWpUPfdifq03agp/s8Rh0U+Rp91EnMkx9OL+FB0Qs90
 4KKgX1rmnlX9iFQuGsEFJ9kXYaf7X+FfyWQorR94L9kMoRIh4Id8Uc08QbY3gIkA
 rjZSMSyHPeeDSi1joc42f8N+Haa/0g/CRNufTS1bJSYIYMtpcxo+Xz827cXkid7N
 X3YP5avmMMzQkw==
X-ME-Sender: <xms:OQ9WXvf-H9ebOtO6IiQ9zIsX_iRAk42VcUzoCpyPIBW0gYwP2PxMBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrleefgdeljecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdduhedmnecujfgurhephffvufffkffojghfggfgsedtkeertdertddt
 necuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgvhicuoehruhhstghurhesrhhushhsvg
 hllhdrtggtqeenucfkphepuddvvddrleelrdekvddruddtnecuvehluhhsthgvrhfuihii
 vgepjeenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrd
 gttg
X-ME-Proxy: <xmx:OQ9WXi5geZ5bzbMV_FfB_bN0K3LxYdiNfkapWkgiyaz6S-ws-NKTlg>
 <xmx:OQ9WXqQx8mfzFhyaTQHDoQKfBZVMeV__sVxhI6AK1a3eaCjTAIVHGA>
 <xmx:OQ9WXtczVFGdIWyCpFHB0s-dWjAtpikZzyE3wqmyG1KpBsarqXOARw>
 <xmx:OQ9WXqS6SUimkUcIXJZWwKae3f6osCDHCrTa80zW-TKWBEadxqbeKw>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id ADB893060F09;
 Wed, 26 Feb 2020 01:24:54 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 8/8] powerpc/mm: Disable set_memory() routines when strict
 RWX isn't enabled
Date: Wed, 26 Feb 2020 17:24:03 +1100
Message-Id: <20200226062403.63790-9-ruscur@russell.cc>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200226062403.63790-1-ruscur@russell.cc>
References: <20200226062403.63790-1-ruscur@russell.cc>
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
 joel@jms.id.au, Russell Currey <ruscur@russell.cc>,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
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
v4: new

 arch/powerpc/mm/pageattr.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
index ee6b5e3b7604..ff111930cf5e 100644
--- a/arch/powerpc/mm/pageattr.c
+++ b/arch/powerpc/mm/pageattr.c
@@ -96,12 +96,17 @@ static int set_page_attr(pte_t *ptep, unsigned long addr, void *data)
 
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

