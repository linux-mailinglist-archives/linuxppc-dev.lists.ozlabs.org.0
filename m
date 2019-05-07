Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A1F15890
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 06:32:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44ymtb0xdyzDqNP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 14:32:55 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ymqY3x20zDqBt
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2019 14:30:16 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x474MHP8052875
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 May 2019 00:30:14 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sb2179w3t-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 May 2019 00:30:14 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Tue, 7 May 2019 05:30:12 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 7 May 2019 05:30:09 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x474U8VD55246950
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 May 2019 04:30:08 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 730E911C05E;
 Tue,  7 May 2019 04:30:08 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D85011C066;
 Tue,  7 May 2019 04:30:08 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 May 2019 04:30:08 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C0BD3A03B2;
 Tue,  7 May 2019 14:30:06 +1000 (AEST)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 4/6] powerpc/eeh: Initialize EEH address cache earlier
Date: Tue,  7 May 2019 14:30:04 +1000
X-Mailer: git-send-email 2.19.0.2.gcad72f5712
In-Reply-To: <cover.1557203383.git.sbobroff@linux.ibm.com>
References: <cover.1557203383.git.sbobroff@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19050704-4275-0000-0000-000003321AC6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050704-4276-0000-0000-0000384183E3
Message-Id: <a9e0833d421e0673633efdc2bbd0babbc1cb1f40.1557203383.git.sbobroff@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-07_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=29 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905070028
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
index 3613a56281f2..12baf1df134c 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -288,6 +288,7 @@ int __init eeh_ops_register(struct eeh_ops *ops);
 int __exit eeh_ops_unregister(const char *name);
 int eeh_check_failure(const volatile void __iomem *token);
 int eeh_dev_check_failure(struct eeh_dev *edev);
+void eeh_addr_cache_init(void);
 void eeh_addr_cache_build(void);
 void eeh_add_device_early(struct pci_dn *);
 void eeh_add_device_tree_early(struct pci_dn *);
@@ -348,6 +349,8 @@ static inline int eeh_check_failure(const volatile void __iomem *token)
 
 #define eeh_dev_check_failure(x) (0)
 
+static inline void eeh_addr_cache_init(void) { }
+
 static inline void eeh_addr_cache_build(void) { }
 
 static inline void eeh_add_device_early(struct pci_dn *pdn) { }
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index b14d89547895..4160514d997c 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1213,6 +1213,8 @@ static int eeh_init(void)
 	list_for_each_entry_safe(hose, tmp, &hose_list, list_node)
 		eeh_dev_phb_init_dynamic(hose);
 
+	eeh_addr_cache_init();
+
 	/* Initialize EEH event */
 	return eeh_event_init();
 }
diff --git a/arch/powerpc/kernel/eeh_cache.c b/arch/powerpc/kernel/eeh_cache.c
index 9c68f0837385..f93dd5cf6a39 100644
--- a/arch/powerpc/kernel/eeh_cache.c
+++ b/arch/powerpc/kernel/eeh_cache.c
@@ -267,6 +267,17 @@ void eeh_addr_cache_rmv_dev(struct pci_dev *dev)
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
@@ -282,8 +293,6 @@ void eeh_addr_cache_build(void)
 	struct eeh_dev *edev;
 	struct pci_dev *dev = NULL;
 
-	spin_lock_init(&pci_io_addr_cache_root.piar_lock);
-
 	for_each_pci_dev(dev) {
 		pdn = pci_get_pdn_by_devfn(dev->bus, dev->devfn);
 		if (!pdn)
-- 
2.19.0.2.gcad72f5712

