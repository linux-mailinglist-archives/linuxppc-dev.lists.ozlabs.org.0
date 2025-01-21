Return-Path: <linuxppc-dev+bounces-5460-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DF9A181C7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2025 17:13:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ycsh41grsz30VK;
	Wed, 22 Jan 2025 03:13:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::b0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737476004;
	cv=none; b=a6iBwe3bgPuAkk2/+WwdZJPPyLh+Xk6Ni7PxuVnSWpN0K47G8XwWj2qVE0MQ0EDpeLBWCf7lysmblKvEEX/1q2DLbLXk5gc+kJ1hW0A5W1M1j+CUIyYimxyGFshGHBsC8jxRNgS1hgEt7waDlRlsY+oevG0vsPSBJxgLH34pzb+bgU3zM+zLiMcf/OclQIxiC8tPrEMh0LLirs43FOy4g8I81GW7NBhjm83Sbw3QQ5cucJISAb/NWnK70/+Tl1fpPP6Kn9AUW/KgtYh/JeWcIi4dLi6fq3omaXnAlCX53DYcE54CLhe18Pi2YmHD6E/DuF5b3hsSqxggReUfV35RFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737476004; c=relaxed/relaxed;
	bh=cyMTmEzB2/U6qcXH179gcIg8qFA+t5ge+uEkmTrIDFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DZ0z6qHMligmGfICU5HBdk3nRuTm1mgyo28u6Y3FlpfALK5G7V3ohvR6m5zvJFAJ7fSqeuFKuuVgbbtzWxxzjzS2hNqkDsB5jq1UleVSfR+vJFEyX8lgkqu7FuG5TyF1LVckYW/c4moQhgRaEp7yJ2Nf2wmeOJBYzFmU0S9Pt28sT0p1id3di4/x1Z8wfyrz/Rjn6+81EruzEaK3++uF7r71bnkxDd2h098Tjzxn79CS5Yw2Iaz5hM2J212/FxDNAANw7sa5/ChV5oMcYNPGRg6xMqP+GWyroWUtC+1XjAM00KfHtqRYKsNtlj9VoFzBSmjotXG/NSTo6X1QnEQdsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=2001:41d0:203:375::b0; helo=out-176.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::b0; helo=out-176.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [IPv6:2001:41d0:203:375::b0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ycsgy2Bwgz30Tx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2025 03:13:16 +1100 (AEDT)
Date: Tue, 21 Jan 2025 17:12:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737475977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cyMTmEzB2/U6qcXH179gcIg8qFA+t5ge+uEkmTrIDFY=;
	b=Byr2VvxiU4c4qpp4KsGIfvIfoTPSZ94lhRmH+7449u1XN5es1s1AwV/ecHaLHam3bHowaF
	4hz5gb9XUH9F00XF8neP4/tNH54hlIET6NQYR94xWksNJuvAn8CNEebEkY4KDt+x/21bjR
	tbIQjxaL4tDARm9tN25cSgoF3rfVa+Q=
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
Subject: Re: [kvm-unit-tests PATCH v2 06/18] scripts: Merge the qemu
 parameter -smp into $qemu_opts
Message-ID: <20250121-293c6d322b91d5ff51291ad6@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-7-alexandru.elisei@arm.com>
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
In-Reply-To: <20250120164316.31473-7-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 20, 2025 at 04:43:04PM +0000, Alexandru Elisei wrote:
> kvmtool has a different command line parameter to specify the number of
> VCPUs (-c/--cpus). To make it easier to accommodate it, merge the qemu
> specific parameter -smp into $qemu_opts when passing it to the
> $RUNTIME_arch_run script.
> 
> This is safe to do because the $RUNTIME_arch_run script, on all
> architectures, passes the parameters right back to run_qemu() et co, and
> do not treat individual parameters separately.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  scripts/runtime.bash | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> index e5d661684ceb..a89f2d10ab78 100644
> --- a/scripts/runtime.bash
> +++ b/scripts/runtime.bash
> @@ -34,7 +34,8 @@ premature_failure()
>  get_cmdline()
>  {
>      local kernel=$1
> -    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel -smp $smp $qemu_opts"
> +
> +    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel $qemu_opts"
>  }
>  
>  skip_nodefault()
> @@ -87,6 +88,8 @@ function run()
>      local accel="$9"
>      local timeout="${10:-$TIMEOUT}" # unittests.cfg overrides the default
>  
> +    qemu_opts="-smp $smp $qemu_opts"
> +
>      if [ "${CONFIG_EFI}" == "y" ]; then
>          kernel=${kernel/%.flat/.efi}
>      fi
> -- 
> 2.47.1
>

This seems fine, but I still think we want qemu_opts to be opts and we can
parameterize the option names. So we could have a table of option names
that we use in places like this

declare -A vmm_opts

vmm_opts[qemu,nr_cpus]='-smp'
vmm_opts[qemu,another_option]='foo'

vmm_opts[kvmtool,nr_cpus]='-c'
vmm_opts[kvmtool,another_option]='bar'

# $vmm gets set to whatever vmm we're using, e.g. vmm=qemu

opts="${vmm_opts[$vmm,nr_cpus]} $smp $opts"

Thanks,
drew

