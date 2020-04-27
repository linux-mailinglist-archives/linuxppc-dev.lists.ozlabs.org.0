Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E842E1BB1B4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 00:51:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49B0QN0kkczDqgf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 08:51:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49B0NG2wQZzDqPR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 08:50:06 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03RM3nUC143868; Mon, 27 Apr 2020 18:50:02 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mhr64j65-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 18:50:02 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03RMZ9wT027047;
 Mon, 27 Apr 2020 22:50:01 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 30mcu74m71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 22:50:01 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03RMnx7624314230
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Apr 2020 22:50:00 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E493078060;
 Mon, 27 Apr 2020 22:49:59 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 147137805E;
 Mon, 27 Apr 2020 22:49:57 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.64.115])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 27 Apr 2020 22:49:57 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH] ibmvscsi: fix WARN_ON during event pool release
Date: Mon, 27 Apr 2020 15:49:53 -0700
Message-Id: <1588027793-17952-1-git-send-email-tyreld@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-27_17:2020-04-27,
 2020-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 spamscore=0 mlxscore=0 suspectscore=3 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 mlxlogscore=651
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004270180
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, brking@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While removing an ibmvscsi client adapter a WARN_ON like the following
is seen in the kernel log:

drmgr: drmgr: -r -c slot -s U9080.M9S.783AEC8-V11-C11 -w 5 -d 1
WARNING: CPU: 9 PID: 24062 at ../kernel/dma/mapping.c:311 dma_free_attrs+0x78/0x110
Supported: No, Unreleased kernel
CPU: 9 PID: 24062 Comm: drmgr Kdump: loaded Tainted: G               X 5.3.18-12-default
NIP:  c0000000001fa758 LR: c0000000001fa744 CTR: c0000000001fa6e0
REGS: c0000002173375d0 TRAP: 0700   Tainted: G               X (5.3.18-12-default)
MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 28088282  XER: 20000000
CFAR: c0000000001fbf0c IRQMASK: 1
GPR00: c0000000001fa744 c000000217337860 c00000000161ab00 0000000000000000
GPR04: 0000000000000000 c000011e12250000 0000000018010000 0000000000000000
GPR08: 0000000000000000 0000000000000001 0000000000000001 c0080000190f4fa8
GPR12: c0000000001fa6e0 c000000007fc2a00 0000000000000000 0000000000000000
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR24: 000000011420e310 0000000000000000 0000000000000000 0000000018010000
GPR28: c00000000159de50 c000011e12250000 0000000000006600 c000011e5c994848
NIP [c0000000001fa758] dma_free_attrs+0x78/0x110
LR [c0000000001fa744] dma_free_attrs+0x64/0x110
Call Trace:
[c000000217337860] [000000011420e310] 0x11420e310 (unreliable)
[c0000002173378b0] [c0080000190f0280] release_event_pool+0xd8/0x120 [ibmvscsi]
[c000000217337930] [c0080000190f3f74] ibmvscsi_remove+0x6c/0x160 [ibmvscsi]
[c000000217337960] [c0000000000f3cac] vio_bus_remove+0x5c/0x100
[c0000002173379a0] [c00000000087a0a4] device_release_driver_internal+0x154/0x280
[c0000002173379e0] [c0000000008777cc] bus_remove_device+0x11c/0x220
[c000000217337a60] [c000000000870fc4] device_del+0x1c4/0x470
[c000000217337b10] [c0000000008712a0] device_unregister+0x30/0xa0
[c000000217337b80] [c0000000000f39ec] vio_unregister_device+0x2c/0x60
[c000000217337bb0] [c00800001a1d0964] dlpar_remove_slot+0x14c/0x250 [rpadlpar_io]
[c000000217337c50] [c00800001a1d0bcc] remove_slot_store+0xa4/0x110 [rpadlpar_io]
[c000000217337cd0] [c000000000c091a0] kobj_attr_store+0x30/0x50
[c000000217337cf0] [c00000000057c934] sysfs_kf_write+0x64/0x90
[c000000217337d10] [c00000000057be10] kernfs_fop_write+0x1b0/0x290
[c000000217337d60] [c000000000488c4c] __vfs_write+0x3c/0x70
[c000000217337d80] [c00000000048c648] vfs_write+0xd8/0x260
[c000000217337dd0] [c00000000048ca8c] ksys_write+0xdc/0x130
[c000000217337e20] [c00000000000b488] system_call+0x5c/0x70
Instruction dump:
7c840074 f8010010 f821ffb1 20840040 eb830218 7c8407b4 48002019 60000000
2fa30000 409e003c 892d0988 792907e0 <0b090000> 2fbd0000 419e0028 2fbc0000
---[ end trace 5955b3c0cc079942 ]---
rpadlpar_io: slot U9080.M9S.783AEC8-V11-C11 removed

This is tripped as a result of irqs being disabled during the call to
dma_free_coherent() by release_event_pool(). At this point in the code
path we have quiesced the adapter and its overly paranoid anyways to
be holding the host lock.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvscsi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
index 7f66a77..126b242 100644
--- a/drivers/scsi/ibmvscsi/ibmvscsi.c
+++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
@@ -2326,10 +2326,7 @@ static int ibmvscsi_remove(struct vio_dev *vdev)
 	scsi_remove_host(hostdata->host);
 
 	purge_requests(hostdata, DID_ERROR);
-
-	spin_lock_irqsave(hostdata->host->host_lock, flags);
 	release_event_pool(&hostdata->pool, hostdata);
-	spin_unlock_irqrestore(hostdata->host->host_lock, flags);
 
 	ibmvscsi_release_crq_queue(&hostdata->queue, hostdata,
 					max_events);
-- 
1.8.3.1

