Return-Path: <linuxppc-dev+bounces-5525-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78498A1A756
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 16:54:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yf58q6jnnz305G;
	Fri, 24 Jan 2025 02:54:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.179
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737647643;
	cv=none; b=NPgN2XTJwk2iu2haZijvG2Yu1fIjwlZPwXNB3BT98UoJ/1ME80HCWe5PIy+pA2Jq74qk4tH5VDmNZgSwLAaMRg32hUklOLp8XNJG3A8GaSsA/7BkW0shtFX/ZxusHXl1VkJA82aCC/oKNAo0IsxHlWHwiqKb5sczm65A1EZpvKc+PBrdkheWctxbRIqJjnzXC0zlENsvl1yvEaTkwxedfT7BjbMUhZFsS94nquBPyOHcR4TOg8FiKWQbnzRm7JbI3aa8sfn4cXvAiU5WU+rE7VcVddJtfA7PPiV5fpQDQA9umYmETBIsWuOmkTlOUXOqKXUpP8vjpuuJnoRfONmYrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737647643; c=relaxed/relaxed;
	bh=tF/U3mmTxOMYL91vz0yiZkcMeZY4qd1jN+VzQLPoF/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TBeV+hcZktu8cRpQpitbM2gDrT9b2P9I48kE5pSqLJaTALcNLCDuGMgryQQJnxqfOABqX/x/01u+cqI+ox6b6O4SAxF88RvuATmLhPHTYpYHYRDb0BaKSioD35PRKMpCK2TTFPm5ezDZthz6DmxUF1d9PMJhtzjEUIJTqJpzYuzIWP5ExH6GRAfGorm6mvH5akuea1lx/B4pRjm409nvnAJkiD6B8oFq7YBP9KuHeru6unyuu7WdKaEXUoKYJbDeDFkLnPh66dvRIKJmiOM0+0xl90PpESPp7Pt80tQfYw6dgzJ4sQOIPtrTAgH/YxUr/WwyLVrQL3BMASSkcThZQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=91.218.175.179; helo=out-179.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.179; helo=out-179.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yf58k0Chkz304x
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2025 02:53:56 +1100 (AEDT)
Date: Thu, 23 Jan 2025 16:53:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737647612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tF/U3mmTxOMYL91vz0yiZkcMeZY4qd1jN+VzQLPoF/0=;
	b=IEDL9JVLrLuaiTRjx2wxoTV7gNV4FcR5JMYluEUnPH8+Y/lA0VS62H9NDsWtl96dCrtb+p
	UoxWmOJkGEI923+dChBAOoF57LWXJ7AS/HH/b4l8C7RLAHO6M2rmdyPCe/lQniH6c717Tx
	+R051PE3/oodlIIaaKTDcNC6/NxUriE=
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
Subject: Re: [kvm-unit-tests PATCH v2 15/18] Add kvmtool_params to test
 specification
Message-ID: <20250123-bbd289cfd7abfd93e9b67eef@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-16-alexandru.elisei@arm.com>
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
In-Reply-To: <20250120164316.31473-16-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 20, 2025 at 04:43:13PM +0000, Alexandru Elisei wrote:
> arm/arm64 supports running tests under kvmtool, but kvmtool's syntax for
> running a virtual machine is different than qemu's. To run tests using the
> automated test infrastructure, add a new test parameter, kvmtool_params.
> The parameter serves the exact purpose as qemu_params/extra_params, but using
> kvmtool's syntax.

The need for qemu_params and kvmtool_params makes more sense to me now
that I see the use in unittests.cfg (I wonder if we can't rearrange this
series to help understand these things up front?). There's a lot of
duplication, though, with having two sets of params since the test-
specific inputs always have to be duplicated. To avoid the duplication
I think we can use extra_params for '-append' and '--params' by
parametrizing the option name for "params" (-append / --params) and then
create qemu_opts and kvmtool_opts for extra options like --pmu, --mem,
and irqchip.

Thanks,
drew

> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  arm/unittests.cfg   | 27 +++++++++++++++++++++++++++
>  docs/unittests.txt  |  8 ++++++++
>  scripts/common.bash |  4 ++++
>  3 files changed, 39 insertions(+)
> 
> diff --git a/arm/unittests.cfg b/arm/unittests.cfg
> index 2bdad67d5693..974a5a9e4113 100644
> --- a/arm/unittests.cfg
> +++ b/arm/unittests.cfg
> @@ -16,18 +16,21 @@
>  file = selftest.flat
>  smp = 2
>  extra_params = -m 256 -append 'setup smp=2 mem=256'
> +kvmtool_params = --mem 256 --params 'setup smp=2 mem=256'
>  groups = selftest
>  
>  # Test vector setup and exception handling (kernel mode).
>  [selftest-vectors-kernel]
>  file = selftest.flat
>  extra_params = -append 'vectors-kernel'
> +kvmtool_params = --params 'vectors-kernel'
>  groups = selftest
>  
>  # Test vector setup and exception handling (user mode).
>  [selftest-vectors-user]
>  file = selftest.flat
>  extra_params = -append 'vectors-user'
> +kvmtool_params = --params 'vectors-user'
>  groups = selftest
>  
>  # Test SMP support
> @@ -35,6 +38,7 @@ groups = selftest
>  file = selftest.flat
>  smp = $MAX_SMP
>  extra_params = -append 'smp'
> +kvmtool_params = --params 'smp'
>  groups = selftest
>  
>  # Test PCI emulation
> @@ -47,66 +51,77 @@ groups = pci
>  file = pmu.flat
>  groups = pmu
>  extra_params = -append 'cycle-counter 0'
> +kvmtool_params = --pmu --params 'cycle-counter 0'
>  
>  [pmu-event-introspection]
>  file = pmu.flat
>  groups = pmu
>  arch = arm64
>  extra_params = -append 'pmu-event-introspection'
> +kvmtool_params = --pmu --params 'pmu-event-introspection'
>  
>  [pmu-event-counter-config]
>  file = pmu.flat
>  groups = pmu
>  arch = arm64
>  extra_params = -append 'pmu-event-counter-config'
> +kvmtool_params = --pmu --params 'pmu-event-counter-config'
>  
>  [pmu-basic-event-count]
>  file = pmu.flat
>  groups = pmu
>  arch = arm64
>  extra_params = -append 'pmu-basic-event-count'
> +kvmtool_params = --pmu --params 'pmu-basic-event-count'
>  
>  [pmu-mem-access]
>  file = pmu.flat
>  groups = pmu
>  arch = arm64
>  extra_params = -append 'pmu-mem-access'
> +kvmtool_params = --pmu --params 'pmu-mem-access'
>  
>  [pmu-mem-access-reliability]
>  file = pmu.flat
>  groups = pmu
>  arch = arm64
>  extra_params = -append 'pmu-mem-access-reliability'
> +kvmtool_params = --pmu --params 'pmu-mem-access-reliability'
>  
>  [pmu-sw-incr]
>  file = pmu.flat
>  groups = pmu
>  arch = arm64
>  extra_params = -append 'pmu-sw-incr'
> +kvmtool_params = --pmu --params 'pmu-sw-incr'
>  
>  [pmu-chained-counters]
>  file = pmu.flat
>  groups = pmu
>  arch = arm64
>  extra_params = -append 'pmu-chained-counters'
> +kvmtool_params = --pmu --params 'pmu-chained-counters'
>  
>  [pmu-chained-sw-incr]
>  file = pmu.flat
>  groups = pmu
>  arch = arm64
>  extra_params = -append 'pmu-chained-sw-incr'
> +kvmtool_params = --pmu --params 'pmu-chained-sw-incr'
>  
>  [pmu-chain-promotion]
>  file = pmu.flat
>  groups = pmu
>  arch = arm64
>  extra_params = -append 'pmu-chain-promotion'
> +kvmtool_params = --pmu --params 'pmu-chain-promotion'
>  
>  [pmu-overflow-interrupt]
>  file = pmu.flat
>  groups = pmu
>  arch = arm64
>  extra_params = -append 'pmu-overflow-interrupt'
> +kvmtool_params = --pmu --params 'pmu-overflow-interrupt'
>  
>  # Test PMU support (TCG) with -icount IPC=1
>  #[pmu-tcg-icount-1]
> @@ -127,48 +142,56 @@ extra_params = -append 'pmu-overflow-interrupt'
>  file = gic.flat
>  smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
>  extra_params = -machine gic-version=2 -append 'ipi'
> +kvmtool_params = --irqchip=gicv2 --params 'ipi'
>  groups = gic
>  
>  [gicv2-mmio]
>  file = gic.flat
>  smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
>  extra_params = -machine gic-version=2 -append 'mmio'
> +kvmtool_params = --irqchip=gicv2 --params 'mmio'
>  groups = gic
>  
>  [gicv2-mmio-up]
>  file = gic.flat
>  smp = 1
>  extra_params = -machine gic-version=2 -append 'mmio'
> +kvmtool_params = --irqchip=gicv2 --params 'mmio'
>  groups = gic
>  
>  [gicv2-mmio-3p]
>  file = gic.flat
>  smp = $((($MAX_SMP < 3)?$MAX_SMP:3))
>  extra_params = -machine gic-version=2 -append 'mmio'
> +kvmtool_params = --irqchip=gicv2 --params 'mmio'
>  groups = gic
>  
>  [gicv3-ipi]
>  file = gic.flat
>  smp = $MAX_SMP
>  extra_params = -machine gic-version=3 -append 'ipi'
> +kvmtool_params = --irqchip=gicv3 --params 'ipi'
>  groups = gic
>  
>  [gicv2-active]
>  file = gic.flat
>  smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
>  extra_params = -machine gic-version=2 -append 'active'
> +kvmtool_params = --irqchip=gicv2 --params 'active'
>  groups = gic
>  
>  [gicv3-active]
>  file = gic.flat
>  smp = $MAX_SMP
>  extra_params = -machine gic-version=3 -append 'active'
> +kvmtool_params = --irqchip=gicv3 --params 'active'
>  groups = gic
>  
>  [its-introspection]
>  file = gic.flat
>  smp = $MAX_SMP
>  extra_params = -machine gic-version=3 -append 'its-introspection'
> +kvmtool_params = --irqchip=gicv3-its --params 'its-introspection'
>  groups = its
>  arch = arm64
>  
> @@ -176,6 +199,7 @@ arch = arm64
>  file = gic.flat
>  smp = $MAX_SMP
>  extra_params = -machine gic-version=3 -append 'its-trigger'
> +kvmtool_params = --irqchip=gicv3-its --params 'its-trigger'
>  groups = its
>  arch = arm64
>  
> @@ -232,6 +256,7 @@ groups = cache
>  file = debug.flat
>  arch = arm64
>  extra_params = -append 'bp'
> +kvmtool_params = --params 'bp'
>  groups = debug
>  
>  [debug-bp-migration]
> @@ -244,6 +269,7 @@ groups = debug migration
>  file = debug.flat
>  arch = arm64
>  extra_params = -append 'wp'
> +kvmtool_params = --params 'wp'
>  groups = debug
>  
>  [debug-wp-migration]
> @@ -256,6 +282,7 @@ groups = debug migration
>  file = debug.flat
>  arch = arm64
>  extra_params = -append 'ss'
> +kvmtool_params = --params 'ss'
>  groups = debug
>  
>  [debug-sstep-migration]
> diff --git a/docs/unittests.txt b/docs/unittests.txt
> index 3e1a9e563016..ebb6994cab77 100644
> --- a/docs/unittests.txt
> +++ b/docs/unittests.txt
> @@ -69,6 +69,14 @@ extra_params
>  Alias for 'qemu_params', supported for compatibility purposes. Use
>  'qemu_params' for new tests.
>  
> +kvmtool_params
> +--------------
> +Extra parameters supplied to the kvmtool process. Works similarly to
> +qemu_params and extra_params, but uses kvmtool's syntax for command line
> +arguments. The example for qemu_params, applied to kvmtool, would be:
> +
> +kvmtool_params = --mem 256 --params 'smp=2'
> +
>  groups
>  ------
>  groups = <group_name1> <group_name2> ...
> diff --git a/scripts/common.bash b/scripts/common.bash
> index 1b5e0d667841..f54ffbd7a87b 100644
> --- a/scripts/common.bash
> +++ b/scripts/common.bash
> @@ -67,6 +67,10 @@ function for_each_unittest()
>  			qemu_opts=$(parse_opts ${BASH_REMATCH[2]}$'\n' $fd)
>  		elif [[ $line =~ ^(extra_params|qemu_params)\ *=\ *(.*)$ ]]; then
>  			qemu_opts=${BASH_REMATCH[2]}
> +		elif [[ $line =~ ^kvmtool_params\ *=\ *'"""'(.*)$ ]]; then
> +			kvmtool_opts=$(parse_opts ${BASH_REMATCH[1]}$'\n' $fd)
> +		elif [[ $line =~ ^kvmtool_params\ *=\ *(.*)$ ]]; then
> +			kvmtool_opts=${BASH_REMATCH[1]}
>  		elif [[ $line =~ ^groups\ *=\ *(.*)$ ]]; then
>  			groups=${BASH_REMATCH[1]}
>  		elif [[ $line =~ ^arch\ *=\ *(.*)$ ]]; then
> -- 
> 2.47.1
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

