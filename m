Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A99A51BB0C3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 23:50:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499z3M5bzlzDqPy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 07:50:23 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 499z1M0FSnzDqfs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 07:48:38 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03RLWKJe037596; Mon, 27 Apr 2020 17:48:33 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mh9mu7ur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 17:48:28 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03RLjL39024980;
 Mon, 27 Apr 2020 21:48:27 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02wdc.us.ibm.com with ESMTP id 30mcu66je2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 21:48:27 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03RLmQse36372944
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Apr 2020 21:48:26 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8507FB2064;
 Mon, 27 Apr 2020 21:48:26 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 097A5B205F;
 Mon, 27 Apr 2020 21:48:26 +0000 (GMT)
Received: from linux-td1r.aus.stglabs.ibm.com (unknown [9.40.195.185])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 27 Apr 2020 21:48:25 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH] ibmvfc: don't send implicit logouts prior to NPIV login
Date: Mon, 27 Apr 2020 16:48:24 -0500
Message-Id: <20200427214824.6890-1-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.16.4
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-27_16:2020-04-27,
 2020-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 suspectscore=1
 lowpriorityscore=0 phishscore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004270172
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, martin.petersen@oracle.com,
 linux-scsi@vger.kernel.org, Brian King <brking@linux.vnet.ibm.com>,
 brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Brian King <brking@linux.vnet.ibm.com>

Commit ed830385a2b1 ("scsi: ibmvfc: Avoid loss of all paths during
SVC node reboot") introduced a regression where when the client
resets or re-enables its CRQ with the hypervisor there is a chance
that if the server side doesn't issue its INIT handshake quick
enough the client can issue an Implicit Logout prior to doing an
NPIV Login. The server treats this scenario as a protocol violation
and closes the CRQ on its end forcing the client through a reset
that gets the client host state and next host action out of
agreement leading to a BUG assert.

ibmvfc 30000003: Partner initialization complete
ibmvfc 30000002: Partner initialization complete
ibmvfc 30000002: Host partner adapter deregistered or failed (rc=2)
ibmvfc 30000002: Partner initialized
------------[ cut here ]------------
kernel BUG at ../drivers/scsi/ibmvscsi/ibmvfc.c:4489!
Oops: Exception in kernel mode, sig: 5 [#1]
LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
Supported: No, Unreleased kernel
CPU: 16 PID: 1290 Comm: ibmvfc_0 Tainted: G           OE  X   5.3.18-12-default
NIP:  c00800000d84a2b4 LR: c00800000d84a040 CTR: c00800000d84a2a0
REGS: c00000000cb57a00 TRAP: 0700   Tainted: G           OE  X    (5.3.18-12-default)
MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 24000848  XER: 00000001
CFAR: c00800000d84a070 IRQMASK: 1
GPR00: c00800000d84a040 c00000000cb57c90 c00800000d858e00 0000000000000000
GPR04: 0000000000000000 0000000000000000 0000000000000000 00000000000000a0
GPR08: c00800000d84a074 0000000000000001 0000000000000014 c00800000d84d7d0
GPR12: 0000000000000000 c00000001ea28200 c00000000016cd98 0000000000000000
GPR16: c00800000d84b7b8 0000000000000000 0000000000000000 c00000542c706d68
GPR20: 0000000000000005 c00000542c706d88 5deadbeef0000100 5deadbeef0000122
GPR24: 000000000000000c 000000000000000b c00800000d852180 0000000000000001
GPR28: 0000000000000000 c00000542c706da0 c00000542c706860 c00000542c706828
NIP [c00800000d84a2b4] ibmvfc_work+0x3ac/0xc90 [ibmvfc]
LR [c00800000d84a040] ibmvfc_work+0x138/0xc90 [ibmvfc]

This scenario can be prevented by rejecting any attempt to send an
Implicit Logout if the client adapter is not logged in yet.

Fixes: Commit ed830385a2b1 ("scsi: ibmvfc: Avoid loss of all paths during SVC node reboot")
Signed-off-by: Brian King <brking@linux.vnet.ibm.com>
Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 7da9e060b270..2b1326d6dd1f 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -3640,6 +3640,11 @@ static void ibmvfc_tgt_implicit_logout_and_del(struct ibmvfc_target *tgt)
 	struct ibmvfc_host *vhost = tgt->vhost;
 	struct ibmvfc_event *evt;
 
+    if (!vhost->logged_in) {
+        ibmvfc_set_tgt_action(tgt, IBMVFC_TGT_ACTION_DEL_RPORT);
+        return;
+    }
+
 	if (vhost->discovery_threads >= disc_threads)
 		return;
 
-- 
2.16.4

