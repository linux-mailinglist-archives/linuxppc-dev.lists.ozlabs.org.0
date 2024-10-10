Return-Path: <linuxppc-dev+bounces-1949-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F01EE997E66
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 09:05:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPLKx69xBz3c1Q;
	Thu, 10 Oct 2024 18:02:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728543749;
	cv=none; b=nJkYKRpz6RTwTQc4J321b0u7zELRSIWacCDUb0sVbYKUXgkNgCrDjvQOrserPtZF75iu+WHHP9hxXuxYpzexL7B592DMRDgts0/I7hLh4hWROlH8YLIqmSI9yJD3IMhmRduB1KbdRSHIB9l+6yhaDj6UU5jhckHcLKV4bOuarcbvS4dXQ04rY7dkE4Eqghk4xtf1vSZPdlttFuQdZkBQj+IevFUiVoD9NPjWoUw6VF0SQOYyfkOvO9kZoJF262sqYj4tmnVFSH6TVNkc8/GIsA15q+KV+pSq2dz5vg+eavRC+L2mNBrt5OFv276/cqW94yu514YpJeNEg9vBVi3W3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728543749; c=relaxed/relaxed;
	bh=c0jOb+0pBVFtpRBvmlWca4rm6bPz719GqeyVxg9V4Yk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SNNm9VJG59lQKPz3ZvIxmxyn6qZzl4OqWuEyNCR+HnC48qMxabyWItVPDPPKnd6GzUx6HXDR0GPDcXewKqOgyLNracm5Z0mZJoLM0iGGITQOv5wOgMOVnRl+jw0jnIlSMdl8jIxQlPtSZcOCT4uYJnueL3BnCXqMO0B/qcYMEfXqDIa4t0438DqPa9vXJGOdi1bRT5jtzAJ6EgDwqN+UMMUnRRDU5BGYP30eJaptrkGIfYRZuQPPJflnaFlEBJExLIw5pecuiAVo71McA39YfhnhtX496VubhjjMhVVfrfmaMOB44Fmppd0xdc6VJBWnAUqt2Anv648RuK+RHSSu8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=vcSKL5Ei; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=gtMxsvQW; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=vcSKL5Ei;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=gtMxsvQW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPLKw5JCDz3c0H
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 18:02:28 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c0jOb+0pBVFtpRBvmlWca4rm6bPz719GqeyVxg9V4Yk=;
	b=vcSKL5Ei05MaIvwUWEEkh1o2Ks/eorA8eAEJRD0CuQzgOALnIEbeQVOd0f2FLvUuk9711Q
	tmjQMOz6qR/FSaU590Uhit+apcTIvS6HqZSZBnjaTKGO+jLKVUowkedgLFEeyq4eh5Q57T
	/sBv5eMaiq5R28QJPg2l8Q/b/b0NPmH0LvedMx9h3Ccjpfv4fUQ6F0RpGgk274N++hnkj5
	59rLGt0i4dJYnpcuI1c9gDghiHkvBwQDrj48KYgfMgkCsLRgDHBp3cs4nJ5upXJnypV9+l
	R1g1z2Z2x16M+GL7rp+0QROcQL103T3FYjfOZVs0Y4ucjszEaq1P/PyGDChuKw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c0jOb+0pBVFtpRBvmlWca4rm6bPz719GqeyVxg9V4Yk=;
	b=gtMxsvQWmbQIKGeUBCn063lFjoQTBpOVE8sqGXxcphJb6jAHTMcx0B08jmt1ST+co49ykp
	nznusCNutY6jRIDw==
Date: Thu, 10 Oct 2024 09:01:16 +0200
Subject: [PATCH 14/28] x86: vdso: Allocate vvar page from C code
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
Message-Id: <20241010-vdso-generic-base-v1-14-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=4524;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=3awjAm9ufpQd1He4UP6AdNApXBAJ0LbyYsxfWiE+63U=;
 b=lKDP23WVMRWJvIoSEl4GRHapesPFvH7pyf318uwEN73rQnQewl633LJdXV98MCj8D0iG9mp5X
 j/cHGTbQmCQCoN3JlHegeGrKD9rS1alFnZxIvXe0Z7RMU6pXnx65LOL
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Allocate the vvar page through the standard union vdso_data_store
and remove the custom linker script logic.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/x86/entry/vdso/vma.c            | 16 +++++-----------
 arch/x86/include/asm/vdso/vsyscall.h |  6 ++++--
 arch/x86/kernel/vmlinux.lds.S        | 23 -----------------------
 arch/x86/tools/relocs.c              |  1 -
 4 files changed, 9 insertions(+), 37 deletions(-)

diff --git a/arch/x86/entry/vdso/vma.c b/arch/x86/entry/vdso/vma.c
index 8437906fd4b353ad0fe208d811817a1b6f8f8dcb..5731dc35d1d2c0b81c37adf133fc6fa35c41cba1 100644
--- a/arch/x86/entry/vdso/vma.c
+++ b/arch/x86/entry/vdso/vma.c
@@ -20,25 +20,19 @@
 #include <asm/vgtod.h>
 #include <asm/proto.h>
 #include <asm/vdso.h>
-#include <asm/vvar.h>
 #include <asm/tlb.h>
 #include <asm/page.h>
 #include <asm/desc.h>
 #include <asm/cpufeature.h>
 #include <clocksource/hyperv_timer.h>
 
-#undef _ASM_X86_VVAR_H
-#define EMIT_VVAR(name, offset)	\
-	const size_t name ## _offset = offset;
-#include <asm/vvar.h>
-
 struct vdso_data *arch_get_vdso_data(void *vvar_page)
 {
-	return (struct vdso_data *)(vvar_page + _vdso_data_offset);
+	return (struct vdso_data *)vvar_page;
 }
-#undef EMIT_VVAR
 
-DEFINE_VVAR(struct vdso_data, _vdso_data);
+static union vdso_data_store vdso_data_store __page_aligned_data;
+struct vdso_data *vdso_data = vdso_data_store.data;
 
 unsigned int vclocks_used __read_mostly;
 
@@ -153,7 +147,7 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 	if (sym_offset == image->sym_vvar_page) {
 		struct page *timens_page = find_timens_vvar_page(vma);
 
-		pfn = __pa_symbol(&__vvar_page) >> PAGE_SHIFT;
+		pfn = __pa_symbol(vdso_data) >> PAGE_SHIFT;
 
 		/*
 		 * If a task belongs to a time namespace then a namespace
@@ -200,7 +194,7 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 		if (!timens_page)
 			return VM_FAULT_SIGBUS;
 
-		pfn = __pa_symbol(&__vvar_page) >> PAGE_SHIFT;
+		pfn = __pa_symbol(vdso_data) >> PAGE_SHIFT;
 		return vmf_insert_pfn(vma, vmf->address, pfn);
 	}
 
diff --git a/arch/x86/include/asm/vdso/vsyscall.h b/arch/x86/include/asm/vdso/vsyscall.h
index 2cbb32a8a45e2f5c7bc02172af0fa09173f33924..5d6760746d15b0e12c7bf0eb727241e7576ca9c7 100644
--- a/arch/x86/include/asm/vdso/vsyscall.h
+++ b/arch/x86/include/asm/vdso/vsyscall.h
@@ -9,20 +9,22 @@
 #include <asm/vgtod.h>
 #include <asm/vvar.h>
 
+extern struct vdso_data *vdso_data;
+
 /*
  * Update the vDSO data page to keep in sync with kernel timekeeping.
  */
 static __always_inline
 struct vdso_data *__x86_get_k_vdso_data(void)
 {
-	return _vdso_data;
+	return vdso_data;
 }
 #define __arch_get_k_vdso_data __x86_get_k_vdso_data
 
 static __always_inline
 struct vdso_rng_data *__x86_get_k_vdso_rng_data(void)
 {
-	return (void *)&__vvar_page + __VDSO_RND_DATA_OFFSET;
+	return (void *)vdso_data + __VDSO_RND_DATA_OFFSET;
 }
 #define __arch_get_k_vdso_rng_data __x86_get_k_vdso_rng_data
 
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 6726be89b7a663a1554f8f4b297bba65b4ebdf61..e7e19842736a774191142b6ce43bf5567540cb80 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -193,29 +193,6 @@ SECTIONS
 
 	ORC_UNWIND_TABLE
 
-	. = ALIGN(PAGE_SIZE);
-	__vvar_page = .;
-
-	.vvar : AT(ADDR(.vvar) - LOAD_OFFSET) {
-		/* work around gold bug 13023 */
-		__vvar_beginning_hack = .;
-
-		/* Place all vvars at the offsets in asm/vvar.h. */
-#define EMIT_VVAR(name, offset)				\
-		. = __vvar_beginning_hack + offset;	\
-		*(.vvar_ ## name)
-#include <asm/vvar.h>
-#undef EMIT_VVAR
-
-		/*
-		 * Pad the rest of the page with zeros.  Otherwise the loader
-		 * can leave garbage here.
-		 */
-		. = __vvar_beginning_hack + PAGE_SIZE;
-	} :data
-
-	. = ALIGN(__vvar_page + PAGE_SIZE, PAGE_SIZE);
-
 	/* Init code and data - will be freed after init */
 	. = ALIGN(PAGE_SIZE);
 	.init.begin : AT(ADDR(.init.begin) - LOAD_OFFSET) {
diff --git a/arch/x86/tools/relocs.c b/arch/x86/tools/relocs.c
index c101bed6194000004bd84e1679259cce9977d290..6afe2e5e9102873634c6ad9a3a0b9c66bba5da50 100644
--- a/arch/x86/tools/relocs.c
+++ b/arch/x86/tools/relocs.c
@@ -89,7 +89,6 @@ static const char * const	sym_regex_kernel[S_NSYMTYPES] = {
 	"init_per_cpu__.*|"
 	"__end_rodata_hpage_align|"
 #endif
-	"__vvar_page|"
 	"_end)$"
 };
 

-- 
2.47.0


