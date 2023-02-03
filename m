Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F048B689EC8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 17:02:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7gQy6FT0z3fHT
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 03:02:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a5KfxYf+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=brking@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a5KfxYf+;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7gKz6b01z3f65
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Feb 2023 02:58:15 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 313FgSak011444;
	Fri, 3 Feb 2023 15:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=mTUej6imQQ8/A+3tpsOQrqNCFxcd5vXrdHiqFWNV1VI=;
 b=a5KfxYf+GZnCPleVbN4yaDS01nv+hZsPYgG9ZoU34u3yYUFk1LAkOBnNSieYUddQk2wv
 2AOQz4ydt46+u+r73+SZdTFu/mhBausl2ulN26miOVZ+WnEg6VMDfcRW9jFsWPuIvYPy
 8A9nOx9Aj/515E89Xzu50iG0OazNmcVMBJ7CCPun+TfaFlMPUcWbUGFwQmJDj6dRA8S/
 CNROxN0Qvhw9wz0PvEX/UXRz+2MOpAM+/z4ZQqZooW765Dd183LyWeQK9g3TxC1hWZhQ
 rpVUuXlScfyzD0Yn7S7xk9KHZmk+Wgwln+6SRf4H20qfCGAtWUKvQY2ZCLXdUQdRzsM7 Eg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nh554gby1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Feb 2023 15:58:13 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 313Fgthd012922;
	Fri, 3 Feb 2023 15:58:12 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nh554gbxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Feb 2023 15:58:12 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 313E7A7q006461;
	Fri, 3 Feb 2023 15:58:11 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3ncvtn1t9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Feb 2023 15:58:11 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 313FwALZ7471754
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 3 Feb 2023 15:58:10 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0117F58061;
	Fri,  3 Feb 2023 15:58:10 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 761B15803F;
	Fri,  3 Feb 2023 15:58:09 +0000 (GMT)
Received: from li-6bf4d4cc-31f5-11b2-a85c-838e9310af65.ibm.com.com (unknown [9.211.110.209])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  3 Feb 2023 15:58:09 +0000 (GMT)
From: Brian King <brking@linux.vnet.ibm.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH v3 4/5] hvcs: Use vhangup in hotplug remove
Date: Fri,  3 Feb 2023 09:58:01 -0600
Message-Id: <20230203155802.404324-5-brking@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230203155802.404324-1-brking@linux.vnet.ibm.com>
References: <20230203155802.404324-1-brking@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UMGudlzfDiOi2Zy8qcn06zp7RHwhhFi6
X-Proofpoint-GUID: DlkXSMpT3Tskk1pFTHYZxNroI3AiFNFe
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

When hotplug removing an hvcs device, we need to ensure the
hangup processing is done prior to exiting the remove function,
so use tty_vhangup to do the hangup processing directly
rather than using tty_hangup which simply schedules the hangup
work for later execution.

Signed-off-by: Brian King <brking@linux.vnet.ibm.com>
---
 drivers/tty/hvc/hvcs.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/hvc/hvcs.c b/drivers/tty/hvc/hvcs.c
index 8d40b20de277..ecf24195b1e9 100644
--- a/drivers/tty/hvc/hvcs.c
+++ b/drivers/tty/hvc/hvcs.c
@@ -810,12 +810,11 @@ static void hvcs_remove(struct vio_dev *dev)
 	tty_port_put(&hvcsd->port);
 
 	/*
-	 * The hangup is a scheduled function which will auto chain call
-	 * hvcs_hangup.  The tty should always be valid at this time unless a
+	 * The tty should always be valid at this time unless a
 	 * simultaneous tty close already cleaned up the hvcs_struct.
 	 */
 	if (tty) {
-		tty_hangup(tty);
+		tty_vhangup(tty);
 		tty_kref_put(tty);
 	}
 
-- 
2.31.1

