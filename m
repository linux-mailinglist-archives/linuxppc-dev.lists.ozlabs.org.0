Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B41310971C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 00:55:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MP6p3XD9zDqfG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 10:55:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MN9y0vXhzDqZX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 10:13:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47MN9v3lwcz8snv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 10:13:07 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47MN9v2ZPzz9sRc; Tue, 26 Nov 2019 10:13:07 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tlfalcon@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47MN9t5G4Qz9sRX
 for <linuxppc-dev@ozlabs.org>; Tue, 26 Nov 2019 10:13:06 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAPMvKwc037809; Mon, 25 Nov 2019 18:13:03 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wfk5kbfvc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Nov 2019 18:13:03 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAPMtR8i003766;
 Mon, 25 Nov 2019 23:13:02 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 2wevd662je-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Nov 2019 23:13:02 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAPND1MX58261784
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Nov 2019 23:13:01 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1AB76BE054;
 Mon, 25 Nov 2019 23:13:01 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1540DBE04F;
 Mon, 25 Nov 2019 23:13:00 +0000 (GMT)
Received: from oc7186267434.ibm.com (unknown [9.80.224.141])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 25 Nov 2019 23:12:59 +0000 (GMT)
From: Thomas Falcon <tlfalcon@linux.ibm.com>
To: jakub.kicinski@netronome.com
Subject: [PATCH net v2 0/4] ibmvnic: Harden device commands and queries
Date: Mon, 25 Nov 2019 17:12:52 -0600
Message-Id: <1574723576-27553-1-git-send-email-tlfalcon@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20191125112359.7a468352@cakuba.hsd1.ca.comcast.net>
References: <20191125112359.7a468352@cakuba.hsd1.ca.comcast.net>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-25_06:2019-11-21,2019-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501
 suspectscore=1 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911250181
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
Cc: julietk@linux.vnet.ibm.com, netdev@vger.kernel.org, dnbanerg@us.ibm.com,
 linuxppc-dev@ozlabs.org, Thomas Falcon <tlfalcon@linux.ibm.com>,
 brking@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch series fixes some shortcomings with the current
VNIC device command implementation. The first patch fixes
the initialization of driver completion structures used
for device commands. Additionally, all waits for device
commands are bounded with a timeout in the event that the
device does not respond or becomes inoperable. Finally,
serialize queries to retain the integrity of device return
codes.

Changes in v2:

 - included header comment for ibmvnic_wait_for_completion
 - removed open-coded loop in patch 3/4, suggested by Jakub
 - ibmvnic_wait_for_completion accepts timeout value in milliseconds
   instead of jiffies
 - timeout calculations cleaned up and completed before wait loop
 - included missing mutex_destroy calls, suggested by Jakub
 - included comment before mutex declaration

Thomas Falcon (4):
  ibmvnic: Fix completion structure initialization
  ibmvnic: Terminate waiting device threads after loss of service
  ibmvnic: Bound waits for device queries
  ibmvnic: Serialize device queries

 drivers/net/ethernet/ibm/ibmvnic.c | 192 +++++++++++++++++++++++++++++++------
 drivers/net/ethernet/ibm/ibmvnic.h |   2 +
 2 files changed, 167 insertions(+), 27 deletions(-)

-- 
2.12.3

