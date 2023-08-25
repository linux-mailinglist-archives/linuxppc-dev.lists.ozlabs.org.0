Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5481E78816D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 10:03:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=avm.de header.i=@avm.de header.a=rsa-sha256 header.s=mail header.b=XFqyNHja;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXCB51P5yz3cRn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 18:03:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=avm.de header.i=@avm.de header.a=rsa-sha256 header.s=mail header.b=XFqyNHja;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=avm.de (client-ip=2001:bf0:244:244::120; helo=mail.avm.de; envelope-from=n.schier@avm.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 341 seconds by postgrey-1.37 at boromir; Fri, 25 Aug 2023 15:50:05 AEST
Received: from mail.avm.de (mail.avm.de [IPv6:2001:bf0:244:244::120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RX8DY6RdKz304l
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 15:50:05 +1000 (AEST)
Received: from mail-auth.avm.de (unknown [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Fri, 25 Aug 2023 07:44:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1692942245; bh=tcszGXLJqnIKgv4Cf1eh8AzpwePa5cbpNCNUij16nOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XFqyNHja6LtbVcMRS5jLx8KIkWuDvEXHhrIj5Mja1PqfjFygkdVhI+Vr9BtJtn0/J
	 UrdCL7jma94Ywo+olqtvv2bi2/yAXUb10V3MtNyt8F/T6fyk6CPkFR6DGw0YR+W4ht
	 wf3KHrhGTjzctueXJQ74MMHQy/qokFXo3T1uME7g=
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id 767158014B;
	Fri, 25 Aug 2023 07:44:06 +0200 (CEST)
Received: by buildd.core.avm.de (Postfix, from userid 1000)
	id 6AB33180E84; Fri, 25 Aug 2023 07:44:06 +0200 (CEST)
Date: Fri, 25 Aug 2023 07:44:06 +0200
From: Nicolas Schier <n.schier@avm.de>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] kbuild: Show Kconfig fragments in "help"
Message-ID: <ZOg/pqoqhp/3rerZ@buildd.core.avm.de>
References: <20230824223606.never.762-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230824223606.never.762-kees@kernel.org>
X-purgate-ID: 149429::1692942245-BD45DE49-39AB1DA5/0/0
X-purgate-type: clean
X-purgate-size: 21379
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean
X-Mailman-Approved-At: Fri, 25 Aug 2023 18:02:24 +1000
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
Cc: linux-s390@vger.kernel.org, linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 24, 2023 at 03:36:10PM -0700, Kees Cook wrote:
> Doing a "make help" would show only hard-coded Kconfig targets and
> depended on the archhelp target to include ".config" targets. There was
> nothing showing global kernel/configs/ targets. Solve this by walking
> the wildcard list and include them in the output, using the first comment
> line as the help text.
> 
> Update all Kconfig fragments to include help text and adjust archhelp
> targets to avoid redundancy.
> 
> Adds the following section to "help" target output:
> 
> Configuration fragment targets (for enabling various Kconfig items):
>   debug.config         - Debugging for CI systems and finding regressions
>   kvm_guest.config     - Bootable as a KVM guest
>   nopm.config          - Disable Power Management
>   rust.config          - Enable Rust
>   tiny-base.config     - Minimal options for tiny systems
>   tiny.config          - Smallest possible kernel image
>   x86_debug.config     - Debugging options for tip tree testing
>   xen.config           - Bootable as a Xen guest
>   tiny.config          - x86-specific options for a small kernel image
>   xen.config           - x86-specific options for a Xen virtualization guest
> 
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: x86@kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---

Thanks for that patch!  Several times I found myself searching the tree
to find a specific kconfig fragment; I think you found a nice solution.
Two minor things below.

>  Makefile                                   |  1 -
>  arch/arm/configs/dram_0x00000000.config    |  1 +
>  arch/arm/configs/dram_0xc0000000.config    |  1 +
>  arch/arm/configs/dram_0xd0000000.config    |  1 +
>  arch/arm/configs/lpae.config               |  1 +
>  arch/arm64/configs/virt.config             |  1 +
>  arch/powerpc/configs/32-bit.config         |  1 +
>  arch/powerpc/configs/64-bit.config         |  1 +
>  arch/powerpc/configs/85xx-32bit.config     |  1 +
>  arch/powerpc/configs/85xx-64bit.config     |  1 +
>  arch/powerpc/configs/85xx-hw.config        |  1 +
>  arch/powerpc/configs/85xx-smp.config       |  1 +
>  arch/powerpc/configs/86xx-hw.config        |  1 +
>  arch/powerpc/configs/86xx-smp.config       |  1 +
>  arch/powerpc/configs/altivec.config        |  1 +
>  arch/powerpc/configs/be.config             |  1 +
>  arch/powerpc/configs/book3s_32.config      |  1 +
>  arch/powerpc/configs/corenet_base.config   |  1 +
>  arch/powerpc/configs/debug.config          |  1 +
>  arch/powerpc/configs/disable-werror.config |  1 +
>  arch/powerpc/configs/dpaa.config           |  1 +
>  arch/powerpc/configs/fsl-emb-nonhw.config  |  1 +
>  arch/powerpc/configs/guest.config          |  1 +
>  arch/powerpc/configs/le.config             |  1 +
>  arch/powerpc/configs/mpc85xx_base.config   |  1 +
>  arch/powerpc/configs/mpc86xx_base.config   |  1 +
>  arch/powerpc/configs/ppc64le.config        |  1 +
>  arch/powerpc/configs/security.config       |  4 +++-
>  arch/riscv/configs/32-bit.config           |  1 +
>  arch/riscv/configs/64-bit.config           |  1 +
>  arch/s390/configs/btf.config               |  1 +
>  arch/s390/configs/kasan.config             |  1 +
>  arch/x86/Makefile                          |  4 ----
>  arch/x86/configs/tiny.config               |  2 ++
>  arch/x86/configs/xen.config                |  2 ++
>  kernel/configs/debug.config                |  2 ++
>  kernel/configs/kvm_guest.config            |  1 +
>  kernel/configs/nopm.config                 |  2 ++
>  kernel/configs/rust.config                 |  1 +
>  kernel/configs/tiny-base.config            |  1 +
>  kernel/configs/tiny.config                 |  2 ++
>  kernel/configs/x86_debug.config            |  1 +
>  kernel/configs/xen.config                  |  2 ++
>  scripts/kconfig/Makefile                   | 13 ++++++++++---
>  44 files changed, 59 insertions(+), 9 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 4739c21a63e2..91c90ce8e0e3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1674,7 +1674,6 @@ help:
>  	@echo  '  mrproper	  - Remove all generated files + config + various backup files'
>  	@echo  '  distclean	  - mrproper + remove editor backup and patch files'
>  	@echo  ''
> -	@echo  'Configuration targets:'
>  	@$(MAKE) -f $(srctree)/scripts/kconfig/Makefile help
>  	@echo  ''
>  	@echo  'Other generic targets:'
> diff --git a/arch/arm/configs/dram_0x00000000.config b/arch/arm/configs/dram_0x00000000.config
> index db96dcb420ce..4de3fde0de9a 100644
> --- a/arch/arm/configs/dram_0x00000000.config
> +++ b/arch/arm/configs/dram_0x00000000.config
> @@ -1 +1,2 @@
> +# DRAM base at 0x00000000
>  CONFIG_DRAM_BASE=0x00000000
> diff --git a/arch/arm/configs/dram_0xc0000000.config b/arch/arm/configs/dram_0xc0000000.config
> index 343d5333d973..fdd4c7b1461e 100644
> --- a/arch/arm/configs/dram_0xc0000000.config
> +++ b/arch/arm/configs/dram_0xc0000000.config
> @@ -1 +1,2 @@
> +# DRAM base at 0xc0000000
>  CONFIG_DRAM_BASE=0xc0000000
> diff --git a/arch/arm/configs/dram_0xd0000000.config b/arch/arm/configs/dram_0xd0000000.config
> index 61ba7045f8a1..54defdc8d24c 100644
> --- a/arch/arm/configs/dram_0xd0000000.config
> +++ b/arch/arm/configs/dram_0xd0000000.config
> @@ -1 +1,2 @@
> +# DRAM base at 0xd0000000
>  CONFIG_DRAM_BASE=0xd0000000
> diff --git a/arch/arm/configs/lpae.config b/arch/arm/configs/lpae.config
> index a6d6f7ab3c01..e8d3cd8f1e4b 100644
> --- a/arch/arm/configs/lpae.config
> +++ b/arch/arm/configs/lpae.config
> @@ -1,2 +1,3 @@
> +# Enable Large Physical Address Extension mode
>  CONFIG_ARM_LPAE=y
>  CONFIG_VMSPLIT_2G=y
> diff --git a/arch/arm64/configs/virt.config b/arch/arm64/configs/virt.config
> index 6865d54e68f8..83333a9aa1a5 100644
> --- a/arch/arm64/configs/virt.config
> +++ b/arch/arm64/configs/virt.config
> @@ -1,3 +1,4 @@
> +# Virtualization guest
>  #
>  # Base options for platforms
>  #
> diff --git a/arch/powerpc/configs/32-bit.config b/arch/powerpc/configs/32-bit.config
> index ad6546850c68..1a4c93a17007 100644
> --- a/arch/powerpc/configs/32-bit.config
> +++ b/arch/powerpc/configs/32-bit.config
> @@ -1 +1,2 @@
> +# Build a 32-bit image
>  # CONFIG_PPC64 is not set
> diff --git a/arch/powerpc/configs/64-bit.config b/arch/powerpc/configs/64-bit.config
> index 0fe6406929e2..cc371309bb0c 100644
> --- a/arch/powerpc/configs/64-bit.config
> +++ b/arch/powerpc/configs/64-bit.config
> @@ -1 +1,2 @@
> +# Build a 64-bit image
>  CONFIG_PPC64=y
> diff --git a/arch/powerpc/configs/85xx-32bit.config b/arch/powerpc/configs/85xx-32bit.config
> index 6b8894d727a2..866e77e22762 100644
> --- a/arch/powerpc/configs/85xx-32bit.config
> +++ b/arch/powerpc/configs/85xx-32bit.config
> @@ -1,3 +1,4 @@
> +# Build a 32-bit 85xx image
>  CONFIG_HIGHMEM=y
>  CONFIG_KEXEC=y
>  CONFIG_PPC_85xx=y
> diff --git a/arch/powerpc/configs/85xx-64bit.config b/arch/powerpc/configs/85xx-64bit.config
> index 4aba81222885..cca4151ee889 100644
> --- a/arch/powerpc/configs/85xx-64bit.config
> +++ b/arch/powerpc/configs/85xx-64bit.config
> @@ -1,3 +1,4 @@
> +# Build a 64-bit 85xx image
>  CONFIG_MATH_EMULATION=y
>  CONFIG_MATH_EMULATION_HW_UNIMPLEMENTED=y
>  CONFIG_PPC64=y
> diff --git a/arch/powerpc/configs/85xx-hw.config b/arch/powerpc/configs/85xx-hw.config
> index 524db76f47b7..76b22f8a8172 100644
> --- a/arch/powerpc/configs/85xx-hw.config
> +++ b/arch/powerpc/configs/85xx-hw.config
> @@ -1,3 +1,4 @@
> +# Base hardware support for 86xx
>  CONFIG_AQUANTIA_PHY=y
>  CONFIG_AT803X_PHY=y
>  CONFIG_ATA=y
> diff --git a/arch/powerpc/configs/85xx-smp.config b/arch/powerpc/configs/85xx-smp.config
> index 3b4d1e54636d..d3525e71cb2f 100644
> --- a/arch/powerpc/configs/85xx-smp.config
> +++ b/arch/powerpc/configs/85xx-smp.config
> @@ -1,2 +1,3 @@
> +# Enable SMP on 85xx
>  CONFIG_NR_CPUS=24
>  CONFIG_SMP=y
> diff --git a/arch/powerpc/configs/86xx-hw.config b/arch/powerpc/configs/86xx-hw.config
> index 0cb24b33c88e..7b8d9f9c3c01 100644
> --- a/arch/powerpc/configs/86xx-hw.config
> +++ b/arch/powerpc/configs/86xx-hw.config
> @@ -1,3 +1,4 @@
> +# Base hardware support for 86xx
>  CONFIG_ATA=y
>  CONFIG_BLK_DEV_SD=y
>  CONFIG_BLK_DEV_SR=y
> diff --git a/arch/powerpc/configs/86xx-smp.config b/arch/powerpc/configs/86xx-smp.config
> index 40ac38d3038c..e6cd06a35624 100644
> --- a/arch/powerpc/configs/86xx-smp.config
> +++ b/arch/powerpc/configs/86xx-smp.config
> @@ -1,2 +1,3 @@
> +# Enable SMP on 86xx
>  CONFIG_NR_CPUS=2
>  CONFIG_SMP=y
> diff --git a/arch/powerpc/configs/altivec.config b/arch/powerpc/configs/altivec.config
> index 58a697cb5a62..1c8eb9b23a7f 100644
> --- a/arch/powerpc/configs/altivec.config
> +++ b/arch/powerpc/configs/altivec.config
> @@ -1 +1,2 @@
> +# Enable Altivec support
>  CONFIG_ALTIVEC=y
> diff --git a/arch/powerpc/configs/be.config b/arch/powerpc/configs/be.config
> index c5cdc99a6530..568bba8ea109 100644
> --- a/arch/powerpc/configs/be.config
> +++ b/arch/powerpc/configs/be.config
> @@ -1 +1,2 @@
> +# Enable Big Endian mode
>  CONFIG_CPU_BIG_ENDIAN=y
> diff --git a/arch/powerpc/configs/book3s_32.config b/arch/powerpc/configs/book3s_32.config
> index 8721eb7b1294..f33483f077db 100644
> --- a/arch/powerpc/configs/book3s_32.config
> +++ b/arch/powerpc/configs/book3s_32.config
> @@ -1,2 +1,3 @@
> +# Base support for Book3s
>  CONFIG_PPC64=n
>  CONFIG_PPC_BOOK3S_32=y
> diff --git a/arch/powerpc/configs/corenet_base.config b/arch/powerpc/configs/corenet_base.config
> index 1c40de1e764b..47bb6e25c90b 100644
> --- a/arch/powerpc/configs/corenet_base.config
> +++ b/arch/powerpc/configs/corenet_base.config
> @@ -1,2 +1,3 @@
> +# Base support for corenet
>  CONFIG_CORENET_GENERIC=y
>  CONFIG_PPC_QEMU_E500=y
> diff --git a/arch/powerpc/configs/debug.config b/arch/powerpc/configs/debug.config
> index a14ae1f20d60..223b8a2ee8ec 100644
> --- a/arch/powerpc/configs/debug.config
> +++ b/arch/powerpc/configs/debug.config
> @@ -1 +1,2 @@
> +# Enable PowerPC specific debug options
>  CONFIG_SCOM_DEBUGFS=y
> diff --git a/arch/powerpc/configs/disable-werror.config b/arch/powerpc/configs/disable-werror.config
> index 6ea12a12432c..76a7847f39ce 100644
> --- a/arch/powerpc/configs/disable-werror.config
> +++ b/arch/powerpc/configs/disable-werror.config
> @@ -1 +1,2 @@
> +# Disable -Werror
>  CONFIG_PPC_DISABLE_WERROR=y
> diff --git a/arch/powerpc/configs/dpaa.config b/arch/powerpc/configs/dpaa.config
> index 4ffacafe4036..65a13ba32813 100644
> --- a/arch/powerpc/configs/dpaa.config
> +++ b/arch/powerpc/configs/dpaa.config
> @@ -1,3 +1,4 @@
> +# Base suppot for DPPA
>  CONFIG_FSL_DPAA=y
>  CONFIG_FSL_PAMU=y
>  CONFIG_FSL_FMAN=y
> diff --git a/arch/powerpc/configs/fsl-emb-nonhw.config b/arch/powerpc/configs/fsl-emb-nonhw.config
> index 3009b0efaf34..d1249996cf45 100644
> --- a/arch/powerpc/configs/fsl-emb-nonhw.config
> +++ b/arch/powerpc/configs/fsl-emb-nonhw.config
> @@ -1,3 +1,4 @@
> +# Non-hardware options common to 85xx and corenet
>  CONFIG_ADFS_FS=m
>  CONFIG_AFFS_FS=m
>  CONFIG_AUDIT=y
> diff --git a/arch/powerpc/configs/guest.config b/arch/powerpc/configs/guest.config
> index fece83487215..f04ababbb35a 100644
> --- a/arch/powerpc/configs/guest.config
> +++ b/arch/powerpc/configs/guest.config
> @@ -1,3 +1,4 @@
> +# PowerPC specific virtualization guest options
>  CONFIG_VIRTIO_BLK=y
>  CONFIG_SCSI_VIRTIO=y
>  CONFIG_VIRTIO_NET=y
> diff --git a/arch/powerpc/configs/le.config b/arch/powerpc/configs/le.config
> index ee43fdb3b8f4..bcf657e1d21f 100644
> --- a/arch/powerpc/configs/le.config
> +++ b/arch/powerpc/configs/le.config
> @@ -1 +1,2 @@
> +# Enable Little Endian mode
>  CONFIG_CPU_LITTLE_ENDIAN=y
> diff --git a/arch/powerpc/configs/mpc85xx_base.config b/arch/powerpc/configs/mpc85xx_base.config
> index a1e4d72ed39d..20ecf6575c5c 100644
> --- a/arch/powerpc/configs/mpc85xx_base.config
> +++ b/arch/powerpc/configs/mpc85xx_base.config
> @@ -1,3 +1,4 @@
> +# Base mpc85xxx support
>  CONFIG_MATH_EMULATION=y
>  CONFIG_MPC8536_DS=y
>  CONFIG_MPC85xx_DS=y
> diff --git a/arch/powerpc/configs/mpc86xx_base.config b/arch/powerpc/configs/mpc86xx_base.config
> index 632c014b122d..8239d1e7785d 100644
> --- a/arch/powerpc/configs/mpc86xx_base.config
> +++ b/arch/powerpc/configs/mpc86xx_base.config
> @@ -1,3 +1,4 @@
> +# Base mpc85xxx support
>  CONFIG_PPC_86xx=y
>  CONFIG_GEF_PPC9A=y
>  CONFIG_GEF_SBC310=y
> diff --git a/arch/powerpc/configs/ppc64le.config b/arch/powerpc/configs/ppc64le.config
> index 14dca1062c1b..ac3614cd7926 100644
> --- a/arch/powerpc/configs/ppc64le.config
> +++ b/arch/powerpc/configs/ppc64le.config
> @@ -1,2 +1,3 @@
> +# Enable ppc64le mode
>  CONFIG_PPC64=y
>  CONFIG_CPU_LITTLE_ENDIAN=y
> diff --git a/arch/powerpc/configs/security.config b/arch/powerpc/configs/security.config
> index 1c91a35c6a73..f47034955d12 100644
> --- a/arch/powerpc/configs/security.config
> +++ b/arch/powerpc/configs/security.config
> @@ -1,3 +1,5 @@
> +# Common security options for PowerPC builds
> +
>  # This is the equivalent of booting with lockdown=integrity
>  CONFIG_SECURITY=y
>  CONFIG_SECURITYFS=y
> @@ -12,4 +14,4 @@ CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
>  
>  # UBSAN bounds checking is very cheap and good for hardening
>  CONFIG_UBSAN=y
> -# CONFIG_UBSAN_MISC is not set
> \ No newline at end of file
> +# CONFIG_UBSAN_MISC is not set
> diff --git a/arch/riscv/configs/32-bit.config b/arch/riscv/configs/32-bit.config
> index f6af0f708df4..60dfa2809b19 100644
> --- a/arch/riscv/configs/32-bit.config
> +++ b/arch/riscv/configs/32-bit.config
> @@ -1,3 +1,4 @@
> +# Build a 32-bit image
>  CONFIG_ARCH_RV32I=y
>  CONFIG_32BIT=y
>  # CONFIG_PORTABLE is not set
> diff --git a/arch/riscv/configs/64-bit.config b/arch/riscv/configs/64-bit.config
> index 313edc554d84..31a1ad138944 100644
> --- a/arch/riscv/configs/64-bit.config
> +++ b/arch/riscv/configs/64-bit.config
> @@ -1,2 +1,3 @@
> +# Build a 64-bit image
>  CONFIG_ARCH_RV64I=y
>  CONFIG_64BIT=y
> diff --git a/arch/s390/configs/btf.config b/arch/s390/configs/btf.config
> index 39227b4511af..c69b1a370990 100644
> --- a/arch/s390/configs/btf.config
> +++ b/arch/s390/configs/btf.config
> @@ -1 +1,2 @@
> +# Enable BTF debug info
>  CONFIG_DEBUG_INFO_BTF=y
> diff --git a/arch/s390/configs/kasan.config b/arch/s390/configs/kasan.config
> index 700a8b25c3ff..da2e1f28c13c 100644
> --- a/arch/s390/configs/kasan.config
> +++ b/arch/s390/configs/kasan.config
> @@ -1,3 +1,4 @@
> +# Enable KASan for debugging
>  CONFIG_KASAN=y
>  CONFIG_KASAN_INLINE=y
>  CONFIG_KASAN_VMALLOC=y
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index fdc2e3abd615..c4b2a8a19fc8 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -335,9 +335,5 @@ define archhelp
>    echo  '			  bzdisk/fdimage*/hdimage/isoimage also accept:'
>    echo  '			  FDARGS="..."  arguments for the booted kernel'
>    echo  '			  FDINITRD=file initrd for the booted kernel'
> -  echo  ''
> -  echo  '  kvm_guest.config	- Enable Kconfig items for running this kernel as a KVM guest'
> -  echo  '  xen.config		- Enable Kconfig items for running this kernel as a Xen guest'
> -  echo  '  x86_debug.config	- Enable tip tree debugging options for testing'
>  
>  endef
> diff --git a/arch/x86/configs/tiny.config b/arch/x86/configs/tiny.config
> index 66c9e2aab16c..4b75a11369e3 100644
> --- a/arch/x86/configs/tiny.config
> +++ b/arch/x86/configs/tiny.config
> @@ -1,3 +1,5 @@
> +# x86-specific options for a small kernel image
> +#
>  CONFIG_NOHIGHMEM=y
>  # CONFIG_HIGHMEM4G is not set
>  # CONFIG_HIGHMEM64G is not set
> diff --git a/arch/x86/configs/xen.config b/arch/x86/configs/xen.config
> index 581296255b39..46653ec602e0 100644
> --- a/arch/x86/configs/xen.config
> +++ b/arch/x86/configs/xen.config
> @@ -1,3 +1,5 @@
> +# x86-specific options for a Xen virtualization guest
> +#
>  # global x86 required specific stuff
>  # On 32-bit HIGHMEM4G is not allowed
>  CONFIG_HIGHMEM64G=y
> diff --git a/kernel/configs/debug.config b/kernel/configs/debug.config
> index e8db8d938661..874afe2cd7c0 100644
> --- a/kernel/configs/debug.config
> +++ b/kernel/configs/debug.config
> @@ -1,3 +1,5 @@
> +# Debugging for CI systems and finding regressions
> +#
>  # The config is based on running daily CI for enterprise Linux distros to
>  # seek regressions on linux-next builds on different bare-metal and virtual
>  # platforms. It can be used for example,
> diff --git a/kernel/configs/kvm_guest.config b/kernel/configs/kvm_guest.config
> index 208481d91090..3cc2810147da 100644
> --- a/kernel/configs/kvm_guest.config
> +++ b/kernel/configs/kvm_guest.config
> @@ -1,3 +1,4 @@
> +# Bootable as a KVM guest
>  CONFIG_NET=y
>  CONFIG_NET_CORE=y
>  CONFIG_NETDEVICES=y
> diff --git a/kernel/configs/nopm.config b/kernel/configs/nopm.config
> index 81ff07863576..a377c5914218 100644
> --- a/kernel/configs/nopm.config
> +++ b/kernel/configs/nopm.config
> @@ -1,3 +1,5 @@
> +# Disable Power Management
> +
>  CONFIG_PM=n
>  CONFIG_SUSPEND=n
>  CONFIG_HIBERNATION=n
> diff --git a/kernel/configs/rust.config b/kernel/configs/rust.config
> index 38a7c5362c9c..941c69c161ad 100644
> --- a/kernel/configs/rust.config
> +++ b/kernel/configs/rust.config
> @@ -1 +1,2 @@
> +# Enable Rust
>  CONFIG_RUST=y
> diff --git a/kernel/configs/tiny-base.config b/kernel/configs/tiny-base.config
> index 2f0e6bf6db2c..ac4d254abc3f 100644
> --- a/kernel/configs/tiny-base.config
> +++ b/kernel/configs/tiny-base.config
> @@ -1 +1,2 @@
> +# Minimal options for tiny systems
>  CONFIG_EMBEDDED=y

(just a note: Randy prepared a patch for removing CONFIG_EMBEDDED:
https://lore.kernel.org/linux-kbuild/20230816055010.31534-1-rdunlap@infradead.org/)

> diff --git a/kernel/configs/tiny.config b/kernel/configs/tiny.config
> index 00009f7d0835..ea643e8f7f14 100644
> --- a/kernel/configs/tiny.config
> +++ b/kernel/configs/tiny.config
> @@ -1,3 +1,5 @@
> +# Smallest possible kernel image

For this fragment alone (not within 'tinyconfig'), "Size-optimize kernel
image" possibly fits better?

> +#
>  # CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
>  CONFIG_CC_OPTIMIZE_FOR_SIZE=y
>  # CONFIG_KERNEL_GZIP is not set
> diff --git a/kernel/configs/x86_debug.config b/kernel/configs/x86_debug.config
> index 6fac5b405334..8a1129a1d59a 100644
> --- a/kernel/configs/x86_debug.config
> +++ b/kernel/configs/x86_debug.config
> @@ -1,3 +1,4 @@
> +# Debugging options for tip tree testing
>  CONFIG_X86_DEBUG_FPU=y
>  CONFIG_LOCK_STAT=y
>  CONFIG_DEBUG_VM=y
> diff --git a/kernel/configs/xen.config b/kernel/configs/xen.config
> index 436f806aa1ed..d14880177fd2 100644
> --- a/kernel/configs/xen.config
> +++ b/kernel/configs/xen.config
> @@ -1,3 +1,5 @@
> +# Bootable as a Xen guest
> +#
>  # global stuff - these enable us to allow some
>  # of the not so generic stuff below for xen
>  CONFIG_PARAVIRT=y
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index af1c96198f49..c523f24b504a 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -93,11 +93,11 @@ endif
>  %_defconfig: $(obj)/conf
>  	$(Q)$< $(silent) --defconfig=arch/$(SRCARCH)/configs/$@ $(Kconfig)
>  
> -configfiles=$(wildcard $(srctree)/kernel/configs/$@ $(srctree)/arch/$(SRCARCH)/configs/$@)
> +configfiles=$(wildcard $(srctree)/kernel/configs/$(1) $(srctree)/arch/$(SRCARCH)/configs/$(1))
>  
>  %.config: $(obj)/conf
> -	$(if $(call configfiles),, $(error No configuration exists for this target on this architecture))
> -	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m .config $(configfiles)
> +	$(if $(call configfiles,$@),, $(error No configuration exists for this target on this architecture))
> +	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m .config $(call configfiles,$@)
>  	$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
>  
>  PHONY += tinyconfig
> @@ -115,6 +115,7 @@ clean-files += tests/.cache
>  
>  # Help text used by make help
>  help:
> +	@echo  'Configuration targets:'
>  	@echo  '  config	  - Update current config utilising a line-oriented program'
>  	@echo  '  nconfig         - Update current config utilising a ncurses menu based program'
>  	@echo  '  menuconfig	  - Update current config utilising a menu based program'
> @@ -141,6 +142,12 @@ help:
>  	@echo  '                    default value without prompting'
>  	@echo  '  tinyconfig	  - Configure the tiniest possible kernel'
>  	@echo  '  testconfig	  - Run Kconfig unit tests (requires python3 and pytest)'
> +	@echo  ''
> +	@echo  'Configuration fragment targets (for enabling various Kconfig items):'
> +	@$(foreach c, $(call configfiles,*.config), \
> +		printf "  %-20s - %s\\n" \
> +			$(shell basename $(c)) \
> +			"$(subst # ,,$(shell grep -m1 '^# ' $(c)))";)

Better use '$(notdir $(c))` instead of forking a shell with
'$(shell basename $(c))'.

Kind regards,
Nicolas
