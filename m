Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7502B57A5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 04:03:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZrPB45b7zDqR2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 14:03:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hE5VawGm; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZrMJ3qrszDqQ5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 14:02:03 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id m65so14674227qte.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Nov 2020 19:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/RX5/tcWvfpmbLMRcPAk9O2TQzIviRgD54vpKLoaWpo=;
 b=hE5VawGm0ZXhtyP4Qnc7smJ9fE0kivKCkJDRbzIgQpVCbM7l5C1yAgEGuAzk6a2mUt
 PIEEM7AXFJ3WKNkh9hw4ZEp9O/i/dDJQu+jH6yn3Fq4LQAF0Kt4D9oczRHO6/qUwCEkC
 QZxbdKwknqfKqBYFXPlvqJZ0hI1Y/aWUecFc7IRAwp236qdqZ3SRP3ZrL58wsGTHgowe
 GJz4eC7I9upCGh16Dniv0Wpp2wqb+4I4w0Ar6eqYqqA6LkT/zkWvEy29BwXpGYkrlk4a
 C46XndyIAaMhe78TeusGoMt7gF50hWn1UozXFop/1pI0JlZmsxnH4cWyolkhpXMwxMhg
 DpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/RX5/tcWvfpmbLMRcPAk9O2TQzIviRgD54vpKLoaWpo=;
 b=OE7+kjk4xE1EMKCfoKfBPeE/7BHI51yCHS+B2wdnt00K38Ov6BBQyrz45kGXvi0LaK
 UzVfEV+1YEPspT6WDanjnaksMQZm8xcsET9HYJPMC0EXr+HW32gAixHJ4sjHYofn48Or
 sj9hrT96Yqj3UkMGxBx2lQ5rg9pfFttcSPrOnH7ICQKrInznjfg8xfmx7jdM6Bd+b3JF
 5sfs7TgTR+hy8MnjtmpkZ7Adm5FP6GeSDN4CWrgjI+rqQhAI9QXVu8EWK3ZhmtTDCafs
 tONoRkVpG5slCQyhz1vL8yAoDQBWUC/t01cwWh93MbEp/U8fzSag2eDqV9GbdcLXscxL
 4pyw==
X-Gm-Message-State: AOAM531TC/KhD0N5opSJ8FDartKUKEASNfizcoRnvVEpikAAPOlFz8dl
 mP/5XEA3F9RH38NcmYeXqKM=
X-Google-Smtp-Source: ABdhPJybNXsp0ywENwQ4p8uGxyep3MTJjKfuwKRz9vzeCFZK/b/W/bGFy6NX8R8GdC5B0cMjcnKBRQ==
X-Received: by 2002:ac8:7081:: with SMTP id y1mr17205582qto.72.1605582120723; 
 Mon, 16 Nov 2020 19:02:00 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id o63sm13359774qkd.96.2020.11.16.19.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 19:02:00 -0800 (PST)
Date: Mon, 16 Nov 2020 20:01:58 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 1/3] powerpc: boot: include compiler_attributes.h
Message-ID: <20201117030158.GA1340689@ubuntu-m3-large-x86>
References: <20201116043532.4032932-1-ndesaulniers@google.com>
 <20201116043532.4032932-2-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
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
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/236
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>

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
