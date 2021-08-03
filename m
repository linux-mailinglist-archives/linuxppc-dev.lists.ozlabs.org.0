Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C02703DEBDF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Aug 2021 13:34:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfCT24ZQnz3bZ6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Aug 2021 21:34:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256 header.s=mail3 header.b=gB4ZiJSm;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256 header.s=mail3 header.b=k6o0ctCW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inbox.ru (client-ip=185.5.136.252; helo=fallback20.mail.ru;
 envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail3 header.b=gB4ZiJSm; 
 dkim=pass (1024-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail3 header.b=k6o0ctCW; 
 dkim-atps=neutral
Received: from fallback20.mail.ru (fallback20.mail.ru [185.5.136.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfCSS1zDTz2yhF
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Aug 2021 21:33:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=5J1LAkOStwLr5Szy1OrD59ZeHyDPT07+QyClKVIYwn8=; 
 t=1627990440;x=1628595840; 
 b=gB4ZiJSmoXagxQeacOauNrXggmb59VRCkG/9XYXzmiV3W5JebQr+JcewehwxuWzqexOilHOxJTE91HhZ1lJ0DBarPSyH/23+tLWni8nEtUT3XDm5DzJf4APJ//ddSBNOZK5ZrSqCVZvjObSTjbLI7y7m6tovFYs+/T916oLkLgI=;
Received: from [10.161.25.38] (port=60436 helo=smtp61.i.mail.ru)
 by fallback20.m.smailru.net with esmtp (envelope-from <fido_max@inbox.ru>)
 id 1mAsgE-0005vW-En; Tue, 03 Aug 2021 14:33:54 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=5J1LAkOStwLr5Szy1OrD59ZeHyDPT07+QyClKVIYwn8=; 
 t=1627990434;x=1628595834; 
 b=k6o0ctCWBBct/0weeJWM/7iyZ+vXboFe16pM4bt/tkZ3bx9KOrMbR36CQrk6WM7hWl5eBVO5vEVPcqYVvZsj/9hANHJvpTKwalBSh8XX8XO8K6sOoS4Fod0+yhHnOvmrBinUnf3ooyEm21ePVYcTzpe2mw3OV6XCUi1OtqJq/cQ=;
Received: by smtp61.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1mAsg2-0004iv-AK; Tue, 03 Aug 2021 14:33:43 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4] soc: fsl: qe: convert QE interrupt controller to
 platform_device
Date: Tue,  3 Aug 2021 14:35:38 +0300
Message-Id: <20210803113538.560277-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD941C43E597735A9C36A98DBA789EBB6AE26DB9A6C1D9BF7E0182A05F53808504066AC962118594CD82AA12C898B944E40D1A14D3227BB309BB4A141AA88F7E734
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE70CB15FA6C489297DEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637B9ECF1867A781AFF8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8339D95D74413E4A942F837281D4603336F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE79AE9BAF3542BD4619FA2833FD35BB23D9E625A9149C048EEB1593CA6EC85F86D2CC0D3CB04F14752D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B0FC4FCDDD36A1EE6A471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FCF1FD787189321A053AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637DFF7D95064351EF7D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F83C798A30B85E16B42539A7722CA490CB5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C85811CA530B504913DA9E08479E341D8CF76A35945F360EF9C2B6934AE262D3EE7EAB7254005DCED1C8AEA1E975C27AC1E0A4E2319210D9B64D260DF9561598F01A9E91200F654B03031C89702B531498E8E86DC7131B365E7726E8460B7C23C
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34C786159FDC4342B07AB2F74F2D016C42B064E933508F7FFE73DEC9C1812D95982C6F047A2D1AE3D51D7E09C32AA3244C830611220198631E6BEDBD64134B7BE555E75C8D0ED9F6EEED98077840A144B9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj9N286KAyvN7oC57uGb6Fww==
X-Mailru-Sender: 11C2EC085EDE56FA9C10FA2967F5AB24D4E199C00A9860967D9727C80553D0C5828D92E36CF2E653EE9242D420CFEBFD3DDE9B364B0DF2891A624F84B2C74EDA4239CF2AF0A6D4F80DA7A0AF5A3A8387
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4DE24245422D83CE6F6EF26CB7A2DAAF27C35BF5860D7129E049FFFDB7839CE9E46EDBEBD7A47596060E6CB7D164C5199477E3807A253DB6E6461F1AD2AA14E20
X-7FA49CB5: 0D63561A33F958A51FC20AD42B9911452530ED994695C0E99061C89B615004F5CACD7DF95DA8FC8BD5E8D9A59859A8B64071617579528AACCC7F00164DA146DAFE8445B8C89999728AA50765F79006372CF0B7F2E2D5057D389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC83820445CF21F0C3CF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947CDA7BFA4571439BB29735652A29929C6C4AD6D5ED66289B52698AB9A7B718F8C442539A7722CA490CD5E8D9A59859A8B67A7B0CDC955A1711089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C85811CA530B504919013A8C37DA2D177380209919B75AA789C2B6934AE262D3EE7EAB7254005DCED1C8AEA1E975C27AC699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj9N286KAyvN7IkOlGiLJxvg==
X-Mailru-MI: 800
X-Mailru-Sender: A5480F10D64C9005EA165EA48716E380AC789DBD41723ACC6A46957E4B27E5D15CE6193A6A9ACCF8C099ADC76E806A99D50E20E2BC48EF5A30D242760C51EA9CEAB4BC95F72C04283CDA0F3B3F5B9367
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
 drivers/soc/fsl/qe/qe_ic.c | 75 ++++++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 31 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
index 3f711c1a0996..e710d554425d 100644
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
+	{ .type = "qeic"},
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

