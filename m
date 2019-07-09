Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F25CF63462
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 12:34:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jdws10syzDqDs
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 20:34:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bharata@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jdl93cYczDqQV
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 20:26:13 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x69AMZiv011919
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 9 Jul 2019 06:26:10 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tmpfmpkcd-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Jul 2019 06:26:10 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Tue, 9 Jul 2019 11:26:08 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 9 Jul 2019 11:26:05 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x69AQ4Hu43516100
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Jul 2019 10:26:04 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 557F9AE051;
 Tue,  9 Jul 2019 10:26:04 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F72AAE04D;
 Tue,  9 Jul 2019 10:26:02 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.85.81.51])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  9 Jul 2019 10:26:02 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 4/7] kvmppc: Handle memory plug/unplug to secure VM
Date: Tue,  9 Jul 2019 15:55:42 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190709102545.9187-1-bharata@linux.ibm.com>
References: <20190709102545.9187-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19070910-0028-0000-0000-00000382428F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070910-0029-0000-0000-000024424E64
Message-Id: <20190709102545.9187-5-bharata@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-09_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=826 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907090127
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
Cc: linuxram@us.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org, jglisse@redhat.com,
 aneesh.kumar@linux.vnet.ibm.com, paulus@au1.ibm.com,
 sukadev@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Register the new memslot with UV during plug and unregister
the memslot during unplug.

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
Acked-by: Paul Mackerras <paulus@ozlabs.org>
---
 arch/powerpc/include/asm/ultravisor-api.h |  1 +
 arch/powerpc/include/asm/ultravisor.h     |  7 +++++++
 arch/powerpc/kvm/book3s_hv.c              | 19 +++++++++++++++++++
 3 files changed, 27 insertions(+)

diff --git a/arch/powerpc/include/asm/ultravisor-api.h b/arch/powerpc/include/asm/ultravisor-api.h
index 07b7d638e7af..d6d6eb2e6e6b 100644
--- a/arch/powerpc/include/asm/ultravisor-api.h
+++ b/arch/powerpc/include/asm/ultravisor-api.h
@@ -21,6 +21,7 @@
 #define UV_WRITE_PATE			0xF104
 #define UV_RETURN			0xF11C
 #define UV_REGISTER_MEM_SLOT		0xF120
+#define UV_UNREGISTER_MEM_SLOT		0xF124
 #define UV_PAGE_IN			0xF128
 #define UV_PAGE_OUT			0xF12C
 
diff --git a/arch/powerpc/include/asm/ultravisor.h b/arch/powerpc/include/asm/ultravisor.h
index b46042f1aa8f..fe45be9ee63b 100644
--- a/arch/powerpc/include/asm/ultravisor.h
+++ b/arch/powerpc/include/asm/ultravisor.h
@@ -70,6 +70,13 @@ static inline int uv_register_mem_slot(u64 lpid, u64 start_gpa, u64 size,
 	return ucall(UV_REGISTER_MEM_SLOT, retbuf, lpid, start_gpa,
 		     size, flags, slotid);
 }
+
+static inline int uv_unregister_mem_slot(u64 lpid, u64 slotid)
+{
+	unsigned long retbuf[UCALL_BUFSIZE];
+
+	return ucall(UV_UNREGISTER_MEM_SLOT, retbuf, lpid, slotid);
+}
 #endif /* !__ASSEMBLY__ */
 
 #endif	/* _ASM_POWERPC_ULTRAVISOR_H */
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index b8f801d00ad4..7cbb5edaed01 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -77,6 +77,7 @@
 #include <asm/hw_breakpoint.h>
 #include <asm/kvm_host.h>
 #include <asm/kvm_book3s_hmm.h>
+#include <asm/ultravisor.h>
 
 #include "book3s.h"
 
@@ -4504,6 +4505,24 @@ static void kvmppc_core_commit_memory_region_hv(struct kvm *kvm,
 	if (change == KVM_MR_FLAGS_ONLY && kvm_is_radix(kvm) &&
 	    ((new->flags ^ old->flags) & KVM_MEM_LOG_DIRTY_PAGES))
 		kvmppc_radix_flush_memslot(kvm, old);
+	/*
+	 * If UV hasn't yet called H_SVM_INIT_START, don't register memslots.
+	 */
+	if (!kvm->arch.secure_guest)
+		return;
+
+	/*
+	 * TODO: Handle KVM_MR_MOVE
+	 */
+	if (change == KVM_MR_CREATE) {
+		uv_register_mem_slot(kvm->arch.lpid,
+					   new->base_gfn << PAGE_SHIFT,
+					   new->npages * PAGE_SIZE,
+					   0,
+					   new->id);
+	} else if (change == KVM_MR_DELETE) {
+		uv_unregister_mem_slot(kvm->arch.lpid, old->id);
+	}
 }
 
 /*
-- 
2.21.0

