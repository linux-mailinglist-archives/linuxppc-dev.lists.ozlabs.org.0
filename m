Return-Path: <linuxppc-dev+bounces-5159-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC88A0BBE3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 16:28:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWx3k6vPQz3cXv;
	Tue, 14 Jan 2025 02:28:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.182
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736782098;
	cv=none; b=Ea/7METdxNqXAQrYP+84bcl+UM2DqkqDcNVuPOcCpzrmOpEWlssKgO6JafhulBRPjcG9sxZw2vuGfm7tZHD8alOLB5e8RC9O28TIgizx4ZuElNExyfQasgv5a3ZUi0k1sHglTg10px/yV1jqvVs6l+m0tIrelwSymyPKo6KL7SmIg7n0RpDoABO5xYd3WeWizNihZv0ljq2pampnA+xmIlKTOzUQWmfvmLBBYdixd4ZQO3/xErNUXRgxarw7wJdBURt5nDrOPvuRbTfwjVN1kt3eEDODK2P5PDn3BXJtSW8dE2TIMvwUKVXm3dxx3YV7CGIPY0rBfGKCP33RhDeoHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736782098; c=relaxed/relaxed;
	bh=S+csKsh3Lg7wrpCs4Aw/UvMnqMM5F3l+RfYbkKy7EYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQs1Poo3qbgE/gNApZ6hd98rJyoRhTXZGBe87rcw5Utmh63Svh+OU9Rc4xV7DRpCOd4AM69MIkqHt10lbNpxDWU4mKs2QCkQ+r3cChBwXHs8qPcQODT9qw1sZkDxpnsk9hWL8hRzGwBkjtjn1VVbMwcsUbllkV9EQhBR7zw3Nr7ZqI4N7+Ba6UJTUh+ERq1ARUK+SxkBIeXE7SynJl2uUwnKz8oEikaJ7thqWWQmDQQAwy3ruHgIcFoiVj7Wv26Gv6MaxsHVkcEO52c8b5f0CuCeX1lhHgjQEN/vs4Ick9pAsEl+1xTi1zG32fhJfGMquruAjtb7bH1aWfhikCpjyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=95.215.58.182; helo=out-182.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.182; helo=out-182.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 349 seconds by postgrey-1.37 at boromir; Tue, 14 Jan 2025 02:28:09 AEDT
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWx3Y4Sx5z3cWB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 02:28:06 +1100 (AEDT)
Date: Mon, 13 Jan 2025 16:21:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736781711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S+csKsh3Lg7wrpCs4Aw/UvMnqMM5F3l+RfYbkKy7EYM=;
	b=UjLtIJEJqjbkAT36AMpiAe0fD9h+BuKq8WrfC8ZgnnfMKd7Nc4EDfAce3ipS7uSByGds+v
	FPOfxYRI2mn+Ou1KYtzN4wBPzc60mj76w4nF1c5Qi4gFd2ZJpG5K0VdSH0tHXY1qDE13Wg
	SJaTYVp8yxhDXi0xtO10SmV/D5z/LIs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v1 4/5] arm/arm64: Add support for
 --processor=max
Message-ID: <20250113-8711bc93ade1e8c83dfe3582@orel>
References: <20250110135848.35465-1-alexandru.elisei@arm.com>
 <20250110135848.35465-5-alexandru.elisei@arm.com>
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
In-Reply-To: <20250110135848.35465-5-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Jan 10, 2025 at 01:58:47PM +0000, Alexandru Elisei wrote:
> For arm64, newer architecture features are supported only on newer CPUs.
> Instead of expecting the user to know which CPU model supports which
> feature when using the TCG accelerator for qemu, let's make it easier and
> add support for the --processor 'max' value.
> 
> The --processor value is passed to the compiler's -mcpu argument and to
> qemu's -cpu argument. 'max' is a special value that only qemu understands -
> it means that all CPU features that qemu implements are supported by the
> guest CPU, and passing it to the compiler causes a build error. So omit the
> -mcpu argument when $PROCESSOR=max.
> 
> This affects only the TCG accelerator; when using KVM or HVF,
> kvm-unit-tests sets the cpu model to 'host'.
> 
> Note that using --processor=max with a 32 bit compiler will cause a build
> error: the CPU model that the compiler defaults to when the -mcpu argument
> is missing lacks support for some of the instructions that kvm-unit-tests
> uses. The solution in the case is to specify a CPU model for the compiler
> using --cflags:
> 
>   ./configure --arch=arm --processor=max --cflags=-mcpu=<cpu>
> 
> This patch doesn't introduce a regression for arm when --processor=max is
> used, it's only the error that changes: from an unknown processor type to
> using instructions that are not available on the processor.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  arm/Makefile.common | 2 ++
>  configure           | 5 ++++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arm/Makefile.common b/arm/Makefile.common
> index a5d97bcf477a..b757250dc9ae 100644
> --- a/arm/Makefile.common
> +++ b/arm/Makefile.common
> @@ -25,7 +25,9 @@ AUXFLAGS ?= 0x0
>  # stack.o relies on frame pointers.
>  KEEP_FRAME_POINTER := y
>  
> +ifneq ($(PROCESSOR),max)
>  CFLAGS += -mcpu=$(PROCESSOR)
> +endif
>  CFLAGS += -std=gnu99
>  CFLAGS += -ffreestanding
>  CFLAGS += -O2
> diff --git a/configure b/configure
> index 138840c3f76d..46964d36a7d8 100755
> --- a/configure
> +++ b/configure
> @@ -67,7 +67,10 @@ usage() {
>  	Options include:
>  	    --arch=ARCH            architecture to compile for ($arch). ARCH can be one of:
>  	                           arm, arm64/aarch64, i386, ppc64, riscv32, riscv64, s390x, x86_64
> -	    --processor=PROCESSOR  processor to compile for ($default_processor)
> +	    --processor=PROCESSOR  processor to compile for ($default_processor). For arm and arm64, the
> +	                           value 'max' is special and it will be passed directly to
> +	                           qemu, bypassing the compiler. In this case, --cflags can be
> +	                           used to compile for a specific processor.
>  	    --target=TARGET        target platform that the tests will be running on (qemu or
>  	                           kvmtool, default is qemu) (arm/arm64 only)
>  	    --cross-prefix=PREFIX  cross compiler prefix
> -- 
> 2.47.1
>

I don't think we want to overload processor this way. While mcpu and QEMU
could both understand the same cpu names, then it was mostly fine
(although it probably shouldn't have been overloaded before either). Now
that we want one name for compiling and another for running, then I think
we need another configure parameter, something like --qemu-cpu.

Thanks,
drew

> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

