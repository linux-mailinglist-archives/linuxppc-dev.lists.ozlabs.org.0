Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE8E58C80D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 14:00:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1ZXh30NVz3fgK
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 22:00:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=K50qD1Q5;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=xn4EmiIr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=K50qD1Q5;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=xn4EmiIr;
	dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1ZWN1JJHz2ywc
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Aug 2022 21:59:43 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 9E54932009CB;
	Mon,  8 Aug 2022 07:59:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 08 Aug 2022 07:59:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1659959971; x=1660046371; bh=iZUlFRrjpi/9AIxf6zmPXT6Bg
	lerPy7lLchcLGUzh3s=; b=K50qD1Q5qMW0S9TajIRWBooP10Q+DQ0PaX7jxz05I
	20ZmW4zJsp1qGwWbe/UK/OSvcxGlU1Y16I6uMX+uXahQHstvugRvlrNM0gsdcjAL
	C5soWXRl6nmmSNBB6UiXzN3dBr2fDijEMC3a1KRobNzhwgV0pb1FUbTU7O79j0pH
	IDewh58tpmecylerAJk7DsVOzQqlny+heu5ro4NItGPIZSVE8ncAsGwVnrpDAR8z
	wnRblxkbcr3f62rdr7/k6RrCUieV4LesBp9/qEgsg8A11Az70Gm4OYKOOtQQy9SV
	6s+NgLefemWdBZU+J8HOQktQFgc4EUOc+BJQpUsjbK0eA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1659959971; x=1660046371; bh=iZUlFRrjpi/9AIxf6zmPXT6BglerPy7lLch
	cLGUzh3s=; b=xn4EmiIr35aE0fK/3wTXleS2AGthjEtjWS8+b3DeCg64hrOt2rY
	xi0G0/PgxQMKucy8GS3xtf8NZZVoT5kaJRCFGcwnpW5mOZPVqUD006PHwzwHYPAB
	vqehsYKoRrO036d8WjGPd6eSgHLDgy0Ycfea14IcL1UyxwRNKIgwQ4aR9xlzcdEN
	T3SGQ2ERl83kBVH17JMRgVC0IUlqMg6ePgVAHSrWc9j9MlD4CpBo8y/D95Ajo+IX
	5UZgjmOWTByfFKMpxnrEs7E/1d/89vkU4VlKfywryzLoWS1vbWFbExEUMY16drSZ
	fNv8YEsY/S1saqn6pJW7e0OaeyTd7imCsHQ==
X-ME-Sender: <xms:ovrwYsqnCwcFRK_Ub55eLTZ_lYaNTl5A5EAGMF-7Km6WueoIKG_9iw>
    <xme:ovrwYioJ5JqQD6RlTv8hZZw-pY1g_5yHFIlqpq5dbV3eTZcR9ZFMTCgpsU3kA9xZg
    5cq5JVCgscJTTe55Q>
X-ME-Received: <xmr:ovrwYhP7a6nqq-FfJvT3aIjDvStOsjI5KOhTg-l2qFm3rtLw4NdR70MmZPizB2zK9sbBN90XwMy1p6anw1I48aAXxY8zfjVWsAUddfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefkedggeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdludehmdenucfjughrpefhvf
    evufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgv
    hicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucggtffrrghtthgvrhhnpeetgf
    ejvddvjedufeekvefhudeltdejhefhueehffeggedtgffhteehffekgedvheenucffohhm
    rghinhepghhithhhuhgsuhhsvghrtghonhhtvghnthdrtghomhenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrhhushhsvghl
    lhdrtggt
X-ME-Proxy: <xmx:o_rwYj5l9Fp5v7-r-Xk1BznbTNLJDtDhys2FK49b5jX6Okklwu3F2g>
    <xmx:o_rwYr6TcKJ_RJe1qulNUrI_Ad04tNmfgkAGZvlp9QrdgmJBhNSSQw>
    <xmx:o_rwYjg4usYG6w0bIA6xZT-PpXq1yK7onRe-VMrM1kgNBZPyrUdnaA>
    <xmx:o_rwYu3t1BWf0vEBBU8EpIaVA7rmut74KZBrfDRLIvVrk8WkEO2uig>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Aug 2022 07:59:28 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/mm: Support execute-only memory on the Radix MMU
Date: Mon,  8 Aug 2022 21:58:28 +1000
Message-Id: <20220808115828.20113-1-ruscur@russell.cc>
X-Mailer: git-send-email 2.37.1
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
Cc: Russell Currey <ruscur@russell.cc>, ajd@linux.ibm.com, npiggin@gmail.com, aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The Hash MMU already supports XOM (i.e. mmap with PROT_EXEC only)
through the execute-only pkey.  A PROT_ONLY mapping will actually map to
RX, and then the pkey will be applied on top of it.

Radix doesn't have pkeys, but it does have execute permissions built-in
to the MMU, so all we have to do to support XOM is expose it.

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
quick test: https://raw.githubusercontent.com/ruscur/junkcode/main/mmap_test.c
I can make it a selftest.

 arch/powerpc/include/asm/book3s/64/radix.h |  3 +++
 arch/powerpc/mm/book3s64/radix_pgtable.c   |  4 ++++
 arch/powerpc/mm/fault.c                    | 10 ++++++++++
 3 files changed, 17 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index 686001eda936..bf316b773d73 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -19,6 +19,9 @@
 #include <asm/cpu_has_feature.h>
 #endif
 
+/* Execute-only page protections, Hash can use RX + execute-only pkey */
+#define PAGE_EXECONLY	__pgprot(_PAGE_BASE | _PAGE_EXEC)
+
 /* An empty PTE can still have a R or C writeback */
 #define RADIX_PTE_NONE_MASK		(_PAGE_DIRTY | _PAGE_ACCESSED)
 
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 698274109c91..2edb56169805 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -617,6 +617,10 @@ void __init radix__early_init_mmu(void)
 	__pmd_frag_nr = RADIX_PMD_FRAG_NR;
 	__pmd_frag_size_shift = RADIX_PMD_FRAG_SIZE_SHIFT;
 
+	/* Radix directly supports execute-only page protections */
+	protection_map[VM_EXEC] = PAGE_EXECONLY;
+	protection_map[VM_EXEC | VM_SHARED] = PAGE_EXECONLY;
+
 	radix_init_pgtable();
 
 	if (!firmware_has_feature(FW_FEATURE_LPAR)) {
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 014005428687..887c0cc45ca6 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -270,6 +270,16 @@ static bool access_error(bool is_write, bool is_exec, struct vm_area_struct *vma
 		return false;
 	}
 
+	if (unlikely(!(vma->vm_flags & VM_READ))) {
+		/*
+		 * If we're on Radix, then this could be a read attempt on
+		 * execute-only memory.  On other MMUs, an "exec-only" page
+		 * will be given RX flags, so this might be redundant.
+		 */
+		if (radix_enabled())
+			return true;
+	}
+
 	if (unlikely(!vma_is_accessible(vma)))
 		return true;
 	/*
-- 
2.37.1

