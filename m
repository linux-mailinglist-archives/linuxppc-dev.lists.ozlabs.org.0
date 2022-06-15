Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 160F354D7A4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 03:58:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNlgX6dWXz3drK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 11:58:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=jtp6v+PU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.112; helo=m15112.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=jtp6v+PU;
	dkim-atps=neutral
X-Greylist: delayed 1882 seconds by postgrey-1.36 at boromir; Wed, 15 Jun 2022 22:39:37 AEST
Received: from m15112.mail.126.com (m15112.mail.126.com [220.181.15.112])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNPyK1jJ5z2xDY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jun 2022 22:39:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=58oAQ
	UJN8JUwGFEUGf4YZNmf+AqCGHJHSJulELfzgaU=; b=jtp6v+PUhO9GNmrF3z/lh
	0YvwA/qXsvMuR21y9cY0bfot3aw8wi2eiEyEFMCr4ZAoCAp8shH7dwgsnkp/X9cS
	JZENlIEfTmg6Q6SjQbpMi3Dr2de3eKq1qIwcayjuzFAnJjdSlP5q4bmNykTOvCLh
	pf/4HcfWS+IXJ+a+BIQH+U=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp2 (Coremail) with SMTP id DMmowABnegV1y6liCKo0DQ--.43270S2;
	Wed, 15 Jun 2022 20:07:18 +0800 (CST)
From: Liang He <windhl@126.com>
To: oss@buserror.net,
	mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org
Subject: [PATCH] arch: powerpc: platforms: 85xx: Add missing of_node_put in sgy_cts1000.c
Date: Wed, 15 Jun 2022 20:07:17 +0800
Message-Id: <20220615120717.3965164-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMmowABnegV1y6liCKo0DQ--.43270S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF4DZF45Cw48ur1rAr1UKFg_yoW8XFykpF
	s0kayfCFsrWryxGasrtas8CFy7t3W0qay7Jw1akws7C3W8X39Fvry8ZF4xXrn3uFW8G3yr
	Jr1ayayq9FsFv3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRT7KfUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGgchF1-HZTZrDwAAsE
X-Mailman-Approved-At: Thu, 16 Jun 2022 11:54:30 +1000
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
Cc: Liang He <windhl@126.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Liang He <windhl@126.com>
---
 arch/powerpc/platforms/85xx/sgy_cts1000.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/powerpc/platforms/85xx/sgy_cts1000.c b/arch/powerpc/platforms/85xx/sgy_cts1000.c
index 98ae64075193..2a45b30852b2 100644
--- a/arch/powerpc/platforms/85xx/sgy_cts1000.c
+++ b/arch/powerpc/platforms/85xx/sgy_cts1000.c
@@ -85,17 +85,24 @@ static int gpio_halt_probe(struct platform_device *pdev)
 	/* Technically we could just read the first one, but punish
 	 * DT writers for invalid form. */
 	if (of_gpio_count(halt_node) != 1)
+	{
+		of_node_put(halt_node);
 		return -EINVAL;
+	}
 
 	/* Get the gpio number relative to the dynamic base. */
 	gpio = of_get_gpio_flags(halt_node, 0, &flags);
 	if (!gpio_is_valid(gpio))
+	{
+		of_node_put(halt_node);
 		return -EINVAL;
+	}
 
 	err = gpio_request(gpio, "gpio-halt");
 	if (err) {
 		printk(KERN_ERR "gpio-halt: error requesting GPIO %d.\n",
 		       gpio);
+		of_node_put(halt_node);
 		halt_node = NULL;
 		return err;
 	}
@@ -112,6 +119,7 @@ static int gpio_halt_probe(struct platform_device *pdev)
 		printk(KERN_ERR "gpio-halt: error requesting IRQ %d for "
 		       "GPIO %d.\n", irq, gpio);
 		gpio_free(gpio);
+		of_node_put(halt_node);
 		halt_node = NULL;
 		return err;
 	}
@@ -123,6 +131,8 @@ static int gpio_halt_probe(struct platform_device *pdev)
 	printk(KERN_INFO "gpio-halt: registered GPIO %d (%d trigger, %d"
 	       " irq).\n", gpio, trigger, irq);
 
+	of_node_put(halt_node);
+
 	return 0;
 }
 
-- 
2.25.1

