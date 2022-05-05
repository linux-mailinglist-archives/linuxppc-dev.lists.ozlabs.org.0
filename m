Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BB051C406
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 17:36:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvHps35rMz3c98
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 01:36:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Rg8t/MPJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Rg8t/MPJ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvHp54wGGz2yS3
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 01:35:24 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245EpOd0004048;
 Thu, 5 May 2022 15:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=C0aqoXnRwe2Jyevp0dUH4xJM8G45mtYNVOIQk0AFdOU=;
 b=Rg8t/MPJ3w9vmOnUsbo7dPJ/53mbkT/iNgd5nwv0sfRNou6UyHaMzJMu0kgjoSaZSytO
 ZwPEAApXcTFU5lqGNHgL37KIUV+ANSLiTak4TT81hJnSXrBkD65p5zdihcD14nyLX/tW
 c7ZLdbPNyIrNmEJ+J8/Z2LLD4WH6n5o6O3wGU5IiTds+RXXGWaFOH2y3f8TgWtt4UOPE
 oyHv8FGj9gTWjFNUPDZo4PrIg3mHe8aPQGCoh3eOEYl1iZdksbmTmXFRPNJXQ6eCTA3S
 B4p16S0nilBDiLJU/07YalWJdPoT19JfiwKuBL9/U5S33XXgDA0AsAZ5hfvRzzex7igV Fg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvg1y9wre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 15:35:13 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 245F8jMX030724;
 Thu, 5 May 2022 15:35:10 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3frvr8ye57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 15:35:10 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 245FZ2SQ24445438
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 May 2022 15:35:02 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A5BEA4054;
 Thu,  5 May 2022 15:35:07 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5620EA405C;
 Thu,  5 May 2022 15:35:04 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.125.84])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 May 2022 15:35:04 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
 dan.j.williams@intel.com, vaibhav@linux.ibm.com
Subject: [PATCH] powerpc/papr_scm: Fix buffer overflow issue with
 CONFIG_FORTIFY_SOURCE
Date: Thu,  5 May 2022 21:04:51 +0530
Message-Id: <20220505153451.35503-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UbvUzBKiRogP0opQO43smIbVSdy3aV-N
X-Proofpoint-GUID: UbvUzBKiRogP0opQO43smIbVSdy3aV-N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-05_06,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 phishscore=0 clxscore=1011 impostorscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205050109
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
Cc: nvdimm@lists.linux.dev, atrajeev@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 kjain@linux.ibm.com, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With CONFIG_FORTIFY_SOURCE enabled, string functions will also perform
dynamic checks for string size which can panic the kernel,
like incase of overflow detection.

In papr_scm, papr_scm_pmu_check_events function uses stat->stat_id
with string operations, to populate the nvdimm_events_map array.
Since stat_id variable is not NULL terminated, the kernel panics
with CONFIG_FORTIFY_SOURCE enabled at boot time.

Below are the logs of kernel panic:

[    0.090221][    T1] detected buffer overflow in __fortify_strlen
[    0.090241][    T1] ------------[ cut here ]------------
[    0.090246][    T1] kernel BUG at lib/string_helpers.c:980!
[    0.090253][    T1] Oops: Exception in kernel mode, sig: 5 [#1]
........
[    0.090375][    T1] NIP [c00000000077dad0] fortify_panic+0x28/0x38
[    0.090382][    T1] LR [c00000000077dacc] fortify_panic+0x24/0x38
[    0.090387][    T1] Call Trace:
[    0.090390][    T1] [c0000022d77836e0] [c00000000077dacc] fortify_panic+0x24/0x38 (unreliable)
[    9.297707] [    T1] [c00800000deb2660] papr_scm_pmu_check_events.constprop.0+0x118/0x220 [papr_scm]
[    9.297721] [    T1] [c00800000deb2cb0] papr_scm_probe+0x288/0x62c [papr_scm]
[    9.297732] [    T1] [c0000000009b46a8] platform_probe+0x98/0x150

Fix this issue by using kmemdup_nul function to copy the content of
stat->stat_id directly to the nvdimm_events_map array.

Fixes: 4c08d4bbc089 ("powerpc/papr_scm: Add perf interface support")
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index f58728d5f10d..39962c905542 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -462,7 +462,6 @@ static int papr_scm_pmu_check_events(struct papr_scm_priv *p, struct nvdimm_pmu
 {
 	struct papr_scm_perf_stat *stat;
 	struct papr_scm_perf_stats *stats;
-	char *statid;
 	int index, rc, count;
 	u32 available_events;
 
@@ -493,14 +492,12 @@ static int papr_scm_pmu_check_events(struct papr_scm_priv *p, struct nvdimm_pmu
 
 	for (index = 0, stat = stats->scm_statistic, count = 0;
 		     index < available_events; index++, ++stat) {
-		statid = kzalloc(strlen(stat->stat_id) + 1, GFP_KERNEL);
-		if (!statid) {
+		p->nvdimm_events_map[count] = kmemdup_nul(stat->stat_id, 8, GFP_KERNEL);
+		if (!p->nvdimm_events_map[count]) {
 			rc = -ENOMEM;
 			goto out_nvdimm_events_map;
 		}
 
-		strcpy(statid, stat->stat_id);
-		p->nvdimm_events_map[count] = statid;
 		count++;
 	}
 	p->nvdimm_events_map[count] = NULL;
-- 
2.31.1

