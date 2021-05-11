Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FDC37A535
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 12:55:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfZZz2Ylgz3bs5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 20:55:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IzYRfA1r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=IzYRfA1r; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfZZV3C7xz2xMw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 20:55:14 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FfZZN4p2zz9t14; Tue, 11 May 2021 20:55:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1620730508;
 bh=B4zCMGOZBSo431ZwaVwZwLRLvWTkJgniLzw1qREC68g=;
 h=From:To:Cc:Subject:Date:From;
 b=IzYRfA1rL29TjC83Jdh94WPZjuw8ebS11J/kDt3f/CIMk1LS+yB8JZ9QnHBFHNh43
 rwaoq6Cbd369Cm4dxelycd/+AtWDp+v5P5UT4kOsLQ6bfYaf35mjB1IA+ki3+HxpVB
 hZN2/+aKdz/iN8zaRvoIopxRRplqJ9VISAYn0oqlD5mSSWmVvZyh12aAeWFXS4eT49
 F70lzjLVdvsLe7vBjpUC1YCus4FSkoi0P42bAEFN59KxQjtHqjhEcUFxdJpTnJSQz0
 F5skh3PDiZQhQ74ETQpOpsdN98Dk54EgL9MQAUL0Y95YXaW4cBFrCxBUMiOO3eVxUK
 pL3MD/9f4VA+A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] KVM: PPC: Book3S HV: Fix kvm_unmap_gfn_range_hv() for Hash MMU
Date: Tue, 11 May 2021 20:54:59 +1000
Message-Id: <20210511105459.800788-1-mpe@ellerman.id.au>
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
Cc: kvm-ppc@vger.kernel.org, seanjc@google.com, kvm@vger.kernel.org,
 npiggin@gmail.com, pbonzini@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 32b48bf8514c ("KVM: PPC: Book3S HV: Fix conversion to gfn-based
MMU notifier callbacks") fixed kvm_unmap_gfn_range_hv() by adding a for
loop over each gfn in the range.

But for the Hash MMU it repeatedly calls kvm_unmap_rmapp() with the
first gfn of the range, rather than iterating through the range.

This exhibits as strange guest behaviour, sometimes crashing in firmare,
or booting and then guest userspace crashing unexpectedly.

Fix it by passing the iterator, gfn, to kvm_unmap_rmapp().

Fixes: 32b48bf8514c ("KVM: PPC: Book3S HV: Fix conversion to gfn-based MMU notifier callbacks")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kvm/book3s_64_mmu_hv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

I plan to take this via the powerpc fixes branch.

diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 2d9193cd73be..c63e263312a4 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -840,7 +840,7 @@ bool kvm_unmap_gfn_range_hv(struct kvm *kvm, struct kvm_gfn_range *range)
 			kvm_unmap_radix(kvm, range->slot, gfn);
 	} else {
 		for (gfn = range->start; gfn < range->end; gfn++)
-			kvm_unmap_rmapp(kvm, range->slot, range->start);
+			kvm_unmap_rmapp(kvm, range->slot, gfn);
 	}
 
 	return false;
-- 
2.25.1

