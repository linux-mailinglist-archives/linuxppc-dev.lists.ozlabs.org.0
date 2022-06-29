Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7165955F9F8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 10:07:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXvFW0bMnz3dv5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 18:07:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=nfschina.com (client-ip=2400:dd01:100f:2:72e2:84ff:fe10:5f45; helo=mail.nfschina.com; envelope-from=jiaming@nfschina.com; receiver=<UNKNOWN>)
Received: from mail.nfschina.com (unknown [IPv6:2400:dd01:100f:2:72e2:84ff:fe10:5f45])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXvF34Kq5z2ywJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 18:06:43 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
	by mail.nfschina.com (Postfix) with ESMTP id 43AF11E80D11;
	Wed, 29 Jun 2022 16:05:29 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
	by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tUf8Lkw4g-75; Wed, 29 Jun 2022 16:05:26 +0800 (CST)
Received: from localhost.localdomain (unknown [180.167.10.98])
	(Authenticated sender: jiaming@nfschina.com)
	by mail.nfschina.com (Postfix) with ESMTPA id 0029D1E80CDC;
	Wed, 29 Jun 2022 16:05:25 +0800 (CST)
From: Zhang Jiaming <jiaming@nfschina.com>
To: oss@buserror.net,
	mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org
Subject: [PATCH] powerpc: platforms: 85xx: Fix spelling mistake
Date: Wed, 29 Jun 2022 16:06:34 +0800
Message-Id: <20220629080634.29571-1-jiaming@nfschina.com>
X-Mailer: git-send-email 2.34.1
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
Cc: liqiong@nfschina.com, renyu@nfschina.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Zhang Jiaming <jiaming@nfschina.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Change 'wont' to 'won't'.

Signed-off-by: Zhang Jiaming <jiaming@nfschina.com>
---
 arch/powerpc/platforms/85xx/sgy_cts1000.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/sgy_cts1000.c b/arch/powerpc/platforms/85xx/sgy_cts1000.c
index 98ae64075193..a920852703ba 100644
--- a/arch/powerpc/platforms/85xx/sgy_cts1000.c
+++ b/arch/powerpc/platforms/85xx/sgy_cts1000.c
@@ -29,7 +29,7 @@ static const struct of_device_id child_match[] = {
 
 static void gpio_halt_wfn(struct work_struct *work)
 {
-	/* Likely wont return */
+	/* Likely won't return */
 	orderly_poweroff(true);
 }
 static DECLARE_WORK(gpio_halt_wq, gpio_halt_wfn);
@@ -51,7 +51,7 @@ static void __noreturn gpio_halt_cb(void)
 
 	printk(KERN_INFO "gpio-halt: triggering GPIO.\n");
 
-	/* Probably wont return */
+	/* Probably won't return */
 	gpio_set_value(gpio, trigger);
 
 	panic("Halt failed\n");
@@ -147,7 +147,7 @@ static int gpio_halt_remove(struct platform_device *pdev)
 
 static const struct of_device_id gpio_halt_match[] = {
 	/* We match on the gpio bus itself and scan the children since they
-	 * wont be matched against us. We know the bus wont match until it
+	 * won't be matched against us. We know the bus won't match until it
 	 * has been registered too. */
 	{
 		.compatible = "fsl,qoriq-gpio",
-- 
2.34.1

