Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 954BC9543D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 04:19:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CDyD2ZSWzDqmf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 12:19:32 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CDqq5mlSzDqlP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 12:13:59 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7K2Ca8P056662; Mon, 19 Aug 2019 22:13:48 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ug63v3b8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Aug 2019 22:13:47 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x7K2DeD4059033;
 Mon, 19 Aug 2019 22:13:47 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ug63v3b80-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Aug 2019 22:13:47 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7K29oJf017948;
 Tue, 20 Aug 2019 02:13:47 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04wdc.us.ibm.com with ESMTP id 2ufye02bfh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Aug 2019 02:13:46 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7K2DjQR36307256
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Aug 2019 02:13:45 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 552B0C6059;
 Tue, 20 Aug 2019 02:13:45 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24283C6057;
 Tue, 20 Aug 2019 02:13:42 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.85.220.248])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 20 Aug 2019 02:13:41 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 00/16] Secure Virtual Machine Enablement
Date: Mon, 19 Aug 2019 23:13:10 -0300
Message-Id: <20190820021326.6884-1-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-20_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908200018
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

This is a minor update of this patch series. It addresses review comments
made to v3. Details are in the changelog. The sysfs patch is updated and
included here but as I mentioned earlier can be postponed. It is marked
RFC for that reason.

As with the previous version, the patch introducing ucall_norets() (patch 1)
and the one adding documentation on the Ultravisor (patch 15) are copied
from v5 of Claudio Carvalho's KVM on Ultravisor series and don't yet address
the review comments made there. They are included here so that this series
can stand on its own.

The patches apply on top of v4 of the <asm/mem_encrypt.h> cleanup series:

https://lore.kernel.org/linuxppc-dev/20190806044919.10622-1-bauerman@linux.ibm.com/

Everything is available in branch ultravisor-secure-vm (applied on top of
today's powerpc/next) at this repo:

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

Since v3:

- Patch "powerpc/kernel: Add ucall_norets() ultravisor call handler"
  - Use updated commit message from Claudio Carvalho's KVM series v5.

- Patch "powerpc: Introduce the MSR_S bit"
  - Use updated commit message from Claudio Carvalho.

- Patch "powerpc/pseries/svm: Use shared memory for LPPACA structures"
  - Changed copyright year in <asm/svm.h> to 2018. Suggested by Michael
    Ellerman.

- Patch "powerpc/pseries/svm: Use shared memory for Debug Trace Log (DTL)"
  - Changed copyright year in svm.c to 2018. Suggested by Michael Ellerman.

- Patch "powerpc/pseries/svm: Export guest SVM status to user space via sysfs"
  - Changed to check MSR_S on the current CPU. Suggested by Michael Ellerman.
  - Added documentation for new sysfs file. Suggested by Michael Ellerman.

- Patch "powerpc/pseries/iommu: Don't use dma_iommu_ops on secure guests"
  - Changed to only call set_pci_dma_ops() on non-secure guests. Suggested
    by Christoph Hellwig.

- Patch "powerpc/pseries/svm: Force SWIOTLB for secure guests"
  - Changed copyright year in <asm/mem_encrypt.h> to 2018. Suggested by
    Michael Ellerman.

- Patch "Documentation/powerpc: Ultravisor API"
  - Use updated patch from Claudio Carvalho's KVM series v5.

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

 .../ABI/testing/sysfs-devices-system-cpu      |   10 +
 .../admin-guide/kernel-parameters.txt         |    5 +
 Documentation/powerpc/ultravisor.rst          | 1055 +++++++++++++++++
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
 arch/powerpc/kernel/sysfs.c                   |   20 +
 arch/powerpc/kernel/ucall.S                   |   20 +
 arch/powerpc/platforms/pseries/Kconfig        |   14 +
 arch/powerpc/platforms/pseries/Makefile       |    1 +
 arch/powerpc/platforms/pseries/iommu.c        |   11 +-
 arch/powerpc/platforms/pseries/setup.c        |    5 +-
 arch/powerpc/platforms/pseries/smp.c          |    3 +-
 arch/powerpc/platforms/pseries/svm.c          |   85 ++
 27 files changed, 1584 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/powerpc/ultravisor.rst
 create mode 100644 arch/powerpc/include/asm/mem_encrypt.h
 create mode 100644 arch/powerpc/include/asm/svm.h
 create mode 100644 arch/powerpc/include/asm/ultravisor-api.h
 create mode 100644 arch/powerpc/include/asm/ultravisor.h
 create mode 100644 arch/powerpc/kernel/ucall.S
 create mode 100644 arch/powerpc/platforms/pseries/svm.c

