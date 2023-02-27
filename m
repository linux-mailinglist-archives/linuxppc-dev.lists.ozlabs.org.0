Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F286A468B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 16:55:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQQ7q3n6Dz3cC5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 02:55:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQQ7D6FGLz2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 02:55:01 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4PQQ740mdsz9sRw;
	Mon, 27 Feb 2023 16:54:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KGyF3kxzZLfU; Mon, 27 Feb 2023 16:54:56 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4PQQ74028Zz9sRt;
	Mon, 27 Feb 2023 16:54:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E4FAA8B76D;
	Mon, 27 Feb 2023 16:54:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id vfkc5fTz5JcQ; Mon, 27 Feb 2023 16:54:55 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C23438B763;
	Mon, 27 Feb 2023 16:54:55 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 31RFssvf1956906
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 27 Feb 2023 16:54:54 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 31RFssGo1956874;
	Mon, 27 Feb 2023 16:54:54 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc/perf: Properly detect mpc7450 family
Date: Mon, 27 Feb 2023 16:54:45 +0100
Message-Id: <99ca1da2e5a6cf82a8abf4bc034918e500e31781.1677513277.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677513283; l=2016; s=20211009; h=from:subject:message-id; bh=4PyH6HbcpuO9nDmeuWz6wcx7EIrP9V8mGLim+adlsII=; b=T4CqsEZgRLkFNfGpZ75Sbz1cFkt41Nktbqye7Evon1YDxcslSZqI50f3sYzwptr59qA+48DTpcnE M2rm6P+vCZg1pcSnef/Roa62/MITz7H/nnYcYst77FaEKsA+qDy/
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: Dan Carpenter <error27@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Unlike PVR_POWER8, etc ...., PVR_7450 represents a full PVR
value and not a family value.

To avoid confusion, do like E500 family and define the relevant
PVR_VER_xxxx values for the 7450 family:
  0x8000 ==> 7450
  0x8001 ==> 7455
  0x8002 ==> 7447
  0x8003 ==> 7447A
  0x8004 ==> 7448

And use them to detect 7450 family for perf events.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://lore.kernel.org/r/202302260657.7dM9Uwev-lkp@intel.com/
Fixes: ec3eb9d941a9 ("powerpc/perf: Use PVR rather than oprofile field to determine CPU version")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/reg.h  | 5 +++++
 arch/powerpc/perf/mpc7450-pmu.c | 6 +++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 1e8b2e04e626..8fda87af2fa5 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -1310,6 +1310,11 @@
 #define PVR_VER_E500MC	0x8023
 #define PVR_VER_E5500	0x8024
 #define PVR_VER_E6500	0x8040
+#define PVR_VER_7450	0x8000
+#define PVR_VER_7455	0x8001
+#define PVR_VER_7447	0x8002
+#define PVR_VER_7447A	0x8003
+#define PVR_VER_7448	0x8004
 
 /*
  * For the 8xx processors, all of them report the same PVR family for
diff --git a/arch/powerpc/perf/mpc7450-pmu.c b/arch/powerpc/perf/mpc7450-pmu.c
index 552d51a925d3..db451b9aac35 100644
--- a/arch/powerpc/perf/mpc7450-pmu.c
+++ b/arch/powerpc/perf/mpc7450-pmu.c
@@ -417,9 +417,9 @@ struct power_pmu mpc7450_pmu = {
 
 static int __init init_mpc7450_pmu(void)
 {
-	unsigned int pvr = mfspr(SPRN_PVR);
-
-	if (PVR_VER(pvr) != PVR_7450)
+	if (!pvr_version_is(PVR_VER_7450) && !pvr_version_is(PVR_VER_7455) &&
+	    !pvr_version_is(PVR_VER_7447) && !pvr_version_is(PVR_VER_7447A) &&
+	    !pvr_version_is(PVR_VER_7448))
 		return -ENODEV;
 
 	return register_power_pmu(&mpc7450_pmu);
-- 
2.39.1

