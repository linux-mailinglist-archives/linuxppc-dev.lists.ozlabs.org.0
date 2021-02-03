Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC85630E2D3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 19:54:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW9p200r1zDxYR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 05:54:18 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW9Yg6NcjzDwrb
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 05:43:35 +1100 (AEDT)
Received: from MTA-07.privateemail.com (localhost [127.0.0.1])
 by MTA-07.privateemail.com (Postfix) with ESMTP id 00C1160058
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 13:43:31 -0500 (EST)
Received: from oc8246131445.ibm.com (unknown [10.20.151.227])
 by MTA-07.privateemail.com (Postfix) with ESMTPA id C5A2C6005C
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 18:43:30 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 04/10] powerpc: Reference param in MSR_TM_ACTIVE() macro
Date: Wed,  3 Feb 2021 12:43:17 -0600
Message-Id: <20210203184323.20792-5-cmr@codefail.de>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210203184323.20792-1-cmr@codefail.de>
References: <20210203184323.20792-1-cmr@codefail.de>
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
---
 arch/powerpc/include/asm/reg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index e40a921d78f9..c5a3e856191c 100644
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

