Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6071262C7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 14:01:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dsSt0wypzDqsL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2019 00:01:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dsQ94T3CzDqd9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 23:58:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="TqmMMed5"; dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 47dsQ93G8gz9sPc; Thu, 19 Dec 2019 23:58:57 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47dsQ92FFbz9sPn; Thu, 19 Dec 2019 23:58:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1576760337;
 bh=E5fLwE3HXsB/MG4teAIFeM3up7iWliYR2+IjgAQfXEE=;
 h=From:To:Cc:Subject:Date:From;
 b=TqmMMed5wWejIAC4V9lrfLQpPe8px5C70eLHnMSMXwivwDobiSxx7uX5YrkvV9b/y
 j+zy3qUuWj7upQRfUmqSGz6ZiNtTczqjxEBbCYqqRTVpGk5IThs+ZTnfI9KWXUC9eR
 C7tHSPxe6huSMA87n0xzBcm4Nl1wwIKXjwvwEQalIfvv2ydxGvExp+bw6VrsfnKwEW
 a+2MnrP4YbamF0+bI2qtq/kvXwMJEcZwbgB//EuC5tIFLj95CLgZNfMeDxQhNf8vLh
 sbGYEH5B7QqHKRaN+vVQkkid+bFzMqxGCNEOJ/7P937bHbia5Tskdd0BIqTO/jAAKr
 Bs7K36fQQmj4A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/pseries: Remove redundant select of PPC_DOORBELL
Date: Thu, 19 Dec 2019 23:58:40 +1100
Message-Id: <20191219125840.32592-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.0
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
Cc: Jason@zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit d4e58e5928f8 ("powerpc/powernv: Enable POWER8 doorbell IPIs")
added a select of PPC_DOORBELL to PPC_PSERIES, but it already had a
select of PPC_DOORBELL. One is enough.

Reported-by: Jason A. Donenfeld <Jason@zx2c4.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/pseries/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
index 595e9f8a6539..24c18362e5ea 100644
--- a/arch/powerpc/platforms/pseries/Kconfig
+++ b/arch/powerpc/platforms/pseries/Kconfig
@@ -21,7 +21,6 @@ config PPC_PSERIES
 	select PPC_DOORBELL
 	select HOTPLUG_CPU
 	select ARCH_RANDOM
-	select PPC_DOORBELL
 	select FORCE_SMP
 	select SWIOTLB
 	default y
-- 
2.21.0

