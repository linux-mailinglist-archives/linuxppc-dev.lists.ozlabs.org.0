Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E94AB105403
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 15:11:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JhMH2HPjzDr87
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 01:11:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Jgt30dnKzDr6D
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 00:50:02 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xALDlsiO038345
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 08:49:59 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wdqmh1ap0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 08:49:59 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Thu, 21 Nov 2019 13:49:57 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 21 Nov 2019 13:49:54 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xALDnrF363832074
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Nov 2019 13:49:53 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDFCB52059;
 Thu, 21 Nov 2019 13:49:52 +0000 (GMT)
Received: from bali.tlslab.ibm.com (unknown [9.101.4.17])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9D9575204F;
 Thu, 21 Nov 2019 13:49:52 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, andrew.donnellan@au1.ibm.com,
 clombard@linux.ibm.com
Subject: [PATCH v2 08/11] pci/hotplug/pnv-php: Register opencapi slots
Date: Thu, 21 Nov 2019 14:49:15 +0100
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191121134918.7155-1-fbarrat@linux.ibm.com>
References: <20191121134918.7155-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19112113-0020-0000-0000-0000038CE3BC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19112113-0021-0000-0000-000021E31DFD
Message-Id: <20191121134918.7155-9-fbarrat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-21_03:2019-11-21,2019-11-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 suspectscore=0 impostorscore=0 mlxscore=0 clxscore=1015 spamscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911210125
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, groug@kaod.org,
 alastair@au1.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add the opencapi PHBs to the list of PHBs being scanned to look for
slots.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
Changelog:
v2:
 - fix unregistration (Andrew)


 drivers/pci/hotplug/pnv_php.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
index c5f88e937fd5..0cb6a4897905 100644
--- a/drivers/pci/hotplug/pnv_php.c
+++ b/drivers/pci/hotplug/pnv_php.c
@@ -1009,6 +1009,8 @@ static int __init pnv_php_init(void)
 	for_each_compatible_node(dn, NULL, "ibm,ioda3-phb")
 		pnv_php_register(dn);
 
+	for_each_compatible_node(dn, NULL, "ibm,ioda2-npu2-opencapi-phb")
+		pnv_php_register_one(dn); /* slot directly under the PHB */
 	return 0;
 }
 
@@ -1021,6 +1023,9 @@ static void __exit pnv_php_exit(void)
 
 	for_each_compatible_node(dn, NULL, "ibm,ioda3-phb")
 		pnv_php_unregister(dn);
+
+	for_each_compatible_node(dn, NULL, "ibm,ioda2-npu2-opencapi-phb")
+		pnv_php_unregister_one(dn); /* slot directly under the PHB */
 }
 
 module_init(pnv_php_init);
-- 
2.21.0

