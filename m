Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB25D55652
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 19:51:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YDH002fczDqVv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 03:51:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=julietk@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YDF65PsKzDqLq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 03:49:29 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5PHmiQr057879
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 13:49:26 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tbpsyv2wj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 13:49:26 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <julietk@linux.vnet.ibm.com>;
 Tue, 25 Jun 2019 18:49:25 +0100
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 25 Jun 2019 18:49:23 +0100
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5PHnLwk60096880
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 17:49:21 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 300336A058;
 Tue, 25 Jun 2019 17:49:21 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA9E46A054;
 Tue, 25 Jun 2019 17:49:20 +0000 (GMT)
Received: from ltcalpine2-lp21.aus.stglabs.ibm.com (unknown [9.40.195.230])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 25 Jun 2019 17:49:20 +0000 (GMT)
From: Juliet Kim <julietk@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH REPOST] powerpc/rtas: Fix hang in race against concurrent cpu
 offline
Date: Tue, 25 Jun 2019 13:48:49 -0400
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19062517-0004-0000-0000-000015210804
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011329; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01223159; UDB=6.00643670; IPR=6.01004331; 
 MB=3.00027464; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-25 17:49:24
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062517-0005-0000-0000-00008C383E95
Message-Id: <1561484929-4034-1-git-send-email-julietk@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=747 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906250134
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
Cc: Juliet Kim <julietk@linux.vnet.ibm.com>, mwb@linux.vnet.ibm.com,
 mmc@linux.vnet.ibm.com, nathanl@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The commit
(“powerpc/rtas: Fix a potential race between CPU-Offline & Migration)
attempted to fix a hang in Live Partition Mobility(LPM) by abandoning
the LPM attempt if a race between LPM and concurrent CPU offline was
detected.

However, that fix failed to notify Hypervisor that the LPM attempted
had been abandoned which results in a system hang.

Fix this by sending a signal PHYP to cancel the migration, so that PHYP
can stop waiting, and clean up the migration.

Fixes: dfd718a2ed1f ("powerpc/rtas: Fix a potential race between CPU-Offline & Migration")
Signed-off-by: Juliet Kim <julietk@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/hvcall.h | 7 +++++++
 arch/powerpc/kernel/rtas.c        | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index 463c63a..29ca285 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -261,6 +261,7 @@
 #define H_ADD_CONN		0x284
 #define H_DEL_CONN		0x288
 #define H_JOIN			0x298
+#define H_VASI_SIGNAL           0x2A0
 #define H_VASI_STATE            0x2A4
 #define H_VIOCTL		0x2A8
 #define H_ENABLE_CRQ		0x2B0
@@ -348,6 +349,12 @@
 #define H_SIGNAL_SYS_RESET_ALL_OTHERS		-2
 /* >= 0 values are CPU number */
 
+/* Values for argument to H_VASI_SIGNAL */
+#define H_SIGNAL_CANCEL_MIG     0x01
+
+/* Values for 2nd argument to H_VASI_SIGNAL */
+#define H_CPU_OFFLINE_DETECTED  0x0000000006000004
+
 /* H_GET_CPU_CHARACTERISTICS return values */
 #define H_CPU_CHAR_SPEC_BAR_ORI31	(1ull << 63) // IBM bit 0
 #define H_CPU_CHAR_BCCTRL_SERIALISED	(1ull << 62) // IBM bit 1
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index b824f4c..f9002b7 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -981,6 +981,14 @@ int rtas_ibm_suspend_me(u64 handle)
 
 	/* Check if we raced with a CPU-Offline Operation */
 	if (unlikely(!cpumask_equal(cpu_present_mask, cpu_online_mask))) {
+
+		/* We uses CANCEL, not ABORT to gracefully cancel migration */
+		rc = plpar_hcall_norets(H_VASI_SIGNAL, handle,
+			H_SIGNAL_CANCEL_MIG, H_CPU_OFFLINE_DETECTED);
+
+		if (rc != H_SUCCESS)
+			pr_err("%s: vasi_signal failed %ld\n", __func__, rc);
+
 		pr_err("%s: Raced against a concurrent CPU-Offline\n",
 		       __func__);
 		atomic_set(&data.error, -EBUSY);
-- 
1.8.3.1

