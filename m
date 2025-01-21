Return-Path: <linuxppc-dev+bounces-5467-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 279B8A18248
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2025 17:50:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YctVz44vBz30W8;
	Wed, 22 Jan 2025 03:50:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.179
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737478235;
	cv=none; b=Rm+6fpVAO4FcKh6+W+6lDEdPI18uy7aCo12AvhumvUJBItA0d3/VHKbn6+feYIVZk5Ln+1KLFnco5iF2DTeW+/KGhvUwTn/KuIF6xuzbUeIM/LqJbhCyS9xpfndkCBeuNC4tqG//47i3uyaDpgRPTf822jgNqsQWiYU+8saN8sFFPEcPlM+5MpbG1LPkvDUABK+t5L9HyefhnymVwjx13E0CcXI42yBH4b1/4PgBaWxviZTE/BGAekPkKdKYWNziepnCysIbeFhEONQ7YmwZReXiWtLYzkBXosTJPBoTsAb4ta0CtvC674mfqYQHunWykg0FQKfFikOeaAlh59o26Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737478235; c=relaxed/relaxed;
	bh=9o9toXjXchxuXb1mbAx2+gmT8fvOBZnIXdfInm+D/aM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iS42sgd+lKeOrwp2BweAu5GHcEsSbwTB/+xTs0Jx8OybDbITv2LUr8jQ2LR88QgSFRv3tJQM3F9fV+QST2xBB0M/bkpSIBhZSQ3aYPT6dUzSBrJvsIHwN/Z9MsOAJc6WNczeTt1P4fUuFP8EmB0Eklz6G3Q9i7pXLxkKYEIQjc2VgFOdDoOuJg68bEB3u8enGO+qMPIsMtQ+l2xXkupHl2qXcO3REAjnVXAANBsjNMyot5yhp0SHYbG2mnDy7C/9uBF1J9lykEI/w0pjDJDYD6xhHwTCdmkaQBdCC4sirENdnWULcTQwRyaVUGe9i5LevQoRvRdMRF5A9WiifbWS7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=95.215.58.179; helo=out-179.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.179; helo=out-179.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YctVs62H0z30Vq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2025 03:50:29 +1100 (AEDT)
Date: Tue, 21 Jan 2025 17:50:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737478209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9o9toXjXchxuXb1mbAx2+gmT8fvOBZnIXdfInm+D/aM=;
	b=rtj0/bwzCyqvtrhaxqugGe2yTMMDMyQdQVt26GYW3LfnEZGr/FkaHtaK+9BBohA9Fer3GU
	iQxCzAawmvRe5+YcIMPEJ0HfhT6HVkpz1//kiNxxGLa+cVveUDP9L5rTqnXsMZwW4m9nx1
	34ELjNr9KI9WUusTseG9Fu9SnLCc+bY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	oliver.upton@linux.dev, suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, 
	andre.przywara@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 11/18] arm/run: Add support for kvmtool
Message-ID: <20250121-98b6da755bc353722fae5f1f@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-12-alexandru.elisei@arm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120164316.31473-12-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 20, 2025 at 04:43:09PM +0000, Alexandru Elisei wrote:
> Teach the arm runner to use kvmtool when kvm-unit-tests has been configured
> appropriately.
> 
> The test is ran using run_test_status() because kvmtool does not have a
> testdev device to return the test exit code, so kvm-unit-tests must always
> parse the "EXIT: STATUS" line for the exit code.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  arm/run | 183 ++++++++++++++++++++++++++++++++++----------------------
>  1 file changed, 110 insertions(+), 73 deletions(-)
> 
> diff --git a/arm/run b/arm/run
> index 9b11feafffdd..880d5afae86d 100755
> --- a/arm/run
> +++ b/arm/run
> @@ -17,77 +17,114 @@ qemu)
>     exit 3
>  esac
>  
> -processor="$PROCESSOR"
> +arch_run_qemu()
> +{
> +    processor="$PROCESSOR"
> +
> +    if [ "$QEMU" ] && [ -z "$ACCEL" ] &&
> +       [ "$HOST" = "aarch64" ] && [ "$ARCH" = "arm" ] &&
> +       [ "$(basename $QEMU)" = "qemu-system-arm" ]; then
> +        ACCEL="tcg"
> +    fi
> +
> +    set_qemu_accelerator || exit $?
> +    if [ "$ACCEL" = "kvm" ]; then
> +        QEMU_ARCH=$HOST
> +    fi
> +
> +    qemu=$(search_qemu_binary) ||
> +        exit $?
> +
> +    if ! $qemu -machine '?' | grep -q 'ARM Virtual Machine'; then
> +        echo "$qemu doesn't support mach-virt ('-machine virt'). Exiting."
> +        exit 2
> +    fi
> +
> +    M='-machine virt'
> +
> +    if [ "$ACCEL" = "kvm" ]; then
> +        if $qemu $M,\? | grep -q gic-version; then
> +            M+=',gic-version=host'
> +        fi
> +    fi
> +
> +    if [ "$ACCEL" = "kvm" ] || [ "$ACCEL" = "hvf" ]; then
> +        if [ "$HOST" = "aarch64" ] || [ "$HOST" = "arm" ]; then
> +            processor="host"
> +            if [ "$ARCH" = "arm" ] && [ "$HOST" = "aarch64" ]; then
> +                processor+=",aarch64=off"
> +            fi
> +        fi
> +    fi
> +
> +    if [ "$ARCH" = "arm" ]; then
> +        M+=",highmem=off"
> +    fi
> +
> +    if ! $qemu $M -device '?' | grep -q virtconsole; then
> +        echo "$qemu doesn't support virtio-console for chr-testdev. Exiting."
> +        exit 2
> +    fi
> +
> +    if ! $qemu $M -chardev '?' | grep -q testdev; then
> +        echo "$qemu doesn't support chr-testdev. Exiting."
> +        exit 2
> +    fi
> +
> +    if [ "$UEFI_SHELL_RUN" != "y" ] && [ "$EFI_USE_ACPI" != "y" ]; then
> +        chr_testdev='-device virtio-serial-device'
> +        chr_testdev+=' -device virtconsole,chardev=ctd -chardev testdev,id=ctd'
> +    fi
> +
> +    pci_testdev=
> +    if $qemu $M -device '?' | grep -q pci-testdev; then
> +        pci_testdev="-device pci-testdev"
> +    fi
> +
> +    A="-accel $ACCEL$ACCEL_PROPS"
> +    command="$qemu -nodefaults $M $A -cpu $processor $chr_testdev $pci_testdev"
> +    command+=" -display none -serial stdio"
> +    command="$(migration_cmd) $(timeout_cmd) $command"
> +
> +    if [ "$UEFI_SHELL_RUN" = "y" ]; then
> +        ENVIRON_DEFAULT=n run_test_status $command "$@"
> +    elif [ "$EFI_USE_ACPI" = "y" ]; then
> +        run_test_status $command -kernel "$@"
> +    else
> +        run_qemu $command -kernel "$@"
> +    fi
> +}
> +
> +arch_run_kvmtool()
> +{
> +    local command
> +
> +    kvmtool=$(search_kvmtool_binary) ||
> +        exit $?
> +
> +    if [ "$ACCEL" ] && [ "$ACCEL" != "kvm" ]; then
> +        echo "kvmtool does not support $ACCEL" >&2
> +        exit 2
> +    fi
> +
> +    if ! kvm_available; then
> +        echo "KVM required by kvmtool but not available on the host" >&2
> +        exit 2
> +    fi
> +
> +    command="$(timeout_cmd) $kvmtool run"
> +    if [ "$HOST" = "aarch64" ] && [ "$ARCH" = "arm" ]; then
> +	    run_test_status $command --kernel "$@" --aarch32
> +    else
> +	    run_test_status $command --kernel "$@"
> +    fi
> +}
>  
> -if [ "$QEMU" ] && [ -z "$ACCEL" ] &&
> -   [ "$HOST" = "aarch64" ] && [ "$ARCH" = "arm" ] &&
> -   [ "$(basename $QEMU)" = "qemu-system-arm" ]; then
> -	ACCEL="tcg"
> -fi
> -
> -set_qemu_accelerator || exit $?
> -if [ "$ACCEL" = "kvm" ]; then
> -	QEMU_ARCH=$HOST
> -fi
> -
> -qemu=$(search_qemu_binary) ||
> -	exit $?
> -
> -if ! $qemu -machine '?' | grep -q 'ARM Virtual Machine'; then
> -	echo "$qemu doesn't support mach-virt ('-machine virt'). Exiting."
> -	exit 2
> -fi
> -
> -M='-machine virt'
> -
> -if [ "$ACCEL" = "kvm" ]; then
> -	if $qemu $M,\? | grep -q gic-version; then
> -		M+=',gic-version=host'
> -	fi
> -fi
> -
> -if [ "$ACCEL" = "kvm" ] || [ "$ACCEL" = "hvf" ]; then
> -	if [ "$HOST" = "aarch64" ] || [ "$HOST" = "arm" ]; then
> -		processor="host"
> -		if [ "$ARCH" = "arm" ] && [ "$HOST" = "aarch64" ]; then
> -			processor+=",aarch64=off"
> -		fi
> -	fi
> -fi
> -
> -if [ "$ARCH" = "arm" ]; then
> -	M+=",highmem=off"
> -fi
> -
> -if ! $qemu $M -device '?' | grep -q virtconsole; then
> -	echo "$qemu doesn't support virtio-console for chr-testdev. Exiting."
> -	exit 2
> -fi
> -
> -if ! $qemu $M -chardev '?' | grep -q testdev; then
> -	echo "$qemu doesn't support chr-testdev. Exiting."
> -	exit 2
> -fi
> -
> -if [ "$UEFI_SHELL_RUN" != "y" ] && [ "$EFI_USE_ACPI" != "y" ]; then
> -	chr_testdev='-device virtio-serial-device'
> -	chr_testdev+=' -device virtconsole,chardev=ctd -chardev testdev,id=ctd'
> -fi
> -
> -pci_testdev=
> -if $qemu $M -device '?' | grep -q pci-testdev; then
> -	pci_testdev="-device pci-testdev"
> -fi
> -
> -A="-accel $ACCEL$ACCEL_PROPS"
> -command="$qemu -nodefaults $M $A -cpu $processor $chr_testdev $pci_testdev"
> -command+=" -display none -serial stdio"
> -command="$(migration_cmd) $(timeout_cmd) $command"
> -
> -if [ "$UEFI_SHELL_RUN" = "y" ]; then
> -	ENVIRON_DEFAULT=n run_test_status $command "$@"
> -elif [ "$EFI_USE_ACPI" = "y" ]; then
> -	run_test_status $command -kernel "$@"
> -else
> -	run_qemu $command -kernel "$@"
> -fi
> +case "$TARGET" in
> +qemu)
> +    arch_run_qemu "$@"
> +    ;;
> +kvmtool)
> +    arch_run_kvmtool "$@"
> +    ;;
> +esac
> -- 
> 2.47.1
> 
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

