Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B38EB1AB800
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 08:28:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492q734csmzDrPb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 16:28:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492pg963s5zDr7j
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 16:08:05 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03G64GPP090125; Thu, 16 Apr 2020 02:07:27 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30efpqavyb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Apr 2020 02:07:27 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03G67QuL098869;
 Thu, 16 Apr 2020 02:07:26 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30efpqavxy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Apr 2020 02:07:26 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03G66qp9003310;
 Thu, 16 Apr 2020 06:07:26 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01wdc.us.ibm.com with ESMTP id 30b5h6r0wj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Apr 2020 06:07:26 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03G67Pin26738958
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Apr 2020 06:07:25 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3C87AE064;
 Thu, 16 Apr 2020 06:07:25 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99AF4AE05C;
 Thu, 16 Apr 2020 06:07:24 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 16 Apr 2020 06:07:24 +0000 (GMT)
Subject: [PATCH v11 12/14] powerpc/vas: Display process stuck message
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au
In-Reply-To: <1587016214.2275.1036.camel@hbabu-laptop>
References: <1587016214.2275.1036.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 15 Apr 2020 23:06:59 -0700
Message-ID: <1587017219.2275.1073.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-16_01:2020-04-14,
 2020-04-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 mlxscore=0 suspectscore=1 mlxlogscore=999 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004160033
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
Cc: mikey@neuling.org, srikar@linux.vnet.ibm.com, frederic.barrat@fr.ibm.com,
 ajd@linux.ibm.com, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 hch@infradead.org, oohall@gmail.com, clg@kaod.org, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, herbert@gondor.apana.org.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Process can not close send window until all requests are processed.
Means wait until window state is not busy and send credits are
returned. Display debug messages in case taking longer to close the
window.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/vas-window.c | 30 ++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
index 4b5adf5..d0c07cf 100644
--- a/arch/powerpc/platforms/powernv/vas-window.c
+++ b/arch/powerpc/platforms/powernv/vas-window.c
@@ -1181,6 +1181,7 @@ static void poll_window_credits(struct vas_window *window)
 {
 	u64 val;
 	int creds, mode;
+	int count = 0;
 
 	val = read_hvwc_reg(window, VREG(WINCTL));
 	if (window->tx_win)
@@ -1199,10 +1200,27 @@ static void poll_window_credits(struct vas_window *window)
 		creds = GET_FIELD(VAS_LRX_WCRED, val);
 	}
 
+	/*
+	 * Takes around few milliseconds to complete all pending requests
+	 * and return credits.
+	 * TODO: Scan fault FIFO and invalidate CRBs points to this window
+	 *       and issue CRB Kill to stop all pending requests. Need only
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
+		if (!(count % 1000))
+			pr_warn_ratelimited("VAS: pid %d stuck. Waiting for credits returned for Window(%d). creds %d, Retries %d\n",
+				vas_window_pid(window), window->winid,
+				creds, count);
+
 		goto retry;
 	}
 }
@@ -1216,6 +1234,7 @@ static void poll_window_busy_state(struct vas_window *window)
 {
 	int busy;
 	u64 val;
+	int count = 0;
 
 retry:
 	val = read_hvwc_reg(window, VREG(WIN_STATUS));
@@ -1223,7 +1242,16 @@ static void poll_window_busy_state(struct vas_window *window)
 	if (busy) {
 		val = 0;
 		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(msecs_to_jiffies(5));
+		schedule_timeout(msecs_to_jiffies(10));
+		count++;
+		/*
+		 * Takes around few milliseconds to process all pending
+		 * requests.
+		 */
+		if (!(count % 1000))
+			pr_warn_ratelimited("VAS: pid %d stuck. Window (ID=%d) is in busy state. Retries %d\n",
+				vas_window_pid(window), window->winid, count);
+
 		goto retry;
 	}
 }
-- 
1.8.3.1



