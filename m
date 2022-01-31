Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 176B84A4846
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 14:36:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnTc667K4z3cHC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 00:36:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f0rRPazR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=f0rRPazR; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnTbS3HDqz30Mn
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 00:35:48 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A397C612A4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 13:35:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D75C340EE
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 13:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643636143;
 bh=QrkimEX74xj+Tvz3rNeNpKEQmjz6JrJN7PGpRIyz3b0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=f0rRPazR/9+C94SxiifNdocl3SGFxenxe07xtZaYXDxyaby+hohZ350sabvBU03W/
 bv6wpF7eOjV+0O/OEM3dir4bt0AfcWOMdlY5hvQUnMt740xEXr9hzKGpx2+ZtOaTRg
 0+jrwmQe5I9JXq0nwyFJ3Xxujmb8ZWlSZyROcnd0WFNSLyEZpbZLESZrq5dbge+ymj
 NKBixHPDf3WXLMWKSibCG0hX9kHUoAoosS5Jj64qJ9l5wch1b0u1iMhlO9jB2qq7v+
 K/EwmpwM/cZ3wx0LaYkR7mSy5o/48YZNaZA0EVFXmhh6FG7GIWbvJbd/kLixuXOISL
 tAWrsbLlN432w==
Received: by mail-vk1-f178.google.com with SMTP id n14so8212499vkk.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 05:35:42 -0800 (PST)
X-Gm-Message-State: AOAM533l/5ODUGlGCotrZdWgk1VvkAelQQvazyMn6b4ENsIUMurewfPw
 Z+y08aMQI6DnyY2LmA0QKDzpw/M3QNTLbt0nGvE=
X-Google-Smtp-Source: ABdhPJxZNMeC16XdmOigVkjvMRdj8icFIyGyUX0uDul1X33dvN0Ph1ZLc80xzQSa/ftMMNKUf+Q3pGt5DpewCG2Ojxw=
X-Received: by 2002:a05:6122:d07:: with SMTP id
 az7mr8146058vkb.35.1643636142047; 
 Mon, 31 Jan 2022 05:35:42 -0800 (PST)
MIME-Version: 1.0
References: <20220131064933.3780271-1-hch@lst.de>
 <20220131064933.3780271-3-hch@lst.de>
In-Reply-To: <20220131064933.3780271-3-hch@lst.de>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 31 Jan 2022 21:35:31 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRU=0KS5r=Q9tAcVz8aXbaYL7jGyxfxPCYkxWc4rEBG2g@mail.gmail.com>
Message-ID: <CAJF2gTRU=0KS5r=Q9tAcVz8aXbaYL7jGyxfxPCYkxWc4rEBG2g@mail.gmail.com>
Subject: Re: [PATCH 2/5] uapi: simplify __ARCH_FLOCK{,64}_PAD a little
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

On Mon, Jan 31, 2022 at 2:49 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Don't bother to define the symbols empty, just don't use them.  That
> makes the intent a little more clear.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  include/uapi/asm-generic/fcntl.h       | 12 ++++--------
>  tools/include/uapi/asm-generic/fcntl.h | 12 ++++--------
>  2 files changed, 8 insertions(+), 16 deletions(-)
>
> diff --git a/include/uapi/asm-generic/fcntl.h b/include/uapi/asm-generic/fcntl.h
> index caa482e3b01af..c53897ca5d402 100644
> --- a/include/uapi/asm-generic/fcntl.h
> +++ b/include/uapi/asm-generic/fcntl.h
> @@ -193,22 +193,16 @@ struct f_owner_ex {
>  #define F_LINUX_SPECIFIC_BASE  1024
>
>  #ifndef HAVE_ARCH_STRUCT_FLOCK
> -#ifndef __ARCH_FLOCK_PAD
> -#define __ARCH_FLOCK_PAD
> -#endif
> -
>  struct flock {
>         short   l_type;
>         short   l_whence;
>         __kernel_off_t  l_start;
>         __kernel_off_t  l_len;
>         __kernel_pid_t  l_pid;
> +#ifdef __ARCH_FLOCK_PAD
>         __ARCH_FLOCK_PAD
> -};
>  #endif
> -
> -#ifndef __ARCH_FLOCK64_PAD
> -#define __ARCH_FLOCK64_PAD
> +};
>  #endif
>
>  struct flock64 {
> @@ -217,7 +211,9 @@ struct flock64 {
>         __kernel_loff_t l_start;
>         __kernel_loff_t l_len;
>         __kernel_pid_t  l_pid;
> +#ifdef __ARCH_FLOCK64_PAD
>         __ARCH_FLOCK64_PAD
> +#endif
>  };
>
>  #endif /* _ASM_GENERIC_FCNTL_H */
> diff --git a/tools/include/uapi/asm-generic/fcntl.h b/tools/include/uapi/asm-generic/fcntl.h
> index 4a49d33ca4d55..82054502b9748 100644
> --- a/tools/include/uapi/asm-generic/fcntl.h
> +++ b/tools/include/uapi/asm-generic/fcntl.h
> @@ -188,22 +188,16 @@ struct f_owner_ex {
>  #define F_LINUX_SPECIFIC_BASE  1024
>
>  #ifndef HAVE_ARCH_STRUCT_FLOCK
> -#ifndef __ARCH_FLOCK_PAD
> -#define __ARCH_FLOCK_PAD
> -#endif
> -
>  struct flock {
>         short   l_type;
>         short   l_whence;
>         __kernel_off_t  l_start;
>         __kernel_off_t  l_len;
>         __kernel_pid_t  l_pid;
> +#ifdef __ARCH_FLOCK_PAD
>         __ARCH_FLOCK_PAD
> -};
>  #endif
> -
> -#ifndef __ARCH_FLOCK64_PAD
> -#define __ARCH_FLOCK64_PAD
> +};
>  #endif
>
>  struct flock64 {
> @@ -212,7 +206,9 @@ struct flock64 {
>         __kernel_loff_t l_start;
>         __kernel_loff_t l_len;
>         __kernel_pid_t  l_pid;
> +#ifdef __ARCH_FLOCK64_PAD
>         __ARCH_FLOCK64_PAD
> +#endif
>  };
>
>  #endif /* _ASM_GENERIC_FCNTL_H */
> --
> 2.30.2
>
Reviewed-by: Guo Ren <guoren@kernel.org>

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
