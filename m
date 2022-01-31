Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F0E4A4686
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 13:04:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnRYW0ZGmz3cCb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 23:03:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fNYKVUnP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fNYKVUnP; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnRXn5kySz2xsr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 23:03:21 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A64AEB82A73
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 12:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6423BC340EE
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 12:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643630596;
 bh=Tnl+b+xRnsReNq4KI429Am7kpgJQ0umrjTVla4lsCuM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fNYKVUnPHi4fB2RDVXN/XPov3Pzxn5A1kXwyz+7LOx0xtVsOdQVaSlptA3l6sPO0f
 drJ5QpM53lfVQOzGgCce6B3pLahQ7QGSlaLrpdhyAkJ8SULgXKHPGWHnYSLBvsBQ/t
 fs/0QUMACIndc/Oow7jaQyp72tjLmz/jpvKWB2XfcgrdeWAoLhIVtNkmROpwMglSMu
 MW+xwZqT00PRi0JLtYRicH1AppTKRmYG0WNykLZJqhzgiPwG33xGGGt1Ay/gpwP/2v
 R401bXofdi6TFPmB02Zav6cD1va7JnpIDrlctwFhFD/4xkKrfZp28yMy+9f7Qys9S9
 Esu0cmt5m7xVQ==
Received: by mail-vk1-f169.google.com with SMTP id m131so8101637vkm.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 04:03:16 -0800 (PST)
X-Gm-Message-State: AOAM5327BjtMKFlgqGpARnJwJftlrQBr4m4fFYNyfQVofNsoUVfimDqa
 GSGEqzl/MvgNDrGQ3q6TuDO6I/bUjAWb82nfbP4=
X-Google-Smtp-Source: ABdhPJzu/ltAZiRAPd2aiKC5Md3QokBpxOCcs120Jm2RVZ0hBQuqkRXhXkFbZurLz6s8XNLjpnUnIx3259o3xCGjxlQ=
X-Received: by 2002:a1f:640e:: with SMTP id y14mr8092831vkb.2.1643630595330;
 Mon, 31 Jan 2022 04:03:15 -0800 (PST)
MIME-Version: 1.0
References: <20220131064933.3780271-1-hch@lst.de>
 <20220131064933.3780271-2-hch@lst.de>
In-Reply-To: <20220131064933.3780271-2-hch@lst.de>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 31 Jan 2022 20:03:04 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRH0H-7XzH2-_4UK17CZXrVBf8Hfr59RuJPLgezZ1trdg@mail.gmail.com>
Message-ID: <CAJF2gTRH0H-7XzH2-_4UK17CZXrVBf8Hfr59RuJPLgezZ1trdg@mail.gmail.com>
Subject: Re: [PATCH 1/5] uapi: remove the unused HAVE_ARCH_STRUCT_FLOCK64
 define
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reviewed-by: Guo Ren <guoren@kernel.org>

On Mon, Jan 31, 2022 at 2:49 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  include/uapi/asm-generic/fcntl.h       | 2 --
>  tools/include/uapi/asm-generic/fcntl.h | 2 --
>  2 files changed, 4 deletions(-)
>
> diff --git a/include/uapi/asm-generic/fcntl.h b/include/uapi/asm-generic/fcntl.h
> index ecd0f5bdfc1d6..caa482e3b01af 100644
> --- a/include/uapi/asm-generic/fcntl.h
> +++ b/include/uapi/asm-generic/fcntl.h
> @@ -207,7 +207,6 @@ struct flock {
>  };
>  #endif
>
> -#ifndef HAVE_ARCH_STRUCT_FLOCK64
>  #ifndef __ARCH_FLOCK64_PAD
>  #define __ARCH_FLOCK64_PAD
>  #endif
> @@ -220,6 +219,5 @@ struct flock64 {
>         __kernel_pid_t  l_pid;
>         __ARCH_FLOCK64_PAD
>  };
> -#endif
>
>  #endif /* _ASM_GENERIC_FCNTL_H */
> diff --git a/tools/include/uapi/asm-generic/fcntl.h b/tools/include/uapi/asm-generic/fcntl.h
> index ac190958c9814..4a49d33ca4d55 100644
> --- a/tools/include/uapi/asm-generic/fcntl.h
> +++ b/tools/include/uapi/asm-generic/fcntl.h
> @@ -202,7 +202,6 @@ struct flock {
>  };
>  #endif
>
> -#ifndef HAVE_ARCH_STRUCT_FLOCK64
>  #ifndef __ARCH_FLOCK64_PAD
>  #define __ARCH_FLOCK64_PAD
>  #endif
> @@ -215,6 +214,5 @@ struct flock64 {
>         __kernel_pid_t  l_pid;
>         __ARCH_FLOCK64_PAD
>  };
> -#endif
>
>  #endif /* _ASM_GENERIC_FCNTL_H */
> --
> 2.30.2
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
