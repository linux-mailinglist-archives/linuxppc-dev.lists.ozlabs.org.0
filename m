Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA56ADC6A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2019 17:47:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Rsxg2XWfzDqQX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 01:47:51 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Rsvl1hk7zDqNJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 01:46:10 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x89FgPOI037196
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 9 Sep 2019 11:46:08 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uwr2mw24p-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Sep 2019 11:46:07 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Mon, 9 Sep 2019 16:46:04 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 9 Sep 2019 16:46:03 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x89Fk1bA44564864
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Sep 2019 15:46:01 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86D164203F;
 Mon,  9 Sep 2019 15:46:01 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B1FD42049;
 Mon,  9 Sep 2019 15:46:01 +0000 (GMT)
Received: from pic2.home (unknown [9.145.178.189])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  9 Sep 2019 15:46:01 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, andrew.donnellan@au1.ibm.com,
 clombard@linux.ibm.com
Subject: [PATCH 01/11] powerpc/powernv/ioda: Fix ref count for devices with
 their own PE
Date: Mon,  9 Sep 2019 17:45:50 +0200
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190909154600.19917-1-fbarrat@linux.ibm.com>
References: <20190909154600.19917-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19090915-0012-0000-0000-00000348DAAB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19090915-0013-0000-0000-000021833B91
Message-Id: <20190909154600.19917-2-fbarrat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-09_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=672 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909090158
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
Cc: groug@kaod.org, alastair@au1.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Taking a reference on the pci_dev structure was required with initial
commit 184cd4a3b962 ("powerpc/powernv: PCI support for p7IOC under
OPAL v2"), where we were storing the pci_dev in the pci_dn structure.

However, the pci_dev was later removed from the pci_dn structure, but
the reference was kept. See commit 902bdc57451c ("powerpc/powernv/idoa:
Remove unnecessary pcidev from pci_dn").

The pnv_ioda_pe structure life cycle is the same as the pci_dev
structure, the PE is freed when the device is released. So we don't
need a reference for the pci_dev stored in the PE, otherwise the
pci_dev will never be released. Which is not really a surprise as the
comment (removed here as no longer needed) was stating as much.

Fixes: 902bdc57451c ("powerpc/powernv/idoa: Remove unnecessary pcidev from pci_dn")
Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index d8080558d020..92767f006f20 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1062,14 +1062,6 @@ static struct pnv_ioda_pe *pnv_ioda_setup_dev_PE(struct pci_dev *dev)
 		return NULL;
 	}
 
-	/* NOTE: We get only one ref to the pci_dev for the pdn, not for the
-	 * pointer in the PE data structure, both should be destroyed at the
-	 * same time. However, this needs to be looked at more closely again
-	 * once we actually start removing things (Hotplug, SR-IOV, ...)
-	 *
-	 * At some point we want to remove the PDN completely anyways
-	 */
-	pci_dev_get(dev);
 	pdn->pe_number = pe->pe_number;
 	pe->flags = PNV_IODA_PE_DEV;
 	pe->pdev = dev;
@@ -1084,7 +1076,6 @@ static struct pnv_ioda_pe *pnv_ioda_setup_dev_PE(struct pci_dev *dev)
 		pnv_ioda_free_pe(pe);
 		pdn->pe_number = IODA_INVALID_PE;
 		pe->pdev = NULL;
-		pci_dev_put(dev);
 		return NULL;
 	}
 
@@ -1228,7 +1219,7 @@ static struct pnv_ioda_pe *pnv_ioda_setup_npu_PE(struct pci_dev *npu_pdev)
 			 */
 			dev_info(&npu_pdev->dev,
 				"Associating to existing PE %x\n", pe_num);
-			pci_dev_get(npu_pdev);
+			pci_dev_get(npu_pdev); // still needed after 902bdc57451c ?
 			npu_pdn = pci_get_pdn(npu_pdev);
 			rid = npu_pdev->bus->number << 8 | npu_pdn->devfn;
 			npu_pdn->pe_number = pe_num;
-- 
2.21.0

