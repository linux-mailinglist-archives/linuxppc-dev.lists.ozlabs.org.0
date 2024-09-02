Return-Path: <linuxppc-dev+bounces-856-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F9B967EDA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 07:36:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WxyDf5CFrz2xvH;
	Mon,  2 Sep 2024 15:36:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725255112;
	cv=none; b=jcqO9oAaNOOSjMdtQVHu9B6bUy3BP5eOnOkPQnMJDUuqUv6lZxZJQ5j9iQh/2SHCOt3YOp1HV9jVEYEC97FzL/1MADRfKAm4XIIAjUb9Gxx3CRIrCvYw90MITnTe93raF/H8CAJxh8V5V14OH3k9y69J8IKuTNyZ+Ul3erkNCzngGwpXp4Lk2XZL7mAm63dVh7l3p17xW6MWa6LDzuWsmm3BENG4q1VE7oYbdChrPVcYj4aWVle1y988Urwvbdohk3Sj2GYntZ9AYaUQ0GyfHIsL9CM3+V3LchIoUuFhLAtnw+2r95JVIceFo2pqm8NKqBv1qDL1Jk7dRZjnIwjN7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725255112; c=relaxed/relaxed;
	bh=56VTu/qXLVL5nMG+uXbgMEcYFDCqL3Blag2bpSCjYxk=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=mlwz7uK7hjuDg1MO4QpzzeVx22xrBltLMI6Ld89TAwZRd3b5ehPaeFVG7CiGQrlEKi9/J1+8IJBMjYGuMsmaOwKXM3U/615quG0L4FGvEXqUA9nZg63uSPH1qXUkEskmlsX5yn0tjcmbL2aj24lawOmc+ou1GnBMruPLkQC0Q7xR4UPZ+G8Qm7mRi/mRGrgvt+hl/fQWjnQUhEVB8xSCG3+MsFZdRqkxmdZJka1/5Avy5+9e6rNfU4z3Az9e7w5IP91cdGk8I0L/AEBn6oXQ+B4QgbqgpKr9LnRrEdL4jPxu7ZxzQZiYZ92aOb1iU3MlE+5idGPI4Jv27TDmzawoRQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=osandov.com; dkim=pass (2048-bit key; unprotected) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=nS/K4VYW; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=osandov@osandov.com; receiver=lists.ozlabs.org) smtp.mailfrom=osandov.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=nS/K4VYW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=osandov.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=osandov@osandov.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wxy6v5F8tz2xT8
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2024 15:31:51 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-70d19bfdabbso125394b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Sep 2024 22:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1725255109; x=1725859909; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56VTu/qXLVL5nMG+uXbgMEcYFDCqL3Blag2bpSCjYxk=;
        b=nS/K4VYWVVGsy3yO2ylRYHe9mENsljqhbd8AnIzU+Vv1Vbze+wgQj42jqOgFcVgolo
         BL1TGt41n4w21IvDxPXNSa9aagrFpxWTCNzm2LtcvlKIJlFRV7/CfYTKoJnc2MaikEkL
         tdiN9lbVySoBvupFmIsbRfwABm+aQV+nwKmsCMkgODllw2D+LkegvTY2LIY2r0Un0NEv
         sQFP0kolOnBDOGL4geEIFJlDJkQDyExxxDa5p4CZ8IdeAVPm19+emhgQe79xGkjhLJbk
         hybCkKIchlaNvqSZa4+dJP/IyygsR+TxGVP3/HGX0N+ED8ZxFLJVRKg/b7VxVxWgOgHB
         UhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725255109; x=1725859909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=56VTu/qXLVL5nMG+uXbgMEcYFDCqL3Blag2bpSCjYxk=;
        b=SHWufD/KqSaGm992kSuhwUKVnnmQ4wgdLNteK/H6q7lz9Zhf0OKrdHhxAI991QLLg4
         Fh2tMGsfGPAaFc1lEK+ecy+7/tT2IB25nSgya8S4q8+ymbPLIx3dlm5mJAK/vb11HoCR
         qeizyE52zshIJPMbzXE23iP8WpFA+8Y0/YvJCGfrLH75XFHG3a6tsh8d9aEhcclqMBun
         WFW0VpejptF5cfizGQOJcfA/Ho+uqBJzSAoOJmdKfJiCuDAdarJuMnDfhxr44z0s1wyK
         V3VL2xGcAx51CyIWt3io921teUnEfY7f7ehBdpy8HP1BdqtXEKh8Ejgs6qdpbb5uKQ33
         LPxg==
X-Forwarded-Encrypted: i=1; AJvYcCXxc6ChAdx1xdth/BELXUlysKuLq/nozkN+zx+dDFOGsmOSXS1akFna6JT8dYiNfemuX2Trp74sRfXSP6Q=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy1H9YSygXn7h+K0F79nhN/c3PpLS9bb5I8kD1OBtn1HEVmx9T0
	qUQ9u/hPkvC+tFoTRe0HCmrzCxuNNHXlBaZpGADhApPQ847zonP/Ok58BYVxnLg=
X-Google-Smtp-Source: AGHT+IHP9EQ25y63/ZmPp8u38IbeoRt/KYiwtSvqUDmg44wFA6t/ROSaOYVvZchoffP9nEa6l2KaPg==
X-Received: by 2002:a05:6a00:1a8e:b0:714:21c2:efb5 with SMTP id d2e1a72fcca58-717305d65acmr5552903b3a.1.1725255108509;
        Sun, 01 Sep 2024 22:31:48 -0700 (PDT)
Received: from telecaster.hsd1.wa.comcast.net ([2601:602:8980:9170::901f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e55a692fsm6076279b3a.60.2024.09.01.22.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 22:31:48 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-um@lists.infradead.org,
	kernel-team@fb.com
Subject: [PATCH 1/2] mm: rename copy_from_kernel_nofault_allowed() to copy_kernel_nofault_allowed()
Date: Sun,  1 Sep 2024 22:31:28 -0700
Message-ID: <c50815dee5c244274e880b0fc4253deaf72b9165.1725223574.git.osandov@fb.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1725223574.git.osandov@fb.com>
References: <cover.1725223574.git.osandov@fb.com>
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

From: Omar Sandoval <osandov@fb.com>

All of the existing checks are applicable to both the "from" and "to"
directions, and the next patch needs it for copy_to_kernel_nofault().

Signed-off-by: Omar Sandoval <osandov@fb.com>
---
 arch/arm/mm/fault.c         | 2 +-
 arch/loongarch/mm/maccess.c | 2 +-
 arch/mips/mm/maccess.c      | 2 +-
 arch/parisc/lib/memcpy.c    | 2 +-
 arch/powerpc/mm/maccess.c   | 2 +-
 arch/um/kernel/maccess.c    | 2 +-
 arch/x86/mm/maccess.c       | 4 ++--
 include/linux/uaccess.h     | 2 +-
 mm/maccess.c                | 7 +++----
 9 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index ab01b51de559..3fef0a59af4f 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -27,7 +27,7 @@
 
 #ifdef CONFIG_MMU
 
-bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size)
+bool copy_kernel_nofault_allowed(const void *unsafe_src, size_t size)
 {
 	unsigned long addr = (unsigned long)unsafe_src;
 
diff --git a/arch/loongarch/mm/maccess.c b/arch/loongarch/mm/maccess.c
index 58173842c6be..70012ac0a5a8 100644
--- a/arch/loongarch/mm/maccess.c
+++ b/arch/loongarch/mm/maccess.c
@@ -3,7 +3,7 @@
 #include <linux/uaccess.h>
 #include <linux/kernel.h>
 
-bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size)
+bool copy_kernel_nofault_allowed(const void *unsafe_src, size_t size)
 {
 	/* highest bit set means kernel space */
 	return (unsigned long)unsafe_src >> (BITS_PER_LONG - 1);
diff --git a/arch/mips/mm/maccess.c b/arch/mips/mm/maccess.c
index 58173842c6be..70012ac0a5a8 100644
--- a/arch/mips/mm/maccess.c
+++ b/arch/mips/mm/maccess.c
@@ -3,7 +3,7 @@
 #include <linux/uaccess.h>
 #include <linux/kernel.h>
 
-bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size)
+bool copy_kernel_nofault_allowed(const void *unsafe_src, size_t size)
 {
 	/* highest bit set means kernel space */
 	return (unsigned long)unsafe_src >> (BITS_PER_LONG - 1);
diff --git a/arch/parisc/lib/memcpy.c b/arch/parisc/lib/memcpy.c
index 5fc0c852c84c..78758b9a0f49 100644
--- a/arch/parisc/lib/memcpy.c
+++ b/arch/parisc/lib/memcpy.c
@@ -48,7 +48,7 @@ void * memcpy(void * dst,const void *src, size_t count)
 
 EXPORT_SYMBOL(memcpy);
 
-bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size)
+bool copy_kernel_nofault_allowed(const void *unsafe_src, size_t size)
 {
 	if ((unsigned long)unsafe_src < PAGE_SIZE)
 		return false;
diff --git a/arch/powerpc/mm/maccess.c b/arch/powerpc/mm/maccess.c
index ea821d0ffe16..e0f4c394836c 100644
--- a/arch/powerpc/mm/maccess.c
+++ b/arch/powerpc/mm/maccess.c
@@ -7,7 +7,7 @@
 #include <asm/inst.h>
 #include <asm/ppc-opcode.h>
 
-bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size)
+bool copy_kernel_nofault_allowed(const void *unsafe_src, size_t size)
 {
 	return is_kernel_addr((unsigned long)unsafe_src);
 }
diff --git a/arch/um/kernel/maccess.c b/arch/um/kernel/maccess.c
index 8ccd56813f68..3497148e9aa5 100644
--- a/arch/um/kernel/maccess.c
+++ b/arch/um/kernel/maccess.c
@@ -7,7 +7,7 @@
 #include <linux/kernel.h>
 #include <os.h>
 
-bool copy_from_kernel_nofault_allowed(const void *src, size_t size)
+bool copy_kernel_nofault_allowed(const void *src, size_t size)
 {
 	void *psrc = (void *)rounddown((unsigned long)src, PAGE_SIZE);
 
diff --git a/arch/x86/mm/maccess.c b/arch/x86/mm/maccess.c
index 42115ac079cf..be28eda2c0b0 100644
--- a/arch/x86/mm/maccess.c
+++ b/arch/x86/mm/maccess.c
@@ -6,7 +6,7 @@
 #include <asm/vsyscall.h>
 
 #ifdef CONFIG_X86_64
-bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size)
+bool copy_kernel_nofault_allowed(const void *unsafe_src, size_t size)
 {
 	unsigned long vaddr = (unsigned long)unsafe_src;
 
@@ -36,7 +36,7 @@ bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size)
 	return __is_canonical_address(vaddr, boot_cpu_data.x86_virt_bits);
 }
 #else
-bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size)
+bool copy_kernel_nofault_allowed(const void *unsafe_src, size_t size)
 {
 	return (unsigned long)unsafe_src >= TASK_SIZE_MAX;
 }
diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index d8e4105a2f21..297a02b2bd53 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -387,7 +387,7 @@ copy_struct_from_user(void *dst, size_t ksize, const void __user *src,
 	return 0;
 }
 
-bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size);
+bool copy_kernel_nofault_allowed(const void *unsafe_src, size_t size);
 
 long copy_from_kernel_nofault(void *dst, const void *src, size_t size);
 long notrace copy_to_kernel_nofault(void *dst, const void *src, size_t size);
diff --git a/mm/maccess.c b/mm/maccess.c
index 518a25667323..72e9c03ea37f 100644
--- a/mm/maccess.c
+++ b/mm/maccess.c
@@ -7,8 +7,7 @@
 #include <linux/uaccess.h>
 #include <asm/tlb.h>
 
-bool __weak copy_from_kernel_nofault_allowed(const void *unsafe_src,
-		size_t size)
+bool __weak copy_kernel_nofault_allowed(const void *unsafe_src, size_t size)
 {
 	return true;
 }
@@ -28,7 +27,7 @@ long copy_from_kernel_nofault(void *dst, const void *src, size_t size)
 	if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS))
 		align = (unsigned long)dst | (unsigned long)src;
 
-	if (!copy_from_kernel_nofault_allowed(src, size))
+	if (!copy_kernel_nofault_allowed(src, size))
 		return -ERANGE;
 
 	pagefault_disable();
@@ -83,7 +82,7 @@ long strncpy_from_kernel_nofault(char *dst, const void *unsafe_addr, long count)
 
 	if (unlikely(count <= 0))
 		return 0;
-	if (!copy_from_kernel_nofault_allowed(unsafe_addr, count))
+	if (!copy_kernel_nofault_allowed(unsafe_addr, count))
 		return -ERANGE;
 
 	pagefault_disable();
-- 
2.46.0


