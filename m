Return-Path: <linuxppc-dev+bounces-5455-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC89A1805E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2025 15:49:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcqqC6Crgz2yDH;
	Wed, 22 Jan 2025 01:49:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.186
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737470967;
	cv=none; b=JugUB4fUCpyNgHuVUikfM+y1H22MlrJWmSGn24xuO44AUyhuNCNXEzJLIfP2TN3wSLAqm7BwJnooLT0anMogdqyBY4KOlSK6CzPKcOcXT2gOFjK4spiwKfmH8A/qyI2lo2dbLM4hXODHIyWaizIgTGZNNeEa7ku56zSJlpFuPCh7YwWMxQmNuYutVv9FHUxNWhUcxeucPA/Ker3pNmXwFIyTGogupnxwbFC6nsaFmRDXALFacS5fErxV02q2HdA9Vzs1tOXUefjw45a8jQfwoxOBOyQzjsFvsRFOz1wlo4vxdETE0OCNu51PUmXtimZ7/Vz0Oi3IBvjJTuOZQDy5Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737470967; c=relaxed/relaxed;
	bh=y4U3mhaNeCPZx2S5DokPxis3spPsXAjQG6CQBxTg9Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xsrv3htTrWPW00FS0V5lPUzd5RDJ2zLXh5z+AzJEU5jkebjHYwOIb9aePRspJmYZ37o7J/D+3pAH4Abx0KALWzBmkFaiefz+61w3tE6WDHy+yj69eYA3uNDZNUD3/2enorfCVIQfd6DCaa9/PJkCm66cgtBo1rooRmc0hiWtKDqHuQ0ukcwEoFU/b3K9w+Ec0F98aiAkv0rmbQrUwDGMfoSsTijIPYeu9AIJzsmP6ZzOAa4VCP38sHMezJ3puFSNyfbmBrne9kwrB7MgyIuddV+uznWWo3jpH4LTVXMH/8YKmMmBHRfhseFclL/Wx9GKKyd10UTd3podgc8d8ST9wA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=95.215.58.186; helo=out-186.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.186; helo=out-186.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ycqq53x6pz2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2025 01:49:21 +1100 (AEDT)
Date: Tue, 21 Jan 2025 15:48:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737470939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y4U3mhaNeCPZx2S5DokPxis3spPsXAjQG6CQBxTg9Ys=;
	b=bizThze3yBlYVxibDfKZo6yDUkTwkcWNzU7AThmgiseZtF+i09K+Eu1VGnGFaj5BSju9pB
	f13cntnWjd1BUtmai6RYLN1Mc6354wufLjcOx1v27+pSUv2Bp7mIXHc6sqOTkKQuKhDmp9
	Lmw7Xs5KCfvBN3dtKK6dzoVeIXnrnow=
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
Subject: Re: [kvm-unit-tests PATCH v2 03/18] scripts: Refuse to run the tests
 if not configured for qemu
Message-ID: <20250121-45faf6a9a9681c7c9ece5f44@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-4-alexandru.elisei@arm.com>
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
In-Reply-To: <20250120164316.31473-4-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 20, 2025 at 04:43:01PM +0000, Alexandru Elisei wrote:
> Arm and arm64 support running the tests under kvmtool. Unsurprisingly,
> kvmtool and qemu have a different command line syntax for configuring and
> running a virtual machine.
> 
> On top of that, when kvm-unit-tests has been configured to run under
> kvmtool (via ./configure --target=kvmtool), the early UART address changes,
> and if then the tests are run with qemu, this warning is displayed:
> 
> WARNING: early print support may not work. Found uart at 0x9000000, but early base is 0x1000000.
> 
> At the moment, the only way to run a test under kvmtool is manually, as no
> script has any knowledge of how to invoke kvmtool. Also, unless one looks
> at the logs, it's not obvious that the test runner is using qemu to run the
> tests, and not kvmtool.
> 
> To avoid any confusion for unsuspecting users, refuse to run a test via the
> testing scripts when kvm-unit-tests has been configured for kvmtool.
> 
> There are four different ways to run a test using the test infrastructure:
> with run_tests.sh, by invoking arm/run or arm/efi/run with the correct
> parameters (only the arm directory is mentioned here because the tests can
> be configured for kvmtool only on arm and arm64), and by creating
> standalone tests. Add a check in each of these locations for the supported
> virtual machine manager.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  arm/efi/run             | 8 ++++++++
>  arm/run                 | 9 +++++++++
>  run_tests.sh            | 8 ++++++++
>  scripts/mkstandalone.sh | 8 ++++++++
>  4 files changed, 33 insertions(+)
> 
> diff --git a/arm/efi/run b/arm/efi/run
> index 8f41fc02df31..916f4c4deef6 100755
> --- a/arm/efi/run
> +++ b/arm/efi/run
> @@ -12,6 +12,14 @@ fi
>  source config.mak
>  source scripts/arch-run.bash
>  
> +case "$TARGET" in
> +qemu)
> +    ;;
> +*)
> +    echo "$0 does not support '$TARGET'"
> +    exit 2
> +esac
> +
>  if [ -f /usr/share/qemu-efi-aarch64/QEMU_EFI.fd ]; then
>  	DEFAULT_UEFI=/usr/share/qemu-efi-aarch64/QEMU_EFI.fd
>  elif [ -f /usr/share/edk2/aarch64/QEMU_EFI.silent.fd ]; then
> diff --git a/arm/run b/arm/run
> index efdd44ce86a7..6db32cf09c88 100755
> --- a/arm/run
> +++ b/arm/run
> @@ -8,6 +8,15 @@ if [ -z "$KUT_STANDALONE" ]; then
>  	source config.mak
>  	source scripts/arch-run.bash
>  fi
> +
> +case "$TARGET" in
> +qemu)
> +    ;;
> +*)
> +   echo "'$TARGET' not supported"
> +   exit 3

I think we want exit code 2 here.

> +esac
> +
>  processor="$PROCESSOR"
>  
>  if [ "$QEMU" ] && [ -z "$ACCEL" ] &&
> diff --git a/run_tests.sh b/run_tests.sh
> index 23d81b2caaa1..61480d0c05ed 100755
> --- a/run_tests.sh
> +++ b/run_tests.sh
> @@ -100,6 +100,14 @@ while [ $# -gt 0 ]; do
>      shift
>  done
>  
> +case "$TARGET" in
> +qemu)
> +    ;;
> +*)
> +    echo "$0 does not support '$TARGET'"
> +    exit 2
> +esac
> +
>  # RUNTIME_log_file will be configured later
>  if [[ $tap_output == "no" ]]; then
>      process_test_output() { cat >> $RUNTIME_log_file; }
> diff --git a/scripts/mkstandalone.sh b/scripts/mkstandalone.sh
> index 2318a85f0706..4de97056e641 100755
> --- a/scripts/mkstandalone.sh
> +++ b/scripts/mkstandalone.sh
> @@ -7,6 +7,14 @@ fi
>  source config.mak
>  source scripts/common.bash
>  
> +case "$TARGET" in
> +qemu)
> +    ;;
> +*)
> +    echo "'$TARGET' not supported for standlone tests"
> +    exit 2
> +esac
> +
>  temp_file ()
>  {
>  	local var="$1"
> -- 
> 2.47.1
>

I think we could put the check in a function in scripts/arch-run.bash and
just use the same error message for all cases.

Thanks,
drew

> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

