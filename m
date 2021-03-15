Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEDB33ACE9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 09:01:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzTQB47NGz2yZ5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 19:01:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aurOwzO7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aurOwzO7; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzTPj1GBYz2xMW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 19:00:56 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12F7YXNd016861; Mon, 15 Mar 2021 04:00:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=GLlW0ba4iJy/Q0v97qBpIC1VkGX9LTQbzBXh7IDWK3E=;
 b=aurOwzO7hok8jI9lCmorQ0xPWx4utUt81TYgOvB+p8p79Y6WuvcCTgLCj86u2athICpL
 a5ivBDGb0845wb/yhwkx9EaGIfJbAsBukvbsbbasv+0Uu1Tnb/dF6RsxfUGtH9+awK0P
 gQpeP4Ee1PGzN4WWp7lrtrnMOt+R1jkCXsqBYXlMmDCbhFXW7C0kbU2zYToJVvaQVi3V
 W4oklEJRJXdh1epCcOHSef4gaiv8ml+QsioOuwDEWRCxKr5EW6NcscbOz8RDzxWfAu6K
 8O3h0dPqa+ihYaGIAmWrLZ8AFhRkfwfFETqUa+r/n9iSyDAKJRYqmRVMSPcpyD22Fk0j Fw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 379upq0yyr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 04:00:51 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12F7Yhl0017431;
 Mon, 15 Mar 2021 04:00:49 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 379upq0yvy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 04:00:49 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12F7r1wa015457;
 Mon, 15 Mar 2021 08:00:47 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma05wdc.us.ibm.com with ESMTP id 378n18wp8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 08:00:47 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12F80k1Q38076790
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 08:00:46 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 477577805C;
 Mon, 15 Mar 2021 08:00:46 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 294FC78063;
 Mon, 15 Mar 2021 08:00:46 +0000 (GMT)
Received: from localhost (unknown [9.211.84.92])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 15 Mar 2021 08:00:46 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/pseries/mobility: use struct for shared state
Date: Mon, 15 Mar 2021 03:00:44 -0500
Message-Id: <20210315080045.460331-2-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210315080045.460331-1-nathanl@linux.ibm.com>
References: <20210315080045.460331-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-15_03:2021-03-15,
 2021-03-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 suspectscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103150050
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
Cc: tyreld@linux.ibm.com, brking@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The atomic_t counter is the only shared state for the join/suspend
sequence so far, but that will change. Contain it in a
struct (pseries_suspend_info), and document its intended use. No
functional change.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/mobility.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index ea4d6a660e0d..a6739ce9feac 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -452,9 +452,21 @@ static int do_suspend(void)
 	return ret;
 }
 
+/**
+ * struct pseries_suspend_info - State shared between CPUs for join/suspend.
+ * @counter: Threads are to increment this upon resuming from suspend
+ *           or if an error is received from H_JOIN. The thread which performs
+ *           the first increment (i.e. sets it to 1) is responsible for
+ *           waking the other threads.
+ */
+struct pseries_suspend_info {
+	atomic_t counter;
+};
+
 static int do_join(void *arg)
 {
-	atomic_t *counter = arg;
+	struct pseries_suspend_info *info = arg;
+	atomic_t *counter = &info->counter;
 	long hvrc;
 	int ret;
 
@@ -535,11 +547,15 @@ static int pseries_suspend(u64 handle)
 	int ret;
 
 	while (true) {
-		atomic_t counter = ATOMIC_INIT(0);
+		struct pseries_suspend_info info;
 		unsigned long vasi_state;
 		int vasi_err;
 
-		ret = stop_machine(do_join, &counter, cpu_online_mask);
+		info = (struct pseries_suspend_info) {
+			.counter = ATOMIC_INIT(0),
+		};
+
+		ret = stop_machine(do_join, &info, cpu_online_mask);
 		if (ret == 0)
 			break;
 		/*
-- 
2.29.2

