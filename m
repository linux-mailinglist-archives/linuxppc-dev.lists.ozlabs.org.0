Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B8C2F3692
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 18:07:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFcSq1zYGzDr7C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 04:07:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=tb0Nw+JZ; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=0NjtFpZU; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFcQ14cKjzDr6W
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 04:04:54 +1100 (AEDT)
Message-Id: <20210112170411.056306194@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1610471090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=ILrs8j28FO3zCfEleUzqqCm1xJVBHSVkYVI9ahwbtj0=;
 b=tb0Nw+JZctFWFFRaYBghqD30vzGGQq0xZ63WD+mafLo/BbBc9IVaP8WGFGYad7u0ml8URq
 MM2KCJ99mn7EnO4DDfE2431luacWhtmKhXlaq0vtVViKN9hEh6EqQ6EEGU1SK7iKJAUtxF
 6cJfw7YGjQG3uDHarORNdNFeFkG42Auy8GxlmR5r9OuJYWsGvaOydpAsjyjFZ59dpikzAv
 adffa4Gr/O9qBds6RcF/6iPj7bXa8GgnMSOwrc+bWGTmrrgvpFlNTXznqRZ9EOcVSkGNWZ
 Xz+9vdXq1tYzgleIhIkKw6cAVNztEHnyNgmtfDgIc3HK5dEei5vepwA9ri3nAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1610471090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=ILrs8j28FO3zCfEleUzqqCm1xJVBHSVkYVI9ahwbtj0=;
 b=0NjtFpZUXugW2G2xT1Np0nXncnyBC7n1Akw+1YIn8I0EsqwCJze0+mqAfufkzOFyuLZc+S
 +KihGneOryXKSwBA==
Date: Tue, 12 Jan 2021 18:01:38 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 2/4] mm/highmem: Prepare for overriding set_pte_at()
References: <20210112170136.078559026@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Andreas Larsson <andreas@gaisler.com>, Peter Zijlstra <peterz@infradead.org>,
 Paul Cercueil <paul@crapouillou.net>, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The generic kmap_local() map function uses set_pte_at(), but MIPS requires
set_pte() and PowerPC wants __set_pte_at().

Provide arch_kmap_local_set_pte() and default it to set_pte_at().

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 mm/highmem.c |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

--- a/mm/highmem.c
+++ b/mm/highmem.c
@@ -473,6 +473,11 @@ static inline void *arch_kmap_local_high
 }
 #endif
 
+#ifndef arch_kmap_local_set_pte
+#define arch_kmap_local_set_pte(mm, vaddr, ptep, ptev)	\
+	set_pte_at(mm, vaddr, ptep, ptev)
+#endif
+
 /* Unmap a local mapping which was obtained by kmap_high_get() */
 static inline bool kmap_high_unmap_local(unsigned long vaddr)
 {
@@ -515,7 +520,7 @@ void *__kmap_local_pfn_prot(unsigned lon
 	vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
 	BUG_ON(!pte_none(*(kmap_pte - idx)));
 	pteval = pfn_pte(pfn, prot);
-	set_pte_at(&init_mm, vaddr, kmap_pte - idx, pteval);
+	arch_kmap_local_set_pte(&init_mm, vaddr, kmap_pte - idx, pteval);
 	arch_kmap_local_post_map(vaddr, pteval);
 	current->kmap_ctrl.pteval[kmap_local_idx()] = pteval;
 	preempt_enable();

