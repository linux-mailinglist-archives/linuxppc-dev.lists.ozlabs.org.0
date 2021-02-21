Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E13C63207E7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Feb 2021 02:24:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Djnfk09Nxz3cYh
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Feb 2021 12:24:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=68.65.122.27;
 helo=mta-07-4.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Received: from MTA-07-4.privateemail.com (mta-07-4.privateemail.com
 [68.65.122.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Djnf40Q39z30N0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Feb 2021 12:24:09 +1100 (AEDT)
Received: from MTA-07.privateemail.com (localhost [127.0.0.1])
 by MTA-07.privateemail.com (Postfix) with ESMTP id 5E97F6004D;
 Sat, 20 Feb 2021 20:24:07 -0500 (EST)
Received: from oc8246131445.ibm.com (unknown [10.20.151.213])
 by MTA-07.privateemail.com (Postfix) with ESMTPA id 21A9F60049;
 Sun, 21 Feb 2021 01:24:07 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 04/10] powerpc: Reference parameter in MSR_TM_ACTIVE() macro
Date: Sat, 20 Feb 2021 19:23:55 -0600
Message-Id: <20210221012401.22328-5-cmr@codefail.de>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210221012401.22328-1-cmr@codefail.de>
References: <20210221012401.22328-1-cmr@codefail.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Unlike the other MSR_TM_* macros, MSR_TM_ACTIVE does not reference or
use its parameter unless CONFIG_PPC_TRANSACTIONAL_MEM is defined. This
causes an 'unused variable' compile warning unless the variable is also
guarded with CONFIG_PPC_TRANSACTIONAL_MEM.

Reference but do nothing with the argument in the macro to avoid a
potential compile warning.

Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
Reviewed-by: Daniel Axtens <dja@axtens.net>
---
 arch/powerpc/include/asm/reg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index da103e92c112..1be20bc8dce2 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -124,7 +124,7 @@
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 #define MSR_TM_ACTIVE(x) (((x) & MSR_TS_MASK) != 0) /* Transaction active? */
 #else
-#define MSR_TM_ACTIVE(x) 0
+#define MSR_TM_ACTIVE(x) ((void)(x), 0)
 #endif
 
 #if defined(CONFIG_PPC_BOOK3S_64)
-- 
2.26.1

