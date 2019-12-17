Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8545412248B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 07:16:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cSZz4ns6zDqT3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 17:16:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cSGt0xWWzDqYp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2019 17:02:45 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBH62NBr093566; Tue, 17 Dec 2019 01:02:35 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wvv8xc79w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2019 01:02:35 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xBH62SK8093760;
 Tue, 17 Dec 2019 01:02:28 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wvv8xc711-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2019 01:02:28 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBH60aIE023130;
 Tue, 17 Dec 2019 06:02:07 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 2wvqc6g1tn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2019 06:02:07 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBH626wJ59310416
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Dec 2019 06:02:06 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 507DAC6055;
 Tue, 17 Dec 2019 06:02:06 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E16AEC6057;
 Tue, 17 Dec 2019 06:02:05 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 17 Dec 2019 06:02:05 +0000 (GMT)
Subject: [PATCH V3 12/13] powerpc/vas: Display process stuck message
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au
In-Reply-To: <1576561080.16318.6531.camel@hbabu-laptop>
References: <1576561080.16318.6531.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 16 Dec 2019 22:00:13 -0800
Message-ID: <1576562413.16318.6547.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-17_01:2019-12-16,2019-12-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 mlxscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912170054
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
Cc: devicetree@vger.kernel.org, mikey@neuling.org, herbert@gondor.apana.org.au,
 npiggin@gmail.com, hch@infradead.org, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Process can not close send window until all requests are processed.
Means wait until window state is not busy and send credits are
returned. Display debug message in case taking longer to close the
window.

Signed-off-by: Haren Myneni <haren@us.ibm.com>
---
 arch/powerpc/platforms/powernv/vas-window.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
index 8d90d25..e6ea7d3 100644
--- a/arch/powerpc/platforms/powernv/vas-window.c
+++ b/arch/powerpc/platforms/powernv/vas-window.c
@@ -1183,6 +1183,7 @@ static void poll_window_credits(struct vas_window *window)
 {
 	u64 val;
 	int creds, mode;
+	int count = 0;
 
 	val = read_hvwc_reg(window, VREG(WINCTL));
 	if (window->tx_win)
@@ -1201,10 +1202,25 @@ static void poll_window_credits(struct vas_window *window)
 		creds = GET_FIELD(VAS_LRX_WCRED, val);
 	}
 
+	/*
+	 * Takes around few microseconds to complete all pending requests
+	 * and return credits.
+	 * TODO: Issue CRB Kill to stop all pending requests. Need only
+	 *       if there is a bug in NX or fault handling in kernel.
+	 */
 	if (creds < window->wcreds_max) {
 		val = 0;
 		set_current_state(TASK_UNINTERRUPTIBLE);
 		schedule_timeout(msecs_to_jiffies(10));
+		count++;
+		/*
+		 * Process can not close send window until all credits are
+		 * returned.
+		 */
+		if (!(count % 10000))
+			pr_debug("%s() pid %d stuck? retries %d\n", __func__,
+				vas_window_pid(window), count);
+
 		goto retry;
 	}
 }
@@ -1218,6 +1234,7 @@ static void poll_window_busy_state(struct vas_window *window)
 {
 	int busy;
 	u64 val;
+	int count = 0;
 
 retry:
 	val = read_hvwc_reg(window, VREG(WIN_STATUS));
@@ -1226,6 +1243,15 @@ static void poll_window_busy_state(struct vas_window *window)
 		val = 0;
 		set_current_state(TASK_UNINTERRUPTIBLE);
 		schedule_timeout(msecs_to_jiffies(5));
+		count++;
+		/*
+		 * Takes around 5 microseconds to process all pending
+		 * requests.
+		 */
+		if (!(count % 10000))
+			pr_debug("%s() pid %d stuck? retries %d\n", __func__,
+				vas_window_pid(window), count);
+
 		goto retry;
 	}
 }
-- 
1.8.3.1



