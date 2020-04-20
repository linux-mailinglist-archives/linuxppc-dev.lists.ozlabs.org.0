Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 758BB1B00FC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 07:30:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495FfR517zzDqnv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 15:30:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=Ag7VOzN1; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495FcZ0S1TzDqXN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 15:29:17 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 495FcL6jl8z9tyFs;
 Mon, 20 Apr 2020 07:29:06 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Ag7VOzN1; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id coY7kJFwUjD2; Mon, 20 Apr 2020 07:29:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 495FcL5cffz9tyPW;
 Mon, 20 Apr 2020 07:29:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1587360546; bh=DnqzhiA+IaW5xuJfVomwFkoL8ZBx0w5rMRBGNBy6CLc=;
 h=From:Subject:To:Cc:Date:From;
 b=Ag7VOzN12Cn5ZCTJ2J+vS5DP0NZirygKuCR3A3BJTy37g6pfSDIRWUgdVLNDtyRHR
 R1ngIcN6wxwjXSWj+OBsCzYdI078JDC2TxAFQL9cX334DtOIY/vSXGZSBfbMqMDqRV
 m7nlw7rf5oAGtpeFmD+M72WGD3HzZl221HVG3XAE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A457B8B776;
 Mon, 20 Apr 2020 07:29:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0mrwI7OTJd6B; Mon, 20 Apr 2020 07:29:11 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7057B8B752;
 Mon, 20 Apr 2020 07:29:11 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 2C2596578B; Mon, 20 Apr 2020 05:29:11 +0000 (UTC)
Message-Id: <0231963e81d6e72ff725212c14f4011d2ee36a9e.1587360530.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/8xx: Fix STRICT_KERNEL_RWX startup test failure
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 20 Apr 2020 05:29:11 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

WRITE_RO lkdtm test works.

But when selecting CONFIG_DEBUG_RODATA_TEST, the kernel reports
	rodata_test: test data was not read only

This is because when rodata test runs, there are still old entries
in TLB.

Flush TLB after setting kernel pages RO or NX.

Fixes: d5f17ee96447 ("powerpc/8xx: don't disable large TLBs with CONFIG_STRICT_KERNEL_RWX")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kvm/Makefile    | 2 +-
 arch/powerpc/mm/nohash/8xx.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index 2bfeaa13befb..906707d15810 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -135,4 +135,4 @@ obj-$(CONFIG_KVM_BOOK3S_32) += kvm.o
 obj-$(CONFIG_KVM_BOOK3S_64_PR) += kvm-pr.o
 obj-$(CONFIG_KVM_BOOK3S_64_HV) += kvm-hv.o
 
-obj-y += $(kvm-book3s_64-builtin-objs-y)
+obj-$(CONFIG_KVM_BOOK3S_64) += $(kvm-book3s_64-builtin-objs-y)
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index 3189308dece4..d83a12c5bc7f 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -185,6 +185,7 @@ void mmu_mark_initmem_nx(void)
 			mmu_mapin_ram_chunk(etext8, einittext8, PAGE_KERNEL);
 		}
 	}
+	_tlbil_all();
 }
 
 #ifdef CONFIG_STRICT_KERNEL_RWX
@@ -199,6 +200,8 @@ void mmu_mark_rodata_ro(void)
 				      ~(LARGE_PAGE_SIZE_8M - 1)));
 	mmu_patch_addis(&patch__dtlbmiss_romem_top, -__pa(_sinittext));
 
+	_tlbil_all();
+
 	/* Update page tables for PTDUMP and BDI */
 	mmu_mapin_ram_chunk(0, sinittext, __pgprot(0));
 	mmu_mapin_ram_chunk(0, etext, PAGE_KERNEL_ROX);
-- 
2.25.0

