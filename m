Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 753A1AE5A4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 10:35:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SJHw5w5HzDqGM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 18:35:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bharata@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SJB31zPLzDqbl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 18:30:02 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8A8RHOi116141
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 04:30:00 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ux7yw8syv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 04:30:00 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Tue, 10 Sep 2019 09:29:58 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 10 Sep 2019 09:29:54 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8A8TrYX58916958
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Sep 2019 08:29:53 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E61765204F;
 Tue, 10 Sep 2019 08:29:52 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.199.35.217])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id A271052050;
 Tue, 10 Sep 2019 08:29:50 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 1/8] KVM: PPC: Book3S HV: Define usage types for rmap array
 in guest memslot
Date: Tue, 10 Sep 2019 13:59:39 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910082946.7849-1-bharata@linux.ibm.com>
References: <20190910082946.7849-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19091008-0012-0000-0000-0000034967DF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091008-0013-0000-0000-00002183CAE5
Message-Id: <20190910082946.7849-2-bharata@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-10_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909100085
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
 aneesh.kumar@linux.vnet.ibm.com,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>, paulus@au1.ibm.com,
 sukadev@linux.vnet.ibm.com, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Suraj Jitindar Singh <sjitindarsingh@gmail.com>

The rmap array in the guest memslot is an array of size number of guest
pages, allocated at memslot creation time. Each rmap entry in this array
is used to store information about the guest page to which it
corresponds. For example for a hpt guest it is used to store a lock bit,
rc bits, a present bit and the index of a hpt entry in the guest hpt
which maps this page. For a radix guest which is running nested guests
it is used to store a pointer to a linked list of nested rmap entries
which store the nested guest physical address which maps this guest
address and for which there is a pte in the shadow page table.

As there are currently two uses for the rmap array, and the potential
for this to expand to more in the future, define a type field (being the
top 8 bits of the rmap entry) to be used to define the type of the rmap
entry which is currently present and define two values for this field
for the two current uses of the rmap array.

Since the nested case uses the rmap entry to store a pointer, define
this type as having the two high bits set as is expected for a pointer.
Define the hpt entry type as having bit 56 set (bit 7 IBM bit ordering).

Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
		[Added rmap type KVMPPC_RMAP_UVMEM_PFN]
---
 arch/powerpc/include/asm/kvm_host.h | 28 ++++++++++++++++++++++++----
 arch/powerpc/kvm/book3s_hv_rm_mmu.c |  2 +-
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 4bb552d639b8..81cd221ccc04 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -232,11 +232,31 @@ struct revmap_entry {
 };
 
 /*
- * We use the top bit of each memslot->arch.rmap entry as a lock bit,
- * and bit 32 as a present flag.  The bottom 32 bits are the
- * index in the guest HPT of a HPTE that points to the page.
+ * The rmap array of size number of guest pages is allocated for each memslot.
+ * This array is used to store usage specific information about the guest page.
+ * Below are the encodings of the various possible usage types.
  */
-#define KVMPPC_RMAP_LOCK_BIT	63
+/* Free bits which can be used to define a new usage */
+#define KVMPPC_RMAP_TYPE_MASK	0xff00000000000000
+#define KVMPPC_RMAP_NESTED	0xc000000000000000	/* Nested rmap array */
+#define KVMPPC_RMAP_HPT		0x0100000000000000	/* HPT guest */
+#define KVMPPC_RMAP_UVMEM_PFN	0x0200000000000000	/* Secure GPA */
+
+static inline unsigned long kvmppc_rmap_type(unsigned long *rmap)
+{
+	return (*rmap & KVMPPC_RMAP_TYPE_MASK);
+}
+
+/*
+ * rmap usage definition for a hash page table (hpt) guest:
+ * 0x0000080000000000	Lock bit
+ * 0x0000018000000000	RC bits
+ * 0x0000000100000000	Present bit
+ * 0x00000000ffffffff	HPT index bits
+ * The bottom 32 bits are the index in the guest HPT of a HPTE that points to
+ * the page.
+ */
+#define KVMPPC_RMAP_LOCK_BIT	43
 #define KVMPPC_RMAP_RC_SHIFT	32
 #define KVMPPC_RMAP_REFERENCED	(HPTE_R_R << KVMPPC_RMAP_RC_SHIFT)
 #define KVMPPC_RMAP_PRESENT	0x100000000ul
diff --git a/arch/powerpc/kvm/book3s_hv_rm_mmu.c b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
index 63e0ce91e29d..7186c65c61c9 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
@@ -99,7 +99,7 @@ void kvmppc_add_revmap_chain(struct kvm *kvm, struct revmap_entry *rev,
 	} else {
 		rev->forw = rev->back = pte_index;
 		*rmap = (*rmap & ~KVMPPC_RMAP_INDEX) |
-			pte_index | KVMPPC_RMAP_PRESENT;
+			pte_index | KVMPPC_RMAP_PRESENT | KVMPPC_RMAP_HPT;
 	}
 	unlock_rmap(rmap);
 }
-- 
2.21.0

