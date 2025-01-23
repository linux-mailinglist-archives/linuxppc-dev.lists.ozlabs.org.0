Return-Path: <linuxppc-dev+bounces-5528-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFFDA1A7A0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 17:13:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yf5b34m4Bz30Ff;
	Fri, 24 Jan 2025 03:13:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::bb"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737648799;
	cv=none; b=YH3wM/9GZgx8XYXmj9jeC4GZDGqw/gTUj5vSM7uix71HM9AUhzcnhLZ28mx5k/lhTnlaHoWr51Bi5FUtJf9lR3fAsyD3KeAIH1mzETVvAXL/zL7Hotil1ABT+4zoiojGMRMqDNV+0/I7eC4KT2HjNGDbE1Va3NkScGmyGQD2dVzDjWtLJYg0IpTtCSfUhgkHvBIoqU4eZVI5M3xl3mlv5rMknyr68q5uUH1d0DWguLgNo0b7M6D07pUVNEEE/qNMR4Fc6nET47oh4NgkDiqRQoN90GaEywngBGj//Q/01X8Vjv31QI52P8IpGFLLqR02GwBOVUHZf6EfnwRZBm2pOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737648799; c=relaxed/relaxed;
	bh=KVjcAL8dszFablg6zSOCb3X5h1b08qnMEWy+SAhCX+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PfskHgPLOBD9J2oyL1AxvFUHn19U15i2gfahlOBUzOZXx2A1n5UodkGVe/Oe9CM68AACdFfhtN4CFUgzeLpNW3HIsdsPQnkx3XOj/quQGSvSBSCuPcUn0Sdo/J207Ml5lZKctawXZTciOjDQWUAS224aB4qjRYETVgCz6YHB5gNntltljcNUVB6IbajdT6IZDeOYGX8kVL0VpBLN+cDlx/jwFT4jrHWDaZHWi+Sy4D1IMlZiKgOlIqJmkvDgxpweY/PYF7m0zfSZ7bc3ETHRu7QMN/eRik7MZIJFphwmSem8D56DcHdeg7igJCIhKHT+lMFVnvsOwNPIXRkkpt658w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CdEfjCZ0; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::bb; helo=out-187.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CdEfjCZ0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::bb; helo=out-187.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [IPv6:2001:41d0:203:375::bb])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yf5b16RWFz30DX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2025 03:13:17 +1100 (AEDT)
Date: Thu, 23 Jan 2025 17:12:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737648778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KVjcAL8dszFablg6zSOCb3X5h1b08qnMEWy+SAhCX+M=;
	b=CdEfjCZ0Emw7h2C19EyXfNIlFLFlSQXcDoTQIFOgT5XRbA1/Xz3R9t/N9SzXK6Vrvnin4X
	thEzxRsofkjpUjgLII97kjT6y2k88hlNfM5KzQjaW1LQEg9alaJFQ1D/+bQMC7zS3QqQvt
	Sazw3uVx63g7NHOdP/RnHLQV2SRqarU=
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
Subject: Re: [kvm-unit-tests PATCH v2 18/18] run_tests: Enable kvmtool
Message-ID: <20250123-30dd5e1694818e0d0228131b@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-19-alexandru.elisei@arm.com>
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
In-Reply-To: <20250120164316.31473-19-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 20, 2025 at 04:43:16PM +0000, Alexandru Elisei wrote:
> Everything is in place to run the tests using kvmtool:
> 
> $ ./configure --target=kvmtool
> $ make clean && make
> $ KVMTOOL=<path/to/kvmtool> ./run_tests.sh
> 
> so enable it, and remove ERRATA_FORCE=y when configuring for kvmtool,
> because the runner will generate and pass the correct environment to
> kvmtool.
> 
> Missing is support for EFI tests. That's because distros don't ship a
> EDK2 binary compiled for kvmtool, and on top of that kvm-unit-tests as
> an EFI app hasn't been tested to work with kvmtool.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
> 
> Should I also revert commit 35145f140442 ("arm/arm64: kvmtool: force all tests
> to run") which introduced ERRATA_FORCE? I didn't do this now in case other
> architectures use it/planning to use it.

We can leave ERRATA_FORCE, I use from time to time for quick testing.

> 
>  README.md               | 15 +++++++++++++++
>  arm/run                 |  2 +-
>  configure               |  1 -
>  run_tests.sh            |  2 +-
>  scripts/mkstandalone.sh |  2 +-
>  5 files changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/README.md b/README.md
> index be07dc28a094..5e7706f02553 100644
> --- a/README.md
> +++ b/README.md
> @@ -65,6 +65,9 @@ or:
>  
>  to run them all.
>  
> +All tests can be run using QEMU. On arm and arm64, tests can also be run using
> +kvmtool.
> +
>  By default the runner script searches for a suitable QEMU binary in the system.
>  To select a specific QEMU binary though, specify the QEMU=path/to/binary
>  environment variable:
> @@ -80,10 +83,22 @@ For running tests that involve migration from one QEMU instance to another
>  you also need to have the "ncat" binary (from the nmap.org project) installed,
>  otherwise the related tests will be skipped.
>  
> +To run a test with kvmtool, please configure kvm-unit-tests accordingly first:
> +
> +   ./configure --arch=arm64 --target=kvmtool
> +
> +then run the test(s) like with QEMU above.
> +
> +To select a kvmtool binary, specify the KVMTOOL=path/to/binary environment
> +variable. kvmtool supports only kvm as the accelerator.
> +
>  ## Running the tests with UEFI
>  
>  Check [x86/efi/README.md](./x86/efi/README.md).
>  
> +On arm and arm64, this is only supported with QEMU; kvmtool cannot run the
> +tests under UEFI.
> +
>  # Tests configuration file
>  
>  The test case may need specific runtime configurations, for
> diff --git a/arm/run b/arm/run
> index 880d5afae86d..438a2617e564 100755
> --- a/arm/run
> +++ b/arm/run
> @@ -10,7 +10,7 @@ if [ -z "$KUT_STANDALONE" ]; then
>  fi
>  
>  case "$TARGET" in
> -qemu)
> +qemu | kvmtool)
>      ;;
>  *)
>     echo "'$TARGET' not supported"
> diff --git a/configure b/configure
> index 86cf1da36467..17d3d931f2c0 100755
> --- a/configure
> +++ b/configure
> @@ -299,7 +299,6 @@ elif [ "$arch" = "arm" ] || [ "$arch" = "arm64" ]; then
>          arm_uart_early_addr=0x09000000
>      elif [ "$target" = "kvmtool" ]; then
>          arm_uart_early_addr=0x1000000
> -        errata_force=1
>      else
>          echo "--target must be one of 'qemu' or 'kvmtool'!"
>          usage
> diff --git a/run_tests.sh b/run_tests.sh
> index d38954be9093..3921dcdcb344 100755
> --- a/run_tests.sh
> +++ b/run_tests.sh
> @@ -110,7 +110,7 @@ while [ $# -gt 0 ]; do
>  done
>  
>  case "$TARGET" in
> -qemu)
> +qemu | kvmtool)
>      ;;
>  *)
>      echo "$0 does not support '$TARGET'"
> diff --git a/scripts/mkstandalone.sh b/scripts/mkstandalone.sh
> index 10abb5e191b7..16383b05adfa 100755
> --- a/scripts/mkstandalone.sh
> +++ b/scripts/mkstandalone.sh
> @@ -8,7 +8,7 @@ source config.mak
>  source scripts/common.bash
>  
>  case "$TARGET" in
> -qemu)
> +qemu | kvmtool)
>      ;;
>  *)
>      echo "'$TARGET' not supported for standlone tests"
> -- 
> 2.47.1
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

