Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CCE8FA1D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 06:59:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468rh05FbrzDqv9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 14:58:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sbobroff@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468rRw2gnyzDrCT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 14:48:27 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7G4lYQl134467
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 00:48:24 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2udngbrfyv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 00:48:24 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Fri, 16 Aug 2019 05:48:22 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 16 Aug 2019 05:48:21 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7G4mKJ431391916
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Aug 2019 04:48:20 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72C5B4C04A;
 Fri, 16 Aug 2019 04:48:20 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22BC84C040;
 Fri, 16 Aug 2019 04:48:20 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 16 Aug 2019 04:48:20 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 5F2F0A03DC;
 Fri, 16 Aug 2019 14:48:16 +1000 (AEST)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 12/12] powerpc/eeh: Slightly simplify eeh_add_to_parent_pe()
Date: Fri, 16 Aug 2019 14:48:16 +1000
X-Mailer: git-send-email 2.22.0.216.g00a2a96fc9
In-Reply-To: <cover.1565930772.git.sbobroff@linux.ibm.com>
References: <cover.1565930772.git.sbobroff@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19081604-4275-0000-0000-00000359A36B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19081604-4276-0000-0000-0000386BBA8A
Message-Id: <09259a50308f10aa764695912bc87dc1d1cf654c.1565930772.git.sbobroff@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-16_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908160051
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
Cc: aik@ozlabs.ru, oohall@gmail.com, tyreld@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Simplify some needlessly complicated boolean logic in
eeh_add_to_parent_pe().

Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
---
v5 * New in this version.

 arch/powerpc/kernel/eeh_pe.c | 52 +++++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index 9c38fa7c33aa..1a6254bcf056 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -383,32 +383,34 @@ int eeh_add_to_parent_pe(struct eeh_dev *edev)
 	 * components.
 	 */
 	pe = eeh_pe_get(pdn->phb, edev->pe_config_addr, config_addr);
-	if (pe && !(pe->type & EEH_PE_INVALID)) {
-		/* Mark the PE as type of PCI bus */
-		pe->type = EEH_PE_BUS;
-		edev->pe = pe;
-
-		/* Put the edev to PE */
-		list_add_tail(&edev->entry, &pe->edevs);
-		eeh_edev_dbg(edev, "Added to bus PE\n");
-		return 0;
-	} else if (pe && (pe->type & EEH_PE_INVALID)) {
-		list_add_tail(&edev->entry, &pe->edevs);
-		edev->pe = pe;
-		/*
-		 * We're running to here because of PCI hotplug caused by
-		 * EEH recovery. We need clear EEH_PE_INVALID until the top.
-		 */
-		parent = pe;
-		while (parent) {
-			if (!(parent->type & EEH_PE_INVALID))
-				break;
-			parent->type &= ~EEH_PE_INVALID;
-			parent = parent->parent;
-		}
+	if (pe) {
+		if (pe->type & EEH_PE_INVALID) {
+			list_add_tail(&edev->entry, &pe->edevs);
+			edev->pe = pe;
+			/*
+			 * We're running to here because of PCI hotplug caused by
+			 * EEH recovery. We need clear EEH_PE_INVALID until the top.
+			 */
+			parent = pe;
+			while (parent) {
+				if (!(parent->type & EEH_PE_INVALID))
+					break;
+				parent->type &= ~EEH_PE_INVALID;
+				parent = parent->parent;
+			}
 
-		eeh_edev_dbg(edev, "Added to device PE (parent: PE#%x)\n",
-			     pe->parent->addr);
+			eeh_edev_dbg(edev,
+				     "Added to device PE (parent: PE#%x)\n",
+				     pe->parent->addr);
+		} else {
+			/* Mark the PE as type of PCI bus */
+			pe->type = EEH_PE_BUS;
+			edev->pe = pe;
+
+			/* Put the edev to PE */
+			list_add_tail(&edev->entry, &pe->edevs);
+			eeh_edev_dbg(edev, "Added to bus PE\n");
+		}
 		return 0;
 	}
 
-- 
2.22.0.216.g00a2a96fc9

