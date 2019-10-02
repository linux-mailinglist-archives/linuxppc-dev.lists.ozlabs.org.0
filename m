Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF44CC47BE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 08:24:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jmMQ4cfTzDqD2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 16:24:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=sbobroff@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jltK6VkbzDqPm
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2019 16:03:05 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9262Vj1114533
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 2 Oct 2019 02:03:01 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vc71r1g0h-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Oct 2019 02:03:00 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Wed, 2 Oct 2019 07:02:58 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 2 Oct 2019 07:02:56 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9262t8V13238296
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Oct 2019 06:02:55 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7AAB52051;
 Wed,  2 Oct 2019 06:02:55 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 094115205A;
 Wed,  2 Oct 2019 06:02:55 +0000 (GMT)
Received: from osmium.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6DB8EA026B;
 Wed,  2 Oct 2019 16:02:53 +1000 (AEST)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH RFC 02/15] powerpc/eeh: Rename eeh_pe_get() to eeh_pe_find()
Date: Wed,  2 Oct 2019 16:02:40 +1000
X-Mailer: git-send-email 2.22.0.216.g00a2a96fc9
In-Reply-To: <cover.1569996166.git.sbobroff@linux.ibm.com>
References: <cover.1569996166.git.sbobroff@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19100206-0008-0000-0000-0000031D362E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100206-0009-0000-0000-00004A3C37D5
Message-Id: <cf8b653e81c2a8a75dc37637ac853b92c724a3ae.1569996166.git.sbobroff@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-02_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=852 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910020057
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
Cc: oohall@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are now functions eeh_get_pe() and eeh_pe_get() which seems
likely to cause confusion.

Keep eeh_get_pe() because "get" is commonly used to refer to acquiring
a reference (which it does), and rename eeh_pe_get() to eeh_pe_find()
because it performs a search.

Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
---
 arch/powerpc/include/asm/eeh.h               |  2 +-
 arch/powerpc/kernel/eeh.c                    |  2 +-
 arch/powerpc/kernel/eeh_pe.c                 | 12 ++++++------
 arch/powerpc/platforms/powernv/eeh-powernv.c |  4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 54ba958760f2..e6f461d07426 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -288,7 +288,7 @@ int eeh_phb_pe_create(struct pci_controller *phb);
 int eeh_wait_state(struct eeh_pe *pe, int max_wait);
 struct eeh_pe *eeh_phb_pe_get(struct pci_controller *phb);
 struct eeh_pe *eeh_pe_next(struct eeh_pe *pe, struct eeh_pe *root);
-struct eeh_pe *eeh_pe_get(struct pci_controller *phb,
+struct eeh_pe *eeh_pe_find(struct pci_controller *phb,
 			  int pe_no, int config_addr);
 int eeh_add_to_parent_pe(struct eeh_dev *edev);
 int eeh_rmv_from_parent_pe(struct eeh_dev *edev);
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index d613e7ea7794..7e36ad0cfa2b 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1940,7 +1940,7 @@ static ssize_t eeh_force_recover_write(struct file *filp,
 		return -ENODEV;
 
 	/* Retrieve PE */
-	pe = eeh_pe_get(hose, pe_no, 0);
+	pe = eeh_pe_find(hose, pe_no, 0);
 	if (!pe)
 		return -ENODEV;
 
diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index d455df7b4928..fda52d1989c3 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -315,7 +315,7 @@ void eeh_pe_dev_traverse(struct eeh_pe *root,
 }
 
 /**
- * __eeh_pe_get - Check the PE address
+ * __eeh_pe_find - Check the PE address
  * @data: EEH PE
  * @flag: EEH device
  *
@@ -329,7 +329,7 @@ struct eeh_pe_get_flag {
 	int config_addr;
 };
 
-static void *__eeh_pe_get(struct eeh_pe *pe, void *flag)
+static void *__eeh_pe_find(struct eeh_pe *pe, void *flag)
 {
 	struct eeh_pe_get_flag *tmp = (struct eeh_pe_get_flag *) flag;
 
@@ -371,14 +371,14 @@ static void *__eeh_pe_get(struct eeh_pe *pe, void *flag)
  * which is composed of PCI bus/device/function number, or unified
  * PE address.
  */
-struct eeh_pe *eeh_pe_get(struct pci_controller *phb,
-		int pe_no, int config_addr)
+struct eeh_pe *eeh_pe_find(struct pci_controller *phb,
+			   int pe_no, int config_addr)
 {
 	struct eeh_pe *root = eeh_phb_pe_get(phb);
 	struct eeh_pe_get_flag tmp = { pe_no, config_addr };
 	struct eeh_pe *pe;
 
-	pe = eeh_pe_traverse(root, __eeh_pe_get, &tmp);
+	pe = eeh_pe_traverse(root, __eeh_pe_find, &tmp);
 
 	return pe;
 }
@@ -447,7 +447,7 @@ int eeh_add_to_parent_pe(struct eeh_dev *edev)
 	 * PE should be composed of PCI bus and its subordinate
 	 * components.
 	 */
-	pe = eeh_pe_get(pdn->phb, edev->pe_config_addr, config_addr);
+	pe = eeh_pe_find(pdn->phb, edev->pe_config_addr, config_addr);
 	if (pe) {
 		if (pe->type & EEH_PE_INVALID) {
 			list_add_tail(&edev->entry, &pe->edevs);
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 25d1712b519d..e477e0b70968 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -142,7 +142,7 @@ static ssize_t pnv_eeh_ei_write(struct file *filp,
 		return -EINVAL;
 
 	/* Retrieve PE */
-	pe = eeh_pe_get(hose, pe_no, 0);
+	pe = eeh_pe_find(hose, pe_no, 0);
 	if (!pe)
 		return -ENODEV;
 
@@ -1425,7 +1425,7 @@ static int pnv_eeh_get_pe(struct pci_controller *hose,
 	}
 
 	/* Find the PE according to PE# */
-	dev_pe = eeh_pe_get(hose, pe_no, 0);
+	dev_pe = eeh_pe_find(hose, pe_no, 0);
 	if (!dev_pe)
 		return -EEXIST;
 
-- 
2.22.0.216.g00a2a96fc9

