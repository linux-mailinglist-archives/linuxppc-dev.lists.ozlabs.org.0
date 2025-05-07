Return-Path: <linuxppc-dev+bounces-8408-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A544AAE6A4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 18:28:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zt10s622Tz30DR;
	Thu,  8 May 2025 02:28:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::ba"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746635325;
	cv=none; b=Oi20/eGNjC9AmesDUuwLQSQ9+BX4iPzaV7Gs03clqI2If+PCkTdPH9+x/g5qk+F377dibhjjbOf2kIaHhDWqcr2TlaIUIXWuAFeHCIBeS9sFodgBpNvO0+72V/aKubp9kC8+RwzafaWRA6c+vdVY6tiuCn3fneTJreY9ASXmH0gfue31Np1M/GdaRnfLpyqwWAgt4ZfRbO0LxxHmj81T/0WjpKbrh+8m0gKf0EENwMxlJ7IHKNxVF0+H/z7AQvAZyTJhvHdm3H5fTXHmb3X0YEuq4iudEk8+PZ4rOSAi1dwt3/8mU28Ze645oSdzOahSFv/asmYDct3zfYj+qGf2yA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746635325; c=relaxed/relaxed;
	bh=uZ+/PxtWl6nzVoV+9eYTtusxdZ2MaYcOmQ2l7+j67sY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oblli/5z1iwggR0Iht5mX63o3G1Loi4olI1xGVfw6eV7RQAOdMD3rx3RGw8MHA9Yw3FdOVAbcNt5XnG3Q2xKvO50Oi1hJt3tlwVcsjgDXpKZlNwohosn47dUvUWXbVrFK7T1i2NXrp4Fd85gZlZPJO0+vCsGp6qwChSqqHBgGf86aomkG3/inkkES0wiDlL7CxfA/Jj/xChrkTsRlz9c02UZomgT4krAUxQjNz7pwLGDkkaJUrnzIzH/jtdsVr6RhPzkDC38kF1c6ZoNpuxRbi6wY/rkTULvybRG795UNeILMMNl7HQTLDforHD89R3PRutkdbJ9OskgjObnmkH3Ng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TVM5u1Ga; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::ba; helo=out-186.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TVM5u1Ga;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::ba; helo=out-186.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [IPv6:2001:41d0:1004:224b::ba])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zt10p4Kjvz30DP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 02:28:41 +1000 (AEST)
Date: Wed, 7 May 2025 18:28:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746635301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uZ+/PxtWl6nzVoV+9eYTtusxdZ2MaYcOmQ2l7+j67sY=;
	b=TVM5u1Ganj79z24Twq6gaJYAt9iMdS0VxRM0OG3WFSrBd1rv+EbJutGo8RW0mUp/LUn2rG
	X1i07Tn0fPYmdATTaWRI73gPVE6aw6YbuFCr7JlRJGmI6R/VOi+mUv+tpsucptjZWM3kS5
	DIOnui57Wgn7Ezh3Z2mEGIV03RI+9AA=
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
Subject: Re: [kvm-unit-tests PATCH v3 08/16] scripts: Add 'kvmtool_params' to
 test definition
Message-ID: <20250507-5b376c9bc878cbdffabdb3c2@orel>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
 <20250507151256.167769-9-alexandru.elisei@arm.com>
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
In-Reply-To: <20250507151256.167769-9-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 07, 2025 at 04:12:48PM +0100, Alexandru Elisei wrote:
> arm/arm64 supports running tests under kvmtool, but kvmtool's syntax for
> running and configuring a virtual machine is different to qemu. To run
> tests using the automated test infrastructure, add a new test parameter,
> 'kvmtool_params'. The parameter serves the exact purpose as 'qemu_params',
> but using kvmtool's syntax.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  arm/unittests.cfg   | 24 +++++++++++++++++++++++
>  docs/unittests.txt  |  8 ++++++++
>  scripts/common.bash | 47 +++++++++++++++++++++++++++++----------------
>  3 files changed, 62 insertions(+), 17 deletions(-)
> 
> diff --git a/arm/unittests.cfg b/arm/unittests.cfg
> index a4192ed7e20b..f3c773e56933 100644
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
> index 649f1c737617..0645235d8baa 100644
> --- a/scripts/common.bash
> +++ b/scripts/common.bash
> @@ -1,6 +1,29 @@
>  source config.mak
>  source scripts/vmm.bash
>  
> +function parse_opts()
> +{
> +	local opts="$1"
> +	local fd="$2"
> +
> +	while read -r -u $fd; do
> +		#escape backslash newline, but not double backslash
> +		if [[ $opts =~ [^\\]*(\\*)$'\n'$ ]]; then
> +			if (( ${#BASH_REMATCH[1]} % 2 == 1 )); then
> +				opts=${opts%\\$'\n'}
> +			fi
> +		fi
> +		if [[ "$REPLY" =~ ^(.*)'"""'[:blank:]*$ ]]; then
> +			opts+=${BASH_REMATCH[1]}
> +			break
> +		else
> +			opts+=$REPLY$'\n'
> +		fi
> +	done
> +
> +	echo "$opts"
> +}
> +
>  function for_each_unittest()
>  {
>  	local unittests="$1"
> @@ -46,24 +69,14 @@ function for_each_unittest()
>  			smp="${vmm_opts[$TARGET:nr_cpus]} ${BASH_REMATCH[1]}"
>  		elif [[ $line =~ ^test_args\ *=\ *(.*)$ ]]; then
>  			test_args="${vmm_opts[$TARGET:args]} ${BASH_REMATCH[1]}"
> -		elif [[ $line =~ ^(extra_params|qemu_params)\ *=\ *'"""'(.*)$ ]]; then
> -			opts=${BASH_REMATCH[2]}$'\n'
> -			while read -r -u $fd; do
> -				#escape backslash newline, but not double backslash
> -				if [[ $opts =~ [^\\]*(\\*)$'\n'$ ]]; then
> -					if (( ${#BASH_REMATCH[1]} % 2 == 1 )); then
> -						opts=${opts%\\$'\n'}
> -					fi
> -				fi
> -				if [[ "$REPLY" =~ ^(.*)'"""'[:blank:]*$ ]]; then
> -					opts+=${BASH_REMATCH[1]}
> -					break
> -				else
> -					opts+=$REPLY$'\n'
> -				fi
> -			done
> -		elif [[ $line =~ ^(extra_params|qemu_params)\ *=\ *(.*)$ ]]; then
> +		elif [[ $TARGET = "qemu" ]] && [[ $line =~ ^(extra_params|qemu_params)\ *=\ *'"""'(.*)$ ]]; then

Should use == with [[ ]]

> +			opts=$(parse_opts ${BASH_REMATCH[2]}$'\n' $fd)
> +		elif [[ $TARGET  = "qemu" ]] && [[ $line =~ ^(extra_params|qemu_params)\ *=\ *(.*)$ ]]; then
                               ^ extra space

>  			opts=${BASH_REMATCH[2]}
> +		elif [[ $TARGET = "kvmtool" ]] && [[ $line =~ ^kvmtool_params\ *=\ *'"""'(.*)$ ]]; then
> +			opts=$(parse_opts ${BASH_REMATCH[1]}$'\n' $fd)
> +		elif [[ $TARGET = "kvmtool" ]] && [[ $line =~ ^kvmtool_params\ *=\ *(.*)$ ]]; then
> +			opts=${BASH_REMATCH[1]}

I think we can do something like

if [[ $TARGET == "qemu" ]]; then
   params='(extra_params|qemu_params)'
elif [[ $TARGET == "kvmtool" ]]; then
   params='(kvmtool_params)'
else
   ...fail...
fi

And then use $params in the regular expressions and always use
BASH_REMATCH[2]. That would allow us to avoid duplicating the if
statements and then we wouldn't need to factor out parse_opts either.

Thanks,
drew

>  		elif [[ $line =~ ^groups\ *=\ *(.*)$ ]]; then
>  			groups=${BASH_REMATCH[1]}
>  		elif [[ $line =~ ^arch\ *=\ *(.*)$ ]]; then
> -- 
> 2.49.0
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

