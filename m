Return-Path: <linuxppc-dev+bounces-8414-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C64AAE721
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 18:49:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zt1SX3k9Yz30MY;
	Thu,  8 May 2025 02:49:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::bc"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746636556;
	cv=none; b=aRH1bfxAA51CjrMDs+hQ/5RZ2oJX52400xS0M8V+ou3Gcm6SZ6NjPmpZD7TKLSEAVbxAOijlGtLjuvDOcopBu7QXyecvw4/UwMRhWUXOhB+CmrBZgybgIuCg5Iy0EPA9LEH3I3CWRgvqpB0wrdQ13sHBynjYCqtCTEZE9cEuuf0ZetbqUkFDFVELDmnbKc7PNczvnDQq/op/dX2sOndO3YSd2Yc/B7WcrKIQE87B3nqN0CD9D3RLA4j5V9W07/KFww6lAIq/mdGGiIoAgqxiy6Jv2QusGQf1qDaw/6MHNX8DE3slp8DnCN277uVEV175fkQMoG0A3fVcGVE1jQLYiw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746636556; c=relaxed/relaxed;
	bh=2RpamE2srlpqeXHrljbpcOM2Ay/589KHDerW4ekHgUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ARGZ2zkRRJKs/6mVSFPF1w4x+ZIAjDUMDZj8Fp6fp4xR5gQVXdRx8a++QLSa3hEdmQhg/Q+Z1u0tijXq3YCu2h2PxSSydYQ8cuxOo9NHUeC+XmXJ3twvy2Pd2zHqg82fzW3dyPs+TX/T5272tXqgvo7w2o9y7VTTNCDDwe1+ZiSmOOpszg9cib4hjq5z07jpVOYvvHFaqjJpBiAhHvZB3FLXzLzthNE4I5/IRr8YgGgKLZKM88wHrTvgJcE4lqLJS7eqqI/9AB+KSTtWB9i3YJMOSYsQLfk5P4L74L2YfQXg0XfHcH3Hk3LlBvJPtTPADB9vpR08m54EErq4KcdE0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pZjO/Dq1; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::bc; helo=out-188.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pZjO/Dq1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::bc; helo=out-188.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [IPv6:2001:41d0:203:375::bc])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zt1SW4zmMz30DP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 02:49:15 +1000 (AEST)
Date: Wed, 7 May 2025 18:48:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746636535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2RpamE2srlpqeXHrljbpcOM2Ay/589KHDerW4ekHgUI=;
	b=pZjO/Dq1wiCjg2M3GtCbh5dD3dLgzdP6L3Kwa+o1eEo5wqwXY9g4EhJqMQY/Bi/EpxnfA0
	558VvSquXY1JzId+uqGR9L0c8F8U/bW2i0cbPFE5/5UzbATwdBpa9GCxfLKSp/MNrFT22H
	+23vVs422Ir3vA6F77jcwbdE2AsR2Cc=
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
Subject: Re: [kvm-unit-tests PATCH v3 13/16] scripts: Do not probe for
 maximum number of VCPUs when using kvmtool
Message-ID: <20250507-71bfb831e524b5c437c6a828@orel>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
 <20250507151256.167769-14-alexandru.elisei@arm.com>
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
In-Reply-To: <20250507151256.167769-14-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 07, 2025 at 04:12:53PM +0100, Alexandru Elisei wrote:
> The --probe-maxsmp parameter updates MAX_SMP with the maximum number of
> VCPUs that the host supports. Qemu will exit with an error when creating a
> virtual machine if the number of VCPUs is exceeded.
> 
> kvmtool behaves differently: it will automatically limit the number of
> VCPUs to the what KVM supports, which is exactly what --probe-maxsmp wants
> to achieve. When doing --probe-maxsmp with kvmtool, print a message
> explaining why it's redundant and don't do anything else.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  run_tests.sh         |  3 ++-
>  scripts/runtime.bash | 16 ----------------
>  scripts/vmm.bash     | 24 ++++++++++++++++++++++++
>  3 files changed, 26 insertions(+), 17 deletions(-)
> 
> diff --git a/run_tests.sh b/run_tests.sh
> index 150a06a91064..a69c3665b7a4 100755
> --- a/run_tests.sh
> +++ b/run_tests.sh
> @@ -10,6 +10,7 @@ if [ ! -f config.mak ]; then
>  fi
>  source config.mak
>  source scripts/common.bash
> +source scripts/vmm.bash
>  
>  function usage()
>  {
> @@ -90,7 +91,7 @@ while [ $# -gt 0 ]; do
>              list_tests="yes"
>              ;;
>          --probe-maxsmp)
> -            probe_maxsmp
> +            ${vmm_opts[$TARGET:probe_maxsmp]}
>              ;;
>          --)
>              ;;
> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> index 01ec8eae2bba..a802686c511d 100644
> --- a/scripts/runtime.bash
> +++ b/scripts/runtime.bash
> @@ -209,19 +209,3 @@ function run()
>  
>      return $ret
>  }
> -
> -#
> -# Probe for MAX_SMP, in case it's less than the number of host cpus.
> -#
> -function probe_maxsmp()
> -{
> -	local smp
> -
> -	if smp=$($RUNTIME_arch_run _NO_FILE_4Uhere_ -smp $MAX_SMP |& grep 'SMP CPUs'); then
> -		smp=${smp##* }
> -		smp=${smp/\(}
> -		smp=${smp/\)}
> -		echo "Restricting MAX_SMP from ($MAX_SMP) to the max supported ($smp)" >&2
> -		MAX_SMP=$smp
> -	fi
> -}
> diff --git a/scripts/vmm.bash b/scripts/vmm.bash
> index a1d50ed51981..ef9819f4132c 100644
> --- a/scripts/vmm.bash
> +++ b/scripts/vmm.bash
> @@ -105,6 +105,22 @@ function qemu_parse_premature_failure()
>  	return 0
>  }
>  
> +#
> +# Probe for MAX_SMP, in case it's less than the number of host cpus.
> +#
> +function qemu_probe_maxsmp()
> +{
> +	local smp
> +
> +	if smp=$($RUNTIME_arch_run _NO_FILE_4Uhere_ -smp $MAX_SMP |& grep 'SMP CPUs'); then
> +		smp=${smp##* }
> +		smp=${smp/\(}
> +		smp=${smp/\)}
> +		echo "Restricting MAX_SMP from ($MAX_SMP) to the max supported ($smp)" >&2
> +		MAX_SMP=$smp
> +	fi
> +}
> +
>  function kvmtool_parse_premature_failure()
>  {
>  	local log="$@"
> @@ -114,6 +130,12 @@ function kvmtool_parse_premature_failure()
>  	return 0
>  }
>  
> +function kvmtool_probe_maxsmp()
> +{
> +	echo "kvmtool automatically limits the number of VCPUs to maximum supported"
> +	echo "The 'smp' test parameter won't be modified"
> +}
> +
>  declare -A vmm_opts=(
>  	[qemu:nr_cpus]='-smp'
>  	[qemu:kernel]='-kernel'
> @@ -122,6 +144,7 @@ declare -A vmm_opts=(
>  	[qemu:default_opts]=''
>  	[qemu:fixup_return_code]=qemu_fixup_return_code
>  	[qemu:parse_premature_failure]=qemu_parse_premature_failure
> +	[qemu:probe_maxsmp]=qemu_probe_maxsmp
>  
>  	[kvmtool:nr_cpus]='--cpus'
>  	[kvmtool:kernel]='--kernel'
> @@ -130,6 +153,7 @@ declare -A vmm_opts=(
>  	[kvmtool:default_opts]="$KVMTOOL_DEFAULT_OPTS"
>  	[kvmtool:fixup_return_code]=kvmtool_fixup_return_code
>  	[kvmtool:parse_premature_failure]=kvmtool_parse_premature_failure
> +	[kvmtool:probe_maxsmp]=kvmtool_probe_maxsmp
>  )
>  
>  function check_vmm_supported()
> -- 
> 2.49.0
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

