Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9ECE20BBC3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 23:42:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tr2D4sn9zDqrs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 07:42:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=Nvb+ggfc; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tqYl2GHHzDqkS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 07:20:59 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id d66so5154664pfd.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 14:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3v+OF208XUrXXCW8iavBboKmEzUrVOLh/1qRIFYBNoU=;
 b=Nvb+ggfcnASyU5yhjpLMt6peljFaQfiHoHtcJLghh8SOevSBFghSaqeuZcJueBgfGg
 WZgC5DlW9UptaHMBha2Yi+d7BZxdIdIsRVIxr6sT/EGiBCa7riY2jk+3OoPm9Dm2cBgE
 Oe16AFCAHqXoIwIvcpbOh0WaehkQSk4CbVyto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3v+OF208XUrXXCW8iavBboKmEzUrVOLh/1qRIFYBNoU=;
 b=I3A4gi8OqGXmolxlZEp3QvAh1GPIOa2pNEME7VxvVznuQquY4nYaFxRMuvIAsIhaTK
 6JJwx5lxbTxAR1UkI3vyxj3ZNGSf1RkUMIK98tiO8bBHnKiaRbadaiWA0b57x0ze+56n
 CVaI/66M4ftlj28pjLEBa8wDAG7IzgJbokbucTNl3qJaxnlyUY7ga5+I7DDEcPw28PvV
 jph914s9spEM9rJu+apjWFwz/eTwOvlGIT6MbdpMrASIlqeEoy+AhuTMPiW2SXkmC8Y+
 GuNlQgtCuH2s9JaWtlhD564R2VUxwrsublxDLDtwEGBvjFqeHn1+2xwlYn4sekSPuAWB
 j1pQ==
X-Gm-Message-State: AOAM533sYIXYeecW0MHTqA4CZFF0qivri890ITJJ65aA8nRY09cpqILq
 UTjAMq2nGqax0/c3a9RU5PMrwg==
X-Google-Smtp-Source: ABdhPJwbIChL+NPgK/ZZynTiHBVtRn0Pm3+yrJJiDfCLTGOFZovkou+N1wtQIeNq/GeuCZhx4HWPUQ==
X-Received: by 2002:aa7:9e09:: with SMTP id y9mr4461464pfq.314.1593206457324; 
 Fri, 26 Jun 2020 14:20:57 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id b71sm17221453pfb.125.2020.06.26.14.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 14:20:56 -0700 (PDT)
Date: Fri, 26 Jun 2020 14:20:55 -0700
From: Kees Cook <keescook@chromium.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v5 02/12] arch: arm64: add linker section for KUnit test
 suites
Message-ID: <202006261420.02E8E62@keescook>
References: <20200626210917.358969-1-brendanhiggins@google.com>
 <20200626210917.358969-3-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200626210917.358969-3-brendanhiggins@google.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-doc@vger.kernel.org, catalin.marinas@arm.com, jcmvbkbc@gmail.com,
 will@kernel.org, paulus@samba.org, linux-kselftest@vger.kernel.org,
 frowand.list@gmail.com, anton.ivanov@cambridgegreys.com,
 linux-arch@vger.kernel.org, richard@nod.at, rppt@linux.ibm.com,
 yzaikin@google.com, linux-xtensa@linux-xtensa.org, arnd@arndb.de,
 jdike@addtoit.com, linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 davidgow@google.com, skhan@linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com,
 chris@zankel.net, monstr@monstr.eu, sboyd@kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, mcgrof@kernel.org,
 alan.maguire@oracle.com, akpm@linux-foundation.org, logang@deltatee.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 26, 2020 at 02:09:07PM -0700, Brendan Higgins wrote:
> Add a linker section to arm64 where KUnit can put references to its test
> suites. This patch is an early step in transitioning to dispatching all
> KUnit tests from a centralized executor rather than having each as its
> own separate late_initcall.
> 
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> ---
>  arch/arm64/kernel/vmlinux.lds.S | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
> index 6827da7f3aa54..a1cae9cc655d7 100644
> --- a/arch/arm64/kernel/vmlinux.lds.S
> +++ b/arch/arm64/kernel/vmlinux.lds.S
> @@ -181,6 +181,9 @@ SECTIONS
>  		INIT_RAM_FS
>  		*(.init.rodata.* .init.bss)	/* from the EFI stub */
>  	}
> +	.kunit_test_suites : {
> +		KUNIT_TEST_SUITES
> +	}

See my reply to 01/12. Then this patch can be dropped. :)

>  	.exit.data : {
>  		EXIT_DATA
>  	}
> -- 
> 2.27.0.212.ge8ba1cc988-goog
> 

-- 
Kees Cook
