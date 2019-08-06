Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6E582AF5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 07:27:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462jnv1DgTzDqZl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 15:27:47 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 462jhZ1mJ2zDqT1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2019 15:23:09 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x765LxN9055956; Tue, 6 Aug 2019 01:23:01 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2u739ar46n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Aug 2019 01:23:01 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x765Mgxu058005;
 Tue, 6 Aug 2019 01:23:00 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2u739ar465-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Aug 2019 01:23:00 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x765KGAf024301;
 Tue, 6 Aug 2019 05:22:59 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 2u51w6p1tf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Aug 2019 05:22:59 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x765MxBt51184116
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Aug 2019 05:22:59 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2D11112062;
 Tue,  6 Aug 2019 05:22:58 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64221112061;
 Tue,  6 Aug 2019 05:22:54 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.85.207.254])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  6 Aug 2019 05:22:54 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 00/16] Secure Virtual Machine Enablement
Date: Tue,  6 Aug 2019 02:22:21 -0300
Message-Id: <20190806052237.12525-1-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-06_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908060063
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

Hello,

There are three new patches from Claudio's "kvmppc: Paravirtualize KVM to
support ultravisor" series. Two of them are borrowed (meaning that he will
submit them with his series as well) and included here so that this series
can stand on its own. They are the one introducing ucall_norets() (patch 1)
and the one adding documentation on the Ultravisor (patch 15).

The third new patch is migrating from the kvmppc series to this one because
it won't be needed there anymore but is needed here. This is the patch
introducing the MSR_S bit (patch 6).

There are also changes to a couple of patches stemming from review comments
by Alexey Kardashevskiy and Segher Boessenkool (thanks!). The changelog
below has the details.

This series applies on top of v4 of the <asm/mem_encrypt.h> cleanup series:

https://lore.kernel.org/linuxppc-dev/20190806044919.10622-1-bauerman@linux.ibm.com/

Everything is available in branch ultravisor-secure-vm at this repo:

https://github.com/bauermann/linux.git

Original cover letter below, and changelog at the bottom:

This series enables Secure Virtual Machines (SVMs) on powerpc. SVMs use the
Protected Execution Facility (PEF) and request to be migrated to secure
memory during prom_init() so by default all of their memory is inaccessible
to the hypervisor. There is an Ultravisor call that the VM can use to
request certain pages to be made accessible to (or shared with) the
hypervisor.

The objective of these patches is to have the guest perform this request
for buffers that need to be accessed by the hypervisor such as the LPPACAs,
the SWIOTLB memory and the Debug Trace Log.

Patch 3 ("powerpc: Add support for adding an ESM blob to the zImage
wrapper") is posted as RFC because we are still finalizing the details on
how the ESM blob will be passed along with the kernel. All other patches are
(hopefully) in upstreamable shape and don't depend on this patch.

Unfortunately this series still doesn't enable the use of virtio devices in
the secure guest. This support depends on a discussion that is currently
ongoing with the virtio community:

https://lore.kernel.org/linuxppc-dev/87womn8inf.fsf@morokweng.localdomain/

I was able to test it using Claudio's patches in the host kernel, booting
normally using an initramfs for the root filesystem.

This is the command used to start up the guest with QEMU 4.0:

qemu-system-ppc64				\
	-nodefaults				\
	-cpu host				\
	-machine pseries,accel=kvm,kvm-type=HV,cap-htm=off,cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken \
	-display none				\
	-serial mon:stdio			\
	-smp 1					\
	-m 4G					\
	-kernel /root/bauermann/vmlinux		\
	-initrd /root/bauermann/fs_small.cpio	\
	-append 'debug'

Changelog

Since v2:

- Patch "powerpc/kernel: Add ucall_norets() ultravisor call handler"
  - Borrowed unchanged from Claudio's "kvmppc: Paravirtualize KVM to support
    ultravisor" series.

- Patch "powerpc/prom_init: Add the ESM call to prom_init"
  - Briefly mention in the commit message why we pass the kernel base address
    and FDT to the Enter Secure Mode ultracall. Suggested by Alexey
    Kardashevskiy.
  - Use enter_secure_mode() version provided by Segher Boessenkool.

- Patch "powerpc/pseries/svm: Add helpers for UV_SHARE_PAGE and UV_UNSHARE_PAGE"
  - Use ucall_norets() which doesn't need to be passed a return buffer.
    Suggested by Alexey Kardashevskiy.

- Patch "powerpc: Introduce the MSR_S bit"
  - Moved from Claudio's "kvmppc: Paravirtualize KVM to support ultravisor"
    series to this series.

- Patch "Documentation/powerpc: Ultravisor API"
  - New patch from Sukadev Bhattiprolu. Will also appear on Claudio's
    kvmppc series.

Since v1:

- Patch "powerpc/pseries: Introduce option to build secure virtual machines"
  - Dropped redundant "default n" from CONFIG_PPC_SVM. Suggested by Christoph
    Hellwig.

- Patch "powerpc: Add support for adding an ESM blob to the zImage wrapper"
  - Renamed prom_rtas_os_term_hcall() to prom_rtas_hcall(). Suggested by Alexey
    Kardashevskiy.
  - In prom_rtas_hcall(), changed prom_printf() calls to prom_debug(), and
    use H_RTAS constant instead of raw value.
  - Changed enter_secure_mode() to new ABI passing ucall number in r3.
    Also changed it to accept kbase argument instead of ESM blob address.
  - Changed setup_secure_guest() to only make the ESM ultracall if svm=1 was
    passed on the kernel command line.

- Patch "powerpc/pseries/svm: Unshare all pages before kexecing a new kernel"
  - New patch from Ram Pai.

- Patch "powerpc/pseries/svm: Force SWIOTLB for secure guests"
  - No need to define sme_me_mask, sme_active() and sev_active() anymore.
  - Add definitions for mem_encrypt_active() and force_dma_unencrypted().
  - Select ARCH_HAS_FORCE_DMA_UNENCRYPTED in CONFIG_PPC_SVM.

Anshuman Khandual (3):
  powerpc/pseries/svm: Use shared memory for LPPACA structures
  powerpc/pseries/svm: Use shared memory for Debug Trace Log (DTL)
  powerpc/pseries/svm: Force SWIOTLB for secure guests

Benjamin Herrenschmidt (1):
  powerpc: Add support for adding an ESM blob to the zImage wrapper

Claudio Carvalho (1):
  powerpc/kernel: Add ucall_norets() ultravisor call handler

Ram Pai (3):
  powerpc/prom_init: Add the ESM call to prom_init
  powerpc/pseries/svm: Add helpers for UV_SHARE_PAGE and UV_UNSHARE_PAGE
  powerpc/pseries/svm: Unshare all pages before kexecing a new kernel

Ryan Grimm (2):
  powerpc/pseries/svm: Export guest SVM status to user space via sysfs
  powerpc/configs: Enable secure guest support in pseries and ppc64
    defconfigs

Sukadev Bhattiprolu (3):
  powerpc: Introduce the MSR_S bit
  powerpc/pseries/svm: Disable doorbells in SVM guests
  Documentation/powerpc: Ultravisor API

Thiago Jung Bauermann (3):
  powerpc/pseries: Introduce option to build secure virtual machines
  powerpc/pseries: Add and use LPPACA_SIZE constant
  powerpc/pseries/iommu: Don't use dma_iommu_ops on secure guests

 .../admin-guide/kernel-parameters.txt         |    5 +
 Documentation/powerpc/ultravisor.rst          | 1048 +++++++++++++++++
 arch/powerpc/boot/main.c                      |   41 +
 arch/powerpc/boot/ops.h                       |    2 +
 arch/powerpc/boot/wrapper                     |   24 +-
 arch/powerpc/boot/zImage.lds.S                |    8 +
 arch/powerpc/configs/ppc64_defconfig          |    1 +
 arch/powerpc/configs/pseries_defconfig        |    1 +
 arch/powerpc/include/asm/asm-prototypes.h     |   11 +
 arch/powerpc/include/asm/mem_encrypt.h        |   26 +
 arch/powerpc/include/asm/reg.h                |    3 +
 arch/powerpc/include/asm/svm.h                |   31 +
 arch/powerpc/include/asm/ultravisor-api.h     |   29 +
 arch/powerpc/include/asm/ultravisor.h         |   29 +
 arch/powerpc/kernel/Makefile                  |    3 +
 arch/powerpc/kernel/machine_kexec_64.c        |    9 +
 arch/powerpc/kernel/paca.c                    |   52 +-
 arch/powerpc/kernel/prom_init.c               |   96 ++
 arch/powerpc/kernel/sysfs.c                   |   29 +
 arch/powerpc/kernel/ucall.S                   |   20 +
 arch/powerpc/platforms/pseries/Kconfig        |   14 +
 arch/powerpc/platforms/pseries/Makefile       |    1 +
 arch/powerpc/platforms/pseries/iommu.c        |    6 +-
 arch/powerpc/platforms/pseries/setup.c        |    5 +-
 arch/powerpc/platforms/pseries/smp.c          |    3 +-
 arch/powerpc/platforms/pseries/svm.c          |   85 ++
 26 files changed, 1571 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/powerpc/ultravisor.rst
 create mode 100644 arch/powerpc/include/asm/mem_encrypt.h
 create mode 100644 arch/powerpc/include/asm/svm.h
 create mode 100644 arch/powerpc/include/asm/ultravisor-api.h
 create mode 100644 arch/powerpc/include/asm/ultravisor.h
 create mode 100644 arch/powerpc/kernel/ucall.S
 create mode 100644 arch/powerpc/platforms/pseries/svm.c

