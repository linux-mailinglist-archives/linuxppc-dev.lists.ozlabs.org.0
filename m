Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AC1BD79D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 07:09:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dR1s1qGrzDqkG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 15:09:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=bharata@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dQyx3wwdzDqfr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 15:07:04 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8P52jsU070312
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 01:07:01 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v7ky9ujmm-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 01:07:01 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Wed, 25 Sep 2019 06:06:59 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 25 Sep 2019 06:06:55 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x8P56rEX46727494
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Sep 2019 05:06:53 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A40AEA4051;
 Wed, 25 Sep 2019 05:06:53 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2286A4055;
 Wed, 25 Sep 2019 05:06:51 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.199.52.56])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 25 Sep 2019 05:06:51 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v9 0/8] KVM: PPC: Driver to manage pages of secure guest
Date: Wed, 25 Sep 2019 10:36:41 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19092505-0028-0000-0000-000003A22EF6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19092505-0029-0000-0000-000024644707
Message-Id: <20190925050649.14926-1-bharata@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-25_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=983 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909250050
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

[The main change in this version is the introduction of new
locking to prevent concurrent page-in and page-out calls. More
details about this are present in patch 2/8]

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

Changes in v9
=============
- Prevent concurrent page-in and page-out calls.
- Ensure device PFNs are allocated for zero-pages that are sent to UV.
- Failure to migrate a page during page-in will now return error via
  hcall.
- Address review comments by Suka
- Misc cleanups

v8: https://lore.kernel.org/linux-mm/20190910082946.7849-2-bharata@linux.ibm.com/T/

Anshuman Khandual (1):
  KVM: PPC: Ultravisor: Add PPC_UV config option

Bharata B Rao (6):
  KVM: PPC: Move pages between normal and secure memory
  KVM: PPC: Shared pages support for secure guests
  KVM: PPC: H_SVM_INIT_START and H_SVM_INIT_DONE hcalls
  KVM: PPC: Handle memory plug/unplug to secure VM
  KVM: PPC: Radix changes for secure guest
  KVM: PPC: Support reset of secure guest

Suraj Jitindar Singh (1):
  KVM: PPC: Book3S HV: Define usage types for rmap array in guest
    memslot

 Documentation/virt/kvm/api.txt              |  19 +
 arch/powerpc/Kconfig                        |  17 +
 arch/powerpc/include/asm/hvcall.h           |   9 +
 arch/powerpc/include/asm/kvm_book3s_uvmem.h |  48 ++
 arch/powerpc/include/asm/kvm_host.h         |  57 +-
 arch/powerpc/include/asm/kvm_ppc.h          |   2 +
 arch/powerpc/include/asm/ultravisor-api.h   |   6 +
 arch/powerpc/include/asm/ultravisor.h       |  36 ++
 arch/powerpc/kvm/Makefile                   |   3 +
 arch/powerpc/kvm/book3s_64_mmu_radix.c      |  22 +
 arch/powerpc/kvm/book3s_hv.c                | 122 ++++
 arch/powerpc/kvm/book3s_hv_rm_mmu.c         |   2 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c          | 673 ++++++++++++++++++++
 arch/powerpc/kvm/powerpc.c                  |  12 +
 include/uapi/linux/kvm.h                    |   1 +
 15 files changed, 1024 insertions(+), 5 deletions(-)
 create mode 100644 arch/powerpc/include/asm/kvm_book3s_uvmem.h
 create mode 100644 arch/powerpc/kvm/book3s_hv_uvmem.c

-- 
2.21.0

