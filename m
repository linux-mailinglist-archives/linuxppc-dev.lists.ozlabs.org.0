Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E519C2E2B55
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Dec 2020 12:33:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D2PwD21hfzDqPG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Dec 2020 22:33:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D2PsL2xZWzDqMK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Dec 2020 22:31:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=maQ/VtfF; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4D2PsK1gpBz9sW4; Fri, 25 Dec 2020 22:31:17 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4D2PsJ5Vxbz9sWF; Fri, 25 Dec 2020 22:31:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1608895876;
 bh=Bza2QCTskwBGmQFwhL52iy63R4zodFdgPTlcDZdgiJQ=;
 h=From:To:Cc:Subject:Date:From;
 b=maQ/VtfF96emL2+LWZwjq4Hgu7XjY4RBJn3gTQiLqye1O9J7kuQyeJ9sndqM8zDvy
 rA+i1+FqPXypb1BWXK4YGXcS0St98Ps9oukoCWtpsN22A3daakx+GR9pwEaZKNe232
 Nks8XveZc6DVon2wOkyJHegD5ZP7X004ShPfrDh3/s+wMiiWwJl+06a3VUUJ18XK/4
 QhTtkYaLCqCkZN+ytRN/D3AxhFGhZ4zb70VIvAJ3fN2uXXhq3YjzAmTU/VJRNchMni
 MA99P+qXcGZhvT7ZUpJarnDuvtFvp44ghd+Aumju9If/Jpg+bHpXxkTIuBASM+l8fW
 h8qG8EzNQOgjg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: torvalds@linux-foundation.org
Subject: [PATCH] genirq: Fix export of irq_to_desc() for powerpc KVM
Date: Fri, 25 Dec 2020 22:30:58 +1100
Message-Id: <20201225113058.2430951-1-mpe@ellerman.id.au>
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
Cc: linuxppc-dev@ozlabs.org, tglx@linutronix.de, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 64a1b95bb9fe ("genirq: Restrict export of irq_to_desc()")
removed the export of irq_to_desc() unless powerpc KVM is being built,
because there is still a use of irq_to_desc() in modular code there.

However it used:

  #ifdef CONFIG_KVM_BOOK3S_64_HV

Which doesn't work when that symbol is =m, leading to a build failure:

  ERROR: modpost: "irq_to_desc" [arch/powerpc/kvm/kvm-hv.ko] undefined!

Fix it by checking for the definedness of the correct symbol which is
CONFIG_KVM_BOOK3S_64_HV_MODULE.

Fixes: 64a1b95bb9fe ("genirq: Restrict export of irq_to_desc()")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 kernel/irq/irqdesc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 3d0bc38a0bcf..cc1a09406c6e 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -352,7 +352,7 @@ struct irq_desc *irq_to_desc(unsigned int irq)
 {
 	return radix_tree_lookup(&irq_desc_tree, irq);
 }
-#ifdef CONFIG_KVM_BOOK3S_64_HV
+#ifdef CONFIG_KVM_BOOK3S_64_HV_MODULE
 EXPORT_SYMBOL_GPL(irq_to_desc);
 #endif
 
-- 
2.25.1

