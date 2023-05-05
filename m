Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F08FA6F7BAE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 05:52:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCGwj6S1Jz3fDj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 13:52:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YGAKJi/h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCGvs3p5Mz2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 13:51:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YGAKJi/h;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QCGvr1fKVz4x3g;
	Fri,  5 May 2023 13:51:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1683258712;
	bh=mVhP5af+O4pwjB4DNxiBtegJzD+t5vqxTNie3cd58II=;
	h=From:To:Cc:Subject:Date:From;
	b=YGAKJi/haN+xysLJd5BAil8L/L/+hwaBEmRB9E8upgP9LF0JoWDnkPvsu8h2VRrPE
	 XnBegrFs6ewtA32QyJVeomyJvhhp9Ob8K3vFyil5OLtRNydWprDwoglTClkI/soP/w
	 Bmppa8JvSFoqn05S04yL487C7wqFfFXN/NgLd1OKZQErGhk8IeUIoKHit5ZzcB0EB3
	 NrRMnLlI23zd77LEisLdrRgnePMZd9j9q72bteCPqXESFDlkNk0ertVWfis6wgTk1r
	 S0Hk8dHXLfc8LPhSyJOaJ2uHhr92Y/rSETFn+dr36EgrSPn2Dgi3nlS0utee6kHm74
	 Nrxjn2rmFcaUg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: glider@google.com,
	elver@google.com,
	<akpm@linux-foundation.org>,
	zhangpeng.00@bytedance.com
Subject: [PATCH] mm: kfence: Fix false positives on big endian
Date: Fri,  5 May 2023 13:51:27 +1000
Message-Id: <20230505035127.195387-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.40.1
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit 1ba3cbf3ec3b ("mm: kfence: improve the performance of
__kfence_alloc() and __kfence_free()"), kfence reports failures in
random places at boot on big endian machines.

The problem is that the new KFENCE_CANARY_PATTERN_U64 encodes the
address of each byte in its value, so it needs to be byte swapped on big
endian machines.

The compiler is smart enough to do the le64_to_cpu() at compile time, so
there is no runtime overhead.

Fixes: 1ba3cbf3ec3b ("mm: kfence: improve the performance of __kfence_alloc() and __kfence_free()")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 mm/kfence/kfence.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/kfence/kfence.h b/mm/kfence/kfence.h
index 2aafc46a4aaf..392fb273e7bd 100644
--- a/mm/kfence/kfence.h
+++ b/mm/kfence/kfence.h
@@ -29,7 +29,7 @@
  * canary of every 8 bytes is the same. 64-bit memory can be filled and checked
  * at a time instead of byte by byte to improve performance.
  */
-#define KFENCE_CANARY_PATTERN_U64 ((u64)0xaaaaaaaaaaaaaaaa ^ (u64)(0x0706050403020100))
+#define KFENCE_CANARY_PATTERN_U64 ((u64)0xaaaaaaaaaaaaaaaa ^ (u64)(le64_to_cpu(0x0706050403020100)))
 
 /* Maximum stack depth for reports. */
 #define KFENCE_STACK_DEPTH 64
-- 
2.40.1

