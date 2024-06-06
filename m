Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6CE8FE7D1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 15:31:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vw4wg3yVbz3fpd
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 23:31:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=52.205.10.60; helo=smtp-usa1.onexmail.com; envelope-from=jinglin.wen@shingroup.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 378 seconds by postgrey-1.37 at boromir; Thu, 06 Jun 2024 23:30:53 AEST
Received: from smtp-usa1.onexmail.com (smtp-usa1.onexmail.com [52.205.10.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vw4wF70KQz3ccX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 23:30:53 +1000 (AEST)
X-QQ-mid: bizesmtpsz1t1717680152t9w1o59
X-QQ-Originating-IP: AmpsQDgASEaAJP+E87sCAd76grdai6fjPk9qNQFKsTE=
Received: from HX01040082.powercore.com.cn ( [14.19.67.247])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 06 Jun 2024 21:22:30 +0800 (CST)
X-QQ-SSF: 01400000000000B0B000000A0000000
X-QQ-FEAT: ZbT1X8e7m5Fo8AN97Qo/SfGebcJKiGCLiCQTkAdeNHxeen7puOp3rgyNhjIt5
	7ivIxPLQoqj+KveACDdj1lmBLe2B8/h/Vu0gnl0TIdLE8IDLugpGSGFcirwJP07QLzJL70D
	cgcDtrWYTwlJ9foJ0eDH0q5qY5aybrSj0hEeGnf9DDQB7Y7NJHxJ+1YAkXKnCuds3woC6tq
	0GKmhV3D2upU42VhZB6cbfDqQuYa+lH4lTGgjJqB4gCsEQF8JaQo/9N4cI9EiKqyVtOSna/
	0dXm1bKxjcSRrgLGUJoblqa04ndCqf35Ce51QfzRd3kAjBx+G93Vv1lUCMa5nHc9yq59avq
	A5RJA9krwXJw+hZMRDcyO6SwkDveAgBf/RznDViJIF90orGxmoprHMOgw12ww==
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 20561316882800220
From: Jinglin Wen <jinglin.wen@shingroup.cn>
To: npiggin@gmail.com
Subject: [PATCH] powerpc: Fixed the bug of duplicate copying
Date: Thu,  6 Jun 2024 21:21:32 +0800
Message-Id: <20240606132132.13785-1-jinglin.wen@shingroup.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz5a-2
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
Cc: masahiroy@kernel.org, linux-kernel@vger.kernel.org, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, jinglin.wen@shingroup.cn
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixed the issue where the kernel, when booting from address 0, had
code incorrectly duplicated to address 0.

Signed-off-by: Jinglin Wen <jinglin.wen@shingroup.cn>
---
 arch/powerpc/kernel/head_64.S | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 4690c219bfa4..6c73551bdc50 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -647,7 +647,9 @@ __after_prom_start:
  * Note: This process overwrites the OF exception vectors.
  */
 	LOAD_REG_IMMEDIATE(r3, PAGE_OFFSET)
-	mr.	r4,r26			/* In some cases the loader may  */
+	tophys(r4,r26)
+	cmplwi	cr0,r4,0	/* runtime base addr is zero */
+	mr	r4,r26			/* In some cases the loader may */
 	beq	9f			/* have already put us at zero */
 	li	r6,0x100		/* Start offset, the first 0x100 */
 					/* bytes were copied earlier.	 */
-- 
2.25.1

