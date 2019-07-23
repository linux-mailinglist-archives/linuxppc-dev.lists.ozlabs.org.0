Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DD41871036
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2019 05:46:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45t4CD1VPyzDqWX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2019 13:46:16 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45t49B4bSzzDqM7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2019 13:44:30 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6N3hqnB061794
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2019 23:44:27 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2twr9j4cbj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2019 23:44:27 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Tue, 23 Jul 2019 04:44:25 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 23 Jul 2019 04:44:22 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6N3iMwY40763568
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Jul 2019 03:44:22 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2B9C42045;
 Tue, 23 Jul 2019 03:44:21 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F74842041;
 Tue, 23 Jul 2019 03:44:21 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 23 Jul 2019 03:44:21 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 734D2A038B;
 Tue, 23 Jul 2019 13:44:20 +1000 (AEST)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 4/9] powerpc/eeh: Initialize EEH address cache earlier
Date: Tue, 23 Jul 2019 13:44:15 +1000
X-Mailer: git-send-email 2.22.0.216.g00a2a96fc9
In-Reply-To: <cover.1563853440.git.sbobroff@linux.ibm.com>
References: <cover.1563853440.git.sbobroff@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19072303-0020-0000-0000-000003564B26
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19072303-0021-0000-0000-000021AA337E
Message-Id: <0effe37ceb2dfcb37b83ff34a6158ec8cdf381a6.1563853440.git.sbobroff@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-23_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=29 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907230030
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

The EEH address cache is currently initialized and populated by a
single function: eeh_addr_cache_build().  While the initial population
of the cache can only be done once resources are allocated,
initialization (just setting up a spinlock) could be done much
earlier.

So move the initialization step into a separate function and call it
from a core_initcall (rather than a subsys initcall).

This will allow future work to make use of the cache during boot time
PCI scanning.

Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/include/asm/eeh.h  |  3 +++
 arch/powerpc/kernel/eeh.c       |  2 ++
 arch/powerpc/kernel/eeh_cache.c | 13 +++++++++++--
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 45c9b26e3cce..20105964287a 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -275,6 +275,7 @@ int __init eeh_ops_register(struct eeh_ops *ops);
 int __exit eeh_ops_unregister(const char *name);
 int eeh_check_failure(const volatile void __iomem *token);
 int eeh_dev_check_failure(struct eeh_dev *edev);
+void eeh_addr_cache_init(void);
 void eeh_addr_cache_build(void);
 void eeh_add_device_early(struct pci_dn *);
 void eeh_add_device_tree_early(struct pci_dn *);
@@ -335,6 +336,8 @@ static inline int eeh_check_failure(const volatile void __iomem *token)
 
 #define eeh_dev_check_failure(x) (0)
 
+static inline void eeh_addr_cache_init(void) { }
+
 static inline void eeh_addr_cache_build(void) { }
 
 static inline void eeh_add_device_early(struct pci_dn *pdn) { }
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 846cc697030c..ca8b0c58a6a7 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1200,6 +1200,8 @@ static int eeh_init(void)
 	list_for_each_entry_safe(hose, tmp, &hose_list, list_node)
 		eeh_dev_phb_init_dynamic(hose);
 
+	eeh_addr_cache_init();
+
 	/* Initialize EEH event */
 	return eeh_event_init();
 }
diff --git a/arch/powerpc/kernel/eeh_cache.c b/arch/powerpc/kernel/eeh_cache.c
index 320472373122..a790fa49c62d 100644
--- a/arch/powerpc/kernel/eeh_cache.c
+++ b/arch/powerpc/kernel/eeh_cache.c
@@ -254,6 +254,17 @@ void eeh_addr_cache_rmv_dev(struct pci_dev *dev)
 	spin_unlock_irqrestore(&pci_io_addr_cache_root.piar_lock, flags);
 }
 
+/**
+ * eeh_addr_cache_init - Initialize a cache of I/O addresses
+ *
+ * Initialize a cache of pci i/o addresses.  This cache will be used to
+ * find the pci device that corresponds to a given address.
+ */
+void eeh_addr_cache_init(void)
+{
+	spin_lock_init(&pci_io_addr_cache_root.piar_lock);
+}
+
 /**
  * eeh_addr_cache_build - Build a cache of I/O addresses
  *
@@ -269,8 +280,6 @@ void eeh_addr_cache_build(void)
 	struct eeh_dev *edev;
 	struct pci_dev *dev = NULL;
 
-	spin_lock_init(&pci_io_addr_cache_root.piar_lock);
-
 	for_each_pci_dev(dev) {
 		pdn = pci_get_pdn_by_devfn(dev->bus, dev->devfn);
 		if (!pdn)
-- 
2.22.0.216.g00a2a96fc9

