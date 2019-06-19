Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E68AA4BABA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 16:06:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TRZv35gpzDqcM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 00:06:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=fbarrat@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TQlG0CjlzDqpg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 23:28:57 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5JDHN8t001287
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 09:28:55 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t7n9rjk9m-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 09:28:55 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Wed, 19 Jun 2019 14:28:49 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 19 Jun 2019 14:28:47 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x5JDSjfs38863272
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 13:28:45 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74A5FA404D;
 Wed, 19 Jun 2019 13:28:45 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F4A6A4055;
 Wed, 19 Jun 2019 13:28:45 +0000 (GMT)
Received: from pic2.home (unknown [9.145.171.67])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 19 Jun 2019 13:28:45 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, andrew.donnellan@au1.ibm.com,
 clombard@linux.ibm.com
Subject: [RFC 11/11] ocxl: Add PCI hotplug dependency to Kconfig
Date: Wed, 19 Jun 2019 15:28:40 +0200
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190619132840.27634-1-fbarrat@linux.ibm.com>
References: <20190619132840.27634-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19061913-0020-0000-0000-0000034B7C57
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061913-0021-0000-0000-0000219ED044
Message-Id: <20190619132840.27634-12-fbarrat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=617 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906190109
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
Cc: aik@ozlabs.ru, arbab@linux.ibm.com, oohall@gmail.com, groug@kaod.org,
 alastair@au1.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The PCI hotplug framework is used to update the devices when a new
image is written to the FPGA.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 drivers/misc/ocxl/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/ocxl/Kconfig b/drivers/misc/ocxl/Kconfig
index 7fb6d39d4c5a..13a5d9f30369 100644
--- a/drivers/misc/ocxl/Kconfig
+++ b/drivers/misc/ocxl/Kconfig
@@ -12,6 +12,7 @@ config OCXL
 	tristate "OpenCAPI coherent accelerator support"
 	depends on PPC_POWERNV && PCI && EEH
 	select OCXL_BASE
+	select HOTPLUG_PCI_POWERNV
 	default m
 	help
 	  Select this option to enable the ocxl driver for Open
-- 
2.21.0

