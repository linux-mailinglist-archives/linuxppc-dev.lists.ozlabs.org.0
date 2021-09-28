Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D28BF41AE81
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 14:10:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJdcZ28LPz2yb3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 22:10:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hpe3ru5O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hegdevasant@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hpe3ru5O; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJdbv1TR8z2xvL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 22:09:46 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18SBHPQl016985; 
 Tue, 28 Sep 2021 08:09:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=4uc/dKaJhMxXfSUkkZhIEecNHG+mDFyWkVdpVJJikTg=;
 b=hpe3ru5O4TbPiZ8Q27xEj8CEAs0vg3ngYIDXBE+3qaBIQ8r0v/WbHEBFqOyfV6V7R4dX
 g/CLb6EGpC+WIMYRHEVNX98cU6VmA+OqfmvT0ipadvmrcKFUvzkurT9BHjiMPaOLESGJ
 987lbxYFK2Jod6Ibpl+u+iOBeNw8balREG6DZU3Z2G9Vws9WRJgGGLes2M1XNHHHzGrZ
 1UrFsE7//mOyjrB0Gv/LTA1Q/zMKFqTgqrJHgjugtsGzw4qDYOvGhGOabrzr96+LXIpJ
 cu8TO3BBQQQQ7rwsaWQ9EOhbev5XsUoRz2MOS1c1K+bDfgUv67gJlMf+Ic5b4o8B9VRY Vw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bbusb9an0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 08:09:41 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18SC3JFd025983;
 Tue, 28 Sep 2021 12:09:39 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3b9u1jdkcy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 12:09:39 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18SC9bJg34996716
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Sep 2021 12:09:37 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0E7942045;
 Tue, 28 Sep 2021 12:09:36 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9211142054;
 Tue, 28 Sep 2021 12:09:35 +0000 (GMT)
Received: from hegdevasant.ibm.com (unknown [9.43.95.68])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 28 Sep 2021 12:09:35 +0000 (GMT)
From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/powernv/prd: Unregister OPAL_MSG_PRD2 notifier during
 module unload
Date: Tue, 28 Sep 2021 17:39:33 +0530
Message-Id: <20210928120933.196571-1-hegdevasant@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nv9VelXm0FBBGVcF2tEFboHr7_dLAf_U
X-Proofpoint-ORIG-GUID: nv9VelXm0FBBGVcF2tEFboHr7_dLAf_U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-28_05,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109280068
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
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 587164cd, introduced new opal message type (OPAL_MSG_PRD2) and added
opal notifier. But I missed to unregister the notifier during module unload
path. This results in below call trace if you try to unload and load
opal_prd module.

Sample calltrace (modprobe -r opal_prd; modprobe opal_prd)
  [  213.335261] BUG: Unable to handle kernel data access on read at 0xc0080000192200e0
  [  213.335287] Faulting instruction address: 0xc00000000018d1cc
  [  213.335301] Oops: Kernel access of bad area, sig: 11 [#1]
  [  213.335313] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA PowerNV
  [  213.335736] CPU: 66 PID: 7446 Comm: modprobe Kdump: loaded Tainted: G            E     5.14.0prd #759
  [  213.335772] NIP:  c00000000018d1cc LR: c00000000018d2a8 CTR: c0000000000cde10
  [  213.335805] REGS: c0000003c4c0f0a0 TRAP: 0300   Tainted: G            E      (5.14.0prd)
  [  213.335848] MSR:  9000000002009033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 24224824  XER: 20040000
  [  213.335893] CFAR: c00000000018d2a4 DAR: c0080000192200e0 DSISR: 40000000 IRQMASK: 1
  [  213.335893] GPR00: c00000000018d2a8 c0000003c4c0f340 c000000001995300 c000000001a5ad08
  [  213.335893] GPR04: c00800000e3700d0 c0000003c4c0f434 c0000000010a8c08 6e616d6500000000
  [  213.335893] GPR08: 0000000000000000 c0080000192200d0 0000000000000001 c00800000e351020
  [  213.335893] GPR12: c0000000000cde10 c000000ffffecb80 c0000003c4c0fd00 0000000000000000
  [  213.335893] GPR16: 0000000000000990 c00800000d950000 c00800000d950990 c00000000103fd10
  [  213.335893] GPR20: c0000003c4c0fbc0 0000000000000001 c0000003c4c0fbc0 c00800000e370498
  [  213.335893] GPR24: 0000000000000000 c000000000dab5c8 c000000001a5ad18 c000000001a5ac80
  [  213.335893] GPR28: 0000000000000008 0000000000000001 c000000001a5ad00 c000000001a5ad00
  [  213.336170] NIP [c00000000018d1cc] notifier_chain_register+0x2c/0xc0
  [  213.336205] LR [c00000000018d2a8] atomic_notifier_chain_register+0x48/0x80
  [  213.336238] Call Trace:
  [  213.336255] [c0000003c4c0f340] [c000000002090610] 0xc000000002090610 (unreliable)
  [  213.336281] [c0000003c4c0f3a0] [c00000000018d2b8] atomic_notifier_chain_register+0x58/0x80
  [  213.336309] [c0000003c4c0f3f0] [c0000000000cde8c] opal_message_notifier_register+0x7c/0x1e0
  [  213.336345] [c0000003c4c0f4b0] [c00800000e3508ac] opal_prd_probe+0x84/0x150 [opal_prd]
  [  213.336382] [c0000003c4c0f530] [c00000000097acc8] platform_probe+0x78/0x130
  [  213.336416] [c0000003c4c0f5b0] [c000000000976520] really_probe+0x110/0x5d0
  [  213.336467] [c0000003c4c0f630] [c000000000976b5c] __driver_probe_device+0x17c/0x230
  [  213.336512] [c0000003c4c0f6b0] [c000000000976c70] driver_probe_device+0x60/0x130
  [  213.336556] [c0000003c4c0f700] [c00000000097746c] __driver_attach+0xfc/0x220
  [  213.336592] [c0000003c4c0f780] [c000000000972e68] bus_for_each_dev+0xa8/0x130
  [  213.336627] [c0000003c4c0f7e0] [c000000000975b04] driver_attach+0x34/0x50
  [  213.336661] [c0000003c4c0f800] [c000000000974e20] bus_add_driver+0x1b0/0x300
  [  213.336696] [c0000003c4c0f890] [c000000000978468] driver_register+0x98/0x1a0
  [  213.336732] [c0000003c4c0f900] [c00000000097a878] __platform_driver_register+0x38/0x50
  [  213.336768] [c0000003c4c0f920] [c00800000e350dc0] opal_prd_driver_init+0x34/0x50 [opal_prd]
  [  213.336804] [c0000003c4c0f940] [c000000000012410] do_one_initcall+0x60/0x2d0
  [  213.336821] [c0000003c4c0fa10] [c000000000262c8c] do_init_module+0x7c/0x320
  [  213.336845] [c0000003c4c0fa90] [c000000000266544] load_module+0x3394/0x3650
  [  213.336880] [c0000003c4c0fc90] [c000000000266b34] __do_sys_finit_module+0xd4/0x160
  [  213.336914] [c0000003c4c0fdb0] [c000000000031e00] system_call_exception+0x140/0x290
  [  213.336958] [c0000003c4c0fe10] [c00000000000c764] system_call_common+0xf4/0x258

Fixes: 587164cd ("powerpc/powernv: Add new opal message type")
Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
---
 arch/powerpc/platforms/powernv/opal-prd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/opal-prd.c b/arch/powerpc/platforms/powernv/opal-prd.c
index a191f4c60ce7..83305615db9e 100644
--- a/arch/powerpc/platforms/powernv/opal-prd.c
+++ b/arch/powerpc/platforms/powernv/opal-prd.c
@@ -393,6 +393,7 @@ static int opal_prd_probe(struct platform_device *pdev)
 	rc = opal_message_notifier_register(OPAL_MSG_PRD2, &opal_prd_event_nb);
 	if (rc) {
 		pr_err("Couldn't register PRD2 event notifier\n");
+		opal_message_notifier_unregister(OPAL_MSG_PRD, &opal_prd_event_nb);
 		return rc;
 	}
 
@@ -401,6 +402,8 @@ static int opal_prd_probe(struct platform_device *pdev)
 		pr_err("failed to register miscdev\n");
 		opal_message_notifier_unregister(OPAL_MSG_PRD,
 				&opal_prd_event_nb);
+		opal_message_notifier_unregister(OPAL_MSG_PRD2,
+				&opal_prd_event_nb);
 		return rc;
 	}
 
@@ -411,6 +414,7 @@ static int opal_prd_remove(struct platform_device *pdev)
 {
 	misc_deregister(&opal_prd_dev);
 	opal_message_notifier_unregister(OPAL_MSG_PRD, &opal_prd_event_nb);
+	opal_message_notifier_unregister(OPAL_MSG_PRD2, &opal_prd_event_nb);
 	return 0;
 }
 
-- 
2.31.1

