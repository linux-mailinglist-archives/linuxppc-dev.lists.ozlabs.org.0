Return-Path: <linuxppc-dev+bounces-5466-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CFBA1823F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2025 17:47:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YctQx6l4fz30W7;
	Wed, 22 Jan 2025 03:47:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.171
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737478025;
	cv=none; b=SyfV+4OhpYlj6++S6G7PJyhC1f+qQY2aVTVSi27sYugPI/APOWR8s8TBjYqV/nz/m8yKFJF+otTZoBb4OMow7yZwmwQEDeQaVNanyGBKYMEk78qMfFEaG2c1Di4l3vi3THCr563OHKF/bytuC0Qj+5SifRTg4HedK1nwvI2YgiWhDUDWl6XX219mZSOFUIoG6CREK+oof+amE7KQdxHvVSOEkzyOQ0hEQCvcYJBy7WmNbcBcdl99v/kvBhZS2B9fR5LbK2OhTDi8Qyd7gn9wZ5aFCxf9v244yzKxo8KsL0XBLX6AqJv1E9uBTuzN28LvYbA74XdQ+/i1h44tH82aGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737478025; c=relaxed/relaxed;
	bh=LMDJSTgByuHuWrF2+uScssRNOl6HgzX8LOlSQPUcRws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4Xs47szi+djrBgUL5QzRBtrBQjBsTKtuIosNAhRHHAvzxJJQrOsm+uWwaAbdRxRNWiw9udiFLLeW8ZMd1u2g4KR5n7CYcY6vqBCK05hDozpb2O6iiPLauaVWc+fxHg0ffP3UgRjJGAxltMY1fbAcXfpVsDs/cb85kwviU4fR4Sf3byYZu4dXeDY07z8/QzbiOxbPhaY0+6TDvSd61JHi/wV8/bvT+1INopcgFGxCw2/A9RqxPSB8pSaO4kYEvaSWkYmr8KcNFW8qcmADZQ8U2OIWBUlb/bUpF4kaz0gdauR/lJPT8YsI+E0tuI4iFGyHCLALyPrPQkYUdkdZRTdBw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=95.215.58.171; helo=out-171.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.171; helo=out-171.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YctQq1QyBz30Vq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2025 03:46:57 +1100 (AEDT)
Date: Tue, 21 Jan 2025 17:46:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737477998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LMDJSTgByuHuWrF2+uScssRNOl6HgzX8LOlSQPUcRws=;
	b=wuIDtc2yfqgfAnYegMfah6645g08I7FlG9GU+dqPRMQ8U6LBeH9IjLof1MGjb+rxaAdz5i
	Al49afIJSCUlxQktOJcZOoe7U8yEBBNg+SPcqQRNW71XBPUaUxkZp9xBqizTpvIqsdEqo8
	3Kzqt2+TM67t9sZxvlZR/57kF/8p+Bw=
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
Subject: Re: [kvm-unit-tests PATCH v2 10/18] scripts/arch-run: Add support
 for kvmtool
Message-ID: <20250121-90381c319e835109e0515bbd@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-11-alexandru.elisei@arm.com>
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
In-Reply-To: <20250120164316.31473-11-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 20, 2025 at 04:43:08PM +0000, Alexandru Elisei wrote:
> Add two new functions, search_kvmtool_binary(), which, like the name
> suggests, searches for the location of the kvmtool binary, and
> run_kvmtool(), which runs a test with kvmtool as the VMM.
> 
> initrd_create() has also been modified to use the kvmtool syntax for
> supplying an initrd, which is --initrd (two dashes instead of the single
> dash that qemu uses).
> 
> arm/run does not know how to use these functions yet, but this will be
> added in a subsequent patch.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  scripts/arch-run.bash | 94 +++++++++++++++++++++++++++++++++++++------
>  1 file changed, 81 insertions(+), 13 deletions(-)
> 
> diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> index d6eaf0ee5f09..34f633cade01 100644
> --- a/scripts/arch-run.bash
> +++ b/scripts/arch-run.bash
> @@ -75,16 +75,47 @@ run_qemu ()
>  	return $ret
>  }
>  
> +run_kvmtool ()
> +{
> +	local stdout errors ret sig
> +
> +	initrd_create || return $?
> +
> +	echo -n "$@"
> +	[ "$ENVIRON_DEFAULT" = "yes" ] && echo -n " #"
> +	echo " $INITRD"
> +
> +	# stdout to {stdout}, stderr to $errors and stderr
> +	exec {stdout}>&1
> +	"${@}" $INITRD </dev/null 2> >(tee /dev/stderr) > /dev/fd/$stdout
> +	ret=$?
> +	exec {stdout}>&-
> +
> +	return $ret
> +}

It seems like run_qemu should mostly apply to kvmtool since kvmtool could
also terminate on a signal, like the timeout SIGALRM. Maybe we should try
to get them to use the same thing and name it run_test()? Or at least we
can factor out the common parts to avoid duplication.

> +
>  run_test_status ()
>  {
> -	local stdout ret
> +	local stdout ret ret_success
>  
>  	exec {stdout}>&1
> -	lines=$(run_qemu "$@" > >(tee /dev/fd/$stdout))
> +
> +	# For qemu, an exit status of 1 means that the test completed. For kvmtool,
> +	# 0 means the same thing.
> +	case "$TARGET" in
> +	qemu)
> +		ret_success=1
> +		lines=$(run_qemu "$@" > >(tee /dev/fd/$stdout))
> +		;;
> +	kvmtool)
> +		ret_success=0
> +		lines=$(run_kvmtool "$@" > >(tee /dev/fd/$stdout))
> +		;;
> +	esac
>  	ret=$?
>  	exec {stdout}>&-
>  
> -	if [ $ret -eq 1 ]; then
> +	if [ $ret -eq $ret_success ]; then
>  		testret=$(grep '^EXIT: ' <<<"$lines" | head -n1 | sed 's/.*STATUS=\([0-9][0-9]*\).*/\1/')
>  		if [ "$testret" ]; then
>  			if [ $testret -eq 1 ]; then
> @@ -422,6 +453,25 @@ search_qemu_binary ()
>  	export PATH=$save_path
>  }
>  
> +search_kvmtool_binary ()
> +{
> +	local kvmtoolcmd kvmtool
> +
> +	for kvmtoolcmd in lkvm vm lkvm-static; do
> +		if $kvmtoolcmd --help 2>/dev/null| grep -q 'The most commonly used'; then
> +			kvmtool="$kvmtoolcmd"
> +			break
> +		fi
> +	done
> +
> +	if [ -z "$kvmtool" ]; then
> +		echo "A kvmtool binary was not found." >&2

Do we want to support a KVMTOOL environment variable analogous to $QEMU?
If so we can also add the help text that search_qemu_binary() has here.

> +		return 2
> +	fi
> +
> +	command -v $kvmtool
> +}
> +
>  initrd_cleanup ()
>  {
>  	rm -f $KVM_UNIT_TESTS_ENV
> @@ -447,7 +497,18 @@ initrd_create ()
>  	fi
>  
>  	unset INITRD
> -	[ -f "$KVM_UNIT_TESTS_ENV" ] && INITRD="-initrd $KVM_UNIT_TESTS_ENV"
> +	if [ ! -f "$KVM_UNIT_TESTS_ENV" ]; then
> +		return 0
> +	fi
> +
> +	case "$TARGET" in
> +		qemu)
> +			INITRD="-initrd $KVM_UNIT_TESTS_ENV"
> +			;;
> +		kvmtool)
> +			INITRD="--initrd $KVM_UNIT_TESTS_ENV"
> +			;;
> +	esac

vmm_opts[qemu,initrd]='-initrd'
vmm_opts[kvmtool,initrd]='--initrd'

>  
>  	return 0
>  }
> @@ -471,18 +532,25 @@ env_params ()
>  	local qemu have_qemu
>  	local _ rest
>  
> -	qemu=$(search_qemu_binary) && have_qemu=1
> +	env_add_params TARGET
> +
> +	# kvmtool's versioning has been broken since it was split from the kernel
> +	# source.
> +	if [ "$TARGET" = "qemu" ]; then
> +		qemu=$(search_qemu_binary) && have_qemu=1
>  
> -	if [ "$have_qemu" ]; then
> -		if [ -n "$ACCEL" ] || [ -n "$QEMU_ACCEL" ]; then
> -			[ -n "$ACCEL" ] && QEMU_ACCEL=$ACCEL
> +		if [ "$have_qemu" ]; then
> +			if [ -n "$ACCEL" ] || [ -n "$QEMU_ACCEL" ]; then
> +				[ -n "$ACCEL" ] && QEMU_ACCEL=$ACCEL
> +			fi
> +			QEMU_VERSION_STRING="$($qemu -h | head -1)"
> +			# Shellcheck does not see QEMU_MAJOR|MINOR|MICRO are used
> +			# shellcheck disable=SC2034
> +			IFS='[ .]' read -r _ _ _ QEMU_MAJOR QEMU_MINOR QEMU_MICRO rest <<<"$QEMU_VERSION_STRING"
>  		fi
> -		QEMU_VERSION_STRING="$($qemu -h | head -1)"
> -		# Shellcheck does not see QEMU_MAJOR|MINOR|MICRO are used
> -		# shellcheck disable=SC2034
> -		IFS='[ .]' read -r _ _ _ QEMU_MAJOR QEMU_MINOR QEMU_MICRO rest <<<"$QEMU_VERSION_STRING"
> +
> +		env_add_params QEMU_ACCEL QEMU_VERSION_STRING QEMU_MAJOR QEMU_MINOR QEMU_MICRO
>  	fi
> -	env_add_params QEMU_ACCEL QEMU_VERSION_STRING QEMU_MAJOR QEMU_MINOR QEMU_MICRO
>  
>  	KERNEL_VERSION_STRING=$(uname -r)
>  	IFS=. read -r KERNEL_VERSION KERNEL_PATCHLEVEL rest <<<"$KERNEL_VERSION_STRING"
> -- 
> 2.47.1
>

Thanks,
drew

