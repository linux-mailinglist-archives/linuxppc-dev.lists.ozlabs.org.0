Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D89A36889C5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 23:29:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7D3Y5hwsz3f74
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 09:29:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s0Sfj1IH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=brking@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s0Sfj1IH;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7D2Y6YVGz3cCF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 09:28:21 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 312M2O0q001636;
	Thu, 2 Feb 2023 22:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=L5xvp/ZXaJhUOeQVt/xt1pj3sBqLKWkx35fd2Y9EOnY=;
 b=s0Sfj1IHTjEdTDyu4eY0sDGCJpRza2h9fxXjepOjKCDWTbBiXdy0hmOEneDrOxaxo+Ld
 hqsGilsKVBDhQi8znw3pSAefjfEPyQdtRa6BqAuvN4pLAMPcsTxDBccI423jGSL3/u4T
 PVzgbOT/eu0/k1bdjG8ylHfSKLtGPbVP7exse60hgprOy8Uf9GgZ3yZClcYDz4OjmitI
 ilUQknGYwseYazI4PJJ3RS7PsoZ0AvhKdzs0rnTbDzOnXKRx6zaw3h5JxRX0pbNf28jP
 4K7Qf+E06hYbLaaqkYzEMBZHdFrHcf5j/supMeWDviCb9Focxs2Gqvfuc2x1WYLuGvZG gQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ngmhqj34f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Feb 2023 22:28:17 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 312LvI6T009631;
	Thu, 2 Feb 2023 22:28:17 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ngmhqj346-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Feb 2023 22:28:16 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 312JE0iO028721;
	Thu, 2 Feb 2023 22:28:15 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
	by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3ncvuywrsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Feb 2023 22:28:15 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 312MSEsD27656814
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Feb 2023 22:28:14 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9BBB058059;
	Thu,  2 Feb 2023 22:28:14 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D87B45804B;
	Thu,  2 Feb 2023 22:28:13 +0000 (GMT)
Received: from li-6bf4d4cc-31f5-11b2-a85c-838e9310af65.ibm.com.com (unknown [9.211.158.218])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  2 Feb 2023 22:28:13 +0000 (GMT)
From: Brian King <brking@linux.vnet.ibm.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH v2 0/6] hvcs: Various hvcs device hotplug fixes
Date: Thu,  2 Feb 2023 16:27:58 -0600
Message-Id: <20230202222804.383229-1-brking@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MruKkP72eyf1RBTdxxrafLzvCiOB7hAf
X-Proofpoint-GUID: _PrEsV4mBqkMyu3Zd8Tv_B4bOaA6rwgS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-02_14,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=999 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302020196
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

This patch series fixes a number of issues with hotplugging
hvcs devices including memory leaks as well as, the inability
to reconnect to a console device after it has been hot added
back, since it was not getting cleaned up properly on the
hotplug remove path.

Changes since initial version:
- Change to use driver default groups to manage attribute lifecycle

Brian King (6):
  hvcs: Fix hvcs port reference counting
  hvcs: Use dev_groups to manage hvcs device attributes
  hvcs: Use driver groups to manage driver attributes
  hvcs: Get reference to tty in remove
  hvcs: Use vhangup in hotplug remove
  hvcs: Synchronize hotplug remove with port free

 drivers/tty/hvc/hvcs.c | 103 +++++++++++++++++++----------------------
 1 file changed, 47 insertions(+), 56 deletions(-)

-- 
2.31.1

