Return-Path: <linuxppc-dev+bounces-9821-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3AAAEA287
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 17:31:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSjM727kcz30P3;
	Fri, 27 Jun 2025 01:30:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::b9"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750951859;
	cv=none; b=Qb35GP4tWaTca8aczd3rxblnlXvtoMTzwGEkc7Qgs/ckqzCAtZkIEXcDZ5krh0TecJNzGs12rVmd2svKmSmGJSs0Ez7wiL+V/NtosU31wNlxw0CERmO7HiCU5AXXDOX1ZeXxORv2SC9gGahOD2/E6jSGICkQBmp4B2Bk0mtQU7mEuvtQW+LwgEvrRb+loH8FLxquiK81WoEJDph5MUuDoXzjXY2mvWuiWGCw9COPZ2jtVy2TGU6SJVyewzlja16nkZiSj5d6z4Q1JPr9svOpr3YG6taBZCX46P3HGzIsPLGn5jVGFTxymexTkzyn6GgtHkHkwOLl7cv30reKCuRDTg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750951859; c=relaxed/relaxed;
	bh=yMeirCEvb93+6eKpc7HB6gbXZIpqW2Hi3+BGISmVpIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mxGRYabc06NdX3BCPtuEUtmO1M0S3BeaKhEQTQ7MWuXj27onMV5f4yfnlf5wwHiDMHUrFOsVDbRdZDQ4bO+p24e/U+yUuH5b7XA8ZG9kvYYK8T8nYWJ3qHqvT1wa31s33QHb01hhgJj6/0F9ab9Z2Xjf2m7xgItA5PWPo6TWOxy1bvzUgF0A7kvlK1QIPacNSO6MlNbF4n25V6dTp0ae/0BCE2ZbxMl5v6K4AVWCl6VDys3aN710OM5PRDEeHPXC6r/T0snyoIrxv2pTA0w80KTIB7YmxkSlxIeL34/abHEYJrA5jdz6M2TjfTqOpTNX2yT/lSHXcgfHOCLc8Sbiqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vWWiHDwj; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::b9; helo=out-185.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vWWiHDwj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::b9; helo=out-185.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 306 seconds by postgrey-1.37 at boromir; Fri, 27 Jun 2025 01:30:58 AEST
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSjM61LY3z30Nl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jun 2025 01:30:57 +1000 (AEST)
Date: Thu, 26 Jun 2025 17:25:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750951527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yMeirCEvb93+6eKpc7HB6gbXZIpqW2Hi3+BGISmVpIs=;
	b=vWWiHDwjdsnVxah//VOE06mn+L789ERAyxJwwodV56NBj7UU4/YpmcD1M2GXm2fk1fEz+c
	RE+pf5Ngacj1OI2IB9rFXUFyD830hpC72TGw65II7dNFETzAGJbHVR2KYTBX0Hdw2T6JcQ
	IYGWh/VdELSLLRDiG1kJohVZrlF6uxc=
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
Subject: Re: [kvm-unit-tests PATCH v4 03/13] scripts: Refuse to run the tests
 if not configured for qemu
Message-ID: <20250626-e99cee57aaa67223c2e09f31@orel>
References: <20250625154813.27254-1-alexandru.elisei@arm.com>
 <20250625154813.27254-4-alexandru.elisei@arm.com>
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
In-Reply-To: <20250625154813.27254-4-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 25, 2025 at 04:48:03PM +0100, Alexandru Elisei wrote:
> Arm and arm64 support running the tests under kvmtool. kvmtool has a
> different command line syntax for configuring and running a virtual
> machine, and the automated scripts know only how to use qemu.
> 
> One issue with that is even though the tests have been configured for
> kvmtool (with ./configure --target=kvmtool), the scripts will use qemu to
> run the tests, and without looking at the logs there is no indication that
> the tests haven't been run with kvmtool, as configured.
> 
> Another issue is that kvmtool uses a different address for the UART and
> when running the tests with qemu via the scripts, this warning is
> displayed:
> 
> WARNING: early print support may not work. Found uart at 0x9000000, but early base is 0x1000000.
> 
> which might trip up an unsuspected user.
> 
> There are four different ways to run a test using the test infrastructure:
> with run_tests.sh, by invoking arm/run or arm/efi/run with the correct
> parameters (only the arm directory is mentioned here because the tests can
> be configured for kvmtool only on arm and arm64), and by creating
> standalone tests.
> 
> run_tests.sh ends up executing either arm/run or arm/efi/run, so add a
> check to these two scripts for the test target, and refuse to run the test
> if kvm-unit-tests has been configured for kvmtool.
> 
> mkstandalone.sh also executes arm/run or arm/efi run, but the usual use
> case for standalone tests is to compile them on one machine, and then to
> run them on a different machine. This two step process can be time
> consuming, so save the user time (and frustration!) and add a check
> directly to mkstandalone.sh.
> 
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
> 
> Changes v3->v4:
> 
> * Renamed check_vmm_supported() to vmm_check_supported().
> * Added function vmm_get_target().
> * Added Reviewed-by from Shaoqin.
> * Fixed typo s/execuing/executing (Drew).
> 
>  arm/efi/run             |  3 +++
>  arm/run                 |  4 ++++
>  scripts/mkstandalone.sh |  6 +++++-
>  scripts/vmm.bash        | 25 +++++++++++++++++++++++++
>  4 files changed, 37 insertions(+), 1 deletion(-)
>  create mode 100644 scripts/vmm.bash
> 
> diff --git a/arm/efi/run b/arm/efi/run
> index 8f41fc02df31..38800e8bfa13 100755
> --- a/arm/efi/run
> +++ b/arm/efi/run
> @@ -11,6 +11,9 @@ if [ ! -f config.mak ]; then
>  fi
>  source config.mak
>  source scripts/arch-run.bash
> +source scripts/vmm.bash
> +
> +vmm_check_supported
>  
>  if [ -f /usr/share/qemu-efi-aarch64/QEMU_EFI.fd ]; then
>  	DEFAULT_UEFI=/usr/share/qemu-efi-aarch64/QEMU_EFI.fd
> diff --git a/arm/run b/arm/run
> index ef58558231b7..edf0c1dd1b41 100755
> --- a/arm/run
> +++ b/arm/run
> @@ -7,7 +7,11 @@ if [ -z "$KUT_STANDALONE" ]; then
>  	fi
>  	source config.mak
>  	source scripts/arch-run.bash
> +	source scripts/vmm.bash
>  fi
> +
> +vmm_check_supported
> +
>  qemu_cpu="$TARGET_CPU"
>  
>  if [ "$QEMU" ] && [ -z "$ACCEL" ] &&
> diff --git a/scripts/mkstandalone.sh b/scripts/mkstandalone.sh
> index c4ba81f18935..9c5768563757 100755
> --- a/scripts/mkstandalone.sh
> +++ b/scripts/mkstandalone.sh
> @@ -6,6 +6,9 @@ if [ ! -f config.mak ]; then
>  fi
>  source config.mak
>  source scripts/common.bash
> +source scripts/vmm.bash
> +
> +vmm_check_supported
>  
>  temp_file ()
>  {
> @@ -71,7 +74,8 @@ generate_test ()
>  	args[3]='$bin'
>  
>  	(echo "#!/usr/bin/env bash"
> -	 cat scripts/arch-run.bash "$TEST_DIR/run") | temp_file RUNTIME_arch_run
> +	 cat scripts/vmm.bash scripts/arch-run.bash "$TEST_DIR/run") \
> +		| temp_file RUNTIME_arch_run
>  
>  	echo "exec {stdout}>&1"
>  	echo "RUNTIME_log_stdout () { cat >&\$stdout; }"
> diff --git a/scripts/vmm.bash b/scripts/vmm.bash
> new file mode 100644
> index 000000000000..8365c1424a3f
> --- /dev/null
> +++ b/scripts/vmm.bash
> @@ -0,0 +1,25 @@
> +function vmm_get_target()
> +{
> +	if [[ -z "$TARGET" ]]; then
> +		echo "qemu"
> +	else
> +		echo "$TARGET"
> +	fi
> +}
> +
> +function vmm_check_supported()
> +{
> +	# We're not interested in the return code for vmm_get_target().
> +	# shellcheck disable=SC2155
> +	local target=$(vmm_get_target)
> +
> +	case "$target" in
> +	qemu)
> +		return 0
> +		;;
> +	*)
> +		echo "$0 does not support target '$target'"
> +		exit 2
> +		;;
> +	esac
> +}
> -- 
> 2.50.0
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

