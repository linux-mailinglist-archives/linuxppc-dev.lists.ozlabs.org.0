Return-Path: <linuxppc-dev+bounces-8404-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FDCAAE5EA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 18:05:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zt0V73cgZz30BG;
	Thu,  8 May 2025 02:05:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.189
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746633935;
	cv=none; b=c5w6ad2c4tug71vCAn3vBk9lRY7CIqKyVUl9yDQ3AdaMpMsJNizB916n2R2foCjDE8N9irszXZQ/JJRmrro+iEZF1BoSLkSDxjJwYZGRQKobK020yyIy1h30/bHx4JbmB20jtpnooiQQnDrk6Xw05P5y8LS4PFyYJbALXNUsnl6bKWSuGc4sZnMOGtw8lEIn933gYNJLwlT/wxiJgxRu9U18aWVyG1PaPiMFfnTrg4pmkeuqzz1/xasHlv6siUqP/huHB711TDxzCiVC/iteabXm62xJzc5GUaYP1iwpi3yon2oTrBEifcTjYlcehvJFmx1i2xItj4m9JiZTluLzPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746633935; c=relaxed/relaxed;
	bh=ekBedcL1Lp3vekEN23FbKEi/Hlbj3mFx+ToO6OvQpxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MzcxKJgYjdNzrWRmNvuVwBRXJs4uEi6bAkchU4EuDMF3KMxXMQUWrLLqhxHeSrAPUdY26K+MEF/4zKZnK+WZEi6wjR+M003V3WakmS5hxZKHjQHoG++Q48J+jZjLd0DHsHvBDV89riTpxnlcdTETEKJWAw00ssrYjOs4tzOyoyvGzxzydk+SbZbUQdiNLsXlf0AqJ3DC6QqIPiILEBP4FMceYFdSsYWcamSg72Y3QFss65Z91QJxopPVepKeirhl+6r3gvxhX6mwtsxrGA0qyQQSaq7S6W1KDBnVe4mBT6CQjGcGRqvup+qMCbfnlVBxG2TlaVF6m81A2DrJsmzDtg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YqX9hj+3; dkim-atps=neutral; spf=pass (client-ip=91.218.175.189; helo=out-189.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YqX9hj+3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.189; helo=out-189.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 387 seconds by postgrey-1.37 at boromir; Thu, 08 May 2025 02:05:34 AEST
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zt0V64qpSz3089
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 02:05:34 +1000 (AEST)
Date: Wed, 7 May 2025 17:58:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746633526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ekBedcL1Lp3vekEN23FbKEi/Hlbj3mFx+ToO6OvQpxE=;
	b=YqX9hj+38OgRaOntcA9ClHnRF+VTU38CY8ZCoMRLgScpfivUKP9WCJ4xsKAseKQga5btxN
	Tb2wAbshPyrW/hSI9N1ZLIMfMRx5Y/iFtyG9WWcerzHCSD6BqjiZBSwZSWZcWv/stA71rB
	NXJTOMGyrWuIEx7Qo5bthakJ/oyO3MQ=
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
Subject: Re: [kvm-unit-tests PATCH v3 02/16] scripts: Add 'test_args' test
 definition parameter
Message-ID: <20250507-d69f4d5ffe44cedee80dad11@orel>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
 <20250507151256.167769-3-alexandru.elisei@arm.com>
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
In-Reply-To: <20250507151256.167769-3-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 07, 2025 at 04:12:42PM +0100, Alexandru Elisei wrote:
...
>  # FPU/SIMD test
> @@ -276,17 +291,20 @@ arch = arm64
>  [mte-sync]
>  file = mte.flat
>  groups = mte
> -qemu_params = -machine mte=on -append 'sync'
> +test_args=sync

add spaces around =

> +qemu_params = -machine mte=on
>  arch = arm64
>  
>  [mte-async]
>  file = mte.flat
>  groups = mte
> -qemu_params = -machine mte=on -append 'async'
> +test_args=async

spaces

> +qemu_params = -machine mte=on
>  arch = arm64
>  
>  [mte-asymm]
>  file = mte.flat
>  groups = mte
> -qemu_params = -machine mte=on -append 'asymm'
> +test_args=asymm

spaces

...
> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> index 400e8a082528..06cc58e79b69 100644
> --- a/scripts/runtime.bash
> +++ b/scripts/runtime.bash
> @@ -80,12 +80,18 @@ function run()
>      local groups="$2"
>      local smp="$3"
>      local kernel="$4"
> -    local opts="$5"
> -    local arch="$6"
> -    local machine="$7"
> -    local check="${CHECK:-$8}"
> -    local accel="$9"
> -    local timeout="${10:-$TIMEOUT}" # unittests.cfg overrides the default
> +    local test_args="$5"
> +    local opts="$6"
> +    local arch="$7"
> +    local machine="$8"
> +    local check="${CHECK:-$9}"
> +    local accel="${10}"
> +    local timeout="${11:-$TIMEOUT}" # unittests.cfg overrides the default
> +
> +    # If $test_args is empty, qemu will interpret the first option after -append
> +    # as a kernel parameter instead of a qemu option, so make sure the -append
> +    # option is used only if $test_args is not empy.

                                                  ^ empty

Otherwise,

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

