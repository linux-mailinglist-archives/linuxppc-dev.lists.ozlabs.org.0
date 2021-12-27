Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F9E47FC11
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Dec 2021 12:00:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JMvps3Qbnz2ybK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Dec 2021 22:00:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S4Epz44B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=S4Epz44B; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JMvp36GzWz3c65
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Dec 2021 22:00:11 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BRAfnwW029149; 
 Mon, 27 Dec 2021 11:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=FtuDLXOr6o0yKLtf7bVV0x2BIWOTK2wTt3NVrMo9Hss=;
 b=S4Epz44BcAx6mZkgNvVKBeuGhHzBhpQ+shq+Y/S98Sr21HpTXETKCoUZGYziZecZtnLF
 fCvbHbhoo7nSh019JKabEBIt2mbyJh3GnXV7lgMIHR1S2kjeyv0aQeYFpIuwkviTw0Lx
 SfN60IvpjJ32Azo5B+O5x0H45fOlQ6VU/S9f/tAB51+mK+ruHQ/tpHIpac91h0sCSVk4
 hnSpA2xzWmBnqArb9CCwQnqNxP2Y83TNqw5pBcf8i5V8LV0YBljljVfQrIORSYO1Up/D
 E0CgAgh1Lu2sgXMyEOdssQs8p47gA7ujIkROEFNZWds/PBs6CaBchwUWPZAY7+tOXYID 0Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7by6g879-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 11:00:07 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BRAiGk5034260;
 Mon, 27 Dec 2021 11:00:07 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7by6g86a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 11:00:07 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BRAE27l015737;
 Mon, 27 Dec 2021 11:00:06 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma05wdc.us.ibm.com with ESMTP id 3d5tx9r4tx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 11:00:06 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BRB03Q230277932
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Dec 2021 11:00:03 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8AD6136069;
 Mon, 27 Dec 2021 11:00:03 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1EA313606E;
 Mon, 27 Dec 2021 11:00:02 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.90.83])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 27 Dec 2021 11:00:02 +0000 (GMT)
Message-ID: <92d87ead72556e946d7fa6775c509de8b6d11935.camel@linux.ibm.com>
Subject: [RFC PATCH 3/3] powerpc/pseries/vas: Use migration_in_progress to
 disable DLPAR
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Mon, 27 Dec 2021 03:00:01 -0800
In-Reply-To: <af4574e7553a632884a2f00fcb96bd82fa063fe9.camel@linux.ibm.com>
References: <af4574e7553a632884a2f00fcb96bd82fa063fe9.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pamOVEMrN9X6m1YRHexC8nC5bFABXL0f
X-Proofpoint-GUID: CHrGbM_bUzSoWNe8f5OSb1dkva5GCasQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-27_02,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 mlxlogscore=999 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112270052
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Before migration starts, all secondary CPUs will be offline which
can invoke VAS DLPAR event. So disable VAS DLPAR event with
migration_in_progress flag during suspend and enable after resume
operations.

The current partition migration implementation does not freeze the
user space and the user space can continue open VAS windows. So
when migration_in_progress flag is enabled, VAS open window
API returns -EBUSY.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/vas.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index d2d7202a4f4e..1a10c1904aaa 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -30,6 +30,7 @@ static bool copypaste_feat;
 
 static struct vas_caps vascaps[VAS_MAX_FEAT_TYPE];
 static DEFINE_MUTEX(vas_pseries_mutex);
+static bool migration_in_progress;
 
 static long hcall_return_busy_check(long rc)
 {
@@ -349,8 +350,11 @@ static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
 	 * same fault IRQ is not freed by the OS before.
 	 */
 	mutex_lock(&vas_pseries_mutex);
-	rc = allocate_setup_window(txwin, (u64 *)&domain[0],
-				   cop_feat_caps->win_type);
+	if (migration_in_progress)
+		rc = -EBUSY;
+	else
+		rc = allocate_setup_window(txwin, (u64 *)&domain[0],
+					   cop_feat_caps->win_type);
 	mutex_unlock(&vas_pseries_mutex);
 	if (rc)
 		goto out;
@@ -771,6 +775,9 @@ int vas_reconfig_capabilties(u8 type)
 		return -ENOMEM;
 
 	mutex_lock(&vas_pseries_mutex);
+	if (migration_in_progress)
+		goto out;
+
 	rc = h_query_vas_capabilities(H_QUERY_VAS_CAPABILITIES, vcaps->feat,
 				      (u64)virt_to_phys(hv_caps));
 	if (rc)
@@ -866,6 +873,11 @@ static int vas_migrate_windows(bool suspend)
 
 	mutex_lock(&vas_pseries_mutex);
 
+	if (suspend)
+		migration_in_progress = true;
+	else
+		migration_in_progress = false;
+
 	for (i = 0; i < VAS_MAX_FEAT_TYPE; i++) {
 		vcaps = &vascaps[i];
 		caps = &vcaps->caps;
-- 
2.27.0


