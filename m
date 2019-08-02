Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A5D7ECBD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 08:36:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460HWF1TpPzDqsr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 16:36:41 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 460HQx63yfzDqnr
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 16:32:57 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x726Mfq5098844
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 2 Aug 2019 02:32:54 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2u4fjq8xqc-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 02:32:54 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Fri, 2 Aug 2019 07:32:53 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 2 Aug 2019 07:32:50 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x726WWY836504004
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 2 Aug 2019 06:32:32 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDDC8AE074
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 06:32:48 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95643AE07B
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 06:32:48 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 06:32:48 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9253FA0331
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 16:32:47 +1000 (AEST)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] powerpc/eeh: Slightly simplify eeh_add_to_parent_pe()
Date: Fri,  2 Aug 2019 16:32:45 +1000
X-Mailer: git-send-email 2.22.0.216.g00a2a96fc9
In-Reply-To: <cover.1564727543.git.sbobroff@linux.ibm.com>
References: <cover.1564727543.git.sbobroff@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19080206-0008-0000-0000-000003039E72
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19080206-0009-0000-0000-00002272A405
Message-Id: <37644512a88ab86754f00962576c9356c74f42e2.1564727543.git.sbobroff@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-02_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908020067
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Simplify some needlessly complicated boolean logic in
eeh_add_to_parent_pe().

Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
---
 arch/powerpc/kernel/eeh_pe.c | 52 +++++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index 317a31624526..236e6a667114 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -390,32 +390,34 @@ int eeh_add_to_parent_pe(struct eeh_dev *edev)
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

