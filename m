Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC82681E5C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jan 2023 23:46:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5NZx3sj7z3cf0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 09:46:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q7/9vywg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=brking@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q7/9vywg;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5NWz0HBPz2xjR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 09:43:58 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30UKxT0m009672
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jan 2023 22:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=QpwMgr23nIiMkJ3ihnsLIr7pw0uxT05vUxhNww44wHs=;
 b=Q7/9vywghNjSn0knVPIgi4hbDQbyHKqYWyVaeyWjrEHZ2gB/5DfiPZZcXGw6B4iQvRRj
 4QK7D3Kc04F4G5uoY3qpaL9SWdcnoGYKPynARoblvOtYrrZ/s1GBN4sHTF/TTgjw+Hhw
 YihBtgrJbp5EoC18Lefq9uWvY5RmdsFfFfMM42xCABYpCTE5nn7eb2d3jpB60McU/m/o
 L1O7EvLxwvf16OpgByrXbLInHAcjyg6NGJh4oKAhH+n8JnR/ianSSjaWnLYidHWBAzNS
 uPPxZ9hiuBgVuPleGRilqlKjBabiEwj/peLVjt/bYbw6eCr0g6H9vNpb1sfeHjpAQ09j AQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nemrg36tb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jan 2023 22:43:56 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30UMhtcN019214
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jan 2023 22:43:55 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nemrg36t3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jan 2023 22:43:55 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30UJKEgr028521;
	Mon, 30 Jan 2023 22:43:55 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
	by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3ncvuyd0nj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jan 2023 22:43:54 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30UMhrlE32571968
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jan 2023 22:43:53 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C0DC05805D;
	Mon, 30 Jan 2023 22:43:53 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 321B858053;
	Mon, 30 Jan 2023 22:43:53 +0000 (GMT)
Received: from li-6bf4d4cc-31f5-11b2-a85c-838e9310af65.ibm.com.com (unknown [9.163.39.106])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 30 Jan 2023 22:43:53 +0000 (GMT)
From: Brian King <brking@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/7] hvcs: Remove sysfs group earlier
Date: Mon, 30 Jan 2023 16:43:17 -0600
Message-Id: <20230130224321.164843-4-brking@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230130224321.164843-1-brking@linux.vnet.ibm.com>
References: <20230130224321.164843-1-brking@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sHRACKaPND_ydnN_UIJARXPfDCPP69l0
X-Proofpoint-ORIG-GUID: NYC9gHBUnPmZaHSu9V8-yILvD1kusN-E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_17,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxlogscore=929 adultscore=0 impostorscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Cleanup the sysfs group earlier in remove. This eliminates
errors coming from kernfs when attempting to remove a console
device that is in use.

Signed-off-by: Brian King <brking@linux.vnet.ibm.com>
---
 drivers/tty/hvc/hvcs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/hvc/hvcs.c b/drivers/tty/hvc/hvcs.c
index 9131dcb2e8d8..9c5887d0c882 100644
--- a/drivers/tty/hvc/hvcs.c
+++ b/drivers/tty/hvc/hvcs.c
@@ -688,8 +688,6 @@ static void hvcs_destruct_port(struct tty_port *p)
 	spin_unlock_irqrestore(&hvcsd->lock, flags);
 	spin_unlock(&hvcs_structs_lock);
 
-	sysfs_remove_group(&vdev->dev.kobj, &hvcs_attr_group);
-
 	kfree(hvcsd);
 }
 
@@ -814,6 +812,8 @@ static void hvcs_remove(struct vio_dev *dev)
 	 */
 	tty_port_put(&hvcsd->port);
 
+	sysfs_remove_group(&dev->dev.kobj, &hvcs_attr_group);
+
 	/*
 	 * The hangup is a scheduled function which will auto chain call
 	 * hvcs_hangup.  The tty should always be valid at this time unless a
-- 
2.31.1

