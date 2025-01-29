Return-Path: <linuxppc-dev+bounces-5675-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A616A21A33
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 10:45:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yjchq60dcz30Ss;
	Wed, 29 Jan 2025 20:45:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.51 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738143931;
	cv=pass; b=XnTq0nwgKROQ67HVn2OtMzy0rAz10qk+fuqp3qGb64a1OCDO6hFJzli5AC6+5VuwOlPrEe2+A6BPQNBactvOVVM2Uc9rdvnKj7svEz2E8CoeqWk3sot5n7ovnvc77CLxDkDJdXu0fl6qfKw+IzwOPszdBk4s+OGx0xYXoCJTm9eIyF3jeAh3KC6Y0QdXUnyR7grQVfezSBc9GpyJhUHAElvK4umQQwrdqYoMB25Moe6DB3Q2ujLcsK2Yx+APlCgpR4yunuICSQWGiJ1BASn3SfsuQRlqO1pU/MAO1qb0uj5SZ98yOdS04MNGJgb7gU02cis6JVBLmBFiwB3syAMGkg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738143931; c=relaxed/relaxed;
	bh=3b+Zqr6HieW55Jt4gOhnbTAk0MRxpyqhi78YbnYzbqM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ewY3Pr3BaqOBh5awWkmbG6CBvTPOklNPxETRK8atV/1lejTA2fsTCE9DQO97M3ZWf1hN84y+ZjzbVzIuExt8Rl7XBi8D0fR1VfDklW7umQ7oD25dk1nzvBXyvSbU9FfauNofPkNcBV2BxC+bO6Mq6Ma3j7idwun4vCiQH3qPoRYhfeKrKISzInJDIGhsaK4lc51WwzMqbSgCamqJRbFklqTUlZhr9P4UMHc1zrBKKrDAgpgid8l6eu1e7dVJzscazt8IByMQdA/CouGz5XHCkyZ/r8NHGs6BQNY58wdufHRioHFTiTgBhTgnraTO32lmmCfVQWQvD0zx5dOlFS8xUw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=outer-limits.org; dkim=pass (2048-bit key; unprotected) header.d=outer-limits.org header.i=@outer-limits.org header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=aaTlBvrQ; dkim=pass header.d=outer-limits.org header.i=@outer-limits.org header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=crkXNF/X; dkim-atps=neutral; spf=pass (client-ip=85.215.255.51; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=julian@outer-limits.org; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=outer-limits.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outer-limits.org header.i=@outer-limits.org header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=aaTlBvrQ;
	dkim=pass header.d=outer-limits.org header.i=@outer-limits.org header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=crkXNF/X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.51; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=julian@outer-limits.org; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yjchm3gvRz30Q3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 20:45:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1738143917; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=DAwyRj3+axJ97RcksMS6tBXFfDVf9TO7ptOyzOc/eGXqjbIYX9B3uUIiaEhA67jcj6
    K0+KT/clkppF7Hl7qSnREiRx1ByobEmbSYOCFtNfdLjp0+jvTB6T4wLjyMG4yOTIiUGv
    TrPis/x9xgKn05ZimjuUfReIAeoDXhZHB1y+VjZfHeTQyY/nBTLlhUV6YUcmKtKdOIw7
    VSgluCT8JkpY/DHnytrOB1vgktN6amXAUOL1TuiycyaoIIMic0pgw4+7hn2EVzKWMdr8
    GBb5qud/joLHlyFjok16msR6mABC5qhjFChSSgDLwn9tZqjbuE0EbxMmhEZL1W5Svl8q
    xHiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1738143917;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=3b+Zqr6HieW55Jt4gOhnbTAk0MRxpyqhi78YbnYzbqM=;
    b=kRp3bKb2b3b3LGDH3CKf8wd2nQm/RASWRovTMTExJEn30fqhLtxwpwDk7KRzu41h7B
    j+/l7Ae94TMoer/hBwL0K9vsQtsBgWMy8Sug2E2Ddg2DbF70S5XOajaeiZBIjhtKU5vE
    CwG5DRAVfgKwVB04Sa0pcQg4h86CuRuzB2jh9JwmudGjN7yfzGS89nK4SBFdxv24KxyT
    VTF+2LN45w0b3mEjWona7Jzjo8jvrA3vb6GVr2mtRGJfSYEExsnpICnWMbn9QHmLL6gU
    W3DA0hAXd/BvegVGtxsobtI/qR+DGlp86YS056n2DXqKQ/NWm8r/XopvsDD9P2EqZT7g
    mkUg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1738143917;
    s=strato-dkim-0002; d=outer-limits.org;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=3b+Zqr6HieW55Jt4gOhnbTAk0MRxpyqhi78YbnYzbqM=;
    b=aaTlBvrQwo4+2Hzk6pZLuKjKa0KOUtHfDPeetbFQc1SnIVDNZj9JjuV9BKK6M14qJn
    IvaD3whgyXDRAn7gSIF14ZmEdwMVJBiBBcx2DMEIT9cjUUhWLuTb33XRVgiSkO67kHH3
    CHVrxIIFhmqN9l/amy5eKNk/USxnWOb8qNK3MJELObgY0StmZtBnXVUHZ77GNEaCGCBz
    2TDvdX6pTzkuTKWkutip4g9pOQ347IlIOyGvZh/33wtsnal8Tq8ZrGdQ93baAObcH6aZ
    crcPDhwX2lup+cTUCfjdTOlol5sIqILOyrQhpdOnOhgfdt7HqQsZyE/THZgQ0wOnZ9AJ
    onxw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1738143917;
    s=strato-dkim-0003; d=outer-limits.org;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=3b+Zqr6HieW55Jt4gOhnbTAk0MRxpyqhi78YbnYzbqM=;
    b=crkXNF/XMrarDkT/I6lTIAz/7UiwAxjaWX84nnKMy8pZkrhQcEZJHmrvetsMSJl7lW
    EbNB/ZPhQokiHFvBrqAA==
X-RZG-AUTH: ":JnkIfEGmW/AMJS6HttH4FbRVwc4dHlPLCp4e/IoHo8zEMMHAgwTfqBEHcVJSv9P5mRTGd2ImeA=="
Received: from ws2104.lan.kalrayinc.com
    by smtp.strato.de (RZmta 51.2.17 AUTH)
    with ESMTPSA id J1a25110T9jGEM2
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 29 Jan 2025 10:45:16 +0100 (CET)
From: Julian Vetter <julian@outer-limits.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Julian Vetter <julian@outer-limits.org>
Subject: [PATCH v2] powerpc: Remove eieio() in PowerPC IO functions
Date: Wed, 29 Jan 2025 10:45:10 +0100
Message-Id: <20250129094510.2038339-1-julian@outer-limits.org>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=2.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
	TVD_SUBJ_WIPE_DEBT autolearn=disabled version=4.0.0
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Remove the eieio() calls in IO functions for PowerPC. While other
architectures permit prefetching, combining, and reordering, the eieio()
calls on PowerPC prevent such optimizations. This has only historical
reasons, because in the early arch/powerpc64 code also readl() had these
eieio() calls, but later went through several iterations which
subsequently removed them. While the _memcpy_fromio and ins{b,l,w}
functions stayed with the old implementation.

Signed-off-by: Julian Vetter <julian@outer-limits.org>
---
Changes for v2:
- Removed eieio() calls also from other functions in io.c
- Rephrased commit message
---
 arch/powerpc/kernel/io.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/powerpc/kernel/io.c b/arch/powerpc/kernel/io.c
index 6af535905984..d643ec4a201d 100644
--- a/arch/powerpc/kernel/io.c
+++ b/arch/powerpc/kernel/io.c
@@ -34,7 +34,6 @@ void _insb(const volatile u8 __iomem *port, void *buf, long count)
 	asm volatile("sync");
 	do {
 		tmp = *(const volatile u8 __force *)port;
-		eieio();
 		*tbuf++ = tmp;
 	} while (--count != 0);
 	asm volatile("twi 0,%0,0; isync" : : "r" (tmp));
@@ -65,7 +64,6 @@ void _insw_ns(const volatile u16 __iomem *port, void *buf, long count)
 	asm volatile("sync");
 	do {
 		tmp = *(const volatile u16 __force *)port;
-		eieio();
 		*tbuf++ = tmp;
 	} while (--count != 0);
 	asm volatile("twi 0,%0,0; isync" : : "r" (tmp));
@@ -96,7 +94,6 @@ void _insl_ns(const volatile u32 __iomem *port, void *buf, long count)
 	asm volatile("sync");
 	do {
 		tmp = *(const volatile u32 __force *)port;
-		eieio();
 		*tbuf++ = tmp;
 	} while (--count != 0);
 	asm volatile("twi 0,%0,0; isync" : : "r" (tmp));
@@ -155,21 +152,18 @@ void _memcpy_fromio(void *dest, const volatile void __iomem *src,
 	__asm__ __volatile__ ("sync" : : : "memory");
 	while(n && (!IO_CHECK_ALIGN(vsrc, 4) || !IO_CHECK_ALIGN(dest, 4))) {
 		*((u8 *)dest) = *((volatile u8 *)vsrc);
-		eieio();
 		vsrc++;
 		dest++;
 		n--;
 	}
 	while(n >= 4) {
 		*((u32 *)dest) = *((volatile u32 *)vsrc);
-		eieio();
 		vsrc += 4;
 		dest += 4;
 		n -= 4;
 	}
 	while(n) {
 		*((u8 *)dest) = *((volatile u8 *)vsrc);
-		eieio();
 		vsrc++;
 		dest++;
 		n--;
-- 
2.34.1


