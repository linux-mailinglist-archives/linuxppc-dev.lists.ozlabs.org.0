Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0412490D94
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 18:04:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jcytc6QQpz3drs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 04:04:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s4Fk6jyb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=s4Fk6jyb; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jcymy05D5z30Jh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan 2022 03:59:30 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5DBCE611B9;
 Mon, 17 Jan 2022 16:59:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A086C36AE7;
 Mon, 17 Jan 2022 16:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642438767;
 bh=lllL1+YSQOwmnLAGhKuxtgJRcS5EeLGylTj5nvLlLTA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s4Fk6jyb3MgtM/08rN3tW2yC7pROL0MdMCP4AsYx+FkP2inGI4W9gHJg1rMFEVAaH
 br1tzFe5+xpWz7qXoP5707i2Oy8vXmONFGim7cnp2CLlg5IQzRfqWVGQU7oDHtG3SA
 iJoPHXKdA+Xc4fDKHy+2NhLXiGvRIO8sMsSDYRcOPp8k+AenjYPIQ37z7LX1/JfNVl
 2ag6bOnHhhIL2sJAQ7h56QkbD70QPqAlF8LPsPe6ZrYCTyQZhfFecZsiDwwdbicMY/
 vUkM9mS2KnQAJbQoUBobZfhv4EYMbsk3JMesRAwX7wESdjGNDK272cQEya6qiF8K8+
 u7KgO3BSFS6Zw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 14/52] KVM: PPC: Book3S: Suppress warnings when
 allocating too big memory slots
Date: Mon, 17 Jan 2022 11:58:15 -0500
Message-Id: <20220117165853.1470420-14-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117165853.1470420-1-sashal@kernel.org>
References: <20220117165853.1470420-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, farosas@linux.ibm.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>, npiggin@gmail.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alexey Kardashevskiy <aik@ozlabs.ru>

[ Upstream commit 511d25d6b789fffcb20a3eb71899cf974a31bd9d ]

The userspace can trigger "vmalloc size %lu allocation failure: exceeds
total pages" via the KVM_SET_USER_MEMORY_REGION ioctl.

This silences the warning by checking the limit before calling vzalloc()
and returns ENOMEM if failed.

This does not call underlying valloc helpers as __vmalloc_node() is only
exported when CONFIG_TEST_VMALLOC_MODULE and __vmalloc_node_range() is
not exported at all.

Spotted by syzkaller.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
[mpe: Use 'size' for the variable rather than 'cb']
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20210901084512.1658628-1-aik@ozlabs.ru
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kvm/book3s_hv.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 7b74fc0a986b8..94da0d25eb125 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4861,8 +4861,12 @@ static int kvmppc_core_prepare_memory_region_hv(struct kvm *kvm,
 	unsigned long npages = mem->memory_size >> PAGE_SHIFT;
 
 	if (change == KVM_MR_CREATE) {
-		slot->arch.rmap = vzalloc(array_size(npages,
-					  sizeof(*slot->arch.rmap)));
+		unsigned long size = array_size(npages, sizeof(*slot->arch.rmap));
+
+		if ((size >> PAGE_SHIFT) > totalram_pages())
+			return -ENOMEM;
+
+		slot->arch.rmap = vzalloc(size);
 		if (!slot->arch.rmap)
 			return -ENOMEM;
 	}
-- 
2.34.1

