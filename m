Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DCB3457AB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 07:16:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4Ljl5fSPz30F0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 17:16:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=59.111.176.37; helo=mail-m17637.qiye.163.com;
 envelope-from=wanjiabing@vivo.com; receiver=<UNKNOWN>)
Received: from mail-m17637.qiye.163.com (mail-m17637.qiye.163.com
 [59.111.176.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4LjQ3Jjnz302p
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 17:16:19 +1100 (AEDT)
Received: from wanjb-virtual-machine.localdomain (unknown [36.152.145.182])
 by mail-m17637.qiye.163.com (Hmail) with ESMTPA id A9B1F9803CD;
 Tue, 23 Mar 2021 14:16:11 +0800 (CST)
From: Wan Jiabing <wanjiabing@vivo.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Shuah Khan <shuah@kernel.org>,
 Wan Jiabing <wanjiabing@vivo.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] tools: testing: Remove duplicate includes
Date: Tue, 23 Mar 2021 14:15:59 +0800
Message-Id: <20210323061604.289958-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZHkkaGU5OTBgaT0hCVkpNSk1PQ0tKTEpCT01VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NSI6OQw*Sz8cPDoCThYiQwFO
 ATEaFFFVSlVKTUpNT0NLSkxJSU5OVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
 TVVKTklVSk9OVUpDSVlXWQgBWUFJQktKNwY+
X-HM-Tid: 0a785db9f75cd992kuwsa9b1f9803cd
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
Cc: kael_w@yeah.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

sched.h has been included at line 33, so remove the 
duplicate one at line 36.
inttypes.h has been included at line 19, so remove the 
duplicate one at line 23.
pthread.h has been included at line 17,so remove the 
duplicate one at line 20.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 tools/testing/selftests/powerpc/mm/tlbie_test.c     | 1 -
 tools/testing/selftests/powerpc/tm/tm-poison.c      | 1 -
 tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/tools/testing/selftests/powerpc/mm/tlbie_test.c b/tools/testing/selftests/powerpc/mm/tlbie_test.c
index f85a0938ab25..48344a74b212 100644
--- a/tools/testing/selftests/powerpc/mm/tlbie_test.c
+++ b/tools/testing/selftests/powerpc/mm/tlbie_test.c
@@ -33,7 +33,6 @@
 #include <sched.h>
 #include <time.h>
 #include <stdarg.h>
-#include <sched.h>
 #include <pthread.h>
 #include <signal.h>
 #include <sys/prctl.h>
diff --git a/tools/testing/selftests/powerpc/tm/tm-poison.c b/tools/testing/selftests/powerpc/tm/tm-poison.c
index 29e5f26af7b9..27c083a03d1f 100644
--- a/tools/testing/selftests/powerpc/tm/tm-poison.c
+++ b/tools/testing/selftests/powerpc/tm/tm-poison.c
@@ -20,7 +20,6 @@
 #include <sched.h>
 #include <sys/types.h>
 #include <signal.h>
-#include <inttypes.h>
 
 #include "tm.h"
 
diff --git a/tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c b/tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c
index e2a0c07e8362..9ef37a9836ac 100644
--- a/tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c
+++ b/tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c
@@ -17,7 +17,6 @@
 #include <pthread.h>
 #include <sys/mman.h>
 #include <unistd.h>
-#include <pthread.h>
 
 #include "tm.h"
 #include "utils.h"
-- 
2.25.1

