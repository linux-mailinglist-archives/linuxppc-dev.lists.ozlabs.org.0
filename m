Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABC724708
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 06:52:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457Nfq4sJkzDqFS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 14:52:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457NdL3N7LzDqHR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 14:51:18 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4L4l5go026753
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 00:51:15 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sm8rakgd7-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 00:51:14 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bauerman@linux.ibm.com>;
 Tue, 21 May 2019 05:51:14 +0100
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 21 May 2019 05:51:09 +0100
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4L4p8LQ20447626
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 May 2019 04:51:08 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED9B6C605A;
 Tue, 21 May 2019 04:51:07 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63230C6057;
 Tue, 21 May 2019 04:50:49 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.80.203.157])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 21 May 2019 04:50:48 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 00/12] Secure Virtual Machine Enablement
Date: Tue, 21 May 2019 01:49:00 -0300
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19052104-0016-0000-0000-000009B709F9
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011134; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01206342; UDB=6.00633450; IPR=6.00987310; 
 MB=3.00026980; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-21 04:51:12
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052104-0017-0000-0000-0000434D4AF1
Message-Id: <20190521044912.1375-1-bauerman@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-20_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905210030
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
Cc: Anshuman Khandual <anshuman.linux@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Mike Anderson <andmike@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 Claudio Carvalho <cclaudio@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Christoph Hellwig <hch@lst.de>, Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series enables Secure Virtual Machines (SVMs) on powerpc. SVMs use the
Protected Execution Facility (PEF) and request to be migrated to secure
memory during prom_init() so by default all of their memory is inaccessible
to the hypervisor. There is an Ultravisor call that the VM can use to
request certain pages to be made accessible to (or shared with) the
hypervisor.

The objective of these patches is to have the guest perform this request
for buffers that need to be accessed by the hypervisor such as the LPPACAs,
the SWIOTLB memory and the Debug Trace Log.

The patch set applies on top of Claudio Carvalho's "kvmppc: Paravirtualize KVM
to support ultravisor" series:

https://lore.kernel.org/linuxppc-dev/20190518142524.28528-1-cclaudio@linux.ibm.com/

I only need the following two patches from his series:

[RFC PATCH v2 02/10] KVM: PPC: Ultravisor: Introduce the MSR_S bit
[RFC PATCH v2 04/10] KVM: PPC: Ultravisor: Add generic ultravisor call handler

Patches 2 and 3 are posted as RFC because we are still finalizing the
details on how the ESM blob will be passed to the kernel. All other patches
are (hopefully) in upstreamable shape.

Unfortunately this series still doesn't enable the use of virtio devices in
the secure guest. This support depends on a discussion that is currently
ongoing with the virtio community:

https://lore.kernel.org/linuxppc-dev/87womn8inf.fsf@morokweng.localdomain/

This was the last time I posted this patch set:

https://lore.kernel.org/linuxppc-dev/20180824162535.22798-1-bauerman@linux.ibm.com/

At that time, it wasn't possible to launch a real secure guest because the
Ultravisor was still in very early development. Now there is a relatively
mature Ultravisor and I was able to test it using Claudio's patches in the
host kernel, booting normally using an initramfs for the root filesystem.

This is the command used to start up the guest with QEMU 4.0:

qemu-system-ppc64				\
	-nodefaults				\
	-cpu host				\
	-machine pseries,accel=kvm,kvm-type=HV,cap-htm=off,cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken \
	-display none				\
	-serial mon:stdio			\
	-smp 1					\
	-m 4G					\
	-kernel /home/bauermann/vmlinux		\
	-initrd /home/bauermann/fs_small.cpio	\
	-append 'debug'

Changelog since the RFC from August:

- Patch "powerpc/pseries: Introduce option to build secure virtual machines"
  - New patch.

- Patch "powerpc: Add support for adding an ESM blob to the zImage wrapper"
  - Patch from Benjamin Herrenschmidt, first posted here:
    https://lore.kernel.org/linuxppc-dev/20180531043417.25073-1-benh@kernel.crashing.org/
  - Made minor adjustments to some comments. Code is unchanged.

- Patch "powerpc/prom_init: Add the ESM call to prom_init"
  - New patch from Ram Pai and Michael Anderson.

- Patch "powerpc/pseries/svm: Add helpers for UV_SHARE_PAGE and UV_UNSHARE_PAGE"
  - New patch from Ram Pai.

- Patch "powerpc/pseries: Add and use LPPACA_SIZE constant"
  - Moved LPPACA_SIZE macro inside the CONFIG_PPC_PSERIES #ifdef.
  - Put sizeof() operand left of comparison operator in BUILD_BUG_ON()
    macro to appease a checkpatch warning.

- Patch "powerpc/pseries/svm: Use shared memory for LPPACA structures"
  - Moved definition of is_secure_guest() helper to this patch.
  - Changed shared_lppaca and shared_lppaca_size from globals to static
    variables inside alloc_shared_lppaca().
  - Changed shared_lppaca to hold virtual address instead of physical
    address.

- Patch "powerpc/pseries/svm: Use shared memory for Debug Trace Log (DTL)"
  - Add get_dtl_cache_ctor() macro. Suggested by Ram Pai.

- Patch "powerpc/pseries/svm: Export guest SVM status to user space via sysfs"
  - New patch from Ryan Grimm.

- Patch "powerpc/pseries/svm: Disable doorbells in SVM guests"
  - New patch from Sukadev Bhattiprolu.

- Patch "powerpc/pseries/iommu: Don't use dma_iommu_ops on secure guests"
  - New patch.

- Patch "powerpc/pseries/svm: Force SWIOTLB for secure guests"
  - New patch with code that was previously in other patches.

- Patch "powerpc/configs: Enable secure guest support in pseries and ppc64 defconfigs"
  - New patch from Ryan Grimm.

- Patch "powerpc/pseries/svm: Detect Secure Virtual Machine (SVM) platform"
  - Dropped this patch by moving its code to other patches.

- Patch "powerpc/svm: Select CONFIG_DMA_DIRECT_OPS and CONFIG_SWIOTLB"
  - No need to select CONFIG_DMA_DIRECT_OPS anymore. The CONFIG_SWIOTLB
    change was moved to another patch and this patch was dropped.

- Patch "powerpc/pseries/svm: Add memory conversion (shared/secure) helper functions"
  - Dropped patch since the helper functions were unnecessary wrappers
    around uv_share_page() and uv_unshare_page().

- Patch "powerpc/svm: Convert SWIOTLB buffers to shared memory"
  - Squashed into patch "powerpc/pseries/svm: Force SWIOTLB for secure
    guests"

- Patch "powerpc/svm: Don't release SWIOTLB buffers on secure guests"
  - Squashed into patch "powerpc/pseries/svm: Force SWIOTLB for secure
    guests"

- Patch "powerpc/svm: Use SWIOTLB DMA API for all virtio devices"
  - Dropped patch. Enablement of virtio will use a difference approach.

- Patch "powerpc/svm: Force the use of bounce buffers"
  - Squashed into patch "powerpc/pseries/svm: Force SWIOTLB for secure
    guests"
  - Added comment explaining why it's necessary.to force use of SWIOTLB.
    Suggested by Christoph Hellwig.

- Patch "powerpc/svm: Increase SWIOTLB buffer size"
  - Dropped patch.


Anshuman Khandual (3):
  powerpc/pseries/svm: Use shared memory for LPPACA structures
  powerpc/pseries/svm: Use shared memory for Debug Trace Log (DTL)
  powerpc/pseries/svm: Force SWIOTLB for secure guests

Benjamin Herrenschmidt (1):
  powerpc: Add support for adding an ESM blob to the zImage wrapper

Ram Pai (2):
  powerpc/prom_init: Add the ESM call to prom_init
  powerpc/pseries/svm: Add helpers for UV_SHARE_PAGE and UV_UNSHARE_PAGE

Ryan Grimm (2):
  powerpc/pseries/svm: Export guest SVM status to user space via sysfs
  powerpc/configs: Enable secure guest support in pseries and ppc64
    defconfigs

Sukadev Bhattiprolu (1):
  powerpc/pseries/svm: Disable doorbells in SVM guests

Thiago Jung Bauermann (3):
  powerpc/pseries: Introduce option to build secure virtual machines
  powerpc/pseries: Add and use LPPACA_SIZE constant
  powerpc/pseries/iommu: Don't use dma_iommu_ops on secure guests

 .../admin-guide/kernel-parameters.txt         |   5 +
 arch/powerpc/boot/main.c                      |  41 ++++++
 arch/powerpc/boot/ops.h                       |   2 +
 arch/powerpc/boot/wrapper                     |  24 +++-
 arch/powerpc/boot/zImage.lds.S                |   8 ++
 arch/powerpc/configs/ppc64_defconfig          |   1 +
 arch/powerpc/configs/pseries_defconfig        |   1 +
 arch/powerpc/include/asm/mem_encrypt.h        |  19 +++
 arch/powerpc/include/asm/svm.h                |  31 +++++
 arch/powerpc/include/asm/ultravisor-api.h     |   3 +
 arch/powerpc/include/asm/ultravisor.h         |  16 ++-
 arch/powerpc/kernel/Makefile                  |   4 +-
 arch/powerpc/kernel/paca.c                    |  52 +++++++-
 arch/powerpc/kernel/prom_init.c               | 124 ++++++++++++++++++
 arch/powerpc/kernel/sysfs.c                   |  29 ++++
 arch/powerpc/platforms/pseries/Kconfig        |  17 +++
 arch/powerpc/platforms/pseries/Makefile       |   1 +
 arch/powerpc/platforms/pseries/iommu.c        |   6 +-
 arch/powerpc/platforms/pseries/setup.c        |   5 +-
 arch/powerpc/platforms/pseries/smp.c          |   3 +-
 arch/powerpc/platforms/pseries/svm.c          |  85 ++++++++++++
 21 files changed, 464 insertions(+), 13 deletions(-)
 create mode 100644 arch/powerpc/include/asm/mem_encrypt.h
 create mode 100644 arch/powerpc/include/asm/svm.h
 create mode 100644 arch/powerpc/platforms/pseries/svm.c

