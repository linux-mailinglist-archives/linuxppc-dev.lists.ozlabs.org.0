Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D9090FB63
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 04:49:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4Q1F50G2z3cY0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 12:49:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=43.155.80.173; helo=bg5.exmail.qq.com; envelope-from=jinglin.wen@shingroup.cn; receiver=lists.ozlabs.org)
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.155.80.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4Q0r2cj8z30TK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 12:48:43 +1000 (AEST)
X-QQ-mid: bizesmtp89t1718851638tsf77eb2
X-QQ-Originating-IP: Cnxcf0yE6w+MsvywbXobZi1OIKdeiMnOlWen8+fPLAs=
Received: from HX01040082.powercore.com.cn ( [14.19.141.254])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 20 Jun 2024 10:47:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16810093544147674005
From: Jinglin Wen <jinglin.wen@shingroup.cn>
To: mpe@ellerman.id.au
Subject: [PATCH v2] powerpc: Fix unnecessary copy to 0 when kernel is booted at address 0.
Date: Thu, 20 Jun 2024 10:41:50 +0800
Message-Id: <20240620024150.14857-1-jinglin.wen@shingroup.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240617023509.5674-1-jinglin.wen@shingroup.cn>
References: <20240617023509.5674-1-jinglin.wen@shingroup.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz5a-2
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
Cc: masahiroy@kernel.org, linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Jinglin Wen <jinglin.wen@shingroup.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

According to the code logic, when the kernel is loaded to address 0,
no copying operation should be performed, but it is currently being
done.

This patch fixes the issue where the kernel code was incorrectly
duplicated to address 0 when booting from address 0.

Fixes: b270bebd34e3 ("powerpc/64s: Run at the kernel virtual address earlier in boot")
Signed-off-by: Jinglin Wen <jinglin.wen@shingroup.cn>
Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Cc: <stable@vger.kernel.org>
---

v2:
  - According to 87le336c6k.fsf@mail.lhotse, improve this patch.
v1:
  - 20240617023509.5674-1-jinglin.wen@shingroup.cn

 arch/powerpc/kernel/head_64.S | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 4690c219bfa4..63432a33ec49 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -647,8 +647,9 @@ __after_prom_start:
  * Note: This process overwrites the OF exception vectors.
  */
 	LOAD_REG_IMMEDIATE(r3, PAGE_OFFSET)
-	mr.	r4,r26			/* In some cases the loader may  */
-	beq	9f			/* have already put us at zero */
+	mr	r4,r26			/* Load the virtual source address into r4 */
+	cmpld	r3,r4			/* Check if source == dest */
+	beq	9f			/* If so skip the copy  */
 	li	r6,0x100		/* Start offset, the first 0x100 */
 					/* bytes were copied earlier.	 */
 
-- 
2.25.1

