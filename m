Return-Path: <linuxppc-dev+bounces-5519-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A645BA1A576
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 15:07:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yf2pK72pqz306J;
	Fri, 24 Jan 2025 01:07:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::b8"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737641273;
	cv=none; b=lm0XwHP9FSXwUZvGwg6L/8B9GA1OwCqFtwxwwfMNHBcvGnnOnfInE2MwmlLQqqldoEWkqcHfjMvOEYJhq0ShX9Ea9oV53vuY0yk4ws4NksocaUyOx1mKVTjcFVCSebRHhft5H+clCuukdeZGUUepDwG5mJTLrTHf5DcahdeG7Vk+2rrXY8h98BreVWDjGvwmzj0zYbYRjfAPEHFNySAruy5mrRQuSWlyfn/e2v6nvbva0ExLl0JPlkGsqB2PDlaMdvm5bxTVdZiBhw6HPBLKptjO7sZaSQAOJV8qEd7+XQs8XH5EWZtzPcl7ZVv4VOe/QH2W+WYW287C/1MYxuoZRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737641273; c=relaxed/relaxed;
	bh=wiYAC4Ucxcm7KuFAC5tUIQUTt4eAoBsu+z1SGcrkjzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MvLAExvU2osAve/eKYO+TY1fxyd/jOmsWvGQ1Mj03cwjCyeVjOC0Lbk8as7OLImwDkfDDHyWW0DQDyuOwVBTVPfJhQj1bbdiUoLIRqNxqfTBTSXAD8h6UaK59iUYr/waMFpdQXH1HRkKc+O29vQXXiwcTBbbX9p22K/JBO9zOk8HjOf0L2RNhbWP3GYBimhw6QpVlIp9TKnhn+MdDOpeK+QKNKsWfJEyTjAQ9fHOK1ioFieTJTzCwTOVA5W0e7asMwJo/3vJw6tTh8kkGUWKiGcP9WawCgYyinyCCefWwY4CSV+jwYIP05gXkJB9ijeVcaCQaq2iIC9UEqGhz+1hqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=2001:41d0:203:375::b8; helo=out-184.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::b8; helo=out-184.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-184.mta1.migadu.com (out-184.mta1.migadu.com [IPv6:2001:41d0:203:375::b8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yf2pC34m9z305D
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2025 01:07:45 +1100 (AEDT)
Date: Thu, 23 Jan 2025 15:07:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737641243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wiYAC4Ucxcm7KuFAC5tUIQUTt4eAoBsu+z1SGcrkjzs=;
	b=r41LZca+Sg/9Rc14gHPNbCgZPgDw6X/CzWbgkYZYXTZWfG9IYDtoDglUvjOpuR+psOcRFP
	bVQkbsAuJLGvQhJcpWMAvbb5zRT6xkvAW9FFr+yMuz1EEAIFRpfQDHRFsRH80+9mTCqLQo
	Qh+GFBQVRggjkwqI0l6xn+R27U6C8Ro=
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
Subject: Re: [kvm-unit-tests PATCH v2 12/18] scripts/runtime: Add default
 arguments for kvmtool
Message-ID: <20250121-16510b161f5b92ce9c5ae4e1@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-13-alexandru.elisei@arm.com>
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
In-Reply-To: <20250120164316.31473-13-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 20, 2025 at 04:43:10PM +0000, Alexandru Elisei wrote:
> kvmtool, unless told otherwise, will do its best to make sure that a kernel
> successfully boots in a virtual machine. Among things like automatically
> creating a rootfs, it also adds extra parameters to the kernel command
> line. This is actively harmful to kvm-unit-tests, because some tests parse
> the kernel command line and they will fail if they encounter the options
> added by kvmtool.
> 
> Fortunately for us, kvmtool commit 5613ae26b998 ("Add --nodefaults command
> line argument") addded the --nodefaults kvmtool parameter which disables

added

> all the implicit virtual machine configuration that cannot be disabled by
> using other parameters, like modifying the kernel command line. Always use
> --nodefaults to allow a test to run.
> 
> kvmtool can be too verbose when running a virtual machine, and this is
> controlled with parameters. Add those to the default kvmtool command line
> to reduce this verbosity to a minimum.
> 
> Before:
> 
> $ vm run arm/selftest.flat --cpus 2 --mem 256 --params "setup smp=2 mem=256"
>   Info: # lkvm run -k arm/selftest.flat -m 256 -c 2 --name guest-5035
> Unknown subtest
> 
> EXIT: STATUS=127
>   Warning: KVM compatibility warning.
> 	virtio-9p device was not detected.
> 	While you have requested a virtio-9p device, the guest kernel did not initialize it.
> 	Please make sure that the guest kernel was compiled with CONFIG_NET_9P_VIRTIO=y enabled in .config.
>   Warning: KVM compatibility warning.
> 	virtio-net device was not detected.
> 	While you have requested a virtio-net device, the guest kernel did not initialize it.
> 	Please make sure that the guest kernel was compiled with CONFIG_VIRTIO_NET=y enabled in .config.
>   Info: KVM session ended normally.
> 
> After:
> 
> $ vm run arm/selftest.flat --nodefaults --network mode=none --loglevel=warning --cpus 2 --mem 256 --params "setup smp=2 mem=256"

On riscv I've noticed that with --nodefaults if I don't add parameters
with --params then kvmtool segfaults. I have to add --params "" to
avoid it. Does that also happen on arm? Anyway, that's something we
should fix in kvmtool rather than workaround it here.

> PASS: selftest: setup: smp: number of CPUs matches expectation
> INFO: selftest: setup: smp: found 2 CPUs
> PASS: selftest: setup: mem: memory size matches expectation
> INFO: selftest: setup: mem: found 256 MB
> SUMMARY: 2 tests
> 
> EXIT: STATUS=1
> 
> Note that KVMTOOL_DEFAULT_OPTS can be overwritten by an environment
> variable with the same name, but it's not documented in the help string for
> run_tests.sh. This has been done on purpose, since overwritting
> KVMTOOL_DEFAULT_OPTS should only be necessary for debugging or development
> purposes.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  scripts/runtime.bash | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> index 55d58eef9c7c..abfd1e67b2ef 100644
> --- a/scripts/runtime.bash
> +++ b/scripts/runtime.bash
> @@ -2,6 +2,17 @@
>  : "${MAX_SMP:=$(getconf _NPROCESSORS_ONLN)}"
>  : "${TIMEOUT:=90s}"
>  
> +# The following parameters are enabled by default when running a test with
> +# kvmtool:
> +# --nodefaults: suppress VM configuration that cannot be disabled otherwise
> +#               (like modifying the supplied kernel command line). Tests that
> +#               use the command line will fail without this parameter.
> +# --network mode=none: do not create a network device. kvmtool tries to help the
> +#                user by automatically create one, and then prints a warning
> +#                when the VM terminates if the device hasn't been initialized.
> +# --loglevel=warning: reduce verbosity
> +: "${KVMTOOL_DEFAULT_OPTS:="--nodefaults --network mode=none --loglevel=warning"}"
> +
>  PASS() { echo -ne "\e[32mPASS\e[0m"; }
>  SKIP() { echo -ne "\e[33mSKIP\e[0m"; }
>  FAIL() { echo -ne "\e[31mFAIL\e[0m"; }
> @@ -103,7 +114,7 @@ function run()
>          opts="-smp $smp $qemu_opts"
>          ;;
>      kvmtool)
> -        opts="--cpus $smp $kvmtool_opts"
> +        opts="$KVMTOOL_DEFAULT_OPTS --cpus $smp $kvmtool_opts"
>          ;;
>      esac
>  
> -- 
> 2.47.1
>

Otherwise,

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

