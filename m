Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1393529FAB2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 02:47:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMlYn2tnnzDqyf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 12:47:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=s1Cuo6jr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMkw325B1zDqkw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 12:18:27 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09U16JMR063332
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=QvDbVx8pU/hdtZn3B4Nbe/V2uJZu+b/1KreBXBPKlwc=;
 b=s1Cuo6jr4F4kMTtM1ucenlEJ+eDB3/wFpXM8cadSwOYyI4II10w3PTrsyrzTblcwRgWO
 U0f/00KphZkAcpRcedp/vE9dOvttsG/R4rCM4wTmzFpeUOKGIf2779i4h7doxR5QZl6M
 BK1p8IuujbE5NvSEBjWyynbBSK+B1EaujCBEgcnO/bxKBDYt/NXLle2YzRchj8UP9Dle
 sOxFA+a8BBliijtqiJ8zfRepQyjNcm6Auqt/EhpCzA8+WO19wXV5L5OE+/DWLBXMhpZ2
 /Focmc6o8MHD5EaKGbJGdzID7tXLqNaSsTBTinDSa45i2kmS6dYT9EytI8hdjWp1ajXw uQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34fwvf40c6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:21 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09U1GgVB027856
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:20 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03dal.us.ibm.com with ESMTP id 34etf9fq7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:20 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09U1IJpw16057016
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Oct 2020 01:18:19 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C5FFF28059;
 Fri, 30 Oct 2020 01:18:19 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F76128058;
 Fri, 30 Oct 2020 01:18:19 +0000 (GMT)
Received: from localhost (unknown [9.65.225.148])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 30 Oct 2020 01:18:19 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 15/29] powerpc/pseries/mobility: retry partition suspend after
 error
Date: Thu, 29 Oct 2020 20:17:51 -0500
Message-Id: <20201030011805.1224603-16-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201030011805.1224603-1-nathanl@linux.ibm.com>
References: <20201030011805.1224603-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-29_12:2020-10-29,
 2020-10-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=1
 mlxlogscore=632 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010300001
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
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, mmc@linux.vnet.ibm.com,
 cforno12@linux.vnet.ibm.com, drt@linux.vnet.ibm.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a mitigation for the relatively rare occurrence where a
virtual IOA can be in a transient state that prevents the
suspend/migration from succeeding, resulting in an error from
ibm,suspend-me.

If the join/suspend sequence returns an error, it is acceptable to
retry as long as the VASI suspend session state is still
"Suspending" (i.e. the platform is still waiting for the OS to
suspend).

Retry a few times on suspend failure while this condition holds,
progressively increasing the delay between attempts. We don't want to
retry indefinitey because firmware emits an error log event on each
unsuccessful attempt.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/mobility.c | 59 ++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index 0f592246f345..e459cdb8286f 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -549,16 +549,71 @@ static void pseries_cancel_migration(u64 handle, int err)
 		pr_err("H_VASI_SIGNAL error: %ld\n", hvrc);
 }
 
+static int pseries_suspend(u64 handle)
+{
+	const unsigned int max_attempts = 5;
+	unsigned int retry_interval_ms = 1;
+	unsigned int attempt = 1;
+	int ret;
+
+	while (true) {
+		atomic_t counter = ATOMIC_INIT(0);
+		unsigned long vasi_state;
+		int vasi_err;
+
+		ret = stop_machine(do_join, &counter, cpu_online_mask);
+		if (ret == 0)
+			break;
+		/*
+		 * Encountered an error. If the VASI stream is still
+		 * in Suspending state, it's likely a transient
+		 * condition related to some device in the partition
+		 * and we can retry in the hope that the cause has
+		 * cleared after some delay.
+		 *
+		 * A better design would allow drivers etc to prepare
+		 * for the suspend and avoid conditions which prevent
+		 * the suspend from succeeding. For now, we have this
+		 * mitigation.
+		 */
+		pr_notice("Partition suspend attempt %u of %u error: %d\n",
+			  attempt, max_attempts, ret);
+
+		if (attempt == max_attempts)
+			break;
+
+		vasi_err = poll_vasi_state(handle, &vasi_state);
+		if (vasi_err == 0) {
+			if (vasi_state != H_VASI_SUSPENDING) {
+				pr_notice("VASI state %lu after failed suspend\n",
+					  vasi_state);
+				break;
+			}
+		} else if (vasi_err != -EOPNOTSUPP) {
+			pr_err("VASI state poll error: %d", vasi_err);
+			break;
+		}
+
+		pr_notice("Will retry partition suspend after %u ms\n",
+			  retry_interval_ms);
+
+		msleep(retry_interval_ms);
+		retry_interval_ms *= 10;
+		attempt++;
+	}
+
+	return ret;
+}
+
 static int pseries_migrate_partition(u64 handle)
 {
-	atomic_t counter = ATOMIC_INIT(0);
 	int ret;
 
 	ret = wait_for_vasi_session_suspending(handle);
 	if (ret)
 		goto out;
 
-	ret = stop_machine(do_join, &counter, cpu_online_mask);
+	ret = pseries_suspend(handle);
 	if (ret == 0)
 		post_mobility_fixup();
 	else
-- 
2.25.4

