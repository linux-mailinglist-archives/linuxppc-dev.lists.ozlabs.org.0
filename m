Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C0F8BA82B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 09:57:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=r/XIi942;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VW36w752Yz3cYK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 17:57:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=r/XIi942;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VW36962Pxz2xFk
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2024 17:56:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1714722991;
	bh=Xb4uZcBO3ovCjGUGsxkoEGWYJ/aNPwvO8oVcR3qqzIw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r/XIi94277McCWwhdAjYT+0VYIGkuxJC1N9kJtqfpmvQk3+SScslZAbQFACFSYeI6
	 NB3gIgPmNKbphACVaJRlSjMBDJAzBN2S1KPYM97FuN00hnwsU2cBdRYPxhYOj8QELX
	 OWR0SM7hphCpZAF+pG4qLmi3kREc6tWjYwwoGmy+AEgVSvWGJ18xPvG6Qyzcp23c0I
	 u+Ge4fn+FBi0ad4ocsY132MiYDsnz5YfILVXbokV/qmHprZ9GO6zw5S+OantsqnlYs
	 eaotmD5tKFbm01PNj2OrOhQ/doOad++5HFX1LR0MwtCj3P9Gl1Rc7brRubF70gyGRl
	 CTixMm84cHeQA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VW36765XRz4x0v;
	Fri,  3 May 2024 17:56:31 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 2/2] powerpc/64: Set _IO_BASE to POISON_POINTER_DELTA not 0 for CONFIG_PCI=n
Date: Fri,  3 May 2024 17:56:19 +1000
Message-ID: <20240503075619.394467-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240503075619.394467-1-mpe@ellerman.id.au>
References: <20240503075619.394467-1-mpe@ellerman.id.au>
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
Cc: nathan@kernel.org, naresh.kamboju@linaro.org, linux-kernel@vger.kernel.org, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is code that builds with calls to IO accessors even when
CONFIG_PCI=n, but the actual calls are guarded by runtime checks.

If not those calls would be faulting, because the page at virtual
address zero is (usually) not mapped into the kernel. As Arnd pointed
out, it is possible a large port value could cause the address to be
above mmap_min_addr which would then access userspace, which would be
a bug.

To avoid any such issues, set _IO_BASE to POISON_POINTER_DELTA. That
is a value chosen to point into unmapped space between the kernel and
userspace, so any access will always fault.

Note that on 32-bit POISON_POINTER_DELTA is 0, so the patch only has an
effect on 64-bit.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/io.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

v2: Patch unchanged, changelog updated to reflect patch 1.

diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index ba2e13bb879d..048e3705af20 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -37,7 +37,7 @@ extern struct pci_dev *isa_bridge_pcidev;
  * define properly based on the platform
  */
 #ifndef CONFIG_PCI
-#define _IO_BASE	0
+#define _IO_BASE	POISON_POINTER_DELTA
 #define _ISA_MEM_BASE	0
 #define PCI_DRAM_OFFSET 0
 #elif defined(CONFIG_PPC32)
-- 
2.44.0

