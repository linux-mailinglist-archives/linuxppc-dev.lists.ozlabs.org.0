Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2358A366B51
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 14:54:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQL9q0mv7z30BP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 22:54:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lNUNMmi7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=lNUNMmi7; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQL906b7bz2y6C
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 22:54:12 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FQL8y1flTz9sjJ; Wed, 21 Apr 2021 22:54:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1619009650;
 bh=6cIFyphky6rR2z9zAMe/Lia36NTbG3iJv907gzjueI8=;
 h=From:To:Cc:Subject:Date:From;
 b=lNUNMmi796D3JkiKuKK7Si6H0GL0JJzhGNcMuvtMJvPRbSGqzbtOHCo0pDz3RDgvG
 SKlfdEd13TF+Uf82mYQ5S5iEnIZW2JEWo+r/CIra9IiUQZMF6aJbUXZMyokkVAE5wy
 Cj2wqarRuFIit8ywxyoUSKrWKBE+IqFCFW45bwO9QKVuWDc7sk0Qdh2YKEDJk+i7aM
 3iQgEyPz0oMvSdIZECb0kJTcS75p4Q7syerNOOPWVPylFLJ3WlU/+ko9lZMF1IRTSU
 8Y6cDkSluitwyipa2CkgYbz15jp/S5uBlKVXctc9Qnt/cTa/EE1T5jy5Ol0jPTnJsY
 oXJoC+jaQ3uuA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/fadump: Fix sparse warnings
Date: Wed, 21 Apr 2021 22:54:01 +1000
Message-Id: <20210421125402.1955013-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Cc: hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sparse says:
  arch/powerpc/kernel/fadump.c:48:16: warning: symbol 'fadump_kobj' was not declared. Should it be static?
  arch/powerpc/kernel/fadump.c:55:27: warning: symbol 'crash_mrange_info' was not declared. Should it be static?
  arch/powerpc/kernel/fadump.c:61:27: warning: symbol 'reserved_mrange_info' was not declared. Should it be static?
  arch/powerpc/kernel/fadump.c:83:12: warning: symbol 'fadump_cma_init' was not declared. Should it be static?

And indeed none of them are used outside this file, they can all be made
static. Also fadump_kobj needs to be moved inside the ifdef where it's
used.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/fadump.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 000e3b7f3fca..b990075285f5 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -45,22 +45,21 @@ static struct fw_dump fw_dump;
 
 static void __init fadump_reserve_crash_area(u64 base);
 
-struct kobject *fadump_kobj;
-
 #ifndef CONFIG_PRESERVE_FA_DUMP
 
+static struct kobject *fadump_kobj;
+
 static atomic_t cpus_in_fadump;
 static DEFINE_MUTEX(fadump_mutex);
 
-struct fadump_mrange_info crash_mrange_info = { "crash", NULL, 0, 0, 0, false };
+static struct fadump_mrange_info crash_mrange_info = { "crash", NULL, 0, 0, 0, false };
 
 #define RESERVED_RNGS_SZ	16384 /* 16K - 128 entries */
 #define RESERVED_RNGS_CNT	(RESERVED_RNGS_SZ / \
 				 sizeof(struct fadump_memory_range))
 static struct fadump_memory_range rngs[RESERVED_RNGS_CNT];
-struct fadump_mrange_info reserved_mrange_info = { "reserved", rngs,
-						   RESERVED_RNGS_SZ, 0,
-						   RESERVED_RNGS_CNT, true };
+static struct fadump_mrange_info
+reserved_mrange_info = { "reserved", rngs, RESERVED_RNGS_SZ, 0, RESERVED_RNGS_CNT, true };
 
 static void __init early_init_dt_scan_reserved_ranges(unsigned long node);
 
@@ -80,7 +79,7 @@ static struct cma *fadump_cma;
  * But for some reason even if it fails we still have the memory reservation
  * with us and we can still continue doing fadump.
  */
-int __init fadump_cma_init(void)
+static int __init fadump_cma_init(void)
 {
 	unsigned long long base, size;
 	int rc;
-- 
2.25.1

