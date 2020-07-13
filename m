Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B472521D105
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 09:58:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B4wyB2JkWzDqV9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 17:58:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.79;
 helo=conuserg-12.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=VxbmIPJH; 
 dkim-atps=neutral
Received: from conuserg-12.nifty.com (conuserg-12.nifty.com [210.131.2.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B4wwb2p2SzDqTT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 17:57:19 +1000 (AEST)
Received: from oscar.flets-west.jp (softbank126025067101.bbtec.net
 [126.25.67.101]) (authenticated)
 by conuserg-12.nifty.com with ESMTP id 06D7uYDf027924;
 Mon, 13 Jul 2020 16:56:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 06D7uYDf027924
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1594626994;
 bh=cXlkKx6N8NEBTpVkCbg0vvb9KuVX9FkcLVkdaw2RUnI=;
 h=From:To:Cc:Subject:Date:From;
 b=VxbmIPJHOtRVfhwgqKN6w6NJ8TXawOqUOTra0G1P/+X/zrUHkBDBAWuQodWCYtdp7
 SXSoEyOtVuaU/77su2m2eiQiNAJBgPHZv+JPW1werHuEJHjqbnNbGIwxr/qrYfJJ0K
 5c5DPpftzYdxU9Zqbg6udkSrNHvfCDm0MP7M3s65ilclRV8phPAmjRvISI8lA6ydCP
 czfYb1AIzxUGZ/sLcrmkymN3H5OXwFxIdt7Fj+7G4NK5Y+xTfHBdn4QwVihyf1BmGU
 XHcPPEBLRO5GcqZwX0D9ERw1oERgaRViXWVkeTZWJyQ7IW5CwN09MxU1bDdYv4FpBC
 uGE9TMfj1FaGQ==
X-Nifty-SrcIP: [126.25.67.101]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Subject: [PATCH] powerpc/boot: add DTB to 'targets'
Date: Mon, 13 Jul 2020 16:56:28 +0900
Message-Id: <20200713075629.5948-1-masahiroy@kernel.org>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, Arnd Bergmann <arnd@arndb.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PowerPC always re-builds DTB even if nothing has been changed.

As for other architectures, arch/*/boot/dts/Makefile builds DTB by
using the dtb-y syntax.

In contrast, arch/powerpc/boot/dts/(fsl/)Makefile does nothing unless
CONFIG_OF_ALL_DTBS is defined. Instead, arch/powerpc/boot/Makefile
builds DTB on demand. You need to add DTB to 'targets' explicitly
so .*.cmd files are included.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

I want to apply this to kbuild tree because this is needed
to fix the build error caused by another kbuild patch:

https://lkml.org/lkml/2020/7/7/134


 arch/powerpc/boot/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 63d7456b9518..8792323707fd 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -366,6 +366,8 @@ initrd-y := $(patsubst zImage%, zImage.initrd%, \
 		$(patsubst treeImage%, treeImage.initrd%, $(image-y)))))
 initrd-y := $(filter-out $(image-y), $(initrd-y))
 targets	+= $(image-y) $(initrd-y)
+targets += $(foreach x, dtbImage uImage cuImage simpleImage treeImage, \
+		$(patsubst $(x).%, dts/%.dtb, $(filter $(x).%, $(image-y))))
 
 $(addprefix $(obj)/, $(initrd-y)): $(obj)/ramdisk.image.gz
 
-- 
2.25.1

