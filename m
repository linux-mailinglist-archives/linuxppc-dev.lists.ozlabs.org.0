Return-Path: <linuxppc-dev+bounces-10-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8F994E884
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2024 10:26:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GxaYRoj1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wj6zn1cbtz2xrv;
	Mon, 12 Aug 2024 18:26:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GxaYRoj1;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wj6zm62tjz2yFK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2024 18:26:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1723451172;
	bh=pcjuiNWGJBthoyZQ3qFWTiFyzLganh8gT8cFhrjWhRE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GxaYRoj1O/6aMLky2vBn7var5Mtg8nUn123C1LWdhey7cpaSrl22XRNgO3S74rjOT
	 ZVdnqLzZpTrwc5zGQPLVlpOLrV5GY8SC9oNSfrz6d6o5hXos8HivWGEF5KH8y5yQ4H
	 GgVBKrX93hPoPl2fq849JAdVmKJBjG7vY6KadJcvD56pHe4eEttCoqzO5swg8CnXL0
	 ci2cttEjTH/LdvJLKjKx1S5N8dD1O7LZL/N4R3yoAvnR2ZhhqRe4tMosg/0GMwVeGR
	 0w54rRaOGgz1DilunTkuNlHaC9cVrV+nI3hApdE0h+e32H+p10/bHiY7vuGu4w/lrR
	 b5pZFaVZL6dVg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wj6zm3CHMz4x92;
	Mon, 12 Aug 2024 18:26:12 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linux-mm@kvack.org>
Cc: <linuxppc-dev@lists.ozlabs.org>,
	torvalds@linux-foundation.org,
	akpm@linux-foundation.org,
	christophe.leroy@csgroup.eu,
	jeffxu@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org,
	npiggin@gmail.com,
	oliver.sang@intel.com,
	pedro.falcato@gmail.com
Subject: [PATCH v2 4/4] powerpc/vdso: Refactor error handling
Date: Mon, 12 Aug 2024 18:26:05 +1000
Message-ID: <20240812082605.743814-4-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240812082605.743814-1-mpe@ellerman.id.au>
References: <20240812082605.743814-1-mpe@ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus noticed that the error handling in __arch_setup_additional_pages()
fails to clear the mm VDSO pointer if _install_special_mapping()
fails. In practice there should be no actual bug, because if there's an
error the VDSO pointer is cleared later in arch_setup_additional_pages().

However it's no longer necessary to set the pointer before installing
the mapping. Commit c1bab64360e6 ("powerpc/vdso: Move to
_install_special_mapping() and remove arch_vma_name()") reworked the
code so that the VMA name comes from the vm_special_mapping.name, rather
than relying on arch_vma_name().

So rework the code to only set the VDSO pointer once the mappings have
been installed correctly, and remove the stale comment.

Depends-on: c1bab64360e6 ("powerpc/vdso: Move to _install_special_mapping() and remove arch_vma_name()")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/vdso.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

v2: Unchanged.

diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index 220a76cae7c1..ee4b9d676cff 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -214,13 +214,6 @@ static int __arch_setup_additional_pages(struct linux_binprm *bprm, int uses_int
 	/* Add required alignment. */
 	vdso_base = ALIGN(vdso_base, VDSO_ALIGNMENT);
 
-	/*
-	 * Put vDSO base into mm struct. We need to do this before calling
-	 * install_special_mapping or the perf counter mmap tracking code
-	 * will fail to recognise it as a vDSO.
-	 */
-	mm->context.vdso = (void __user *)vdso_base + vvar_size;
-
 	vma = _install_special_mapping(mm, vdso_base, vvar_size,
 				       VM_READ | VM_MAYREAD | VM_IO |
 				       VM_DONTDUMP | VM_PFNMAP, &vvar_spec);
@@ -240,10 +233,15 @@ static int __arch_setup_additional_pages(struct linux_binprm *bprm, int uses_int
 	vma = _install_special_mapping(mm, vdso_base + vvar_size, vdso_size,
 				       VM_READ | VM_EXEC | VM_MAYREAD |
 				       VM_MAYWRITE | VM_MAYEXEC, vdso_spec);
-	if (IS_ERR(vma))
+	if (IS_ERR(vma)) {
 		do_munmap(mm, vdso_base, vvar_size, NULL);
+		return PTR_ERR(vma);
+	}
 
-	return PTR_ERR_OR_ZERO(vma);
+	// Now that the mappings are in place, set the mm VDSO pointer
+	mm->context.vdso = (void __user *)vdso_base + vvar_size;
+
+	return 0;
 }
 
 int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
@@ -257,8 +255,6 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 		return -EINTR;
 
 	rc = __arch_setup_additional_pages(bprm, uses_interp);
-	if (rc)
-		mm->context.vdso = NULL;
 
 	mmap_write_unlock(mm);
 	return rc;
-- 
2.45.2


