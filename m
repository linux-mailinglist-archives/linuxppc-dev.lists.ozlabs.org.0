Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A4562F8E7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 16:08:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDKtS6zMtz3f3B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 02:08:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kg6GNNtQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kg6GNNtQ;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDKsV5NHTz3bdC
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 02:07:58 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AIE7u43030631
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=A6vzetbjGKxX9YGD+UokdVBjWu9akFi4bStd7Z2ATEM=;
 b=kg6GNNtQXX/iP8DFHaD6LbAwk9HMMp/jsLZ6oX3P1bPkQRlJkxuA4QVk7j7M4xTUtldg
 LnUWaKPubcYGJieOgiZNDK7Dxt1Gy1bYYsfPdUPcGFmQh+48irtPdeiCecq4HsDGIp1d
 q7P7J6En/BpZboNowy3eVgeucFkF65fVtHZ8n4oLrYJwSCdM2BQ/oBAO5mWXyNheX5tF
 NxsT+hLYJco4+cXPts6qW7syxah0R7F55YVPW+8n+fZmj0cFwFB3W2kudhsGKVGiui8Q
 jYAZ5lC8+/sULH5JHTtS/f64XsMpy5afuK8hrcxLFZYeB1dVz5xH57TQ4AzXKbSU47i3 yQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kxa0tc3ut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:07:55 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AIF3esT022777
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:07:55 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kxa0tc3ug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 15:07:55 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AIF6w38003613;
	Fri, 18 Nov 2022 15:07:54 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by ppma03wdc.us.ibm.com with ESMTP id 3kt34ar5x9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 15:07:54 +0000
Received: from smtpav03.dal12v.mail.ibm.com ([9.208.128.129])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AIF7pAQ42730082
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Nov 2022 15:07:52 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1939558061;
	Fri, 18 Nov 2022 15:07:53 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E537758056;
	Fri, 18 Nov 2022 15:07:52 +0000 (GMT)
Received: from localhost (unknown [9.211.69.164])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Nov 2022 15:07:52 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 03/13] powerpc/rtas: avoid device tree lookups in rtas_os_term()
Date: Fri, 18 Nov 2022 09:07:41 -0600
Message-Id: <20221118150751.469393-4-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221118150751.469393-1-nathanl@linux.ibm.com>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tn08NBkwIr__vgtJypIU8ahW2E5IyOzG
X-Proofpoint-GUID: cYrOAr3hB3M36aw91SJmc4kV6gqjN4U7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_02,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 mlxscore=0 spamscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211180084
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
Cc: tyreld@linux.ibm.com, nnac123@linux.ibm.com, ldufour@linux.ibm.com, ajd@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

rtas_os_term() is called during panic. Its behavior depends on a
couple of conditions in the /rtas node of the device tree, the
traversal of which entails locking and local IRQ state changes. If the
kernel panics while devtree_lock is held, rtas_os_term() as currently
written could hang.

Instead of discovering the relevant characteristics at panic time,
cache them in file-static variables at boot. Note the lookup for
"ibm,extended-os-term" is converted to of_property_read_bool() since
it is a boolean property, not a RTAS function token.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index c12dd5ed5e00..81e4996012b7 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -947,6 +947,8 @@ void __noreturn rtas_halt(void)
 
 /* Must be in the RMO region, so we place it here */
 static char rtas_os_term_buf[2048];
+static s32 ibm_os_term_token = RTAS_UNKNOWN_SERVICE;
+static bool ibm_extended_os_term;
 
 void rtas_os_term(char *str)
 {
@@ -958,14 +960,13 @@ void rtas_os_term(char *str)
 	 * this property may terminate the partition which we want to avoid
 	 * since it interferes with panic_timeout.
 	 */
-	if (RTAS_UNKNOWN_SERVICE == rtas_token("ibm,os-term") ||
-	    RTAS_UNKNOWN_SERVICE == rtas_token("ibm,extended-os-term"))
+	if (ibm_os_term_token == RTAS_UNKNOWN_SERVICE || !ibm_extended_os_term)
 		return;
 
 	snprintf(rtas_os_term_buf, 2048, "OS panic: %s", str);
 
 	do {
-		status = rtas_call(rtas_token("ibm,os-term"), 1, 1, NULL,
+		status = rtas_call(ibm_os_term_token, 1, 1, NULL,
 				   __pa(rtas_os_term_buf));
 	} while (rtas_busy_delay(status));
 
@@ -1335,6 +1336,13 @@ void __init rtas_initialize(void)
 	no_entry = of_property_read_u32(rtas.dev, "linux,rtas-entry", &entry);
 	rtas.entry = no_entry ? rtas.base : entry;
 
+	/*
+	 * Discover these now to avoid device tree lookups in the
+	 * panic path.
+	 */
+	ibm_os_term_token = rtas_token("ibm,os-term");
+	ibm_extended_os_term = of_property_read_bool(rtas.dev, "ibm,extended-os-term");
+
 	/* If RTAS was found, allocate the RMO buffer for it and look for
 	 * the stop-self token if any
 	 */
-- 
2.37.1

