Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE06D243226
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 03:39:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRq4h6nl8zDqY7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 11:39:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRpyx4sBFzDqWx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Aug 2020 11:34:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=qjX031hh; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BRpyx48ZBz9sTT; Thu, 13 Aug 2020 11:34:49 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BRpyx3Twxz9sTX; Thu, 13 Aug 2020 11:34:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1597282489;
 bh=2DnB/T1B0Oft3uTgbEqnQ8C6NSNgM8LJFmObC3+A/eE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qjX031hhrXGLQFAt9vNnQev4KbjcUd8qYwKyLQrJxvGVjeMVvF+Ls8zj7EvkZisx4
 kVSpGrdA0PUVFjIhJ8RH9uycNP+1zbZpLUcIhikhXp61Tet0Or1GH8q+tigz7+FFoC
 to4fkLqGaNdngtpfSrAsgeJhZA5226a0VcqHoOsDq9BJ5852wDvJynxusrOmq0QyKK
 DygJMf0FhNIajiHOENC4MZgacP+7fSS4e5cY1uwxl/5Xnffy6sLlchb9vtlrFayJ17
 vKirzvmPbP70s9YM6ZsT20LRHV9usFUOchHrBUq3+hAOfssx9vZkf7sUodrIn0iWCC
 kgADvFZ/HIYyw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 2/3] selftests/powerpc: Don't use setaffinity in tm-tmspr
Date: Thu, 13 Aug 2020 11:34:44 +1000
Message-Id: <20200813013445.686464-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200813013445.686464-1-mpe@ellerman.id.au>
References: <20200813013445.686464-1-mpe@ellerman.id.au>
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

This test tries to set affinity to CPUs that don't exist, especially
if the set of online CPUs doesn't start at 0.

But there's no real reason for it to use setaffinity in the first
place, it's just trying to create lots of threads to cause contention.
So drop the setaffinity entirely.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/tm/tm-tmspr.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/tools/testing/selftests/powerpc/tm/tm-tmspr.c b/tools/testing/selftests/powerpc/tm/tm-tmspr.c
index 17becf3dcee4..2ff329e2fca9 100644
--- a/tools/testing/selftests/powerpc/tm/tm-tmspr.c
+++ b/tools/testing/selftests/powerpc/tm/tm-tmspr.c
@@ -38,14 +38,8 @@ int	passed = 1;
 
 void tfiar_tfhar(void *in)
 {
-	int i, cpu;
 	unsigned long tfhar, tfhar_rd, tfiar, tfiar_rd;
-	cpu_set_t cpuset;
-
-	CPU_ZERO(&cpuset);
-	cpu = (unsigned long)in >> 1;
-	CPU_SET(cpu, &cpuset);
-	sched_setaffinity(0, sizeof(cpuset), &cpuset);
+	int i;
 
 	/* TFIAR: Last bit has to be high so userspace can read register */
 	tfiar = ((unsigned long)in) + 1;
-- 
2.25.1

