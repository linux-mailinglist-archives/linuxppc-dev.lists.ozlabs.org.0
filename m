Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 911A0126585
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 16:18:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dwWC2Qh1zDq99
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2019 02:18:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linutronix.de
 (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de;
 envelope-from=bigeasy@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dwSd5lx7zDqrV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Dec 2019 02:16:16 +1100 (AEDT)
Received: from localhost ([127.0.0.1] helo=flow.W.breakpoint.cc)
 by Galois.linutronix.de with esmtp (Exim 4.80)
 (envelope-from <bigeasy@linutronix.de>)
 id 1ihxX4-0006SA-LZ; Thu, 19 Dec 2019 16:16:06 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/85xx: Get twr_p102x to compile again
Date: Thu, 19 Dec 2019 16:16:02 +0100
Message-Id: <20191219151602.1908411-1-bigeasy@linutronix.de>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: Scott Wood <oss@buserror.net>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With CONFIG_QUICC_ENGINE enabled and CONFIG_UCC_GETH + CONFIG_SERIAL_QE
disabled we have an unused variable (np). The code won't compile with
-Werror.

Move the np variable to the block where it is actually used.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/powerpc/platforms/85xx/twr_p102x.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/twr_p102x.c b/arch/powerpc/platfor=
ms/85xx/twr_p102x.c
index 6c3c0cdaee9ad..b301ef9d6ce75 100644
--- a/arch/powerpc/platforms/85xx/twr_p102x.c
+++ b/arch/powerpc/platforms/85xx/twr_p102x.c
@@ -60,10 +60,6 @@ static void __init twr_p1025_pic_init(void)
  */
 static void __init twr_p1025_setup_arch(void)
 {
-#ifdef CONFIG_QUICC_ENGINE
-	struct device_node *np;
-#endif
-
 	if (ppc_md.progress)
 		ppc_md.progress("twr_p1025_setup_arch()", 0);
=20
@@ -77,6 +73,7 @@ static void __init twr_p1025_setup_arch(void)
 #if IS_ENABLED(CONFIG_UCC_GETH) || IS_ENABLED(CONFIG_SERIAL_QE)
 	if (machine_is(twr_p1025)) {
 		struct ccsr_guts __iomem *guts;
+		struct device_node *np;
=20
 		np =3D of_find_compatible_node(NULL, NULL, "fsl,p1021-guts");
 		if (np) {
--=20
2.24.0

