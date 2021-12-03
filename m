Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CDE467794
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 13:41:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J5CBQ4YpPz304j
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 23:41:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YUqgyVMK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J5C9q0Wkdz2yP3
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Dec 2021 23:41:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=YUqgyVMK; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J5C9p2CMYz4xcB;
 Fri,  3 Dec 2021 23:41:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1638535278;
 bh=wZqkehbaUBbKFTds6K0Dc8aARZno9NAyRgPmB2UGgIk=;
 h=From:To:Cc:Subject:Date:From;
 b=YUqgyVMKD7QyJQB3Vvks/BFwPB3SAXUvvJmMr139kNTqhSOB3TX/UKkHtzv2MhQ4N
 3yuqyMCsoRP3YZQ95txpu92ZgoiIgn/fCb4OGvqILCPDFEzRtk04y8llPqSeHfcbOP
 4k43gf/o+M5yUuWPM6sXjK1jgoNIOW5kwLMB+jFkKDheAbdw0CDAv5OgkxnlAkao0+
 +vUjLJ7PK/DJ8Co//L1vYWkevhOrbz+24KFsM36Kpqm7t5AZ1boVGutgVb/DU7yWCp
 Hq06BAIL344Erv2fV1qNwgZAr7BfwjUQr8nJWTkrfVxjTZDOe3eDBBM8ShTaekEV99
 R2/AskKBiAY4Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/ptdump: Fix DEBUG_WX since generic ptdump conversion
Date: Fri,  3 Dec 2021 23:41:12 +1100
Message-Id: <20211203124112.2912562-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.31.1
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

In note_prot_wx() we bail out without reporting anything if
CONFIG_PPC_DEBUG_WX is disabled.

But CONFIG_PPC_DEBUG_WX was removed in the conversion to generic ptdump,
we now need to use CONFIG_DEBUG_WX instead.

Fixes: e084728393a5 ("powerpc/ptdump: Convert powerpc to GENERIC_PTDUMP")
Cc: stable@vger.kernel.org # v5.15+
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/mm/ptdump/ptdump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index 031956d0ee84..be120e09aa3e 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -183,7 +183,7 @@ static void note_prot_wx(struct pg_state *st, unsigned long addr)
 {
 	pte_t pte = __pte(st->current_flags);
 
-	if (!IS_ENABLED(CONFIG_PPC_DEBUG_WX) || !st->check_wx)
+	if (!IS_ENABLED(CONFIG_DEBUG_WX) || !st->check_wx)
 		return;
 
 	if (!pte_write(pte) || !pte_exec(pte))
-- 
2.31.1

