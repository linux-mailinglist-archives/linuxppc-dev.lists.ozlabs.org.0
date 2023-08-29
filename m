Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEA378CFBD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 00:59:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WDkROUj7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rb2tf4y6Wz30Db
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 08:59:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WDkROUj7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rb2sg3Qhlz2xdf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Aug 2023 08:58:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=r866mTX9mOfhvGB9ROtXhk9rJqVPkd1gFKMTDNSdM8s=; b=WDkROUj70tpZ/oy6+pT0EW6Dgk
	0j6tBLRgzNZai+KOwjuL/IU/hNmJKxkTyxMtiDAquG6QGrLlEPIMcFa5B0lrR2lKmte0UODUsOBHx
	KSVJBbR51slZdqVV4PRX9hi4WzlstnVLp0pfSjf56btM7cmZB6NkreOjjX8u1FbsbQbvuHH2eAXU/
	GBAhIJkK51u7suDv7khh7QyVeP2l57mjgmuNF3sx8CqdpooOKKfiIog2Nyx9XSVprxhaRhGDEnH1n
	Vdc1nzVAShp8J+m2jr6jojNpTAmbzkh1N9/F0JTBtpMyBdo+aLBkakVXzJC+kAlOaVq09CPHftao1
	5AwGbtXg==;
Received: from [2601:1c2:980:9ec0::2764] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qb7fS-00CQ0P-2Q;
	Tue, 29 Aug 2023 22:58:38 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] macintosh/ams: linux/platform_device.h is needed
Date: Tue, 29 Aug 2023 15:58:37 -0700
Message-ID: <20230829225837.15520-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.41.0
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
Cc: Rob Herring <robh@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ams.h uses struct platform_device, so the header should be used
to prevent build errors:

drivers/macintosh/ams/ams-input.c: In function 'ams_input_enable':
drivers/macintosh/ams/ams-input.c:68:45: error: invalid use of undefined type 'struct platform_device'
   68 |         input->dev.parent = &ams_info.of_dev->dev;
drivers/macintosh/ams/ams-input.c: In function 'ams_input_init':
drivers/macintosh/ams/ams-input.c:146:51: error: invalid use of undefined type 'struct platform_device'
  146 |         return device_create_file(&ams_info.of_dev->dev, &dev_attr_joystick);
drivers/macintosh/ams/ams-input.c: In function 'ams_input_exit':
drivers/macintosh/ams/ams-input.c:151:44: error: invalid use of undefined type 'struct platform_device'
  151 |         device_remove_file(&ams_info.of_dev->dev, &dev_attr_joystick);
drivers/macintosh/ams/ams-input.c: In function 'ams_input_init':
drivers/macintosh/ams/ams-input.c:147:1: error: control reaches end of non-void function [-Werror=return-type]
  147 | }

Fixes: 233d687d1b78 ("macintosh: Explicitly include correct DT includes")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Rob Herring <robh@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>
---
 drivers/macintosh/ams/ams.h |    1 +
 1 file changed, 1 insertion(+)

diff -- a/drivers/macintosh/ams/ams.h b/drivers/macintosh/ams/ams.h
--- a/drivers/macintosh/ams/ams.h
+++ b/drivers/macintosh/ams/ams.h
@@ -6,6 +6,7 @@
 #include <linux/input.h>
 #include <linux/kthread.h>
 #include <linux/mutex.h>
+#include <linux/platform_device.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
 
