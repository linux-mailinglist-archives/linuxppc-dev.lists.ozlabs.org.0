Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DCF689EC4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 17:01:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7gPx4RMFz3f7G
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 03:01:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TSoHceQa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=brking@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TSoHceQa;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7gKz4G6Vz2xHb
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Feb 2023 02:58:15 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 313FgTYo011533;
	Fri, 3 Feb 2023 15:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=djD0RZ9OL8E4ra+yAXgzKX6kFBYyu/8WLCVWpHfJIqY=;
 b=TSoHceQa6GxjBZICX1mr8QRCFcqIPYv9fUpXtSmfel/6bH/ijcTTwTjDuDmUh5bQZGEn
 07e0YCeY8/1qw83Yn+h2Ebigj46EpiC6+QryIHn32e1ClIELetBirP+PXw7PYUTw8WH2
 +0Drms6qq/NtXCj9wIw0+Alzd6MzolH7DwjDXbgMdj+0R3jJiwKnuZoJPzPGELIps8TC
 yjOGL+TZKJP8YIjKGxao14r4OCSMnKggOAcScDt7GJZIux3b+mHtS1nsS2csq2+wy01A
 /LgQRvWsnbfjA/IH/svmc5IiAPmXQh/QCTRHYpYLHiuZNux0XvxuIKHt+iiIgud3sBdf 9g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nh554gbxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Feb 2023 15:58:12 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 313FguZO012999;
	Fri, 3 Feb 2023 15:58:12 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nh554gbxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Feb 2023 15:58:12 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 313FpV9I004994;
	Fri, 3 Feb 2023 15:58:10 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
	by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3ncvv29hps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Feb 2023 15:58:10 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 313Fw9Jl43975094
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 3 Feb 2023 15:58:09 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5882358061;
	Fri,  3 Feb 2023 15:58:09 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D075658063;
	Fri,  3 Feb 2023 15:58:08 +0000 (GMT)
Received: from li-6bf4d4cc-31f5-11b2-a85c-838e9310af65.ibm.com.com (unknown [9.211.110.209])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  3 Feb 2023 15:58:08 +0000 (GMT)
From: Brian King <brking@linux.vnet.ibm.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH v3 3/5] hvcs: Get reference to tty in remove
Date: Fri,  3 Feb 2023 09:58:00 -0600
Message-Id: <20230203155802.404324-4-brking@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230203155802.404324-1-brking@linux.vnet.ibm.com>
References: <20230203155802.404324-1-brking@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ET8Fr26PdPHSkgvIe-XphPXU5J9YaFp0
X-Proofpoint-GUID: CZHFS_v0DnES3af0YDYMJMavJjO2GJFQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_15,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302030142
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

Grab a reference to the tty when removing the hvcs to ensure
it does not get freed unexpectedly.

Signed-off-by: Brian King <brking@linux.vnet.ibm.com>
---
 drivers/tty/hvc/hvcs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/hvc/hvcs.c b/drivers/tty/hvc/hvcs.c
index 522910716025..8d40b20de277 100644
--- a/drivers/tty/hvc/hvcs.c
+++ b/drivers/tty/hvc/hvcs.c
@@ -799,7 +799,7 @@ static void hvcs_remove(struct vio_dev *dev)
 
 	spin_lock_irqsave(&hvcsd->lock, flags);
 
-	tty = hvcsd->port.tty;
+	tty = tty_port_tty_get(&hvcsd->port);
 
 	spin_unlock_irqrestore(&hvcsd->lock, flags);
 
@@ -814,8 +814,10 @@ static void hvcs_remove(struct vio_dev *dev)
 	 * hvcs_hangup.  The tty should always be valid at this time unless a
 	 * simultaneous tty close already cleaned up the hvcs_struct.
 	 */
-	if (tty)
+	if (tty) {
 		tty_hangup(tty);
+		tty_kref_put(tty);
+	}
 
 	printk(KERN_INFO "HVCS: vty-server@%X removed from the"
 			" vio bus.\n", dev->unit_address);
-- 
2.31.1

