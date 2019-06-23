Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0401A4FB29
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2019 12:46:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45WpxK0hKwzDqKj
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2019 20:45:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pwsT0089"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45WpsV6KSVzDq7W
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jun 2019 20:42:38 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id t16so5838977pfe.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jun 2019 03:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=unNl4TIULNSGXZXwmsz7laOJjV5XAQkpofGuTVj9KnI=;
 b=pwsT008927poPGhNOwLrTYxg6Mm2+0f1g9gdupfrSlp0F4Dc4KFDwADcu19Mp7a7Qr
 Ik0K1l8N3HZuGsDvwxsUIcsBhi2bYbNu29n8ZHxtn4kwrMiohffjx8ZHjujCEFdc5c/S
 fJau2DhSyiohHm7Z/ZEKljJO/GtMz0aXY8pS0bvljdJ5DZBxaFuKpDTWCK3gg+y6FtQa
 otc5mHKZn+f7tckZ9N/h5Yynm/VKQjrhyfS6iY5a4qzOG5UCoytWd8G4fcDOGs1KMLUc
 28hoFyfYAHQYkX6QGD3CnDtBEet1Tw05SdMr04LMZ99MCvVgGnoevXo6QMnVnmNQdxKk
 91hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=unNl4TIULNSGXZXwmsz7laOJjV5XAQkpofGuTVj9KnI=;
 b=r9jkOZwKc1jcldeFsdbL3SRIFL7HJHJyuUFHc52crdrtilu62ZQFi2OeO37Jl7KJwf
 F/5fbPis2Ed8UdRzxSTs1qcTMWWq5VTaYq5ChhPN2oy2B2sHN6h+Oiq4h/bxTuJUV1k9
 ocA5QV9t85dSQ3faSa8IE1UoqwpPmzVFxsADNJt1oPuZX0cFyqksuRaFDRJ/tTYIIbt7
 nKvK0qLifLehzpCyTO5ZRu7nDTmuBangcuDpa4BGU7JfG86fZtYlPO/AmnxetL+VVahM
 SQPpn6/ppc4ovGX6Q5Tf3wsxtupmJPyQOBV6ZZTTMACSnVQIlFtwxyVXeNw5ZjWWOepS
 ZPVw==
X-Gm-Message-State: APjAAAXPGCzOkqI7jw8BAB0strGcxF14XeFMrnNbPV8w7c8Rmx9LKREx
 GpKPxJc7DVppVezc4uuSqnsFZYLXlc8=
X-Google-Smtp-Source: APXvYqxIAzEtHdWzE4+9l+W+rtoJ5ki/VCu1i2Ip7JQP7mu9qkGb62wiIwv1EZW/9RstTG4bTkayhg==
X-Received: by 2002:a17:90a:7148:: with SMTP id
 g8mr18234825pjs.51.1561286553264; 
 Sun, 23 Jun 2019 03:42:33 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([1.129.156.40])
 by smtp.gmail.com with ESMTPSA id w7sm5034824pfb.117.2019.06.23.03.42.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 23 Jun 2019 03:42:32 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/64s: Rename PPC_INVALIDATE_ERAT to
 PPC_ARCH_300_INVALIDATE_ERAT
Date: Sun, 23 Jun 2019 20:41:51 +1000
Message-Id: <20190623104152.13173-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
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

This makes it clear to the caller that it can only be used on POWER9
and later CPUs.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
I think I added a bug in machine checks at one point that I might have
been able to avoid with this name :)

 arch/powerpc/include/asm/ppc-opcode.h  | 2 +-
 arch/powerpc/kernel/mce_power.c        | 3 +--
 arch/powerpc/kvm/book3s_hv_builtin.c   | 2 +-
 arch/powerpc/mm/book3s64/hash_native.c | 2 +-
 arch/powerpc/mm/book3s64/radix_tlb.c   | 8 ++++----
 arch/powerpc/platforms/powernv/idle.c  | 2 +-
 6 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 2291daf39cd1..156102828a3b 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -588,7 +588,7 @@
 
 #define PPC_SLBIA(IH)	stringify_in_c(.long PPC_INST_SLBIA | \
 				       ((IH & 0x7) << 21))
-#define PPC_INVALIDATE_ERAT	PPC_SLBIA(7)
+#define PPC_ARCH_300_INVALIDATE_ERAT	PPC_SLBIA(7)
 
 #define VCMPEQUD_RC(vrt, vra, vrb)	stringify_in_c(.long PPC_INST_VCMPEQUD | \
 			      ___PPC_RT(vrt) | ___PPC_RA(vra) | \
diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index e39536aad30d..91e20773d8c3 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -82,8 +82,7 @@ static void flush_erat(void)
 		return;
 	}
 #endif
-	/* PPC_INVALIDATE_ERAT can only be used on ISA v3 and newer */
-	asm volatile(PPC_INVALIDATE_ERAT : : :"memory");
+	asm volatile(PPC_ARCH_300_INVALIDATE_ERAT : : :"memory");
 }
 
 #define MCE_FLUSH_SLB 1
diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
index cb05ccc8bc6a..960154262665 100644
--- a/arch/powerpc/kvm/book3s_hv_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_builtin.c
@@ -830,7 +830,7 @@ static void flush_guest_tlb(struct kvm *kvm)
 		}
 	}
 	asm volatile("ptesync": : :"memory");
-	asm volatile(PPC_INVALIDATE_ERAT : : :"memory");
+	asm volatile(PPC_ARCH_300_INVALIDATE_ERAT : : :"memory");
 }
 
 void kvmppc_check_need_tlb_flush(struct kvm *kvm, int pcpu,
diff --git a/arch/powerpc/mm/book3s64/hash_native.c b/arch/powerpc/mm/book3s64/hash_native.c
index 30d62ffe3310..55a1716926b1 100644
--- a/arch/powerpc/mm/book3s64/hash_native.c
+++ b/arch/powerpc/mm/book3s64/hash_native.c
@@ -112,7 +112,7 @@ static void tlbiel_all_isa300(unsigned int num_sets, unsigned int is)
 
 	asm volatile("ptesync": : :"memory");
 
-	asm volatile(PPC_INVALIDATE_ERAT "; isync" : : :"memory");
+	asm volatile(PPC_ARCH_300_INVALIDATE_ERAT "; isync" : : :"memory");
 }
 
 void hash__tlbiel_all(unsigned int action)
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index bb9835681315..17f33b6645f9 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -83,7 +83,7 @@ void radix__tlbiel_all(unsigned int action)
 	else
 		WARN(1, "%s called on pre-POWER9 CPU\n", __func__);
 
-	asm volatile(PPC_INVALIDATE_ERAT "; isync" : : :"memory");
+	asm volatile(PPC_ARCH_300_INVALIDATE_ERAT "; isync" : : :"memory");
 }
 
 static __always_inline void __tlbiel_pid(unsigned long pid, int set,
@@ -258,7 +258,7 @@ static inline void _tlbiel_pid(unsigned long pid, unsigned long ric)
 		__tlbiel_pid(pid, set, RIC_FLUSH_TLB);
 
 	asm volatile("ptesync": : :"memory");
-	asm volatile(PPC_INVALIDATE_ERAT "; isync" : : :"memory");
+	asm volatile(PPC_ARCH_300_INVALIDATE_ERAT "; isync" : : :"memory");
 }
 
 static inline void _tlbie_pid(unsigned long pid, unsigned long ric)
@@ -310,7 +310,7 @@ static inline void _tlbiel_lpid(unsigned long lpid, unsigned long ric)
 		__tlbiel_lpid(lpid, set, RIC_FLUSH_TLB);
 
 	asm volatile("ptesync": : :"memory");
-	asm volatile(PPC_INVALIDATE_ERAT "; isync" : : :"memory");
+	asm volatile(PPC_ARCH_300_INVALIDATE_ERAT "; isync" : : :"memory");
 }
 
 static inline void _tlbie_lpid(unsigned long lpid, unsigned long ric)
@@ -362,7 +362,7 @@ static inline void _tlbiel_lpid_guest(unsigned long lpid, unsigned long ric)
 		__tlbiel_lpid_guest(lpid, set, RIC_FLUSH_TLB);
 
 	asm volatile("ptesync": : :"memory");
-	asm volatile(PPC_INVALIDATE_ERAT : : :"memory");
+	asm volatile(PPC_ARCH_300_INVALIDATE_ERAT : : :"memory");
 }
 
 
diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 2f4479b94ac3..fea2fab6d915 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -716,7 +716,7 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
 		 * to reload MMCR0 (see mmcr0 comment above).
 		 */
 		if (!cpu_has_feature(CPU_FTR_POWER9_DD2_1)) {
-			asm volatile(PPC_INVALIDATE_ERAT);
+			asm volatile(PPC_ARCH_300_INVALIDATE_ERAT);
 			mtspr(SPRN_MMCR0, mmcr0);
 		}
 
-- 
2.20.1

