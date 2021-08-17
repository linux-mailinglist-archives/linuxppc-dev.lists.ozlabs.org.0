Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD44F3EEE11
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 16:06:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GptB73w85z3bX8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 00:06:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=185.176.79.56;
 helo=frasgout.his.huawei.com; envelope-from=john.garry@huawei.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 1060 seconds by postgrey-1.36 at boromir;
 Wed, 18 Aug 2021 00:06:13 AEST
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gpt9d0j1vz2yX6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 00:06:10 +1000 (AEST)
Received: from fraeml741-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Gpsm96vDYz6BGWC;
 Tue, 17 Aug 2021 21:47:37 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml741-chm.china.huawei.com (10.206.15.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 17 Aug 2021 15:48:27 +0200
Received: from localhost.localdomain (10.69.192.58) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 17 Aug 2021 14:48:23 +0100
From: John Garry <john.garry@huawei.com>
To: <tyreld@linux.ibm.com>, <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, 
 <paulus@samba.org>, <jejb@linux.ibm.com>, <martin.petersen@oracle.com>
Subject: [PATCH] scsi: ibmvfc: Stop using scsi_cmnd.tag
Date: Tue, 17 Aug 2021 21:43:37 +0800
Message-ID: <1629207817-211936-1-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.58]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
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
Cc: sfr@canb.auug.org.au, bvanassche@acm.org, linux-scsi@vger.kernel.org, John
 Garry <john.garry@huawei.com>, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, hare@suse.de, linuxppc-dev@lists.ozlabs.org,
 hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use scsi_cmd_to_rq(scsi_cmnd)->tag in preference to scsi_cmnd.tag.

Signed-off-by: John Garry <john.garry@huawei.com>
---
This patch was missed in a series to remove scsi_cmnd.tag, which caused
a build error on Martin's SCSI staging tree:
https://lore.kernel.org/linux-scsi/yq14kbppa42.fsf@ca-mkp.ca.oracle.com/T/#mb47909f38f35837686734369600051b278d124af

I note that scsi_cmnd.tag is/was an unsigned char, and I could not find
anywhere in the driver which limits scsi_host.can_queue to 255, so using
scsi_cmnd.tag looks odd to me.

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 7fa5e64e38c3..ba7150cb226a 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -1956,7 +1956,7 @@ static int ibmvfc_queuecommand(struct Scsi_Host *shost, struct scsi_cmnd *cmnd)
 	memcpy(iu->cdb, cmnd->cmnd, cmnd->cmd_len);
 
 	if (cmnd->flags & SCMD_TAGGED) {
-		vfc_cmd->task_tag = cpu_to_be64(cmnd->tag);
+		vfc_cmd->task_tag = cpu_to_be64(scsi_cmd_to_rq(cmnd)->tag);
 		iu->pri_task_attr = IBMVFC_SIMPLE_TASK;
 	}
 
-- 
2.17.1

