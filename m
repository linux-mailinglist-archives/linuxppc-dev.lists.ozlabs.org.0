Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 15024ED838
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 05:20:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47602m4bXtzF52c
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 15:20:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47600B2yfSzF3j3
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2019 15:18:16 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA44CsoZ072164
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 3 Nov 2019 23:18:12 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w24u1bxdr-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 03 Nov 2019 23:18:12 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Mon, 4 Nov 2019 04:18:10 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 4 Nov 2019 04:18:08 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xA44I7Kt196956
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Nov 2019 04:18:07 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3968A5204F;
 Mon,  4 Nov 2019 04:18:07 +0000 (GMT)
Received: from bharata.in.ibm.com (unknown [9.124.35.185])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 617765204E;
 Mon,  4 Nov 2019 04:18:05 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v10 0/8] KVM: PPC: Driver to manage pages of secure guest
Date: Mon,  4 Nov 2019 09:47:52 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19110404-0020-0000-0000-000003823B12
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19110404-0021-0000-0000-000021D85C51
Message-Id: <20191104041800.24527-1-bharata@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-04_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=942 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1911040039
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
Cc: linuxram@us.ibm.com, cclaudio@linux.ibm.com,
 Bharata B Rao <bharata@linux.ibm.com>, jglisse@redhat.com,
 aneesh.kumar@linux.vnet.ibm.com, paulus@au1.ibm.com,
 sukadev@linux.vnet.ibm.com, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

This is the next version of the patchset that adds required support
in the KVM hypervisor to run secure guests on PEF-enabled POWER platforms.

The major change in this version is about not using kvm.arch->rmap[]
array to store device PFNs, thus not depending on the memslot availability
to reach to the device PFN from the fault path. Instead of rmap[], we
now have a different array which gets created and destroyed along with
memslot creation and deletion. These arrays hang off from kvm.arch and
are arragned in a simple linked list for now. We could move to some other
data structure in future if walking of linked list becomes an overhead
due to large number of memslots.

Other changes include:

- Rearranged/Merged/Cleaned up patches, removed all Acks/Reviewed-by since
  all the patches have changed.
- Added a new patch to support H_SVM_INIT_ABORT hcall (From Suka)
- Added KSM unmerge support so that VMAs that have device PFNs don't
  participate in KSM merging and eventually crash in KSM code.
- Release device pages during unplug (Paul) and ensure that memory
  hotplug and unplug works correctly.
- Let kvm-hv module to load on PEF-disabled platforms (Ram) when
  CONFIG_PPC_UV is enabled allowing regular non-secure guests
  to still run.
- Support guest reset when swithing to secure is in progress.
- Check if page is already secure in kvmppc_send_page_to_uv() before
  sending it to UV.
- Fixed sentinal for header file kvm_book3s_uvmem.h (Jason)

Now, all the dependencies required by this patchset are in powerpc/next
on which this patchset is based upon.

Outside of PowerPC code, this needs a change in KSM code as this
patchset uses ksm_madvise() which is not exported.

Anshuman Khandual (1):
  KVM: PPC: Ultravisor: Add PPC_UV config option

Bharata B Rao (6):
  mm: ksm: Export ksm_madvise()
  KVM: PPC: Support for running secure guests
  KVM: PPC: Shared pages support for secure guests
  KVM: PPC: Radix changes for secure guest
  KVM: PPC: Handle memory plug/unplug to secure VM
  KVM: PPC: Support reset of secure guest

Sukadev Bhattiprolu (1):
  KVM: PPC: Implement H_SVM_INIT_ABORT hcall

 Documentation/powerpc/ultravisor.rst        |  39 +
 Documentation/virt/kvm/api.txt              |  19 +
 arch/powerpc/Kconfig                        |  17 +
 arch/powerpc/include/asm/hvcall.h           |  10 +
 arch/powerpc/include/asm/kvm_book3s_uvmem.h |  80 ++
 arch/powerpc/include/asm/kvm_host.h         |   7 +
 arch/powerpc/include/asm/kvm_ppc.h          |   2 +
 arch/powerpc/include/asm/ultravisor-api.h   |   6 +
 arch/powerpc/include/asm/ultravisor.h       |  36 +
 arch/powerpc/kvm/Makefile                   |   3 +
 arch/powerpc/kvm/book3s_64_mmu_radix.c      |  25 +
 arch/powerpc/kvm/book3s_hv.c                | 144 ++++
 arch/powerpc/kvm/book3s_hv_rmhandlers.S     |  23 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c          | 794 ++++++++++++++++++++
 arch/powerpc/kvm/powerpc.c                  |  12 +
 include/uapi/linux/kvm.h                    |   1 +
 mm/ksm.c                                    |   1 +
 17 files changed, 1217 insertions(+), 2 deletions(-)
 create mode 100644 arch/powerpc/include/asm/kvm_book3s_uvmem.h
 create mode 100644 arch/powerpc/kvm/book3s_hv_uvmem.c

-- 
2.21.0

