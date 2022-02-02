Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F13174A6B7F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 06:31:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpVlX5Gbhz3cGq
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 16:31:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hKREiWGx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2404:9400:2221:ea00::3;
 helo=gandalf.ozlabs.org; envelope-from=michael@ellerman.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=hKREiWGx; 
 dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JpVkt6KHnz2yg5
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Feb 2022 16:30:45 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JpVkr41tMz4xNm;
 Wed,  2 Feb 2022 16:30:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1643779845;
 bh=5p/N1C/UQRPwh66WGVyOjoYt8fI253nWVH+fnIcpwXY=;
 h=From:To:Cc:Subject:Date:From;
 b=hKREiWGx542YLQSjxQx/OoGglDDstSON5pu/0AfZY/vmq8B0GTApYUoLSyEmEhC73
 dSUH6s1A3ZbC3r+L0lYg2Y/BfJvQTZzz7Q1WggWWg37B0uybDBGMrrGy5dK9KXTYLw
 FXP9qLa3ZGe9tqgIOKEdSW0CdT2LcdCVxZyCZp62L4uRlG8y+R0rowZUu2C+h/38AD
 tw6GWDJavjpn1Os6TQkUQ86hHcU5p8HcnUNio3W6nTNfWI2aHzZQcjFf6shsT8DstI
 VAEso3JSaMBaMYl4sSYNSDksoozLktAxKicmSG/TSOuqKwR7/XAd9s/on8gpBqaDm5
 wL5whEAh6U4VA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2] powerpc/ptdump: Fix sparse warning in hashpagetable.c
Date: Wed,  2 Feb 2022 16:30:39 +1100
Message-Id: <20220202053039.691917-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.34.1
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

As reported by sparse:

  arch/powerpc/mm/ptdump/hashpagetable.c:264:29: warning: restricted __be64 degrades to integer
  arch/powerpc/mm/ptdump/hashpagetable.c:265:49: warning: restricted __be64 degrades to integer
  arch/powerpc/mm/ptdump/hashpagetable.c:267:36: warning: incorrect type in assignment (different base types)
  arch/powerpc/mm/ptdump/hashpagetable.c:267:36:    expected unsigned long long [usertype]
  arch/powerpc/mm/ptdump/hashpagetable.c:267:36:    got restricted __be64 [usertype] v
  arch/powerpc/mm/ptdump/hashpagetable.c:268:36: warning: incorrect type in assignment (different base types)
  arch/powerpc/mm/ptdump/hashpagetable.c:268:36:    expected unsigned long long [usertype]
  arch/powerpc/mm/ptdump/hashpagetable.c:268:36:    got restricted __be64 [usertype] r

The values returned by plpar_pte_read_4() are CPU endian, not __be64, so
assigning them to struct hash_pte confuses sparse. As a minimal fix open
code a struct to hold the values with CPU endian types.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/mm/ptdump/hashpagetable.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

v2: Don't use struct hash_pte at all.

Replaces v1 http://patchwork.ozlabs.org/project/linuxppc-dev/patch/bbc196451dd34521d239023ccca488db35b8fff1.1643567900.git.christophe.leroy@csgroup.eu/

diff --git a/arch/powerpc/mm/ptdump/hashpagetable.c b/arch/powerpc/mm/ptdump/hashpagetable.c
index c7f824d294b2..9a601587836b 100644
--- a/arch/powerpc/mm/ptdump/hashpagetable.c
+++ b/arch/powerpc/mm/ptdump/hashpagetable.c
@@ -238,7 +238,10 @@ static int native_find(unsigned long ea, int psize, bool primary, u64 *v, u64
 
 static int pseries_find(unsigned long ea, int psize, bool primary, u64 *v, u64 *r)
 {
-	struct hash_pte ptes[4];
+	struct {
+		unsigned long v;
+		unsigned long r;
+	} ptes[4];
 	unsigned long vsid, vpn, hash, hpte_group, want_v;
 	int i, j, ssize = mmu_kernel_ssize;
 	long lpar_rc = 0;
-- 
2.34.1

