Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EDF3BBBFF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jul 2021 13:11:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GJNKv67Xtz308V
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jul 2021 21:11:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256 header.s=mail3 header.b=Mje9xQbG;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256 header.s=mail3 header.b=XXqf5sip;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inbox.ru (client-ip=94.100.179.30; helo=fallback13.mail.ru;
 envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail3 header.b=Mje9xQbG; 
 dkim=pass (1024-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail3 header.b=XXqf5sip; 
 dkim-atps=neutral
Received: from fallback13.mail.ru (fallback13.mail.ru [94.100.179.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GJNKK1cQYz2yyt
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Jul 2021 21:11:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=0JSq341hUaDJxvrGsqoGbS/XvjES/KBQcib8iJgSgKg=; 
 t=1625483461;x=1626088861; 
 b=Mje9xQbGBZ/yjpJc8wNl4qq9Kf4mv8hgZt3tcv7YwZATDqbpRLm2fGsRVG15wm2P4qgowmt135FEcOOev/IeBPlqe5WHM5zG+7aZzd9IGYHy3KdB2Uc0mdJfXjVP0KNrNaK4RE0lqjTMjw4KZ7LkXKWt5yWBOdaK/wR7euEeIj0=;
Received: from [10.161.64.54] (port=35916 helo=smtp46.i.mail.ru)
 by fallback13.m.smailru.net with esmtp (envelope-from <fido_max@inbox.ru>)
 id 1m0MV6-0001c2-2H; Mon, 05 Jul 2021 14:10:56 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=0JSq341hUaDJxvrGsqoGbS/XvjES/KBQcib8iJgSgKg=; 
 t=1625483456;x=1626088856; 
 b=XXqf5siprxyk5YnoNWwOV730UIxWvRc6vu8RR0oxr82C4Y3zieUVeyDhnLRN0cc019UOwbO3nbFr+aQYw2sYq9G9FpncmAL+zdCkqrekVmn/u0oRnNQzMIzB/X1flmJJWy0ysDf1K2i9BiZ02yuA3m3C+fVKivtboW1FDgN5dVM=;
Received: by smtp46.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1m0MUx-0005TK-Kv; Mon, 05 Jul 2021 14:10:48 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] soc: fsl: qe: convert QE interrupt controller to
 platform_device
Date: Mon,  5 Jul 2021 14:12:50 +0300
Message-Id: <20210705111250.1513634-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD954DFF1DC42D673FB4F75AC5594ACDC16869A51A860A12816182A05F538085040DB55102748385198C44E13673184730B370CEAC6C2AF08E5AA9A1DCD7358FCA3
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE792C68BF9CD4C0E9EEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063716A4A39B750036BB8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8606CF9C6503E1DDBFB3619910757EB4F6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE71AE4D56B06699BBC9FA2833FD35BB23D9E625A9149C048EE140C956E756FBB7ACB629EEF1311BF91D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B990B2EB4F061288CA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FCB3914F264D7CCEB7D81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE746E395755886ED45CD04E86FAF290E2D7E9C4E3C761E06A71DD303D21008E29813377AFFFEAFD269A417C69337E82CC2E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B6A45692FFBBD75A6A089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-B7AD71C0: AC4F5C86D027EB782CDD5689AFBDA7A24209795067102C07E8F7B195E1C97831133F3891C382AB3DDEE0BF9F2B90C42B
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C62E2A2CC9B321AEE80404625108A7D3BAF9B4544A6E5FFED9C2B6934AE262D3EE7EAB7254005DCED556CBE7F905700A49510FB958DCE06DB6ED91DBE5ABE359A3485EE9140A7D39D7D06A436E56C8DB493EDB24507CE13387DFF0A840B692CF8
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D344FDECC3B9E4D57D4F1305AFF9A30A59688F2E32EBDC5888080AF857279C2BC83BABBEC764E6F27D31D7E09C32AA3244CE0610C78B268535A7FC213296340AD9460759606DA2E136AAD832FF50B3043B1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj5fH2RN9TpJl1sLNQHw49/g==
X-Mailru-Sender: 11C2EC085EDE56FA9C10FA2967F5AB240F3093F39B28524E5760718BE8B684BB0121305522DCE51AEE9242D420CFEBFD3DDE9B364B0DF2891A624F84B2C74EDA4239CF2AF0A6D4F80DA7A0AF5A3A8387
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4AF5E86D184BC81F83CDC0DACDC54A29E165A03DC9BE1A2F7049FFFDB7839CE9ED4060E524F1F96E66640C8BB248A2CE56824E6024325BD2F02F9A4A7FA149467
X-7FA49CB5: 0D63561A33F958A5DFEBEB9284B870DB744A2269A7D78893EDFF8D39DD2CC48CCACD7DF95DA8FC8BD5E8D9A59859A8B6E1463053F949B17DCC7F00164DA146DAFE8445B8C89999728AA50765F79006372389C3B161C5B535389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC87A515FDF34F84F9CF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C1DAA61796BF5227B302FCEF25BFAB3454AD6D5ED66289B52698AB9A7B718F8C442539A7722CA490CD5E8D9A59859A8B6F7FD1A3A8AE6177F089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C62E2A2CC9B321AEE7EB073028AC8D5AD85417A7E211F15859C2B6934AE262D3EE7EAB7254005DCED556CBE7F905700A4DC48ACC2A39D04F89CDFB48F4795C241BDAD6C7F3747799A
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj5fH2RN9TpJnxN8/P2iiCfg==
X-Mailru-MI: 800
X-Mailru-Sender: A5480F10D64C9005C3FADA55C8765CC357C9409653FBB352AF56D900923958144F784A941F346434C099ADC76E806A99D50E20E2BC48EF5A30D242760C51EA9CEAB4BC95F72C04283CDA0F3B3F5B9367
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
Cc: saravanak@google.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, leoyang.li@nxp.com,
 Maxim Kochetkov <fido_max@inbox.ru>, linux-arm-kernel@lists.infradead.org,
 qiang.zhao@nxp.com
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

[1] - https://lore.kernel.org/lkml/CAGETcx9PiX==mLxB9PO8Myyk6u2vhPVwTMsA5NkD-ywH5xhusw@mail.gmail.com
Fixes: e590474768f1 ("driver core: Set fw_devlink=on by default")
Fixes: ea718c699055 ("Revert "Revert "driver core: Set fw_devlink=on by default""")
Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 drivers/soc/fsl/qe/qe_ic.c | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
index 3f711c1a0996..03d291376895 100644
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
@@ -404,27 +405,28 @@ static void qe_ic_cascade_muxed_mpic(struct irq_desc *desc)
 	chip->irq_eoi(&desc->irq_data);
 }
 
-static void __init qe_ic_init(struct device_node *node)
+static int qe_ic_init(struct platform_device *pdev)
 {
 	void (*low_handler)(struct irq_desc *desc);
 	void (*high_handler)(struct irq_desc *desc);
 	struct qe_ic *qe_ic;
 	struct resource res;
+	struct device_node *node = pdev->dev.of_node;
 	u32 ret;
 
 	ret = of_address_to_resource(node, 0, &res);
 	if (ret)
-		return;
+		return -ENODEV;
 
 	qe_ic = kzalloc(sizeof(*qe_ic), GFP_KERNEL);
 	if (qe_ic == NULL)
-		return;
+		return -ENOMEM;
 
 	qe_ic->irqhost = irq_domain_add_linear(node, NR_QE_IC_INTS,
 					       &qe_ic_host_ops, qe_ic);
 	if (qe_ic->irqhost == NULL) {
 		kfree(qe_ic);
-		return;
+		return -ENODEV;
 	}
 
 	qe_ic->regs = ioremap(res.start, resource_size(&res));
@@ -437,7 +439,7 @@ static void __init qe_ic_init(struct device_node *node)
 	if (!qe_ic->virq_low) {
 		printk(KERN_ERR "Failed to map QE_IC low IRQ\n");
 		kfree(qe_ic);
-		return;
+		return -ENODEV;
 	}
 	if (qe_ic->virq_high != qe_ic->virq_low) {
 		low_handler = qe_ic_cascade_low;
@@ -456,20 +458,26 @@ static void __init qe_ic_init(struct device_node *node)
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

