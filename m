Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EC24F627A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 17:01:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYSQW738Hz3cdj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 01:01:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Z8txxhEv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYSLl4LxPz2ygC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 00:58:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Z8txxhEv; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KYSLj2hp0z4xXv;
 Thu,  7 Apr 2022 00:58:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1649257101;
 bh=l1F6SOvDeL3rrYvrYSjuzbBG5ScJxZ4IB5Bv/jtGkPs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z8txxhEvMonV5FcCsY8IXKPUN0yITma4bFyvmr3F4tY5pJUAl8rgXT+T+k/WJ/+ru
 7xWmEz0Nh3YZ8tmrK74ua6VQmkIPEdQF3Qon/CYZdVFdbkwoayPbDYSddHLdXKlfmG
 8vf4ZZtWVS6NYSyGgnrxsq0cH5g5cTskkiJIXLoDY9nqrEb96Y+AvwvMzZt+HBUvyP
 wI6mwjQnm41EuBMKK4vDnmVtfgmZlGs2QVgROg/awbGdoVRQYLbF4UipOtyGoU+Fh9
 EbYA+ei+0VgM3ouPRfBa/X3h9o85ZdZV/D4LXsGUN+qvpF9hq6xskrxI9IUcFs4TJA
 AuBfMaiRVu7sg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/6] Revert "powerpc: Set max_mapnr correctly"
Date: Thu,  7 Apr 2022 00:57:58 +1000
Message-Id: <20220406145802.538416-2-mpe@ellerman.id.au>
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

From: Kefeng Wang <wangkefeng.wang@huawei.com>

This reverts commit 602946ec2f90d5bd965857753880db29d2d9a1e9.

If CONFIG_HIGHMEM is enabled, no highmem will be added with max_mapnr
set to max_low_pfn, see mem_init():

  for (pfn = highmem_mapnr; pfn < max_mapnr; ++pfn) {
        ...
        free_highmem_page();
  }

Now that virt_addr_valid() has been fixed in the previous commit, we can
revert the change to max_mapnr.

Fixes: 602946ec2f90 ("powerpc: Set max_mapnr correctly")
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reported-by: Erhard F. <erhard_f@mailbox.org>
[mpe: Update change log to reflect series reordering]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/mm/mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 8e301cd8925b..4d221d033804 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -255,7 +255,7 @@ void __init mem_init(void)
 #endif
 
 	high_memory = (void *) __va(max_low_pfn * PAGE_SIZE);
-	set_max_mapnr(max_low_pfn);
+	set_max_mapnr(max_pfn);
 
 	kasan_late_init();
 
-- 
2.34.1

