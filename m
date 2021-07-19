Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B043CD1B0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jul 2021 12:17:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GSySy74C6z3bdS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jul 2021 20:17:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256 header.s=mail3 header.b=SgAojLQ9;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256 header.s=mail3 header.b=nBlNfdCq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inbox.ru (client-ip=185.5.136.250; helo=fallback18.mail.ru;
 envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail3 header.b=SgAojLQ9; 
 dkim=pass (1024-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail3 header.b=nBlNfdCq; 
 dkim-atps=neutral
Received: from fallback18.mail.ru (fallback18.mail.ru [185.5.136.250])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GSyST0DNlz3096
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jul 2021 20:16:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=AH3AQGQssEwPU7d2s3xspWmeP3oF/hbdUTlfHeB4fxc=; 
 t=1626689817;x=1627295217; 
 b=SgAojLQ9mTuVVh4Nl7Z8vMqWFVrVMMU94+YdVXn6mOyQ7322d45KaoBzuCHThuGPTDRvLRnf5sOssOC8phJYW+PlORabjBj7zjbrMSy1C/y3aG0PBpj93fPrjRTwLwoVHzgFQXe7Vz2Gr2PX/esTTG7EQMUZ/w+pLjghjYw9tRQ=;
Received: from [10.161.64.43] (port=55604 helo=smtp35.i.mail.ru)
 by fallback18.m.smailru.net with esmtp (envelope-from <fido_max@inbox.ru>)
 id 1m5QKR-0003Aa-7a; Mon, 19 Jul 2021 13:16:51 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=AH3AQGQssEwPU7d2s3xspWmeP3oF/hbdUTlfHeB4fxc=; 
 t=1626689811;x=1627295211; 
 b=nBlNfdCqGhtgZIfODVzSMknlZxhbli73SMhFhDTtdkV2rd0snhtjCTmLxYfFr+fdEKB1esC6jc50A1aW6/SKMsEWjzaTJieT823ihnCDOJ+nTUDWyckxi1nCp7oYOW0FdQsj4Gd+lMWdpY9pKXi46VeBOjKZtW4nEjen5K6abxQ=;
Received: by smtp35.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1m5QKF-00066N-6L; Mon, 19 Jul 2021 13:16:39 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] soc: fsl: qe: convert QE interrupt controller to
 platform_device
Date: Mon, 19 Jul 2021 13:18:33 +0300
Message-Id: <20210719101833.309144-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD941C43E597735A9C30A5AB0699C09BB51962E4FF0DD431C8A182A05F5380850407F9EF3D8EACC20344D0E6F190B36660D85696A2F20B99FCC0B71A31F8CC4626F
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE749E89BD568380EECC2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE7081BBE264C6D7F42EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BBCA57AF85F7723F2588942CBE9C4DCC6A38CDCB2AADA3CCC20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0C26CFBAC0749D213D2E47CDBA5A96583C09775C1D3CA48CFFB12F4B11BB5604F117882F4460429724CE54428C33FAD30A8DF7F3B2552694AC26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE72B26B6EDD975AFD79FA2833FD35BB23DF004C90652538430302FCEF25BFAB3454AD6D5ED66289B5278DA827A17800CE76AB336022F3E552F7B076A6E789B0E97A8DF7F3B2552694A1E7802607F20496D49FD398EE364050F4B6963042765DA4BF206494F22AA87D6B3661434B16C20AC78D18283394535A9E827F84554CEF5019E625A9149C048EE9ECD01F8117BC8BEE2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8B53A69B3AC30C7B9475ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CBC3D6B4D9834ECA7444C1F14250B450E5DFA00C29AF5D1FE9C2B6934AE262D3EE7EAB7254005DCED1C8AEA1E975C27AC1E0A4E2319210D9B64D260DF9561598F01A9E91200F654B03031C89702B531498E8E86DC7131B365E7726E8460B7C23C
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3407FE5477D6A8AF08D172D1D17B52EE63C1E74ADBE15B7531FFA46B7C28A5072134844C91B17161331D7E09C32AA3244C67AC0682F06EEE3B984BF526575F3F5C24AF4FAF06DA24FDED98077840A144B9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj+8+KVR9NZrGMzd670Ejc5w==
X-Mailru-Sender: 11C2EC085EDE56FA9C10FA2967F5AB24C08073A0D9A01B493DF1B0D1F34548D9A5903AE3659B16EBEE9242D420CFEBFD3DDE9B364B0DF2891A624F84B2C74EDA4239CF2AF0A6D4F80DA7A0AF5A3A8387
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4DE24245422D83CE6F6EF26CB7A2DAAF2F40F2CDA6349448C049FFFDB7839CE9E74D7C836B7A62AF38E58A8EC19852720247124C3526288949C9A42C5CDFDCA13
X-7FA49CB5: 0D63561A33F958A5EDD4A04AF743EB0442DED4C6DC6FF9D66E8DE7EDB0D2EDD5CACD7DF95DA8FC8BD5E8D9A59859A8B64071617579528AACCC7F00164DA146DAFE8445B8C89999728AA50765F7900637F3DB775AA22245C5389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC816F36C0CB6DCE122F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947CDA7BFA4571439BB29735652A29929C6C4AD6D5ED66289B52698AB9A7B718F8C442539A7722CA490CD5E8D9A59859A8B60E26A56DB46E81E4089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CBC3D6B4D9834ECA7B773800ABDD042F1DE0C775CEFA443369C2B6934AE262D3EE7EAB7254005DCED1C8AEA1E975C27AC699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj+8+KVR9NZrHF4odmTi5Kuw==
X-Mailru-MI: 800
X-Mailru-Sender: A5480F10D64C90059EC859477DBBED74CEE54543C8E280F5C17EF9519CB6243EB79490FA07EBBC7EC099ADC76E806A99D50E20E2BC48EF5A30D242760C51EA9CEAB4BC95F72C04283CDA0F3B3F5B9367
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
Changes in v2:
 - use devm_ family functions to allocate mem/resources
 - use platform_get_ family functions to get resources/irqs
 - drop unused .compatible = "qeic"
 
 drivers/soc/fsl/qe/qe_ic.c | 74 ++++++++++++++++++++++----------------
 1 file changed, 43 insertions(+), 31 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
index 3f711c1a0996..07db977df349 100644
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
@@ -456,20 +463,25 @@ static void __init qe_ic_init(struct device_node *node)
 		irq_set_handler_data(qe_ic->virq_high, qe_ic);
 		irq_set_chained_handler(qe_ic->virq_high, high_handler);
 	}
+	return 0;
 }
+static const struct of_device_id qe_ic_ids[] = {
+	{ .compatible = "fsl,qe-ic"},
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

