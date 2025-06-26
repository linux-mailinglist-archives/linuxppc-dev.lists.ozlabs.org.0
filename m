Return-Path: <linuxppc-dev+bounces-9834-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57808AEA2B6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 17:34:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSjRD0Rx3z3bmS;
	Fri, 27 Jun 2025 01:34:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::b4"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750952072;
	cv=none; b=ZYFS0+xTrHNfw18xod/fw8GWU0W6ZS0X6mmnPXtjQZCcypHCVQvrvd1dVgbW3/IoC+zr82KuWNwX6ORFTywXtz6fh8TyKWZPB8VP5ClnzsfjzJlxK5T74NtfHJqSDavaMrm/3HUTLIS4fZ0lRs0OGm/Id8whWj/4tuQTd8sh74LiRvaj+bw8IfgH7HT9SLWCMdzvplj4OGy4MKP8c4oVWNxwdyDKqFQvXy+rA96sOvwYXEXa0jnLTy3LONP9RBGUzEczkkEzfQG2QV52anqmXYITiF30tltLoxFnsmc7ci24A4VfU4gi6OTrNuU/ppQFLCEtBiZUH0G5rbKAZ9vDXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750952072; c=relaxed/relaxed;
	bh=MTzNaxET0ChI04GPtqPBTqvxpAjkYbCN9vCfFYsRF38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vddjjp2m7jOZYroCJwe1VPyMREp2Pl2fabEIQu7gKY6yBVytvaJV0Gra2M+SpKIA3i59IBxE9RIEsf2qk7LZGRzS2F/0PCEAcumzshLK9NbxkUD1+lxdgtsWBiGgvl5RGn0o8Uz0yYR9yVaj4xLagByXUsafTCQQSDsrsohi1m31Db7znA/Z7vFFRrs5CxtTU3pcKBfJlJ6dHz+5Rtad9JcdECseGLZPvoROUg7DcJlACKxXnA8ANiX5sWM5sUEbESmZ40UYVkM1wsSj77q66ItkZv/+ciR3yu50slkmtB+/K3JSDE1wNVvNehfNMc5HoR7HsSHkpMe6kndRleETVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VbAk0zVY; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::b4; helo=out-180.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VbAk0zVY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::b4; helo=out-180.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSjRB6LMbz30TG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jun 2025 01:34:29 +1000 (AEST)
Date: Thu, 26 Jun 2025 17:34:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750952049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MTzNaxET0ChI04GPtqPBTqvxpAjkYbCN9vCfFYsRF38=;
	b=VbAk0zVY3LpVMPdjT1q9dlT77cCaKVIQfwS+uoJPiRLBafmsyB2B1R08LAelYTxPDUkXf7
	aTDYMyOKol3oE7o8dx41P4mNEt1G45xZFYhNxQwHmo17JA3igEXvGaxKvBnRBgIQW62Av8
	/NfH0hk9/ARpm/tHc9wIWCUNV6u6hzI=
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
Subject: Re: [kvm-unit-tests PATCH v4 05/13] scripts: Add 'kvmtool_params' to
 test definition
Message-ID: <20250626-536c0af00aa655d6e647df44@orel>
References: <20250625154813.27254-1-alexandru.elisei@arm.com>
 <20250625154813.27254-6-alexandru.elisei@arm.com>
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
In-Reply-To: <20250625154813.27254-6-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 25, 2025 at 04:48:05PM +0100, Alexandru Elisei wrote:
> arm/arm64 supports running tests under kvmtool, but kvmtool's syntax for
> running and configuring a virtual machine is different to qemu. To run
> tests using the automated test infrastructure, add a new test parameter,
> 'kvmtool_params'. The parameter serves the exact purpose as 'qemu_params',
> but using kvmtool's syntax.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
> 
> Changes v3->v4:
> 
> * Added params_name in scripts/common.bash::for_each_unittest() to avoid
> checking for $TARGET when deciding to parse kvmtool_params or
> {qemu,extra}_params.
> * Dropped factoring out parse_opts() in for_each_unittest().
> 
>  arm/unittests.cfg   | 24 ++++++++++++++++++++++++
>  docs/unittests.txt  |  8 ++++++++
>  scripts/common.bash | 11 +++++++----
>  scripts/vmm.bash    | 16 ++++++++++++++++
>  4 files changed, 55 insertions(+), 4 deletions(-)
> 
> diff --git a/arm/unittests.cfg b/arm/unittests.cfg
> index 384af983cd88..343c14567f27 100644
> --- a/arm/unittests.cfg
> +++ b/arm/unittests.cfg
> @@ -17,6 +17,7 @@ file = selftest.flat
>  smp = 2
>  test_args = 'setup smp=2 mem=256'
>  qemu_params = -m 256
> +kvmtool_params = --mem 256
>  groups = selftest
>  
>  # Test vector setup and exception handling (kernel mode).
> @@ -48,66 +49,77 @@ groups = pci
>  file = pmu.flat
>  groups = pmu
>  test_args = "cycle-counter 0"
> +kvmtool_params = --pmu
>  
>  [pmu-event-introspection]
>  file = pmu.flat
>  groups = pmu
>  arch = arm64
>  test_args = pmu-event-introspection
> +kvmtool_params = --pmu
>  
>  [pmu-event-counter-config]
>  file = pmu.flat
>  groups = pmu
>  arch = arm64
>  test_args = pmu-event-counter-config
> +kvmtool_params = --pmu
>  
>  [pmu-basic-event-count]
>  file = pmu.flat
>  groups = pmu
>  arch = arm64
>  test_args = pmu-basic-event-count
> +kvmtool_params = --pmu
>  
>  [pmu-mem-access]
>  file = pmu.flat
>  groups = pmu
>  arch = arm64
>  test_args = pmu-mem-access
> +kvmtool_params = --pmu
>  
>  [pmu-mem-access-reliability]
>  file = pmu.flat
>  groups = pmu
>  arch = arm64
>  test_args = pmu-mem-access-reliability
> +kvmtool_params = --pmu
>  
>  [pmu-sw-incr]
>  file = pmu.flat
>  groups = pmu
>  arch = arm64
>  test_args = pmu-sw-incr
> +kvmtool_params = --pmu
>  
>  [pmu-chained-counters]
>  file = pmu.flat
>  groups = pmu
>  arch = arm64
>  test_args = pmu-chained-counters
> +kvmtool_params = --pmu
>  
>  [pmu-chained-sw-incr]
>  file = pmu.flat
>  groups = pmu
>  arch = arm64
>  test_args = pmu-chained-sw-incr
> +kvmtool_params = --pmu
>  
>  [pmu-chain-promotion]
>  file = pmu.flat
>  groups = pmu
>  arch = arm64
>  test_args = pmu-chain-promotion
> +kvmtool_params = --pmu
>  
>  [pmu-overflow-interrupt]
>  file = pmu.flat
>  groups = pmu
>  arch = arm64
>  test_args = pmu-overflow-interrupt
> +kvmtool_params = --pmu
>  
>  # Test PMU support (TCG) with -icount IPC=1
>  #[pmu-tcg-icount-1]
> @@ -131,6 +143,7 @@ file = gic.flat
>  smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
>  test_args = ipi
>  qemu_params = -machine gic-version=2
> +kvmtool_params = --irqchip=gicv2
>  groups = gic
>  
>  [gicv2-mmio]
> @@ -138,6 +151,7 @@ file = gic.flat
>  smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
>  test_args = mmio
>  qemu_params = -machine gic-version=2
> +kvmtool_params = --irqchip=gicv2
>  groups = gic
>  
>  [gicv2-mmio-up]
> @@ -145,6 +159,7 @@ file = gic.flat
>  smp = 1
>  test_args = mmio
>  qemu_params = -machine gic-version=2
> +kvmtool_params = --irqchip=gicv2
>  groups = gic
>  
>  [gicv2-mmio-3p]
> @@ -152,6 +167,7 @@ file = gic.flat
>  smp = $((($MAX_SMP < 3)?$MAX_SMP:3))
>  test_args = mmio
>  qemu_params = -machine gic-version=2
> +kvmtool_params = --irqchip=gicv2
>  groups = gic
>  
>  [gicv3-ipi]
> @@ -159,6 +175,7 @@ file = gic.flat
>  smp = $MAX_SMP
>  test_args = ipi
>  qemu_params = -machine gic-version=3
> +kvmtool_params = --irqchip=gicv3
>  groups = gic
>  
>  [gicv2-active]
> @@ -166,6 +183,7 @@ file = gic.flat
>  smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
>  test_args = active
>  qemu_params = -machine gic-version=2
> +kvmtool_params = --irqchip=gicv2
>  groups = gic
>  
>  [gicv3-active]
> @@ -173,6 +191,7 @@ file = gic.flat
>  smp = $MAX_SMP
>  test_args = active
>  qemu_params = -machine gic-version=3
> +kvmtool_params = --irqchip=gicv3
>  groups = gic
>  
>  [its-introspection]
> @@ -180,6 +199,7 @@ file = gic.flat
>  smp = $MAX_SMP
>  test_args = its-introspection
>  qemu_params = -machine gic-version=3
> +kvmtool_params = --irqchip=gicv3-its
>  groups = its
>  arch = arm64
>  
> @@ -188,6 +208,7 @@ file = gic.flat
>  smp = $MAX_SMP
>  test_args = its-trigger
>  qemu_params = -machine gic-version=3
> +kvmtool_params = --irqchip=gicv3-its
>  groups = its
>  arch = arm64
>  
> @@ -196,6 +217,7 @@ file = gic.flat
>  smp = $MAX_SMP
>  test_args = its-migration
>  qemu_params = -machine gic-version=3
> +kvmtool_params = --irqchip=gicv3
>  groups = its migration
>  arch = arm64
>  
> @@ -204,6 +226,7 @@ file = gic.flat
>  smp = $MAX_SMP
>  test_args = its-pending-migration
>  qemu_params = -machine gic-version=3
> +kvmtool_params = --irqchip=gicv3
>  groups = its migration
>  arch = arm64
>  
> @@ -212,6 +235,7 @@ file = gic.flat
>  smp = $MAX_SMP
>  test_args = its-migrate-unmapped-collection
>  qemu_params = -machine gic-version=3
> +kvmtool_params = --irqchip=gicv3
>  groups = its migration
>  arch = arm64
>  
> diff --git a/docs/unittests.txt b/docs/unittests.txt
> index ea0da959f008..a9164bccc24c 100644
> --- a/docs/unittests.txt
> +++ b/docs/unittests.txt
> @@ -78,6 +78,14 @@ extra_params
>  Alias for 'qemu_params', supported for compatibility purposes. Use
>  'qemu_params' for new tests.
>  
> +kvmtool_params
> +--------------
> +Extra parameters supplied to the kvmtool process. Works similarly to
> +'qemu_params', but uses kvmtool's syntax for command line arguments. The
> +example for 'qemu_params', applied to kvmtool, would be:
> +
> +kvmtool_params = --mem 256
> +
>  groups
>  ------
>  groups = <group_name1> <group_name2> ...
> diff --git a/scripts/common.bash b/scripts/common.bash
> index ae127bd4e208..7c1b89f1b3c2 100644
> --- a/scripts/common.bash
> +++ b/scripts/common.bash
> @@ -18,6 +18,9 @@ function for_each_unittest()
>  	local timeout
>  	local rematch
>  
> +	# shellcheck disable=SC2155
> +	local params_name=$(vmm_unittest_params_name)
> +
>  	exec {fd}<"$unittests"
>  
>  	while read -r -u $fd line; do
> @@ -47,8 +50,8 @@ function for_each_unittest()
>  			smp="$(vmm_optname_nr_cpus) ${BASH_REMATCH[1]}"
>  		elif [[ $line =~ ^test_args\ *=\ *(.*)$ ]]; then
>  			test_args="$(vmm_optname_args) ${BASH_REMATCH[1]}"
> -		elif [[ $line =~ ^(extra_params|qemu_params)\ *=\ *'"""'(.*)$ ]]; then
> -			opts=${BASH_REMATCH[2]}$'\n'
> +		elif [[ $line =~ ^$params_name\ *=\ *'"""'(.*)$ ]]; then
> +			opts=${BASH_REMATCH[1]}$'\n'
>  			while read -r -u $fd; do
>  				#escape backslash newline, but not double backslash
>  				if [[ $opts =~ [^\\]*(\\*)$'\n'$ ]]; then
> @@ -63,8 +66,8 @@ function for_each_unittest()
>  					opts+=$REPLY$'\n'
>  				fi
>  			done
> -		elif [[ $line =~ ^(extra_params|qemu_params)\ *=\ *(.*)$ ]]; then
> -			opts=${BASH_REMATCH[2]}
> +		elif [[ $line =~ ^$params_name\ *=\ *(.*)$ ]]; then
> +			opts=${BASH_REMATCH[1]}
>  		elif [[ $line =~ ^groups\ *=\ *(.*)$ ]]; then
>  			groups=${BASH_REMATCH[1]}
>  		elif [[ $line =~ ^arch\ *=\ *(.*)$ ]]; then
> diff --git a/scripts/vmm.bash b/scripts/vmm.bash
> index 7629b2b9146e..9a2608eb3fd4 100644
> --- a/scripts/vmm.bash
> +++ b/scripts/vmm.bash
> @@ -38,3 +38,19 @@ function vmm_check_supported()
>  		;;
>  	esac
>  }
> +
> +function vmm_unittest_params_name()
> +{
> +	# shellcheck disable=SC2155
> +	local target=$(vmm_get_target)
> +
> +	case "$target" in
> +	qemu)
> +		echo "extra_params|qemu_params"
> +		;;
> +	*)
> +		echo "$0 does not support '$target'"
> +		exit 2
> +		;;

It seems a bit odd that we've introduced kvmtool_params and applied it to
arm in this patch, but we still don't support it. Not a huge deal, though.

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

> +	esac
> +}
> -- 
> 2.50.0
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

