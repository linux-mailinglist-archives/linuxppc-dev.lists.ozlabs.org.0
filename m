Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E8934F58A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 02:40:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F96tV1VPQz3d5R
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 11:40:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ApAL6rMF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ApAL6rMF; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F96rG48JBz3btL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 11:38:53 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F96r960LTz9sVm; Wed, 31 Mar 2021 11:38:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1617151129;
 bh=YiLp5rGPLaEKtv9V1rZ2YEEJl9wMKmUjGr24x9dznFQ=;
 h=From:To:Subject:Date:From;
 b=ApAL6rMFny9l8JpBJb24wtNKtwSOwfiGreimCx6MYzoSftjYoz2FqztCT+meGTwXA
 3nnbT13lEV3VXgL1WVPtJD3LufehpXZ7iqPv4FbUK3uK6KGxyXCQskcOrJiVOl6vgd
 u2T333BNjlvlSQ7cCtM3Oe8fXcvnLLX0nxMS4WfkEfCPAL33nVjKgZMHLK/VeSfno5
 OiVww06KfEtgOpg4979YrYoPBkauvNVA4mlqITVHD2XjcU6mB2wScs93ZmDuqGnMMB
 xfotYQUWPgVo0SXOUSCZzpLMWpexb8EVVsLWQ7RFzxUayApXMzG/eCQfh5Mwq9ONbb
 hvRAVQnqNt5PA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/6] powerpc/mm/64s: Add _PAGE_KERNEL_ROX
Date: Wed, 31 Mar 2021 11:38:40 +1100
Message-Id: <20210331003845.216246-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In the past we had a fallback definition for _PAGE_KERNEL_ROX, but we
removed that in commit d82fd29c5a8c ("powerpc/mm: Distribute platform
specific PAGE and PMD flags and definitions") and added definitions
for each MMU family.

However we missed adding a definition for 64s, which was not really a
bug because it's currently not used.

But we'd like to use PAGE_KERNEL_ROX in a future patch so add a
definition now.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 1 +
 1 file changed, 1 insertion(+)

v2: Unchanged.

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 058601efbc8a..0c89977ec10b 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -116,6 +116,7 @@
  */
 #define _PAGE_KERNEL_RW		(_PAGE_PRIVILEGED | _PAGE_RW | _PAGE_DIRTY)
 #define _PAGE_KERNEL_RO		 (_PAGE_PRIVILEGED | _PAGE_READ)
+#define _PAGE_KERNEL_ROX	 (_PAGE_PRIVILEGED | _PAGE_READ | _PAGE_EXEC)
 #define _PAGE_KERNEL_RWX	(_PAGE_PRIVILEGED | _PAGE_DIRTY |	\
 				 _PAGE_RW | _PAGE_EXEC)
 /*
-- 
2.25.1

