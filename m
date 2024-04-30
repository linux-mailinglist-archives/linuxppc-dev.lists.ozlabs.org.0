Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 601878B78BA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 16:14:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=U1AcNwgt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTMdN0bBVz3wKY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 00:14:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=U1AcNwgt;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTMSd4cKzz3vgl
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2024 00:06:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1714485998;
	bh=CJMgqqvI95rdnpWkged7Mwx046s4t+cpaXoy/jdWn+I=;
	h=From:To:Cc:Subject:Date:From;
	b=U1AcNwgteHOupDcqWmJxu9sPjE02u/8vzW9hvAFE77gCBXZHWRaLFFoyJsG5eE5Vk
	 NfqohhT1FtCZSJgl64/t++SagywMssZYV3i1kG9Q93faLjmxEfx4UZ3pq28v0SQtjQ
	 j3gdM+yyXyi98x4L053qcN5qMp1kJGZrmuXGTn74PIplr8fo1919u1y2RsDrPm+GU9
	 K15DWs3B5NAa6WVTzE+GteORJNI4OJg0gt6I3U4agGBvA3S417kkkPaR/VgGSS+rJm
	 mdcMMPmFq5rL9SxcxRbtCysIj1cPsFADq3kDCB6x/3nE2ad2mGxeCG2f1sIAN0ezSZ
	 2CovHSM5U1/vg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VTMSY4CmQz4wcn;
	Wed,  1 May 2024 00:06:37 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc: Set _IO_BASE to POISON_POINTER_DELTA not 0 for CONFIG_PCI=n
Date: Wed,  1 May 2024 00:04:40 +1000
Message-ID: <20240430140440.200871-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.44.0
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
Cc: naresh.kamboju@linaro.org, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With -Wextra clang warns about pointer arithmetic using a null pointer.
When building with CONFIG_PCI=n, that triggers a warning in the IO
accessors, eg:

  In file included from linux/arch/powerpc/include/asm/io.h:672:
  linux/arch/powerpc/include/asm/io-defs.h:23:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     23 | DEF_PCI_AC_RET(inb, u8, (unsigned long port), (port), pio, port)
        | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ...
  linux/arch/powerpc/include/asm/io.h:591:53: note: expanded from macro '__do_inb'
    591 | #define __do_inb(port)          readb((PCI_IO_ADDR)_IO_BASE + port);
        |                                       ~~~~~~~~~~~~~~~~~~~~~ ^

That is because when CONFIG_PCI=n, _IO_BASE is defined as 0.

There is code that builds with calls to IO accessors even when
CONFIG_PCI=n, but the actual calls are guarded by runtime checks.
If not those calls would be faulting, because the page at virtual
address zero is (usually) not mapped into the kernel. As Arnd pointed
out, it is possible a large port value could cause the address to be
above mmap_min_addr which would then access userspace, which would be
a bug.

To avoid any such issues, and also fix the compiler warning, set the
_IO_BASE to POISON_POINTER_DELTA. That is a value chosen to point into
unmapped space between the kernel and userspace, so any access will
always fault.

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Closes: https://lore.kernel.org/all/CA+G9fYtEh8zmq8k8wE-8RZwW-Qr927RLTn+KqGnq1F=ptaaNsA@mail.gmail.com
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/io.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index 08c550ed49be..1cd6eb6c8101 100644
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

