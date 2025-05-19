Return-Path: <linuxppc-dev+bounces-8658-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBE1ABB7F8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 May 2025 10:56:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1BPD1nwSz2xZV;
	Mon, 19 May 2025 18:56:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747644976;
	cv=none; b=mmdYhQAm13bnWitwRrfwQsWNcO5eofGntS4kvEG7K1oFTYPmAU2PBaK6XKuf38l/ZlssDzfirChYs52UpeH4Hvv1e4kdDCiPPEtDx2HOV1ISDe6TmQlSHPIA2amSJ622747EFVM3JeEXUumK4fOLcLbaRpuWfbVSglV0pvuAk5V/Z1YP1aetEkSf6fFQD2mQfO1qA4NyRH1xQjfkso7eUQLesS9ryQUSBYIST0l9NBjL0MKcnD3mHtB9SqGo0TJUmVVKRdM597q1Cain/F5BDbPRcsT++uR+uHx2rwLIB0gSqUWxJ8pWrhdsAXw177LxFVRqojVvMxANvHQKX7vh/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747644976; c=relaxed/relaxed;
	bh=+8sI82yq/f8FgFoZEta+4VkgQiL0NBrWh/StSsatWxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S5GCV0zwZRa6Z3iSfLx6Lff5+hU1VX6B333k233cTKyeE8uEhBTTqVLNPvY5Zbc1G1NeGy0i6GITGnTiAfWYAYcnjsc9+FzeXxcXrDL1cJrLyVhgA/1ZQ1B/Unk+Xqxi0SnjH0uwcHvjvmrntupMQBYbypEZG+bXAFDo7lH5bizVOtiq9+qoe1Cbho/maCfI7ROA0kTBzgjQXMpCyMqJtxfe+zksF+m5vYj1sESkUnG+LRhKV5ScLvsUXFckMWI/ZH/O/C58zs7ys+HhSdFSTS1IeeuzqxBCciOzbSsZ3KEhW7wYiIAgT9QDx3S9upu5xqXbJkEs2bgqlcmGp64Zrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PG9kWpCW; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PG9kWpCW; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=shahuang@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PG9kWpCW;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PG9kWpCW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=shahuang@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1BPB5YXfz2xYl
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 May 2025 18:56:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747644970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+8sI82yq/f8FgFoZEta+4VkgQiL0NBrWh/StSsatWxk=;
	b=PG9kWpCWlq7RGH4St9s4yZMAt/dHQblQt8VBta5VlvZOzj9hwTHJ5kAllc5RmzyZSFl3lI
	nZbSmx3plgvHato9lU6HOOY7YFvkvx5VEjb4ILCbat8g4R9gg+/x3PHChTpqBJ+ajwPD2F
	SxjRsbiPLCxR2koUoPrIsoO6lhozFHA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747644970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+8sI82yq/f8FgFoZEta+4VkgQiL0NBrWh/StSsatWxk=;
	b=PG9kWpCWlq7RGH4St9s4yZMAt/dHQblQt8VBta5VlvZOzj9hwTHJ5kAllc5RmzyZSFl3lI
	nZbSmx3plgvHato9lU6HOOY7YFvkvx5VEjb4ILCbat8g4R9gg+/x3PHChTpqBJ+ajwPD2F
	SxjRsbiPLCxR2koUoPrIsoO6lhozFHA=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-rZr1PrNPNQCWyeTxv0--BQ-1; Mon, 19 May 2025 04:56:08 -0400
X-MC-Unique: rZr1PrNPNQCWyeTxv0--BQ-1
X-Mimecast-MFC-AGG-ID: rZr1PrNPNQCWyeTxv0--BQ_1747644967
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-742c5f7a70bso1360284b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 May 2025 01:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747644967; x=1748249767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+8sI82yq/f8FgFoZEta+4VkgQiL0NBrWh/StSsatWxk=;
        b=wIgsgRCT/lLNEpGde8dPHWoUuLMIwpZVmHVc8pecc11+lxJOvCveouLxeYGUIFQ5we
         IJ5HsDs5fOWtdx1Y735W4TPHrgLEdOfKhIhNQwoWaIZdb+OyIENC97qO1z73RHlb0jw1
         HjgMLB8dgy2ClqLQiTMB68+FLf+igruqETorDxFCwSqyupArk0EpZ7TbtEkYktEdKME2
         uC3RrGcCQMD+z3O9znHPDflcK5PLhrWhxTFCz8H5mP0Zt/PDyn2WUbOJqjVLoXwROCTL
         iu6QZd2ytZA2KMRgO7qxPX7RNqLBl0srzQ87EXLcnHoZXl2imYEvynjEUH3io282v0EC
         /4AA==
X-Forwarded-Encrypted: i=1; AJvYcCXC2HVPTJgxdkYiZdjQUZ6jllrIqDnbPsylcvdPtog1kFkN7aImWIrAssnESuUS5xmNcZ3d0Gj4JZcJLBg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxuVGIaIqI01rzk8PFs7XexngTNNn2qVMbrllvCbkt7ECbo6y+A
	q82Ey5o3UA9PfjDOH+kt7GqQye52kRRXWN7IIB/RlDM9ewyoNWPikmBL2xtx4MxVTDiTCz9Pk2j
	GZEHZGS7r4cyFDL5v/2II/iD62FjkDhnaXychi/QY4uRMOxyR3ursGtGrZwUi4wAyKwU=
X-Gm-Gg: ASbGnctK1s4pPcfxM26J1jw0DCUJy8V2y/EAzP2Cms7yGkgKvDqMPatqhNY82vYTeaF
	tiSiQv0aovO4mg9f033NJlVw1JhD8iejht8N4iqQty2fRYjQ6YTw4NDywHsqbIqwJHurcQTwvfY
	G8WmXmVkETDIOCUZ6kt9jGrXFKtYxXW6QMcL9LqM6RCp8A7c+QTssaMfUKNzCreFxGHw3oMl6OF
	a6c+DmJoAuqtSAelN+APrWJTYOggt1tl6tkxXuzd0yKNNjaGd0b/Mat8D8Gmn55xZMW02NrAGwl
	ZUaKN6FA3+r/8ryI
X-Received: by 2002:a05:6a21:9208:b0:209:251d:47d2 with SMTP id adf61e73a8af0-2170cb2609dmr14733210637.11.1747644966787;
        Mon, 19 May 2025 01:56:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfWMc3DaNswLVk3gKWW45O5beN+npa+Ty5x6tqyEpyLBL1yIWrxHAXKN90bYSxUmk6KSXyfQ==
X-Received: by 2002:a05:6a21:9208:b0:209:251d:47d2 with SMTP id adf61e73a8af0-2170cb2609dmr14733145637.11.1747644966186;
        Mon, 19 May 2025 01:56:06 -0700 (PDT)
Received: from [10.72.116.146] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401a81sm10738870a91.2.2025.05.19.01.55.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 01:56:05 -0700 (PDT)
Message-ID: <8aae95b9-4444-4ede-9f27-7ff759b6586f@redhat.com>
Date: Mon, 19 May 2025 16:55:55 +0800
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
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v3 09/16] scripts: Add support for kvmtool
To: Alexandru Elisei <alexandru.elisei@arm.com>, andrew.jones@linux.dev,
 eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com,
 frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com,
 david@redhat.com, pbonzini@redhat.com
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, will@kernel.org, julien.thierry.kdev@gmail.com,
 maz@kernel.org, oliver.upton@linux.dev, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, joey.gouly@arm.com, andre.przywara@arm.com
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
 <20250507151256.167769-10-alexandru.elisei@arm.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20250507151256.167769-10-alexandru.elisei@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kbO7RFDA1SymsGgJ-derTXgwEa7Gm-xY39wbhE3KAv0_1747644967
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 5/7/25 11:12 PM, Alexandru Elisei wrote:
> Teach the arm runner to use kvmtool when kvm-unit-tests has been configured
> appropriately.
> 
> The test is ran using run_test_status(), and a 0 return code (which means
> success) is converted to 1, because kvmtool does not have a testdev device
> to return the test exit code, so kvm-unit-tests must always parse the
> "EXIT: STATUS" line for the exit code.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Reviewed-by: Shaoqin Huang <shahuang@redhat.com>

> ---
>   arm/run               | 161 ++++++++++++++++++++++++++----------------
>   powerpc/run           |   4 +-
>   riscv/run             |   4 +-
>   s390x/run             |   2 +-
>   scripts/arch-run.bash | 112 +++++++++++------------------
>   scripts/vmm.bash      |  89 +++++++++++++++++++++++
>   x86/run               |   4 +-
>   7 files changed, 236 insertions(+), 140 deletions(-)
> 
> diff --git a/arm/run b/arm/run
> index 56562ed1628f..e3c4ffc49136 100755
> --- a/arm/run
> +++ b/arm/run
> @@ -12,80 +12,117 @@ fi
>   
>   check_vmm_supported
>   
> -qemu_cpu="$TARGET_CPU"
> -
> -if [ "$QEMU" ] && [ -z "$ACCEL" ] &&
> -   [ "$HOST" = "aarch64" ] && [ "$ARCH" = "arm" ] &&
> -   [ "$(basename $QEMU)" = "qemu-system-arm" ]; then
> -	ACCEL="tcg"
> -fi
> +function arch_run_qemu()
> +{
> +	qemu_cpu="$TARGET_CPU"
> +
> +	if [ "$QEMU" ] && [ -z "$ACCEL" ] &&
> +	   [ "$HOST" = "aarch64" ] && [ "$ARCH" = "arm" ] &&
> +	   [ "$(basename $QEMU)" = "qemu-system-arm" ]; then
> +		ACCEL="tcg"
> +	fi
>   
> -set_qemu_accelerator || exit $?
> -if [ "$ACCEL" = "kvm" ]; then
> -	QEMU_ARCH=$HOST
> -fi
> +	set_qemu_accelerator || exit $?
> +	if [ "$ACCEL" = "kvm" ]; then
> +		QEMU_ARCH=$HOST
> +	fi
>   
> -qemu=$(search_qemu_binary) ||
> -	exit $?
> +	qemu=$(search_qemu_binary) ||
> +		exit $?
>   
> -if ! $qemu -machine '?' | grep -q 'ARM Virtual Machine'; then
> -	echo "$qemu doesn't support mach-virt ('-machine virt'). Exiting."
> -	exit 2
> -fi
> +	if ! $qemu -machine '?' | grep -q 'ARM Virtual Machine'; then
> +		echo "$qemu doesn't support mach-virt ('-machine virt'). Exiting."
> +		exit 2
> +	fi
>   
> -M='-machine virt'
> +	M='-machine virt'
>   
> -if [ "$ACCEL" = "kvm" ]; then
> -	if $qemu $M,\? | grep -q gic-version; then
> -		M+=',gic-version=host'
> +	if [ "$ACCEL" = "kvm" ]; then
> +		if $qemu $M,\? | grep -q gic-version; then
> +			M+=',gic-version=host'
> +		fi
>   	fi
> -fi
>   
> -if [ -z "$qemu_cpu" ]; then
> -	if ( [ "$ACCEL" = "kvm" ] || [ "$ACCEL" = "hvf" ] ) &&
> -	   ( [ "$HOST" = "aarch64" ] || [ "$HOST" = "arm" ] ); then
> -		qemu_cpu="host"
> -		if [ "$ARCH" = "arm" ] && [ "$HOST" = "aarch64" ]; then
> -			qemu_cpu+=",aarch64=off"
> +	if [ -z "$qemu_cpu" ]; then
> +		if ( [ "$ACCEL" = "kvm" ] || [ "$ACCEL" = "hvf" ] ) &&
> +		   ( [ "$HOST" = "aarch64" ] || [ "$HOST" = "arm" ] ); then
> +			qemu_cpu="host"
> +			if [ "$ARCH" = "arm" ] && [ "$HOST" = "aarch64" ]; then
> +				qemu_cpu+=",aarch64=off"
> +			fi
> +		else
> +			qemu_cpu="$DEFAULT_QEMU_CPU"
>   		fi
> -	else
> -		qemu_cpu="$DEFAULT_QEMU_CPU"
>   	fi
> -fi
>   
> -if [ "$ARCH" = "arm" ]; then
> -	M+=",highmem=off"
> -fi
> +	if [ "$ARCH" = "arm" ]; then
> +		M+=",highmem=off"
> +	fi
>   
> -if ! $qemu $M -device '?' | grep -q virtconsole; then
> -	echo "$qemu doesn't support virtio-console for chr-testdev. Exiting."
> -	exit 2
> -fi
> +	if ! $qemu $M -device '?' | grep -q virtconsole; then
> +		echo "$qemu doesn't support virtio-console for chr-testdev. Exiting."
> +		exit 2
> +	fi
>   
> -if ! $qemu $M -chardev '?' | grep -q testdev; then
> -	echo "$qemu doesn't support chr-testdev. Exiting."
> -	exit 2
> -fi
> +	if ! $qemu $M -chardev '?' | grep -q testdev; then
> +		echo "$qemu doesn't support chr-testdev. Exiting."
> +		exit 2
> +	fi
>   
> -if [ "$UEFI_SHELL_RUN" != "y" ] && [ "$EFI_USE_ACPI" != "y" ]; then
> -	chr_testdev='-device virtio-serial-device'
> -	chr_testdev+=' -device virtconsole,chardev=ctd -chardev testdev,id=ctd'
> -fi
> +	if [ "$UEFI_SHELL_RUN" != "y" ] && [ "$EFI_USE_ACPI" != "y" ]; then
> +		chr_testdev='-device virtio-serial-device'
> +		chr_testdev+=' -device virtconsole,chardev=ctd -chardev testdev,id=ctd'
> +	fi
>   
> -pci_testdev=
> -if $qemu $M -device '?' | grep -q pci-testdev; then
> -	pci_testdev="-device pci-testdev"
> -fi
> +	pci_testdev=
> +	if $qemu $M -device '?' | grep -q pci-testdev; then
> +		pci_testdev="-device pci-testdev"
> +	fi
>   
> -A="-accel $ACCEL$ACCEL_PROPS"
> -command="$qemu -nodefaults $M $A -cpu $qemu_cpu $chr_testdev $pci_testdev"
> -command+=" -display none -serial stdio"
> -command="$(migration_cmd) $(timeout_cmd) $command"
> -
> -if [ "$UEFI_SHELL_RUN" = "y" ]; then
> -	ENVIRON_DEFAULT=n run_qemu_status $command "$@"
> -elif [ "$EFI_USE_ACPI" = "y" ]; then
> -	run_qemu_status $command -kernel "$@"
> -else
> -	run_qemu $command -kernel "$@"
> -fi
> +	A="-accel $ACCEL$ACCEL_PROPS"
> +	command="$qemu -nodefaults $M $A -cpu $qemu_cpu $chr_testdev $pci_testdev"
> +	command+=" -display none -serial stdio"
> +	command="$(migration_cmd) $(timeout_cmd) $command"
> +
> +	if [ "$UEFI_SHELL_RUN" = "y" ]; then
> +		ENVIRON_DEFAULT=n run_test_status $command "$@"
> +	elif [ "$EFI_USE_ACPI" = "y" ]; then
> +		run_test_status $command -kernel "$@"
> +	else
> +		run_test $command -kernel "$@"
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
> +	if [ "$HOST" = "aarch64" ] && [ "$ARCH" = "arm" ]; then
> +		run_test_status $command --kernel "$@" --aarch32
> +	else
> +		run_test_status $command --kernel "$@"
> +	fi
> +}
> +
> +case $TARGET in
> +qemu)
> +	arch_run_qemu "$@"
> +	;;
> +kvmtool)
> +	arch_run_kvmtool "$@"
> +	;;
> +esac
> diff --git a/powerpc/run b/powerpc/run
> index 27abf1ef6a4d..0b25a227429a 100755
> --- a/powerpc/run
> +++ b/powerpc/run
> @@ -59,8 +59,8 @@ command+=" -display none -serial stdio -kernel"
>   command="$(migration_cmd) $(timeout_cmd) $command"
>   
>   # powerpc tests currently exit with rtas-poweroff, which exits with 0.
> -# run_qemu treats that as a failure exit and returns 1, so we need
> +# run_test treats that as a failure exit and returns 1, so we need
>   # to fixup the fixup below by parsing the true exit code from the output.
>   # The second fixup is also a FIXME, because once we add chr-testdev
>   # support for powerpc, we won't need the second fixup.
> -run_qemu_status $command "$@"
> +run_test_status $command "$@"
> diff --git a/riscv/run b/riscv/run
> index 3b2fc36f2afb..562347e8bea2 100755
> --- a/riscv/run
> +++ b/riscv/run
> @@ -36,8 +36,8 @@ command+=" $mach $acc $firmware -cpu $qemu_cpu "
>   command="$(migration_cmd) $(timeout_cmd) $command"
>   
>   if [ "$UEFI_SHELL_RUN" = "y" ]; then
> -	ENVIRON_DEFAULT=n run_qemu_status $command "$@"
> +	ENVIRON_DEFAULT=n run_test_status $command "$@"
>   else
>   	# We return the exit code via stdout, not via the QEMU return code
> -	run_qemu_status $command -kernel "$@"
> +	run_test_status $command -kernel "$@"
>   fi
> diff --git a/s390x/run b/s390x/run
> index 34552c2747d4..9ecfaf983a3d 100755
> --- a/s390x/run
> +++ b/s390x/run
> @@ -47,4 +47,4 @@ command+=" -kernel"
>   command="$(panic_cmd) $(migration_cmd) $(timeout_cmd) $command"
>   
>   # We return the exit code via stdout, not via the QEMU return code
> -run_qemu_status $command "$@"
> +run_test_status $command "$@"
> diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> index 8643bab3b252..8cf67e4f3b51 100644
> --- a/scripts/arch-run.bash
> +++ b/scripts/arch-run.bash
> @@ -1,30 +1,7 @@
> -##############################################################################
> -# run_qemu translates the ambiguous exit status in Table1 to that in Table2.
> -# Table3 simply documents the complete status table.
> -#
> -# Table1: Before fixup
> -# --------------------
> -# 0      - Unexpected exit from QEMU (possible signal), or the unittest did
> -#          not use debug-exit
> -# 1      - most likely unittest succeeded, or QEMU failed
> -#
> -# Table2: After fixup
> -# -------------------
> -# 0      - Everything succeeded
> -# 1      - most likely QEMU failed
> -#
> -# Table3: Complete table
> -# ----------------------
> -# 0      - SUCCESS
> -# 1      - most likely QEMU failed
> -# 2      - most likely a run script failed
> -# 3      - most likely the unittest failed
> -# 124    - most likely the unittest timed out
> -# 127    - most likely the unittest called abort()
> -# 1..127 - FAILURE (could be QEMU, a run script, or the unittest)
> -# >= 128 - Signal (signum = status - 128)
> -##############################################################################
> -run_qemu ()
> +source config.mak
> +source scripts/vmm.bash
> +
> +run_test ()
>   {
>   	local stdout errors ret sig
>   
> @@ -39,48 +16,17 @@ run_qemu ()
>   	ret=$?
>   	exec {stdout}>&-
>   
> -	[ $ret -eq 134 ] && echo "QEMU Aborted" >&2
> -
> -	if [ "$errors" ]; then
> -		sig=$(grep 'terminating on signal' <<<"$errors")
> -		if [ "$sig" ]; then
> -			# This is too complex for ${var/search/replace}
> -			# shellcheck disable=SC2001
> -			sig=$(sed 's/.*terminating on signal \([0-9][0-9]*\).*/\1/' <<<"$sig")
> -		fi
> -	fi
> -
> -	if [ $ret -eq 0 ]; then
> -		# Some signals result in a zero return status, but the
> -		# error log tells the truth.
> -		if [ "$sig" ]; then
> -			((ret=sig+128))
> -		else
> -			# Exiting with zero (non-debugexit) is an error
> -			ret=1
> -		fi
> -	elif [ $ret -eq 1 ]; then
> -		# Even when ret==1 (unittest success) if we also got stderr
> -		# logs, then we assume a QEMU failure. Otherwise we translate
> -		# status of 1 to 0 (SUCCESS)
> -	        if [ "$errors" ]; then
> -			if ! grep -qvi warning <<<"$errors" ; then
> -				ret=0
> -			fi
> -		else
> -			ret=0
> -		fi
> -	fi
> +	ret=$(${vmm_opts[$TARGET:fixup_return_code]} $ret $errors)
>   
>   	return $ret
>   }
>   
> -run_qemu_status ()
> +run_test_status ()
>   {
>   	local stdout ret
>   
>   	exec {stdout}>&1
> -	lines=$(run_qemu "$@" > >(tee /dev/fd/$stdout))
> +	lines=$(run_test "$@" > >(tee /dev/fd/$stdout))
>   	ret=$?
>   	exec {stdout}>&-
>   
> @@ -422,6 +368,25 @@ search_qemu_binary ()
>   	export PATH=$save_path
>   }
>   
> +search_kvmtool_binary ()
> +{
> +	local kvmtoolcmd kvmtool
> +
> +	for kvmtoolcmd in lkvm vm lkvm-static; do
> +		if "$kvmtoolcmd" --help 2>/dev/null| grep -q 'The most commonly used'; then
> +			kvmtool="$kvmtoolcmd"
> +			break
> +		fi
> +	done
> +
> +	if [ -z "$kvmtool" ]; then
> +		echo "A kvmtool binary was not found." >&2
> +		return 2
> +	fi
> +
> +	command -v $kvmtool
> +}
> +
>   initrd_cleanup ()
>   {
>   	rm -f $KVM_UNIT_TESTS_ENV
> @@ -447,7 +412,7 @@ initrd_create ()
>   	fi
>   
>   	unset INITRD
> -	[ -f "$KVM_UNIT_TESTS_ENV" ] && INITRD="-initrd $KVM_UNIT_TESTS_ENV"
> +	[ -f "$KVM_UNIT_TESTS_ENV" ] && INITRD="${vmm_opts[$TARGET:initrd]} $KVM_UNIT_TESTS_ENV"
>   
>   	return 0
>   }
> @@ -471,18 +436,23 @@ env_params ()
>   	local qemu have_qemu
>   	local _ rest
>   
> -	qemu=$(search_qemu_binary) && have_qemu=1
> +	env_add_params TARGET
>   
> -	if [ "$have_qemu" ]; then
> -		if [ -n "$ACCEL" ] || [ -n "$QEMU_ACCEL" ]; then
> -			[ -n "$ACCEL" ] && QEMU_ACCEL=$ACCEL
> +	# kvmtool's versioning has been broken since it was split from the
> +	# kernel source.
> +	if [ $TARGET = "qemu" ]; then
> +		qemu=$(search_qemu_binary) && have_qemu=1
> +		if [ "$have_qemu" ]; then
> +			if [ -n "$ACCEL" ] || [ -n "$QEMU_ACCEL" ]; then
> +				[ -n "$ACCEL" ] && QEMU_ACCEL=$ACCEL
> +			fi
> +			QEMU_VERSION_STRING="$($qemu -h | head -1)"
> +			# Shellcheck does not see QEMU_MAJOR|MINOR|MICRO are used
> +			# shellcheck disable=SC2034
> +			IFS='[ .]' read -r _ _ _ QEMU_MAJOR QEMU_MINOR QEMU_MICRO rest <<<"$QEMU_VERSION_STRING"
>   		fi
> -		QEMU_VERSION_STRING="$($qemu -h | head -1)"
> -		# Shellcheck does not see QEMU_MAJOR|MINOR|MICRO are used
> -		# shellcheck disable=SC2034
> -		IFS='[ .]' read -r _ _ _ QEMU_MAJOR QEMU_MINOR QEMU_MICRO rest <<<"$QEMU_VERSION_STRING"
> +		env_add_params QEMU_ACCEL QEMU_VERSION_STRING QEMU_MAJOR QEMU_MINOR QEMU_MICRO
>   	fi
> -	env_add_params QEMU_ACCEL QEMU_VERSION_STRING QEMU_MAJOR QEMU_MINOR QEMU_MICRO
>   
>   	KERNEL_VERSION_STRING=$(uname -r)
>   	IFS=. read -r KERNEL_VERSION KERNEL_PATCHLEVEL rest <<<"$KERNEL_VERSION_STRING"
> diff --git a/scripts/vmm.bash b/scripts/vmm.bash
> index b02055a5c0b6..20968f2e6b10 100644
> --- a/scripts/vmm.bash
> +++ b/scripts/vmm.bash
> @@ -1,10 +1,99 @@
>   source config.mak
>   
> +##############################################################################
> +# qemu_fixup_return_code translates the ambiguous exit status in Table1 to that
> +# in Table2.  Table3 simply documents the complete status table.
> +#
> +# Table1: Before fixup
> +# --------------------
> +# 0      - Unexpected exit from QEMU (possible signal), or the unittest did
> +#          not use debug-exit
> +# 1      - most likely unittest succeeded, or QEMU failed
> +#
> +# Table2: After fixup
> +# -------------------
> +# 0      - Everything succeeded
> +# 1      - most likely QEMU failed
> +#
> +# Table3: Complete table
> +# ----------------------
> +# 0      - SUCCESS
> +# 1      - most likely QEMU failed
> +# 2      - most likely a run script failed
> +# 3      - most likely the unittest failed
> +# 124    - most likely the unittest timed out
> +# 127    - most likely the unittest called abort()
> +# 1..127 - FAILURE (could be QEMU, a run script, or the unittest)
> +# >= 128 - Signal (signum = status - 128)
> +##############################################################################
> +qemu_fixup_return_code()
> +{
> +	local ret=$1
> +	# Remove $ret from the list of arguments
> +	shift 1
> +	local errors="$@"
> +	local sig
> +
> +	[ $ret -eq 134 ] && echo "QEMU Aborted" >&2
> +
> +	if [ "$errors" ]; then
> +		sig=$(grep 'terminating on signal' <<<"$errors")
> +		if [ "$sig" ]; then
> +			# This is too complex for ${var/search/replace}
> +			# shellcheck disable=SC2001
> +			sig=$(sed 's/.*terminating on signal \([0-9][0-9]*\).*/\1/' <<<"$sig")
> +		fi
> +	fi
> +
> +	if [ $ret -eq 0 ]; then
> +		# Some signals result in a zero return status, but the
> +		# error log tells the truth.
> +		if [ "$sig" ]; then
> +			((ret=sig+128))
> +		else
> +			# Exiting with zero (non-debugexit) is an error
> +			ret=1
> +		fi
> +	elif [ $ret -eq 1 ]; then
> +		# Even when ret==1 (unittest success) if we also got stderr
> +		# logs, then we assume a QEMU failure. Otherwise we translate
> +		# status of 1 to 0 (SUCCESS)
> +	        if [ "$errors" ]; then
> +			if ! grep -qvi warning <<<"$errors" ; then
> +				ret=0
> +			fi
> +		else
> +			ret=0
> +		fi
> +	fi
> +
> +	echo $ret
> +}
> +
> +kvmtool_fixup_return_code()
> +{
> +	local ret=$1
> +
> +	# Force run_test_status() to interpret the STATUS line.
> +	if [ $ret -eq 0 ]; then
> +		ret=1
> +	fi
> +
> +	echo $ret
> +}
> +
>   declare -A vmm_opts=(
>   	[qemu:nr_cpus]='-smp'
>   	[qemu:kernel]='-kernel'
>   	[qemu:args]='-append'
>   	[qemu:initrd]='-initrd'
> +	[qemu:fixup_return_code]=qemu_fixup_return_code
> +
> +	[kvmtool:nr_cpus]='--cpus'
> +	[kvmtool:kernel]='--kernel'
> +	[kvmtool:args]='--params'
> +	[kvmtool:initrd]='--initrd'
> +	[kvmtool:fixup_return_code]=kvmtool_fixup_return_code
>   )
>   
>   function check_vmm_supported()
> diff --git a/x86/run b/x86/run
> index a3d3e7db8891..91bcd0b9ae41 100755
> --- a/x86/run
> +++ b/x86/run
> @@ -49,7 +49,7 @@ if [ "${CONFIG_EFI}" = y ]; then
>   	# UEFI, the test case binaries are passed to QEMU through the disk
>   	# image, not through the '-kernel' flag. And QEMU reports an error if it
>   	# gets '-initrd' without a '-kernel'
> -	ENVIRON_DEFAULT=n run_qemu ${command} "$@"
> +	ENVIRON_DEFAULT=n run_test ${command} "$@"
>   else
> -	run_qemu ${command} "$@"
> +	run_test ${command} "$@"
>   fi

-- 
Shaoqin


