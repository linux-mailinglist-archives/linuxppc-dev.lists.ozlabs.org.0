Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8618A892671
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 22:55:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5vNh2gs6z3vjs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Mar 2024 08:55:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5vND2twPz3dWQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Mar 2024 08:55:22 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rqKBa-0004gm-2H; Fri, 29 Mar 2024 22:54:54 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rqKBX-009GMO-Re; Fri, 29 Mar 2024 22:54:51 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rqKBX-00DTkA-2T;
	Fri, 29 Mar 2024 22:54:51 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Dawei Li <set_pte_at@outlook.com>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] serial: pmac_zilog: Drop usage of platform_driver_probe()
Date: Fri, 29 Mar 2024 22:54:43 +0100
Message-ID: <5ea3174616abc9fa256f115b4fb175d289ac1754.1711748999.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2e3783106bf6bd9a7bdeb12b706378fb16316471.1711748999.git.u.kleine-koenig@pengutronix.de>
References: <2e3783106bf6bd9a7bdeb12b706378fb16316471.1711748999.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2095; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=u1UhruhrTBacTG5k8fHeAqtFCEXrhLT1PXtH1xxAtAA=; b=owGbwMvMwMXY3/A7olbonx/jabUkhjR2i+Usnzv+dSVtseae9CZXZd72KOkmQ4cc419MLt/fL c607rzRyWjMwsDIxSArpshi37gm06pKLrJz7b/LMINYmUCmMHBxCsBEKhzZ//BdMynhn/h7kvJm QdY89rAlGvOLLzzeJuCoczCGIZVjvdAzl0DfX5c7giyjgxOOqHxq4rlncs0m6de+syWn2Lgd5Rp YV0bo/ThwnCkpV1X0411eSSbHufMkLCYV/P+64etzMaO4Ah056YknHJfnnzXS2pf84l7Tdv/pZ7 XvLfjLscXX8q2l9GIbTt3frrwW3g1L6mOuuCXsP/b6nnNEqPP65ftE5/PvLt697bLSdKXvBaYuZ 8Xjm+ZPL7p2tcAgyP6b+szXZdMsPxXHWlsWbU7eevNjnkvS9DOucy+b71GJurNdxaWnTXKSefgu jbDuLdlNPccCEjfOF7Rszwp2b1qXJ20ik3BBYW11iZ8UAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
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
Cc: kernel@pengutronix.de, linux-kbuild@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, linux-serial@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are considerations to drop platform_driver_probe() as a concept
that isn't relevant any more today. It comes with an added complexity
that makes many users hold it wrong. (E.g. this driver should have
marked the driver struct with __refdata to prevent the below mentioned
false positive section mismatch warning.)

This fixes a W=1 build warning:

	WARNING: modpost: drivers/tty/serial/pmac_zilog: section mismatch in reference: pmz_driver+0x8 (section: .data) -> pmz_detach (section: .exit.text)

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/tty/serial/pmac_zilog.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/pmac_zilog.c b/drivers/tty/serial/pmac_zilog.c
index 05d97e89511e..e44621218248 100644
--- a/drivers/tty/serial/pmac_zilog.c
+++ b/drivers/tty/serial/pmac_zilog.c
@@ -1695,7 +1695,7 @@ static void pmz_dispose_port(struct uart_pmac_port *uap)
 	memset(uap, 0, sizeof(struct uart_pmac_port));
 }
 
-static int __init pmz_attach(struct platform_device *pdev)
+static int pmz_attach(struct platform_device *pdev)
 {
 	struct uart_pmac_port *uap;
 	int i;
@@ -1714,7 +1714,7 @@ static int __init pmz_attach(struct platform_device *pdev)
 	return uart_add_one_port(&pmz_uart_reg, &uap->port);
 }
 
-static void __exit pmz_detach(struct platform_device *pdev)
+static void pmz_detach(struct platform_device *pdev)
 {
 	struct uart_pmac_port *uap = platform_get_drvdata(pdev);
 
@@ -1789,7 +1789,8 @@ static struct macio_driver pmz_driver = {
 #else
 
 static struct platform_driver pmz_driver = {
-	.remove_new	= __exit_p(pmz_detach),
+	.probe		= pmz_attach,
+	.remove_new	= pmz_detach,
 	.driver		= {
 		.name		= "scc",
 	},
@@ -1837,7 +1838,7 @@ static int __init init_pmz(void)
 #ifdef CONFIG_PPC_PMAC
 	return macio_register_driver(&pmz_driver);
 #else
-	return platform_driver_probe(&pmz_driver, pmz_attach);
+	return platform_driver_register(&pmz_driver);
 #endif
 }
 
base-commit: a6bd6c9333397f5a0e2667d4d82fef8c970108f2
-- 
2.43.0

