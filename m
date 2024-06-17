Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F57C90A28E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 04:44:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2Z2j1zQ7z3cXb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 12:43:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=52.205.10.60; helo=smtp-usa1.onexmail.com; envelope-from=jinglin.wen@shingroup.cn; receiver=lists.ozlabs.org)
Received: from smtp-usa1.onexmail.com (smtp-usa1.onexmail.com [52.205.10.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2Z2F3cwTz30Ty
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 12:43:32 +1000 (AEST)
X-QQ-mid: bizesmtpsz6t1718591723tbphd7e
X-QQ-Originating-IP: /AI5/DWK6Ka4Eft1aYTQyvsr4t/GicHxKFCrU3cA+4c=
Received: from HX01040082.powercore.com.cn ( [14.19.141.254])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 17 Jun 2024 10:35:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16799335354651430
From: Jinglin Wen <jinglin.wen@shingroup.cn>
To: npiggin@gmail.com
Subject: [PATCH] powerpc: Fixed duplicate copying in the early boot.
Date: Mon, 17 Jun 2024 10:35:09 +0800
Message-Id: <20240617023509.5674-1-jinglin.wen@shingroup.cn>
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
Cc: masahiroy@kernel.org, linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, jinglin.wen@shingroup.cn
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

According to the code logic, when the kernel is loaded to address 0,
no copying operation should be performed, but it is currently being
done.

This patch fixes the issue where the kernel code was incorrectly
duplicated to address 0 when booting from address 0.

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

