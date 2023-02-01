Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E83686F84
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 21:03:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6Xsb6JQnz3fSm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 07:03:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JUHBXKLM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=brking@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JUHBXKLM;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6XlZ1Gfsz3cfZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Feb 2023 06:58:01 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 311JneDq020657;
	Wed, 1 Feb 2023 19:57:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=D3e0Ny4sWs3TLgoEO4MTBtcZqFtYmX6LCVazB3HfqYY=;
 b=JUHBXKLMpaeOzhUbAhSu9M7YxKhoE8c/bv4b5lzbVpjgyRTTOOz1bzskKRg/tVu8D0cV
 f8sH0XTkeZ217RtJbZnBUOHbgym360G4m5Rypv+oz7mEuqz3VJ0n1VcfTio4sNSdkhkH
 0fTA1I8UVywfc2xB9VT13M6WhaqfI8A5kY9AadlyBxaGSwu3YPtHOecMLhNzsDkHq1zY
 ABhsOsZ10FrNREVFRF7IGTxPkFne4zM2X6OR+VYCy/Fpv6ISeCU/zNVx5bO7ENRdU9Vy
 Etmz0z3xd1dfNQ/yqPgDN0cG9dISe+Oq6dJN96phyUcJnJRUUQ/wKVkLF97LoieUESrV dA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfxk485w5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 19:57:59 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 311JnfWJ020674;
	Wed, 1 Feb 2023 19:57:59 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfxk485vr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 19:57:59 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 311HBYue026845;
	Wed, 1 Feb 2023 19:57:57 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
	by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3ncvtn7h9q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 19:57:57 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 311JvujW62193998
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Feb 2023 19:57:56 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 66D6358059;
	Wed,  1 Feb 2023 19:57:56 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE03258058;
	Wed,  1 Feb 2023 19:57:55 +0000 (GMT)
Received: from li-6bf4d4cc-31f5-11b2-a85c-838e9310af65.ibm.com.com (unknown [9.211.132.88])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Feb 2023 19:57:55 +0000 (GMT)
From: Brian King <brking@linux.vnet.ibm.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH 5/6] hvcs: Use vhangup in hotplug remove
Date: Wed,  1 Feb 2023 13:57:42 -0600
Message-Id: <20230201195743.303163-6-brking@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230201195743.303163-1-brking@linux.vnet.ibm.com>
References: <20230201195743.303163-1-brking@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tZBc_dvEd96jI3_wfswrTtv241mUG8t2
X-Proofpoint-ORIG-GUID: WRzwRzlc8IU-vvgIPyDIJOB5E1i-Yhic
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_04,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
index b28ddfc46e42..24541fc53625 100644
--- a/drivers/tty/hvc/hvcs.c
+++ b/drivers/tty/hvc/hvcs.c
@@ -815,12 +815,11 @@ static void hvcs_remove(struct vio_dev *dev)
 	sysfs_remove_group(&dev->dev.kobj, &hvcs_attr_group);
 
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

