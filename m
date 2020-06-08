Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3601F18E2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jun 2020 14:38:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gXq170RSzDqSt
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jun 2020 22:38:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.43.93; helo=6.mo173.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 2335 seconds by postgrey-1.36 at bilbo;
 Mon, 08 Jun 2020 22:36:28 AEST
Received: from 6.mo173.mail-out.ovh.net (6.mo173.mail-out.ovh.net
 [46.105.43.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gXmr4QCzzDqGn
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jun 2020 22:36:26 +1000 (AEST)
Received: from player699.ha.ovh.net (unknown [10.110.208.168])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 73B8F141E06
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jun 2020 13:57:26 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player699.ha.ovh.net (Postfix) with ESMTPSA id E1AEA131F7A48;
 Mon,  8 Jun 2020 11:57:18 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0039a28aace-0423-48ac-9d27-88d758f13fba,B6B0473EF73D0859AD85419D5DB97E88249038E4)
 smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] KVM: PPC: Book3S HV: increase KVMPPC_NR_LPIDS on POWER8 and
 POWER9
Date: Mon,  8 Jun 2020 13:57:14 +0200
Message-Id: <20200608115714.1139735-1-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 2856689540546005937
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudehuddggeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeikeekleffteegleevveejheetuddviedvleejvedvueevtdfgieduieeviedugfenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheileelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 kvm-ppc@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

POWER8 and POWER9 have 12-bit LPIDs. Change LPID_RSVD to support up to
(4096 - 2) guests on these processors. POWER7 is kept the same with a
limitation of (1024 - 2), but it might be time to drop KVM support for
POWER7.

Tested with 2048 guests * 4 vCPUs on a witherspoon system with 512G
RAM and a bit of swap.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/include/asm/reg.h      | 3 ++-
 arch/powerpc/kvm/book3s_64_mmu_hv.c | 8 ++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 88e6c78100d9..b70bbfb0ea3c 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -473,7 +473,8 @@
 #ifndef SPRN_LPID
 #define SPRN_LPID	0x13F	/* Logical Partition Identifier */
 #endif
-#define   LPID_RSVD	0x3ff		/* Reserved LPID for partn switching */
+#define   LPID_RSVD_POWER7	0x3ff	/* Reserved LPID for partn switching */
+#define   LPID_RSVD		0xfff	/* Reserved LPID for partn switching */
 #define	SPRN_HMER	0x150	/* Hypervisor maintenance exception reg */
 #define   HMER_DEBUG_TRIG	(1ul << (63 - 17)) /* Debug trigger */
 #define	SPRN_HMEER	0x151	/* Hyp maintenance exception enable reg */
diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 18aed9775a3c..23035ab2ec50 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -260,11 +260,15 @@ int kvmppc_mmu_hv_init(void)
 	if (!mmu_has_feature(MMU_FTR_LOCKLESS_TLBIE))
 		return -EINVAL;
 
-	/* POWER7 has 10-bit LPIDs (12-bit in POWER8) */
 	host_lpid = 0;
 	if (cpu_has_feature(CPU_FTR_HVMODE))
 		host_lpid = mfspr(SPRN_LPID);
-	rsvd_lpid = LPID_RSVD;
+
+	/* POWER8 and above have 12-bit LPIDs (10-bit in POWER7) */
+	if (cpu_has_feature(CPU_FTR_ARCH_207S))
+		rsvd_lpid = LPID_RSVD;
+	else
+		rsvd_lpid = LPID_RSVD_POWER7;
 
 	kvmppc_init_lpid(rsvd_lpid + 1);
 
-- 
2.25.4

