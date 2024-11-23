Return-Path: <linuxppc-dev+bounces-3513-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7220E9D66E1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Nov 2024 01:53:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XwD4G6bh7z2yV8;
	Sat, 23 Nov 2024 11:53:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732323230;
	cv=none; b=YdEqgZNeqvFQ1ZSBPh7QXnbKFLamXHsNM1wJJcjvI1Mt6BzUcdpAA095rxR2J+vTD8k2z0M2Yd2T1gvydgA90LVqytG/ZdrBy15uMgtNEDrjS1ewM7mWfpDXQ0AUQHHLCwonW7xzH52/4TRf382ESTRad6Sm3qKuNH/HMWk2flbnTfVOuPawIrQ8dmtN0F3W3S5PoCMOKzyx7gfkCi4N4j5LATgCxcmPg8d+LhB8TTCfBMpk3NrVwghfjFljQ0TGlr8DO4KFBKkahMpQP20MoJ+M1wTuCMtY3JtFeS1Ap4UC0HGLeCwaeJ1WZl7Rn0GX8rE1ETnmrShOkjsLPElohw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732323230; c=relaxed/relaxed;
	bh=MySxW6Yvv72K+z2FlW9SiPYONLnpcffXjHrq0N51mFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EVPwEdfME9i9cAB0k9gWIS8jNQ7TdGWPnOTYI5E3iPmqF7TJqIj/H8go/tglnNf3sG22RS7e8SmbLXcehJ2PA3n4PpjlYuFIj4ypjvwp5rTQHhkSyArbVrtB+xAQmZlBfmI6dxkFeoRSAXyoWcMHbYPFgRENAfB4N6rEPQVwcD4EgpG/9lmszuovvCnDY80PDpBx+Tgwbo6HLwa50NogreAVUxQERilZNdUOY/v8bee4eICsDvseLTwOb56e+K66b8Yye/jpgIWoibaQdRGYpdc4EoudciPMfHAPX+jBsWjawJPfbKfCvd1N9L6JIaHlW0OT1ncDVfVT096pU8iQsA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=QU2tVmvz; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=QU2tVmvz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XwD474V3wz2xgv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Nov 2024 11:53:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=MySxW6Yvv72K+z2FlW9SiPYONLnpcffXjHrq0N51mFU=; b=QU2tVmvz9D0LyQZn/2E6OR0PhY
	KqXPwT+XvUFmnjhx5IsgFic9byvXjamh8g3lJVkl/jKjHX/h8Ggf7+w5Ghw4Lsdg5GIoWmsnqZm8D
	ePaR9EfPcQPX34JQkfJmVVzE5ZIupnCRIXKH0w9Cn54RS3pY8r0/hB+sE7/0f+3W1WYsM8fEo8AFg
	BRh4wa4LCvl8zk7i8GQXoG0u7/6solDBLYQ181K8Kg8OIy4rr4QMBbrE2+f4NwBdqvFtp5bs0iRPO
	1IIaqwvExMrR54msJqJW+LFghYYaBHjDtNT7UZSRQDrevYXT/7znfak++IuQLvgyD86oKT27WPwRa
	HPwW7zZw==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tEeOj-00000008XJ3-3vvj;
	Sat, 23 Nov 2024 00:53:19 +0000
Message-ID: <eac20e8d-d08c-4be7-a34f-b511798f0a57@infradead.org>
Date: Fri, 22 Nov 2024 16:53:07 -0800
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/5] modules: Allow extended modversions without basic
 MODVERSIONS
To: Matthew Maurer <mmaurer@google.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org
References: <20241123-extended-modversions-v9-0-bc0403f054bf@google.com>
 <20241123-extended-modversions-v9-3-bc0403f054bf@google.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20241123-extended-modversions-v9-3-bc0403f054bf@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 11/22/24 4:19 PM, Matthew Maurer wrote:
> If you know that your kernel modules will only ever be loaded by a newer
> kernel, you can disable BASIC_MODVERSIONS to save space. This also
> allows easy creation of test modules to seee how tooling will respond to
> modules that only have the new format.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  kernel/module/Kconfig    | 15 +++++++++++++++
>  scripts/Makefile.modpost |  1 +
>  scripts/mod/modpost.c    | 19 +++++++++++--------
>  3 files changed, 27 insertions(+), 8 deletions(-)
> 
> diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
> index a31c617cd67d3d66b24d2fba34cbd5cc9c53ab78..f28b361494c4b4cc2446d683589f9452a0043b2b 100644
> --- a/kernel/module/Kconfig
> +++ b/kernel/module/Kconfig
> @@ -161,6 +161,7 @@ config MODULE_UNLOAD_TAINT_TRACKING
>  config MODVERSIONS
>  	bool "Module versioning support"
>  	depends on !COMPILE_TEST
> +	selects BASIC_MODVERSIONS

tested?  'selects' is not valid.

>  	help
>  	  Usually, you have to use modules compiled with your kernel.
>  	  Saying Y here makes it sometimes possible to use modules
> @@ -218,6 +219,20 @@ config EXTENDED_MODVERSIONS
>  	  The most likely reason you would enable this is to enable Rust
>  	  support. If unsure, say N.
>  
> +config BASIC_MODVERSIONS
> +	bool "Basic Module Versioning Support"
> +	depends on MODVERSIONS
> +	help
> +	  This enables basic MODVERSIONS support, allowing older tools or
> +	  kernels to potentially load modules.
> +
> +	  Disabling this may cause older `modprobe` or `kmod` to be unable
> +	  to read MODVERSIONS information from built modules. With this
> +	  disabled, older kernels may treat this module as unversioned.
> +
> +	  This is enabled by default when MODVERSIONS are enabled.
> +	  If unsure, say Y.
> +
>  config MODULE_SRCVERSION_ALL
>  	bool "Source checksum for all modules"
>  	help


-- 
~Randy


