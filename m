Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A56B31F8562
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jun 2020 23:18:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49kr6H0tfMzDqvt
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jun 2020 07:17:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kb.kras.ru (client-ip=62.213.33.10; helo=ispman.iskranet.ru;
 envelope-from=asolokha@kb.kras.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kb.kras.ru
Received: from ispman.iskranet.ru (ispman.iskranet.ru [62.213.33.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49kr4S2DZ5zDqsx
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jun 2020 07:16:22 +1000 (AEST)
Received: by ispman.iskranet.ru (Postfix, from userid 8)
 id 1A54882179C; Sat, 13 Jun 2020 23:28:05 +0700 (KRAT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on ispman.iskranet.ru
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=4.0 tests=ALL_TRUSTED,SHORTCIRCUIT
 shortcircuit=ham autolearn=disabled version=3.3.2
Received: from himel.orionnet.ru (121.253.33.171.ip.orionnet.ru
 [171.33.253.121]) (Authenticated sender: asolokha@kb.kras.ru)
 by ispman.iskranet.ru (Postfix) with ESMTPA id 9306982179C;
 Sat, 13 Jun 2020 23:28:03 +0700 (KRAT)
From: Arseny Solokha <asolokha@kb.kras.ru>
To: Michael Ellerman <mpe@ellerman.id.au>, Jason Yan <yanaijie@huawei.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/fsl_booke/32: fix build with CONFIG_RANDOMIZE_BASE
Date: Sat, 13 Jun 2020 23:28:01 +0700
Message-Id: <20200613162801.1946619-1-asolokha@kb.kras.ru>
X-Mailer: git-send-email 2.27.0
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
Cc: Scott Wood <oss@buserror.net>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Arseny Solokha <asolokha@kb.kras.ru>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Building the current 5.8 kernel for a e500 machine with
CONFIG_RANDOMIZE_BASE set yields the following failure:

  arch/powerpc/mm/nohash/kaslr_booke.c: In function 'kaslr_early_init':
  arch/powerpc/mm/nohash/kaslr_booke.c:387:2: error: implicit declaration
of function 'flush_icache_range'; did you mean 'flush_tlb_range'?
[-Werror=implicit-function-declaration]

Indeed, including asm/cacheflush.h into kaslr_booke.c fixes the build.

The issue dates back to the introduction of that file and probably went
unnoticed because there's no in-tree defconfig with CONFIG_RANDOMIZE_BASE
set.

Fixes: 2b0e86cc5de6 ("powerpc/fsl_booke/32: implement KASLR infrastructure")
Cc: stable@vger.kernel.org
Signed-off-by: Arseny Solokha <asolokha@kb.kras.ru>
---
 arch/powerpc/mm/nohash/kaslr_booke.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/mm/nohash/kaslr_booke.c b/arch/powerpc/mm/nohash/kaslr_booke.c
index 4a75f2d9bf0e..bce0e5349978 100644
--- a/arch/powerpc/mm/nohash/kaslr_booke.c
+++ b/arch/powerpc/mm/nohash/kaslr_booke.c
@@ -14,6 +14,7 @@
 #include <linux/memblock.h>
 #include <linux/libfdt.h>
 #include <linux/crash_core.h>
+#include <asm/cacheflush.h>
 #include <asm/pgalloc.h>
 #include <asm/prom.h>
 #include <asm/kdump.h>
-- 
2.27.0

