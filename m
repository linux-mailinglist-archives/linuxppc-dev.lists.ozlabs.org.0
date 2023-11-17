Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 132BF7EED06
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 09:00:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SWq7s70Fqz3dKY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 19:00:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=43.155.80.173; helo=bg5.exmail.qq.com; envelope-from=ke.zhao@shingroup.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 373 seconds by postgrey-1.37 at boromir; Fri, 17 Nov 2023 18:59:42 AEDT
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.155.80.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SWq7L5wKnz3cBQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 18:59:42 +1100 (AEDT)
X-QQ-mid: bizesmtp88t1700207542tiadw1lg
Received: from HX01040049.powercore.com.cn ( [121.8.34.183])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 17 Nov 2023 15:52:17 +0800 (CST)
X-QQ-SSF: 01400000000000409000000A0000000
X-QQ-FEAT: CR3LFp2JE4n7ku21/mYvIIQ5SpzgwTJQJy9ia+W2yMvgDWCJqk8SIZO2HV72T
	soebgUlYxDzZ8T9R1juZePVonezYoxSx2shFCXGGE4lvABuDVrnxvENMHA0Z85kQsyPRfUh
	A6j2zM5Eh9bXM/84+83SB2hOICcCjw4YO6bkvpzVnheWmOYFkPe+SeSr6QQmDShKV0Y+N9D
	a70HSwCMTXlnXYWdrX6ISl1+r87E0aRdK5QkMtPm9+wMXTLDaWg7uFiElWGSnP+ejy/Fxcx
	j5kAJsn+Jm/ywfa+4WypiyK4AAayLU+wXTb9Y/I6HCv6QokP8GUPofaNL2VlyR8KQLR2M5K
	0YcMXa8IIIWOfRe/cojHSAfgKzpOJoxCgrSWuXaWjOsDi+0J/sMYMCV9b8xR1XrilkzY4Ff
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 3930165603340763718
From: Zhao Ke <ke.zhao@shingroup.cn>
To: mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	fbarrat@linux.ibm.com,
	ajd@linux.ibm.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Subject: [PATCH] powerpc: Add PVN support for HeXin C2000 processor
Date: Fri, 17 Nov 2023 15:52:15 +0800
Message-Id: <20231117075215.647-1-ke.zhao@shingroup.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
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
Cc: Zhao Ke <ke.zhao@shingroup.cn>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

HeXin Tech Co. has applied for a new PVN from the OpenPower Community
for its new processor C2000. The OpenPower has assigned a new PVN
and this newly assigned PVN is 0x0066, add pvr register related
support for this PVN.

Signed-off-by: Zhao Ke <ke.zhao@shingroup.cn>
Link: https://discuss.openpower.foundation/t/how-to-get-a-new-pvr-for-processors-follow-power-isa/477/10
---
 arch/powerpc/include/asm/reg.h            |  1 +
 arch/powerpc/kernel/cpu_specs_book3s_64.h | 15 +++++++++++++++
 arch/powerpc/kvm/book3s_pr.c              |  1 +
 arch/powerpc/mm/book3s64/pkeys.c          |  3 ++-
 arch/powerpc/platforms/powernv/subcore.c  |  3 ++-
 drivers/misc/cxl/cxl.h                    |  3 ++-
 6 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 4ae4ab9090a2..7fd09f25452d 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -1361,6 +1361,7 @@
 #define PVR_POWER8E	0x004B
 #define PVR_POWER8NVL	0x004C
 #define PVR_POWER8	0x004D
+#define PVR_HX_C2000	0x0066
 #define PVR_POWER9	0x004E
 #define PVR_POWER10	0x0080
 #define PVR_BE		0x0070
diff --git a/arch/powerpc/kernel/cpu_specs_book3s_64.h b/arch/powerpc/kernel/cpu_specs_book3s_64.h
index c370c1b804a9..4f604934da7c 100644
--- a/arch/powerpc/kernel/cpu_specs_book3s_64.h
+++ b/arch/powerpc/kernel/cpu_specs_book3s_64.h
@@ -238,6 +238,21 @@ static struct cpu_spec cpu_specs[] __initdata = {
 		.machine_check_early	= __machine_check_early_realmode_p8,
 		.platform		= "power8",
 	},
+	{	/* 2.07-compliant processor, HeXin C2000 processor */
+		.pvr_mask		= 0xffffffff,
+		.pvr_value		= 0x00660000,
+		.cpu_name		= "POWER8 (architected)",
+		.cpu_features		= CPU_FTRS_POWER8,
+		.cpu_user_features	= COMMON_USER_POWER8,
+		.cpu_user_features2	= COMMON_USER2_POWER8,
+		.mmu_features		= MMU_FTRS_POWER8,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.cpu_setup		= __setup_cpu_power8,
+		.cpu_restore		= __restore_cpu_power8,
+		.machine_check_early	= __machine_check_early_realmode_p8,
+		.platform		= "power8",
+	},
 	{	/* 3.00-compliant processor, i.e. Power9 "architected" mode */
 		.pvr_mask		= 0xffffffff,
 		.pvr_value		= 0x0f000005,
diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index 9118242063fb..5b92619a05fd 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -604,6 +604,7 @@ static void kvmppc_set_pvr_pr(struct kvm_vcpu *vcpu, u32 pvr)
 	case PVR_POWER8:
 	case PVR_POWER8E:
 	case PVR_POWER8NVL:
+	case PVR_HX_C2000:
 	case PVR_POWER9:
 		vcpu->arch.hflags |= BOOK3S_HFLAG_MULTI_PGSIZE |
 			BOOK3S_HFLAG_NEW_TLBIE;
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index 125733962033..c38f378e1942 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -89,7 +89,8 @@ static int __init scan_pkey_feature(void)
 			unsigned long pvr = mfspr(SPRN_PVR);
 
 			if (PVR_VER(pvr) == PVR_POWER8 || PVR_VER(pvr) == PVR_POWER8E ||
-			    PVR_VER(pvr) == PVR_POWER8NVL || PVR_VER(pvr) == PVR_POWER9)
+			    PVR_VER(pvr) == PVR_POWER8NVL || PVR_VER(pvr) == PVR_POWER9 ||
+				PVR_VER(pvr) == PVR_HX_C2000)
 				pkeys_total = 32;
 		}
 	}
diff --git a/arch/powerpc/platforms/powernv/subcore.c b/arch/powerpc/platforms/powernv/subcore.c
index 191424468f10..58e7331e1e7e 100644
--- a/arch/powerpc/platforms/powernv/subcore.c
+++ b/arch/powerpc/platforms/powernv/subcore.c
@@ -425,7 +425,8 @@ static int subcore_init(void)
 
 	if (pvr_ver != PVR_POWER8 &&
 	    pvr_ver != PVR_POWER8E &&
-	    pvr_ver != PVR_POWER8NVL)
+	    pvr_ver != PVR_POWER8NVL &&
+		pvr_ver != PVR_HX_C2000)
 		return 0;
 
 	/*
diff --git a/drivers/misc/cxl/cxl.h b/drivers/misc/cxl/cxl.h
index 0562071cdd4a..9ac2991b29c7 100644
--- a/drivers/misc/cxl/cxl.h
+++ b/drivers/misc/cxl/cxl.h
@@ -836,7 +836,8 @@ static inline bool cxl_is_power8(void)
 {
 	if ((pvr_version_is(PVR_POWER8E)) ||
 	    (pvr_version_is(PVR_POWER8NVL)) ||
-	    (pvr_version_is(PVR_POWER8)))
+	    (pvr_version_is(PVR_POWER8)) ||
+		(pvr_version_is(PVR_HX_C2000)))
 		return true;
 	return false;
 }
-- 
2.34.1

