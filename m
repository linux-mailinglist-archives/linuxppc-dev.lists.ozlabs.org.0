Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14619244629
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 10:09:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSbgS5VrMzDqgk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 18:09:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ljp@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JTV7AYkg; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSbSN64NHzDqJM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 17:59:26 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07E7Urap020833; Fri, 14 Aug 2020 03:59:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=lKPuL9AEUwNbEMMrAuSbtDjAunKkNzlLrJkbsfgDB9s=;
 b=JTV7AYkg4JQ/SJcNxwoof4mVxxnp6ayFqcYoM+/z5SMtp2lW+XbXkbw8ArJNnxqC0cbA
 sg8aw4NKjQku1M5yJmvXNx9dgVS+w+YkKuSkKW7gvAyIl0K60eUJIhOm7dbtOxHhmc0H
 d9J9AuXrDJBlD2gXwTrA7ECcvFzTVFOWiqiDW1PAdy/42XXdrt1FKBM+FJEW3SDJ5exm
 bB/yHdxw8zghEB3ln4TY79B4Iq8yiillfDefcl9NAxsOI3viFZB6a8Jc42q1kRJneEou
 dJvkfKkhE+f0ATlIbhZofeMTtnpZ5+mx6ZAjiIjGpy4lBgpIiQAHbo/tjjLxICZx7T0q jw== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32w6tc1er1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Aug 2020 03:59:23 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07E7u3pq029852;
 Fri, 14 Aug 2020 07:59:22 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03wdc.us.ibm.com with ESMTP id 32skp9rfnd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Aug 2020 07:59:22 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07E7xMEw53674376
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Aug 2020 07:59:22 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A6B2AC05B;
 Fri, 14 Aug 2020 07:59:22 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F374FAC059;
 Fri, 14 Aug 2020 07:59:21 +0000 (GMT)
Received: from pompom.ibm.com (unknown [9.160.68.30])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 14 Aug 2020 07:59:21 +0000 (GMT)
From: Lijun Pan <ljp@linux.ibm.com>
To: netdev@vger.kernel.org
Subject: [PATCH net 0/5] refactoring of ibmvnic code
Date: Fri, 14 Aug 2020 02:59:16 -0500
Message-Id: <20200814075921.88745-1-ljp@linux.ibm.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-14_02:2020-08-13,
 2020-08-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=1
 malwarescore=0 priorityscore=1501 mlxlogscore=640 clxscore=1011
 adultscore=0 spamscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008140054
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
Cc: Lijun Pan <ljp@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch series refactor reset_init and init functions,
improve the debugging messages, and make some other cosmetic changes
to make the code easier to read and debug.

Lijun Pan (5):
  ibmvnic: print caller in several error messages
  ibmvnic: compare adapter->init_done_rc with more readable
    ibmvnic_rc_codes
  ibmvnic: improve ibmvnic_init and ibmvnic_reset_init
  ibmvnic: remove never executed if statement
  ibmvnic: merge ibmvnic_reset_init and ibmvnic_init

 drivers/net/ethernet/ibm/ibmvnic.c | 98 +++++++++---------------------
 1 file changed, 28 insertions(+), 70 deletions(-)

-- 
2.23.0

