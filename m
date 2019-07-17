Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2A16C3F8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 03:00:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pwmQ47QRzDqT3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 11:00:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tyreld@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pwkV44zFzDqGg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 10:58:57 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6I0vF3F104787; Wed, 17 Jul 2019 20:58:51 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ttcq7kkay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jul 2019 20:58:51 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x6I0ub5c021234;
 Thu, 18 Jul 2019 00:58:50 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 2tq6x7kqsj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jul 2019 00:58:50 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6I0wmJS46858604
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Jul 2019 00:58:48 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4D916A04F;
 Thu, 18 Jul 2019 00:58:48 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 348C76A04D;
 Thu, 18 Jul 2019 00:58:48 +0000 (GMT)
Received: from linux-xej6.aus.stglabs.ibm.com (unknown [9.40.195.184])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 18 Jul 2019 00:58:48 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH] ibmvfc: fix WARN_ON during event pool release
Date: Wed, 17 Jul 2019 14:48:27 -0500
Message-Id: <20190717194827.12514-1-tyreld@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.12.3
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-17_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=249 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907180007
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
Cc: martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, abdhalee@linux.vnet.ibm.com,
 Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, brking@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While removing an ibmvfc client adapter a WARN_ON like the following WARN_ON
is seen in the kernel log:

WARNING: CPU: 6 PID: 5421 at ./include/linux/dma-mapping.h:541
ibmvfc_free_event_pool+0x12c/0x1f0 [ibmvfc]
CPU: 6 PID: 5421 Comm: rmmod Tainted: G            E     4.17.0-rc1-next-20180419-autotest #1
NIP:  d00000000290328c LR: d00000000290325c CTR: c00000000036ee20
REGS: c000000288d1b7e0 TRAP: 0700   Tainted: G            E      (4.17.0-rc1-next-20180419-autotest)
MSR:  800000010282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE,TM[E]>  CR: 44008828  XER: 20000000
CFAR: c00000000036e408 SOFTE: 1
GPR00: d00000000290325c c000000288d1ba60 d000000002917900 c000000289d75448
GPR04: 0000000000000071 c0000000ff870000 0000000018040000 0000000000000001
GPR08: 0000000000000000 c00000000156e838 0000000000000001 d00000000290c640
GPR12: c00000000036ee20 c00000001ec4dc00 0000000000000000 0000000000000000
GPR16: 0000000000000000 0000000000000000 00000100276901e0 0000000010020598
GPR20: 0000000010020550 0000000010020538 0000000010020578 00000000100205b0
GPR24: 0000000000000000 0000000000000000 0000000010020590 5deadbeef0000100
GPR28: 5deadbeef0000200 d000000002910b00 0000000000000071 c0000002822f87d8
NIP [d00000000290328c] ibmvfc_free_event_pool+0x12c/0x1f0 [ibmvfc]
LR [d00000000290325c] ibmvfc_free_event_pool+0xfc/0x1f0 [ibmvfc]
Call Trace:
[c000000288d1ba60] [d00000000290325c] ibmvfc_free_event_pool+0xfc/0x1f0 [ibmvfc] (unreliable)
[c000000288d1baf0] [d000000002909390] ibmvfc_abort_task_set+0x7b0/0x8b0 [ibmvfc]
[c000000288d1bb70] [c0000000000d8c68] vio_bus_remove+0x68/0x100
[c000000288d1bbb0] [c0000000007da7c4] device_release_driver_internal+0x1f4/0x2d0
[c000000288d1bc00] [c0000000007da95c] driver_detach+0x7c/0x100
[c000000288d1bc40] [c0000000007d8af4] bus_remove_driver+0x84/0x140
[c000000288d1bcb0] [c0000000007db6ac] driver_unregister+0x4c/0xa0
[c000000288d1bd20] [c0000000000d6e7c] vio_unregister_driver+0x2c/0x50
[c000000288d1bd50] [d00000000290ba0c] cleanup_module+0x24/0x15e0 [ibmvfc]
[c000000288d1bd70] [c0000000001dadb0] sys_delete_module+0x220/0x2d0
[c000000288d1be30] [c00000000000b284] system_call+0x58/0x6c
Instruction dump:
e8410018 e87f0068 809f0078 e8bf0080 e8df0088 2fa30000 419e008c e9230200
2fa90000 419e0080 894d098a 794a07e0 <0b0a0000> e9290008 2fa90000 419e0028

This is tripped as a result of irqs being disabled during the call to
dma_free_coherent() by ibmvfc_free_event_pool(). At this point in the code path
we have quiesced the adapter and its overly paranoid anyways to be holding the
host lock.

Reported-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Signed-off-by: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index acd16e0d52cf..8cdbac076a1b 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -4864,8 +4864,8 @@ static int ibmvfc_remove(struct vio_dev *vdev)
 
 	spin_lock_irqsave(vhost->host->host_lock, flags);
 	ibmvfc_purge_requests(vhost, DID_ERROR);
-	ibmvfc_free_event_pool(vhost);
 	spin_unlock_irqrestore(vhost->host->host_lock, flags);
+	ibmvfc_free_event_pool(vhost);
 
 	ibmvfc_free_mem(vhost);
 	spin_lock(&ibmvfc_driver_lock);
-- 
2.12.3

