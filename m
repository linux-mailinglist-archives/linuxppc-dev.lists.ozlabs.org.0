Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F17E91DC6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 09:27:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Blr40bJJzDqlX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 17:27:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="OW+OUXy8"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46BlpF4LmgzDqhH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 17:25:55 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id w10so678740pgj.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 00:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=tBCDDckHGkeN1/u6Pg4KXWwPQu/0aeVQyazu3cqADzM=;
 b=OW+OUXy8CbHbV/AWwDUODfleUSqXNyGAeVqjVPoRVoktYhx9is8LLhuekhZrlcmPFj
 4jua09y6zynMFgrtaRAC7PaKmjJOHvWNPLb1e4aaO1lOfaPoCbTy2DGXpmgNirmnNIoo
 BzF7j+8BDsDrw1uDMKVIhxBZgJj3mk37a+Uao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=tBCDDckHGkeN1/u6Pg4KXWwPQu/0aeVQyazu3cqADzM=;
 b=h1kT2Tyf19B4g7dHKkWJoo5lunT+TRm7FC2LCWTfxVSW0cJeTwTcRlXszK3VPTacyE
 SdEV5K/6c+s6lI+Eai2yjYSpXsoeJQBopxFZM0VSXwPaiDTCNPQLKXFMsqTNAwMPUr6o
 ax8Yyv+OLpjn2g0lUNpLkpC62T5fTLLwACUXERtY0C/bD7FumqK9TUUrvUzwaCaqaEPS
 0XLV7YSlkLEhH7xXJC8zjHDKc/+1uftRd50R1By4TSwddqYsNEV6N3x+LMHziSGZo4sr
 JU4LGWFysiwS4FtIU/wy61Om/tNSz7j2CYGgIwWI/P0YLjh7g4y1Q/Rb02eAY7YdzTmN
 CH6g==
X-Gm-Message-State: APjAAAXs2IghMfLA0SFYKEqWnHRKVKRCzzGIIfhK9u5Bu+kRhhOEIG6H
 tyat1gNbcr8UGDHor8Exaah3fA==
X-Google-Smtp-Source: APXvYqyE0+/G6CjuRC7+RgCdSFcnoCjABHXxER97QNWzacHAx9sLw8VrM5nHRZxCLiq+PRXiPJjhbg==
X-Received: by 2002:aa7:9191:: with SMTP id x17mr22772954pfa.23.1566199552574; 
 Mon, 19 Aug 2019 00:25:52 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id c199sm17606492pfb.28.2019.08.19.00.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 00:25:51 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Nathan Chancellor <natechancellor@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Don't add -mabi= flags when building with Clang
In-Reply-To: <20190818191321.58185-1-natechancellor@gmail.com>
References: <20190818191321.58185-1-natechancellor@gmail.com>
Date: Mon, 19 Aug 2019 17:25:47 +1000
Message-ID: <87ftlxty4k.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nathan,

> When building pseries_defconfig, building vdso32 errors out:
>
>   error: unknown target ABI 'elfv1'
>
> Commit 4dc831aa8813 ("powerpc: Fix compiling a BE kernel with a
> powerpc64le toolchain") added these flags to fix building GCC but
> clang is multitargeted and does not need these flags. The ABI is
> properly set based on the target triple, which is derived from
> CROSS_COMPILE.
>
> https://github.com/llvm/llvm-project/blob/llvmorg-9.0.0-rc2/clang/lib/Driver/ToolChains/Clang.cpp#L1782-L1804
>
> -mcall-aixdesc is not an implemented flag in clang so it can be
> safely excluded as well, see commit 238abecde8ad ("powerpc: Don't
> use gcc specific options on clang").
>

This all looks good to me, thanks for picking it up, and sorry I hadn't
got around to it!

The makefile is a bit messy and there are a few ways it could probably
be reorganised to reduce ifdefs. But I don't think this is the right
place to do that. With that in mind,

Reviewed-by: Daniel Axtens <dja@axtens.net>

Regards,
Daniel

> pseries_defconfig successfully builds after this patch and
> powernv_defconfig and ppc44x_defconfig don't regress.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/240
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  arch/powerpc/Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index c345b79414a9..971b04bc753d 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -93,11 +93,13 @@ MULTIPLEWORD	:= -mmultiple
>  endif
>  
>  ifdef CONFIG_PPC64
> +ifndef CONFIG_CC_IS_CLANG
>  cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mabi=elfv1)
>  cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mcall-aixdesc)
>  aflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mabi=elfv1)
>  aflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -mabi=elfv2
>  endif
> +endif
>  
>  ifndef CONFIG_CC_IS_CLANG
>    cflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -mno-strict-align
> @@ -144,6 +146,7 @@ endif
>  endif
>  
>  CFLAGS-$(CONFIG_PPC64)	:= $(call cc-option,-mtraceback=no)
> +ifndef CONFIG_CC_IS_CLANG
>  ifdef CONFIG_CPU_LITTLE_ENDIAN
>  CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv2,$(call cc-option,-mcall-aixdesc))
>  AFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv2)
> @@ -152,6 +155,7 @@ CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv1)
>  CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mcall-aixdesc)
>  AFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv1)
>  endif
> +endif
>  CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mcmodel=medium,$(call cc-option,-mminimal-toc))
>  CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mno-pointers-to-nested-functions)
>  
> -- 
> 2.23.0
