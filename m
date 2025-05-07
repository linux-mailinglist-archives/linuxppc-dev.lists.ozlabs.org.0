Return-Path: <linuxppc-dev+bounces-8405-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D727AAE61B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 18:10:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zt0bt6rQbz30Bd;
	Thu,  8 May 2025 02:10:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::b2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746634234;
	cv=none; b=OReOMUMb+mx8IE3VCB5T77w3YzPjoCKW3RHLrKsk60x8laAkau7OB/PrtgGVkrWvVSE/eNDrjZcD4A8ZHC7fKBD81EwYR0WMsh/hr7rfhsfmQmBI8pr9KZLKf3b32ur8fC10bsF1dcePlwoSExnQgr/n7Fb4mHJw0AgaY7QkC2PLftHzuTp3yJCA8OboM57fnCJ6ypX0llvoMkSMIOJaELDi8YElSzpa+U6dctBq23h2yn5piEZlqvyS+Hk8l46yfqE7cOsrR37L0QNinR8Dqh+JPJnBwlbA24UH1sPMI1mD11PXFDa4e+5a4ZN6DHJ0TEQPyKIDHisae4Tu/1ozfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746634234; c=relaxed/relaxed;
	bh=JiZ31VdvRQ6VkYliXJ2lIgISyRlmOkDR5mD/TR0GNrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jRmDdFoIO95T85vKitXTGR3gXLD8YfWQVN6vGlea7P6/63ztGYEmofwv+VS2uT8YbO7wa7wXIJLSf2+ur+6lIR7gnstwNMoTbkc2A8ZXerc1mqGn/a37vWiMDYn3ZrpOtfXzvR98CfAzYRcrZyaoulfzM2g5BfTljOiO5gt3dyiJQ2jLTyyiTK8YIevsEegxS1XKTbT30eqCAQ6QAtgSy2q0FOhna+eZbaewuUhxucu6EO+iVJKxaVUR+Uv6Ndy3YqV+RTeQr47M6EP05ofLRfwQ0k49x8kmZnQoFPjT+rxqUT6U7QU/YujYF9OGNcPG5Yub5eO6WmfqJ9tpVLiJlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mBCAnAjD; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::b2; helo=out-178.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mBCAnAjD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::b2; helo=out-178.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [IPv6:2001:41d0:203:375::b2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zt0bs613Rz3089
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 02:10:32 +1000 (AEST)
Date: Wed, 7 May 2025 18:10:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746634212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JiZ31VdvRQ6VkYliXJ2lIgISyRlmOkDR5mD/TR0GNrQ=;
	b=mBCAnAjDrOlyA/gWMCdvr9yEcQvawdVZPybIJtBkNa03TXy6t+4fWpUDOV/VRRsAVOfYYy
	Gf/WlIPkGWUwXrG7ycWyWXxTMCDlKluWEo4Exg4ICH3453d8oQ54/FmNRZIomdLki4TcGd
	YOE5MAL2C3ZcTFfygytLkHpW6IK+DpA=
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
Subject: Re: [kvm-unit-tests PATCH v3 06/16] scripts: Refuse to run the tests
 if not configured for qemu
Message-ID: <20250507-9143a202e9745535dd43b5a8@orel>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
 <20250507151256.167769-7-alexandru.elisei@arm.com>
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
In-Reply-To: <20250507151256.167769-7-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 07, 2025 at 04:12:46PM +0100, Alexandru Elisei wrote:
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
> run_tests.sh ends up execuing either arm/run or arm/efi/run, so add a check

executing

> to these two scripts for the test target, and refuse to run the test if
> kvm-unit-tests has been configured for kvmtool.
> 
> mkstandalone.sh also executes arm/run or arm/efi run, but the usual use
> case for standalone tests is to compile them on one machine, and then to
> run them on a different machine. This two step process can be time
> consuming, so save the user time (and frustration!) and add a check
> directly to mkstandalone.sh.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  arm/efi/run             |  3 +++
>  arm/run                 |  4 ++++
>  scripts/mkstandalone.sh |  3 +++
>  scripts/vmm.bash        | 14 ++++++++++++++
>  4 files changed, 24 insertions(+)
>  create mode 100644 scripts/vmm.bash
> 
> diff --git a/arm/efi/run b/arm/efi/run
> index 8f41fc02df31..53d71297cc52 100755
> --- a/arm/efi/run
> +++ b/arm/efi/run
> @@ -11,6 +11,9 @@ if [ ! -f config.mak ]; then
>  fi
>  source config.mak
>  source scripts/arch-run.bash
> +source scripts/vmm.bash
> +
> +check_vmm_supported
>  
>  if [ -f /usr/share/qemu-efi-aarch64/QEMU_EFI.fd ]; then
>  	DEFAULT_UEFI=/usr/share/qemu-efi-aarch64/QEMU_EFI.fd
> diff --git a/arm/run b/arm/run
> index ef58558231b7..56562ed1628f 100755
> --- a/arm/run
> +++ b/arm/run
> @@ -7,7 +7,11 @@ if [ -z "$KUT_STANDALONE" ]; then
>  	fi
>  	source config.mak
>  	source scripts/arch-run.bash
> +	source scripts/vmm.bash
>  fi
> +
> +check_vmm_supported
> +
>  qemu_cpu="$TARGET_CPU"
>  
>  if [ "$QEMU" ] && [ -z "$ACCEL" ] &&
> diff --git a/scripts/mkstandalone.sh b/scripts/mkstandalone.sh
> index c4ba81f18935..4f666cefe076 100755
> --- a/scripts/mkstandalone.sh
> +++ b/scripts/mkstandalone.sh
> @@ -6,6 +6,9 @@ if [ ! -f config.mak ]; then
>  fi
>  source config.mak
>  source scripts/common.bash
> +source scripts/vmm.bash
> +
> +check_vmm_supported
>  
>  temp_file ()
>  {
> diff --git a/scripts/vmm.bash b/scripts/vmm.bash
> new file mode 100644
> index 000000000000..39325858c6b3
> --- /dev/null
> +++ b/scripts/vmm.bash
> @@ -0,0 +1,14 @@
> +source config.mak
> +
> +function check_vmm_supported()
> +{
> +	case "$TARGET" in
> +	qemu)
> +		return 0
> +		;;
> +	*)
> +		echo "$0 does not support target '$TARGET'"
> +		exit 2
> +		;;
> +	esac
> +}

Hmm. We now have configure saying one thing for arm/arm64 and this
function saying another. Assuming this is just temporary and will
be resolved in the next patches, then that's probably OK, though.

Thanks,
drew

