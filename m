Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2C02B71BF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 23:40:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbLVw2NBGzDqW9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 09:40:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=niveditas98@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=alum.mit.edu
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=l95DD1yA; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbLT5694wzDqPv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 09:38:47 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id z3so121967qtw.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 14:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6UpOAhvGOOk2ewOvXmMzn6cPIkdxIFd9wzKXGMY8TT0=;
 b=l95DD1yAoHtR1mBEU5zvmO0YUKK5XuEjDkNVrDstszRlQczHLAsdHV/Mmb6eIAD0x9
 XufocxDpqqTl1rpEPYE+MNL1U87kwvwLV1zMRBt0BLSqyBn5opJhgvvJ4Fx2StTm+yz1
 D1MFl3W37RJR/QzJOD+aMxhvc//tPW/t/sql7LqNHuB1hLQKzlZZCR6xs2gZ0sAsSnlX
 +r99vKx9bRbQyTSHzH6SAtptLtKnJBVRwsUFeb64eO4vNH3NNjr6wjDr9ToUCptO7I6a
 I4tzbT45MJiq4leeGs3jtZ/TEN/ZanqU9lOt0l671eSSseANEK0wrGFS2Ew7QJ8wg7Pz
 +cxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=6UpOAhvGOOk2ewOvXmMzn6cPIkdxIFd9wzKXGMY8TT0=;
 b=G9Qef/kSAzhmisPAMvwgUTRwoGNxL8bzI2qh4KFsxdnQEnr5cK3j9smPLUPvs+r4mV
 5vzJpAL3Y+neorfaIJBZyf+goScUIRtYNyXTy3gQr28QXkUqet4lDXe6j1i6z6OC1pmA
 P8GGL2FnRvMwJ1Tx7Yj1TS6rxFhRJ92p4/fKSkxwpQlgCR/wzHftyVfjvDCUlhxI/cUy
 HgZv1X4NRo7ZP0naAWNSOFyaznHg2qZn0XCy7VoMzWxclvw/VhsA/DLGrnG/Ok2Ocmbm
 18FAhwrM1woi7XyD6eLAewINe5v86lTkTUH+RJbPOYQzETZzrAze24bOBvJ7tP5hj57O
 Hu0w==
X-Gm-Message-State: AOAM533cbpElu8ktm8QHZOh/028AQqLZGKqY9F/p6oXhnZ3b7NlWK6ji
 XdwALneVGrfRllQxsQfB7gMmc+jSlJNLsQ==
X-Google-Smtp-Source: ABdhPJz8a5cDcx1y+L9qG9bzPYayTTf3BP7O0zJowaV3p4MU3PLuXyIqvDkehl7YwsVH/v27Xa53HA==
X-Received: by 2002:ac8:4cdb:: with SMTP id l27mr1974889qtv.74.1605652237175; 
 Tue, 17 Nov 2020 14:30:37 -0800 (PST)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
 by smtp.gmail.com with ESMTPSA id n93sm14757574qtd.7.2020.11.17.14.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 14:30:36 -0800 (PST)
From: Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date: Tue, 17 Nov 2020 17:30:34 -0500
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 1/3] powerpc: boot: include compiler_attributes.h
Message-ID: <20201117223034.GA1614446@rani.riverdale.lan>
References: <20201116043532.4032932-1-ndesaulniers@google.com>
 <20201116043532.4032932-2-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201116043532.4032932-2-ndesaulniers@google.com>
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
 "Gustavo A . R . Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Nov 15, 2020 at 08:35:30PM -0800, Nick Desaulniers wrote:
> The kernel uses `-include` to include include/linux/compiler_types.h
> into all translation units (see scripts/Makefile.lib), which #includes
> compiler_attributes.h.
> 
> arch/powerpc/boot/ uses different compiler flags from the rest of the
> kernel. As such, it doesn't contain the definitions from these headers,
> and redefines a few that it needs.
> 
> For the purpose of enabling -Wimplicit-fallthrough for ppc, include
> compiler_types.h via `-include`.

This should be "compiler_attributes.h".

> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/236
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> We could just `#include "include/linux/compiler_types.h"` in the few .c
> sources used from lib/ (there are proper header guards in
> compiler_types.h).
> 
> It was also noted in 6a9dc5fd6170 that we could -D__KERNEL__ and
> -include compiler_types.h like the main kernel does, though testing that
> produces a whole sea of warnings to cleanup. This approach is minimally
> invasive.
> 
>  arch/powerpc/boot/Makefile     | 1 +
>  arch/powerpc/boot/decompress.c | 1 -
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> index f8ce6d2dde7b..1659963a8f1d 100644
> --- a/arch/powerpc/boot/Makefile
> +++ b/arch/powerpc/boot/Makefile
> @@ -31,6 +31,7 @@ endif
>  BOOTCFLAGS    := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
>  		 -fno-strict-aliasing -O2 -msoft-float -mno-altivec -mno-vsx \
>  		 -pipe -fomit-frame-pointer -fno-builtin -fPIC -nostdinc \
> +		 -include $(srctree)/include/linux/compiler_attributes.h \
>  		 $(LINUXINCLUDE)
>  
>  ifdef CONFIG_PPC64_BOOT_WRAPPER
> diff --git a/arch/powerpc/boot/decompress.c b/arch/powerpc/boot/decompress.c
> index 8bf39ef7d2df..6098b879ac97 100644
> --- a/arch/powerpc/boot/decompress.c
> +++ b/arch/powerpc/boot/decompress.c
> @@ -21,7 +21,6 @@
>  
>  #define STATIC static
>  #define INIT
> -#define __always_inline inline
>  
>  /*
>   * The build process will copy the required zlib source files and headers
> -- 
> 2.29.2.299.gdc1121823c-goog
> 
