Return-Path: <linuxppc-dev+bounces-5463-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4999EA181F3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2025 17:24:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcsxL5CNbz30Vf;
	Wed, 22 Jan 2025 03:24:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.173
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737476694;
	cv=none; b=FXZtTj+BG4eyQrUsmZU04IW6VQ7t8pF6O56WZwE4+BG+EGw/ufs2XMjI0wbDU5OO5vB4bK8J//N4+1Llw+pe1mDl54fUPwZg83Q+44BgLlUtyq4Sron4X82ighVzc0VFuRstc6sHNjNxuf+fL1KCHPOfvoCkOYvIFTWwQ1oekoXC3ORuE7Q3Klw6HB4ZU/tuc+ucl5l1O8hUzjRjSM1HXjy2WrX7owjrvAFZdIDI3thr7RKvX3HQLbPm0f+lsIpNBWtGPZM4S2tBd4ROSiz6v2UnyRdWeKJdwlJbiBkHIuMi5hTL1Q70HkkLtQcV+2RXGBsTtyjn0EuGd/itOmAVKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737476694; c=relaxed/relaxed;
	bh=H6pzkPiNgYGUEzo0pWRd1g0zmrJRFWgoHspDsCsXeo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lSCpApz0kQOKfpkAWFnSVsyvxTgHKpWjLg16HitjtL9d3uBhlIhF9duUOmjofST4QUJg9nnj7rYa2LK/370/gq+ZGvxS29py8YvQ9L2t5vGEfnl0GsmLaZD/I9MaAl405AmqdM3GtZN+5GNw4s+HnTZBPVqG/4nexcbGLEaa6h/VybL3ilaLDSUGPekEbQXhAeQMO7rr3mobUBcGIjQ4bJo8YZJ5U0uRzGIbZPj/gTiHpdgFRpGmgldDr3BCXVviDZSV/hekTeAJr5mo3zlEP5hfJLURbAKEXwOv9nRDqwemaXQflpgYIMggdV1scqEmb6v43kTjAEAwJCQ+fyMB5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=95.215.58.173; helo=out-173.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.173; helo=out-173.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YcsxD5xTkz30VZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2025 03:24:47 +1100 (AEDT)
Date: Tue, 21 Jan 2025 17:24:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737476668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H6pzkPiNgYGUEzo0pWRd1g0zmrJRFWgoHspDsCsXeo0=;
	b=MRTrxH9cLSMxf51WTQhkuQO65jTuw3qwoo1tjBxJihfQOf2x5FOyehb8UWzv4SKKAzuQB5
	rD44pG5X2+C1NjVUsr6PuOMEbUBG2/znpG7wMaPh1mM8cfAAAKGU2jRnsPvWkdT0tjU6Ya
	UDXoiEOzDjdymvmiH/k00tiHzEWuDh8=
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
Subject: Re: [kvm-unit-tests PATCH v2 07/18] scripts: Introduce kvmtool_opts
Message-ID: <20250121-9bef2681da529d9d41f524d3@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-8-alexandru.elisei@arm.com>
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
In-Reply-To: <20250120164316.31473-8-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 20, 2025 at 04:43:05PM +0000, Alexandru Elisei wrote:
> In preparation for supporting kvmtool, create and pass the variable
> 'kvmtool_opts' to the arch run script $RUNTIME_arch_run.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  scripts/common.bash  |  6 ++++--
>  scripts/runtime.bash | 14 +++++++++++---
>  2 files changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/common.bash b/scripts/common.bash
> index a40c28121b6a..1b5e0d667841 100644
> --- a/scripts/common.bash
> +++ b/scripts/common.bash
> @@ -37,6 +37,7 @@ function for_each_unittest()
>  	local check
>  	local accel
>  	local timeout
> +	local kvmtool_opts
>  	local rematch
>  
>  	exec {fd}<"$unittests"
> @@ -45,7 +46,7 @@ function for_each_unittest()
>  		if [[ "$line" =~ ^\[(.*)\]$ ]]; then
>  			rematch=${BASH_REMATCH[1]}
>  			if [ -n "${testname}" ]; then
> -				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$qemu_opts" "$arch" "$machine" "$check" "$accel" "$timeout"
> +				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$qemu_opts" "$arch" "$machine" "$check" "$accel" "$timeout" "$kvmtool_opts"

It looks odd to have both qemu_opts and kvmtool_opts at the same time.

>  			fi
>  			testname=$rematch
>  			smp=1
> @@ -57,6 +58,7 @@ function for_each_unittest()
>  			check=""
>  			accel=""
>  			timeout=""
> +			kvmtool_opts=""
>  		elif [[ $line =~ ^file\ *=\ *(.*)$ ]]; then
>  			kernel=$TEST_DIR/${BASH_REMATCH[1]}
>  		elif [[ $line =~ ^smp\ *=\ *(.*)$ ]]; then
> @@ -80,7 +82,7 @@ function for_each_unittest()
>  		fi
>  	done
>  	if [ -n "${testname}" ]; then
> -		$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$qemu_opts" "$arch" "$machine" "$check" "$accel" "$timeout"
> +		$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$qemu_opts" "$arch" "$machine" "$check" "$accel" "$timeout" "$kvmtool_opts"
>  	fi
>  	exec {fd}<&-
>  }
> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> index a89f2d10ab78..451b5585f010 100644
> --- a/scripts/runtime.bash
> +++ b/scripts/runtime.bash
> @@ -35,7 +35,7 @@ get_cmdline()
>  {
>      local kernel=$1
>  
> -    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel $qemu_opts"
> +    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel $opts"
>  }
>  
>  skip_nodefault()
> @@ -87,8 +87,16 @@ function run()
>      local check="${CHECK:-$8}"
>      local accel="$9"
>      local timeout="${10:-$TIMEOUT}" # unittests.cfg overrides the default
> -
> -    qemu_opts="-smp $smp $qemu_opts"
> +    local kvmtool_opts="${11}"
> +
> +    case "$TARGET" in
> +    qemu)
> +        opts="-smp $smp $qemu_opts"
> +        ;;
> +    kvmtool)
> +        opts="--cpus $smp $kvmtool_opts"
> +        ;;
> +    esac

This is similar to what I was proposing with the associative array, but
we'll only need to set a $vmm variable once with the array. If parsing
command lines is different between the vmms then we can even add
functions to the table

vmm_opts[qemu,func]=qemu_func
vmm_opts[kvmtool,func]=kvmtool_func

eval ${vmm_opts[$vmm,func]} ...

Thanks,
drew

>  
>      if [ "${CONFIG_EFI}" == "y" ]; then
>          kernel=${kernel/%.flat/.efi}
> -- 
> 2.47.1
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

