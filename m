Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BF5147DC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 11:52:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yJ1T3xVfzDqQV
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 19:52:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yHrd53bJzDqJX
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2019 19:44:33 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x469hvD9056040
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 6 May 2019 05:44:30 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2saggdw0p6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 May 2019 05:44:30 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Mon, 6 May 2019 10:44:28 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 6 May 2019 10:44:27 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x469iPKC59572436
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 May 2019 09:44:25 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60DD14204C;
 Mon,  6 May 2019 09:44:25 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 042A742041;
 Mon,  6 May 2019 09:44:22 +0000 (GMT)
Received: from naverao1-tp.in.ibm.com (unknown [9.199.155.34])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 May 2019 09:44:21 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Nathan Lynch <nathanl@linux.ibm.com>, Mingming Cao <mingming.cao@ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: [RFC PATCH 5/6] powerpc/pseries: Introduce helpers to gatekeep DTLB
 usage
Date: Mon,  6 May 2019 15:13:48 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1557134488.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1557134488.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19050609-0012-0000-0000-00000318C175
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050609-0013-0000-0000-0000215139BB
Message-Id: <cdfe83f641894b1789c5899528e8f03893a0671c.1557134488.git.naveen.n.rao@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-06_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905060085
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since we would be introducing a new user of the DTL buffer in a
subsequent patch, add helpers to gatekeep use of the DTL buffer. The
current usage of the DTL buffer from debugfs is at a per-cpu level
(corresponding to the cpu debugfs file that is opened). Subsequently, we
will have users enabling/accessing DTLB for all online cpus. These
helpers allow any number of per-cpu users, or a single global user
exclusively.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/plpar_wrappers.h |  2 ++
 arch/powerpc/platforms/pseries/dtl.c      | 10 ++++++-
 arch/powerpc/platforms/pseries/lpar.c     | 36 +++++++++++++++++++++++
 3 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/plpar_wrappers.h b/arch/powerpc/include/asm/plpar_wrappers.h
index d08feb1bc2bd..ab7dd454b6eb 100644
--- a/arch/powerpc/include/asm/plpar_wrappers.h
+++ b/arch/powerpc/include/asm/plpar_wrappers.h
@@ -88,6 +88,8 @@ static inline long register_dtl(unsigned long cpu, unsigned long vpa)
 	return vpa_call(H_VPA_REG_DTL, cpu, vpa);
 }
 
+extern bool register_dtl_buffer_access(bool global);
+extern void unregister_dtl_buffer_access(bool global);
 extern void register_dtl_buffer(int cpu);
 extern void alloc_dtl_buffers(void);
 extern void vpa_init(int cpu);
diff --git a/arch/powerpc/platforms/pseries/dtl.c b/arch/powerpc/platforms/pseries/dtl.c
index fb05804adb2f..dd28296c9903 100644
--- a/arch/powerpc/platforms/pseries/dtl.c
+++ b/arch/powerpc/platforms/pseries/dtl.c
@@ -193,11 +193,15 @@ static int dtl_enable(struct dtl *dtl)
 	if (dtl->buf)
 		return -EBUSY;
 
+	if (register_dtl_buffer_access(false))
+		return -EBUSY;
+
 	n_entries = dtl_buf_entries;
 	buf = kmem_cache_alloc_node(dtl_cache, GFP_KERNEL, cpu_to_node(dtl->cpu));
 	if (!buf) {
 		printk(KERN_WARNING "%s: buffer alloc failed for cpu %d\n",
 				__func__, dtl->cpu);
+		unregister_dtl_buffer_access(false);
 		return -ENOMEM;
 	}
 
@@ -214,8 +218,11 @@ static int dtl_enable(struct dtl *dtl)
 	}
 	spin_unlock(&dtl->lock);
 
-	if (rc)
+	if (rc) {
+		unregister_dtl_buffer_access(false);
 		kmem_cache_free(dtl_cache, buf);
+	}
+
 	return rc;
 }
 
@@ -227,6 +234,7 @@ static void dtl_disable(struct dtl *dtl)
 	dtl->buf = NULL;
 	dtl->buf_entries = 0;
 	spin_unlock(&dtl->lock);
+	unregister_dtl_buffer_access(false);
 }
 
 /* file interface */
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 3375ca8cefb5..6af5a2a11deb 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -65,6 +65,42 @@ EXPORT_SYMBOL(plpar_hcall);
 EXPORT_SYMBOL(plpar_hcall9);
 EXPORT_SYMBOL(plpar_hcall_norets);
 
+static DEFINE_SPINLOCK(dtl_buffer_refctr_lock);
+static unsigned int dtl_buffer_global_refctr, dtl_buffer_percpu_refctr;
+
+bool register_dtl_buffer_access(bool global)
+{
+	int rc = 0;
+
+	spin_lock(&dtl_buffer_refctr_lock);
+
+	if ((global && (dtl_buffer_global_refctr || dtl_buffer_percpu_refctr))
+			|| (!global && dtl_buffer_global_refctr)) {
+		rc = -1;
+	} else {
+		if (global)
+			dtl_buffer_global_refctr++;
+		else
+			dtl_buffer_percpu_refctr++;
+	}
+
+	spin_unlock(&dtl_buffer_refctr_lock);
+
+	return rc;
+}
+
+void unregister_dtl_buffer_access(bool global)
+{
+	spin_lock(&dtl_buffer_refctr_lock);
+
+	if (global)
+		dtl_buffer_global_refctr--;
+	else
+		dtl_buffer_percpu_refctr--;
+
+	spin_unlock(&dtl_buffer_refctr_lock);
+}
+
 void alloc_dtl_buffers(void)
 {
 	int cpu;
-- 
2.21.0

