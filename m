Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4658351F40
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 01:50:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45XmHb17SNzDqVm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 09:50:03 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45XmFr0S50zDqSr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 09:48:27 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5ONkuH9108457
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 19:48:22 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tb5dyxv9s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 19:48:22 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x5ONeH1r025301
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 23:48:21 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01wdc.us.ibm.com with ESMTP id 2t9by6k1f2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 23:48:21 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5ONmKpq50594052
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jun 2019 23:48:20 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B763B6E054;
 Mon, 24 Jun 2019 23:48:20 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5ACBB6E04E;
 Mon, 24 Jun 2019 23:48:20 +0000 (GMT)
Received: from ltcalpine2-lp21.aus.stglabs.ibm.com (unknown [9.40.195.230])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with SMTP;
 Mon, 24 Jun 2019 23:48:20 +0000 (GMT)
Date: Mon, 24 Jun 2019 19:48:19 -0400
From: Juliet Kim <julietk@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/rtas: Fix hang in race against concurrent cpu offline
Message-ID: <5d116143.403IF78HZadonD0m%julietk@linux.vnet.ibm.com>
User-Agent: Heirloom mailx 12.5 7/5/10
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-24_16:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=869 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906240188
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
Cc: mmc@linux.vnet.ibm.com, mwb@linux.ibm.com, nathanl@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From 1bd2bf7146876e099eafb292668f9a12dc22f526 Mon Sep 17 00:00:00 2001
From: Juliet Kim <julietk@linux.vnet.ibm.com>
Date: Mon, 24 Jun 2019 17:17:46 -0400
Subject: [PATCH 1/1] powerpc/rtas: Fix hang in race against concurrent cpu
 offline
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
This is an alternate solution to the one Nathan proposed in:
https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-June/192414.html
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

