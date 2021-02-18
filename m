Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 877D531E3D5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Feb 2021 02:26:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dgxqk4XgNz3cHZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Feb 2021 12:26:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.177;
 helo=mail-oi1-f177.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DgxqL6mQwz30Hg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Feb 2021 12:25:48 +1100 (AEDT)
Received: by mail-oi1-f177.google.com with SMTP id v193so239011oie.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Feb 2021 17:25:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iNtR1+93qGiVvdTevWOQDis3P/Hn4HTusetEul7VNNU=;
 b=oHmovNtsgrjDFqDC8rMhZrZs1+H4OLGSMkjk96L6PLh/kJNqIDbKaDDUPQXmkM5pfD
 /3C051vV6TrN6zck5C4JqsJuv+ydiz53OrKUX1jBi67ub2vlZMGcffdnYHL2CUX6cYpc
 kegyP+ZI/RdooN9WdcGpa7J6cixtKkTqVJIToe0OYF7MXq890k9pNgBfsZrkwaGIPpqx
 1KfDt76LF6H9/VepNVowvaScmrlyRPYrxt3cIxLyzYm7gqiS0H21vGjyj14G+3TJVKMc
 aowYAFa0CNP7bv9dswGfOawqB/sR5Xs7yUtFwhLzMl0FW0QgGW3ziY7hdQLs881EsFAD
 ytLg==
X-Gm-Message-State: AOAM532MjnNxIl+E0rpwFQY/TAkT/pItzTSV93jftTt/YeI1F3bAqB2E
 25CDFm1eZtPlxF80+L/urg==
X-Google-Smtp-Source: ABdhPJxlWmWL7CcYv4EcrHGqHyxQN2Eh+W2H2Icgmn3Z5ZgxZqS/+8yWhHMVHsHbPdqCa5Nom/bD6g==
X-Received: by 2002:aca:48c:: with SMTP id 134mr1091401oie.16.1613611544793;
 Wed, 17 Feb 2021 17:25:44 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h21sm396907otm.45.2021.02.17.17.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 17:25:43 -0800 (PST)
Received: (nullmailer pid 3365284 invoked by uid 1000);
 Thu, 18 Feb 2021 01:25:41 -0000
Date: Wed, 17 Feb 2021 19:25:41 -0600
From: Rob Herring <robh@kernel.org>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Subject: Re: [PATCH v18 00/10] Carry forward IMA measurement log on kexec on
 ARM64
Message-ID: <20210218012541.GA3001280@robh.at.kernel.org>
References: <20210213161049.6190-1-nramas@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210213161049.6190-1-nramas@linux.microsoft.com>
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
Cc: mark.rutland@arm.com, tao.li@vivo.com, zohar@linux.ibm.com,
 paulus@samba.org, vincenzo.frascino@arm.com, frowand.list@gmail.com,
 sashal@kernel.org, masahiroy@kernel.org, jmorris@namei.org,
 takahiro.akashi@linaro.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, serge@hallyn.com, devicetree@vger.kernel.org,
 pasha.tatashin@soleen.com, will@kernel.org, prsriva@linux.microsoft.com,
 hsinyi@chromium.org, allison@lohutok.net, christophe.leroy@c-s.fr,
 mbrugger@suse.com, balajib@linux.microsoft.com, dmitry.kasatkin@gmail.com,
 linux-kernel@vger.kernel.org, james.morse@arm.com, gregkh@linuxfoundation.org,
 joe@perches.com, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Feb 13, 2021 at 08:10:38AM -0800, Lakshmi Ramasubramanian wrote:
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
> Lakshmi Ramasubramanian (7):
>   arm64: Rename kexec elf_headers_mem to elf_load_addr
>   powerpc: Move ima buffer fields to struct kimage
>   powerpc: Enable passing IMA log to next kernel on kexec
>   powerpc: Move arch independent ima kexec functions to
>     drivers/of/kexec.c
>   kexec: Use fdt_appendprop_addrrange() to add ima buffer to FDT
>   powerpc: Delete unused function delete_fdt_mem_rsv()
>   arm64: Enable passing IMA log to next kernel on kexec
> 
> Rob Herring (4):
>   powerpc: Rename kexec elfcorehdr_addr to elf_load_addr
>   of: Add a common kexec FDT setup function
>   arm64: Use common of_kexec_alloc_and_setup_fdt()
>   powerpc: Use common of_kexec_alloc_and_setup_fdt()

I've applied the series. The merge conflict is not too bad, but will 
need a follow on patch to change the powerpc FDT size calculation 
(dropping the current FDT's size out).

Thanks for persisting!

Rob
