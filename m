Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8066E58D210
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 04:45:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1y9l3CZmz3btQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 12:45:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=HSVo8q1Z;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=n/PbKRUm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=HSVo8q1Z;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=n/PbKRUm;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1y931kL6z2xHC
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Aug 2022 12:45:10 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 667243200911;
	Mon,  8 Aug 2022 22:45:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 08 Aug 2022 22:45:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1660013104; x=1660099504; bh=+h27m9j4U0O4lNS29/OuGeIDE
	XTqDgqs45fl/9vYv1k=; b=HSVo8q1Zia047lfz9kMOIq73Xzm19Ke72aF8LRDOz
	VobtqBmQQiKkoDM1XrFIBPvFJHGYY+9RdoppF65dTuTBAYkGAOR9DqXuXpre9F7q
	CYgP2K8OwUv+j/uJvIF5DvO4w5R4sfX4vcEYJOyvB24XvlSC0Cq2KIYPYiLKqtQz
	d93AHjbyrZOlxU1ah9HlQbqb4Yi/EzlvPW9tEPWGtFjAF9UlKrDR1T8Jb346FTPG
	/lfzMzl9Tu4itYa4Zpoi4AaQRyYV6B+6dOUy0Q/r/8hN5qj9Yve9g/zV0yNuFpAd
	Wy1WfmCLO8UZJ8azMNc8UfbH5D1dOcyrbox9jkmEyGNsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1660013104; x=1660099504; bh=+h27m9j4U0O4lNS29/OuGeIDEXTqDgqs45f
	l/9vYv1k=; b=n/PbKRUm9+0NwVzM7jCAc9/BYFWCaWlP1MsbwGUZkf911az9yZv
	cRw2FqiLFThWc+xnL17U4wbzAyF26xWjlH9miyLzPjyrJlHAhx5yp/3WA7MDTHfI
	pfOqCGiAHmefxQ7tqSk361QYpw4QVHw1ueLCiqc+0EcFGdBgPkpezI5ArXVNlx7B
	kGU4tpXuT+1+kk0JyiWtZtniXc5lldYJOGynGnuM1tlIB1eFaCXv0DXZ3T+Jn+B9
	1XbC+koxc8GodQ6ve3fhZx7n20bIhDKtJ1u6e9Jhn46yQuQMy9NuGbU56rza8Cf8
	M9kmmz9MSJ4+HUyY2FS+yZE6ldgDj6+KFrQ==
X-ME-Sender: <xms:L8rxYtpac2Y5WNUnD4dBU5GWYX80W1hAcz_Bkn6uvHYYQU3qx2zzuA>
    <xme:L8rxYvqmq1fHj1gt4jnkBH1iLAmu5dXeci_gLjc-kUdrzhw6wR2f6yefB9jBRfF5y
    fqM4x07I0SeqYl_zQ>
X-ME-Received: <xmr:L8rxYqMM8z08dUgTUZTNqshbn80k5R9WjYvgnwWu7DqNbFBL9MR3dRqj1j7COWbh_I9e0tVA34jFb4WOlOHRDDnX_ZoV2GgSPCev4luJt_XDtw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefledgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdludehmdenucfjughrpefhvf
    evufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgv
    hicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucggtffrrghtthgvrhhnpeevje
    egieelueeijedvgffhjeevheehfffgjeevffeihedttdevveejffdttefgudenucffohhm
    rghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:MMrxYo4__gJjGG5C4-X1yBr9Zw8A8Y3SkSqmWi5L7HEFBJZ5s9UXJQ>
    <xmx:MMrxYs5nhqpC068abzZBKcsJ20Tce-7TwCQqjySUidaZ6jfLZnvWFA>
    <xmx:MMrxYgjjSzPZGzWMKbnkmJPjOBI8eZUzzpAPcMPzv0aZIJzsNhkSjg>
    <xmx:MMrxYrbjlPUP0hvw5qbVLPsLym2d6Rn_vNgL_ilo63SQtiaxurZuSQ>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Aug 2022 22:45:01 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3] powerpc/mm: Support execute-only memory on the Radix MMU
Date: Tue,  9 Aug 2022 12:44:33 +1000
Message-Id: <20220809024433.17644-1-ruscur@russell.cc>
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
Cc: ajd@linux.ibm.com, anshuman.khandual@arm.com, Russell Currey <ruscur@russell.cc>, npiggin@gmail.com, aneesh.kumar@linux.ibm.com, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The Hash MMU already supports XOM (i.e. mmap with PROT_EXEC only)
through the execute-only pkey.  A PROT_EXEC-only mapping will actually
map to RX, and then the pkey will be applied on top of it.

Radix doesn't have pkeys, but it does have execute permissions built-in
to the MMU, so all we have to do to support XOM is expose it.

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
v3: Incorporate Aneesh's suggestions, leave protection_map untouched
Basic test: https://github.com/ruscur/junkcode/blob/main/mmap_test.c

 arch/powerpc/include/asm/book3s/64/pgtable.h |  2 ++
 arch/powerpc/mm/book3s64/pgtable.c           | 11 +++++++++--
 arch/powerpc/mm/fault.c                      |  6 +++++-
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 392ff48f77df..486902aff040 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -151,6 +151,8 @@
 #define PAGE_COPY_X	__pgprot(_PAGE_BASE | _PAGE_READ | _PAGE_EXEC)
 #define PAGE_READONLY	__pgprot(_PAGE_BASE | _PAGE_READ)
 #define PAGE_READONLY_X	__pgprot(_PAGE_BASE | _PAGE_READ | _PAGE_EXEC)
+/* Radix only, Hash uses PAGE_READONLY_X + execute-only pkey instead */
+#define PAGE_EXECONLY	__pgprot(_PAGE_BASE | _PAGE_EXEC)
 
 /* Permission masks used for kernel mappings */
 #define PAGE_KERNEL	__pgprot(_PAGE_BASE | _PAGE_KERNEL_RW)
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 7b9966402b25..62f63d344596 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -553,8 +553,15 @@ EXPORT_SYMBOL_GPL(memremap_compat_align);
 
 pgprot_t vm_get_page_prot(unsigned long vm_flags)
 {
-	unsigned long prot = pgprot_val(protection_map[vm_flags &
-					(VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]);
+	unsigned long prot;
+
+	/* Radix supports execute-only, but protection_map maps X -> RX */
+	if (radix_enabled() && ((vm_flags & (VM_READ|VM_WRITE|VM_EXEC)) == VM_EXEC)) {
+		prot = pgprot_val(PAGE_EXECONLY);
+	} else {
+		prot = pgprot_val(protection_map[vm_flags &
+				  (VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]);
+	}
 
 	if (vm_flags & VM_SAO)
 		prot |= _PAGE_SAO;
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 014005428687..59e4cbcf3109 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -270,7 +270,11 @@ static bool access_error(bool is_write, bool is_exec, struct vm_area_struct *vma
 		return false;
 	}
 
-	if (unlikely(!vma_is_accessible(vma)))
+	/* On Radix, a read fault could be from PROT_NONE or PROT_EXEC */
+	if (unlikely(radix_enabled() && !(vma->vm_flags & VM_READ)))
+		return true;
+	/* Check for a PROT_NONE fault on other MMUs */
+	else if (unlikely(!vma_is_accessible(vma)))
 		return true;
 	/*
 	 * We should ideally do the vma pkey access check here. But in the
-- 
2.37.1

