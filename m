Return-Path: <linuxppc-dev+bounces-4304-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB769F641D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 11:57:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCrFC4fz3z30Wh;
	Wed, 18 Dec 2024 21:55:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734519343;
	cv=none; b=DuqL3Zyq5yxEOJ6CJCpv4+T/e3q1l7FotHYhuHCX6rUaqep9PfaO7LAIdSrhDZrmT82IDGVnC4URDZJnRfzGsSuKki1CLs+ShbE3pJUp9tjuPtZWfG4Z3C0+qaZYCelmLp3Tx5rmPurb74q7u4ayX44HIDwHD2scXAOERNoazgSIcBLojfocWyN0zqNWGSpNQdcnLXOVGd1IVfRDnPekWC6tjthEfsXCWQmLT+zhTNZSigtAeEXAxQdxsyt65fHLbR98odwmboOntDYvrzMqc6vRKv2tX/nr5rd/ivWTrnOFaPSCjyIkF93b5lF58jYfolLnqgpmdm1JsKr8re/FSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734519343; c=relaxed/relaxed;
	bh=Aku4otQ/cUnmI6yHI7+MeL0bT0uRJeed1qRHa/YtG+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CLv4sn771WDtsw6gkWR00jVD2lKW4JP6M9+kEmv163nWdNWE3ovksXY9L37w9q5Dt52rnJ1f2XdytGA/Skniun5pPiJ4dWRgHyPY2K43dCBf1Gs8XOfvaUYkwx0Cgu2ZYe6OcbfhkhsVx9Wim2YzTXvay7E6r721jTE0dGboVNMu/55oLYjbbwKCIjDtKxn6NP1JBZC6J22JT3EpzW6iXz4yeYxQ74vmI/1uFdD4yhoECK/T22NNOdaPGFbRSYyguznkiy29i3PuiclbtTjuiCuDwoLH1xB3YfNSTysANqPkDXzJPMbSn0kaWSwVq4PMgXg0tsOESINgeSXCOcgemw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EgcRyVXG; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EgcRyVXG;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCrF66MX9z30Tx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 21:55:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1734519333;
	bh=Aku4otQ/cUnmI6yHI7+MeL0bT0uRJeed1qRHa/YtG+A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EgcRyVXGIlk3g4c+kKlhRO2yWR6YGIEMaoNzyPRL4kK+k44ioFMajtz2jHptXV+q4
	 vABLuDcKQOf7G10SO5R3bcqtneXBSE1kLPDqtLuhFd/gNucEC9SIhT+kKyo/oTph8w
	 /XvdT3hnnM8S8OtGjcaF5N3gHGT2OpOZhiKSOCYlxABafERmodPQsfXcQoYmC94Mvf
	 qrfNDF7BNG0KMssPYsV1EsOKlCkiUiUEATZ0AxLFD2IlYkNITFGwkIlvjQD2hwfVBj
	 ix4vLxEoZWKEKslcIsg+z+dAlutubzjBy+2jIKo7REvI5UOslVkQ2MU5gIqZgdRzI7
	 8JOm4P0NzOKVA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YCrF10LwSz4xfK;
	Wed, 18 Dec 2024 21:55:33 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <arnd@arndb.de>,
	<jk@ozlabs.org>,
	<segher@kernel.crashing.org>
Subject: [PATCH v2 14/25] powerpc/io: Wrap port calculation in a macro
Date: Wed, 18 Dec 2024 21:55:02 +1100
Message-ID: <20241218105523.416573-14-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218105523.416573-1-mpe@ellerman.id.au>
References: <20241218105523.416573-1-mpe@ellerman.id.au>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The calculation of the IO port is repeated several times, wrap it in
a macro, in particular to avoid spelling out the cast multiple times.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
v2: New.

 arch/powerpc/include/asm/io.h | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index 7731f2364275..c21796354f87 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -277,6 +277,8 @@ extern void _memcpy_toio(volatile void __iomem *dest, const void *src,
 /* Shortcut to the MMIO argument pointer */
 #define PCI_IO_ADDR	volatile void __iomem *
 
+#define _IO_PORT(port)	((PCI_IO_ADDR)(_IO_BASE + (port)))
+
 /*
  * Non ordered and non-swapping "raw" accessors
  */
@@ -532,12 +534,12 @@ __do_out_asm(_rec_outl, "stwbrx")
 #define __do_inw(port)		_rec_inw(port)
 #define __do_inl(port)		_rec_inl(port)
 #else /* CONFIG_PPC32 */
-#define __do_outb(val, port)	writeb(val,(PCI_IO_ADDR)(_IO_BASE+port));
-#define __do_outw(val, port)	writew(val,(PCI_IO_ADDR)(_IO_BASE+port));
-#define __do_outl(val, port)	writel(val,(PCI_IO_ADDR)(_IO_BASE+port));
-#define __do_inb(port)		readb((PCI_IO_ADDR)(_IO_BASE + port));
-#define __do_inw(port)		readw((PCI_IO_ADDR)(_IO_BASE + port));
-#define __do_inl(port)		readl((PCI_IO_ADDR)(_IO_BASE + port));
+#define __do_outb(val, port)	writeb(val,_IO_PORT(port));
+#define __do_outw(val, port)	writew(val,_IO_PORT(port));
+#define __do_outl(val, port)	writel(val,_IO_PORT(port));
+#define __do_inb(port)		readb(_IO_PORT(port));
+#define __do_inw(port)		readw(_IO_PORT(port));
+#define __do_inl(port)		readl(_IO_PORT(port));
 #endif /* !CONFIG_PPC32 */
 
 #ifdef CONFIG_EEH
@@ -553,12 +555,12 @@ __do_out_asm(_rec_outl, "stwbrx")
 #define __do_writesw(a, b, n)	_outsw(a, (b), (n))
 #define __do_writesl(a, b, n)	_outsl(a, (b), (n))
 
-#define __do_insb(p, b, n)	readsb((PCI_IO_ADDR)(_IO_BASE+(p)), (b), (n))
-#define __do_insw(p, b, n)	readsw((PCI_IO_ADDR)(_IO_BASE+(p)), (b), (n))
-#define __do_insl(p, b, n)	readsl((PCI_IO_ADDR)(_IO_BASE+(p)), (b), (n))
-#define __do_outsb(p, b, n)	writesb((PCI_IO_ADDR)(_IO_BASE+(p)),(b),(n))
-#define __do_outsw(p, b, n)	writesw((PCI_IO_ADDR)(_IO_BASE+(p)),(b),(n))
-#define __do_outsl(p, b, n)	writesl((PCI_IO_ADDR)(_IO_BASE+(p)),(b),(n))
+#define __do_insb(p, b, n)	readsb(_IO_PORT(p), (b), (n))
+#define __do_insw(p, b, n)	readsw(_IO_PORT(p), (b), (n))
+#define __do_insl(p, b, n)	readsl(_IO_PORT(p), (b), (n))
+#define __do_outsb(p, b, n)	writesb(_IO_PORT(p),(b),(n))
+#define __do_outsw(p, b, n)	writesw(_IO_PORT(p),(b),(n))
+#define __do_outsl(p, b, n)	writesl(_IO_PORT(p),(b),(n))
 
 #ifdef CONFIG_EEH
 #define __do_memcpy_fromio(dst, src, n)	\
-- 
2.47.1


