Return-Path: <linuxppc-dev+bounces-9838-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D463AEA3BD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 18:48:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSl506PZzz30Vl;
	Fri, 27 Jun 2025 02:48:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750956532;
	cv=none; b=RZs9El6IdBja02J08RWEPNd+7ZRFsd5/Nv20iwnE2SS3PhP1mDZ5ewUtc2Agp9BUOgmzGhWY2lhOoekrdTXFKK9lnWAkyOh6Rj6zJ+gNaT9YRjzCD61G1z4L0HDFpIgHfchs9Riba4RnHO01rIiVUGUVg1lf8f6sCLQoT9hts5jOTmUja01HJRto21anNY77Fs8sA3118Roz9ript0YE8VFegrb8Ctl2K4FgGjbHQYusMIRhuGqGpIQw4KVntQPC6FI5C661XBXcETzSiY77wmp+SvE6xl0Kb1ORlZhocinYlSxc37GRk50tVHisTiNYq7Oyx65uHtYkY+Jwc4jjMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750956532; c=relaxed/relaxed;
	bh=9IUls4zXYNswU6j5OUINwMEw/nRgw1jQaaK/mZYs/e8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZSHvcrdCziAkCc8zuudVLmr2FBO5OoFnp0UQXsyJdCQDz9CsK4+OYMHGjxy0iAQKPIbPlSD+VhZrMauH1HfgHXtZ/qvfipc+fkUBck9eDuHj5DrT54OEGLJD7dgCzMlHpYyLOQmUa2OyYMsSDujpcRHM7mgysfbFeCiLl58khZrAMUWub8GZP4duvGwHXEW0Tu/DNx9G5YM+0VZkv8LzD03qMcMwDd5rcfXn1acyMi57TO/MLRKmYlgTnIts76zvye/Vqj8xCqDrGUQFDcIhGX3L0W3ovywCSiO/83e4XkBbD805ETDZEtzhA4+u8jMJy7QSflPu1K3kU3f7Ng8PuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSl500ChXz30Nl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jun 2025 02:48:51 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D19971758;
	Thu, 26 Jun 2025 09:48:02 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B45F3F66E;
	Thu, 26 Jun 2025 09:48:15 -0700 (PDT)
Date: Thu, 26 Jun 2025 17:48:03 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com,
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com,
	david@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org,
	oliver.upton@linux.dev, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joey.gouly@arm.com, andre.przywara@arm.com,
	shahuang@redhat.com
Subject: Re: [kvm-unit-tests PATCH v4 00/13] arm/arm64: Add kvmtool to the
 runner script
Message-ID: <aF15wzSHKxYZig3N@raptor>
References: <20250625154813.27254-1-alexandru.elisei@arm.com>
 <20250626-f9239a18e811ef67ae5a9686@orel>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626-f9239a18e811ef67ae5a9686@orel>
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Drew,

On Thu, Jun 26, 2025 at 06:42:01PM +0200, Andrew Jones wrote:
> On Wed, Jun 25, 2025 at 04:48:00PM +0100, Alexandru Elisei wrote:
> > v3 can be found here [1]. Based on top of the series that add qemu_params and
> > test_args [2].
> > 
> > To goal is to allow the user to do:
> > 
> > $ ./configure --target=kvmtool
> > $ make clean && make
> > $ ./run_tests.sh
> > 
> > to run all the tests automatically with kvmtool.
> > 
> > Reasons to use kvmtool:
> > 
> > * kvmtool is smaller and a lot easier to modify compared to qemu, which
> > means developers may prefer it when adding or prototyping new features to
> > KVM, and being able to run all the tests reliably and automatically is very
> > useful.
> > 
> > * kvmtool is faster to run the tests (a couple of times faster on
> > my rockpro64), making for a quick turnaround. But do keep in mind that not
> > all tests work on kvmtool because of missing features compared to qemu.
> > 
> > * kvmtool does things differently than qemu: different memory layout,
> > different uart, PMU emulation is disabled by default, etc. This makes it a
> > good testing vehicule for kvm-unit-tests itself.
> 
> Thanks for this Alex! I didn't test it on arm yet, but I did test it on
> riscv with the quick patch below. It works great.

From a glance, the patch looks ok to me.

> 
> Applied to arm/queue
> 
> https://gitlab.com/jones-drew/kvm-unit-tests/-/commits/arm/queue

Thanks!

Alex

> 
> drew
> 
> 
> diff --git a/README.md b/README.md
> index 723ce04cd978..cbd8a9940ec4 100644
> --- a/README.md
> +++ b/README.md
> @@ -65,8 +65,8 @@ or:
>  
>  to run them all.
>  
> -All tests can be run using QEMU. On arm and arm64, tests can also be run using
> -kvmtool.
> +All tests can be run using QEMU. On arm, arm64, riscv32, and riscv64 tests can
> +also be run using kvmtool.
>  
>  By default the runner script searches for a suitable QEMU binary in the system.
>  To select a specific QEMU binary though, specify the QEMU=path/to/binary
> @@ -97,8 +97,7 @@ variable. kvmtool supports only kvm as the accelerator.
>  
>  Check [x86/efi/README.md](./x86/efi/README.md).
>  
> -On arm and arm64, this is only supported with QEMU; kvmtool cannot run the
> -tests under UEFI.
> +This is only supported with QEMU; kvmtool cannot run the tests under UEFI.
>  
>  # Tests configuration file
>  
> diff --git a/configure b/configure
> index 470f9d7cdb3b..4a9af4e0af30 100755
> --- a/configure
> +++ b/configure
> @@ -90,7 +90,7 @@ usage() {
>  	                           selects the best value based on the host system and the
>  	                           test configuration.
>  	    --target=TARGET        target platform that the tests will be running on (qemu or
> -	                           kvmtool, default is qemu) (arm/arm64 only)
> +	                           kvmtool, default is qemu) (arm/arm64 and riscv32/riscv64 only)
>  	    --cross-prefix=PREFIX  cross compiler prefix
>  	    --cc=CC                c compiler to use ($cc)
>  	    --cflags=FLAGS         extra options to be passed to the c compiler
> @@ -284,7 +284,8 @@ fi
>  if [ -z "$target" ]; then
>      target="qemu"
>  else
> -    if [ "$arch" != "arm64" ] && [ "$arch" != "arm" ]; then
> +    if [ "$arch" != "arm64" ] && [ "$arch" != "arm" ] &&
> +       [ "$arch" != "riscv32" ] && [ "$arch" != "riscv64" ]; then
>          echo "--target is not supported for $arch"
>          usage
>      fi
> @@ -393,6 +394,10 @@ elif [ "$arch" = "riscv32" ] || [ "$arch" = "riscv64" ]; then
>      testdir=riscv
>      arch_libdir=riscv
>      : "${uart_early_addr:=0x10000000}"
> +    if [ "$target" != "qemu" ] && [ "$target" != "kvmtool" ]; then
> +        echo "--target must be one of 'qemu' or 'kvmtool'!"
> +        usage
> +    fi
>  elif [ "$arch" = "s390x" ]; then
>      testdir=s390x
>  else
> @@ -519,7 +524,8 @@ EFI_DIRECT=$efi_direct
>  CONFIG_WERROR=$werror
>  GEN_SE_HEADER=$gen_se_header
>  EOF
> -if [ "$arch" = "arm" ] || [ "$arch" = "arm64" ]; then
> +if [ "$arch" = "arm" ] || [ "$arch" = "arm64" ] ||
> +   [ "$arch" = "riscv32" ] || [ "$arch" = "riscv64" ]; then
>      echo "TARGET=$target" >> config.mak
>  fi
>  
> diff --git a/riscv/efi/run b/riscv/efi/run
> index 5a72683a6ef5..b9b75440c659 100755
> --- a/riscv/efi/run
> +++ b/riscv/efi/run
> @@ -11,6 +11,12 @@ if [ ! -f config.mak ]; then
>  fi
>  source config.mak
>  source scripts/arch-run.bash
> +source scripts/vmm.bash
> +
> +if [[ $(vmm_get_target) == "kvmtool" ]]; then
> +	echo "kvmtool does not support EFI tests."
> +	exit 2
> +fi
>  
>  if [ -f RISCV_VIRT_CODE.fd ]; then
>  	DEFAULT_UEFI=RISCV_VIRT_CODE.fd
> diff --git a/riscv/run b/riscv/run
> index 0f000f0d82c6..3c242923412c 100755
> --- a/riscv/run
> +++ b/riscv/run
> @@ -10,35 +10,75 @@ if [ -z "$KUT_STANDALONE" ]; then
>  	source scripts/vmm.bash
>  fi
>  
> -# Allow user overrides of some config.mak variables
> -mach=$MACHINE_OVERRIDE
> -qemu_cpu=$TARGET_CPU_OVERRIDE
> -firmware=$FIRMWARE_OVERRIDE
> -
> -: "${mach:=virt}"
> -: "${qemu_cpu:=$TARGET_CPU}"
> -: "${qemu_cpu:=$DEFAULT_QEMU_CPU}"
> -: "${firmware:=$FIRMWARE}"
> -[ "$firmware" ] && firmware="-bios $firmware"
> -
> -set_qemu_accelerator || exit $?
> -[ "$ACCEL" = "kvm" ] && QEMU_ARCH=$HOST
> -acc="-accel $ACCEL$ACCEL_PROPS"
> -
> -qemu=$(search_qemu_binary) || exit $?
> -if [ "$mach" = 'virt' ] && ! $qemu -machine '?' | grep -q 'RISC-V VirtIO board'; then
> -	echo "$qemu doesn't support mach-virt ('-machine virt'). Exiting."
> -	exit 2
> -fi
> -mach="-machine $mach"
> +vmm_check_supported
>  
> -command="$qemu -nodefaults -nographic -serial mon:stdio"
> -command+=" $mach $acc $firmware -cpu $qemu_cpu "
> -command="$(migration_cmd) $(timeout_cmd) $command"
> +function arch_run_qemu()
> +{
> +	# Allow user overrides of some config.mak variables
> +	mach=$MACHINE_OVERRIDE
> +	qemu_cpu=$TARGET_CPU_OVERRIDE
> +	firmware=$FIRMWARE_OVERRIDE
>  
> -if [ "$UEFI_SHELL_RUN" = "y" ]; then
> -	ENVIRON_DEFAULT=n run_test_status $command "$@"
> -else
> -	# We return the exit code via stdout, not via the QEMU return code
> -	run_test_status $command -kernel "$@"
> -fi
> +	: "${mach:=virt}"
> +	: "${qemu_cpu:=$TARGET_CPU}"
> +	: "${qemu_cpu:=$DEFAULT_QEMU_CPU}"
> +	: "${firmware:=$FIRMWARE}"
> +	[ "$firmware" ] && firmware="-bios $firmware"
> +
> +	set_qemu_accelerator || exit $?
> +	[ "$ACCEL" = "kvm" ] && QEMU_ARCH=$HOST
> +	acc="-accel $ACCEL$ACCEL_PROPS"
> +
> +	qemu=$(search_qemu_binary) || exit $?
> +	if [ "$mach" = 'virt' ] && ! $qemu -machine '?' | grep -q 'RISC-V VirtIO board'; then
> +		echo "$qemu doesn't support mach-virt ('-machine virt'). Exiting."
> +		exit 2
> +	fi
> +	mach="-machine $mach"
> +
> +	command="$qemu -nodefaults -nographic -serial mon:stdio"
> +	command+=" $mach $acc $firmware -cpu $qemu_cpu "
> +	command="$(migration_cmd) $(timeout_cmd) $command"
> +
> +	if [ "$UEFI_SHELL_RUN" = "y" ]; then
> +		ENVIRON_DEFAULT=n run_test_status $command "$@"
> +	else
> +		# We return the exit code via stdout, not via the QEMU return code
> +		run_test_status $command -kernel "$@"
> +	fi
> +}
> +
> +function arch_run_kvmtool()
> +{
> +	local command
> +
> +	kvmtool=$(search_kvmtool_binary) ||
> +		exit $?
> +
> +	if [ "$ACCEL" ] && [ "$ACCEL" != "kvm" ]; then
> +		echo "kvmtool does not support $ACCEL" >&2
> +		exit 2
> +	fi
> +
> +	if ! kvm_available; then
> +		echo "kvmtool requires KVM but not available on the host" >&2
> +		exit 2
> +	fi
> +
> +	command="$(timeout_cmd) $kvmtool run"
> +	if [ "$HOST" = "riscv64" ] && [ "$ARCH" = "riscv32" ]; then
> +		echo "Cannot run riscv32 on riscv64" >&2
> +		exit 2
> +	else
> +		run_test_status $command --kernel "$@"
> +	fi
> +}
> +
> +case $(vmm_get_target) in
> +qemu)
> +	arch_run_qemu "$@"
> +	;;
> +kvmtool)
> +	arch_run_kvmtool "$@"
> +	;;
> +esac

