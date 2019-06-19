Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6939D4BAD0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 16:09:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TRfG5zWxzDqtS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 00:09:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=fbarrat@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TQlG1P1vzDqpr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 23:28:57 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5JDJHZ3023074
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 09:28:53 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t7m46pct6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 09:28:52 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Wed, 19 Jun 2019 14:28:47 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 19 Jun 2019 14:28:45 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5JDShqd27852920
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 13:28:44 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD293A4040;
 Wed, 19 Jun 2019 13:28:43 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9186AA404D;
 Wed, 19 Jun 2019 13:28:43 +0000 (GMT)
Received: from pic2.home (unknown [9.145.171.67])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 19 Jun 2019 13:28:43 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, andrew.donnellan@au1.ibm.com,
 clombard@linux.ibm.com
Subject: [RFC 07/11] pci/hotplug/pnv-php: Improve error msg on power state
 change failure
Date: Wed, 19 Jun 2019 15:28:36 +0200
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190619132840.27634-1-fbarrat@linux.ibm.com>
References: <20190619132840.27634-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19061913-0016-0000-0000-0000028A7855
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061913-0017-0000-0000-000032E7CF76
Message-Id: <20190619132840.27634-8-fbarrat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=797 adultscore=0 classifier=spam adjust=0 reason=mlx
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

When changing the slot state, if opal hits an error and tells as such
in the asynchronous reply, the warning "Wrong msg" is logged, which is
rather confusing. Instead we can reuse the better message which is
already used when we couldn't submit the asynchronous opal request
initially.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 drivers/pci/hotplug/pnv_php.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
index 5b5cbf1e636d..5cdd2a3a4dd9 100644
--- a/drivers/pci/hotplug/pnv_php.c
+++ b/drivers/pci/hotplug/pnv_php.c
@@ -336,18 +336,19 @@ int pnv_php_set_slot_power_state(struct hotplug_slot *slot,
 	ret = pnv_pci_set_power_state(php_slot->id, state, &msg);
 	if (ret > 0) {
 		if (be64_to_cpu(msg.params[1]) != php_slot->dn->phandle	||
-		    be64_to_cpu(msg.params[2]) != state			||
-		    be64_to_cpu(msg.params[3]) != OPAL_SUCCESS) {
+		    be64_to_cpu(msg.params[2]) != state) {
 			pci_warn(php_slot->pdev, "Wrong msg (%lld, %lld, %lld)\n",
 				 be64_to_cpu(msg.params[1]),
 				 be64_to_cpu(msg.params[2]),
 				 be64_to_cpu(msg.params[3]));
 			return -ENOMSG;
 		}
+		if (be64_to_cpu(msg.params[3]) != OPAL_SUCCESS) {
+			ret = -ENODEV;
+			goto error;
+		}
 	} else if (ret < 0) {
-		pci_warn(php_slot->pdev, "Error %d powering %s\n",
-			 ret, (state == OPAL_PCI_SLOT_POWER_ON) ? "on" : "off");
-		return ret;
+		goto error;
 	}
 
 	if (state == OPAL_PCI_SLOT_POWER_OFF || state == OPAL_PCI_SLOT_OFFLINE)
@@ -356,6 +357,11 @@ int pnv_php_set_slot_power_state(struct hotplug_slot *slot,
 		ret = pnv_php_add_devtree(php_slot);
 
 	return ret;
+
+error:
+	pci_warn(php_slot->pdev, "Error %d powering %s\n",
+		ret, (state == OPAL_PCI_SLOT_POWER_ON) ? "on" : "off");
+	return ret;
 }
 EXPORT_SYMBOL_GPL(pnv_php_set_slot_power_state);
 
-- 
2.21.0

