Return-Path: <linuxppc-dev+bounces-8450-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C00AAFFAA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 May 2025 17:55:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZtcD00fnpz30WY;
	Fri,  9 May 2025 01:55:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746719728;
	cv=none; b=OX8k9OboVB6/iL3jmvPegtBGBER/tnTJcdU6Iq/xPzcoGjVY+kEepmBYfbMxbrzRA97TXdHWXUByW/Vsb92KAxgEAl3iU/uLg5NGGBkWJSzXgh9BrLOTX9auCuMZ0/Pq/rSRGqg8okxqsRnRFXuLJyVwbwmwbixyPjLfGMW4EzElf/u2RQgakCpkVlK87xC8kb1ioMM38jUNZmdkXbaOQzt8YtE4oWyfghTMWFN8rV46DoIM2COwaR6Z+gKFQ9OSzBdnUxsShcSQYnTuyc1FeanE74WffndP6pMukmnX7rIoz+k3K0SOK6BN5o9tH3qLat9fUFooSdD8gKKKC40z/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746719728; c=relaxed/relaxed;
	bh=AQvB/KWc1LW9miibDO+UHTfTbW0CW9eFmn8SKzy81KI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U9IpjMBFFz7nwlSvQgnQltMV5lL4q7piX9hzea5zRvvO2mcC6CPjH0M0850y9jVfTpvYw40abCe06WO4tA3radUUIJW1er7p/r6acDXa3kqjKgjYWpaHGwsBYJV4rPtKt7UGU5TyuTFvRPImTBErKLV9nTmk7rtc1fTwog+xqXfdCO0MB6xM5WQxgKt/SK8JR4Nhkaug0xemk4rg8I5U75UKmpLAmSfFfKGqiXxwcqUNolRvZsPtR6kiZlEYYXzN5W9s8Aw7RUawS1ioQ2m/J9VGDDT80SgWaV3oiWg81y6JgHQQFc8kVBPgoLu0UkW7yXM0QRVaNyC222+4r20jGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZtcCy56M7z307K
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 May 2025 01:55:24 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DB761E2F;
	Thu,  8 May 2025 08:54:42 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 539973F5A1;
	Thu,  8 May 2025 08:54:49 -0700 (PDT)
Date: Thu, 8 May 2025 16:54:46 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com,
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com,
	david@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org,
	oliver.upton@linux.dev, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joey.gouly@arm.com, andre.przywara@arm.com
Subject: Re: [kvm-unit-tests PATCH v3 08/16] scripts: Add 'kvmtool_params' to
 test definition
Message-ID: <aBzTxv6pO4rWu4CU@raptor>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
 <20250507151256.167769-9-alexandru.elisei@arm.com>
 <20250507-5b376c9bc878cbdffabdb3c2@orel>
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
In-Reply-To: <20250507-5b376c9bc878cbdffabdb3c2@orel>
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Drew,

On Wed, May 07, 2025 at 06:28:04PM +0200, Andrew Jones wrote:
> On Wed, May 07, 2025 at 04:12:48PM +0100, Alexandru Elisei wrote:
> > arm/arm64 supports running tests under kvmtool, but kvmtool's syntax for
> > running and configuring a virtual machine is different to qemu. To run
> > tests using the automated test infrastructure, add a new test parameter,
> > 'kvmtool_params'. The parameter serves the exact purpose as 'qemu_params',
> > but using kvmtool's syntax.
> > 
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > ---
> >  arm/unittests.cfg   | 24 +++++++++++++++++++++++
> >  docs/unittests.txt  |  8 ++++++++
> >  scripts/common.bash | 47 +++++++++++++++++++++++++++++----------------
> >  3 files changed, 62 insertions(+), 17 deletions(-)
> > 
> > diff --git a/arm/unittests.cfg b/arm/unittests.cfg
> > index a4192ed7e20b..f3c773e56933 100644
> > --- a/arm/unittests.cfg
> > +++ b/arm/unittests.cfg
> > @@ -17,6 +17,7 @@ file = selftest.flat
> >  smp = 2
> >  test_args = 'setup smp=2 mem=256'
> >  qemu_params = -m 256
> > +kvmtool_params = --mem 256
> >  groups = selftest
> >  
> >  # Test vector setup and exception handling (kernel mode).
> > @@ -48,66 +49,77 @@ groups = pci
> >  file = pmu.flat
> >  groups = pmu
> >  test_args = "cycle-counter 0"
> > +kvmtool_params = --pmu
> >  
> >  [pmu-event-introspection]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  test_args = pmu-event-introspection
> > +kvmtool_params = --pmu
> >  
> >  [pmu-event-counter-config]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  test_args = pmu-event-counter-config
> > +kvmtool_params = --pmu
> >  
> >  [pmu-basic-event-count]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  test_args = pmu-basic-event-count
> > +kvmtool_params = --pmu
> >  
> >  [pmu-mem-access]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  test_args = pmu-mem-access
> > +kvmtool_params = --pmu
> >  
> >  [pmu-mem-access-reliability]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  test_args = pmu-mem-access-reliability
> > +kvmtool_params = --pmu
> >  
> >  [pmu-sw-incr]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  test_args = pmu-sw-incr
> > +kvmtool_params = --pmu
> >  
> >  [pmu-chained-counters]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  test_args = pmu-chained-counters
> > +kvmtool_params = --pmu
> >  
> >  [pmu-chained-sw-incr]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  test_args = pmu-chained-sw-incr
> > +kvmtool_params = --pmu
> >  
> >  [pmu-chain-promotion]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  test_args = pmu-chain-promotion
> > +kvmtool_params = --pmu
> >  
> >  [pmu-overflow-interrupt]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  test_args = pmu-overflow-interrupt
> > +kvmtool_params = --pmu
> >  
> >  # Test PMU support (TCG) with -icount IPC=1
> >  #[pmu-tcg-icount-1]
> > @@ -131,6 +143,7 @@ file = gic.flat
> >  smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
> >  test_args = ipi
> >  qemu_params = -machine gic-version=2
> > +kvmtool_params = --irqchip=gicv2
> >  groups = gic
> >  
> >  [gicv2-mmio]
> > @@ -138,6 +151,7 @@ file = gic.flat
> >  smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
> >  test_args = mmio
> >  qemu_params = -machine gic-version=2
> > +kvmtool_params = --irqchip=gicv2
> >  groups = gic
> >  
> >  [gicv2-mmio-up]
> > @@ -145,6 +159,7 @@ file = gic.flat
> >  smp = 1
> >  test_args = mmio
> >  qemu_params = -machine gic-version=2
> > +kvmtool_params = --irqchip=gicv2
> >  groups = gic
> >  
> >  [gicv2-mmio-3p]
> > @@ -152,6 +167,7 @@ file = gic.flat
> >  smp = $((($MAX_SMP < 3)?$MAX_SMP:3))
> >  test_args = mmio
> >  qemu_params = -machine gic-version=2
> > +kvmtool_params = --irqchip=gicv2
> >  groups = gic
> >  
> >  [gicv3-ipi]
> > @@ -159,6 +175,7 @@ file = gic.flat
> >  smp = $MAX_SMP
> >  test_args = ipi
> >  qemu_params = -machine gic-version=3
> > +kvmtool_params = --irqchip=gicv3
> >  groups = gic
> >  
> >  [gicv2-active]
> > @@ -166,6 +183,7 @@ file = gic.flat
> >  smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
> >  test_args = active
> >  qemu_params = -machine gic-version=2
> > +kvmtool_params = --irqchip=gicv2
> >  groups = gic
> >  
> >  [gicv3-active]
> > @@ -173,6 +191,7 @@ file = gic.flat
> >  smp = $MAX_SMP
> >  test_args = active
> >  qemu_params = -machine gic-version=3
> > +kvmtool_params = --irqchip=gicv3
> >  groups = gic
> >  
> >  [its-introspection]
> > @@ -180,6 +199,7 @@ file = gic.flat
> >  smp = $MAX_SMP
> >  test_args = its-introspection
> >  qemu_params = -machine gic-version=3
> > +kvmtool_params = --irqchip=gicv3-its
> >  groups = its
> >  arch = arm64
> >  
> > @@ -188,6 +208,7 @@ file = gic.flat
> >  smp = $MAX_SMP
> >  test_args = its-trigger
> >  qemu_params = -machine gic-version=3
> > +kvmtool_params = --irqchip=gicv3-its
> >  groups = its
> >  arch = arm64
> >  
> > @@ -196,6 +217,7 @@ file = gic.flat
> >  smp = $MAX_SMP
> >  test_args = its-migration
> >  qemu_params = -machine gic-version=3
> > +kvmtool_params = --irqchip=gicv3
> >  groups = its migration
> >  arch = arm64
> >  
> > @@ -204,6 +226,7 @@ file = gic.flat
> >  smp = $MAX_SMP
> >  test_args = its-pending-migration
> >  qemu_params = -machine gic-version=3
> > +kvmtool_params = --irqchip=gicv3
> >  groups = its migration
> >  arch = arm64
> >  
> > @@ -212,6 +235,7 @@ file = gic.flat
> >  smp = $MAX_SMP
> >  test_args = its-migrate-unmapped-collection
> >  qemu_params = -machine gic-version=3
> > +kvmtool_params = --irqchip=gicv3
> >  groups = its migration
> >  arch = arm64
> >  
> > diff --git a/docs/unittests.txt b/docs/unittests.txt
> > index ea0da959f008..a9164bccc24c 100644
> > --- a/docs/unittests.txt
> > +++ b/docs/unittests.txt
> > @@ -78,6 +78,14 @@ extra_params
> >  Alias for 'qemu_params', supported for compatibility purposes. Use
> >  'qemu_params' for new tests.
> >  
> > +kvmtool_params
> > +--------------
> > +Extra parameters supplied to the kvmtool process. Works similarly to
> > +'qemu_params', but uses kvmtool's syntax for command line arguments. The
> > +example for 'qemu_params', applied to kvmtool, would be:
> > +
> > +kvmtool_params = --mem 256
> > +
> >  groups
> >  ------
> >  groups = <group_name1> <group_name2> ...
> > diff --git a/scripts/common.bash b/scripts/common.bash
> > index 649f1c737617..0645235d8baa 100644
> > --- a/scripts/common.bash
> > +++ b/scripts/common.bash
> > @@ -1,6 +1,29 @@
> >  source config.mak
> >  source scripts/vmm.bash
> >  
> > +function parse_opts()
> > +{
> > +	local opts="$1"
> > +	local fd="$2"
> > +
> > +	while read -r -u $fd; do
> > +		#escape backslash newline, but not double backslash
> > +		if [[ $opts =~ [^\\]*(\\*)$'\n'$ ]]; then
> > +			if (( ${#BASH_REMATCH[1]} % 2 == 1 )); then
> > +				opts=${opts%\\$'\n'}
> > +			fi
> > +		fi
> > +		if [[ "$REPLY" =~ ^(.*)'"""'[:blank:]*$ ]]; then
> > +			opts+=${BASH_REMATCH[1]}
> > +			break
> > +		else
> > +			opts+=$REPLY$'\n'
> > +		fi
> > +	done
> > +
> > +	echo "$opts"
> > +}
> > +
> >  function for_each_unittest()
> >  {
> >  	local unittests="$1"
> > @@ -46,24 +69,14 @@ function for_each_unittest()
> >  			smp="${vmm_opts[$TARGET:nr_cpus]} ${BASH_REMATCH[1]}"
> >  		elif [[ $line =~ ^test_args\ *=\ *(.*)$ ]]; then
> >  			test_args="${vmm_opts[$TARGET:args]} ${BASH_REMATCH[1]}"
> > -		elif [[ $line =~ ^(extra_params|qemu_params)\ *=\ *'"""'(.*)$ ]]; then
> > -			opts=${BASH_REMATCH[2]}$'\n'
> > -			while read -r -u $fd; do
> > -				#escape backslash newline, but not double backslash
> > -				if [[ $opts =~ [^\\]*(\\*)$'\n'$ ]]; then
> > -					if (( ${#BASH_REMATCH[1]} % 2 == 1 )); then
> > -						opts=${opts%\\$'\n'}
> > -					fi
> > -				fi
> > -				if [[ "$REPLY" =~ ^(.*)'"""'[:blank:]*$ ]]; then
> > -					opts+=${BASH_REMATCH[1]}
> > -					break
> > -				else
> > -					opts+=$REPLY$'\n'
> > -				fi
> > -			done
> > -		elif [[ $line =~ ^(extra_params|qemu_params)\ *=\ *(.*)$ ]]; then
> > +		elif [[ $TARGET = "qemu" ]] && [[ $line =~ ^(extra_params|qemu_params)\ *=\ *'"""'(.*)$ ]]; then
> 
> Should use == with [[ ]]

Ack.

> 
> > +			opts=$(parse_opts ${BASH_REMATCH[2]}$'\n' $fd)
> > +		elif [[ $TARGET  = "qemu" ]] && [[ $line =~ ^(extra_params|qemu_params)\ *=\ *(.*)$ ]]; then
>                                ^ extra space
> 
> >  			opts=${BASH_REMATCH[2]}
> > +		elif [[ $TARGET = "kvmtool" ]] && [[ $line =~ ^kvmtool_params\ *=\ *'"""'(.*)$ ]]; then
> > +			opts=$(parse_opts ${BASH_REMATCH[1]}$'\n' $fd)
> > +		elif [[ $TARGET = "kvmtool" ]] && [[ $line =~ ^kvmtool_params\ *=\ *(.*)$ ]]; then
> > +			opts=${BASH_REMATCH[1]}
> 
> I think we can do something like
> 
> if [[ $TARGET == "qemu" ]]; then
>    params='(extra_params|qemu_params)'
> elif [[ $TARGET == "kvmtool" ]]; then
>    params='(kvmtool_params)'
> else
>    ...fail...
> fi
> 
> And then use $params in the regular expressions and always use
> BASH_REMATCH[2]. That would allow us to avoid duplicating the if
> statements and then we wouldn't need to factor out parse_opts either.

Sounds good. I can even wrap it with with a vmm function, something like
vmm_get_params_name().

Thanks,
Alex

> 
> Thanks,
> drew
> 
> >  		elif [[ $line =~ ^groups\ *=\ *(.*)$ ]]; then
> >  			groups=${BASH_REMATCH[1]}
> >  		elif [[ $line =~ ^arch\ *=\ *(.*)$ ]]; then
> > -- 
> > 2.49.0
> > 
> > 
> > -- 
> > kvm-riscv mailing list
> > kvm-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/kvm-riscv

