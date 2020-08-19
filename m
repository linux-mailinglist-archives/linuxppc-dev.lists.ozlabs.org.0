Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C692B2492C2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 04:07:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWWPJ3jn6zDqvn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 12:07:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWWBP67LtzDqtl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 11:57:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=kyvQjNix; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BWWBP0Tkgz9sPC; Wed, 19 Aug 2020 11:57:33 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BWWBN5xJkz9sPf; Wed, 19 Aug 2020 11:57:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1597802252;
 bh=dAbpUDZqLRxGxE6Jo7rd4usvWi/gU3C7mr2WBf82cq4=;
 h=From:To:Subject:Date:From;
 b=kyvQjNixdja12uwh6v2Q90vPPMWpXeViWlbNW2j6wk+ZoXKs2KbS5Vn5pvBbxGDRI
 qHuITCEKQScPJQ1fUS8YD/Mz2pdXF+OP2uuyI07VVl8VTYbnxdFh/SfVtIue86GMZb
 CBytyDDJFvijVh68gh4ZgDixbrC4PD5kCke+lXjvqAztMgP8jlT87zflnaOf36oQyt
 Ve95iRjowT63YqhMxfuyDT1Ia5RQve40ovEUqE+NGQG+IXijlCUDa82lsEktwB1k1w
 Q3hkajCXU3k6HFLoH41pQ6Xzn1QDgkfckTP+NVvOj6yfoPWj/7i+SOC8qPIp8fULJv
 3xmpP9NFlOGXg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 1/9] selftests/powerpc: Make using_hash_mmu() work on Cell &
 PowerMac
Date: Wed, 19 Aug 2020 11:57:19 +1000
Message-Id: <20200819015727.1977134-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These platforms don't show the MMU in /proc/cpuinfo, but they always
use hash, so teach using_hash_mmu() that.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/utils.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/utils.c b/tools/testing/selftests/powerpc/utils.c
index 18b6a773d5c7..638ffacc90aa 100644
--- a/tools/testing/selftests/powerpc/utils.c
+++ b/tools/testing/selftests/powerpc/utils.c
@@ -318,7 +318,9 @@ int using_hash_mmu(bool *using_hash)
 
 	rc = 0;
 	while (fgets(line, sizeof(line), f) != NULL) {
-		if (strcmp(line, "MMU		: Hash\n") == 0) {
+		if (!strcmp(line, "MMU		: Hash\n") ||
+		    !strcmp(line, "platform	: Cell\n") ||
+		    !strcmp(line, "platform	: PowerMac\n")) {
 			*using_hash = true;
 			goto out;
 		}
-- 
2.25.1

