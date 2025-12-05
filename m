Return-Path: <linuxppc-dev+bounces-14632-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E87CCA613E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 05 Dec 2025 05:05:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMySs0R8Yz2xrM;
	Fri, 05 Dec 2025 15:05:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=165.227.155.160
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764907106;
	cv=none; b=QwaB5MYDAS9+c4Cubt7wU9nPnxdjysnAUFpRTZuC8gaDanyREosS2tonn+nqZfKOx6HRCNnKdLuzDewQU0mOIXxZUruSOnGjF5pHogzN5107c40BNnU6woLSSI2VqMG71VJCwynUXmi4nQNmG05Uw2nEl5y8nJ/D8+z2kV4vH4tt2Sg1vcg6xCFdQbYKMPhxMIfQVDZrIvvRFE9YPDcHqAdOrt+MiHq6+WJh6hVRH5kXapD+BpUkfmA3LmiqzNp4+ZyauDfo25CO87rO6rrRpB6IP+/rVb4GEP01CrT/5mJ4XK7xwLvD2nTCpaXRumIuvV3axIXsUR8yLWFlbXCeAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764907106; c=relaxed/relaxed;
	bh=ZA1TQ1ahwa2H0yfNGlSZzHS9ARyY9bxWmRGZzmOoe4s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cvsgUgpVQ4Q3bDRBIyBykjDcVX/D7bK52VeMzZAF/yIdZySJSdI8EAfx/WiRP96yhCAO9FCvWxw4kYyz3072xfvkObJII7BtvTY/kDy80BREEaW2F93CJVQXYL/aNP1dkjZ6Aj0H35ic03sS9HmHLxTvgG/O8XvSbHj3OV/6WNEtLZkGhHDpUtJDOwqRJ2QmHp6pEh/u0w/rkWqRT7RWbZYkghD/M4t9+iMSUCltzxvKDoq6FMgaGO//s/sYueYjsycho052/0uMBzgMJwoIbqlsY1HztnvORs38XpEsiBwdlDcin2UQTFxWfizCIsOqSw93C1sA/S/YHEXPYVqmuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass (client-ip=165.227.155.160; helo=zg8tmty1ljiyny4xntuumtyw.icoremail.net; envelope-from=duoming@zju.edu.cn; receiver=lists.ozlabs.org) smtp.mailfrom=zju.edu.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zju.edu.cn (client-ip=165.227.155.160; helo=zg8tmty1ljiyny4xntuumtyw.icoremail.net; envelope-from=duoming@zju.edu.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 353 seconds by postgrey-1.37 at boromir; Fri, 05 Dec 2025 14:58:25 AEDT
Received: from zg8tmty1ljiyny4xntuumtyw.icoremail.net (zg8tmty1ljiyny4xntuumtyw.icoremail.net [165.227.155.160])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMyKF0kNbz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 14:58:22 +1100 (AEDT)
Received: from zju.edu.cn (unknown [218.12.17.178])
	by mtasvr (Coremail) with SMTP id _____wDX31caVjJpYKGTAA--.1541S3;
	Fri, 05 Dec 2025 11:48:43 +0800 (CST)
Received: from ubuntu.localdomain (unknown [218.12.17.178])
	by mail-app2 (Coremail) with SMTP id zC_KCgCHn0MRVjJpBFhHBA--.22493S2;
	Fri, 05 Dec 2025 11:48:41 +0800 (CST)
From: Duoming Zhou <duoming@zju.edu.cn>
To: linux-usb@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	kuba@kernel.org,
	alexander.deucher@amd.com,
	Jonathan.Cameron@huawei.com,
	akpm@linux-foundation.org,
	johannes.berg@intel.com,
	krzk@kernel.org,
	Duoming Zhou <duoming@zju.edu.cn>,
	stable@kernel.org
Subject: [PATCH] usb: phy: fsl-usb: Fix use-after-free in delayed work during device removal
Date: Fri,  5 Dec 2025 11:48:31 +0800
Message-Id: <20251205034831.12846-1-duoming@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zC_KCgCHn0MRVjJpBFhHBA--.22493S2
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwcLAWkx5AIM0gAIsm
X-CM-DELIVERINFO: =?B?j0HlvAXKKxbFmtjJiESix3B1w3uoVhYI+vyen2ZzBEkOnu5chDpkB+ZdGnv/zQ0PbP
	CR16GQhhX7CLsrTBlHDX8VE3hxA2jxVBpq5LBx5X8Ol3lnYAWqYY2/yZA320YDVkW20HE8
	NVVf84O/fLUxbbpHjYSfeD2Wx8BuxjLhK+v8QtyJ0RnAOEKmL7dslCylMbVLRA==
X-Coremail-Antispam: 1Uk129KBj93XoW7tw4DCr4fAr1rXryUGF1UCFX_yoW8Ary8pr
	WfXr15KFyvgr13tanxtw4ruF15WwsFv34UKr1Ik3W3Xwn8Jw1jqry0kFyF93yY9r95ur12
	qwn0qa4fuFW8CrbCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Eb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0Y48IcxkI7V
	AKI48G6xCjnVAKz4kxM4IIrI8v6xkF7I0E8cxan2IY04v7MxAIw28IcxkI7VAKI48JMxC2
	0s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
	0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
	14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20x
	vaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8
	JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU801v3UUUUU==
X-Spam-Status: No, score=0.0 required=3.0 tests=RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The delayed work item otg_event is initialized in fsl_otg_conf() and
scheduled under two conditions:
1. When a host controller binds to the OTG controller.
2. When the USB ID pin state changes (cable insertion/removal).

A race condition occurs when the device is removed via fsl_otg_remove():
the fsl_otg instance may be freed while the delayed work is still pending
or executing. This leads to use-after-free when the work function
fsl_otg_event() accesses the already freed memory.

The problematic scenario:

(detach thread)            | (delayed work)
fsl_otg_remove()           |
  kfree(fsl_otg_dev) //FREE| fsl_otg_event()
                           |   og = container_of(...) //USE
                           |   og-> //USE

Fix this by calling disable_delayed_work_sync() in fsl_otg_remove()
before deallocating the fsl_otg structure. This ensures the delayed work
is properly canceled and completes execution prior to memory deallocation.

This bug was identified through static analysis.

Fixes: 0807c500a1a6 ("USB: add Freescale USB OTG Transceiver driver")
Cc: stable@kernel.org
Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
 drivers/usb/phy/phy-fsl-usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/phy/phy-fsl-usb.c b/drivers/usb/phy/phy-fsl-usb.c
index 40ac68e52ce..e266a47c4d4 100644
--- a/drivers/usb/phy/phy-fsl-usb.c
+++ b/drivers/usb/phy/phy-fsl-usb.c
@@ -988,6 +988,7 @@ static void fsl_otg_remove(struct platform_device *pdev)
 {
 	struct fsl_usb2_platform_data *pdata = dev_get_platdata(&pdev->dev);
 
+	disable_delayed_work_sync(&fsl_otg_dev->otg_event);
 	usb_remove_phy(&fsl_otg_dev->phy);
 	free_irq(fsl_otg_dev->irq, fsl_otg_dev);
 
-- 
2.34.1


