Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 743233FE480
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 23:05:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0Gmr2f6fz3cQS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 07:05:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a2Rfm3WY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=mcgrof@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=a2Rfm3WY; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0Gh36thtz2xtf
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Sep 2021 07:01:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=04BFNx7N8AagL+vNhaEBLuBBGegCSEgU71z7cal6rBA=; b=a2Rfm3WYHPSjWFgE/uOw0Syt8o
 kSumcGeM9ydP9COGnikr1e9X5VHlm70Iz8IB5sW3pQx7Vw1x8gOr4gbqt9FkIcwOaaT4G3POAbwD0
 S2IbV0iAFlPsxHneY2cgG1ZTZ29+QzzDf2DuyrggHf54BrJoBl28Mi3lZV21wekrhhtV+JR4ASMU1
 HyqD6z9tJCeJi0AxqYp7EIypGoTizN6C1D2HNnJ2OCHRDojKIglWqWebZJKoGqv9MAZaQZd/YXTME
 goMp2yU6KOiIMEBNCG5ro/UI5snOEuI2Cc4M7vY9EH+mJP2EE2joSCzt7z00uy9IAqY2eflcw7b2q
 2/XUv0fQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mLXLR-007LWJ-LJ; Wed, 01 Sep 2021 21:00:29 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, bhelgaas@google.com, liushixin2@huawei.com,
 thunder.leizhen@huawei.com, lee.jones@linaro.org, geoff@infradead.org,
 mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 jim@jtan.com, haris.iqbal@ionos.com, jinpu.wang@ionos.com,
 josh.h.morris@us.ibm.com, pjk1939@linux.ibm.com, tim@cyberelk.net,
 richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com
Subject: [PATCH 08/10] block/sx8: add error handling support for add_disk()
Date: Wed,  1 Sep 2021 14:00:26 -0700
Message-Id: <20210901210028.1750956-9-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901210028.1750956-1-mcgrof@kernel.org>
References: <20210901210028.1750956-1-mcgrof@kernel.org>
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
Cc: linux-block@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Luis Chamberlain <mcgrof@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We never checked for errors on add_disk() as this function
returned void. Now that this is fixed, use the shiny new
error handling.

A completion is used to notify the initial probe what is
happening and so we must defer error handling on completion.
Do this by remembering the error and using the shared cleanup
function.

The tags are shared and so are hanlded later for the
driver already.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/block/sx8.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/block/sx8.c b/drivers/block/sx8.c
index 420cd952ddc4..1c79248c4826 100644
--- a/drivers/block/sx8.c
+++ b/drivers/block/sx8.c
@@ -297,6 +297,7 @@ struct carm_host {
 
 	struct work_struct		fsm_task;
 
+	int probe_err;
 	struct completion		probe_comp;
 };
 
@@ -1181,8 +1182,11 @@ static void carm_fsm_task (struct work_struct *work)
 				struct gendisk *disk = port->disk;
 
 				set_capacity(disk, port->capacity);
-				add_disk(disk);
-				activated++;
+				host->probe_err = add_disk(disk);
+				if (!host->probe_err)
+					activated++;
+				else
+					break;
 			}
 
 		printk(KERN_INFO DRV_NAME "(%s): %d ports activated\n",
@@ -1192,11 +1196,9 @@ static void carm_fsm_task (struct work_struct *work)
 		reschedule = 1;
 		break;
 	}
-
 	case HST_PROBE_FINISHED:
 		complete(&host->probe_comp);
 		break;
-
 	case HST_ERROR:
 		/* FIXME: TODO */
 		break;
@@ -1507,7 +1509,10 @@ static int carm_init_one (struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto err_out_free_irq;
 
 	DPRINTK("waiting for probe_comp\n");
+	host->probe_err = -ENODEV;
 	wait_for_completion(&host->probe_comp);
+	if (host->probe_err)
+		goto err_out_free_irq;
 
 	printk(KERN_INFO "%s: pci %s, ports %d, io %llx, irq %u, major %d\n",
 	       host->name, pci_name(pdev), (int) CARM_MAX_PORTS,
-- 
2.30.2

