Return-Path: <linuxppc-dev+bounces-5161-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 122B3A0BBF3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 16:29:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWx5b5J6Yz3cYL;
	Tue, 14 Jan 2025 02:29:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::b2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736782195;
	cv=none; b=NRF90E/I3XalOtN8pg7nfqmQs/EM3elrRATc5atWxgmDUgsGXhhFxtJ7SisOlZr/Q7qtKkmRibYbOhJbsw52buLkbzhBIz1blquCjT5cpje8uZLpLKYqaYKXbJgkKYKuqMW7C5irkp6a3dQZH1IoemHgHdCD2mVtT+hNNTvyPtvXBG3iV5X+r0G5PHjTk+Rk307wUAG/0TFXcFRd+NV/y3tyRkSkDAivGa0kQ8UtYJEpG2SULfUb1kYzna4zR7zM+6eK2/pev+NT2QrLRPyKnv4jFdMAz/voXyvmoctKAh7Mx6V8Ce5HjNkpZefGYz0djitWaRxL03xQRePQGR+MiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736782195; c=relaxed/relaxed;
	bh=rSA+hNOyAkcLqPBtZ57pM1gCyD3g1ELMOtUcZw34bIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kHp5tlm3UGdBaTw8S7IOaLcZWqbJriBGcbgaGHZZrX5fOLTVWjWWM0p1B4dejzQgI35KOUtkcUD4BNGcxdohLmpI3BqZ9WZDYDRkdgYVPnlWyAc329MDVUPjZL8jZ3iJpjYT+5znAcjQhfxPbFZYv/fT074iwp4CTJxHyzvsnOYxwLy6og7Uk909EB+wNc5mKBke1zidWwLmVcOWz+odch5KPTkWzKvSW/7YF9CWLNzlokjyWVAWxlaWC65l78RDBNlkJXbmHqXvFpJofYJOXG3PgKk4K6bScZUNVb18hn3wM2OxoOhBoohIpGU/h82chNCcVfl2ExhkgPXtG8XSKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=2001:41d0:1004:224b::b2; helo=out-178.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::b2; helo=out-178.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWx5S3fcTz3cWB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 02:29:47 +1100 (AEDT)
Date: Mon, 13 Jan 2025 16:29:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736782164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rSA+hNOyAkcLqPBtZ57pM1gCyD3g1ELMOtUcZw34bIg=;
	b=UQEGUKFI8PzrtF1awGKC1+UN8EXl+LliNVAFCiprEQoOfIHy5va7+W4MlnEdWWNcLmpDsz
	wYZNGBL+YidgdfYdiBT/c/xX40vXVBQ9PUZcUtGG+3YpfU++G1qEUPptM+FXTwU6n4cito
	z3guQdmmPa9/29n366iCvVlmeT2WITc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v1 5/5] configure: arm64: Make 'max' the
 default for --processor
Message-ID: <20250113-f6e1c55d5200410161aa61b5@orel>
References: <20250110135848.35465-1-alexandru.elisei@arm.com>
 <20250110135848.35465-6-alexandru.elisei@arm.com>
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
In-Reply-To: <20250110135848.35465-6-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Jan 10, 2025 at 01:58:48PM +0000, Alexandru Elisei wrote:
> Newer architecture features are supported by qemu TCG on newer CPUs. When
> writing a test for such architecture features, it is necessary to pass the
> correct -cpu argument to qemu. Make it easier on users and test authors
> alike by making 'max' the default value for --processor. The 'max' CPU
> model contains all the features of the cortex-a57 CPU (the old default), so
> no regression should be possible.
> 
> A side effect is that, by default, the compiler will not receive a -mcpu
> argument for compiling the code. The expectation is that this is fine,
> since support for -mcpu=$PROCESSOR has only been added for arm64 in the
> last commit.
> 
> The default for arm (cortex-a15) has been kept unchanged, because passing
> --processor=max will cause compilation to break. If the user wants the qemu
> CPU model to be 'max', the user will also have to supply a suitable compile
> CPU target via --cflags=-mcpu=<cpu> configure option.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 46964d36a7d8..3ab0ec208e10 100755
> --- a/configure
> +++ b/configure
> @@ -14,7 +14,7 @@ function get_default_processor()
>          default_processor="cortex-a15"
>          ;;
>      "arm64" | "aarch64")
> -        default_processor="cortex-a57"
> +        default_processor="max"
>          ;;
>      *)
>          default_processor=$arch
> -- 
> 2.47.1
>

Another reason to introduce a new parameter (qemu_cpu) is that we can also
change arm32 to 'max', reducing divergence between arm32 and arm64.

Thanks,
drew

