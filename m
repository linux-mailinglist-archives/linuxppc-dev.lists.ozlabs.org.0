Return-Path: <linuxppc-dev+bounces-6084-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81203A30F1A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2025 16:03:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ysl870HgRz2xYl;
	Wed, 12 Feb 2025 02:03:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739286230;
	cv=none; b=PChfvgHLubi31P/lPTYJ+PmhcgvfUnacMU9Jvz2ftwTdWmc10pNwr0AVqWvT95mEgSN/K+mQMitlw79s64NK7vx6sJkAqmTBdlDBmFbCtiE1RHI08ZyjCL/7n+L/bt3PUZcgJEmn/V5P5PirrTE9Qhq3/A8sJQsp7s3RRWJpGBUDtohEyN5r/P4vbl1fcmbuEGDv3FhmCxxTimk4jc2JnFIwdp0GghlgZZPolP2ojRKNltdZjWf+tbrkwZWZFNRJ0c9E8C/bc3rjRGseoWSCQcmE+rbEYfm997wOrCim2ZlEjMdJkJbw2OrQZ9TQtIbiOp2q8NSMc/su7YludsHLSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739286230; c=relaxed/relaxed;
	bh=6M5x/vscy//ozZscessRgRaa4+2ogEe9+zz4YJJId/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gMP0PIYy1LatXPlFQdeHL5fcuXC6NvMcskbIcp61bElacBHHB+B/XYca7geNAe1WP2nCtbTYW3dFuyONEcIoz4bxqOkhQtTtvhz5qSvLjKxkz6/Y2j5RoPj1X5LCcVWuGCvT3mrhNCQb0k+VA1b3vbbG0s9CDWmT+H3ktmITaQaOUXQVJtWthxJDIDyHzpYkyQQ8TlXTiVve++6N1P/qSl1G8cfKlf8weQ0fowCBQy9TqipK05jfl6GsvqxPjvqP4QIRfrjSzSb1SUonhotnYFT7oonh6lEFnNOdAlX9BrJm5wU69NyJEzc9VVF6TA3zUQlkz4ci7ZK4SS1y5n249Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ysl852vlSz2xS4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2025 02:03:47 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49B2213D5;
	Tue, 11 Feb 2025 07:03:36 -0800 (PST)
Received: from arm.com (e134078.arm.com [10.1.26.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC4863F5A1;
	Tue, 11 Feb 2025 07:03:11 -0800 (PST)
Date: Tue, 11 Feb 2025 15:03:09 +0000
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
Subject: Re: [kvm-unit-tests PATCH v2 15/18] Add kvmtool_params to test
 specification
Message-ID: <Z6tmrX8/+wzeFL1P@arm.com>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-16-alexandru.elisei@arm.com>
 <20250123-bbd289cfd7abfd93e9b67eef@orel>
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
In-Reply-To: <20250123-bbd289cfd7abfd93e9b67eef@orel>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Drew,

On Thu, Jan 23, 2025 at 04:53:29PM +0100, Andrew Jones wrote:
> On Mon, Jan 20, 2025 at 04:43:13PM +0000, Alexandru Elisei wrote:
> > arm/arm64 supports running tests under kvmtool, but kvmtool's syntax for
> > running a virtual machine is different than qemu's. To run tests using the
> > automated test infrastructure, add a new test parameter, kvmtool_params.
> > The parameter serves the exact purpose as qemu_params/extra_params, but using
> > kvmtool's syntax.
> 
> The need for qemu_params and kvmtool_params makes more sense to me now
> that I see the use in unittests.cfg (I wonder if we can't rearrange this
> series to help understand these things up front?). There's a lot of

Certainly, I'll move it closer to the beginning of the series.

> duplication, though, with having two sets of params since the test-
> specific inputs always have to be duplicated. To avoid the duplication
> I think we can use extra_params for '-append' and '--params' by
> parametrizing the option name for "params" (-append / --params) and then
> create qemu_opts and kvmtool_opts for extra options like --pmu, --mem,
> and irqchip.

How about something like this (I am using selftest-setup as an example, all the
other test definitions would be similarly modified):

diff --git a/arm/unittests.cfg b/arm/unittests.cfg
index 2bdad67d5693..3009305ba2d3 100644
--- a/arm/unittests.cfg
+++ b/arm/unittests.cfg
@@ -15,7 +15,9 @@
 [selftest-setup]
 file = selftest.flat
 smp = 2
-extra_params = -m 256 -append 'setup smp=2 mem=256'
+test_args = setup smp=2 mem=256
+qemu_params = -m 256
+kvmtool_params = --mem 256
 groups = selftest

I was thinking about using 'test_args' instead of 'extra_params' to avoid any
confusion between the two, and to match how they are passed to a test
- they are in the argv main's argument.

Also, should I change the test definitions for all the other architectures?
It's not going to be possible for me to test all the changes.

Thanks,
Alex

> 
> Thanks,
> drew
> 
> > 
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > ---
> >  arm/unittests.cfg   | 27 +++++++++++++++++++++++++++
> >  docs/unittests.txt  |  8 ++++++++
> >  scripts/common.bash |  4 ++++
> >  3 files changed, 39 insertions(+)
> > 
> > diff --git a/arm/unittests.cfg b/arm/unittests.cfg
> > index 2bdad67d5693..974a5a9e4113 100644
> > --- a/arm/unittests.cfg
> > +++ b/arm/unittests.cfg
> > @@ -16,18 +16,21 @@
> >  file = selftest.flat
> >  smp = 2
> >  extra_params = -m 256 -append 'setup smp=2 mem=256'
> > +kvmtool_params = --mem 256 --params 'setup smp=2 mem=256'
> >  groups = selftest
> >  
> >  # Test vector setup and exception handling (kernel mode).
> >  [selftest-vectors-kernel]
> >  file = selftest.flat
> >  extra_params = -append 'vectors-kernel'
> > +kvmtool_params = --params 'vectors-kernel'
> >  groups = selftest
> >  
> >  # Test vector setup and exception handling (user mode).
> >  [selftest-vectors-user]
> >  file = selftest.flat
> >  extra_params = -append 'vectors-user'
> > +kvmtool_params = --params 'vectors-user'
> >  groups = selftest
> >  
> >  # Test SMP support
> > @@ -35,6 +38,7 @@ groups = selftest
> >  file = selftest.flat
> >  smp = $MAX_SMP
> >  extra_params = -append 'smp'
> > +kvmtool_params = --params 'smp'
> >  groups = selftest
> >  
> >  # Test PCI emulation
> > @@ -47,66 +51,77 @@ groups = pci
> >  file = pmu.flat
> >  groups = pmu
> >  extra_params = -append 'cycle-counter 0'
> > +kvmtool_params = --pmu --params 'cycle-counter 0'
> >  
> >  [pmu-event-introspection]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  extra_params = -append 'pmu-event-introspection'
> > +kvmtool_params = --pmu --params 'pmu-event-introspection'
> >  
> >  [pmu-event-counter-config]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  extra_params = -append 'pmu-event-counter-config'
> > +kvmtool_params = --pmu --params 'pmu-event-counter-config'
> >  
> >  [pmu-basic-event-count]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  extra_params = -append 'pmu-basic-event-count'
> > +kvmtool_params = --pmu --params 'pmu-basic-event-count'
> >  
> >  [pmu-mem-access]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  extra_params = -append 'pmu-mem-access'
> > +kvmtool_params = --pmu --params 'pmu-mem-access'
> >  
> >  [pmu-mem-access-reliability]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  extra_params = -append 'pmu-mem-access-reliability'
> > +kvmtool_params = --pmu --params 'pmu-mem-access-reliability'
> >  
> >  [pmu-sw-incr]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  extra_params = -append 'pmu-sw-incr'
> > +kvmtool_params = --pmu --params 'pmu-sw-incr'
> >  
> >  [pmu-chained-counters]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  extra_params = -append 'pmu-chained-counters'
> > +kvmtool_params = --pmu --params 'pmu-chained-counters'
> >  
> >  [pmu-chained-sw-incr]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  extra_params = -append 'pmu-chained-sw-incr'
> > +kvmtool_params = --pmu --params 'pmu-chained-sw-incr'
> >  
> >  [pmu-chain-promotion]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  extra_params = -append 'pmu-chain-promotion'
> > +kvmtool_params = --pmu --params 'pmu-chain-promotion'
> >  
> >  [pmu-overflow-interrupt]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  extra_params = -append 'pmu-overflow-interrupt'
> > +kvmtool_params = --pmu --params 'pmu-overflow-interrupt'
> >  
> >  # Test PMU support (TCG) with -icount IPC=1
> >  #[pmu-tcg-icount-1]
> > @@ -127,48 +142,56 @@ extra_params = -append 'pmu-overflow-interrupt'
> >  file = gic.flat
> >  smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
> >  extra_params = -machine gic-version=2 -append 'ipi'
> > +kvmtool_params = --irqchip=gicv2 --params 'ipi'
> >  groups = gic
> >  
> >  [gicv2-mmio]
> >  file = gic.flat
> >  smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
> >  extra_params = -machine gic-version=2 -append 'mmio'
> > +kvmtool_params = --irqchip=gicv2 --params 'mmio'
> >  groups = gic
> >  
> >  [gicv2-mmio-up]
> >  file = gic.flat
> >  smp = 1
> >  extra_params = -machine gic-version=2 -append 'mmio'
> > +kvmtool_params = --irqchip=gicv2 --params 'mmio'
> >  groups = gic
> >  
> >  [gicv2-mmio-3p]
> >  file = gic.flat
> >  smp = $((($MAX_SMP < 3)?$MAX_SMP:3))
> >  extra_params = -machine gic-version=2 -append 'mmio'
> > +kvmtool_params = --irqchip=gicv2 --params 'mmio'
> >  groups = gic
> >  
> >  [gicv3-ipi]
> >  file = gic.flat
> >  smp = $MAX_SMP
> >  extra_params = -machine gic-version=3 -append 'ipi'
> > +kvmtool_params = --irqchip=gicv3 --params 'ipi'
> >  groups = gic
> >  
> >  [gicv2-active]
> >  file = gic.flat
> >  smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
> >  extra_params = -machine gic-version=2 -append 'active'
> > +kvmtool_params = --irqchip=gicv2 --params 'active'
> >  groups = gic
> >  
> >  [gicv3-active]
> >  file = gic.flat
> >  smp = $MAX_SMP
> >  extra_params = -machine gic-version=3 -append 'active'
> > +kvmtool_params = --irqchip=gicv3 --params 'active'
> >  groups = gic
> >  
> >  [its-introspection]
> >  file = gic.flat
> >  smp = $MAX_SMP
> >  extra_params = -machine gic-version=3 -append 'its-introspection'
> > +kvmtool_params = --irqchip=gicv3-its --params 'its-introspection'
> >  groups = its
> >  arch = arm64
> >  
> > @@ -176,6 +199,7 @@ arch = arm64
> >  file = gic.flat
> >  smp = $MAX_SMP
> >  extra_params = -machine gic-version=3 -append 'its-trigger'
> > +kvmtool_params = --irqchip=gicv3-its --params 'its-trigger'
> >  groups = its
> >  arch = arm64
> >  
> > @@ -232,6 +256,7 @@ groups = cache
> >  file = debug.flat
> >  arch = arm64
> >  extra_params = -append 'bp'
> > +kvmtool_params = --params 'bp'
> >  groups = debug
> >  
> >  [debug-bp-migration]
> > @@ -244,6 +269,7 @@ groups = debug migration
> >  file = debug.flat
> >  arch = arm64
> >  extra_params = -append 'wp'
> > +kvmtool_params = --params 'wp'
> >  groups = debug
> >  
> >  [debug-wp-migration]
> > @@ -256,6 +282,7 @@ groups = debug migration
> >  file = debug.flat
> >  arch = arm64
> >  extra_params = -append 'ss'
> > +kvmtool_params = --params 'ss'
> >  groups = debug
> >  
> >  [debug-sstep-migration]
> > diff --git a/docs/unittests.txt b/docs/unittests.txt
> > index 3e1a9e563016..ebb6994cab77 100644
> > --- a/docs/unittests.txt
> > +++ b/docs/unittests.txt
> > @@ -69,6 +69,14 @@ extra_params
> >  Alias for 'qemu_params', supported for compatibility purposes. Use
> >  'qemu_params' for new tests.
> >  
> > +kvmtool_params
> > +--------------
> > +Extra parameters supplied to the kvmtool process. Works similarly to
> > +qemu_params and extra_params, but uses kvmtool's syntax for command line
> > +arguments. The example for qemu_params, applied to kvmtool, would be:
> > +
> > +kvmtool_params = --mem 256 --params 'smp=2'
> > +
> >  groups
> >  ------
> >  groups = <group_name1> <group_name2> ...
> > diff --git a/scripts/common.bash b/scripts/common.bash
> > index 1b5e0d667841..f54ffbd7a87b 100644
> > --- a/scripts/common.bash
> > +++ b/scripts/common.bash
> > @@ -67,6 +67,10 @@ function for_each_unittest()
> >  			qemu_opts=$(parse_opts ${BASH_REMATCH[2]}$'\n' $fd)
> >  		elif [[ $line =~ ^(extra_params|qemu_params)\ *=\ *(.*)$ ]]; then
> >  			qemu_opts=${BASH_REMATCH[2]}
> > +		elif [[ $line =~ ^kvmtool_params\ *=\ *'"""'(.*)$ ]]; then
> > +			kvmtool_opts=$(parse_opts ${BASH_REMATCH[1]}$'\n' $fd)
> > +		elif [[ $line =~ ^kvmtool_params\ *=\ *(.*)$ ]]; then
> > +			kvmtool_opts=${BASH_REMATCH[1]}
> >  		elif [[ $line =~ ^groups\ *=\ *(.*)$ ]]; then
> >  			groups=${BASH_REMATCH[1]}
> >  		elif [[ $line =~ ^arch\ *=\ *(.*)$ ]]; then
> > -- 
> > 2.47.1
> > 
> > 
> > -- 
> > kvm-riscv mailing list
> > kvm-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/kvm-riscv

