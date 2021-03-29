Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0C734C48D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 09:07:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F83Yt3Gh3z30Hb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 18:07:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F83YY4K2Xz2yjL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 18:07:26 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F83YN0Lyxz9txqm;
 Mon, 29 Mar 2021 09:07:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Bbovh61E9OCv; Mon, 29 Mar 2021 09:07:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F83YM6fvRz9txql;
 Mon, 29 Mar 2021 09:07:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 115298B79E;
 Mon, 29 Mar 2021 09:07:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 3-O8-dTqcO5q; Mon, 29 Mar 2021 09:07:21 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DC4B68B7A2;
 Mon, 29 Mar 2021 09:07:20 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id BFFFA67611; Mon, 29 Mar 2021 07:07:20 +0000 (UTC)
Message-Id: <db20abbecb129c49d3c663de67dac6a87501ac0b.1617001615.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/8xx: Load modules closer to kernel text
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 29 Mar 2021 07:07:20 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On the 8xx, TASK_SIZE is 0x80000000. The space between TASK_SIZE and
PAGE_OFFSET is not used.

Use it to load modules in order to minimise the distance between
kernel text and modules and avoid trampolines in modules to access
kernel functions or other module functions.

Define a 16Mbytes area for modules, that's more than enough.

DEBUG logs in module_32.c without the patch:

[ 1572.588822] module_32: Applying ADD relocate section 13 to 12
[ 1572.588891] module_32: Doing plt for call to 0xc00671a4 at 0xcae04024
[ 1572.588964] module_32: Initialized plt for 0xc00671a4 at cae04000
[ 1572.589037] module_32: REL24 value = CAE04000. location = CAE04024
[ 1572.589110] module_32: Location before: 48000001.
[ 1572.589171] module_32: Location after: 4BFFFFDD.
[ 1572.589231] module_32: ie. jump to 03FFFFDC+CAE04024 = CEE04000
[ 1572.589317] module_32: Applying ADD relocate section 15 to 14
[ 1572.589386] module_32: Doing plt for call to 0xc00671a4 at 0xcadfc018
[ 1572.589457] module_32: Initialized plt for 0xc00671a4 at cadfc000
[ 1572.589529] module_32: REL24 value = CADFC000. location = CADFC018
[ 1572.589601] module_32: Location before: 48000000.
[ 1572.589661] module_32: Location after: 4BFFFFE8.
[ 1572.589723] module_32: ie. jump to 03FFFFE8+CADFC018 = CEDFC000

With the patch:

[  279.404671] module_32: Applying ADD relocate section 13 to 12
[  279.404741] module_32: REL24 value = C00671B4. location = BF808024
[  279.404814] module_32: Location before: 48000001.
[  279.404874] module_32: Location after: 4885F191.
[  279.404933] module_32: ie. jump to 0085F190+BF808024 = C00671B4
[  279.405016] module_32: Applying ADD relocate section 15 to 14
[  279.405085] module_32: REL24 value = C00671B4. location = BF800018
[  279.405156] module_32: Location before: 48000000.
[  279.405215] module_32: Location after: 4886719C.
[  279.405275] module_32: ie. jump to 0086719C+BF800018 = C00671B4

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
index 478249959baa..7902a42d6d3e 100644
--- a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
@@ -172,6 +172,9 @@
 
 #define mmu_linear_psize	MMU_PAGE_8M
 
+#define MODULES_VADDR	(PAGE_OFFSET - SZ_16M)
+#define MODULES_END	PAGE_OFFSET
+
 #ifndef __ASSEMBLY__
 
 #include <linux/mmdebug.h>
-- 
2.25.0

