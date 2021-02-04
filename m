Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7522530F862
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 17:47:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWkxh69nMzDwrn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 03:47:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=MYMvQITW; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DWkpx5JK4zDrcP
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 03:42:01 +1100 (AEDT)
Received: from localhost.localdomain (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id A1AFC20B7192;
 Thu,  4 Feb 2021 08:41:58 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A1AFC20B7192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1612456919;
 bh=f38q6FS48ro7CxHSpwzk/vfsl/o0evA57bpwmDDg+u8=;
 h=From:To:Cc:Subject:Date:From;
 b=MYMvQITWf2oYZqTdY12G3vZw/PN9S7NTpOGrRmng0rBY7G/wIuApBGQQnG+Zlg1yv
 yyAnhyrWSEAfR22ITW5sH9AwzUIvN/TZgTkRNC+c4WMBTVuDYrV7qP5AgE9Ho90F/W
 K8Gc5xXwfA+FyzZooK4IJIe+wemkyR6zJwLxcTns=
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: zohar@linux.ibm.com, bauerman@linux.ibm.com, robh@kernel.org,
 takahiro.akashi@linaro.org, gregkh@linuxfoundation.org, will@kernel.org,
 joe@perches.com, catalin.marinas@arm.com, mpe@ellerman.id.au
Subject: [PATCH v16 00/12] Carry forward IMA measurement log on kexec on ARM64
Date: Thu,  4 Feb 2021 08:41:23 -0800
Message-Id: <20210204164135.29856-1-nramas@linux.microsoft.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: mark.rutland@arm.com, bhsharma@redhat.com, tao.li@vivo.com,
 paulus@samba.org, vincenzo.frascino@arm.com, frowand.list@gmail.com,
 sashal@kernel.org, masahiroy@kernel.org, jmorris@namei.org,
 linux-arm-kernel@lists.infradead.org, serge@hallyn.com,
 devicetree@vger.kernel.org, pasha.tatashin@soleen.com,
 prsriva@linux.microsoft.com, hsinyi@chromium.org, allison@lohutok.net,
 christophe.leroy@c-s.fr, mbrugger@suse.com, balajib@linux.microsoft.com,
 dmitry.kasatkin@gmail.com, linux-kernel@vger.kernel.org, james.morse@arm.com,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On kexec file load Integrity Measurement Architecture (IMA) subsystem
may verify the IMA signature of the kernel and initramfs, and measure
it.  The command line parameters passed to the kernel in the kexec call
may also be measured by IMA.  A remote attestation service can verify
a TPM quote based on the TPM event log, the IMA measurement list, and
the TPM PCR data.  This can be achieved only if the IMA measurement log
is carried over from the current kernel to the next kernel across
the kexec call.

powerpc already supports carrying forward the IMA measurement log on
kexec.  This patch set adds support for carrying forward the IMA
measurement log on kexec on ARM64.

This patch set moves the platform independent code defined for powerpc
such that it can be reused for other platforms as well.  A chosen node
"linux,ima-kexec-buffer" is added to the DTB for ARM64 to hold
the address and the size of the memory reserved to carry
the IMA measurement log.

This patch set has been tested for ARM64 platform using QEMU.
I would like help from the community for testing this change on powerpc.
Thanks.

This patch set is based on
commit b3f82afc1041 ("IMA: Measure kernel version in early boot")
in https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git
"next-integrity" branch.

Changelog:

v16
  - Defined functions to allocate and free buffer for FDT for powerpc
    and arm64.
  - Moved ima_buffer_addr and ima_buffer_size fields from
    "struct kimage_arch" in powerpc to "struct kimage"
v15
  - Included Rob's patches in the patch set, and rebased
    the changes to "next-integrity" branch.
  - Allocate memory for DTB, on arm64, using kmalloc() instead of
    vmalloc() to keep it consistent with powerpc implementation.
  - Call of_kexec_setup_new_fdt() from setup_new_fdt_ppc64() and
    remove setup_new_fdt() in the same patch to keep it bisect safe.

v14
  - Select CONFIG_HAVE_IMA_KEXEC for CONFIG_KEXEC_FILE, for powerpc
    and arm64, if CONFIG_IMA is enabled.
  - Use IS_ENABLED() macro instead of "#ifdef" in remove_ima_buffer(),
    ima_get_kexec_buffer(), and ima_free_kexec_buffer().
  - Call of_kexec_setup_new_fdt() from setup_new_fdt_ppc64() and
    remove setup_new_fdt() in "arch/powerpc/kexec/file_load.c".

v13
  - Moved the arch independent functions to drivers/of/kexec.c
    and then refactored the code.
  - Moved arch_ima_add_kexec_buffer() to
    security/integrity/ima/ima_kexec.c

v12
  - Use fdt_appendprop_addrrange() in setup_ima_buffer()
    to setup the IMA measurement list property in
    the device tree.
  - Moved architecture independent functions from
    "arch/powerpc/kexec/ima.c" to "drivers/of/kexec."
  - Deleted "arch/powerpc/kexec/ima.c" and
    "arch/powerpc/include/asm/ima.h".

v11
  - Rebased the changes on the kexec code refactoring done by
    Rob Herring in his "dt/kexec" branch
  - Removed "extern" keyword in function declarations
  - Removed unnecessary header files included in C files
  - Updated patch descriptions per Thiago's comments

v10
  - Moved delete_fdt_mem_rsv(), remove_ima_buffer(),
    get_ima_kexec_buffer, and get_root_addr_size_cells()
    to drivers/of/kexec.c
  - Moved arch_ima_add_kexec_buffer() to
    security/integrity/ima/ima_kexec.c
  - Conditionally define IMA buffer fields in struct kimage_arch

v9
  - Moved delete_fdt_mem_rsv() to drivers/of/kexec_fdt.c
  - Defined a new function get_ima_kexec_buffer() in
    drivers/of/ima_kexec.c to replace do_get_kexec_buffer()
  - Changed remove_ima_kexec_buffer() to the original function name
    remove_ima_buffer()
  - Moved remove_ima_buffer() to drivers/of/ima_kexec.c
  - Moved ima_get_kexec_buffer() and ima_free_kexec_buffer()
    to security/integrity/ima/ima_kexec.c

v8:
  - Moved remove_ima_kexec_buffer(), do_get_kexec_buffer(), and
    delete_fdt_mem_rsv() to drivers/of/fdt.c
  - Moved ima_dump_measurement_list() and ima_add_kexec_buffer()
    back to security/integrity/ima/ima_kexec.c

v7:
  - Renamed remove_ima_buffer() to remove_ima_kexec_buffer() and moved
    this function definition to kernel.
  - Moved delete_fdt_mem_rsv() definition to kernel
  - Moved ima_dump_measurement_list() and ima_add_kexec_buffer() to
    a new file namely ima_kexec_fdt.c in IMA

v6:
  - Remove any existing FDT_PROP_IMA_KEXEC_BUFFER property in the device
    tree and also its corresponding memory reservation in the currently
    running kernel.
  - Moved the function remove_ima_buffer() defined for powerpc to IMA
    and renamed the function to ima_remove_kexec_buffer(). Also, moved
    delete_fdt_mem_rsv() from powerpc to IMA.

v5:
  - Merged get_addr_size_cells() and do_get_kexec_buffer() into a single
    function when moving the arch independent code from powerpc to IMA
  - Reverted the change to use FDT functions in powerpc code and added
    back the original code in get_addr_size_cells() and
    do_get_kexec_buffer() for powerpc.
  - Added fdt_add_mem_rsv() for ARM64 to reserve the memory for
    the IMA log buffer during kexec.
  - Fixed the warning reported by kernel test bot for ARM64
    arch_ima_add_kexec_buffer() - moved this function to a new file
    namely arch/arm64/kernel/ima_kexec.c

v4:
  - Submitting the patch series on behalf of the original author
    Prakhar Srivastava <prsriva@linux.microsoft.com>
  - Moved FDT_PROP_IMA_KEXEC_BUFFER ("linux,ima-kexec-buffer") to
    libfdt.h so that it can be shared by multiple platforms.

v3:
Breakup patches further into separate patches.
  - Refactoring non architecture specific code out of powerpc
  - Update powerpc related code to use fdt functions
  - Update IMA buffer read related code to use of functions
  - Add support to store the memory information of the IMA
    measurement logs to be carried forward.
  - Update the property strings to align with documented nodes
    https://github.com/devicetree-org/dt-schema/pull/46

v2:
  Break patches into separate patches.
  - Powerpc related Refactoring
  - Updating the docuemntation for chosen node
  - Updating arm64 to support IMA buffer pass

v1:
  Refactoring carrying over IMA measuremnet logs over Kexec. This patch
    moves the non-architecture specific code out of powerpc and adds to
    security/ima.(Suggested by Thiago)
  Add Documentation regarding the ima-kexec-buffer node in the chosen
    node documentation

v0:
  Add a layer of abstraction to use the memory reserved by device tree
    for ima buffer pass.
  Add support for ima buffer pass using reserved memory for arm64 kexec.
    Update the arch sepcific code path in kexec file load to store the
    ima buffer in the reserved memory. The same reserved memory is read
    on kexec or cold boot.


Lakshmi Ramasubramanian (8):
  powerpc: Move ima buffer fields to struct kimage
  powerpc: Move arch independent ima kexec functions to
    drivers/of/kexec.c
  kexec: Use fdt_appendprop_addrrange() to add ima buffer to FDT
  powerpc: Delete unused function delete_fdt_mem_rsv()
  of: Define functions to allocate and free FDT
  arm64: Use OF alloc and free functions for FDT
  powerpc: Use OF alloc and free for FDT
  arm64: Enable passing IMA log to next kernel on kexec

Rob Herring (4):
  powerpc: Rename kexec elfcorehdr_addr to elf_headers_mem
  of: Add a common kexec FDT setup function
  arm64: Use common of_kexec_setup_new_fdt()
  powerpc: Use common of_kexec_setup_new_fdt()

 arch/arm64/Kconfig                     |   1 +
 arch/arm64/kernel/machine_kexec_file.c | 158 +-------
 arch/powerpc/Kconfig                   |   2 +-
 arch/powerpc/include/asm/ima.h         |  30 --
 arch/powerpc/include/asm/kexec.h       |  11 +-
 arch/powerpc/kexec/Makefile            |   7 -
 arch/powerpc/kexec/elf_64.c            |  26 +-
 arch/powerpc/kexec/file_load.c         | 184 +---------
 arch/powerpc/kexec/file_load_64.c      |  11 +-
 arch/powerpc/kexec/ima.c               | 219 -----------
 drivers/of/Makefile                    |   1 +
 drivers/of/kexec.c                     | 488 +++++++++++++++++++++++++
 include/linux/kexec.h                  |   5 +
 include/linux/of.h                     |  15 +-
 security/integrity/ima/ima.h           |   4 -
 security/integrity/ima/ima_kexec.c     |   3 +-
 16 files changed, 552 insertions(+), 613 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/ima.h
 delete mode 100644 arch/powerpc/kexec/ima.c
 create mode 100644 drivers/of/kexec.c

-- 
2.30.0

