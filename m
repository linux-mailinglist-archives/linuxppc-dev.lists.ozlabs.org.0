Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5FF58C8ED
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 15:02:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1bwG6dZfz3cd6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 23:02:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=QzcPL/dG;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=BZhdHmQA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=QzcPL/dG;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=BZhdHmQA;
	dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1btx4gCCz2xHb
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Aug 2022 23:01:45 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 92AFD5C010F;
	Mon,  8 Aug 2022 09:01:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 08 Aug 2022 09:01:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1659963703; x=1660050103; bh=XT
	zkYp/ohy/3DoEWoEmvGh8s1ugeylCHf8upEgTzWb8=; b=QzcPL/dGt7nmwjlHjA
	d/7pRHFLdb/2+0Cxub+K/5i/ZOZwdi4amyVH+9Q1NHmnL+GYeuUyB3G4MD3KmHYc
	LBPXqZCz41RCpmccrUrZK4rlSNU+42ta8rAvKFXDvis+8PUPF7c6yxrMOmY8wOib
	f0Gr8pqa4g4w5tfbmFGvueAAa75xsDhCjhRsENE0jczw0ZJm3CzsId75LaiyzDKb
	OddqUQtBt0q3ew8H8qpr4x9FC6L9EEhO3XP93hIKYvD3yZsUeToBSKfWt3v1DT3p
	Fvu/enCZ8UGtlszQMk6HXL/bTZunub/SxilFJhMW6BGrB3pBuVOvy4WTmjWECfCi
	HsdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1659963703; x=1660050103; bh=XTzkYp/ohy/3D
	oEWoEmvGh8s1ugeylCHf8upEgTzWb8=; b=BZhdHmQAjGFoHOH1VZ/KNlUEGGyD0
	E6imnGtTAzXusIv9Spx6gvxpiY2ZoWdzRzRQKFVp8qQPVgiEX68o400Kq3kK+bgJ
	qSVuoedB9TvrSC04Kgc9Sd4on8Nq7r9Ehv8j4ucghzWaHG2QnUpc9UhZYUoehgSX
	bWLU5hsdAua2oPB5O6+nYoEvpawFw0xpu7mK9mU88FXCpJ1upQwmWP/lXPiG/mij
	G0BZ8pZsab3sitWQ3Dhj13nSP2mztchTXGB/yeH4gK7Yb2hjpbsAY5uE4ujWCZWT
	ARBWvhD58CNFJuHkiutkixf1Cdbqf+y0vHOGs32vHGqBhmSsOkHl025nA==
X-ME-Sender: <xms:NgnxYhv2v3cLIQudWLSIHUnDm0D-_B9ZeAyuHvoKk85Ml_YlrCU9sw>
    <xme:NgnxYqcnsgZV9udXWBxJAs7aOeIJtCMz61H12ADZSYsVW9QNdOk57grm5mQQYOJh2
    HGWsBhjNCIhsYBpvg>
X-ME-Received: <xmr:NgnxYkxEz0BV9SF60bo_FntT1_a4wmHDq1W6NebxwYcwdJbEiYY1i33NbpXGiWGm6a7pP_DeK3bvsX9eE8XdttECr7n0j8NfdsEf-AQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefkedgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdludehmdenucfjughrpefhvf
    evufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhr
    rhgvhicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucggtffrrghtthgvrhhnpe
    eitdetkeduveetteeltedvveetfeefvdfggeehkeevkeehudehkeevvedvgfffgeenucff
    ohhmrghinhepghhithhhuhgsuhhsvghrtghonhhtvghnthdrtghomhenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrhhushhs
    vghllhdrtggt
X-ME-Proxy: <xmx:NgnxYoPIj_KrB-j7Oee3-_VV78N-MRu54F1eK403XEy8OwSqEdui4g>
    <xmx:NgnxYh_WZSRq5sM8lUjlbxmum7qgt-UP0mZjE8hwT6aSraN7rg6bJw>
    <xmx:NgnxYoWhNsV26ggUyRHir0rPdsAoo--jjnEBw525pkxcOjrB6smn3g>
    <xmx:NwnxYklCr77eOQDsDOgwSa7_BwP6ypZxzGnf-Nu2dYaX4hWtvIgMKQ>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Aug 2022 09:01:39 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/2] powerpc/mm: Support execute-only memory on the Radix MMU
Date: Mon,  8 Aug 2022 23:01:09 +1000
Message-Id: <20220808130109.30738-2-ruscur@russell.cc>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808130109.30738-1-ruscur@russell.cc>
References: <20220808130109.30738-1-ruscur@russell.cc>
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
Cc: ajd@linux.ibm.com, anshuman.khandual@arm.com, npiggin@gmail.com, aneesh.kumar@linux.ibm.com, Russell Currey <ruscur@russell.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The Hash MMU already supports XOM (i.e. mmap with PROT_EXEC only)
through the execute-only pkey.  A PROT_EXEC-only mapping will actually
map to RX, and then the pkey will be applied on top of it.

Radix doesn't have pkeys, but it does have execute permissions built-in
to the MMU, so all we have to do to support XOM is expose it.

That's not possible with protection_map being const, so make it RO after
init instead.

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
v2: Make protection_map __ro_after_init and set it in an initcall
(v1 didn't work, I tested before rebasing on Anshuman's patches)

basic test: https://raw.githubusercontent.com/ruscur/junkcode/main/mmap_test.c

 arch/powerpc/include/asm/book3s/64/radix.h |  3 +++
 arch/powerpc/include/asm/pgtable.h         |  1 -
 arch/powerpc/mm/fault.c                    | 10 ++++++++++
 arch/powerpc/mm/pgtable.c                  | 16 +++++++++++++++-
 4 files changed, 28 insertions(+), 2 deletions(-)

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
 
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 33f4bf8d22b0..3cbb6de20f9d 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -60,7 +60,6 @@ extern void paging_init(void);
 void poking_init(void);
 
 extern unsigned long ioremap_bot;
-extern const pgprot_t protection_map[16];
 
 /*
  * kern_addr_valid is intended to indicate whether an address is a valid
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
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 0b2bbde5fb65..6e1a6a999c3c 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -475,7 +475,7 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
 EXPORT_SYMBOL_GPL(__find_linux_pte);
 
 /* Note due to the way vm flags are laid out, the bits are XWR */
-const pgprot_t protection_map[16] = {
+static pgprot_t protection_map[16] __ro_after_init = {
 	[VM_NONE]					= PAGE_NONE,
 	[VM_READ]					= PAGE_READONLY,
 	[VM_WRITE]					= PAGE_COPY,
@@ -494,6 +494,20 @@ const pgprot_t protection_map[16] = {
 	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= PAGE_SHARED_X
 };
 
+#ifdef CONFIG_PPC_RADIX_MMU
+static int __init radix_update_protection_map(void)
+{
+	if (early_radix_enabled()) {
+		/* Radix directly supports execute-only page protections */
+		protection_map[VM_EXEC] = PAGE_EXECONLY;
+		protection_map[VM_EXEC | VM_SHARED] = PAGE_EXECONLY;
+	}
+
+	return 0;
+}
+arch_initcall(radix_update_protection_map);
+#endif /* CONFIG_PPC_RADIX_MMU */
+
 #ifdef CONFIG_PPC_BOOK3S_64
 pgprot_t vm_get_page_prot(unsigned long vm_flags)
 {
-- 
2.37.1

