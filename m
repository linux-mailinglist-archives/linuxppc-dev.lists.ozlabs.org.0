Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C75D65FE5CC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 01:09:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MpQFG5L1jz3dw7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 10:09:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dAd3e3Am;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dAd3e3Am;
	dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpQCH4WdWz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Oct 2022 10:07:23 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id f23so3153437plr.6
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 16:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqERfta/Aatzq9GNNpWiD0dGaB1ZDa2TaERcarfftjA=;
        b=dAd3e3AmZFvbRPkHqRzy6vwY4+vG8uD7oB7uPRMYuCZ5kx55FDh0dXFAEi9Pk1aW5R
         Dg13RGInDFSeM42No9dWZvTo7m1jib6/DGMJIwsfSegduufvVdm1YjV0gWKSlE6fbGGi
         PpFLDvjNUBa3OLzE5skPnWi9SzCynJsvCB1H9ygnIYqHiN10uQZNFCAZpMt+8YnOFVWF
         pn8LHkmT6CFOlx/ksaAypTjDjrOvMNTfOz2QujdTUPZA8n0kXSW/gaQg7msYAusYFMBt
         FCr1toMLEWcs812uekMonQ6cd3Ghmy9Kl8rMLc53+A9q+d+Aycr6/kgIgQ9twx4kZOeB
         aA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YqERfta/Aatzq9GNNpWiD0dGaB1ZDa2TaERcarfftjA=;
        b=qp54B8yZ0bHW9cjily4OC7z++0m4MGRpU2LwpHQhAM/iPdTenvyFiyMuHDI++hMdfQ
         AIEvItJa0gJ2b97yh6LApUp8e+d+HEPBv0ILp8QOr1uOrwHmh5XlLSBzJET5vyfyVW5Q
         XPO84UKWy2b0RPAMDfNo0PZ/KKHE31EpOGKhjOHdmyD6m+kj667J6d1zfdiRIt6oPWCd
         qWW2WthuxZh0xNWuKPBTH1V4ohOhamgUoEaz7UIyclryCna/lwCzZA3lQU+VfLwVUu51
         aBQppdMLB39jd7bCmxlSS8oRRW2pATcBijxgf4pe1HMOGfJ1ppxnVAMOOWtQWvZ3ZWQ/
         hbOA==
X-Gm-Message-State: ACrzQf2yaTLHy4Xnw/A3L5cflf4CiicAJ5aqZ32eWvCLznu65QX5xC1M
	UJwf/DsYbUaxh0Ul+VJ4yQjNInsi2go=
X-Google-Smtp-Source: AMsMyM6CXqf+j24Hv4pCMvGc1hYcdMidcGqcHnb7TYpYladkJFCaiD3TWft5actitB6NRiAJxoGrNQ==
X-Received: by 2002:a17:90b:1c11:b0:20c:d721:8813 with SMTP id oc17-20020a17090b1c1100b0020cd7218813mr2319421pjb.244.1665702440968;
        Thu, 13 Oct 2022 16:07:20 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-62-130.tpgi.com.au. [61.68.62.130])
        by smtp.gmail.com with ESMTPSA id i18-20020a170902cf1200b001837b19ebb8sm332896plg.244.2022.10.13.16.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 16:07:20 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] powerpc/64s: make HPTE lock and native_tlbie_lock irq-safe
Date: Fri, 14 Oct 2022 09:07:09 +1000
Message-Id: <20221013230710.1987253-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221013230710.1987253-1-npiggin@gmail.com>
References: <20221013230710.1987253-1-npiggin@gmail.com>
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
Cc: Guenter Roeck <linux@roeck-us.net>, Nicholas Piggin <npiggin@gmail.com>, Nicholas Miehlbradt <nicholas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With kfence enabled, there are several cases where HPTE and TLBIE locks
are called from softirq context, for example:

  WARNING: inconsistent lock state
  6.0.0-11845-g0cbbc95b12ac #1 Tainted: G                 N
  --------------------------------
  inconsistent {IN-SOFTIRQ-W} -> {SOFTIRQ-ON-W} usage.
  swapper/0/1 [HC0[0]:SC0[0]:HE1:SE1] takes:
  c000000002734de8 (native_tlbie_lock){+.?.}-{2:2}, at: .native_hpte_updateboltedpp+0x1a4/0x600
  {IN-SOFTIRQ-W} state was registered at:
    .lock_acquire+0x20c/0x520
    ._raw_spin_lock+0x4c/0x70
    .native_hpte_invalidate+0x62c/0x840
    .hash__kernel_map_pages+0x450/0x640
    .kfence_protect+0x58/0xc0
    .kfence_guarded_free+0x374/0x5a0
    .__slab_free+0x3d0/0x630
    .put_cred_rcu+0xcc/0x120
    .rcu_core+0x3c4/0x14e0
    .__do_softirq+0x1dc/0x7dc
    .do_softirq_own_stack+0x40/0x60

Fix this by consistently disabling irqs while taking either of these
locks. Don't just disable bh because several of the more common cases
already disable irqs, so this just makes the locks always irq-safe.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_native.c | 27 ++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_native.c b/arch/powerpc/mm/book3s64/hash_native.c
index 02d0c210a1ce..065f9c542a63 100644
--- a/arch/powerpc/mm/book3s64/hash_native.c
+++ b/arch/powerpc/mm/book3s64/hash_native.c
@@ -268,8 +268,11 @@ static long native_hpte_insert(unsigned long hpte_group, unsigned long vpn,
 {
 	struct hash_pte *hptep = htab_address + hpte_group;
 	unsigned long hpte_v, hpte_r;
+	unsigned long flags;
 	int i;
 
+	local_irq_save(flags);
+
 	if (!(vflags & HPTE_V_BOLTED)) {
 		DBG_LOW("    insert(group=%lx, vpn=%016lx, pa=%016lx,"
 			" rflags=%lx, vflags=%lx, psize=%d)\n",
@@ -288,8 +291,10 @@ static long native_hpte_insert(unsigned long hpte_group, unsigned long vpn,
 		hptep++;
 	}
 
-	if (i == HPTES_PER_GROUP)
+	if (i == HPTES_PER_GROUP) {
+		local_irq_restore(flags);
 		return -1;
+	}
 
 	hpte_v = hpte_encode_v(vpn, psize, apsize, ssize) | vflags | HPTE_V_VALID;
 	hpte_r = hpte_encode_r(pa, psize, apsize) | rflags;
@@ -304,7 +309,6 @@ static long native_hpte_insert(unsigned long hpte_group, unsigned long vpn,
 		hpte_v = hpte_old_to_new_v(hpte_v);
 	}
 
-	release_hpte_lock();
 	hptep->r = cpu_to_be64(hpte_r);
 	/* Guarantee the second dword is visible before the valid bit */
 	eieio();
@@ -312,10 +316,13 @@ static long native_hpte_insert(unsigned long hpte_group, unsigned long vpn,
 	 * Now set the first dword including the valid bit
 	 * NOTE: this also unlocks the hpte
 	 */
+	release_hpte_lock();
 	hptep->v = cpu_to_be64(hpte_v);
 
 	__asm__ __volatile__ ("ptesync" : : : "memory");
 
+	local_irq_restore(flags);
+
 	return i | (!!(vflags & HPTE_V_SECONDARY) << 3);
 }
 
@@ -366,6 +373,9 @@ static long native_hpte_updatepp(unsigned long slot, unsigned long newpp,
 	struct hash_pte *hptep = htab_address + slot;
 	unsigned long hpte_v, want_v;
 	int ret = 0, local = 0;
+	unsigned long irqflags;
+
+	local_irq_save(irqflags);
 
 	want_v = hpte_encode_avpn(vpn, bpsize, ssize);
 
@@ -409,6 +419,8 @@ static long native_hpte_updatepp(unsigned long slot, unsigned long newpp,
 	if (!(flags & HPTE_NOHPTE_UPDATE))
 		tlbie(vpn, bpsize, apsize, ssize, local);
 
+	local_irq_restore(irqflags);
+
 	return ret;
 }
 
@@ -472,6 +484,9 @@ static void native_hpte_updateboltedpp(unsigned long newpp, unsigned long ea,
 	unsigned long vsid;
 	long slot;
 	struct hash_pte *hptep;
+	unsigned long flags;
+
+	local_irq_save(flags);
 
 	vsid = get_kernel_vsid(ea, ssize);
 	vpn = hpt_vpn(ea, vsid, ssize);
@@ -490,6 +505,8 @@ static void native_hpte_updateboltedpp(unsigned long newpp, unsigned long ea,
 	 * actual page size will be same.
 	 */
 	tlbie(vpn, psize, psize, ssize, 0);
+
+	local_irq_restore(flags);
 }
 
 /*
@@ -503,6 +520,9 @@ static int native_hpte_removebolted(unsigned long ea, int psize, int ssize)
 	unsigned long vsid;
 	long slot;
 	struct hash_pte *hptep;
+	unsigned long flags;
+
+	local_irq_save(flags);
 
 	vsid = get_kernel_vsid(ea, ssize);
 	vpn = hpt_vpn(ea, vsid, ssize);
@@ -520,6 +540,9 @@ static int native_hpte_removebolted(unsigned long ea, int psize, int ssize)
 
 	/* Invalidate the TLB */
 	tlbie(vpn, psize, psize, ssize, 0);
+
+	local_irq_restore(flags);
+
 	return 0;
 }
 
-- 
2.37.2

