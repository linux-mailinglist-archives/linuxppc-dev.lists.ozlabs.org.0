Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3D92C2596
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 13:23:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgNV84HYwzDqZn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 23:23:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgN5g2rwfzDqWp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 23:05:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Ad99/KcO; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4CgN5d6MQnz9sSs; Tue, 24 Nov 2020 23:05:57 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CgN5d577jz9sT6; Tue, 24 Nov 2020 23:05:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1606219557;
 bh=OeXCM+BgRBE+9EkqR7SmDDccO0biv15P7s7oRm9Wjhg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ad99/KcOj0K7Ay/CN1Dnw52Ly2m/BVU48cHzlnt05u6Ub6SHBoBtLyV2RbrgD0Npa
 Xba+gi2NKntiUWjojoHQGL3OpIcnY9/1MdKReHJ41DB6hVMiL7Nzs4uLgRiWsczZ6x
 D0rN+OgBePNra34xRdd2uQWyl3gULRKKkKyJNp+3hD/Vo/EUEDrivtIUob8boSsv91
 TRWWX9SuTo0cVuEPv+RSbnFMux2YsJTfKy+Ji3oxdueuqSk6xMlNbjWe/JCOXhnbdP
 2xBlgJOWkD78LfhniJqxRPBSseXXk1Jh5jeydWupg17VWqiUhjtftBfqAzZ1e4my4k
 o2JmkzbByzCRA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 2/3] powerpc: Make NUMA default y for powernv
Date: Tue, 24 Nov 2020 23:05:46 +1100
Message-Id: <20201124120547.1940635-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124120547.1940635-1-mpe@ellerman.id.au>
References: <20201124120547.1940635-1-mpe@ellerman.id.au>
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
Cc: rdunlap@infradead.org, srikar@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Our NUMA option is default y for pseries, but not powernv. The bulk of
powernv systems are NUMA, so make NUMA default y for powernv also.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index a22db3db6b96..4d688b426353 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -661,7 +661,7 @@ config IRQ_ALL_CPUS
 config NUMA
 	bool "NUMA support"
 	depends on PPC64 && SMP
-	default y if SMP && PPC_PSERIES
+	default y if PPC_PSERIES || PPC_POWERNV
 
 config NODES_SHIFT
 	int
-- 
2.25.1

