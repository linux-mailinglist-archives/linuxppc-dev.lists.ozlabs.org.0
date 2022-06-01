Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1514753AA84
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 17:54:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCtxD6jlkz3bkx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 01:54:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DNei/iN5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DNei/iN5;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCtwW4nyRz3bY6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jun 2022 01:53:31 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 251Fm4Ai020740;
	Wed, 1 Jun 2022 15:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=nfVh87Az55i8k1gppBZujWqK4+28GKuAIhgQbFoYIrE=;
 b=DNei/iN5ZUMb/fhoeF8N3+AMX1yBGoLSbB8rCQgfvhUfUBHOMokYAG3RAQDFcO2VTqwS
 fwoqfA1u4WkUW8tlb/Bi0Gw9dGdwDuQzxydkJ5E2GPnyFbsw751cqeHO/DPKaonds+ML
 Ybad3MWotaN7tDUhYtV1e04gAyZWIBBdQJaGXVWEHjoeub4TFf79cvDFx1mTMX6J1yjs
 bOQL11rZl9wGXk941P1rZQiuRiJKy2kfoah05TbggN92EqGc4OVKYN5928taXDeeIPjL
 S75StaCtjbWs0e2NcrvSaoqjHVFtkQQV8iKXcIFgnJ6VZ2sVjT6K/01s8CDi6/rezYaz AA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3geb2tr3af-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jun 2022 15:53:23 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 251FrNCG010550;
	Wed, 1 Jun 2022 15:53:23 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3geb2tr39s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jun 2022 15:53:23 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 251FdUB9028296;
	Wed, 1 Jun 2022 15:53:21 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma04ams.nl.ibm.com with ESMTP id 3gbcae5u4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jun 2022 15:53:20 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 251FrHNv49283486
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jun 2022 15:53:17 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BCB3042045;
	Wed,  1 Jun 2022 15:53:17 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5661E42041;
	Wed,  1 Jun 2022 15:53:17 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.172.57])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jun 2022 15:53:17 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
        nathanl@linux.ibm.com, haren@linux.vnet.ibm.com, npiggin@gmail.com
Subject: [PATCH 1/2] powerpc/mobility: Wait for memory transfer to complete
Date: Wed,  1 Jun 2022 17:53:14 +0200
Message-Id: <20220601155315.35109-2-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601155315.35109-1-ldufour@linux.ibm.com>
References: <20220601155315.35109-1-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BAdduxIEm0NJZQRh1N5EeucS_G_8QcFG
X-Proofpoint-ORIG-GUID: aDgUH9Xd3vz5W0lwqiztIfsC-Gq23559
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-01_05,2022-06-01_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 mlxscore=0 mlxlogscore=937 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206010072
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In pseries_migration_partition(), loop until the memory transfer is
complete. This way the calling drmgr process will not exit earlier,
allowing callbacks to be run only once the migration is fully completed.

This will also allow to manage the NMI watchdog state in the next commits.

Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/mobility.c | 34 +++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index 78f3f74c7056..55612a1b07d6 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -427,6 +427,35 @@ static int wait_for_vasi_session_suspending(u64 handle)
 	return ret;
 }
 
+static void wait_for_vasi_session_completed(u64 handle)
+{
+	unsigned long state = 0;
+	int ret;
+
+	pr_info("waiting for memory transfert to complete...\n");
+	/*
+	 * Wait for transition from H_VASI_RESUMED to
+	 * H_VASI_COMPLETED. Treat anything else as an error.
+	 */
+	while (true) {
+		ret = poll_vasi_state(handle, &state);
+
+		if (ret || state == H_VASI_COMPLETED)
+			break;
+
+		if (state != H_VASI_RESUMED) {
+			pr_err("unexpected H_VASI_STATE result %lu\n", state);
+			ret = -EIO;
+			break;
+		}
+
+		msleep(500);
+	}
+
+	pr_info("memory transfert completed (ret:%d state:%ld).\n",
+		ret, state);
+}
+
 static void prod_single(unsigned int target_cpu)
 {
 	long hvrc;
@@ -673,9 +702,10 @@ static int pseries_migrate_partition(u64 handle)
 	vas_migration_handler(VAS_SUSPEND);
 
 	ret = pseries_suspend(handle);
-	if (ret == 0)
+	if (ret == 0) {
 		post_mobility_fixup();
-	else
+		wait_for_vasi_session_completed(handle);
+	} else
 		pseries_cancel_migration(handle, ret);
 
 	vas_migration_handler(VAS_RESUME);
-- 
2.36.1

