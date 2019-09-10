Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EFEAE59A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 10:33:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SJG62GqxzDqbm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 18:33:34 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SJB20H6QzDqc1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 18:30:01 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8A8SVYJ104927
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 04:29:58 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ux87209ey-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 04:29:57 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Tue, 10 Sep 2019 09:29:55 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 10 Sep 2019 09:29:52 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8A8TosZ41091092
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Sep 2019 08:29:50 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6391E52051;
 Tue, 10 Sep 2019 08:29:50 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.199.35.217])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 5D5775204F;
 Tue, 10 Sep 2019 08:29:48 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 0/8] kvmppc: Driver to manage pages of secure guest
Date: Tue, 10 Sep 2019 13:59:38 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19091008-0016-0000-0000-000002A96838
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091008-0017-0000-0000-00003309ED99
Message-Id: <20190910082946.7849-1-bharata@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-10_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
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
 aneesh.kumar@linux.vnet.ibm.com, paulus@au1.ibm.com,
 sukadev@linux.vnet.ibm.com, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

A pseries guest can be run as a secure guest on Ultravisor-enabled
POWER platforms. On such platforms, this driver will be used to manage
the movement of guest pages between the normal memory managed by
hypervisor(HV) and secure memory managed by Ultravisor(UV).

Private ZONE_DEVICE memory equal to the amount of secure memory
available in the platform for running secure guests is created.
Whenever a page belonging to the guest becomes secure, a page from
this private device memory is used to represent and track that secure
page on the HV side. The movement of pages between normal and secure
memory is done via migrate_vma_pages(). The reverse movement is driven
via pagemap_ops.migrate_to_ram().

The page-in or page-out requests from UV will come to HV as hcalls and
HV will call back into UV via uvcalls to satisfy these page requests.

These patches are against hmm.git
(https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git/log/?h=hmm)

plus

Claudio Carvalho's base ultravisor enablement patches that are present
in Michael Ellerman's tree
(https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=topic/ppc-kvm)

These patches along with Claudio's above patches are required to
run secure pseries guests on KVM. This patchset is based on hmm.git
because hmm.git has migrate_vma cleanup and not-device memremap_pages
patchsets that are required by this patchset.

Changes in v8
=============
- s/kvmppc_devm/kvmppc_uvmem
- Carrying Suraj's patch that defines bit positions for different rmap
  functions from Paul's kvm-next branch. Added KVMPPC_RMAP_UVMEM_PFN
  to this patch.
- No need to use irqsave version of spinlock to protect pfn bitmap
- mmap_sem and srcu_lock reversal in page-in/page-out so that we
  have uniform locking semantics in page-in, page-out, fault and
  reset paths. This also matches with other usages of the same
  two locks in powerpc code.
- kvmppc_uvmem_free_memslot_pfns() needs kvm srcu read lock.
- Addressed all the review feedback from Christoph and Sukadev.
  - Dropped kvmppc_rmap_is_devm_pfn() and introduced kvmppc_rmap_type()
  - Bail out early if page-in request comes for an already paged-in page
  - kvmppc_uvmem_pfn_lock re-arrangement
  - Check for failure from gfn_to_memslot in kvmppc_h_svm_page_in
  - Consolidate migrate_vma setup and related code into two helpers
    kvmppc_svm_page_in/out.
  - Use NUMA_NO_NODE in memremap_pages() instead of -1
  - Removed externs in declarations
  - Ensure *rmap assignment gets cleared in the error case in
    kvmppc_uvmem_get_page()
- A few other code cleanups

v7: https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-August/195631.html

Anshuman Khandual (1):
  KVM: PPC: Ultravisor: Add PPC_UV config option

Bharata B Rao (6):
  kvmppc: Movement of pages between normal and secure memory
  kvmppc: Shared pages support for secure guests
  kvmppc: H_SVM_INIT_START and H_SVM_INIT_DONE hcalls
  kvmppc: Handle memory plug/unplug to secure VM
  kvmppc: Radix changes for secure guest
  kvmppc: Support reset of secure guest

Suraj Jitindar Singh (1):
  KVM: PPC: Book3S HV: Define usage types for rmap array in guest
    memslot

 Documentation/virt/kvm/api.txt              |  19 +
 arch/powerpc/Kconfig                        |  17 +
 arch/powerpc/include/asm/hvcall.h           |   9 +
 arch/powerpc/include/asm/kvm_book3s_uvmem.h |  48 ++
 arch/powerpc/include/asm/kvm_host.h         |  56 +-
 arch/powerpc/include/asm/kvm_ppc.h          |   2 +
 arch/powerpc/include/asm/ultravisor-api.h   |   6 +
 arch/powerpc/include/asm/ultravisor.h       |  36 ++
 arch/powerpc/kvm/Makefile                   |   3 +
 arch/powerpc/kvm/book3s_64_mmu_radix.c      |  22 +
 arch/powerpc/kvm/book3s_hv.c                | 121 ++++
 arch/powerpc/kvm/book3s_hv_rm_mmu.c         |   2 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c          | 604 ++++++++++++++++++++
 arch/powerpc/kvm/powerpc.c                  |  12 +
 include/uapi/linux/kvm.h                    |   1 +
 15 files changed, 953 insertions(+), 5 deletions(-)
 create mode 100644 arch/powerpc/include/asm/kvm_book3s_uvmem.h
 create mode 100644 arch/powerpc/kvm/book3s_hv_uvmem.c

-- 
2.21.0

