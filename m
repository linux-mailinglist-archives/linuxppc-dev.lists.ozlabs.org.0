Return-Path: <linuxppc-dev+bounces-1940-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE0C997E59
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 09:04:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPLKk3VZyz3bvX;
	Thu, 10 Oct 2024 18:02:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728543738;
	cv=none; b=VXNSnuEzrTCNHhGBiYVfd4xxVjinSAqVH42F0QCqpMo5fnVQapxuh1o+iMARxKDnQZ8/hW6UgsB0PwilWujKqD70IyuX0g9ooepBsr91r7oJqYkQ9bSnb7CYUGFF13zbUs4eGLwxEx8WVfhkbfdV75SX+tpzvRfPk/7WGug9QkJveJHopXWDT4NJc+WWDys7fVB3DrfJ6+u/cLrG9btVT/A5nTlJaU3vuWBEmUQH9/JOjb1p+bIZmjcmsF8phVAk4SFAccJDQ3LAG3D81Z6pFF6zN1OXY1ENIviC2/16qlMH/YdEh8CJ2CnQoaMq0J2Ww4UVpTb5+qF9sv4QTP+Mag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728543738; c=relaxed/relaxed;
	bh=qWpGJ7o3KR18vyRXXjR3vGxmLkWj8u/b/KDyTEtJJbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a7aCgnN/76Pa9KeOPFHGqBqtmKLOK2uKmIYGHRO+MZBOPcJEZntx+9rYViuNtsYaeYz36FSA00IoGKyOxD6XhMren0QHSVOCC3gnrFXp4MUcoX0x0sSNUpXY/4OxQAkHxtbGwcxYkR/PPQkYbpA9yxtriopa6CzmJbCdrPmMYZgQ/iqzwAbb1ECIGoD7DFJevRzsF6tQnkIZ411VHkonmiMCkLKKR7zvu6Oy0UKe29ZvhzIHDVvr9A1U95Xqq1JeJfBRFG4x4S95FCCZFkuiidC6Qe/yBEzrB7IbIPFAbGLeQBz1PHAZCAWUS5AwhEcZd9NSkRyI/ujmsyWruXsDfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=dfHNwzfZ; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=5fz5F7pM; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=dfHNwzfZ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=5fz5F7pM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPLKj3dpKz3bsd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 18:02:17 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qWpGJ7o3KR18vyRXXjR3vGxmLkWj8u/b/KDyTEtJJbs=;
	b=dfHNwzfZ9JdhRvnurfX56AVhsl6psHnQOPilMFSL0kyU9OH4xTWILi0TGamUkwKLewI7Cz
	aroQ25NQg0cNitoRSA9yMsuNR50NkkudAH9dLaaGk93LwfrYxad5vvyo1Co+MjKuBmImTf
	/RblM6V6o6K+7CZPcGnogioPIiPy6HQWZ70ZPbBhgzyD8LjDNr7LpXr7vLwkk3aHnhhu11
	jWZlCMqvGN9bSGwryK7IAsP7NmnYbcWFJuQnHzhThK5cnkIfEPuR+STyuL3iQdUNaektuJ
	8uon6v9UbEHuqe176ow42JQPo0VHV3VcP3GBWW6RO2jIh8Atc0ePI+eIuS0vKQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qWpGJ7o3KR18vyRXXjR3vGxmLkWj8u/b/KDyTEtJJbs=;
	b=5fz5F7pM0oJGQ2repBmoGu5Et5n9RmU7+VMIQwDyVocQ8WGPfoaEBM4hbBgPx/HQwaA9MS
	BZ3Pw1plmNqWt4Dg==
Date: Thu, 10 Oct 2024 09:01:22 +0200
Subject: [PATCH 20/28] x86: vdso: Split virtual clock pages into dedicated
 mapping
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
Message-Id: <20241010-vdso-generic-base-v1-20-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=6276;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=gRRvvI2oPh5V+5P/IYqOWVTmWkjso7fYWZITtUxqLu4=;
 b=f8/3sd1F7F8VHknpoqW4rDH5kLmels2RFR4dwHUdGUQ0nhHRGUe42fu0DBpdlwvK/1tjtdCMm
 fuyhhqK+hTLBqKzu4MPaxL7EKDpohZJ4Q0rMjMYl8weMUegFAAgxK4G
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The generic vdso data storage can not handle the special pvclock and
hvclock pages. Split them into their own mapping, so the other vdso
storage can be migrated to the generic code.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/x86/entry/vdso/vdso-layout.lds.S | 10 +++--
 arch/x86/entry/vdso/vma.c             | 70 ++++++++++++++++++++++++++---------
 arch/x86/include/asm/vdso/vsyscall.h  |  5 +++
 3 files changed, 64 insertions(+), 21 deletions(-)

diff --git a/arch/x86/entry/vdso/vdso-layout.lds.S b/arch/x86/entry/vdso/vdso-layout.lds.S
index 9e602c0615243f8667498ac245c2aaf1b35dcd16..872947c1004c35c006f7508eac7dff251c286aeb 100644
--- a/arch/x86/entry/vdso/vdso-layout.lds.S
+++ b/arch/x86/entry/vdso/vdso-layout.lds.S
@@ -17,14 +17,16 @@ SECTIONS
 	 * segment.
 	 */
 
-	vvar_start = . - 4 * PAGE_SIZE;
+	vvar_start = . - __VVAR_PAGES * PAGE_SIZE;
 	vvar_page  = vvar_start;
 
 	vdso_rng_data = vvar_page + __VDSO_RND_DATA_OFFSET;
 
-	pvclock_page = vvar_start + PAGE_SIZE;
-	hvclock_page = vvar_start + 2 * PAGE_SIZE;
-	timens_page  = vvar_start + 3 * PAGE_SIZE;
+	timens_page  = vvar_start + PAGE_SIZE;
+
+	vclock_pages = vvar_start + VDSO_NR_VCLOCK_PAGES * PAGE_SIZE;
+	pvclock_page = vclock_pages + VDSO_PAGE_PVCLOCK_OFFSET * PAGE_SIZE;
+	hvclock_page = vclock_pages + VDSO_PAGE_HVCLOCK_OFFSET * PAGE_SIZE;
 
 	. = SIZEOF_HEADERS;
 
diff --git a/arch/x86/entry/vdso/vma.c b/arch/x86/entry/vdso/vma.c
index 5731dc35d1d2c0b81c37adf133fc6fa35c41cba1..7e5921adeed0004cba04d59caff280c082ab392e 100644
--- a/arch/x86/entry/vdso/vma.c
+++ b/arch/x86/entry/vdso/vma.c
@@ -24,6 +24,7 @@
 #include <asm/page.h>
 #include <asm/desc.h>
 #include <asm/cpufeature.h>
+#include <asm/vdso/vsyscall.h>
 #include <clocksource/hyperv_timer.h>
 
 struct vdso_data *arch_get_vdso_data(void *vvar_page)
@@ -175,19 +176,7 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 		}
 
 		return vmf_insert_pfn(vma, vmf->address, pfn);
-	} else if (sym_offset == image->sym_pvclock_page) {
-		struct pvclock_vsyscall_time_info *pvti =
-			pvclock_get_pvti_cpu0_va();
-		if (pvti && vclock_was_used(VDSO_CLOCKMODE_PVCLOCK)) {
-			return vmf_insert_pfn_prot(vma, vmf->address,
-					__pa(pvti) >> PAGE_SHIFT,
-					pgprot_decrypted(vma->vm_page_prot));
-		}
-	} else if (sym_offset == image->sym_hvclock_page) {
-		pfn = hv_get_tsc_pfn();
 
-		if (pfn && vclock_was_used(VDSO_CLOCKMODE_HVCLOCK))
-			return vmf_insert_pfn(vma, vmf->address, pfn);
 	} else if (sym_offset == image->sym_timens_page) {
 		struct page *timens_page = find_timens_vvar_page(vma);
 
@@ -201,6 +190,33 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 	return VM_FAULT_SIGBUS;
 }
 
+static vm_fault_t vvar_vclock_fault(const struct vm_special_mapping *sm,
+				    struct vm_area_struct *vma, struct vm_fault *vmf)
+{
+	switch (vmf->pgoff) {
+#ifdef CONFIG_PARAVIRT_CLOCK
+	case VDSO_PAGE_PVCLOCK_OFFSET:
+		struct pvclock_vsyscall_time_info *pvti =
+			pvclock_get_pvti_cpu0_va();
+		if (pvti && vclock_was_used(VDSO_CLOCKMODE_PVCLOCK))
+			return vmf_insert_pfn_prot(vma, vmf->address,
+					__pa(pvti) >> PAGE_SHIFT,
+					pgprot_decrypted(vma->vm_page_prot));
+		break;
+#endif /* CONFIG_PARAVIRT_CLOCK */
+#ifdef CONFIG_HYPERV_TIMER
+	case VDSO_PAGE_HVCLOCK_OFFSET:
+		unsigned long pfn = hv_get_tsc_pfn();
+
+		if (pfn && vclock_was_used(VDSO_CLOCKMODE_HVCLOCK))
+			return vmf_insert_pfn(vma, vmf->address, pfn);
+		break;
+#endif /* CONFIG_HYPERV_TIMER */
+	}
+
+	return VM_FAULT_SIGBUS;
+}
+
 static const struct vm_special_mapping vdso_mapping = {
 	.name = "[vdso]",
 	.fault = vdso_fault,
@@ -210,6 +226,10 @@ static const struct vm_special_mapping vvar_mapping = {
 	.name = "[vvar]",
 	.fault = vvar_fault,
 };
+static const struct vm_special_mapping vvar_vclock_mapping = {
+	.name = "[vvar_vclock]",
+	.fault = vvar_vclock_fault,
+};
 
 /*
  * Add vdso and vvar mappings to current process.
@@ -252,7 +272,7 @@ static int map_vdso(const struct vdso_image *image, unsigned long addr)
 
 	vma = _install_special_mapping(mm,
 				       addr,
-				       -image->sym_vvar_start,
+				       (__VVAR_PAGES - VDSO_NR_VCLOCK_PAGES) * PAGE_SIZE,
 				       VM_READ|VM_MAYREAD|VM_IO|VM_DONTDUMP|
 				       VM_PFNMAP,
 				       &vvar_mapping);
@@ -260,11 +280,26 @@ static int map_vdso(const struct vdso_image *image, unsigned long addr)
 	if (IS_ERR(vma)) {
 		ret = PTR_ERR(vma);
 		do_munmap(mm, text_start, image->size, NULL);
-	} else {
-		current->mm->context.vdso = (void __user *)text_start;
-		current->mm->context.vdso_image = image;
+		goto up_fail;
 	}
 
+	vma = _install_special_mapping(mm,
+				       addr + (__VVAR_PAGES - VDSO_NR_VCLOCK_PAGES) * PAGE_SIZE,
+				       VDSO_NR_VCLOCK_PAGES * PAGE_SIZE,
+				       VM_READ|VM_MAYREAD|VM_IO|VM_DONTDUMP|
+				       VM_PFNMAP,
+				       &vvar_vclock_mapping);
+
+	if (IS_ERR(vma)) {
+		ret = PTR_ERR(vma);
+		do_munmap(mm, text_start, image->size, NULL);
+		do_munmap(mm, addr, image->size, NULL);
+		goto up_fail;
+	}
+
+	current->mm->context.vdso = (void __user *)text_start;
+	current->mm->context.vdso_image = image;
+
 up_fail:
 	mmap_write_unlock(mm);
 	return ret;
@@ -286,7 +321,8 @@ int map_vdso_once(const struct vdso_image *image, unsigned long addr)
 	 */
 	for_each_vma(vmi, vma) {
 		if (vma_is_special_mapping(vma, &vdso_mapping) ||
-				vma_is_special_mapping(vma, &vvar_mapping)) {
+				vma_is_special_mapping(vma, &vvar_mapping) ||
+				vma_is_special_mapping(vma, &vvar_vclock_mapping)) {
 			mmap_write_unlock(mm);
 			return -EEXIST;
 		}
diff --git a/arch/x86/include/asm/vdso/vsyscall.h b/arch/x86/include/asm/vdso/vsyscall.h
index 6e210e05f9f323e3e9ceca8a04d5f21fb6d04781..0fcaaa421c5ae87939b040d9f325327cc3e5ceea 100644
--- a/arch/x86/include/asm/vdso/vsyscall.h
+++ b/arch/x86/include/asm/vdso/vsyscall.h
@@ -3,6 +3,11 @@
 #define __ASM_VDSO_VSYSCALL_H
 
 #define __VDSO_RND_DATA_OFFSET  640
+#define __VVAR_PAGES	4
+
+#define VDSO_NR_VCLOCK_PAGES	2
+#define VDSO_PAGE_PVCLOCK_OFFSET	0
+#define VDSO_PAGE_HVCLOCK_OFFSET	1
 
 #ifndef __ASSEMBLY__
 

-- 
2.47.0


