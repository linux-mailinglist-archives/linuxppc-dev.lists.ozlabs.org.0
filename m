Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F26766297
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 05:42:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OSvcl/y9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBtjq08cRz3cPn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 13:42:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OSvcl/y9;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBthx3n8Qz2ygG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 13:41:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1690515679;
	bh=McozdqADWyKHK7/0tmkdlYUPdVHmchZVLsq5iNjzFMk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OSvcl/y9gskTY9tI5OTW65Cu2A00QAUqNTc5MNOhmRpK9j7TWZZU7rGrGhRbNThc3
	 UL65We9ohGC2gqLit3qQQ/JHxDrnizJZHYwqZDlTRJFPX20jkpi6qsLnt3WoeJ+3aL
	 GsmJctPYSk44JdtNLww8XHduFsR2lf85MNd05TlsASKUa+oX/cnNgP8BtSuQeWzbox
	 MOTi4YFeE+MgdF8JEkNJ9enPI8AbWCM7Zh8ANufHqDV43Yk55LCfD7BpPhW4SZ+fWK
	 FK5PaVnjTV6DrhXt4HLmjbIVK7rsDvB0bm5W5cAhvprKUGeDgoKHRxjnRW7naAOSbY
	 yt5VKtyyXVXhw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RBthr6jxcz4wb5;
	Fri, 28 Jul 2023 13:41:16 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Costa Shulyupin <costa.shul@redhat.com>
Subject: Re: [PATCH] docs: move powerpc under arch
In-Reply-To: <20230725061504.2263678-1-costa.shul@redhat.com>
References: <20230725061504.2263678-1-costa.shul@redhat.com>
Date: Fri, 28 Jul 2023 13:41:12 +1000
Message-ID: <87bkfwem93.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: "open list:KERNEL VIRTUAL MACHINE FOR
 POWERPC" <kvm@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:PCI ERROR RECOVERY" <linux-pci@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, Oliver O'Halloran <oohall@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Benjamin Gray <bgray@linux.ibm.com>, Brian King <brking@linux.vnet.ibm.com>, Jiri Slaby <jirislaby@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>, Costa Shulyupin <costa.shul@redhat.com>, Yantengsi <siyanteng@loongson.cn>, "open list:CXLFLASH SCSI DRIVER" <linux-scsi@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Nicholas Miehlbradt <nicholas@linux.ibm.com>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Linas Vepstas <linasvepstas@gmail.com>, Nathan Lynch <nathanl@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Rohan McLure <rmclure@linux.ibm.com>, "Manoj N. Kumar" <manoj@linux.ibm.com>, Sathvika Vasireddy <sv
 @linux.ibm.com>, Al Viro <viro@zeniv.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, "Matthew R. Ochs" <mrochs@linux.ibm.com>, Uma Krishnan <ukrishn@linux.ibm.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Li Yang <leoyang.li@nxp.com>, Frederic Barrat <fbarrat@linux.ibm.com>, "open list:PCI ENHANCED ERROR HANDLING FOR
 POWERPC" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Costa Shulyupin <costa.shul@redhat.com> writes:
> and fix all in-tree references.
>
> Architecture-specific documentation is being moved into Documentation/arch/
> as a way of cleaning up the top-level documentation directory and making
> the docs hierarchy more closely match the source hierarchy.
>
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>

Fine by me, I assume Jon will take this.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

> ---
>  Documentation/ABI/testing/sysfs-bus-papr-pmem             | 2 +-
>  Documentation/PCI/pci-error-recovery.rst                  | 4 ++--
>  Documentation/arch/index.rst                              | 2 +-
>  Documentation/{ => arch}/powerpc/associativity.rst        | 0
>  Documentation/{ => arch}/powerpc/booting.rst              | 0
>  Documentation/{ => arch}/powerpc/bootwrapper.rst          | 0
>  Documentation/{ => arch}/powerpc/cpu_families.rst         | 0
>  Documentation/{ => arch}/powerpc/cpu_features.rst         | 0
>  Documentation/{ => arch}/powerpc/cxl.rst                  | 0
>  Documentation/{ => arch}/powerpc/cxlflash.rst             | 2 +-
>  Documentation/{ => arch}/powerpc/dawr-power9.rst          | 0
>  Documentation/{ => arch}/powerpc/dexcr.rst                | 0
>  Documentation/{ => arch}/powerpc/dscr.rst                 | 0
>  .../{ => arch}/powerpc/eeh-pci-error-recovery.rst         | 0
>  Documentation/{ => arch}/powerpc/elf_hwcaps.rst           | 6 +++---
>  Documentation/{ => arch}/powerpc/elfnote.rst              | 0
>  Documentation/{ => arch}/powerpc/features.rst             | 0
>  .../{ => arch}/powerpc/firmware-assisted-dump.rst         | 0
>  Documentation/{ => arch}/powerpc/hvcs.rst                 | 0
>  Documentation/{ => arch}/powerpc/imc.rst                  | 0
>  Documentation/{ => arch}/powerpc/index.rst                | 0
>  Documentation/{ => arch}/powerpc/isa-versions.rst         | 0
>  Documentation/{ => arch}/powerpc/kasan.txt                | 0
>  Documentation/{ => arch}/powerpc/kaslr-booke32.rst        | 0
>  Documentation/{ => arch}/powerpc/mpc52xx.rst              | 0
>  Documentation/{ => arch}/powerpc/papr_hcalls.rst          | 0
>  .../{ => arch}/powerpc/pci_iov_resource_on_powernv.rst    | 0
>  Documentation/{ => arch}/powerpc/pmu-ebb.rst              | 0
>  Documentation/{ => arch}/powerpc/ptrace.rst               | 0
>  Documentation/{ => arch}/powerpc/qe_firmware.rst          | 0
>  Documentation/{ => arch}/powerpc/syscall64-abi.rst        | 0
>  Documentation/{ => arch}/powerpc/transactional_memory.rst | 0
>  Documentation/{ => arch}/powerpc/ultravisor.rst           | 0
>  Documentation/{ => arch}/powerpc/vas-api.rst              | 0
>  Documentation/{ => arch}/powerpc/vcpudispatch_stats.rst   | 0
>  MAINTAINERS                                               | 8 ++++----
>  arch/powerpc/kernel/exceptions-64s.S                      | 6 +++---
>  arch/powerpc/kernel/paca.c                                | 2 +-
>  arch/powerpc/kvm/book3s_64_entry.S                        | 2 +-
>  drivers/soc/fsl/qe/qe.c                                   | 2 +-
>  drivers/tty/hvc/hvcs.c                                    | 2 +-
>  include/soc/fsl/qe/qe.h                                   | 2 +-
>  42 files changed, 20 insertions(+), 20 deletions(-)
>  rename Documentation/{ => arch}/powerpc/associativity.rst (100%)
>  rename Documentation/{ => arch}/powerpc/booting.rst (100%)
>  rename Documentation/{ => arch}/powerpc/bootwrapper.rst (100%)
>  rename Documentation/{ => arch}/powerpc/cpu_families.rst (100%)
>  rename Documentation/{ => arch}/powerpc/cpu_features.rst (100%)
>  rename Documentation/{ => arch}/powerpc/cxl.rst (100%)
>  rename Documentation/{ => arch}/powerpc/cxlflash.rst (99%)
>  rename Documentation/{ => arch}/powerpc/dawr-power9.rst (100%)
>  rename Documentation/{ => arch}/powerpc/dexcr.rst (100%)
>  rename Documentation/{ => arch}/powerpc/dscr.rst (100%)
>  rename Documentation/{ => arch}/powerpc/eeh-pci-error-recovery.rst (100%)
>  rename Documentation/{ => arch}/powerpc/elf_hwcaps.rst (97%)
>  rename Documentation/{ => arch}/powerpc/elfnote.rst (100%)
>  rename Documentation/{ => arch}/powerpc/features.rst (100%)
>  rename Documentation/{ => arch}/powerpc/firmware-assisted-dump.rst (100%)
>  rename Documentation/{ => arch}/powerpc/hvcs.rst (100%)
>  rename Documentation/{ => arch}/powerpc/imc.rst (100%)
>  rename Documentation/{ => arch}/powerpc/index.rst (100%)
>  rename Documentation/{ => arch}/powerpc/isa-versions.rst (100%)
>  rename Documentation/{ => arch}/powerpc/kasan.txt (100%)
>  rename Documentation/{ => arch}/powerpc/kaslr-booke32.rst (100%)
>  rename Documentation/{ => arch}/powerpc/mpc52xx.rst (100%)
>  rename Documentation/{ => arch}/powerpc/papr_hcalls.rst (100%)
>  rename Documentation/{ => arch}/powerpc/pci_iov_resource_on_powernv.rst (100%)
>  rename Documentation/{ => arch}/powerpc/pmu-ebb.rst (100%)
>  rename Documentation/{ => arch}/powerpc/ptrace.rst (100%)
>  rename Documentation/{ => arch}/powerpc/qe_firmware.rst (100%)
>  rename Documentation/{ => arch}/powerpc/syscall64-abi.rst (100%)
>  rename Documentation/{ => arch}/powerpc/transactional_memory.rst (100%)
>  rename Documentation/{ => arch}/powerpc/ultravisor.rst (100%)
>  rename Documentation/{ => arch}/powerpc/vas-api.rst (100%)
>  rename Documentation/{ => arch}/powerpc/vcpudispatch_stats.rst (100%)
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-papr-pmem b/Documentation/ABI/testing/sysfs-bus-papr-pmem
> index 4ac0673901e7..20347eb81530 100644
> --- a/Documentation/ABI/testing/sysfs-bus-papr-pmem
> +++ b/Documentation/ABI/testing/sysfs-bus-papr-pmem
> @@ -8,7 +8,7 @@ Description:
>  		more bits set in the dimm-health-bitmap retrieved in
>  		response to H_SCM_HEALTH hcall. The details of the bit
>  		flags returned in response to this hcall is available
> -		at 'Documentation/powerpc/papr_hcalls.rst' . Below are
> +		at 'Documentation/arch/powerpc/papr_hcalls.rst' . Below are
>  		the flags reported in this sysfs file:
>  
>  		* "not_armed"
> diff --git a/Documentation/PCI/pci-error-recovery.rst b/Documentation/PCI/pci-error-recovery.rst
> index c237596f67e3..a394726510bd 100644
> --- a/Documentation/PCI/pci-error-recovery.rst
> +++ b/Documentation/PCI/pci-error-recovery.rst
> @@ -364,7 +364,7 @@ Note, however, not all failures are truly "permanent". Some are
>  caused by over-heating, some by a poorly seated card. Many
>  PCI error events are caused by software bugs, e.g. DMA's to
>  wild addresses or bogus split transactions due to programming
> -errors. See the discussion in Documentation/powerpc/eeh-pci-error-recovery.rst
> +errors. See the discussion in Documentation/arch/powerpc/eeh-pci-error-recovery.rst
>  for additional detail on real-life experience of the causes of
>  software errors.
>  
> @@ -404,7 +404,7 @@ That is, the recovery API only requires that:
>  .. note::
>  
>     Implementation details for the powerpc platform are discussed in
> -   the file Documentation/powerpc/eeh-pci-error-recovery.rst
> +   the file Documentation/arch/powerpc/eeh-pci-error-recovery.rst
>  
>     As of this writing, there is a growing list of device drivers with
>     patches implementing error recovery. Not all of these patches are in
> diff --git a/Documentation/arch/index.rst b/Documentation/arch/index.rst
> index 84b80255b851..1bf7a3f1c77b 100644
> --- a/Documentation/arch/index.rst
> +++ b/Documentation/arch/index.rst
> @@ -19,7 +19,7 @@ implementation.
>     nios2/index
>     openrisc/index
>     parisc/index
> -   ../powerpc/index
> +   powerpc/index
>     ../riscv/index
>     s390/index
>     sh/index
> diff --git a/Documentation/powerpc/associativity.rst b/Documentation/arch/powerpc/associativity.rst
> similarity index 100%
> rename from Documentation/powerpc/associativity.rst
> rename to Documentation/arch/powerpc/associativity.rst
> diff --git a/Documentation/powerpc/booting.rst b/Documentation/arch/powerpc/booting.rst
> similarity index 100%
> rename from Documentation/powerpc/booting.rst
> rename to Documentation/arch/powerpc/booting.rst
> diff --git a/Documentation/powerpc/bootwrapper.rst b/Documentation/arch/powerpc/bootwrapper.rst
> similarity index 100%
> rename from Documentation/powerpc/bootwrapper.rst
> rename to Documentation/arch/powerpc/bootwrapper.rst
> diff --git a/Documentation/powerpc/cpu_families.rst b/Documentation/arch/powerpc/cpu_families.rst
> similarity index 100%
> rename from Documentation/powerpc/cpu_families.rst
> rename to Documentation/arch/powerpc/cpu_families.rst
> diff --git a/Documentation/powerpc/cpu_features.rst b/Documentation/arch/powerpc/cpu_features.rst
> similarity index 100%
> rename from Documentation/powerpc/cpu_features.rst
> rename to Documentation/arch/powerpc/cpu_features.rst
> diff --git a/Documentation/powerpc/cxl.rst b/Documentation/arch/powerpc/cxl.rst
> similarity index 100%
> rename from Documentation/powerpc/cxl.rst
> rename to Documentation/arch/powerpc/cxl.rst
> diff --git a/Documentation/powerpc/cxlflash.rst b/Documentation/arch/powerpc/cxlflash.rst
> similarity index 99%
> rename from Documentation/powerpc/cxlflash.rst
> rename to Documentation/arch/powerpc/cxlflash.rst
> index cea67931b3b9..e8f488acfa41 100644
> --- a/Documentation/powerpc/cxlflash.rst
> +++ b/Documentation/arch/powerpc/cxlflash.rst
> @@ -32,7 +32,7 @@ Introduction
>      responsible for the initialization of the adapter, setting up the
>      special path for user space access, and performing error recovery. It
>      communicates directly the Flash Accelerator Functional Unit (AFU)
> -    as described in Documentation/powerpc/cxl.rst.
> +    as described in Documentation/arch/powerpc/cxl.rst.
>  
>      The cxlflash driver supports two, mutually exclusive, modes of
>      operation at the device (LUN) level:
> diff --git a/Documentation/powerpc/dawr-power9.rst b/Documentation/arch/powerpc/dawr-power9.rst
> similarity index 100%
> rename from Documentation/powerpc/dawr-power9.rst
> rename to Documentation/arch/powerpc/dawr-power9.rst
> diff --git a/Documentation/powerpc/dexcr.rst b/Documentation/arch/powerpc/dexcr.rst
> similarity index 100%
> rename from Documentation/powerpc/dexcr.rst
> rename to Documentation/arch/powerpc/dexcr.rst
> diff --git a/Documentation/powerpc/dscr.rst b/Documentation/arch/powerpc/dscr.rst
> similarity index 100%
> rename from Documentation/powerpc/dscr.rst
> rename to Documentation/arch/powerpc/dscr.rst
> diff --git a/Documentation/powerpc/eeh-pci-error-recovery.rst b/Documentation/arch/powerpc/eeh-pci-error-recovery.rst
> similarity index 100%
> rename from Documentation/powerpc/eeh-pci-error-recovery.rst
> rename to Documentation/arch/powerpc/eeh-pci-error-recovery.rst
> diff --git a/Documentation/powerpc/elf_hwcaps.rst b/Documentation/arch/powerpc/elf_hwcaps.rst
> similarity index 97%
> rename from Documentation/powerpc/elf_hwcaps.rst
> rename to Documentation/arch/powerpc/elf_hwcaps.rst
> index 3366e5b18e67..4c896cf077c2 100644
> --- a/Documentation/powerpc/elf_hwcaps.rst
> +++ b/Documentation/arch/powerpc/elf_hwcaps.rst
> @@ -202,7 +202,7 @@ PPC_FEATURE2_VEC_CRYPTO
>  
>  PPC_FEATURE2_HTM_NOSC
>      System calls fail if called in a transactional state, see
> -    Documentation/powerpc/syscall64-abi.rst
> +    Documentation/arch/powerpc/syscall64-abi.rst
>  
>  PPC_FEATURE2_ARCH_3_00
>      The processor supports the v3.0B / v3.0C userlevel architecture. Processors
> @@ -217,11 +217,11 @@ PPC_FEATURE2_DARN
>  
>  PPC_FEATURE2_SCV
>      The scv 0 instruction may be used for system calls, see
> -    Documentation/powerpc/syscall64-abi.rst.
> +    Documentation/arch/powerpc/syscall64-abi.rst.
>  
>  PPC_FEATURE2_HTM_NO_SUSPEND
>      A limited Transactional Memory facility that does not support suspend is
> -    available, see Documentation/powerpc/transactional_memory.rst.
> +    available, see Documentation/arch/powerpc/transactional_memory.rst.
>  
>  PPC_FEATURE2_ARCH_3_1
>      The processor supports the v3.1 userlevel architecture. Processors
> diff --git a/Documentation/powerpc/elfnote.rst b/Documentation/arch/powerpc/elfnote.rst
> similarity index 100%
> rename from Documentation/powerpc/elfnote.rst
> rename to Documentation/arch/powerpc/elfnote.rst
> diff --git a/Documentation/powerpc/features.rst b/Documentation/arch/powerpc/features.rst
> similarity index 100%
> rename from Documentation/powerpc/features.rst
> rename to Documentation/arch/powerpc/features.rst
> diff --git a/Documentation/powerpc/firmware-assisted-dump.rst b/Documentation/arch/powerpc/firmware-assisted-dump.rst
> similarity index 100%
> rename from Documentation/powerpc/firmware-assisted-dump.rst
> rename to Documentation/arch/powerpc/firmware-assisted-dump.rst
> diff --git a/Documentation/powerpc/hvcs.rst b/Documentation/arch/powerpc/hvcs.rst
> similarity index 100%
> rename from Documentation/powerpc/hvcs.rst
> rename to Documentation/arch/powerpc/hvcs.rst
> diff --git a/Documentation/powerpc/imc.rst b/Documentation/arch/powerpc/imc.rst
> similarity index 100%
> rename from Documentation/powerpc/imc.rst
> rename to Documentation/arch/powerpc/imc.rst
> diff --git a/Documentation/powerpc/index.rst b/Documentation/arch/powerpc/index.rst
> similarity index 100%
> rename from Documentation/powerpc/index.rst
> rename to Documentation/arch/powerpc/index.rst
> diff --git a/Documentation/powerpc/isa-versions.rst b/Documentation/arch/powerpc/isa-versions.rst
> similarity index 100%
> rename from Documentation/powerpc/isa-versions.rst
> rename to Documentation/arch/powerpc/isa-versions.rst
> diff --git a/Documentation/powerpc/kasan.txt b/Documentation/arch/powerpc/kasan.txt
> similarity index 100%
> rename from Documentation/powerpc/kasan.txt
> rename to Documentation/arch/powerpc/kasan.txt
> diff --git a/Documentation/powerpc/kaslr-booke32.rst b/Documentation/arch/powerpc/kaslr-booke32.rst
> similarity index 100%
> rename from Documentation/powerpc/kaslr-booke32.rst
> rename to Documentation/arch/powerpc/kaslr-booke32.rst
> diff --git a/Documentation/powerpc/mpc52xx.rst b/Documentation/arch/powerpc/mpc52xx.rst
> similarity index 100%
> rename from Documentation/powerpc/mpc52xx.rst
> rename to Documentation/arch/powerpc/mpc52xx.rst
> diff --git a/Documentation/powerpc/papr_hcalls.rst b/Documentation/arch/powerpc/papr_hcalls.rst
> similarity index 100%
> rename from Documentation/powerpc/papr_hcalls.rst
> rename to Documentation/arch/powerpc/papr_hcalls.rst
> diff --git a/Documentation/powerpc/pci_iov_resource_on_powernv.rst b/Documentation/arch/powerpc/pci_iov_resource_on_powernv.rst
> similarity index 100%
> rename from Documentation/powerpc/pci_iov_resource_on_powernv.rst
> rename to Documentation/arch/powerpc/pci_iov_resource_on_powernv.rst
> diff --git a/Documentation/powerpc/pmu-ebb.rst b/Documentation/arch/powerpc/pmu-ebb.rst
> similarity index 100%
> rename from Documentation/powerpc/pmu-ebb.rst
> rename to Documentation/arch/powerpc/pmu-ebb.rst
> diff --git a/Documentation/powerpc/ptrace.rst b/Documentation/arch/powerpc/ptrace.rst
> similarity index 100%
> rename from Documentation/powerpc/ptrace.rst
> rename to Documentation/arch/powerpc/ptrace.rst
> diff --git a/Documentation/powerpc/qe_firmware.rst b/Documentation/arch/powerpc/qe_firmware.rst
> similarity index 100%
> rename from Documentation/powerpc/qe_firmware.rst
> rename to Documentation/arch/powerpc/qe_firmware.rst
> diff --git a/Documentation/powerpc/syscall64-abi.rst b/Documentation/arch/powerpc/syscall64-abi.rst
> similarity index 100%
> rename from Documentation/powerpc/syscall64-abi.rst
> rename to Documentation/arch/powerpc/syscall64-abi.rst
> diff --git a/Documentation/powerpc/transactional_memory.rst b/Documentation/arch/powerpc/transactional_memory.rst
> similarity index 100%
> rename from Documentation/powerpc/transactional_memory.rst
> rename to Documentation/arch/powerpc/transactional_memory.rst
> diff --git a/Documentation/powerpc/ultravisor.rst b/Documentation/arch/powerpc/ultravisor.rst
> similarity index 100%
> rename from Documentation/powerpc/ultravisor.rst
> rename to Documentation/arch/powerpc/ultravisor.rst
> diff --git a/Documentation/powerpc/vas-api.rst b/Documentation/arch/powerpc/vas-api.rst
> similarity index 100%
> rename from Documentation/powerpc/vas-api.rst
> rename to Documentation/arch/powerpc/vas-api.rst
> diff --git a/Documentation/powerpc/vcpudispatch_stats.rst b/Documentation/arch/powerpc/vcpudispatch_stats.rst
> similarity index 100%
> rename from Documentation/powerpc/vcpudispatch_stats.rst
> rename to Documentation/arch/powerpc/vcpudispatch_stats.rst
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d1d8a9745761..b444619c26c2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5601,7 +5601,7 @@ M:	Andrew Donnellan <ajd@linux.ibm.com>
>  L:	linuxppc-dev@lists.ozlabs.org
>  S:	Supported
>  F:	Documentation/ABI/testing/sysfs-class-cxl
> -F:	Documentation/powerpc/cxl.rst
> +F:	Documentation/arch/powerpc/cxl.rst
>  F:	arch/powerpc/platforms/powernv/pci-cxl.c
>  F:	drivers/misc/cxl/
>  F:	include/misc/cxl*
> @@ -5613,7 +5613,7 @@ M:	Matthew R. Ochs <mrochs@linux.ibm.com>
>  M:	Uma Krishnan <ukrishn@linux.ibm.com>
>  L:	linux-scsi@vger.kernel.org
>  S:	Supported
> -F:	Documentation/powerpc/cxlflash.rst
> +F:	Documentation/arch/powerpc/cxlflash.rst
>  F:	drivers/scsi/cxlflash/
>  F:	include/uapi/scsi/cxlflash_ioctl.h
>  
> @@ -12044,7 +12044,7 @@ F:	Documentation/ABI/stable/sysfs-firmware-opal-*
>  F:	Documentation/devicetree/bindings/i2c/i2c-opal.txt
>  F:	Documentation/devicetree/bindings/powerpc/
>  F:	Documentation/devicetree/bindings/rtc/rtc-opal.txt
> -F:	Documentation/powerpc/
> +F:	Documentation/arch/powerpc/
>  F:	arch/powerpc/
>  F:	drivers/*/*/*pasemi*
>  F:	drivers/*/*pasemi*
> @@ -16392,7 +16392,7 @@ R:	Oliver O'Halloran <oohall@gmail.com>
>  L:	linuxppc-dev@lists.ozlabs.org
>  S:	Supported
>  F:	Documentation/PCI/pci-error-recovery.rst
> -F:	Documentation/powerpc/eeh-pci-error-recovery.rst
> +F:	Documentation/arch/powerpc/eeh-pci-error-recovery.rst
>  F:	arch/powerpc/include/*/eeh*.h
>  F:	arch/powerpc/kernel/eeh*.c
>  F:	arch/powerpc/platforms/*/eeh*.c
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index c33c8ebf8641..eaf2f167c342 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -893,7 +893,7 @@ __start_interrupts:
>   *
>   * Call convention:
>   *
> - * syscall register convention is in Documentation/powerpc/syscall64-abi.rst
> + * syscall register convention is in Documentation/arch/powerpc/syscall64-abi.rst
>   */
>  EXC_VIRT_BEGIN(system_call_vectored, 0x3000, 0x1000)
>  	/* SCV 0 */
> @@ -1952,8 +1952,8 @@ EXC_VIRT_NONE(0x4b00, 0x100)
>   * Call convention:
>   *
>   * syscall and hypercalls register conventions are documented in
> - * Documentation/powerpc/syscall64-abi.rst and
> - * Documentation/powerpc/papr_hcalls.rst respectively.
> + * Documentation/arch/powerpc/syscall64-abi.rst and
> + * Documentation/arch/powerpc/papr_hcalls.rst respectively.
>   *
>   * The intersection of volatile registers that don't contain possible
>   * inputs is: cr0, xer, ctr. We may use these as scratch regs upon entry
> diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
> index cda4e00b67c1..7502066c3c53 100644
> --- a/arch/powerpc/kernel/paca.c
> +++ b/arch/powerpc/kernel/paca.c
> @@ -68,7 +68,7 @@ static void *__init alloc_shared_lppaca(unsigned long size, unsigned long limit,
>  		memblock_set_bottom_up(true);
>  
>  		/*
> -		 * See Documentation/powerpc/ultravisor.rst for more details.
> +		 * See Documentation/arch/powerpc/ultravisor.rst for more details.
>  		 *
>  		 * UV/HV data sharing is in PAGE_SIZE granularity. In order to
>  		 * minimize the number of pages shared, align the allocation to
> diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3s_64_entry.S
> index 6c2b1d17cb63..0902636f87e5 100644
> --- a/arch/powerpc/kvm/book3s_64_entry.S
> +++ b/arch/powerpc/kvm/book3s_64_entry.S
> @@ -19,7 +19,7 @@
>  
>  /*
>   * This is a hcall, so register convention is as
> - * Documentation/powerpc/papr_hcalls.rst.
> + * Documentation/arch/powerpc/papr_hcalls.rst.
>   *
>   * This may also be a syscall from PR-KVM userspace that is to be
>   * reflected to the PR guest kernel, so registers may be set up for
> diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
> index 58746e570d14..e3580d152cf1 100644
> --- a/drivers/soc/fsl/qe/qe.c
> +++ b/drivers/soc/fsl/qe/qe.c
> @@ -429,7 +429,7 @@ static void qe_upload_microcode(const void *base,
>  /*
>   * Upload a microcode to the I-RAM at a specific address.
>   *
> - * See Documentation/powerpc/qe_firmware.rst for information on QE microcode
> + * See Documentation/arch/powerpc/qe_firmware.rst for information on QE microcode
>   * uploading.
>   *
>   * Currently, only version 1 is supported, so the 'version' field must be
> diff --git a/drivers/tty/hvc/hvcs.c b/drivers/tty/hvc/hvcs.c
> index 1de1a09bf82d..2459387d80b4 100644
> --- a/drivers/tty/hvc/hvcs.c
> +++ b/drivers/tty/hvc/hvcs.c
> @@ -47,7 +47,7 @@
>   * using the 2.6 Linux kernel kref construct.
>   *
>   * For direction on installation and usage of this driver please reference
> - * Documentation/powerpc/hvcs.rst.
> + * Documentation/arch/powerpc/hvcs.rst.
>   */
>  
>  #include <linux/device.h>
> diff --git a/include/soc/fsl/qe/qe.h b/include/soc/fsl/qe/qe.h
> index eb5079904cc8..af793f2a0ec4 100644
> --- a/include/soc/fsl/qe/qe.h
> +++ b/include/soc/fsl/qe/qe.h
> @@ -258,7 +258,7 @@ static inline int qe_alive_during_sleep(void)
>  
>  /* Structure that defines QE firmware binary files.
>   *
> - * See Documentation/powerpc/qe_firmware.rst for a description of these
> + * See Documentation/arch/powerpc/qe_firmware.rst for a description of these
>   * fields.
>   */
>  struct qe_firmware {
> -- 
> 2.41.0
