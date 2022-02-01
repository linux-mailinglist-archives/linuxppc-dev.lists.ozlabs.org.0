Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E30104A549B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 02:17:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jnn8s4ZjDz3bcp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 12:17:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qOlocfnY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=guoren@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qOlocfnY; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jnn8D1LMDz2yQK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 12:16:44 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9880CB82CD1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 01:16:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F6F6C340EF
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 01:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643678199;
 bh=SiaprZtsbmIByPda5if7yP4S3qTQaX2CMcJuefUGDKk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qOlocfnYjy/jF9UZ67g/M/ExV0XvO67aaNYB+FZkbtlYDi48cmlBRlZhEXWbP8Ae7
 eYkCoe1RJh1MjU4osvh8utpTaRc9nCpeKkZdG1qjdGqJfNsWUKBqKVvbP9W+O+O21F
 ZBFX7gvLtbSal2OiR51Xu9x253nAAItkmYviVcjMIRynvmAx6L+9rfjRcLXv0hVnxF
 5jx9yrr54hADg4g+hSvIyemHzmXfDP8050L1Wmrxv8JBxKGV2mq2lpeROyz/SZ3eTF
 tNhoSwW2uqSYY4qJU3PE+P4p6KX/64r4Mb7CXTkHwbapVu1p7HnWxCzTVy1UbBT8tR
 46QACMtSzx2xA==
Received: by mail-ua1-f44.google.com with SMTP id n15so12943663uaq.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 17:16:39 -0800 (PST)
X-Gm-Message-State: AOAM5318bAJzcjlDAPthOmrynLttyq+FnWYTv0kvft7DKSPEI4N6UYNI
 ZiPy/vqq1l2ljW0rht7gSAGdpoFR6LACQx6s0Qk=
X-Google-Smtp-Source: ABdhPJxWLBDyOJOGeSWO+apAtkye8u+6OgeQZNAJBFBTM1KwFxdAT0Qwyi0qpOrXa/BhnrxjpnZuE4ZnTHXGEOOwSZ8=
X-Received: by 2002:ab0:2092:: with SMTP id r18mr8891303uak.66.1643678198369; 
 Mon, 31 Jan 2022 17:16:38 -0800 (PST)
MIME-Version: 1.0
References: <20220131064933.3780271-1-hch@lst.de>
 <20220131064933.3780271-2-hch@lst.de>
In-Reply-To: <20220131064933.3780271-2-hch@lst.de>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 1 Feb 2022 09:16:27 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTjj8DXByP44DsC47xB2W_88j5Qp7TyEnRQCfUvHQUixA@mail.gmail.com>
Message-ID: <CAJF2gTTjj8DXByP44DsC47xB2W_88j5Qp7TyEnRQCfUvHQUixA@mail.gmail.com>
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

This patch should be:

diff --git a/include/uapi/asm-generic/fcntl.h b/include/uapi/asm-generic/fcntl.h
index ecd0f5bdfc1d..220ae6d32e7b 100644
--- a/include/uapi/asm-generic/fcntl.h
+++ b/include/uapi/asm-generic/fcntl.h
@@ -193,32 +193,28 @@ struct f_owner_ex {
 #define F_LINUX_SPECIFIC_BASE  1024

 #ifndef HAVE_ARCH_STRUCT_FLOCK
-#ifndef __ARCH_FLOCK_PAD
-#define __ARCH_FLOCK_PAD
-#endif
-
 struct flock {
        short   l_type;
        short   l_whence;
        __kernel_off_t  l_start;
        __kernel_off_t  l_len;
        __kernel_pid_t  l_pid;
+#ifdef __ARCH_FLOCK_PAD
        __ARCH_FLOCK_PAD
-};
 #endif
-
-#ifndef HAVE_ARCH_STRUCT_FLOCK64
-#ifndef __ARCH_FLOCK64_PAD
-#define __ARCH_FLOCK64_PAD
+}
 #endif

+#ifndef HAVE_ARCH_STRUCT_FLOCK64
 struct flock64 {
        short  l_type;
        short  l_whence;
        __kernel_loff_t l_start;
        __kernel_loff_t l_len;
        __kernel_pid_t  l_pid;
+#ifdef __ARCH_FLOCK64_PAD
        __ARCH_FLOCK64_PAD
+#endif
 };

Right?

Seems you've based on an old tree, right?

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
