Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8905E790922
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Sep 2023 20:27:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.a=rsa-sha256 header.s=mail header.b=tgkV8s31;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RdNgB3YmYz3bt0
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Sep 2023 04:27:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.a=rsa-sha256 header.s=mail header.b=tgkV8s31;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fjasle.eu (client-ip=212.227.17.13; helo=mout.kundenserver.de; envelope-from=nicolas@fjasle.eu; receiver=lists.ozlabs.org)
X-Greylist: delayed 413 seconds by postgrey-1.37 at boromir; Sun, 03 Sep 2023 04:25:51 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RdNcw03Nhz2yTN
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Sep 2023 04:25:43 +1000 (AEST)
Received: from leknes.fjasle.eu ([46.142.97.142]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M734j-1qaYAu2qDv-008bB2; Sat, 02 Sep 2023 20:17:23 +0200
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
	id 66BFD3E7CF; Sat,  2 Sep 2023 20:17:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
	t=1693678633; bh=vCsU+NGaCbGrP3AqfWX0lAq2DjtlpPEG/DJ+y8WLFII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tgkV8s31eprW5xwkuf5oLOjDdDPsZBMj4GdFXgwl7iDO8gOGwwoj0/lLd1eZHF1wl
	 SmWaZxqmSZ/aQ//95T8jgqImn8wBJxkvhqp3O4+5UkeUQPGhvQBGEdlHVwJSiBol6S
	 Jz14ko4YXjfilUUx8HzXqQsIHHhkvZHK3w6qcses=
Date: Sat, 2 Sep 2023 20:17:13 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v3] kbuild: Show marked Kconfig fragments in "help"
Message-ID: <ZPN8KR0y8Lt9qdU0@fjasle.eu>
References: <20230831191335.give.534-kees@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j3wV1wIO6QybvNFQ"
Content-Disposition: inline
In-Reply-To: <20230831191335.give.534-kees@kernel.org>
X-Provags-ID: V03:K1:KMiay8mTHAqSXQblMJW7uODogU4Iyb0NWQybQRYXpygfTrifc8O
 O/xVnZa/fOD7n5Qr63l2UBgOUe9EAeC1sDLgSnRWWXiXhJxwUZ8fkcdige7JPbMiNf6URLN
 ZGCiX+1DQe/E+eby+iPOyNUPfhRT1PlQoCNdHcMV+cujL7xwbmvlogXhvXZB8DDCsPm3sjJ
 A7LyDGvggaTOvaXjxDing==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jKh4ZjW95HM=;f+rx+WKxyTKrLU+fAtkjcCM5/sH
 y2YjYe49b3nKNPPEPnb3ZZ940cvg7s0MXQk+bnVv1dkSUJ/68knS06zLp2g5eu33VPpj9U7Tg
 h9HBRz3p3E8pviaywMZ5Y5049idFdlVKq7vz1fE0gVgsHU7KrFkvl/vHu/6SWNcICPARYlEag
 71rTT3BXiWpFw9ekGbwK4fNe2NLGBAxf/u5cL+qFxc3ZjRwKGMY2cFG8OrUmAhXGPtd1ubV5W
 z55/26ciyInvll1xzCya4C81PQvGAacPKuBIW0MOlsG46h/xoZ+O1WndqZdKnFjB3cZSZpzlw
 DDd+M4ongkOp9kN4g0H/MLqTsEBPUdKzTfqCazSovdX+WdgG7kB1yxI4AUawesTvlhwWtnepk
 veRBeLCoi+/YaxwI8CcF4oo7Iracgxl36ut6sqTohET/sce11RX5PL9NEXUyC3sHoWYvg0TUD
 FJvsC+Jj9TP/5BQWn+tjOc3U+zfxR3UOu/UmNl6y279rYOEyyHiXTTkmcIW5ISZKcTYWCn8Dy
 tEfDQ2p9GMwgL701Mr7YpZeGPXKtJK0frVsB2fdAnnNjhFNR4+LGbADNrCLSqjgln0Ym4wZtT
 H2xtMFXVFzjlpgedcI0CMa/q5uuRWMQ17EEfr1radZ07RNHn5cA9E2F9YDt9zxpw3sGNFeqct
 fU6TZ2S52KkVUYK5Q7J4Hgah7mj+Pj3zQ4cabDXj8w29a2D/N6GCs7zkmjhB3Ncl5S6iDBaWv
 HGROd8R/gVUiel60V+gMutZMP5cTMdAKHQxI5wJFR/7lIA7YlrTNjLQOZc65CIKZN9tTF/Kko
 9jj6BBVp9ZqjxZXqwyXtoLlERmpozDIHFzZJXv9xM35bhSsAjxuZr+JDXWbSyn9FrbTXC23Ay
 v5IRDDP/qWzyuGg==
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
Cc: linux-s390@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--j3wV1wIO6QybvNFQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 12:13:39PM -0700 Kees Cook wrote:
> Currently the Kconfig fragments in kernel/configs and arch/*/configs
> that aren't used internally aren't discoverable through "make help",
> which consists of hard-coded lists of config fragments. Instead, list
> all the fragment targets that have a "# Help: " comment prefix so the
> targets can be generated dynamically.
>=20
> Add logic to the Makefile to search for and display the fragment and
> comment. Add comments to fragments that are intended to be direct targets.
>=20
> Cc: Nicolas Schier <nicolas@fjasle.eu>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: linux-kernel@vger.kernel.org
> Cc: x86@kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-kbuild@vger.kernel.org
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Co-developed-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>


> v3:
> - Use Makefile logic from Masahiro Yamada
> - Use "# Help: " prefix, but only on desired fragment targets
> v2: https://lore.kernel.org/all/20230825194329.gonna.911-kees@kernel.org
> v1: https://lore.kernel.org/all/20230824223606.never.762-kees@kernel.org
> ---
>  Makefile                                   |  1 -
>  arch/arm/configs/dram_0x00000000.config    |  1 +
>  arch/arm/configs/dram_0xc0000000.config    |  1 +
>  arch/arm/configs/dram_0xd0000000.config    |  1 +
>  arch/arm/configs/lpae.config               |  1 +
>  arch/arm64/configs/virt.config             |  1 +
>  arch/powerpc/configs/disable-werror.config |  1 +
>  arch/powerpc/configs/security.config       |  4 +++-
>  arch/riscv/configs/32-bit.config           |  1 +
>  arch/riscv/configs/64-bit.config           |  1 +
>  arch/s390/configs/btf.config               |  1 +
>  arch/s390/configs/kasan.config             |  1 +
>  arch/x86/Makefile                          |  4 ----
>  kernel/configs/debug.config                |  2 ++
>  kernel/configs/kvm_guest.config            |  1 +
>  kernel/configs/nopm.config                 |  2 ++
>  kernel/configs/rust.config                 |  1 +
>  kernel/configs/tiny.config                 |  2 ++
>  kernel/configs/x86_debug.config            |  1 +
>  kernel/configs/xen.config                  |  2 ++
>  scripts/kconfig/Makefile                   | 15 ++++++++++++---
>  21 files changed, 36 insertions(+), 9 deletions(-)
>=20
> diff --git a/Makefile b/Makefile
> index 4739c21a63e2..91c90ce8e0e3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1674,7 +1674,6 @@ help:
>  	@echo  '  mrproper	  - Remove all generated files + config + various ba=
ckup files'
>  	@echo  '  distclean	  - mrproper + remove editor backup and patch files'
>  	@echo  ''
> -	@echo  'Configuration targets:'
>  	@$(MAKE) -f $(srctree)/scripts/kconfig/Makefile help
>  	@echo  ''
>  	@echo  'Other generic targets:'
> diff --git a/arch/arm/configs/dram_0x00000000.config b/arch/arm/configs/d=
ram_0x00000000.config
> index db96dcb420ce..8803a0f58343 100644
> --- a/arch/arm/configs/dram_0x00000000.config
> +++ b/arch/arm/configs/dram_0x00000000.config
> @@ -1 +1,2 @@
> +# Help: DRAM base at 0x00000000
>  CONFIG_DRAM_BASE=3D0x00000000
> diff --git a/arch/arm/configs/dram_0xc0000000.config b/arch/arm/configs/d=
ram_0xc0000000.config
> index 343d5333d973..aab8f864686b 100644
> --- a/arch/arm/configs/dram_0xc0000000.config
> +++ b/arch/arm/configs/dram_0xc0000000.config
> @@ -1 +1,2 @@
> +# Help: DRAM base at 0xc0000000
>  CONFIG_DRAM_BASE=3D0xc0000000
> diff --git a/arch/arm/configs/dram_0xd0000000.config b/arch/arm/configs/d=
ram_0xd0000000.config
> index 61ba7045f8a1..4aabce4ea3d4 100644
> --- a/arch/arm/configs/dram_0xd0000000.config
> +++ b/arch/arm/configs/dram_0xd0000000.config
> @@ -1 +1,2 @@
> +# Help: DRAM base at 0xd0000000
>  CONFIG_DRAM_BASE=3D0xd0000000
> diff --git a/arch/arm/configs/lpae.config b/arch/arm/configs/lpae.config
> index a6d6f7ab3c01..1ab94da8345d 100644
> --- a/arch/arm/configs/lpae.config
> +++ b/arch/arm/configs/lpae.config
> @@ -1,2 +1,3 @@
> +# Help: Enable Large Physical Address Extension mode
>  CONFIG_ARM_LPAE=3Dy
>  CONFIG_VMSPLIT_2G=3Dy
> diff --git a/arch/arm64/configs/virt.config b/arch/arm64/configs/virt.con=
fig
> index 6865d54e68f8..c47c36f8f67b 100644
> --- a/arch/arm64/configs/virt.config
> +++ b/arch/arm64/configs/virt.config
> @@ -1,3 +1,4 @@
> +# Help: Virtualization guest
>  #
>  # Base options for platforms
>  #
> diff --git a/arch/powerpc/configs/disable-werror.config b/arch/powerpc/co=
nfigs/disable-werror.config
> index 6ea12a12432c..7776b91da37f 100644
> --- a/arch/powerpc/configs/disable-werror.config
> +++ b/arch/powerpc/configs/disable-werror.config
> @@ -1 +1,2 @@
> +# Help: Disable -Werror
>  CONFIG_PPC_DISABLE_WERROR=3Dy
> diff --git a/arch/powerpc/configs/security.config b/arch/powerpc/configs/=
security.config
> index 1c91a35c6a73..0d54e29e2cdf 100644
> --- a/arch/powerpc/configs/security.config
> +++ b/arch/powerpc/configs/security.config
> @@ -1,3 +1,5 @@
> +# Help: Common security options for PowerPC builds
> +
>  # This is the equivalent of booting with lockdown=3Dintegrity
>  CONFIG_SECURITY=3Dy
>  CONFIG_SECURITYFS=3Dy
> @@ -12,4 +14,4 @@ CONFIG_INIT_ON_ALLOC_DEFAULT_ON=3Dy
> =20
>  # UBSAN bounds checking is very cheap and good for hardening
>  CONFIG_UBSAN=3Dy
> -# CONFIG_UBSAN_MISC is not set
> \ No newline at end of file
> +# CONFIG_UBSAN_MISC is not set
> diff --git a/arch/riscv/configs/32-bit.config b/arch/riscv/configs/32-bit=
=2Econfig
> index f6af0f708df4..16ee163847b4 100644
> --- a/arch/riscv/configs/32-bit.config
> +++ b/arch/riscv/configs/32-bit.config
> @@ -1,3 +1,4 @@
> +# Help: Build a 32-bit image
>  CONFIG_ARCH_RV32I=3Dy
>  CONFIG_32BIT=3Dy
>  # CONFIG_PORTABLE is not set
> diff --git a/arch/riscv/configs/64-bit.config b/arch/riscv/configs/64-bit=
=2Econfig
> index 313edc554d84..d872a2d533f2 100644
> --- a/arch/riscv/configs/64-bit.config
> +++ b/arch/riscv/configs/64-bit.config
> @@ -1,2 +1,3 @@
> +# Help: Build a 64-bit image
>  CONFIG_ARCH_RV64I=3Dy
>  CONFIG_64BIT=3Dy
> diff --git a/arch/s390/configs/btf.config b/arch/s390/configs/btf.config
> index 39227b4511af..eb7f84f5925c 100644
> --- a/arch/s390/configs/btf.config
> +++ b/arch/s390/configs/btf.config
> @@ -1 +1,2 @@
> +# Help: Enable BTF debug info
>  CONFIG_DEBUG_INFO_BTF=3Dy
> diff --git a/arch/s390/configs/kasan.config b/arch/s390/configs/kasan.con=
fig
> index 700a8b25c3ff..84c2b551e992 100644
> --- a/arch/s390/configs/kasan.config
> +++ b/arch/s390/configs/kasan.config
> @@ -1,3 +1,4 @@
> +# Help: Enable KASan for debugging
>  CONFIG_KASAN=3Dy
>  CONFIG_KASAN_INLINE=3Dy
>  CONFIG_KASAN_VMALLOC=3Dy
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index fdc2e3abd615..c4b2a8a19fc8 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -335,9 +335,5 @@ define archhelp
>    echo  '			  bzdisk/fdimage*/hdimage/isoimage also accept:'
>    echo  '			  FDARGS=3D"..."  arguments for the booted kernel'
>    echo  '			  FDINITRD=3Dfile initrd for the booted kernel'
> -  echo  ''
> -  echo  '  kvm_guest.config	- Enable Kconfig items for running this kern=
el as a KVM guest'
> -  echo  '  xen.config		- Enable Kconfig items for running this kernel as=
 a Xen guest'
> -  echo  '  x86_debug.config	- Enable tip tree debugging options for test=
ing'
> =20
>  endef
> diff --git a/kernel/configs/debug.config b/kernel/configs/debug.config
> index e8db8d938661..4722b998a324 100644
> --- a/kernel/configs/debug.config
> +++ b/kernel/configs/debug.config
> @@ -1,3 +1,5 @@
> +# Help: Debugging for CI systems and finding regressions
> +#
>  # The config is based on running daily CI for enterprise Linux distros to
>  # seek regressions on linux-next builds on different bare-metal and virt=
ual
>  # platforms. It can be used for example,
> diff --git a/kernel/configs/kvm_guest.config b/kernel/configs/kvm_guest.c=
onfig
> index 208481d91090..d0877063d925 100644
> --- a/kernel/configs/kvm_guest.config
> +++ b/kernel/configs/kvm_guest.config
> @@ -1,3 +1,4 @@
> +# Help: Bootable as a KVM guest
>  CONFIG_NET=3Dy
>  CONFIG_NET_CORE=3Dy
>  CONFIG_NETDEVICES=3Dy
> diff --git a/kernel/configs/nopm.config b/kernel/configs/nopm.config
> index 81ff07863576..ebfdc3d8aa9a 100644
> --- a/kernel/configs/nopm.config
> +++ b/kernel/configs/nopm.config
> @@ -1,3 +1,5 @@
> +# Help: Disable Power Management
> +
>  CONFIG_PM=3Dn
>  CONFIG_SUSPEND=3Dn
>  CONFIG_HIBERNATION=3Dn
> diff --git a/kernel/configs/rust.config b/kernel/configs/rust.config
> index 38a7c5362c9c..2c6e001a7284 100644
> --- a/kernel/configs/rust.config
> +++ b/kernel/configs/rust.config
> @@ -1 +1,2 @@
> +# Help: Enable Rust
>  CONFIG_RUST=3Dy
> diff --git a/kernel/configs/tiny.config b/kernel/configs/tiny.config
> index 00009f7d0835..60a4b6d80b36 100644
> --- a/kernel/configs/tiny.config
> +++ b/kernel/configs/tiny.config
> @@ -1,3 +1,5 @@
> +# Help: Size-optimized kernel image
> +#
>  # CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
>  CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
>  # CONFIG_KERNEL_GZIP is not set
> diff --git a/kernel/configs/x86_debug.config b/kernel/configs/x86_debug.c=
onfig
> index 6fac5b405334..35f48671b8d5 100644
> --- a/kernel/configs/x86_debug.config
> +++ b/kernel/configs/x86_debug.config
> @@ -1,3 +1,4 @@
> +# Help: Debugging options for tip tree testing
>  CONFIG_X86_DEBUG_FPU=3Dy
>  CONFIG_LOCK_STAT=3Dy
>  CONFIG_DEBUG_VM=3Dy
> diff --git a/kernel/configs/xen.config b/kernel/configs/xen.config
> index 436f806aa1ed..6878b9a49be8 100644
> --- a/kernel/configs/xen.config
> +++ b/kernel/configs/xen.config
> @@ -1,3 +1,5 @@
> +# Help: Bootable as a Xen guest
> +#
>  # global stuff - these enable us to allow some
>  # of the not so generic stuff below for xen
>  CONFIG_PARAVIRT=3Dy
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index af1c96198f49..4eee155121a8 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -93,11 +93,13 @@ endif
>  %_defconfig: $(obj)/conf
>  	$(Q)$< $(silent) --defconfig=3Darch/$(SRCARCH)/configs/$@ $(Kconfig)
> =20
> -configfiles=3D$(wildcard $(srctree)/kernel/configs/$@ $(srctree)/arch/$(=
SRCARCH)/configs/$@)
> +configfiles =3D $(wildcard $(srctree)/kernel/configs/$(1) $(srctree)/arc=
h/$(SRCARCH)/configs/$(1))
> +all-config-fragments =3D $(call configfiles,*.config)
> +config-fragments =3D $(call configfiles,$@)
> =20
>  %.config: $(obj)/conf
> -	$(if $(call configfiles),, $(error No configuration exists for this tar=
get on this architecture))
> -	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m .conf=
ig $(configfiles)
> +	$(if $(config-fragments),, $(error $@ fragment does not exists on this =
architecture))
> +	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m .conf=
ig $(config-fragments)
>  	$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
> =20
>  PHONY +=3D tinyconfig
> @@ -115,6 +117,7 @@ clean-files +=3D tests/.cache
> =20
>  # Help text used by make help
>  help:
> +	@echo  'Configuration targets:'
>  	@echo  '  config	  - Update current config utilising a line-oriented pr=
ogram'
>  	@echo  '  nconfig         - Update current config utilising a ncurses m=
enu based program'
>  	@echo  '  menuconfig	  - Update current config utilising a menu based p=
rogram'
> @@ -141,6 +144,12 @@ help:
>  	@echo  '                    default value without prompting'
>  	@echo  '  tinyconfig	  - Configure the tiniest possible kernel'
>  	@echo  '  testconfig	  - Run Kconfig unit tests (requires python3 and p=
ytest)'
> +	@echo  ''
> +	@echo  'Configuration topic targets:'
> +	@$(foreach f, $(all-config-fragments), \
> +		if help=3D$$(grep -m1 '^# Help: ' $(f)); then \
> +			printf '  %-25s - %s\n' '$(notdir $(f))' "$${help#*: }"; \
> +		fi;)
> =20
>  # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>  # object files used by all kconfig flavours
> --=20
> 2.34.1

--=20
epost|xmpp: nicolas@fjasle.eu          irc://oftc.net/nsc
=E2=86=B3 gpg: 18ed 52db e34f 860e e9fb  c82b 7d97 0932 55a0 ce7f
     -- frykten for herren er opphav til kunnskap --

--j3wV1wIO6QybvNFQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmTzfCgACgkQB1IKcBYm
EmneBw//f4z/QkNgT9CmFR0rXEGPG1t+BHe1CcGXjJzAnoN83DmHml7ShJYOIamK
+5ztoZUeN7YOEhUbYuDCT8ma0Vo/Z0iG06omPe80RnaOu7PH5SAzaB9kO2T4BOYU
NR1YPuVOwaD0h5WFpoQY9Sa5q01yChlMesOV8NVdmr2U2lr1BXxPXIb9vRCLuS3f
qoODSfu72jsAXzGAU2K3z3qOwIku1Low8z/l9ysi0ES4HhREnPD0W/8kHbNiZWys
OwvJCXjT6mMIFZ79H2orfO4jclFbsWoI5tCh57hXUX6eUMBjNqCBrPhy/sqxYWBm
Qwu6jMfQ6iThmyzwqO+YhlipFm9p32PMoJx27/rZFqdpcchmOvcjuqR2u+POxSgJ
zLSWufn2U/47gVNJ4105i41xqd2k8FPrkp0I6kLtaBHKAVTxumQe3gv32IS4cJ7t
+EMtI0Uu0M/8XXQs1JvzNpBzdy7RMfIAyHR76GR2TNePIexcPWemZJcIRO6/zHT1
FnSm2Ri61KvFJ4BMFA6AllcG8o3Pd2rp2O0IO/hFyTq1v/jcFGXFJHmh4plj2CQK
zxhGYz83N2aQ7CRu+vLz4+TG1GvJX1R6AhZwdXxcVCfkoQtex1Zaq5H5ZKO2wOKd
DoSk/VCnO5qZ3GaAu5zG+egULhcu5UO8b63W8ytFib651qYu7ZY=
=t5b/
-----END PGP SIGNATURE-----

--j3wV1wIO6QybvNFQ--
