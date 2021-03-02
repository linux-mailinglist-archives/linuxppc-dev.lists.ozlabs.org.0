Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F70D32A348
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 16:07:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqgTp70yxz3cXZ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 02:07:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IbR7Nas9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IbR7Nas9; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqgTN6tj6z30LC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Mar 2021 02:07:04 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3B2C564F46
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 15:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614697622;
 bh=rwonpNq25JJj2ufF7OMZquyMz1mCqMW/pVBOD+XZGeE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IbR7Nas9nddr99wRToXJtsaaw0+ZBA+nayu/qO2gT92v7eaxf4RbiDALoIqlHjrPN
 GsgqMqCgO8hGvC1cPYmrpU2wu2bgcElgHcTgcEtuEYow6LDJyUucn4A8X8+45CElos
 BEqMXhLVt3pYy9yudfkZovrLhdjjFQ7yNshcvAVarmZV7/LJa30+5M4E8wEpCybUiZ
 a7UOu2fWXDEFEsHOB05S6n3hUA/HSBCbRlZUi0JNA6sTBuXjvProClnWbj0IcCSjrc
 Xa2HQ1VlhLpj2HjUcDRHJMRdin610qXlR2fMklyVPlVlDdnqn/DNZgQ3JyLuV7rJgh
 7qOedsvTemGFQ==
Received: by mail-ed1-f47.google.com with SMTP id b13so16414257edx.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Mar 2021 07:07:02 -0800 (PST)
X-Gm-Message-State: AOAM533JhATHXj1VHqY1tU39g5AItAPUGec1gJKlx++PttDoMqNtCOn8
 i3EpDCnOi5FqfYDjp35E7+5+VgsxajHh9MD41w==
X-Google-Smtp-Source: ABdhPJxOtEVEY247zJz1Zjl4hZ6/xkyL6IjN+Q/OTQt+J/K7OkDS0hD7whg467iJYOsJ9IQW2v48KL9mVR3Zfm7IszQ=
X-Received: by 2002:a17:906:c405:: with SMTP id
 u5mr11900896ejz.341.1614697620328; 
 Tue, 02 Mar 2021 07:07:00 -0800 (PST)
MIME-Version: 1.0
References: <20210221174930.27324-1-nramas@linux.microsoft.com>
In-Reply-To: <20210221174930.27324-1-nramas@linux.microsoft.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 2 Mar 2021 09:06:47 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKiOVo2rDhstAA-jUkMJiajHM=uwfj3JQd64h_eEfSjTw@mail.gmail.com>
Message-ID: <CAL_JsqKiOVo2rDhstAA-jUkMJiajHM=uwfj3JQd64h_eEfSjTw@mail.gmail.com>
Subject: Re: [PATCH v19 00/13] Carry forward IMA measurement log on kexec on
 ARM64
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mark Rutland <mark.rutland@arm.com>, tao.li@vivo.com,
 Mimi Zohar <zohar@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 vincenzo.frascino@arm.com, Frank Rowand <frowand.list@gmail.com>,
 Sasha Levin <sashal@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Masahiro Yamada <masahiroy@kernel.org>, James Morris <jmorris@namei.org>,
 "AKASHI, Takahiro" <takahiro.akashi@linaro.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, devicetree@vger.kernel.org,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Will Deacon <will@kernel.org>,
 Prakhar Srivastava <prsriva@linux.microsoft.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Allison Randal <allison@lohutok.net>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Matthias Brugger <mbrugger@suse.com>, balajib@linux.microsoft.com,
 dmitry.kasatkin@gmail.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 James Morse <james.morse@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>,
 linux-integrity@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Feb 21, 2021 at 11:49 AM Lakshmi Ramasubramanian
<nramas@linux.microsoft.com> wrote:
>
> On kexec file load Integrity Measurement Architecture (IMA) subsystem
> may verify the IMA signature of the kernel and initramfs, and measure
> it.  The command line parameters passed to the kernel in the kexec call
> may also be measured by IMA.  A remote attestation service can verify
> a TPM quote based on the TPM event log, the IMA measurement list, and
> the TPM PCR data.  This can be achieved only if the IMA measurement log
> is carried over from the current kernel to the next kernel across
> the kexec call.
>
> powerpc already supports carrying forward the IMA measurement log on
> kexec.  This patch set adds support for carrying forward the IMA
> measurement log on kexec on ARM64.
>
> This patch set moves the platform independent code defined for powerpc
> such that it can be reused for other platforms as well.  A chosen node
> "linux,ima-kexec-buffer" is added to the DTB for ARM64 to hold
> the address and the size of the memory reserved to carry
> the IMA measurement log.
>
> This patch set has been tested for ARM64 platform using QEMU.
> I would like help from the community for testing this change on powerpc.
> Thanks.
>
> This patch set is based on
> commit f31e3386a4e9 ("ima: Free IMA measurement buffer after kexec syscall")
> in https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git
> "ima-kexec-fixes" branch.
>
> Changelog:
>
> v19
>   - Moved ELF related fields from "struct kimage_arch" for x86, arm64,
>     and powerpc architectures to "struct kimage".
>
> v18
>   - Added a parameter to of_kexec_alloc_and_setup_fdt() for the caller
>     to specify additional space needed for the FDT buffer
>   - Renamed arm64 and powerpc ELF buffer address field in
>     "struct kimage_arch" to elf_load_addr to match x86_64 name.
>   - Removed of_ima_add_kexec_buffer() and instead directly set
>     ima_buffer_addr and ima_buffer_size in ima_add_kexec_buffer()
>   - Moved FDT_EXTRA_SPACE definition from include/linux/of.h to
>     drivers/of/kexec.c
>
> v17
>   - Renamed of_kexec_setup_new_fdt() to of_kexec_alloc_and_setup_fdt(),
>     and moved memory allocation for the new FDT to this function.
>
> v16
>   - Defined functions to allocate and free buffer for FDT for powerpc
>     and arm64.
>   - Moved ima_buffer_addr and ima_buffer_size fields from
>     "struct kimage_arch" in powerpc to "struct kimage"
> v15
>   - Included Rob's patches in the patch set, and rebased
>     the changes to "next-integrity" branch.
>   - Allocate memory for DTB, on arm64, using kmalloc() instead of
>     vmalloc() to keep it consistent with powerpc implementation.
>   - Call of_kexec_setup_new_fdt() from setup_new_fdt_ppc64() and
>     remove setup_new_fdt() in the same patch to keep it bisect safe.
>
> v14
>   - Select CONFIG_HAVE_IMA_KEXEC for CONFIG_KEXEC_FILE, for powerpc
>     and arm64, if CONFIG_IMA is enabled.
>   - Use IS_ENABLED() macro instead of "#ifdef" in remove_ima_buffer(),
>     ima_get_kexec_buffer(), and ima_free_kexec_buffer().
>   - Call of_kexec_setup_new_fdt() from setup_new_fdt_ppc64() and
>     remove setup_new_fdt() in "arch/powerpc/kexec/file_load.c".
>
> v13
>   - Moved the arch independent functions to drivers/of/kexec.c
>     and then refactored the code.
>   - Moved arch_ima_add_kexec_buffer() to
>     security/integrity/ima/ima_kexec.c
>
> v12
>   - Use fdt_appendprop_addrrange() in setup_ima_buffer()
>     to setup the IMA measurement list property in
>     the device tree.
>   - Moved architecture independent functions from
>     "arch/powerpc/kexec/ima.c" to "drivers/of/kexec."
>   - Deleted "arch/powerpc/kexec/ima.c" and
>     "arch/powerpc/include/asm/ima.h".
>
> v11
>   - Rebased the changes on the kexec code refactoring done by
>     Rob Herring in his "dt/kexec" branch
>   - Removed "extern" keyword in function declarations
>   - Removed unnecessary header files included in C files
>   - Updated patch descriptions per Thiago's comments
>
> v10
>   - Moved delete_fdt_mem_rsv(), remove_ima_buffer(),
>     get_ima_kexec_buffer, and get_root_addr_size_cells()
>     to drivers/of/kexec.c
>   - Moved arch_ima_add_kexec_buffer() to
>     security/integrity/ima/ima_kexec.c
>   - Conditionally define IMA buffer fields in struct kimage_arch
>
> v9
>   - Moved delete_fdt_mem_rsv() to drivers/of/kexec_fdt.c
>   - Defined a new function get_ima_kexec_buffer() in
>     drivers/of/ima_kexec.c to replace do_get_kexec_buffer()
>   - Changed remove_ima_kexec_buffer() to the original function name
>     remove_ima_buffer()
>   - Moved remove_ima_buffer() to drivers/of/ima_kexec.c
>   - Moved ima_get_kexec_buffer() and ima_free_kexec_buffer()
>     to security/integrity/ima/ima_kexec.c
>
> v8:
>   - Moved remove_ima_kexec_buffer(), do_get_kexec_buffer(), and
>     delete_fdt_mem_rsv() to drivers/of/fdt.c
>   - Moved ima_dump_measurement_list() and ima_add_kexec_buffer()
>     back to security/integrity/ima/ima_kexec.c
>
> v7:
>   - Renamed remove_ima_buffer() to remove_ima_kexec_buffer() and moved
>     this function definition to kernel.
>   - Moved delete_fdt_mem_rsv() definition to kernel
>   - Moved ima_dump_measurement_list() and ima_add_kexec_buffer() to
>     a new file namely ima_kexec_fdt.c in IMA
>
> v6:
>   - Remove any existing FDT_PROP_IMA_KEXEC_BUFFER property in the device
>     tree and also its corresponding memory reservation in the currently
>     running kernel.
>   - Moved the function remove_ima_buffer() defined for powerpc to IMA
>     and renamed the function to ima_remove_kexec_buffer(). Also, moved
>     delete_fdt_mem_rsv() from powerpc to IMA.
>
> v5:
>   - Merged get_addr_size_cells() and do_get_kexec_buffer() into a single
>     function when moving the arch independent code from powerpc to IMA
>   - Reverted the change to use FDT functions in powerpc code and added
>     back the original code in get_addr_size_cells() and
>     do_get_kexec_buffer() for powerpc.
>   - Added fdt_add_mem_rsv() for ARM64 to reserve the memory for
>     the IMA log buffer during kexec.
>   - Fixed the warning reported by kernel test bot for ARM64
>     arch_ima_add_kexec_buffer() - moved this function to a new file
>     namely arch/arm64/kernel/ima_kexec.c
>
> v4:
>   - Submitting the patch series on behalf of the original author
>     Prakhar Srivastava <prsriva@linux.microsoft.com>
>   - Moved FDT_PROP_IMA_KEXEC_BUFFER ("linux,ima-kexec-buffer") to
>     libfdt.h so that it can be shared by multiple platforms.
>
> v3:
> Breakup patches further into separate patches.
>   - Refactoring non architecture specific code out of powerpc
>   - Update powerpc related code to use fdt functions
>   - Update IMA buffer read related code to use of functions
>   - Add support to store the memory information of the IMA
>     measurement logs to be carried forward.
>   - Update the property strings to align with documented nodes
>     https://github.com/devicetree-org/dt-schema/pull/46
>
> v2:
>   Break patches into separate patches.
>   - Powerpc related Refactoring
>   - Updating the docuemntation for chosen node
>   - Updating arm64 to support IMA buffer pass
>
> v1:
>   Refactoring carrying over IMA measuremnet logs over Kexec. This patch
>     moves the non-architecture specific code out of powerpc and adds to
>     security/ima.(Suggested by Thiago)
>   Add Documentation regarding the ima-kexec-buffer node in the chosen
>     node documentation
>
> v0:
>   Add a layer of abstraction to use the memory reserved by device tree
>     for ima buffer pass.
>   Add support for ima buffer pass using reserved memory for arm64 kexec.
>     Update the arch sepcific code path in kexec file load to store the
>     ima buffer in the reserved memory. The same reserved memory is read
>     on kexec or cold boot.
>
> Lakshmi Ramasubramanian (10):
>   kexec: Move ELF fields to struct kimage
>   arm64: Use ELF fields defined in 'struct kimage'
>   powerpc: Use ELF fields defined in 'struct kimage'
>   x86: Use ELF fields defined in 'struct kimage'
>   powerpc: Move ima buffer fields to struct kimage
>   powerpc: Enable passing IMA log to next kernel on kexec
>   powerpc: Move arch independent ima kexec functions to
>     drivers/of/kexec.c
>   kexec: Use fdt_appendprop_addrrange() to add ima buffer to FDT
>   powerpc: Delete unused function delete_fdt_mem_rsv()
>   arm64: Enable passing IMA log to next kernel on kexec
>
> Rob Herring (3):
>   of: Add a common kexec FDT setup function
>   arm64: Use common of_kexec_alloc_and_setup_fdt()
>   powerpc: Use common of_kexec_alloc_and_setup_fdt()
>
>  arch/arm64/Kconfig                     |   1 +
>  arch/arm64/include/asm/kexec.h         |   4 -
>  arch/arm64/kernel/machine_kexec_file.c | 194 +----------
>  arch/powerpc/Kconfig                   |   2 +-
>  arch/powerpc/include/asm/ima.h         |  30 --
>  arch/powerpc/include/asm/kexec.h       |  14 +-
>  arch/powerpc/kexec/Makefile            |   7 -
>  arch/powerpc/kexec/elf_64.c            |  30 +-
>  arch/powerpc/kexec/file_load.c         | 183 +---------
>  arch/powerpc/kexec/file_load_64.c      |  21 +-
>  arch/powerpc/kexec/ima.c               | 219 ------------
>  arch/x86/include/asm/kexec.h           |   5 -
>  arch/x86/kernel/crash.c                |  14 +-
>  arch/x86/kernel/kexec-bzimage64.c      |   2 +-
>  arch/x86/kernel/machine_kexec_64.c     |   4 +-
>  drivers/of/Makefile                    |   6 +
>  drivers/of/kexec.c                     | 458 +++++++++++++++++++++++++
>  include/linux/kexec.h                  |   8 +
>  include/linux/of.h                     |   7 +
>  security/integrity/ima/ima.h           |   4 -
>  security/integrity/ima/ima_kexec.c     |   9 +-
>  21 files changed, 539 insertions(+), 683 deletions(-)
>  delete mode 100644 arch/powerpc/include/asm/ima.h
>  delete mode 100644 arch/powerpc/kexec/ima.c
>  create mode 100644 drivers/of/kexec.c

I fixed up the Fixes tags and applied for 5.13.

Rob
