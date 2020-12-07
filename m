Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5293C2D1D46
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 23:25:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqdDk6156zDqWc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 09:25:42 +1100 (AEDT)
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
 header.s=pp1 header.b=N2SLgH14; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqcV82VdLzDqVT
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 08:52:16 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B7LS5pG007348
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 16:52:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=lmkh+8bi3AFeAtYm8i7H5m7dRg6TNWZ5zXr3J51kdxg=;
 b=N2SLgH14xKUOJZ3lODGPNC7hxmEVO2F7z1I4yWGhCM0LKBsmfuPMKO4P+wRKhb6I26j5
 e0yZ79WjCLmrfFrnorJMf/XYWyCEyKjxvHTWm0UK3Cg0DhhMkDTXRF72wla7L1DbRrCX
 +9pwgmxtf1StPhQ0C5AcaCRqdJAqf2EUdNfF5wxFONx++AD0a4u68ovZBb3ARofyuLNa
 KDjVHH2bNNnpiUgaDU+lS0D1f4pIPZx4oaLkc3ZFYeH4S1l4CzyDULKWiLXVITyQUUuF
 q4EawIz8JZgSeh8+OSTAHJ6qZK5bwzZ1S6r6Hqo49VcHH0UKrEIOr67yychUaLbGLnYs QA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 359qrp198t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 16:52:13 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B7LlqUw002543
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 21:52:12 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01dal.us.ibm.com with ESMTP id 3581u8yqaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 21:52:12 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B7LqBt55898824
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Dec 2020 21:52:11 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65FC6AC059;
 Mon,  7 Dec 2020 21:52:11 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33E76AC05B;
 Mon,  7 Dec 2020 21:52:11 +0000 (GMT)
Received: from localhost (unknown [9.160.57.67])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  7 Dec 2020 21:52:11 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 14/28] powerpc/pseries/mobility: retry partition suspend
 after error
Date: Mon,  7 Dec 2020 15:51:46 -0600
Message-Id: <20201207215200.1785968-15-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201207215200.1785968-1-nathanl@linux.ibm.com>
References: <20201207215200.1785968-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-07_16:2020-12-04,
 2020-12-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 suspectscore=1 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0
 mlxlogscore=714 impostorscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012070132
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
index f234a7ed87aa..fe7e35cdc9d5 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -542,16 +542,71 @@ static void pseries_cancel_migration(u64 handle, int err)
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
 		return ret;
 
-	ret = stop_machine(do_join, &counter, cpu_online_mask);
+	ret = pseries_suspend(handle);
 	if (ret == 0)
 		post_mobility_fixup();
 	else
-- 
2.28.0

