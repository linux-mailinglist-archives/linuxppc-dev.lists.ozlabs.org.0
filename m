Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B2D10D257
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 09:19:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47PS956XqDzDr69
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 19:19:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=huawei.com;
 envelope-from=shaolexi@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
X-Greylist: delayed 956 seconds by postgrey-1.36 at bilbo;
 Fri, 29 Nov 2019 18:21:24 AEDT
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47PQsw66jfzDr7F
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 18:21:20 +1100 (AEDT)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 53DBF9292813DBDE57C3;
 Fri, 29 Nov 2019 15:05:09 +0800 (CST)
Received: from huawei.com (10.67.189.2) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Fri, 29 Nov 2019
 15:04:55 +0800
From: Lexi Shao <shaolexi@huawei.com>
To: <benh@kernel.crashing.org>, <paulus@samba.org>, <mpe@ellerman.id.au>,
 <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/kasan: KASAN is not supported on RELOCATABLE &&
 FSL_BOOKE
Date: Fri, 29 Nov 2019 15:04:55 +0800
Message-ID: <20191129070455.62084-1-shaolexi@huawei.com>
X-Mailer: git-send-email 2.12.3
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.189.2]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 29 Nov 2019 19:17:47 +1100
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
Cc: wangkefeng.wang@huawei.com, liucheng32@huawei.com, yi.zhang@huawei.com,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 shaolexi@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CONFIG_RELOCATABLE and CONFIG_KASAN cannot be enabled at the same time
on ppce500 fsl_booke. All functions called before kasan_early_init()
should be disabled with kasan check. When CONFIG_RELOCATABLE is enabled
on ppce500 fsl_booke, relocate_init() is called before kasan_early_init()
which triggers kasan check and results in boot failure.
Call trace and functions which triggers kasan check(*):
  - _start
   - set_ivor
    - relocate_init(*)
     - early_get_first_memblock_info(*)
      - of_scan_flat_dt(*)
	...
    - kasan_early_init

Potential solutions could be 1. implement relocate_init and all its children
function in a seperate file or 2. introduce a global vairable in KASAN, only
enable KASAN check when init is done.

Disable KASAN when RELOCATABLE is selected on fsl_booke for now until
it is supported.

Signed-off-by: Lexi Shao <shaolexi@huawei.com>
---
 arch/powerpc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 3e56c9c2f16e..14f3da63c088 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -171,7 +171,7 @@ config PPC
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_HUGE_VMAP		if PPC_BOOK3S_64 && PPC_RADIX_MMU
 	select HAVE_ARCH_JUMP_LABEL
-	select HAVE_ARCH_KASAN			if PPC32
+	select HAVE_ARCH_KASAN			if PPC32 && !(RELOCATABLE && FSL_BOOKE)
 	select HAVE_ARCH_KGDB
 	select HAVE_ARCH_MMAP_RND_BITS
 	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if COMPAT
-- 
2.12.3

