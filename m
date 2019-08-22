Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D0E990D3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 12:29:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DgkM39y4zDrJF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 20:29:15 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DggR75BxzDqll
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 20:26:42 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7MAMcnC098842
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 06:26:39 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uhqy1k7kb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 06:26:38 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Thu, 22 Aug 2019 11:26:37 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 22 Aug 2019 11:26:35 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x7MAQCv340894940
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Aug 2019 10:26:12 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85CDBAE045;
 Thu, 22 Aug 2019 10:26:33 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F07A9AE055;
 Thu, 22 Aug 2019 10:26:30 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.199.57.57])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 22 Aug 2019 10:26:30 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 0/7] KVMPPC driver to manage secure guest pages
Date: Thu, 22 Aug 2019 15:56:13 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19082210-4275-0000-0000-0000035BD3F9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082210-4276-0000-0000-0000386DF9B4
Message-Id: <20190822102620.21897-1-bharata@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-22_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908220112
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

Claudio Carvalho's base ultravisor enablement patchset v6
(https://lore.kernel.org/linuxppc-dev/20190822034838.27876-1-cclaudio@linux.ibm.com/T/#t)

These patches along with Claudio's above patches are required to
run a secure pseries guest on KVM. This patchset is based on hmm.git
because hmm.git has migrate_vma cleanup and not-device memremap_pages
patchsets that are required by this patchset.

Changes in v7
=============
- The major change in this version is to not create a char device but
  instead use the not device versions of memremap_pages and
  request_free_mem_region (Christoph Hellwig)
- Other changes
  * Addressed all the changes suggested by Christoph Hellwig for v6.
  * Removed MIGRATE_VMA_HELPER dependency
  * Switched to using of_find_compatible_node() and not doing
    find by path (Thiago Jung Bauermann)
  * Moved kvmppc_rmap_is_devm_pfn to kvm_host.h
  * Updated comments
  * use @page_shift argument in H_SVM_PAGE_OUT instead of PAGE_SHIFT
  * Proper handling of return val from kvmppc_devm_fault_migrate_alloc_and_copy

v6: https://lore.kernel.org/linuxppc-dev/20190809084108.30343-1-bharata@linux.ibm.com/T/#t

Anshuman Khandual (1):
  KVM: PPC: Ultravisor: Add PPC_UV config option

Bharata B Rao (6):
  kvmppc: Driver to manage pages of secure guest
  kvmppc: Shared pages support for secure guests
  kvmppc: H_SVM_INIT_START and H_SVM_INIT_DONE hcalls
  kvmppc: Handle memory plug/unplug to secure VM
  kvmppc: Radix changes for secure guest
  kvmppc: Support reset of secure guest

 Documentation/virtual/kvm/api.txt          |  19 +
 arch/powerpc/Kconfig                       |  17 +
 arch/powerpc/include/asm/hvcall.h          |   9 +
 arch/powerpc/include/asm/kvm_book3s_devm.h |  47 ++
 arch/powerpc/include/asm/kvm_host.h        |  39 ++
 arch/powerpc/include/asm/kvm_ppc.h         |   2 +
 arch/powerpc/include/asm/ultravisor-api.h  |   6 +
 arch/powerpc/include/asm/ultravisor.h      |  36 ++
 arch/powerpc/kvm/Makefile                  |   3 +
 arch/powerpc/kvm/book3s_64_mmu_radix.c     |  22 +
 arch/powerpc/kvm/book3s_hv.c               | 113 ++++
 arch/powerpc/kvm/book3s_hv_devm.c          | 614 +++++++++++++++++++++
 arch/powerpc/kvm/powerpc.c                 |  12 +
 include/uapi/linux/kvm.h                   |   1 +
 14 files changed, 940 insertions(+)
 create mode 100644 arch/powerpc/include/asm/kvm_book3s_devm.h
 create mode 100644 arch/powerpc/kvm/book3s_hv_devm.c

-- 
2.21.0

