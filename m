Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A95C455BA2B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 15:55:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWq473TP3z3dR7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 23:55:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=clXhOhyr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=clXhOhyr;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWq2j6NLnz3bbv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 23:54:05 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RDN0Ok003909;
	Mon, 27 Jun 2022 13:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=67UygGYGf07pEc+brtQSixcAB93afqPeEVm3JWtgZJ0=;
 b=clXhOhyrBidlGNqht7ose0Q/ZuQ5uSoYb18IyS8C5dG9psWqmSv9cRskKVDSrpEcQsoU
 4qRmA+27bwzQWiYHC/3/O+Z0DwAJxPwHLdO4TROb2MAzykqm2dLmmlozeHiLLFE+DzeT
 ZP7Y13Woa6SDp4vhaj+0Nx8DXnOBvE3dFTGS9eM1tFNuPvieA1/5ZyFBBIzO1yJE7czk
 tOau5q6MC/x7Fg59qeMNJmD57NMyW6Z6mg+SWFBVSw3zKGvFzV2JLyiUxqOlNAuwUsx/
 efKESalzY9R8W9/EHJoM2q5gjslqv9MeLoZ2YlBHDfVG2jRAcOJvNHJqndFVpS6y0IOb Zg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gydcv8vpp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jun 2022 13:53:55 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25RDrJml018788;
	Mon, 27 Jun 2022 13:53:54 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gydcv8vn8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jun 2022 13:53:54 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25RDocMu016916;
	Mon, 27 Jun 2022 13:53:52 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma02fra.de.ibm.com with ESMTP id 3gwt08tasq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jun 2022 13:53:52 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25RDrmd112583268
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jun 2022 13:53:49 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E08F9AE051;
	Mon, 27 Jun 2022 13:53:48 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6772FAE045;
	Mon, 27 Jun 2022 13:53:48 +0000 (GMT)
Received: from pomme.tlslab.ibm.com (unknown [9.101.4.33])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 27 Jun 2022 13:53:48 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: wim@linux-watchdog.org, linux@roeck-us.net, mpe@ellerman.id.au,
        benh@kernel.crashing.org, paulus@samba.org, nathanl@linux.ibm.com,
        haren@linux.vnet.ibm.com, npiggin@gmail.com
Subject: [PATCH v3 1/4] powerpc/mobility: wait for memory transfer to complete
Date: Mon, 27 Jun 2022 15:53:44 +0200
Message-Id: <20220627135347.32624-2-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627135347.32624-1-ldufour@linux.ibm.com>
References: <20220627135347.32624-1-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tKZzxeAgc2eR1r6hcefJLj1ZgdKtJxkm
X-Proofpoint-GUID: nVTSqCxsugdSdiw8pPPP8wB9BjKPByIg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 adultscore=0 spamscore=0 mlxscore=0 clxscore=1015 phishscore=0
 mlxlogscore=976 suspectscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206270059
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In pseries_migration_partition(), loop until the memory transfer is
complete. This way the calling drmgr process will not exit earlier,
allowing callbacks to be run only once the migration is fully completed.

If reading the VASI state is done after the hypervisor has completed the
migration, the HCALL is returning H_PARAMETER. We can safely assume that
the memory transfer is achieved if this happens.

This will also allow to manage the NMI watchdog state in the next commits.

Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>
Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/mobility.c | 42 +++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index 78f3f74c7056..907a779074d6 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -427,6 +427,43 @@ static int wait_for_vasi_session_suspending(u64 handle)
 	return ret;
 }
 
+static void wait_for_vasi_session_completed(u64 handle)
+{
+	unsigned long state = 0;
+	int ret;
+
+	pr_info("waiting for memory transfert to complete...\n");
+
+	/*
+	 * Wait for transition from H_VASI_RESUMED to H_VASI_COMPLETED.
+	 */
+	while (true) {
+		ret = poll_vasi_state(handle, &state);
+
+		/*
+		 * If the memory transfer is already complete and the migration
+		 * has been cleaned up by the hypervisor, H_PARAMETER is return,
+		 * which is translate in EINVAL by poll_vasi_state().
+		 */
+		if (ret == -EINVAL || (!ret && state == H_VASI_COMPLETED)) {
+			pr_info("memory transfert completed.\n");
+			break;
+		}
+
+		if (ret) {
+			pr_err("H_VASI_STATE return error (%d)\n", ret);
+			break;
+		}
+
+		if (state != H_VASI_RESUMED) {
+			pr_err("unexpected H_VASI_STATE result %lu\n", state);
+			break;
+		}
+
+		msleep(500);
+	}
+}
+
 static void prod_single(unsigned int target_cpu)
 {
 	long hvrc;
@@ -673,9 +710,10 @@ static int pseries_migrate_partition(u64 handle)
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

