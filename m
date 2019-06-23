Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FCD4FB27
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2019 12:44:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45WpvM4TztzDqXv
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2019 20:44:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EYjrzBOR"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45WpsV6Nh1zDq9G
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jun 2019 20:42:38 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id n2so5515575pgp.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jun 2019 03:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0YXSXOgSOm3DzevuZy9Ip1Vi9FfqACZ45B2Wv5c/MAA=;
 b=EYjrzBORjZ1lNRmKwsDmSNka8SSXunz7W40w13hIVFXJIPzvyNGYiwRiV8dMQuFobO
 UMscQeSadIsMBvmnahQhouLSeZMn4TEoApAXY3xNjV9w24GkvXuf4fp8cYdDQXN0bg40
 6PR1Bxy7/FZ8g2t0itA61QAxurFFsWQEcpZKQswoAFYM4VVN7aAlFJ75KTq/NMP8mn/1
 R3QyaAShKQ3c2J/4lVYYWOTQTTbJ1zqha6E2904ubj+dRJfVh5q8POsr41qFNVDOuYqR
 qHWYujk27gBSrjbO/cFXuuFFXR0JYEMoNlU3t7+4YpQw0UDDgPWkFbW6PBzimN6e9Sx0
 bxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0YXSXOgSOm3DzevuZy9Ip1Vi9FfqACZ45B2Wv5c/MAA=;
 b=nO5Hiahocw208hMrKVs+0FH/JYg0tsMKC2M7a0vzJfpnZlCIV1gbEwpPRzmpTItqjB
 n36oo0QPLY0ffZefiQiThuV3AvHuOjAjfXLk1OtkEgqI0PhjNfFU8spr7BNE3adf2ZsR
 hsFLb/7OBKBBi8qB7AGjxhBOmrxpgARJNUljHdAThjVWRLqp1RmxTicZsMiLwCq/2JkP
 fjaDXsf1Ju3RgTg7RIgs9F5vkRZbrpJ1/eEQvgurgBseE0dC/bXSR1Cq5bPvDKby5RBu
 xLBstCkflKtDMDjRg03BUSBbElzKOfcea4z1YAiFT/IsbysHxYEYFl63gZshfpaYVn4x
 NDKg==
X-Gm-Message-State: APjAAAWcir3Wh3ZqcgaVweohdBm3rKmnP20JlS9LlZeZnDSMjfkNhcFA
 ZeKQjNMR9OJFQ+++tD+Yi+EGHOkmPwg=
X-Google-Smtp-Source: APXvYqySDsED2DGES82pmasfRXrAMrmxPlJL+8XRDgDCDLsCOn/w2CYMGMp3PGr+AQzyKqYojuPpnw==
X-Received: by 2002:a63:6156:: with SMTP id v83mr21452955pgb.358.1561286556592; 
 Sun, 23 Jun 2019 03:42:36 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([1.129.156.40])
 by smtp.gmail.com with ESMTPSA id w7sm5034824pfb.117.2019.06.23.03.42.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 23 Jun 2019 03:42:36 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/64s/radix: keep kernel ERAT over local
 process/guest invalidates
Date: Sun, 23 Jun 2019 20:41:52 +1000
Message-Id: <20190623104152.13173-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190623104152.13173-1-npiggin@gmail.com>
References: <20190623104152.13173-1-npiggin@gmail.com>
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
Cc: kvm-ppc@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ISAv3 radix modes provide SLBIA variants which can invalidate ERAT for
effPID!=0 or for effLPID!=0, which allows user and guest invalidations
to retain kernel/host ERAT entries.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/ppc-opcode.h | 8 ++++++++
 arch/powerpc/kvm/book3s_hv_builtin.c  | 6 ++++--
 arch/powerpc/mm/book3s64/radix_tlb.c  | 6 +++---
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 156102828a3b..0f67d672f719 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -588,7 +588,15 @@
 
 #define PPC_SLBIA(IH)	stringify_in_c(.long PPC_INST_SLBIA | \
 				       ((IH & 0x7) << 21))
+
+/*
+ * These may only be used by ARCH_300 (radix implies ARCH_300).
+ * USER/GUEST invalidates may only be used by radix mode (on HPT these
+ * would also invalidate various SLBEs which may not be desired).
+ */
 #define PPC_ARCH_300_INVALIDATE_ERAT	PPC_SLBIA(7)
+#define PPC_RADIX_INVALIDATE_ERAT_USER	PPC_SLBIA(3)
+#define PPC_RADIX_INVALIDATE_ERAT_GUEST	PPC_SLBIA(6)
 
 #define VCMPEQUD_RC(vrt, vra, vrb)	stringify_in_c(.long PPC_INST_VCMPEQUD | \
 			      ___PPC_RT(vrt) | ___PPC_RA(vra) | \
diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
index 960154262665..08a32c3e6153 100644
--- a/arch/powerpc/kvm/book3s_hv_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_builtin.c
@@ -820,6 +820,8 @@ static void flush_guest_tlb(struct kvm *kvm)
 				     : : "r" (rb), "i" (1), "i" (1), "i" (0),
 				       "r" (0) : "memory");
 		}
+		asm volatile("ptesync": : :"memory");
+		asm volatile(PPC_RADIX_INVALIDATE_ERAT_GUEST : : :"memory");
 	} else {
 		for (set = 0; set < kvm->arch.tlb_sets; ++set) {
 			/* R=0 PRS=0 RIC=0 */
@@ -828,9 +830,9 @@ static void flush_guest_tlb(struct kvm *kvm)
 				       "r" (0) : "memory");
 			rb += PPC_BIT(51);	/* increment set number */
 		}
+		asm volatile("ptesync": : :"memory");
+		asm volatile(PPC_ARCH_300_INVALIDATE_ERAT : : :"memory");
 	}
-	asm volatile("ptesync": : :"memory");
-	asm volatile(PPC_ARCH_300_INVALIDATE_ERAT : : :"memory");
 }
 
 void kvmppc_check_need_tlb_flush(struct kvm *kvm, int pcpu,
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 17f33b6645f9..fb880a043898 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -258,7 +258,7 @@ static inline void _tlbiel_pid(unsigned long pid, unsigned long ric)
 		__tlbiel_pid(pid, set, RIC_FLUSH_TLB);
 
 	asm volatile("ptesync": : :"memory");
-	asm volatile(PPC_ARCH_300_INVALIDATE_ERAT "; isync" : : :"memory");
+	asm volatile(PPC_RADIX_INVALIDATE_ERAT_USER "; isync" : : :"memory");
 }
 
 static inline void _tlbie_pid(unsigned long pid, unsigned long ric)
@@ -310,7 +310,7 @@ static inline void _tlbiel_lpid(unsigned long lpid, unsigned long ric)
 		__tlbiel_lpid(lpid, set, RIC_FLUSH_TLB);
 
 	asm volatile("ptesync": : :"memory");
-	asm volatile(PPC_ARCH_300_INVALIDATE_ERAT "; isync" : : :"memory");
+	asm volatile(PPC_RADIX_INVALIDATE_ERAT_GUEST "; isync" : : :"memory");
 }
 
 static inline void _tlbie_lpid(unsigned long lpid, unsigned long ric)
@@ -362,7 +362,7 @@ static inline void _tlbiel_lpid_guest(unsigned long lpid, unsigned long ric)
 		__tlbiel_lpid_guest(lpid, set, RIC_FLUSH_TLB);
 
 	asm volatile("ptesync": : :"memory");
-	asm volatile(PPC_ARCH_300_INVALIDATE_ERAT : : :"memory");
+	asm volatile(PPC_RADIX_INVALIDATE_ERAT_GUEST : : :"memory");
 }
 
 
-- 
2.20.1

