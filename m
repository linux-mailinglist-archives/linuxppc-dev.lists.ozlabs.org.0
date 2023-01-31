Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F33682B3E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 12:15:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5jBf1BKkz3cKb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 22:15:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YbExYnhL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5j9l3mXbz2xb4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 22:14:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YbExYnhL;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P5j9l0RGYz4x1d;
	Tue, 31 Jan 2023 22:14:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1675163659;
	bh=u10KL6Lbe9IIB6RTDvEAXbslJODF5FdCOAsg4qftjks=;
	h=From:To:Cc:Subject:Date:From;
	b=YbExYnhLnwGB0eGWNpEE2GQ+ileOCp1GLBxK+A89c/3uyCnWeTdWjvFhZVz4TN0xr
	 4R/fmYX0j8s3tD4kBfkndDNHdzig3HKwainOFVZjHuHm2i9VKIUFRewCteLzUNOoMF
	 Ms5zF9hh5+8BBzV3MCw3lWKkLsT3uCyywX/+7PiTkp4fwAovnfAZwzG+MMLHeDDXN3
	 K96D2OdO0CukMN8L0PYh/N0zCZWCOgwnUp2AT5AnpA1V0AJK11zS4+5NlZy5bJXxHi
	 9+t3+EDEMFbM0+VFieNvTNJ81w42k/4v7ATWI+X9v6Smx9aMtiOivY8bC2YteP65xZ
	 0Kqbb3KZVpJig==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/64s: Reconnect tlb_flush() to hash__tlb_flush()
Date: Tue, 31 Jan 2023 22:14:07 +1100
Message-Id: <20230131111407.806770-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.1
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
Cc: aneesh.kumar@linux.ibm.com, npiggin@gmail.com, bgray@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit baf1ed24b27d ("powerpc/mm: Remove empty hash__ functions")
removed some empty hash MMU flushing routines, but got a bit overeager
and also removed the call to hash__tlb_flush() from tlb_flush().

In regular use this doesn't lead to any noticable breakage, which is a
little concerning. Presumably there are flushes happening via other
paths such as arch_leave_lazy_mmu_mode(), and/or a bit of luck.

Fix it by reinstating the call to hash__tlb_flush().

Fixes: baf1ed24b27d ("powerpc/mm: Remove empty hash__ functions")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/book3s/64/tlbflush.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
index dd39313242b4..d5cd16270c5d 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
@@ -97,6 +97,8 @@ static inline void tlb_flush(struct mmu_gather *tlb)
 {
 	if (radix_enabled())
 		radix__tlb_flush(tlb);
+
+	return hash__tlb_flush(tlb);
 }
 
 #ifdef CONFIG_SMP
-- 
2.39.1

