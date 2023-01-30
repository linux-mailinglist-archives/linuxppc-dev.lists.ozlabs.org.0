Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E98681E4A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jan 2023 23:44:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5NXv3yhKz3bXQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 09:44:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Po18K8qD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=brking@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Po18K8qD;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5NWx6wRrz2xkm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 09:43:57 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30UKwl1q022242
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jan 2023 22:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=9szCe/pMSxH3ejAhsLxrEZP38yMrVIthoS8DpxwfO28=;
 b=Po18K8qDl8cyIJe9JAEJQwLWaExX987kV0nN77rHAemUI7/frYLQK0J7Bqk1Gomk/bsF
 mwdgZ2BncdY/zU1xKQJTcoCW93ANcZFxyM7YJJp2h8kGfSn1rnqsGrywVPAtZA5o9fXh
 pUXmFSTDrMscqgMwW1oe3mzdGqZYqIQseLJsxo1IyUGs1PyUBWHoDBpjuSGxBWlqtb5Q
 meGs8tSAjJ0wZzKkmUnXKhAqNwVvJsII6W/jWJTYKvItfBWcP8dBq1VAsTgRyssMKm16
 lrZirbCGgHB/2m/9EvXGrZ9OQJNVWjchlgiViNyEj48AAqZda1wDh7qwyKy5cpErmRFU 6Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nemu9u5y8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jan 2023 22:43:54 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30UMJBl0004060
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jan 2023 22:43:54 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nemu9u5xw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jan 2023 22:43:54 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30UL95Fm025825;
	Mon, 30 Jan 2023 22:43:53 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
	by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3ncvtrg8ac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jan 2023 22:43:53 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30UMhqsC36766112
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jan 2023 22:43:52 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4408D58053;
	Mon, 30 Jan 2023 22:43:52 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B184858043;
	Mon, 30 Jan 2023 22:43:51 +0000 (GMT)
Received: from li-6bf4d4cc-31f5-11b2-a85c-838e9310af65.ibm.com.com (unknown [9.163.39.106])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 30 Jan 2023 22:43:51 +0000 (GMT)
From: Brian King <brking@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/7] hvcs: Fix hvcs port reference counting
Date: Mon, 30 Jan 2023 16:43:15 -0600
Message-Id: <20230130224321.164843-2-brking@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230130224321.164843-1-brking@linux.vnet.ibm.com>
References: <20230130224321.164843-1-brking@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: u1lJ6S3-BnbgxW3YnakXly4mkM2zip-O
X-Proofpoint-ORIG-GUID: QhD0OzEQyKYC2KDL8pGZS5-fnIFN_1ZV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_17,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 mlxscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301300206
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
Cc: Brian King <brking@linux.vnet.ibm.com>, mmc@linux.vnet.ibm.com, brking@pobox.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The hvcs driver only ever gets two references to the port. One
at initialization time, and one at install time. Remove the code
that was trying to do multiple port puts for each open, which
would result in more puts than gets.

Signed-off-by: Brian King <brking@linux.vnet.ibm.com>
---
 drivers/tty/hvc/hvcs.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/tty/hvc/hvcs.c b/drivers/tty/hvc/hvcs.c
index 4ba24963685e..faf5ccfc561e 100644
--- a/drivers/tty/hvc/hvcs.c
+++ b/drivers/tty/hvc/hvcs.c
@@ -1215,12 +1215,9 @@ static void hvcs_hangup(struct tty_struct * tty)
 {
 	struct hvcs_struct *hvcsd = tty->driver_data;
 	unsigned long flags;
-	int temp_open_count;
 	int irq;
 
 	spin_lock_irqsave(&hvcsd->lock, flags);
-	/* Preserve this so that we know how many kref refs to put */
-	temp_open_count = hvcsd->port.count;
 
 	/*
 	 * Don't kref put inside the spinlock because the destruction
@@ -1247,21 +1244,6 @@ static void hvcs_hangup(struct tty_struct * tty)
 	spin_unlock_irqrestore(&hvcsd->lock, flags);
 
 	free_irq(irq, hvcsd);
-
-	/*
-	 * We need to kref_put() for every open_count we have since the
-	 * tty_hangup() function doesn't invoke a close per open connection on a
-	 * non-console device.
-	 */
-	while(temp_open_count) {
-		--temp_open_count;
-		/*
-		 * The final put will trigger destruction of the hvcs_struct.
-		 * NOTE:  If this hangup was signaled from user space then the
-		 * final put will never happen.
-		 */
-		tty_port_put(&hvcsd->port);
-	}
 }
 
 /*
-- 
2.31.1

