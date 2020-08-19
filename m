Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F68D2492C3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 04:08:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWWRB3nH9zDqsJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 12:08:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWWBS2KKVzDqs2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 11:57:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=hH0pJ4hL; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BWWBP571rz9sTY; Wed, 19 Aug 2020 11:57:33 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BWWBP2kxxz9sTb; Wed, 19 Aug 2020 11:57:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1597802253;
 bh=NWp++mTYkXp0tE1+p9tp8AqqoGeZT5IFX/KQElOYqTA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=hH0pJ4hLhpwfZqJipCJcAX7peT9LTwPS5DI5VD4qxFRebeF1Ujfx2KW6jUDYfscox
 9eYekcDA+7QMAeW1VTCqtMRKu8dxQXV3/ETQZx09A6v7+Bk/Iy/7Wk+sy78PvVhsvn
 qBPYSpvBug3pRfUyfBkPexd9akmXhl4vBkdhZivycP5evb+yE1PuTAlgsfNGpnZwho
 5WLyMuUBlozh02fn3owufKVPlLUAvE1J9MUdpKCKBO8UOESR//Vgnv53+Qk3fVEuTP
 4ZRN1VJ3b0iDBk8pKcG01DrT14jCaJpnWrsfTr/TqXVKv/40rpmnnO4ygrC/SZjjDQ
 i79ZCuJOXB/mg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 2/9] selftests/powerpc: Give the bad_accesses test longer to
 run
Date: Wed, 19 Aug 2020 11:57:20 +1000
Message-Id: <20200819015727.1977134-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200819015727.1977134-1-mpe@ellerman.id.au>
References: <20200819015727.1977134-1-mpe@ellerman.id.au>
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

On older systems this test takes longer to run (duh), give it five
minutes which is long enough on a G5 970FX @ 1.6GHz.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/mm/bad_accesses.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/powerpc/mm/bad_accesses.c b/tools/testing/selftests/powerpc/mm/bad_accesses.c
index a864ed7e2008..fd747b2ffcfc 100644
--- a/tools/testing/selftests/powerpc/mm/bad_accesses.c
+++ b/tools/testing/selftests/powerpc/mm/bad_accesses.c
@@ -139,5 +139,6 @@ static int test(void)
 
 int main(void)
 {
+	test_harness_set_timeout(300);
 	return test_harness(test, "bad_accesses");
 }
-- 
2.25.1

