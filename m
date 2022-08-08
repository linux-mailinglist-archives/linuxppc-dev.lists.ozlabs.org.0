Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C60958C8EC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 15:02:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1bvZ2Tqsz3c5G
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 23:02:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=eIujQPhb;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=KVoUxAsG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=eIujQPhb;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=KVoUxAsG;
	dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1btw5Tllz2xGJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Aug 2022 23:01:43 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id A7BD05C0164;
	Mon,  8 Aug 2022 09:01:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 08 Aug 2022 09:01:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1659963699; x=1660050099; bh=TRzMMYUMhTXVULGxEiZcj/QX8
	Gs7AS/rHh0NfTP9vgk=; b=eIujQPhbZqbS4HlHWOb3cXNZTUFii6l+Ig5hZ2QyZ
	T4Lkslsk+1dxn5LLyv86oC56bATV0UYeXA6cCXT7TbtYKDP0PFCi+8/deK6H7Lml
	8SxOaM9S+bTJUse9+CTNwbXra5JNjTIUiU1rbsCKg6won8qG8t+8Z7HuPAepYE9G
	13DqH7Htky3bSedueHdeMV4GwlYARiHWlDL/hXzqihldh0RrUI6RR1N8iMhqJq2t
	JufjeIlc4fwQt08J+2mYTn0PHA9zWMPtd/MmvN9jMy9sW13CLof/y6wGcZZqns7R
	JTYVqjxoxlyo2UE1JMBZtJDDxv0u8XEaLKRoiXygCDtcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1659963699; x=1660050099; bh=TRzMMYUMhTXVULGxEiZcj/QX8Gs7AS/rHh0
	NfTP9vgk=; b=KVoUxAsGrvs8uDuxRWUhtK+XOizL0HpOhiNaxuF+WQgqjG9WLeT
	Jr2CfPpPhdFUmYtScpTjNAQmkIyke+ENSteF3zZrErWtTFzETKIRvFn9hqVOnfQ7
	WUHYuZsG8PvY+HP3tOl7Lret7JXNNYfGZcudv82sOvRmF9WJfY/lmEeZKSP2L3C/
	HmLwHLMcn9k6uMjOnMnl8Yl3nL9e5VNLfHjxFuIoiiPlr0yiXGM5RCujgqGapcNn
	RAZtw3LGtz2jj+1EgvReESOFEGnMUGA7rH9bBO4TTEdg9msMU8ObUQqRDkcD46Lf
	uErm/Ih0aUyCUQlEsHVtnEZQjD0wDPLYaFQ==
X-ME-Sender: <xms:MAnxYjdu_2d7B9jpD93YqvLqjb5KO6F7ehfmmelJY3EWqBI9W-whrw>
    <xme:MAnxYpNzcVmK4uVcIyiHnIN4Klnnd3d7YSuTWggYWa25AdWTG4th_0Y6g5-gk6PPc
    NKYmWOgPcIPXS_z6w>
X-ME-Received: <xmr:MAnxYsifCACKuriMlkgWq5V1Kh8MYkYAD3LXtfvKYdKe7ZiBWjyPsIRHS8WdzcoPtfJZuI1yqyFyszKdpxeLmDiCKu3oNTzx81IpC0Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefkedgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfedtmdenucfjughrpefhvf
    evufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgv
    hicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucggtffrrghtthgvrhhnpedvge
    duteejgfevveevuddtieegleeuffevhfefueehueffkefhffehgeehjefhtdenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrh
    hushhsvghllhdrtggt
X-ME-Proxy: <xmx:MQnxYk8kfcR_wLoK0F-4rnhV6WWFlSPJpiG8GLPaaMKRN-YyDh5IBw>
    <xmx:MQnxYvsz_06Jfwxl7uM5GnArEgsCXJb1zBSiHP6hxOjDv-OWMrKNug>
    <xmx:MQnxYjFApwFmMb6Jpo0NupBgJAqw8eblwnQvylTjZkavjmY5UE6zQg>
    <xmx:MwnxYlWUU3wCLXx1K379wCPOHNUsiCNRysAoqZ2BYB-CSj9ernPFCA>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Aug 2022 09:01:34 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/2] powerpc/mm: Move vm_get_page_prot() out of book3s64 code
Date: Mon,  8 Aug 2022 23:01:08 +1000
Message-Id: <20220808130109.30738-1-ruscur@russell.cc>
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
Cc: ajd@linux.ibm.com, anshuman.khandual@arm.com, npiggin@gmail.com, aneesh.kumar@linux.ibm.com, Russell Currey <ruscur@russell.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

protection_map is about to be __ro_after_init instead of const, so move
the only non-local function that consumes it to the same file so it can
at least be static.

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
v2: new

 arch/powerpc/mm/book3s64/pgtable.c | 16 ----------------
 arch/powerpc/mm/pgtable.c          | 21 +++++++++++++++++++--
 2 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 7b9966402b25..e2a4ea5eb960 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -550,19 +550,3 @@ unsigned long memremap_compat_align(void)
 }
 EXPORT_SYMBOL_GPL(memremap_compat_align);
 #endif
-
-pgprot_t vm_get_page_prot(unsigned long vm_flags)
-{
-	unsigned long prot = pgprot_val(protection_map[vm_flags &
-					(VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]);
-
-	if (vm_flags & VM_SAO)
-		prot |= _PAGE_SAO;
-
-#ifdef CONFIG_PPC_MEM_KEYS
-	prot |= vmflag_to_pte_pkey_bits(vm_flags);
-#endif
-
-	return __pgprot(prot);
-}
-EXPORT_SYMBOL(vm_get_page_prot);
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index cb2dcdb18f8e..0b2bbde5fb65 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -27,6 +27,7 @@
 #include <asm/tlb.h>
 #include <asm/hugetlb.h>
 #include <asm/pte-walk.h>
+#include <asm/pkeys.h>
 
 #ifdef CONFIG_PPC64
 #define PGD_ALIGN (sizeof(pgd_t) * MAX_PTRS_PER_PGD)
@@ -493,6 +494,22 @@ const pgprot_t protection_map[16] = {
 	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= PAGE_SHARED_X
 };
 
-#ifndef CONFIG_PPC_BOOK3S_64
-DECLARE_VM_GET_PAGE_PROT
+#ifdef CONFIG_PPC_BOOK3S_64
+pgprot_t vm_get_page_prot(unsigned long vm_flags)
+{
+	unsigned long prot = pgprot_val(protection_map[vm_flags &
+					(VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]);
+
+	if (vm_flags & VM_SAO)
+		prot |= _PAGE_SAO;
+
+#ifdef CONFIG_PPC_MEM_KEYS
+	prot |= vmflag_to_pte_pkey_bits(vm_flags);
 #endif
+
+	return __pgprot(prot);
+}
+EXPORT_SYMBOL(vm_get_page_prot);
+#else
+DECLARE_VM_GET_PAGE_PROT
+#endif /* CONFIG_PPC_BOOK3S_64 */
-- 
2.37.1

