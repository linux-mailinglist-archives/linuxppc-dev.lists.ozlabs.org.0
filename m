Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CDD686F73
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 21:01:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6XqY6T1Jz3f8Z
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 07:01:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mr7GaujL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=brking@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mr7GaujL;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6XlY3Tq1z3cfS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Feb 2023 06:58:01 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 311JqZSj026115;
	Wed, 1 Feb 2023 19:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=9szCe/pMSxH3ejAhsLxrEZP38yMrVIthoS8DpxwfO28=;
 b=mr7GaujL2mgKP+QDHIHqUkMxfYb4qN1B9dPRdn+o7QMyE3GKATSZSwYqPFC2Cr5ZoEaW
 EfCxtfiOp6BaobgRmMSJOUgiDjliUa9GEBjSWs4p2gnLue0YS47nZdT4rzh7Sz/T30fV
 kv0I4+UAKWCL+8G6EvI7ViWzB4ci+ezi6jaEICLLP+7H7mzZaC+V6lCew5V/koQ2yTPo
 6MJ0VazPTGRFa5xw3J4pKbGZsPdgFKPyhYMF5I2/F0WgZZl46RUvO92Wz+Zq2b27orhC
 uDMFFgC40lEpbcz9pVL/phVNYaGrdKWaiOy2CFNH3jrW9r6O2t5WX4+GisTY5+EK07lM cw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfxmf82g1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 19:57:56 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 311JqtJi026600;
	Wed, 1 Feb 2023 19:57:56 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfxmf82fh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 19:57:56 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 311HTK4N012318;
	Wed, 1 Feb 2023 19:57:55 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
	by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3ncvvdqh9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 19:57:55 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 311Jvsnf12845654
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Feb 2023 19:57:54 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DCE0458057;
	Wed,  1 Feb 2023 19:57:53 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 694F258058;
	Wed,  1 Feb 2023 19:57:53 +0000 (GMT)
Received: from li-6bf4d4cc-31f5-11b2-a85c-838e9310af65.ibm.com.com (unknown [9.211.132.88])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Feb 2023 19:57:53 +0000 (GMT)
From: Brian King <brking@linux.vnet.ibm.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH 1/6] hvcs: Fix hvcs port reference counting
Date: Wed,  1 Feb 2023 13:57:38 -0600
Message-Id: <20230201195743.303163-2-brking@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230201195743.303163-1-brking@linux.vnet.ibm.com>
References: <20230201195743.303163-1-brking@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: v7uswBHvveXnc8KMdBkiaUvXHhQLuLan
X-Proofpoint-ORIG-GUID: 7-R4uACNH45QXaY0ZnaCzOPL1wJyXXKW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_04,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 impostorscore=0 mlxscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302010166
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
Cc: Brian King <brking@linux.vnet.ibm.com>, mmc@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-serial@vger.kernel.org, brking@pobox.com
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

