Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 954B03D52CB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 07:20:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GY7Yj3GdJz3bcp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 15:20:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256 header.s=mail3 header.b=TYBJCslV;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256 header.s=mail3 header.b=HFsG8wpL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inbox.ru (client-ip=94.100.179.50; helo=fallback15.mail.ru;
 envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail3 header.b=TYBJCslV; 
 dkim=pass (1024-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail3 header.b=HFsG8wpL; 
 dkim-atps=neutral
Received: from fallback15.mail.ru (fallback15.mail.ru [94.100.179.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GY7Y60PVCz2xfL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 15:20:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=t1Uh5KTwLCMvfNZqiWZTCHU59a6VhHwc3c34OkzXXK0=; 
 t=1627276826;x=1627882226; 
 b=TYBJCslVA927sP0CEOH72VHj+oJou+9FG+2RViJXLBXBDGeqrC6e4OwzjStwHaMXLZobKf25XLL0TaKfyjbLFG6VUVadQn//eUa5xtTHpWExjCl9veilKVfMdo11WvMaLWzcA421BqDZzd/HB1v+nDfXsC+BBf4sz7aC+57t7Xk=;
Received: from [10.161.64.51] (port=52486 helo=smtp43.i.mail.ru)
 by fallback15.m.smailru.net with esmtp (envelope-from <fido_max@inbox.ru>)
 id 1m7t2L-0000hP-Cc; Mon, 26 Jul 2021 08:20:21 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=t1Uh5KTwLCMvfNZqiWZTCHU59a6VhHwc3c34OkzXXK0=; 
 t=1627276821;x=1627882221; 
 b=HFsG8wpL/yfnCULCtowXdU/lai1vO/kyqsNcq8D+wVkP4RIZ1aFT6zu3Sj8SQk8rMOxVRil4j1toTa2JlJmzafFDcc8WTKEgKHMQyLMrFoLYBjfC/Tlvi3IRxswaNyOZ1G+7d7UiMjd8Ndb9fftyTSUhqkSxnBr41xadI7dWJ8k=;
Received: by smtp43.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1m7t2B-0005FX-OU; Mon, 26 Jul 2021 08:20:12 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3] soc: fsl: qe: convert QE interrupt controller to
 platform_device
Date: Mon, 26 Jul 2021 08:22:17 +0300
Message-Id: <20210726052217.13558-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD941C43E597735A9C3D3726AD0AC8C7907896201F0AD2BBAE8182A05F5380850409D28132A2A740F627A359249B08D8940F9DEA757F337415BC037DA5BA24F7E8A
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE75263010198C72082EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063732727FD5A4355FD18638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D886EBC48F350539DBA23B9703778B5A996F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7A29E2F051442AF778941B15DA834481FA18204E546F3947C1E44367C8E80A7B4F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637BA2F0AEB80054583389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F79006376B150EEEA420D0FBD81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE7F8413B35385CE433EC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C361DD96311B40C2D435872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C7941123239F7850421C1E794AB7149D6CD8E38C4B36944A89C2B6934AE262D3EE7EAB7254005DCED1C8AEA1E975C27AC1E0A4E2319210D9B64D260DF9561598F01A9E91200F654B03031C89702B531498E8E86DC7131B365E7726E8460B7C23C
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D342833AC5E8E9ACF1C3ABECC5E186177B3E36FFADD1680F45A81D3DC0E074A8F2DC01EDAC4EB81FB9E1D7E09C32AA3244C5ED05D3279869C37F426C3C0ED5C82E4408A6A02710B7304ED98077840A144B9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojBHzp66hWLW2MmQ0+nR2bnA==
X-Mailru-Sender: 11C2EC085EDE56FA9C10FA2967F5AB24CC4E7603B3CCE21D85B7A77D3600FEFAED25AD0588FA7D16EE9242D420CFEBFD3DDE9B364B0DF2891A624F84B2C74EDA4239CF2AF0A6D4F80DA7A0AF5A3A8387
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4DE24245422D83CE6F6EF26CB7A2DAAF275B90700DCC5904E049FFFDB7839CE9E790A577F25633BAC67FF5625DE986C47671D1F33D48B04C16C06AFB9415F9DAB
X-7FA49CB5: 0D63561A33F958A53A8332BA8FC104A37DDD5463A4D6D3C10E8979EBC08A0069CACD7DF95DA8FC8BD5E8D9A59859A8B60417BEADF48D1460CC7F00164DA146DAFE8445B8C89999728AA50765F7900637E9F91455EEDB1B70389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8188B2BFCDC338A02F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C1DAA61796BF5227B302FCEF25BFAB3454AD6D5ED66289B52698AB9A7B718F8C442539A7722CA490CD5E8D9A59859A8B608F55DA9FB1C18C0089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C7941123239F785042FC38361DF28E973E5FBA43393BAB56E9C2B6934AE262D3EE7EAB7254005DCED1C8AEA1E975C27AC699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojBHzp66hWLW2e5HZ12CN1GA==
X-Mailru-MI: 800
X-Mailru-Sender: A5480F10D64C900579012F43D24554B08AB642A06AF0B9C7F1EFB9C2FF11262D398300F31D255910C099ADC76E806A99D50E20E2BC48EF5A30D242760C51EA9CEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
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
Cc: kernel test robot <lkp@intel.com>, saravanak@google.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, leoyang.li@nxp.com,
 Maxim Kochetkov <fido_max@inbox.ru>, Dan Carpenter <dan.carpenter@oracle.com>,
 linux-arm-kernel@lists.infradead.org, qiang.zhao@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since 5.13 QE's ucc nodes can't get interrupts from devicetree:

	ucc@2000 {
		cell-index = <1>;
		reg = <0x2000 0x200>;
		interrupts = <32>;
		interrupt-parent = <&qeic>;
	};

Now fw_devlink expects driver to create and probe a struct device
for interrupt controller.

So lets convert this driver to simple platform_device with probe().
Also use platform_get_ and devm_ family function to get/allocate
resources and drop unused .compatible = "qeic".

[1] - https://lore.kernel.org/lkml/CAGETcx9PiX==mLxB9PO8Myyk6u2vhPVwTMsA5NkD-ywH5xhusw@mail.gmail.com
Fixes: e590474768f1 ("driver core: Set fw_devlink=on by default")
Fixes: ea718c699055 ("Revert "Revert "driver core: Set fw_devlink=on by default""")
Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Changes in v3:
 - use .compatible = "qeic" again (Li Yang <leoyang.li@nxp.com> asks to keep it)
 
Changes in v2:
 - use devm_ family functions to allocate mem/resources
 - use platform_get_ family functions to get resources/irqs
 - drop unused .compatible = "qeic"

 drivers/soc/fsl/qe/qe_ic.c | 75 ++++++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 31 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
index 3f711c1a0996..54cabd2605dd 100644
--- a/drivers/soc/fsl/qe/qe_ic.c
+++ b/drivers/soc/fsl/qe/qe_ic.c
@@ -23,6 +23,7 @@
 #include <linux/signal.h>
 #include <linux/device.h>
 #include <linux/spinlock.h>
+#include <linux/platform_device.h>
 #include <asm/irq.h>
 #include <asm/io.h>
 #include <soc/fsl/qe/qe.h>
@@ -404,41 +405,40 @@ static void qe_ic_cascade_muxed_mpic(struct irq_desc *desc)
 	chip->irq_eoi(&desc->irq_data);
 }
 
-static void __init qe_ic_init(struct device_node *node)
+static int qe_ic_init(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	void (*low_handler)(struct irq_desc *desc);
 	void (*high_handler)(struct irq_desc *desc);
 	struct qe_ic *qe_ic;
-	struct resource res;
-	u32 ret;
+	struct resource *res;
+	struct device_node *node = pdev->dev.of_node;
 
-	ret = of_address_to_resource(node, 0, &res);
-	if (ret)
-		return;
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (res == NULL) {
+		dev_err(dev, "no memory resource defined\n");
+		return -ENODEV;
+	}
 
-	qe_ic = kzalloc(sizeof(*qe_ic), GFP_KERNEL);
+	qe_ic = devm_kzalloc(dev, sizeof(*qe_ic), GFP_KERNEL);
 	if (qe_ic == NULL)
-		return;
+		return -ENOMEM;
 
-	qe_ic->irqhost = irq_domain_add_linear(node, NR_QE_IC_INTS,
-					       &qe_ic_host_ops, qe_ic);
-	if (qe_ic->irqhost == NULL) {
-		kfree(qe_ic);
-		return;
+	qe_ic->regs = devm_ioremap(dev, res->start, resource_size(res));
+	if (qe_ic->regs == NULL) {
+		dev_err(dev, "failed to ioremap() registers\n");
+		return -ENODEV;
 	}
 
-	qe_ic->regs = ioremap(res.start, resource_size(&res));
-
 	qe_ic->hc_irq = qe_ic_irq_chip;
 
-	qe_ic->virq_high = irq_of_parse_and_map(node, 0);
-	qe_ic->virq_low = irq_of_parse_and_map(node, 1);
+	qe_ic->virq_high = platform_get_irq(pdev, 0);
+	qe_ic->virq_low = platform_get_irq(pdev, 1);
 
-	if (!qe_ic->virq_low) {
-		printk(KERN_ERR "Failed to map QE_IC low IRQ\n");
-		kfree(qe_ic);
-		return;
+	if (qe_ic->virq_low < 0) {
+		return -ENODEV;
 	}
+
 	if (qe_ic->virq_high != qe_ic->virq_low) {
 		low_handler = qe_ic_cascade_low;
 		high_handler = qe_ic_cascade_high;
@@ -447,6 +447,13 @@ static void __init qe_ic_init(struct device_node *node)
 		high_handler = NULL;
 	}
 
+	qe_ic->irqhost = irq_domain_add_linear(node, NR_QE_IC_INTS,
+					       &qe_ic_host_ops, qe_ic);
+	if (qe_ic->irqhost == NULL) {
+		dev_err(dev, "failed to add irq domain\n");
+		return -ENODEV;
+	}
+
 	qe_ic_write(qe_ic->regs, QEIC_CICR, 0);
 
 	irq_set_handler_data(qe_ic->virq_low, qe_ic);
@@ -456,20 +463,26 @@ static void __init qe_ic_init(struct device_node *node)
 		irq_set_handler_data(qe_ic->virq_high, qe_ic);
 		irq_set_chained_handler(qe_ic->virq_high, high_handler);
 	}
+	return 0;
 }
+static const struct of_device_id qe_ic_ids[] = {
+	{ .compatible = "fsl,qe-ic"},
+	{ .compatible = "qeic"},
+	{},
+};
 
-static int __init qe_ic_of_init(void)
+static struct platform_driver qe_ic_driver =
 {
-	struct device_node *np;
+	.driver	= {
+		.name		= "qe-ic",
+		.of_match_table	= qe_ic_ids,
+	},
+	.probe	= qe_ic_init,
+};
 
-	np = of_find_compatible_node(NULL, NULL, "fsl,qe-ic");
-	if (!np) {
-		np = of_find_node_by_type(NULL, "qeic");
-		if (!np)
-			return -ENODEV;
-	}
-	qe_ic_init(np);
-	of_node_put(np);
+static int __init qe_ic_of_init(void)
+{
+	platform_driver_register(&qe_ic_driver);
 	return 0;
 }
 subsys_initcall(qe_ic_of_init);
-- 
2.31.1

