Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A455734F586
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 02:39:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F96rc4Zw3z3c20
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 11:39:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=H+Wpo8CV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=H+Wpo8CV; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F96rC2fKzz2xxh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 11:38:50 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F96rB5WTQz9sWK; Wed, 31 Mar 2021 11:38:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1617151130;
 bh=eGcuo+SD2AvVHdYRAA0vthZg4dPZ8I+d8e7qIwbiN9Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=H+Wpo8CVQTOheZYCOoj1uxCMQ7MKIEU3mCxaaJnS81h4bozc4yBO1v8C2laSvONIJ
 6vjNXhBUmI9eCf/CiVNoSRg1avyggry9zGRsW/l2RhbdbYqyQFXi1lwVmZYz8leM7M
 5eG3iGtJSmSybHuQ2vYEwIbVAgnaTdbR+cLSzSW4eXfwpTs2IDivjYXcJGcNfvHLmT
 hHuBuyZmFbP1wJ25YrEHJInUXYIIkkH/Pn7bHXloXrJ2NK5K8TCgx2KeT7R3eD/V27
 cjJgV51QP3PUBzMJjS5XHERb0+Oyu2fQrnmhTfugaMxFgX2ySA2KrMhOlDomgn5//L
 s/K0Pg+xB3/Aw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/6] powerpc/64s: Use htab_convert_pte_flags() in
 hash__mark_rodata_ro()
Date: Wed, 31 Mar 2021 11:38:42 +1100
Message-Id: <20210331003845.216246-3-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210331003845.216246-1-mpe@ellerman.id.au>
References: <20210331003845.216246-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In hash__mark_rodata_ro() we pass the raw PP_RXXX value to
hash__change_memory_range(). That has the effect of setting the key to
zero, because PP_RXXX contains no key value.

Fix it by using htab_convert_pte_flags(), which knows how to convert a
pgprot into a pp value, including the key.

Fixes: d94b827e89dc ("powerpc/book3s64/kuap: Use Key 3 for kernel mapping with hash translation")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Reviewed-by: Daniel Axtens <dja@axtens.net>
---
 arch/powerpc/mm/book3s64/hash_pgtable.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

v2: Unchanged.

diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
index 567e0c6b3978..03819c259f0a 100644
--- a/arch/powerpc/mm/book3s64/hash_pgtable.c
+++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
@@ -428,12 +428,14 @@ static bool hash__change_memory_range(unsigned long start, unsigned long end,
 
 void hash__mark_rodata_ro(void)
 {
-	unsigned long start, end;
+	unsigned long start, end, pp;
 
 	start = (unsigned long)_stext;
 	end = (unsigned long)__init_begin;
 
-	WARN_ON(!hash__change_memory_range(start, end, PP_RXXX));
+	pp = htab_convert_pte_flags(pgprot_val(PAGE_KERNEL_ROX), HPTE_USE_KERNEL_KEY);
+
+	WARN_ON(!hash__change_memory_range(start, end, pp));
 }
 
 void hash__mark_initmem_nx(void)
-- 
2.25.1

