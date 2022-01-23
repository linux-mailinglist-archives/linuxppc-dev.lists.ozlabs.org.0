Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F821497165
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jan 2022 13:02:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JhWv00vWMz3cT7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jan 2022 23:02:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NAiwuVk4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=NAiwuVk4; dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JhWsh4q7Nz2yJw
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jan 2022 23:00:55 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id e16so3240904pgn.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jan 2022 04:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4AsFr8pIQoAdLLPEHzcw6dST2n5MryhLJ6gmPakJWek=;
 b=NAiwuVk4pmO5pC9E3p0DhQKP1hSZXgzerc2IN5K7DC8+CKMDC+8s2PASVuhdfcHp1P
 walnTpPE0zUnFTLcZ3yhwROjgaXjxkZIOq4k1YVu1n+gA85f9IsYIKugALtjgMU6B5hU
 eAvJAguWG6dkYcbsUpwMTiPTQHX/Tah/wUZ2V8pfCxx3NwTh5kdYR7liYe6DYQmkJElV
 LrXAQrq1PMsStYT7LPNpMqXlGAg65RgSboMxEbKhUrtzZpTfNYr7QKSZLqAzMPYUc7j+
 3pYC+tNuLz7azAxdyoeC04PM2z81abgUDeJ9VybcbTPiroGyaN4oEPzI2rP2qta8qJ74
 1LyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4AsFr8pIQoAdLLPEHzcw6dST2n5MryhLJ6gmPakJWek=;
 b=SCP/9jRCcvaAcysE7nhGUccIFIkG+i5X6MVYD1gp/27/m2dANWdr1AXALVg3Egf9GH
 bkvxcFLWKLiwygsvgUMQvoc2dfGHcZMgWrD1yOi26D5CL39ULTlwc8Wwbk8qLjai8ZKV
 6pVhv+9C+BUECv0r9suZlTYXKIWUTqb+/4nF35gePpyTMIW4XiftlmKeSMnHQRp5/PuY
 ZfJxHb/1aRy3ib3xee27x24rAC4BkfmDDXIQGqTWZ0rgA/nzffFmHxI8WUqcZ2EH1LRH
 C33pV8K4RoHuPLupT8vqEqbR1HSzNB/1BeKD0UbiHoskDcHCqlTyn6TO+YFeUuB9lGzD
 OkNQ==
X-Gm-Message-State: AOAM5328I7k3d96dFuZ7BawhMai/Wu7iObWuPuI3gZeuAxczFM7z0XgY
 JxbomgzRTS9Bcaki1/782SZ7qZ8uIf4=
X-Google-Smtp-Source: ABdhPJz8WBXejls0cruP3SdKF9lR9kbZ9gUbxivHrezgewYqPYIp1RI9UfEMmNASOW/qr8lWolx3tQ==
X-Received: by 2002:a63:7c10:: with SMTP id x16mr8644389pgc.128.1642939253738; 
 Sun, 23 Jan 2022 04:00:53 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-82-75.tpgi.com.au. [193.116.82.75])
 by smtp.gmail.com with ESMTPSA id kx11sm9608213pjb.1.2022.01.23.04.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 04:00:53 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/6] KVM: PPC: Remove kvmppc_claim_lpid
Date: Sun, 23 Jan 2022 22:00:38 +1000
Message-Id: <20220123120043.3586018-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220123120043.3586018-1-npiggin@gmail.com>
References: <20220123120043.3586018-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Removing kvmppc_claim_lpid makes the lpid allocator API a bit simpler to
change the underlying implementation in a future patch.

The host LPID is always 0, so that can be a detail of the allocator. If
the allocator range is restricted, that can reserve LPIDs at the top of
the range. This allows kvmppc_claim_lpid to be removed.
---
 arch/powerpc/include/asm/kvm_ppc.h  |  1 -
 arch/powerpc/kvm/book3s_64_mmu_hv.c | 14 ++++++--------
 arch/powerpc/kvm/e500mc.c           |  1 -
 arch/powerpc/kvm/powerpc.c          |  7 +------
 4 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index a14dbcd1b8ce..7e22199a95c9 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -863,7 +863,6 @@ int kvm_vcpu_ioctl_dirty_tlb(struct kvm_vcpu *vcpu,
 			     struct kvm_dirty_tlb *cfg);
 
 long kvmppc_alloc_lpid(void);
-void kvmppc_claim_lpid(long lpid);
 void kvmppc_free_lpid(long lpid);
 void kvmppc_init_lpid(unsigned long nr_lpids);
 
diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 213232914367..09fc52b6f390 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -256,14 +256,15 @@ void kvmppc_map_vrma(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 
 int kvmppc_mmu_hv_init(void)
 {
-	unsigned long host_lpid, rsvd_lpid;
+	unsigned long rsvd_lpid;
 
 	if (!mmu_has_feature(MMU_FTR_LOCKLESS_TLBIE))
 		return -EINVAL;
 
-	host_lpid = 0;
-	if (cpu_has_feature(CPU_FTR_HVMODE))
-		host_lpid = mfspr(SPRN_LPID);
+	if (cpu_has_feature(CPU_FTR_HVMODE)) {
+		if (WARN_ON(mfspr(SPRN_LPID) != 0))
+			return -EINVAL;
+	}
 
 	/* POWER8 and above have 12-bit LPIDs (10-bit in POWER7) */
 	if (cpu_has_feature(CPU_FTR_ARCH_207S))
@@ -271,11 +272,8 @@ int kvmppc_mmu_hv_init(void)
 	else
 		rsvd_lpid = LPID_RSVD_POWER7;
 
-	kvmppc_init_lpid(rsvd_lpid + 1);
-
-	kvmppc_claim_lpid(host_lpid);
 	/* rsvd_lpid is reserved for use in partition switching */
-	kvmppc_claim_lpid(rsvd_lpid);
+	kvmppc_init_lpid(rsvd_lpid);
 
 	return 0;
 }
diff --git a/arch/powerpc/kvm/e500mc.c b/arch/powerpc/kvm/e500mc.c
index 1c189b5aadcc..7087d8f2037a 100644
--- a/arch/powerpc/kvm/e500mc.c
+++ b/arch/powerpc/kvm/e500mc.c
@@ -398,7 +398,6 @@ static int __init kvmppc_e500mc_init(void)
 	 * allocator.
 	 */
 	kvmppc_init_lpid(KVMPPC_NR_LPIDS/threads_per_core);
-	kvmppc_claim_lpid(0); /* host */
 
 	r = kvm_init(NULL, sizeof(struct kvmppc_vcpu_e500), 0, THIS_MODULE);
 	if (r)
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 2ad0ccd202d5..102993462872 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -2472,12 +2472,6 @@ long kvmppc_alloc_lpid(void)
 }
 EXPORT_SYMBOL_GPL(kvmppc_alloc_lpid);
 
-void kvmppc_claim_lpid(long lpid)
-{
-	set_bit(lpid, lpid_inuse);
-}
-EXPORT_SYMBOL_GPL(kvmppc_claim_lpid);
-
 void kvmppc_free_lpid(long lpid)
 {
 	clear_bit(lpid, lpid_inuse);
@@ -2488,6 +2482,7 @@ void kvmppc_init_lpid(unsigned long nr_lpids_param)
 {
 	nr_lpids = min_t(unsigned long, KVMPPC_NR_LPIDS, nr_lpids_param);
 	memset(lpid_inuse, 0, sizeof(lpid_inuse));
+	set_bit(0, lpid_inuse); /* The host LPID must always be 0 */
 }
 EXPORT_SYMBOL_GPL(kvmppc_init_lpid);
 
-- 
2.23.0

