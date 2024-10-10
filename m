Return-Path: <linuxppc-dev+bounces-1928-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B38997E2D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 09:02:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPLKb2c3pz3bn4;
	Thu, 10 Oct 2024 18:02:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728543731;
	cv=none; b=WkI6AaLoK/AhK3AcoMJWLkEDFW1e+wNsBWabTAGT1TFWxY7qFSWcvm+6qFc+BGrJH4mgluWh0FHHrKob9JZ7CRONQ/H3NDGP9KRfm+OngmLf2hdit0aP0uNzf/cKix5qYu1yXLWcdFzSL3YntpjL6cUd6323GD5AG8dP2/j8gFyghkvnV3aq8MD9EzxAOmo6gPf/fc2nP5B0CIuKEvdyxiDoudNhySE1/nv8PaJmzkzOR0nbVOezPhi07haE2kfbcPDYceS5a6UI6IUfpFWMNe2CIcTqpl/nN6ozu2qXMgGfvdBF9H0isgFCLLz4k8gRcHXj7zBYRUQiwUe0PP6NIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728543731; c=relaxed/relaxed;
	bh=WS9OFTNL6i5YPI6zM6XYGS4xer7v+jCfFqdEDEdD+PA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jtwiqe26c9sd2h9RCIjOiU0rtRcna7wMnaaONHMrQAH807mFBSud9lLTs4JHE45NNMZxTS535t8Bpb5ElujTFO2vCYZzOF7qbwq7o2U6hXF/CyLiHqyqk5cbP9183nj0d705lJTrD13zyRjLSYdk36qOOQMBniKJcKpIbPOC7nRFe68Sh0TSK1VLQzQ/Sh5AB4rPyxFnxxOELgP5fpeB2uFapkj+ssmifQtBDu3+TvWAITo2mIcwmA8ojFmN/lkrYpReATH5JgrCITfhW5kF9VJ6emN3ihg+4k9bHYnuFItA+36ODQ+KEyyYnMIh/1fVa//7xCLeVqJJ2kwZt4V2vg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2CGf23BN; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Z9xjFebF; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2CGf23BN;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Z9xjFebF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPLKX4Lqqz3bnD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 18:02:08 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WS9OFTNL6i5YPI6zM6XYGS4xer7v+jCfFqdEDEdD+PA=;
	b=2CGf23BNvNFJdIFtfq3Jk7/bwzZ4aXhFvROegxY4fJJB36JDgsE18kNRaEijAmAMiiCxmK
	eQvvxWbFtcAoiF2W79lRCOWS/6gFWvYTdFK7/B0zM2FdBe5sgcB/LiFcVKtqv1I+2KLRSq
	YU1Ol9Ym5KOHu2KpT6LMJaMD9tJdboqeJHHFuwcaD05pduHfSev2O7lZlopnOy1U1jBMv4
	F2vi0iTsyxYCmyYIyfSE0RLDcxovPSRlv3LYTm4WQVa7BZWlJhKFw8fuEos0QCLIKVVSep
	40MQvIMSD8f9DRglCCxM8/fF3GBXnDFMeJVVaXUCDPe6/PrdMhyArPYYDfwL/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WS9OFTNL6i5YPI6zM6XYGS4xer7v+jCfFqdEDEdD+PA=;
	b=Z9xjFebFq2wfzwBV8oNyZ7m9J6Vsv2tFDo5RIG12I9R0zXEV+CJoDgq3VmUVNZQN+ywIKU
	ybEirSZPnsr9N7Aw==
Date: Thu, 10 Oct 2024 09:01:07 +0200
Subject: [PATCH 05/28] arm64: vdso: Use only one single vvar mapping
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vdso-generic-base-v1-5-b64f0842d512@linutronix.de>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
In-Reply-To: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
To: Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=4025;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=McuT3PV1z+ecfTcY5HznjYmkDmDvB3DrnPQkMu1bvMM=;
 b=lZJKERtZbQL8jCMjE0FDHFg02zHvm1+oaQxV6iWrFxmfZKjIyt33vLy/dsbu8/SUCokzNZyxf
 rg00Lj1uac8CKkC68fjs8SBGsbKJKyxu8DOV7hWm7we2hjW88ahCdmi
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The vvar mapping is the same for all processes. Use a single mapping to
simplify the logic and align it with the other architectures.

In addition this will enable the move of the vvar handling into generic code.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm64/kernel/vdso.c | 43 +++++++++++++------------------------------
 1 file changed, 13 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
index 706c9c3a7a50a4574e77da296e9c83e1e2a9f5ab..2d7f8502953bbcf5c9d32f970d92fed71894b5a9 100644
--- a/arch/arm64/kernel/vdso.c
+++ b/arch/arm64/kernel/vdso.c
@@ -39,8 +39,6 @@ struct vdso_abi_info {
 	const char *vdso_code_start;
 	const char *vdso_code_end;
 	unsigned long vdso_pages;
-	/* Data Mapping */
-	struct vm_special_mapping *dm;
 	/* Code Mapping */
 	struct vm_special_mapping *cm;
 };
@@ -113,6 +111,8 @@ struct vdso_data *arch_get_vdso_data(void *vvar_page)
 	return (struct vdso_data *)(vvar_page);
 }
 
+static const struct vm_special_mapping vvar_map;
+
 /*
  * The vvar mapping contains data for a specific time namespace, so when a task
  * changes namespace we must unmap its vvar data for the old namespace.
@@ -129,12 +129,8 @@ int vdso_join_timens(struct task_struct *task, struct time_namespace *ns)
 	mmap_read_lock(mm);
 
 	for_each_vma(vmi, vma) {
-		if (vma_is_special_mapping(vma, vdso_info[VDSO_ABI_AA64].dm))
-			zap_vma_pages(vma);
-#ifdef CONFIG_COMPAT_VDSO
-		if (vma_is_special_mapping(vma, vdso_info[VDSO_ABI_AA32].dm))
+		if (vma_is_special_mapping(vma, &vvar_map))
 			zap_vma_pages(vma);
-#endif
 	}
 
 	mmap_read_unlock(mm);
@@ -176,6 +172,11 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 	return vmf_insert_pfn(vma, vmf->address, pfn);
 }
 
+static const struct vm_special_mapping vvar_map = {
+	.name   = "[vvar]",
+	.fault = vvar_fault,
+};
+
 static int __setup_additional_pages(enum vdso_abi abi,
 				    struct mm_struct *mm,
 				    struct linux_binprm *bprm,
@@ -199,7 +200,7 @@ static int __setup_additional_pages(enum vdso_abi abi,
 
 	ret = _install_special_mapping(mm, vdso_base, VVAR_NR_PAGES * PAGE_SIZE,
 				       VM_READ|VM_MAYREAD|VM_PFNMAP,
-				       vdso_info[abi].dm);
+				       &vvar_map);
 	if (IS_ERR(ret))
 		goto up_fail;
 
@@ -229,7 +230,6 @@ static int __setup_additional_pages(enum vdso_abi abi,
 enum aarch32_map {
 	AA32_MAP_VECTORS, /* kuser helpers */
 	AA32_MAP_SIGPAGE,
-	AA32_MAP_VVAR,
 	AA32_MAP_VDSO,
 };
 
@@ -254,10 +254,6 @@ static struct vm_special_mapping aarch32_vdso_maps[] = {
 		.pages	= &aarch32_sig_page,
 		.mremap	= aarch32_sigpage_mremap,
 	},
-	[AA32_MAP_VVAR] = {
-		.name = "[vvar]",
-		.fault = vvar_fault,
-	},
 	[AA32_MAP_VDSO] = {
 		.name = "[vdso]",
 		.mremap = vdso_mremap,
@@ -307,7 +303,6 @@ static int __init __aarch32_alloc_vdso_pages(void)
 	if (!IS_ENABLED(CONFIG_COMPAT_VDSO))
 		return 0;
 
-	vdso_info[VDSO_ABI_AA32].dm = &aarch32_vdso_maps[AA32_MAP_VVAR];
 	vdso_info[VDSO_ABI_AA32].cm = &aarch32_vdso_maps[AA32_MAP_VDSO];
 
 	return __vdso_init(VDSO_ABI_AA32);
@@ -402,26 +397,14 @@ int aarch32_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 }
 #endif /* CONFIG_COMPAT */
 
-enum aarch64_map {
-	AA64_MAP_VVAR,
-	AA64_MAP_VDSO,
-};
-
-static struct vm_special_mapping aarch64_vdso_maps[] __ro_after_init = {
-	[AA64_MAP_VVAR] = {
-		.name	= "[vvar]",
-		.fault = vvar_fault,
-	},
-	[AA64_MAP_VDSO] = {
-		.name	= "[vdso]",
-		.mremap = vdso_mremap,
-	},
+static struct vm_special_mapping aarch64_vdso_map __ro_after_init = {
+	.name	= "[vdso]",
+	.mremap = vdso_mremap,
 };
 
 static int __init vdso_init(void)
 {
-	vdso_info[VDSO_ABI_AA64].dm = &aarch64_vdso_maps[AA64_MAP_VVAR];
-	vdso_info[VDSO_ABI_AA64].cm = &aarch64_vdso_maps[AA64_MAP_VDSO];
+	vdso_info[VDSO_ABI_AA64].cm = &aarch64_vdso_map;
 
 	return __vdso_init(VDSO_ABI_AA64);
 }

-- 
2.47.0


