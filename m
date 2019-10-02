Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F17CC4795
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 08:15:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jm811FVnzDqVj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 16:14:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sbobroff@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jltK2FBXzDqQl
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2019 16:03:04 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9262Jpw069200
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 2 Oct 2019 02:03:03 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vckrcbrxf-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Oct 2019 02:03:03 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Wed, 2 Oct 2019 07:03:01 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 2 Oct 2019 07:02:58 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9262vnb30933132
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Oct 2019 06:02:57 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A37211C050;
 Wed,  2 Oct 2019 06:02:57 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C985A11C052;
 Wed,  2 Oct 2019 06:02:56 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  2 Oct 2019 06:02:56 +0000 (GMT)
Received: from osmium.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 884F9A03BB;
 Wed,  2 Oct 2019 16:02:53 +1000 (AEST)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH RFC 11/15] powerpc/eeh: Sync eeh_dev_check_failure()
Date: Wed,  2 Oct 2019 16:02:49 +1000
X-Mailer: git-send-email 2.22.0.216.g00a2a96fc9
In-Reply-To: <cover.1569996166.git.sbobroff@linux.ibm.com>
References: <cover.1569996166.git.sbobroff@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19100206-0016-0000-0000-000002B33A14
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100206-0017-0000-0000-000033143C85
Message-Id: <3120a1979b699600fce3c105b66c64559feb0ee9.1569996166.git.sbobroff@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-02_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
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

Synchronize access to eeh_pe.

Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
---
 arch/powerpc/kernel/eeh.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index eb37cb384ff4..171be70b34d8 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -447,7 +447,7 @@ static int eeh_phb_check_failure(struct eeh_pe *pe)
 int eeh_dev_check_failure(struct eeh_dev *edev)
 {
 	int ret;
-	unsigned long flags;
+	unsigned long flags, pe_flags;
 	struct device_node *dn;
 	struct pci_dev *dev;
 	struct eeh_pe *pe, *parent_pe;
@@ -464,7 +464,9 @@ int eeh_dev_check_failure(struct eeh_dev *edev)
 		return 0;
 	}
 	dev = eeh_dev_to_pci_dev(edev);
+	/* TODO: Unsafe until eeh_dev can be synchronized with eeh_pe. */
 	pe = eeh_dev_to_pe(edev);
+	eeh_get_pe(pe);
 
 	/* Access to IO BARs might get this far and still not want checking. */
 	if (!pe) {
@@ -475,6 +477,7 @@ int eeh_dev_check_failure(struct eeh_dev *edev)
 
 	if (!pe->addr && !pe->config_addr) {
 		eeh_stats.no_cfg_addr++;
+		eeh_put_pe(pe); /* Release ref */
 		return 0;
 	}
 
@@ -482,17 +485,21 @@ int eeh_dev_check_failure(struct eeh_dev *edev)
 	 * On PowerNV platform, we might already have fenced PHB
 	 * there and we need take care of that firstly.
 	 */
-	ret = eeh_phb_check_failure(pe);
-	if (ret > 0)
+	ret = eeh_phb_check_failure(pe); /* Acquire ref */
+	if (ret > 0) {
+		eeh_put_pe(pe); /* Release ref */
 		return ret;
+	}
 
 	/*
 	 * If the PE isn't owned by us, we shouldn't check the
 	 * state. Instead, let the owner handle it if the PE has
 	 * been frozen.
 	 */
-	if (eeh_pe_passed(pe))
+	if (eeh_pe_passed(pe)) {
+		eeh_put_pe(pe); /* Release ref */
 		return 0;
+	}
 
 	/* If we already have a pending isolation event for this
 	 * slot, we know it's bad already, we don't need to check.
@@ -548,7 +555,10 @@ int eeh_dev_check_failure(struct eeh_dev *edev)
 	 * put into frozen state as well. We should take care
 	 * that at first.
 	 */
+	eeh_lock_pes(&pe_flags);
 	parent_pe = pe->parent;
+	eeh_get_pe(parent_pe); /* Acquire ref */
+	eeh_unlock_pes(pe_flags);
 	while (parent_pe) {
 		/* Hit the ceiling ? */
 		if (parent_pe->type & EEH_PE_PHB)
@@ -557,15 +567,18 @@ int eeh_dev_check_failure(struct eeh_dev *edev)
 		/* Frozen parent PE ? */
 		ret = eeh_ops->get_state(parent_pe, NULL);
 		if (ret > 0 && !eeh_state_active(ret)) {
+			eeh_put_pe(pe); /* Release ref */
 			pe = parent_pe;
+			eeh_get_pe(pe); /* Acquire ref */
 			pr_err("EEH: Failure of PHB#%x-PE#%x will be handled at parent PHB#%x-PE#%x.\n",
 			       pe->phb->global_number, pe->addr,
 			       pe->phb->global_number, parent_pe->addr);
 		}
 
 		/* Next parent level */
-		parent_pe = parent_pe->parent;
+		eeh_pe_move_to_parent(&parent_pe);
 	}
+	eeh_put_pe(parent_pe); /* Release ref */
 
 	eeh_stats.slot_resets++;
 
@@ -582,11 +595,12 @@ int eeh_dev_check_failure(struct eeh_dev *edev)
 	 */
 	pr_debug("EEH: %s: Frozen PHB#%x-PE#%x detected\n",
 		__func__, pe->phb->global_number, pe->addr);
-	eeh_send_failure_event(pe);
+	eeh_send_failure_event(pe); /* Give ref */
 
 	return 1;
 
 dn_unlock:
+	eeh_put_pe(pe); /* Release ref */
 	eeh_serialize_unlock(flags);
 	return rc;
 }
-- 
2.22.0.216.g00a2a96fc9

