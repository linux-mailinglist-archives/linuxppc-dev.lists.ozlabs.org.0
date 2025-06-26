Return-Path: <linuxppc-dev+bounces-9820-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73576AEA27F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 17:29:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSjKq5J90z30Ff;
	Fri, 27 Jun 2025 01:29:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.173
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750951791;
	cv=none; b=afi1AG8rq1CKVETukw3Todzc+AynISkd8ZBcHHTEq6DUY8vHI+XMNk/7iulcQsw8/R9tRxsg4WqmoQ7alhbEHjB131R95Yr6gy0tWcek2j1VXJ/4fCshH0IpautyMOyVv+z9qsMYdvkQeZi9WuDHVw+XpCTlnmHS9vKrhepIClGJIGXA6Mi+1K4KOLhtEpqrUglXs3ZVbtl32wwcMHPY1bqeSDsJP5nIfmY71yodJIeuY2ODcHSwVKvscg4pOtUJ1RSoaqePsEFbw3mGKoZwdN6Zj3fmE7RZZ3Bt/0DDXDHpv3jryAP9VQskiK5l0unZBnU9vufUUW7JcdxogQBv4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750951791; c=relaxed/relaxed;
	bh=B7njsQqS9+YDhVOAJu3gcu6bWM9s+UemRcmSG7r3Qvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f4uz+PSzKfCu27KVSKo/rrFTBhyb+b5PqURUv+EAuT4mOCgaWxcEmKkkUW6oZSreUmAEr2j9+IIC/nfollWZdwHuCNRqD43L5tbSG6ufBX/3fqaNSNY3PuoJGIlU6F4XxbDV43TXlvR3hq+M6nir/ZxzC+UCJoceeB7rXVSkvZbqGb8rUqXi0M+2esi/zPJzA/zdo0ki+xlF6OJyCx8PfhUv8wC7Mdx4rv4IWYmUj9i4SMopHr3GJY3+TkEWIUJ+cshYJyz2o2tpMFhzDGNRtx806uGObm6dUwBC7nvndhZdamnU9A9SBEryXA9i/Z3yULDmqFxSSmILsHfr4goIaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=U45XfFqA; dkim-atps=neutral; spf=pass (client-ip=95.215.58.173; helo=out-173.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=U45XfFqA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.173; helo=out-173.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSjKn1fKwz2xYl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jun 2025 01:29:48 +1000 (AEST)
Date: Thu, 26 Jun 2025 17:29:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750951769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B7njsQqS9+YDhVOAJu3gcu6bWM9s+UemRcmSG7r3Qvs=;
	b=U45XfFqA2ERqttsJj+PAHPpQC2ZDqBxFOMZkRVL0AKADe70nTLxOPuIU65WzUbbUkfsd+b
	5F4Vl+NzEJJXuyUPzkvbfiUTJcyprTFO9NS8GCkwKwzbJoV8XZN2iwQViQVZoVEXuKzyna
	Yg50+iFSUL3/OH0CegRsxadieDifpF4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	oliver.upton@linux.dev, suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, 
	andre.przywara@arm.com, shahuang@redhat.com
Subject: Re: [kvm-unit-tests PATCH v4 04/13] scripts: Use an associative
 array for qemu argument names
Message-ID: <20250626-5cba2905b81b7a5b3a016bfa@orel>
References: <20250625154813.27254-1-alexandru.elisei@arm.com>
 <20250625154813.27254-5-alexandru.elisei@arm.com>
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
In-Reply-To: <20250625154813.27254-5-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 25, 2025 at 04:48:04PM +0100, Alexandru Elisei wrote:
> Move away from hardcoded qemu arguments and use instead an associative
> array to get the needed arguments. This paves the way for adding kvmtool
> support to the scripts, which has a different syntax for the same VM
> configuration parameters.
> 
> Suggested-by: Andrew Jones <andrew.jones@linux.dev>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
> 
> Changes v3->v4:
> 
> * Renamed vmm_opts to vmm_optname.
> * Dropped entries for 'kernel' and 'initrd' in vmm_optname because they weren't
> used in this patch.
> * Use vmm_optname_nr_cpus() and vmm_optname_args() instead of directly indexing
> into vmm_optname.
> * Dropped the check for empty $test_args in scripts/runtime.bash::run() by
> having $test_args already contain --append if not empty in
> scripts/common.bash::for_each_unittest().
> 
>  scripts/common.bash  | 11 ++++++++---
>  scripts/runtime.bash |  7 +------
>  scripts/vmm.bash     | 15 +++++++++++++++
>  3 files changed, 24 insertions(+), 9 deletions(-)
> 
> diff --git a/scripts/common.bash b/scripts/common.bash
> index 9deb87d4050d..ae127bd4e208 100644
> --- a/scripts/common.bash
> +++ b/scripts/common.bash
> @@ -1,4 +1,5 @@
>  source config.mak
> +source scripts/vmm.bash
>  
>  function for_each_unittest()
>  {
> @@ -26,8 +27,12 @@ function for_each_unittest()
>  				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$test_args" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
>  			fi
>  			testname=$rematch
> -			smp=1
> +			smp="$(vmm_optname_nr_cpus) 1"
>  			kernel=""
> +			# Intentionally don't use -append if test_args is empty
> +			# because qemu interprets the first word after
> +			# -append as a kernel parameter instead of a command
> +			# line option.
>  			test_args=""
>  			opts=""
>  			groups=""
> @@ -39,9 +44,9 @@ function for_each_unittest()
>  		elif [[ $line =~ ^file\ *=\ *(.*)$ ]]; then
>  			kernel=$TEST_DIR/${BASH_REMATCH[1]}
>  		elif [[ $line =~ ^smp\ *=\ *(.*)$ ]]; then
> -			smp=${BASH_REMATCH[1]}
> +			smp="$(vmm_optname_nr_cpus) ${BASH_REMATCH[1]}"
>  		elif [[ $line =~ ^test_args\ *=\ *(.*)$ ]]; then
> -			test_args=${BASH_REMATCH[1]}
> +			test_args="$(vmm_optname_args) ${BASH_REMATCH[1]}"
>  		elif [[ $line =~ ^(extra_params|qemu_params)\ *=\ *'"""'(.*)$ ]]; then
>  			opts=${BASH_REMATCH[2]}$'\n'
>  			while read -r -u $fd; do
> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> index bc17b89f4ff5..86d8a2cd8528 100644
> --- a/scripts/runtime.bash
> +++ b/scripts/runtime.bash
> @@ -34,7 +34,7 @@ premature_failure()
>  get_cmdline()
>  {
>      local kernel=$1
> -    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel -smp $smp $opts"
> +    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel $smp $test_args $opts"
>  }
>  
>  skip_nodefault()
> @@ -88,11 +88,6 @@ function run()
>      local accel="${10}"
>      local timeout="${11:-$TIMEOUT}" # unittests.cfg overrides the default
>  
> -    # If $test_args is empty, qemu will interpret the first option after -append
> -    # as a test argument instead of a qemu option, so make sure that doesn't
> -    # happen.
> -    [ -n "$test_args" ] && opts="-append $test_args $opts"
> -
>      if [ "${CONFIG_EFI}" == "y" ]; then
>          kernel=${kernel/%.flat/.efi}
>      fi
> diff --git a/scripts/vmm.bash b/scripts/vmm.bash
> index 8365c1424a3f..7629b2b9146e 100644
> --- a/scripts/vmm.bash
> +++ b/scripts/vmm.bash
> @@ -1,3 +1,18 @@
> +declare -A vmm_optname=(
> +	[qemu,args]='-append'
> +	[qemu,nr_cpus]='-smp'
> +)
> +
> +function vmm_optname_args()
> +{
> +	echo ${vmm_optname[$(vmm_get_target),args]}
> +}
> +
> +function vmm_optname_nr_cpus()
> +{
> +	echo ${vmm_optname[$(vmm_get_target),nr_cpus]}
> +}
> +
>  function vmm_get_target()
>  {
>  	if [[ -z "$TARGET" ]]; then
> -- 
> 2.50.0
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

