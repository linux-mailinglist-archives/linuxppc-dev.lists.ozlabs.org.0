Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 568182848F9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Oct 2020 11:08:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5BTn1H54zDqLp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Oct 2020 20:08:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5BQG12NPzDqDd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Oct 2020 20:05:36 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4C5BQ06pGGz9tyfM;
 Tue,  6 Oct 2020 11:05:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id y2ldzfHjWUF4; Tue,  6 Oct 2020 11:05:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4C5BQ05l2rz9tyfQ;
 Tue,  6 Oct 2020 11:05:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ECA1D8B7C7;
 Tue,  6 Oct 2020 11:05:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4yQoLA5Np6I4; Tue,  6 Oct 2020 11:05:27 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4AE288B7C3;
 Tue,  6 Oct 2020 11:05:26 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 1AB5B65DE8; Tue,  6 Oct 2020 09:05:26 +0000 (UTC)
Message-Id: <319d379f696412681c66a987cc75e6abf8f958d2.1601975100.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 1/2] powerpc/32s: Rename head_32.S to head_book3s_32.S
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue,  6 Oct 2020 09:05:26 +0000 (UTC)
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

Unlike PPC64 which had a single head_64.S, PPC32 are multiple ones.
There is the head_32.S, selected by default based on the value of BITS
and overridden based on some CONFIG_ values. This leads to thinking
that it may be selected by different types of PPC32 platform but
indeed it ends up being selected by book3s/32 only.

Make that explicit by:
- Not doing any default selection based on BITS.
- Renaming head_32.S to head_book3s_32.S.
- Get head_book3s_32.S selected only by CONFIG_PPC_BOOK3S_32.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/Makefile                        | 3 ++-
 arch/powerpc/kernel/{head_32.S => head_book3s_32.S} | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)
 rename arch/powerpc/kernel/{head_32.S => head_book3s_32.S} (99%)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index a5550c2b24c4..bf0bf1b900d2 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -95,7 +95,8 @@ obj-$(CONFIG_PPC_FSL_BOOK3E)	+= cpu_setup_fsl_booke.o
 obj-$(CONFIG_PPC_DOORBELL)	+= dbell.o
 obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
 
-extra-y				:= head_$(BITS).o
+extra-$(CONFIG_PPC64)		:= head_64.o
+extra-$(CONFIG_PPC_BOOK3S_32)	:= head_book3s_32.o
 extra-$(CONFIG_40x)		:= head_40x.o
 extra-$(CONFIG_44x)		:= head_44x.o
 extra-$(CONFIG_FSL_BOOKE)	:= head_fsl_booke.o
diff --git a/arch/powerpc/kernel/head_32.S b/arch/powerpc/kernel/head_book3s_32.S
similarity index 99%
rename from arch/powerpc/kernel/head_32.S
rename to arch/powerpc/kernel/head_book3s_32.S
index 35627693c2a4..e07a2c07ffe4 100644
--- a/arch/powerpc/kernel/head_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -61,7 +61,7 @@
 
 	__HEAD
 	.stabs	"arch/powerpc/kernel/",N_SO,0,0,0f
-	.stabs	"head_32.S",N_SO,0,0,0f
+	.stabs	"head_book3s_32.S",N_SO,0,0,0f
 0:
 _ENTRY(_stext);
 
-- 
2.25.0

