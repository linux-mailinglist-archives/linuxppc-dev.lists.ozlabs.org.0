Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFFA4F6278
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 17:00:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYSPC2gByz3cF8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 01:00:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=COlHZyqM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYSLl0hyFz2yZC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 00:58:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=COlHZyqM; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KYSLk6hGdz4xc1;
 Thu,  7 Apr 2022 00:58:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1649257103;
 bh=WbwuAKkkQCUKq97bb+KyPu2VfskCfOG023PqBtkcMls=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=COlHZyqMwBp0c6RlAvpfJHwOGMH9iO9y+fC7FswwccgUEGFGrsAxk+cnohVSuFfzi
 VPfDU1YsXhS7sMVj1jLJFm/n4sUxWCFhB4v96QG4sxfW6IHEW1BezNxM0Qr2e1c79J
 +pqjmhvE18UQmNqPfRhcEHb0Ni6QAUrDC/4dWbhg9Kn9hqm13xAelN1iLOOkUi15pT
 GnBJ7WooCJa1ofgvAgeeYz2yRVhpVb2+YP4ZggTWt9VqIbo4sU3qgxYC+UoW/4eq0J
 7ZwGF9PnpK+QXh/ixSawqY7VAUvw92V1daUApyVXvkDTAmD0THyZsqZBf0f9P1vgUs
 gnEErKZR5D3Kg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 5/6] powerpc/64: Only WARN if __pa()/__va() called with bad
 addresses
Date: Thu,  7 Apr 2022 00:58:01 +1000
Message-Id: <20220406145802.538416-5-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220406145802.538416-1-mpe@ellerman.id.au>
References: <20220406145802.538416-1-mpe@ellerman.id.au>
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
Cc: erhard_f@mailbox.org, wangkefeng.wang@huawei.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We added checks to __pa() / __va() to ensure they're only called with
appropriate addresses. But using BUG_ON() is too strong, it means
virt_addr_valid() will BUG when DEBUG_VIRTUAL is enabled.

Instead switch them to warnings, arm64 does the same.

Fixes: 4dd7554a6456 ("powerpc/64: Add VIRTUAL_BUG_ON checks for __va and __pa addresses")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/page.h | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
index f2c5c26869f1..40a27a56ee40 100644
--- a/arch/powerpc/include/asm/page.h
+++ b/arch/powerpc/include/asm/page.h
@@ -216,6 +216,12 @@ static inline bool pfn_valid(unsigned long pfn)
 #define __pa(x) ((phys_addr_t)(unsigned long)(x) - VIRT_PHYS_OFFSET)
 #else
 #ifdef CONFIG_PPC64
+
+#ifdef CONFIG_DEBUG_VIRTUAL
+#define VIRTUAL_WARN_ON(x)	WARN_ON(x)
+#else
+#define VIRTUAL_WARN_ON(x)
+#endif
 /*
  * gcc miscompiles (unsigned long)(&static_var) - PAGE_OFFSET
  * with -mcmodel=medium, so we use & and | instead of - and + on 64-bit.
@@ -223,13 +229,13 @@ static inline bool pfn_valid(unsigned long pfn)
  */
 #define __va(x)								\
 ({									\
-	VIRTUAL_BUG_ON((unsigned long)(x) >= PAGE_OFFSET);		\
+	VIRTUAL_WARN_ON((unsigned long)(x) >= PAGE_OFFSET);		\
 	(void *)(unsigned long)((phys_addr_t)(x) | PAGE_OFFSET);	\
 })
 
 #define __pa(x)								\
 ({									\
-	VIRTUAL_BUG_ON((unsigned long)(x) < PAGE_OFFSET);		\
+	VIRTUAL_WARN_ON((unsigned long)(x) < PAGE_OFFSET);		\
 	(unsigned long)(x) & 0x0fffffffffffffffUL;			\
 })
 
-- 
2.34.1

