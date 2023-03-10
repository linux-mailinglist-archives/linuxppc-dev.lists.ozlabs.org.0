Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 108186B35F7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 06:10:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXvJg6Hmbz3f3Y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 16:10:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=AsdLta9x;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=INrp/FZY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=AsdLta9x;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=INrp/FZY;
	dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXvHf41K8z308w
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 16:09:49 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 42955320094D;
	Fri, 10 Mar 2023 00:09:42 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 10 Mar 2023 00:09:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:sender:subject:subject:to:to; s=fm2; t=1678424981; x=
	1678511381; bh=yg4hZIdFlMZK0mgVdpDBjn6FmVecYs1a0U9KUTPtVMk=; b=A
	sdLta9xrjaOfWsik6qdW6gYR1Uz1R81dpJu7Hp+7ptV1D3cAp0Id9mVDdgGr4fKx
	1xTd0Judvl1Y5mFA4D9ZsGbxGPyo+Ui7KFQLNqVeFeE+Tdx6VuL9KvViuY22rN9o
	yW8j24376r1+DHsVOTlzfDeXKmsLC+Alhz6QSl539W1LeU0RvWFQMXtHAFQBg4Pg
	FmYO1JV6cwJ4OXbVf4M1rd8bh6SQbFxAG7zQBqTFNUynjmP5VkDs5YWnX5AGboz/
	fBmEgfek0I9iuOA3nGhELXveRIFXWqK4vBg4yjMQQ+iFhDyDi8oQs5UtDz9/ZLut
	u42rvF+eP5MD+lXegbDiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1678424981; x=1678511381; bh=y
	g4hZIdFlMZK0mgVdpDBjn6FmVecYs1a0U9KUTPtVMk=; b=INrp/FZYxiDAKLV2z
	8ESr9yJu0a5avTNi96bo4Ao0M9SeZFHSMftAonMNbQcfoTlPmFUSN7IWGIyYEYdR
	tn7x7zUsXYqZK/axoNydDHrOYcQPXRD3GlycZZAGzJ+BxuROJL3NPPFiDyaN6bY6
	JnCQTmQ1IwP1owDleRrFagoyctRVMcZtH63lwvXVNRkgY+HhaD1IJOYpJQEggoSI
	0HQ+SUlxcZqj4DLx0pVA3TSP7BOBmWcBiKGiHeKs9inlbdeu0Vb1fSm85GtWXT4h
	3pl4Mgi/NRlBCHmCzyJ9DJQ1xKOa0Lemwodkm8ad9U7ULLfwgOMME3GhrJ/YzXNZ
	318ew==
X-ME-Sender: <xms:lbsKZF2Paw8j-RuMr8tUMhGLf34stVwRf2F4cvN0ukQrFaV41mxmRQ>
    <xme:lbsKZMG0S0sw7hiodials0o8MoWz78TpJGfNK04Y93tdjuvcyw4kWJGWQtsL0I9JR
    qOZHrZ0XFI7fednWA>
X-ME-Received: <xmr:lbsKZF607QpnUP5dIPaeSXxdQEkxymR5-rNWdpSwUDxd80XfiksrepogkWVO9CCCEpvYX8On3qSjeXaChtkwh98mMCW72nho9zPROP7LJz8lTg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddujedgjeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdluddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredt
    jeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruhhssh
    gvlhhlrdgttgeqnecuggftrfgrthhtvghrnhepgeehvddugeetvdeluedukeeileeivddt
    heffhfegfeejleduudfgheevvdefgffhnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:lbsKZC2szUYZRH6UZzCAEKnvHPksEW7i__LLKxGSybu-TZMziqmjaA>
    <xmx:lbsKZIGBAuoDBeAtO6N3t2nqn6fN15lcBNFlVGQsUWHhNoDEj24_hg>
    <xmx:lbsKZD-mPaV-pgaFPT2fXdJTaJFRG8G7rI9omWHzXD6eUmcDSihXOA>
    <xmx:lbsKZMD09qRiq3La7L7QXTkc4I7EhGFp_Tel8lXNwVmvlo8lLJdjAg>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Mar 2023 00:09:39 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/mm: Fix false detection of read faults
Date: Fri, 10 Mar 2023 16:08:34 +1100
Message-Id: <20230310050834.63105-1-ruscur@russell.cc>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>, Benjamin Gray <bgray@linux.ibm.com>, Russell Currey <ruscur@russell.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To support detection of read faults with Radix execute-only memory, the
vma_is_accessible() check in access_error() (which checks for PROT_NONE)
was replaced with a check to see if VM_READ was missing, and if so,
returns true to assert the fault was caused by a bad read.

This is incorrect, as it ignores that both VM_WRITE and VM_EXEC imply
read on powerpc, as defined in protection_map[].  This causes mappings
containing VM_WRITE or VM_EXEC without VM_READ to misreport the cause of
page faults, since the MMU is still allowing reads.

Correct this by restoring the original vma_is_accessible() check for
PROT_NONE mappings, and adding a separate check for Radix PROT_EXEC-only
mappings.

Fixes: 395cac7752b9 ("powerpc/mm: Support execute-only memory on the Radix MMU")
Reported-by: Michal Suchánek <msuchanek@suse.de>
Tested-by: Benjamin Gray <bgray@linux.ibm.com>
Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 arch/powerpc/mm/fault.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index c7ae86b04b8a..d0710ecc1fc7 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -271,11 +271,16 @@ static bool access_error(bool is_write, bool is_exec, struct vm_area_struct *vma
 	}
 
 	/*
-	 * Check for a read fault.  This could be caused by a read on an
-	 * inaccessible page (i.e. PROT_NONE), or a Radix MMU execute-only page.
+	 * VM_READ, VM_WRITE and VM_EXEC all imply read permissions, as
+	 * defined in protection_map[].  Read faults can only be caused by
+	 * a PROT_NONE mapping, or with a PROT_EXEC-only mapping on Radix.
 	 */
-	if (unlikely(!(vma->vm_flags & VM_READ)))
+	if (unlikely(!vma_is_accessible(vma)))
 		return true;
+
+	if (unlikely(radix_enabled() && ((vma->vm_flags & VM_ACCESS_FLAGS) == VM_EXEC)))
+		return true;
+
 	/*
 	 * We should ideally do the vma pkey access check here. But in the
 	 * fault path, handle_mm_fault() also does the same check. To avoid
-- 
2.39.2

