Return-Path: <linuxppc-dev+bounces-8413-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A67AAE71A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 18:47:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zt1QV61JMz30LS;
	Thu,  8 May 2025 02:47:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.185
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746636450;
	cv=none; b=AdJceudRBLocg88Oz0aK1mwjTwDTnFGrtxKydQaYFMCnuZXtI0wGfwKdYOz5vTTueJBvE+hoV7U3FuiXj+e7uxfgD8dhC4/LzzbyOHeWqgdBgyZZUEFpKWOIQL2SiELnOiL8YiI3XdMHPmY9A+aLJTEjYPJes8KctBu+Tu4wlP/vViiDbZJ1b7mbwd6RV9DLEZOu8sqf/FcyW2uE0DUgM7ezCC40kRkCwb5L819HqqxY6BEeYTBEDvS5b/vQD7Pg54l5+stqtqfHfZ4pe44k3Kh/c+z+NgLcsPHrB7PZJqJ7xffP4cmCSGdadqa5g82TjpZRcxFMeZDhNmnPK2hdFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746636450; c=relaxed/relaxed;
	bh=nq0jvPXcCaXcZzDjqmWJrmU0XBhQs2iQrx8JeAPfxmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QpBTl9Ih1q7scYGEmQwOG51I+VJtbA8uHSpB9Y2mw3YB6yFbtJKac64S/Z7iXItk8W0G1Y7gQ5yu8DVx6f/Ssmmr3F0AXDXyjXcCfPdtsfu9Uf2UcsgxzI0Ni55/reVRJ7ag2frW1//tFCv2zo2pcr7sjsJMRkmL05icG1G48+hvhD45m4Zj4jMHLTqDyxw+7w1XY5bd8wbPqw+ClbKYKhFbM09IfZ+WAZ10EPebOwA7PgNNSCbaHu/tEGrtNYCjv0CozwOUPuiuHgibl65zvbWDjx+8FIf8DkHzuFeWOWOxkzn8T7iClF3MBZ3w+4TpleX/uwLkoS/xh6GPaZEU1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xjTaAO9U; dkim-atps=neutral; spf=pass (client-ip=91.218.175.185; helo=out-185.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xjTaAO9U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.185; helo=out-185.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zt1QV13Fcz30DP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 02:47:30 +1000 (AEST)
Date: Wed, 7 May 2025 18:47:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746636431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nq0jvPXcCaXcZzDjqmWJrmU0XBhQs2iQrx8JeAPfxmg=;
	b=xjTaAO9U8LQ4Kd2hRhF3e7XyPcfoUKEneZZEGF63X62j83ZwidnhiT0cNab9+CxKKAinqs
	tQrsKIMffkrdIVznOheKfefvPn0Cvws33o9gx/1+kb6bnqYhrsToL/MFO8XcsBXols2z6S
	vS0CRp0fg8fKA82L2HYyV6KJxOp4Rvo=
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
Subject: Re: [kvm-unit-tests PATCH v3 12/16] scripts: Detect kvmtool failure
 in premature_failure()
Message-ID: <20250507-44b6574c7e69e3c56d762552@orel>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
 <20250507151256.167769-13-alexandru.elisei@arm.com>
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
In-Reply-To: <20250507151256.167769-13-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 07, 2025 at 04:12:52PM +0100, Alexandru Elisei wrote:
> kvm-unit-tests assumes that if the VMM is able to get to where it tries to
> load the kernel, then the VMM and the configuration parameters will also
> work for running the test. All of this is done in premature_failure().
> 
> Teach premature_failure() about the kvmtool's error message when it fails
> to load the dummy kernel.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  scripts/runtime.bash |  8 +++-----
>  scripts/vmm.bash     | 23 +++++++++++++++++++++++
>  2 files changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> index 86d8a2cd8528..01ec8eae2bba 100644
> --- a/scripts/runtime.bash
> +++ b/scripts/runtime.bash
> @@ -1,3 +1,5 @@
> +source scripts/vmm.bash
> +
>  : "${RUNTIME_arch_run?}"
>  : "${MAX_SMP:=$(getconf _NPROCESSORS_ONLN)}"
>  : "${TIMEOUT:=90s}"
> @@ -19,11 +21,7 @@ premature_failure()
>  
>      log="$(eval "$(get_cmdline _NO_FILE_4Uhere_)" 2>&1)"
>  
> -    echo "$log" | grep "_NO_FILE_4Uhere_" |
> -        grep -q -e "[Cc]ould not \(load\|open\) kernel" \
> -                -e "error loading" \
> -                -e "failed to load" &&
> -        return 1
> +    ${vmm_opts[$TARGET:parse_premature_failure]} "$log" || return 1
>  
>      RUNTIME_log_stderr <<< "$log"
>  
> diff --git a/scripts/vmm.bash b/scripts/vmm.bash
> index d24a4c4b8713..a1d50ed51981 100644
> --- a/scripts/vmm.bash
> +++ b/scripts/vmm.bash
> @@ -93,6 +93,27 @@ kvmtool_fixup_return_code()
>  	echo $ret
>  }
>  
> +function qemu_parse_premature_failure()
> +{
> +	local log="$@"
> +
> +	echo "$log" | grep "_NO_FILE_4Uhere_" |
> +		grep -q -e "[Cc]ould not \(load\|open\) kernel" \
> +			-e "error loading" \
> +			-e "failed to load" &&
> +		return 1
> +	return 0
> +}
> +
> +function kvmtool_parse_premature_failure()
> +{
> +	local log="$@"
> +
> +	echo "$log" | grep "Fatal: Unable to open kernel _NO_FILE_4Uhere_" &&
> +		return 1
> +	return 0
> +}
> +
>  declare -A vmm_opts=(
>  	[qemu:nr_cpus]='-smp'
>  	[qemu:kernel]='-kernel'
> @@ -100,6 +121,7 @@ declare -A vmm_opts=(
>  	[qemu:initrd]='-initrd'
>  	[qemu:default_opts]=''
>  	[qemu:fixup_return_code]=qemu_fixup_return_code
> +	[qemu:parse_premature_failure]=qemu_parse_premature_failure
>  
>  	[kvmtool:nr_cpus]='--cpus'
>  	[kvmtool:kernel]='--kernel'
> @@ -107,6 +129,7 @@ declare -A vmm_opts=(
>  	[kvmtool:initrd]='--initrd'
>  	[kvmtool:default_opts]="$KVMTOOL_DEFAULT_OPTS"
>  	[kvmtool:fixup_return_code]=kvmtool_fixup_return_code
> +	[kvmtool:parse_premature_failure]=kvmtool_parse_premature_failure
>  )
>  
>  function check_vmm_supported()
> -- 
> 2.49.0
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

