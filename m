Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7D4276888
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 07:46:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxkZ10MJ6zDqTZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 15:46:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mamatha4@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=D+qEBAGz; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxjsV4sZvzDqYb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 15:14:51 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08O52VTV092817; Thu, 24 Sep 2020 01:14:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=lh13OQH20WYkAvF82qQ30CMf0+MM9LtINKRcfdztWMI=;
 b=D+qEBAGzMJ2TGyOO9VzCuILJe9DtF3tWQSOAmDH4lukbMBcEFlM2dyhNf1ZpDfh6he0W
 Hnk9XO9yJy+6nG8pi8Bjt2vNSsSUAj1cicSpRYINjOdv6YlDr3xM9oeeP85Zqk+nWpvs
 JSKrUdoV8hIq2LJquHIMHbUmkF+aKiNCi7+CS+EXcsCjNlN9V8n7aFGmRrF5JKOoDmyb
 +Zvt1iZaFv5eDU/YqRNrGbjS1CUyDhxrflFYK0XVOyPN0SFbW3JExw5ixXY96UKjwv1k
 n22fRXvstUuf3OVkDdDkq0cQhI/E4lJ5ydbABruQFjFb1nXZFxXnBMwdcgbzFxee0Eia FA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33rjwgartr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Sep 2020 01:14:45 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08O52vcB093840;
 Thu, 24 Sep 2020 01:14:45 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33rjwgarmu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Sep 2020 01:14:45 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08O5CeLf007209;
 Thu, 24 Sep 2020 05:14:23 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 33n9m82h75-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Sep 2020 05:14:23 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08O5ELXa28639680
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Sep 2020 05:14:21 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 663FD4C050;
 Thu, 24 Sep 2020 05:14:21 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9173A4C040;
 Thu, 24 Sep 2020 05:14:18 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.84.181.82])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 24 Sep 2020 05:14:18 +0000 (GMT)
Subject: [PATCH] rpadlpar_io:Add MODULE_DESCRIPTION entries to kernel modules
From: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 24 Sep 2020 10:44:16 +0530
Message-ID: <20200924051343.16052.9571.stgit@localhost.localdomain>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-24_01:2020-09-24,
 2020-09-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1011 impostorscore=0 bulkscore=0
 spamscore=0 malwarescore=0 suspectscore=1 phishscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009240036
X-Mailman-Approved-At: Thu, 24 Sep 2020 15:44:55 +1000
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
Cc: bhelgaas@google.com, tyreld@linux.ibm.com, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch adds a brief MODULE_DESCRIPTION to rpadlpar_io kernel modules
(descriptions taken from Kconfig file)

Signed-off-by: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
---
 drivers/pci/hotplug/rpadlpar_core.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/hotplug/rpadlpar_core.c b/drivers/pci/hotplug/rpadlpar_core.c
index f979b70..bac65ed 100644
--- a/drivers/pci/hotplug/rpadlpar_core.c
+++ b/drivers/pci/hotplug/rpadlpar_core.c
@@ -478,3 +478,4 @@ static void __exit rpadlpar_io_exit(void)
 module_init(rpadlpar_io_init);
 module_exit(rpadlpar_io_exit);
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("RPA Dynamic Logical Partitioning driver for I/O slots");

