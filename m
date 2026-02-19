Return-Path: <linuxppc-dev+bounces-16944-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEpDJVa5lmmNkwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16944-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 08:18:46 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2A815C9BC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 08:18:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fGl9F3g8vz30GV;
	Thu, 19 Feb 2026 18:18:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.254.224.33
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771483408;
	cv=none; b=E78uKANJYVdf0dpaYsqQrMBtCBviHcRisxCgiNa4r08xzTnu3I3RFCt6bz6+IxHezkpURTt5MSIbZWZbdhMtmxJtsj3NFOZN4G8e8rLzt13ioJOBQZAyk9Wc6Qk9LD3wEbb7A64csDEqexH5ooFK1Kry1VPgGfO8WroF7I3nVxrYE/OsAAnoWDgAI8BqB4yriTYCcT3sQF9c1FAVrI8CZNNrRpqj7/K5u1qx/ui7wLZNPmqVB9rACk2eCtoG+VXSPHH2vFUdSonEWvrRINZpj2+pgbbRNh982B8IOckWCuMpZ7NXtw3p7sM8lE1LBb1owJ8M5Tm+MQjTNfrZpaLu9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771483408; c=relaxed/relaxed;
	bh=aloF7MkDLud0BSRnjOsxj2IOpjpppNDUaB9hMm+IoPs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=XNWilxTOBwq3c5wxBYBJtAsMKwqLhnGAOaDFMKtGonSOI5MeSqQLvvajfzjOBUQZD285jSdJU9NJ3S97ZInx6tphcbfmQ2Q8p5B6mAzO3LW0sMCeaWnR2klSL6QNarC6KS8G8xxI7KF7S5HWPtu6U3uSpWsExWswFmmxQl6zyL0DSFDZ+FoymL6TLJll0L0MSiaSwlL0aYxAOdD60GIOASZLSsGiaLthvK2jltix+98cryS7jD17y+kqT4TEeZZOsy1IOGVojfPVgaVBBcxaNQMEwI48pIg6fkiKwt5HDaHTo6mwHsgkxScrY0gV/ChJLkNnb003icd8QmgqAZn6Kw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com; dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=qWXPew85; dkim-atps=neutral; spf=pass (client-ip=203.254.224.33; helo=mailout3.samsung.com; envelope-from=sgsu.park@samsung.com; receiver=lists.ozlabs.org) smtp.mailfrom=samsung.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=qWXPew85;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=203.254.224.33; helo=mailout3.samsung.com; envelope-from=sgsu.park@samsung.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 479 seconds by postgrey-1.37 at boromir; Thu, 19 Feb 2026 17:43:26 AEDT
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fGkNZ0Z32z2xlM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Feb 2026 17:43:23 +1100 (AEDT)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260219063515epoutp03fc09ab2803c9c3b65fab1b7f8f139ab6~VklNdGOOD2816628166epoutp03U
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Feb 2026 06:35:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260219063515epoutp03fc09ab2803c9c3b65fab1b7f8f139ab6~VklNdGOOD2816628166epoutp03U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1771482915;
	bh=aloF7MkDLud0BSRnjOsxj2IOpjpppNDUaB9hMm+IoPs=;
	h=From:To:Cc:Subject:Date:References:From;
	b=qWXPew85r6IG5W3gx73mRYzHEDp0D+8g86aZEz2fBRX6ccurudJZ9C5ZRjXr4IkJ5
	 YcVHyb7QyUjFXxk38WM4NxDzenGsJSfFP1TUOWiXbnbDK/5jUZO+4pvME1MBc3zOtx
	 1jyEhPfI1puzw8V9nSXMy8pFYQmNQG5IBUinqtCU=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTPS id
	20260219063514epcas1p19a13513456955c828a2a6ebc020ae3e8~VklNByP640223502235epcas1p11;
	Thu, 19 Feb 2026 06:35:14 +0000 (GMT)
Received: from epcas1p3.samsung.com (unknown [182.195.38.190]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4fGkC62Vv0z3hhTN; Thu, 19 Feb
	2026 06:35:14 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260219063513epcas1p15c63c2cdc21afdc58de9e5dd5e741833~VklMFQLR90223502235epcas1p1u;
	Thu, 19 Feb 2026 06:35:13 +0000 (GMT)
Received: from U22PB1-0412.tn.corp.samsungelectronics.net (unknown
	[10.91.134.171]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260219063513epsmtip2e76aff6f7aa8ad043e142729f46cb468~VklMAPEV01618616186epsmtip2K;
	Thu, 19 Feb 2026 06:35:13 +0000 (GMT)
From: Seongsu Park <sgsu.park@samsung.com>
To: catalin.marinas@arm.com, will@kernel.org, maddy@linux.ibm.com,
	mpe@ellerman.id.au, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, akpm@linux-foundation.org,
	Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, Seongsu Park
	<sgsu.park@samsung.com>
Subject: [PATCH] mm/pkeys: Remove unused tsk parameter from
 arch_set_user_pkey_access()
Date: Thu, 19 Feb 2026 15:35:06 +0900
Message-Id: <20260219063506.545148-1-sgsu.park@samsung.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260219063513epcas1p15c63c2cdc21afdc58de9e5dd5e741833
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
cpgsPolicy: CPGSC10-711,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260219063513epcas1p15c63c2cdc21afdc58de9e5dd5e741833
References: <CGME20260219063513epcas1p15c63c2cdc21afdc58de9e5dd5e741833@epcas1p1.samsung.com>
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16944-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[sgsu.park@samsung.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:will@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:tglx@linutronix.de,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:akpm@linux-foundation.org,m:Liam.Howlett@oracle.com,m:lorenzo.stoakes@oracle.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-mm@kvack.org,m:sgsu.park@samsung.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:mid,samsung.com:dkim,samsung.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[sgsu.park@samsung.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CA2A815C9BC
X-Rspamd-Action: no action

The tsk parameter in arch_set_user_pkey_access() is never used
in the function implementations across all architectures (arm64,
powerpc, x86).

Signed-off-by: Seongsu Park <sgsu.park@samsung.com>
---
 arch/arm64/include/asm/pkeys.h   | 3 +--
 arch/arm64/mm/mmu.c              | 2 +-
 arch/powerpc/include/asm/pkeys.h | 8 +++-----
 arch/powerpc/mm/book3s64/pkeys.c | 3 +--
 arch/x86/include/asm/pkeys.h     | 3 +--
 arch/x86/kernel/fpu/xstate.c     | 3 +--
 arch/x86/mm/pkeys.c              | 3 +--
 mm/mprotect.c                    | 2 +-
 8 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/include/asm/pkeys.h b/arch/arm64/include/asm/pkeys.h
index 0ca5f83ce148..cd286d3a9c94 100644
--- a/arch/arm64/include/asm/pkeys.h
+++ b/arch/arm64/include/asm/pkeys.h
@@ -12,8 +12,7 @@
 
 #define arch_max_pkey() 8
 
-int arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
-		unsigned long init_val);
+int arch_set_user_pkey_access(int pkey, unsigned long init_val);
 
 static inline bool arch_pkeys_enabled(void)
 {
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 9ae7ce00a7ef..3fc8566708ea 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -2207,7 +2207,7 @@ void __cpu_replace_ttbr1(pgd_t *pgdp, bool cnp)
 }
 
 #ifdef CONFIG_ARCH_HAS_PKEYS
-int arch_set_user_pkey_access(struct task_struct *tsk, int pkey, unsigned long init_val)
+int arch_set_user_pkey_access(int pkey, unsigned long init_val)
 {
 	u64 new_por;
 	u64 old_por;
diff --git a/arch/powerpc/include/asm/pkeys.h b/arch/powerpc/include/asm/pkeys.h
index 28e752138996..bd20d4106471 100644
--- a/arch/powerpc/include/asm/pkeys.h
+++ b/arch/powerpc/include/asm/pkeys.h
@@ -143,10 +143,8 @@ static inline int arch_override_mprotect_pkey(struct vm_area_struct *vma,
 	return __arch_override_mprotect_pkey(vma, prot, pkey);
 }
 
-extern int __arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
-				       unsigned long init_val);
-static inline int arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
-					    unsigned long init_val)
+extern int __arch_set_user_pkey_access(int pkey, unsigned long init_val);
+static inline int arch_set_user_pkey_access(int pkey, unsigned long init_val)
 {
 	if (!mmu_has_feature(MMU_FTR_PKEY))
 		return -EINVAL;
@@ -160,7 +158,7 @@ static inline int arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
 	if (pkey == 0)
 		return init_val ? -EINVAL : 0;
 
-	return __arch_set_user_pkey_access(tsk, pkey, init_val);
+	return __arch_set_user_pkey_access(pkey, init_val);
 }
 
 static inline bool arch_pkeys_enabled(void)
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index a974baf8f327..2002331b05ba 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -335,8 +335,7 @@ static inline void init_iamr(int pkey, u8 init_bits)
  * Set the access rights in AMR IAMR and UAMOR registers for @pkey to that
  * specified in @init_val.
  */
-int __arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
-				unsigned long init_val)
+int __arch_set_user_pkey_access(int pkey, unsigned long init_val)
 {
 	u64 new_amr_bits = 0x0ul;
 	u64 new_iamr_bits = 0x0ul;
diff --git a/arch/x86/include/asm/pkeys.h b/arch/x86/include/asm/pkeys.h
index 2e6c04d8a45b..06ed2cd2592e 100644
--- a/arch/x86/include/asm/pkeys.h
+++ b/arch/x86/include/asm/pkeys.h
@@ -9,8 +9,7 @@
  */
 #define arch_max_pkey() (cpu_feature_enabled(X86_FEATURE_OSPKE) ? 16 : 1)
 
-extern int arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
-		unsigned long init_val);
+extern int arch_set_user_pkey_access(int pkey, unsigned long init_val);
 
 static inline bool arch_pkeys_enabled(void)
 {
diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index 48113c5193aa..0caf91a7e062 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -1080,8 +1080,7 @@ void __user *get_xsave_addr_user(struct xregs_state __user *xsave, int xfeature_
  * This will go out and modify PKRU register to set the access
  * rights for @pkey to @init_val.
  */
-int arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
-			      unsigned long init_val)
+int arch_set_user_pkey_access(int pkey, unsigned long init_val)
 {
 	u32 old_pkru, new_pkru_bits = 0;
 	int pkey_shift;
diff --git a/arch/x86/mm/pkeys.c b/arch/x86/mm/pkeys.c
index 7418c367e328..1dfcfaf77e23 100644
--- a/arch/x86/mm/pkeys.c
+++ b/arch/x86/mm/pkeys.c
@@ -42,8 +42,7 @@ int __execute_only_pkey(struct mm_struct *mm)
 	 * Set up PKRU so that it denies access for everything
 	 * other than execution.
 	 */
-	ret = arch_set_user_pkey_access(current, execute_only_pkey,
-			PKEY_DISABLE_ACCESS);
+	ret = arch_set_user_pkey_access(execute_only_pkey, PKEY_DISABLE_ACCESS);
 	/*
 	 * If the PKRU-set operation failed somehow, just return
 	 * 0 and effectively disable execute-only support.
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 283889e4f1ce..fea7d56f55e3 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -978,7 +978,7 @@ SYSCALL_DEFINE2(pkey_alloc, unsigned long, flags, unsigned long, init_val)
 	if (pkey == -1)
 		goto out;
 
-	ret = arch_set_user_pkey_access(current, pkey, init_val);
+	ret = arch_set_user_pkey_access(pkey, init_val);
 	if (ret) {
 		mm_pkey_free(current->mm, pkey);
 		goto out;
-- 
2.34.1


