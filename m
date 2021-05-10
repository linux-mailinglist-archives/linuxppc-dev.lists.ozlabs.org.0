Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2823937914D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 16:50:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ff3rh1P6Sz3btQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 00:50:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Tue, 11 May 2021 00:50:22 AEST
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ff3rG3mDJz2xtm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 00:50:22 +1000 (AEST)
IronPort-SDR: /Zm/cppsYsb0BcM9GmvPgJseKtJktrmpXPimwsNMRw4U8dAETiC5b/QpnTvJ9xBIOB1wBZfj4B
 knErkTG3habQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="198888160"
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="198888160"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 07:49:15 -0700
IronPort-SDR: g12/KNiR7GT/d2fjM18wH18qp3EhNi/k6SN/QLNplQgIsiZWolAIHWTY1kWIMBU0T7c+zjBJko
 iJacHGqmMiKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="398902358"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga007.fm.intel.com with ESMTP; 10 May 2021 07:49:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id B1F4C12A; Mon, 10 May 2021 17:49:33 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] powerpc/prom_init: Move custom isspace() to its own
 namespace
Date: Mon, 10 May 2021 17:49:25 +0300
Message-Id: <20210510144925.58195-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Paul Mackerras <paulus@samba.org>, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If by some reason any of the headers will include ctype.h
we will have a name collision. Avoid this by moving isspace()
to the dedicate namespace.

First appearance of the code is in the commit cf68787b68a2
("powerpc/prom_init: Evaluate mem kernel parameter for early allocation").

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/powerpc/kernel/prom_init.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 41ed7e33d897..6845cbbc0cd4 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -701,13 +701,13 @@ static int __init prom_setprop(phandle node, const char *nodename,
 }
 
 /* We can't use the standard versions because of relocation headaches. */
-#define isxdigit(c)	(('0' <= (c) && (c) <= '9') \
-			 || ('a' <= (c) && (c) <= 'f') \
-			 || ('A' <= (c) && (c) <= 'F'))
+#define prom_isxdigit(c)	(('0' <= (c) && (c) <= '9') \
+				 || ('a' <= (c) && (c) <= 'f') \
+				 || ('A' <= (c) && (c) <= 'F'))
 
-#define isdigit(c)	('0' <= (c) && (c) <= '9')
-#define islower(c)	('a' <= (c) && (c) <= 'z')
-#define toupper(c)	(islower(c) ? ((c) - 'a' + 'A') : (c))
+#define prom_isdigit(c)		('0' <= (c) && (c) <= '9')
+#define prom_islower(c)		('a' <= (c) && (c) <= 'z')
+#define prom_toupper(c)		(prom_islower(c) ? ((c) - 'a' + 'A') : (c))
 
 static unsigned long prom_strtoul(const char *cp, const char **endp)
 {
@@ -716,14 +716,14 @@ static unsigned long prom_strtoul(const char *cp, const char **endp)
 	if (*cp == '0') {
 		base = 8;
 		cp++;
-		if (toupper(*cp) == 'X') {
+		if (prom_toupper(*cp) == 'X') {
 			cp++;
 			base = 16;
 		}
 	}
 
-	while (isxdigit(*cp) &&
-	       (value = isdigit(*cp) ? *cp - '0' : toupper(*cp) - 'A' + 10) < base) {
+	while (prom_isxdigit(*cp) &&
+	       (value = prom_isdigit(*cp) ? *cp - '0' : prom_toupper(*cp) - 'A' + 10) < base) {
 		result = result * base + value;
 		cp++;
 	}
-- 
2.30.2

