Return-Path: <linuxppc-dev+bounces-5459-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD93AA18176
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2025 16:56:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcsJP4bdgz30V3;
	Wed, 22 Jan 2025 02:56:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::b6"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737474981;
	cv=none; b=jpRJ9CjsL3Ch6GiCm9fDOBVqzhGGGjv4/NKucOFFd0jyWcW2ixcv6kFrr1Wyqv7QotJww9qzQR/6lOveY+XTeo694CPJ8ZoNKRxu56u5dhc4s6/MMIrfePzsESWsBx1EGd8SwHhLgqluHrlMBH01jQurfpJX7Fu+jgn8iFb2B85ENNircYy00sUa12nm5TBrT9cwHf0ahb35q0UNoH5idMTUWIJySAodx9JQ/qqR7hJ9B2uuKSHAvwOIM5zRSdIIjzlTS3R8CDoZwEsR28R6I7or8dmg6ojcolUJgeSRE1YQ6VysoW6F/48DBwv8V5d7mn+nEFynsQTvFr3cFTH/oA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737474981; c=relaxed/relaxed;
	bh=kHTOuyrf6b476FzSvoIER5fEZhvPhJ7qECQ1yaBVPL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LojeqLt8EkkPpI3aP356T/j2Z+sG3MsGrbR8KxeaGMaLjImGTl4powJByIC9UiK3uxFWuhXkF7HAog9uW9Z+MeU7Xflpb6qeetBvuJ+27yaZfDaSxJJGRgzAR8TrRgD5yUbUuZraHSP3iN+0uhDHZoL1Hyt5tsGgswclsBawp2KU23c5JUpdpszZDKqn9UKmRSEYovI0U7IUb9tB0BZ/11pmkc60xCmhtu8CqxznzuTws0eTaoSi1A2i3rNLwzv+99SpZTAK6ln7PhbXn2RbXp2K8J2nkg7Yo94FBWNPrXd9rQNhzUqBcPIlO5UZgkf/k7eEdLNXBCw54GLQdl4Txg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=2001:41d0:1004:224b::b6; helo=out-182.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::b6; helo=out-182.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YcsJH6XN6z30Tx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2025 02:56:15 +1100 (AEDT)
Date: Tue, 21 Jan 2025 16:55:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737474951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kHTOuyrf6b476FzSvoIER5fEZhvPhJ7qECQ1yaBVPL8=;
	b=jLVi0j6635xXGMEyTSFWna0XxMzqF2D1nptRyo0YaJbkTHBxTdhT3652Yr2iFc0Y5suHsA
	4Ei5OyRalZhl/ixQe29WtwJT80HAtPxSaIE95vxNxB08Xo3+igSKAk/Wjly3kv8oY4/7bI
	ptincaA2GFFdsPAgDVzzEIUHWHkOFaM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	oliver.upton@linux.dev, suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, 
	andre.przywara@arm.com, Alexandru Elisei <alexandru.elisei@gmail.com>
Subject: Re: [kvm-unit-tests PATCH v2 05/18] scripts: Rename run_qemu_status
 -> run_test_status
Message-ID: <20250121-566d55e720f59e93c88af5e4@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-6-alexandru.elisei@arm.com>
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
In-Reply-To: <20250120164316.31473-6-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 20, 2025 at 04:43:03PM +0000, Alexandru Elisei wrote:
> From: Alexandru Elisei <alexandru.elisei@gmail.com>
> 
> For the arm/arm64 architectures, kvm-unit-tests can also be run using the
> kvmtool virtual machine manager. Rename run_qemu_status to run_test_status
> to make it more generic, in preparation to add support for kvmtool.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  arm/run               | 4 ++--
>  powerpc/run           | 2 +-
>  riscv/run             | 4 ++--
>  s390x/run             | 2 +-
>  scripts/arch-run.bash | 2 +-
>  5 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arm/run b/arm/run
> index 6db32cf09c88..9b11feafffdd 100755
> --- a/arm/run
> +++ b/arm/run
> @@ -85,9 +85,9 @@ command+=" -display none -serial stdio"
>  command="$(migration_cmd) $(timeout_cmd) $command"
>  
>  if [ "$UEFI_SHELL_RUN" = "y" ]; then
> -	ENVIRON_DEFAULT=n run_qemu_status $command "$@"
> +	ENVIRON_DEFAULT=n run_test_status $command "$@"
>  elif [ "$EFI_USE_ACPI" = "y" ]; then
> -	run_qemu_status $command -kernel "$@"
> +	run_test_status $command -kernel "$@"
>  else
>  	run_qemu $command -kernel "$@"
>  fi
> diff --git a/powerpc/run b/powerpc/run
> index 27abf1ef6a4d..9b5fbc1197ed 100755
> --- a/powerpc/run
> +++ b/powerpc/run
> @@ -63,4 +63,4 @@ command="$(migration_cmd) $(timeout_cmd) $command"
>  # to fixup the fixup below by parsing the true exit code from the output.
>  # The second fixup is also a FIXME, because once we add chr-testdev
>  # support for powerpc, we won't need the second fixup.
> -run_qemu_status $command "$@"
> +run_test_status $command "$@"
> diff --git a/riscv/run b/riscv/run
> index 73f2bf54dc32..2a846d361a4d 100755
> --- a/riscv/run
> +++ b/riscv/run
> @@ -34,8 +34,8 @@ command+=" $mach $acc $firmware -cpu $processor "
>  command="$(migration_cmd) $(timeout_cmd) $command"
>  
>  if [ "$UEFI_SHELL_RUN" = "y" ]; then
> -	ENVIRON_DEFAULT=n run_qemu_status $command "$@"
> +	ENVIRON_DEFAULT=n run_test_status $command "$@"
>  else
>  	# We return the exit code via stdout, not via the QEMU return code
> -	run_qemu_status $command -kernel "$@"
> +	run_test_status $command -kernel "$@"
>  fi
> diff --git a/s390x/run b/s390x/run
> index 34552c2747d4..9ecfaf983a3d 100755
> --- a/s390x/run
> +++ b/s390x/run
> @@ -47,4 +47,4 @@ command+=" -kernel"
>  command="$(panic_cmd) $(migration_cmd) $(timeout_cmd) $command"
>  
>  # We return the exit code via stdout, not via the QEMU return code
> -run_qemu_status $command "$@"
> +run_test_status $command "$@"
> diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> index 8643bab3b252..d6eaf0ee5f09 100644
> --- a/scripts/arch-run.bash
> +++ b/scripts/arch-run.bash
> @@ -75,7 +75,7 @@ run_qemu ()
>  	return $ret
>  }
>  
> -run_qemu_status ()
> +run_test_status ()
>  {
>  	local stdout ret
>  
> -- 
> 2.47.1

Hmm, run_qemu_status() wraps run_qemu() so it seems appropriately named,
especially since the return value of run_qemu() has had QEMU-specific
return codes considered. It seems we should first decouple
run_qemu_status() from run_qemu() or to sanitize run_qemu() of anything
QEMU-specific and rename it to run_test() at the same time.

Thanks,
drew

