Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1180D81B5A1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 13:17:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aK0VXIOh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwqFJ4R5zz3cbW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 23:17:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aK0VXIOh;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SwqDT0y6nz2yl1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 23:16:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1703161017;
	bh=5d6zNSFt4jEG/MYae1GPrrzN7fMvSd5x94D4zOd+D6c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aK0VXIOh1FUf/WFEnRpyKYs4nqD8TxQgKtq7oLdJcrqrFilx7c4bHGxWDUWArpQ/u
	 yeRuHu2vA64HoeLWzMFt8tgjIgi1Z3hiRIoRYldrHGIALPDMArjhhC+GZvi54Zx4VB
	 KUurwuLLg53bJR08mREjoj6uzaQqHWjeHIXyhljg50kuV/CtkRoEYTGfNKc9CM37Nm
	 JRiG+DhgFndPHxUulPi4Qth105BFTXoMl6ogoVCj3POzOzL/v1+S3tH2aXNkMufSeL
	 ZderwA/Sffhyz4oztBp/xeUbmzYZWtPKqtF1gV6vz27/Wc2+GlgdSeG3sHhuBySsbZ
	 EDsM120yFYm+A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SwqDS3CxKz4wby;
	Thu, 21 Dec 2023 23:16:56 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin
 <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain
 <mcgrof@kernel.org>
Subject: Re: [PATCH 1/3] init: Declare rodata_enabled and mark_rodata_ro()
 at all time
In-Reply-To: <7b5df1782e94a755b4a18733af44d17d8dd8b37b.1703149011.git.christophe.leroy@csgroup.eu>
References: <7b5df1782e94a755b4a18733af44d17d8dd8b37b.1703149011.git.christophe.leroy@csgroup.eu>
Date: Thu, 21 Dec 2023 23:16:56 +1100
Message-ID: <87bkajlphj.fsf@mail.lhotse>
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
Cc: linux-modules@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Cc +Kees

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Declaring rodata_enabled and mark_rodata_ro() at all time
> helps removing related #ifdefery in C files.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  include/linux/init.h |  4 ----
>  init/main.c          | 21 +++++++--------------
>  2 files changed, 7 insertions(+), 18 deletions(-)
>
> diff --git a/include/linux/init.h b/include/linux/init.h
> index 01b52c9c7526..d2b47be38a07 100644
> --- a/include/linux/init.h
> +++ b/include/linux/init.h
> @@ -168,12 +168,8 @@ extern initcall_entry_t __initcall_end[];
>  
>  extern struct file_system_type rootfs_fs_type;
>  
> -#if defined(CONFIG_STRICT_KERNEL_RWX) || defined(CONFIG_STRICT_MODULE_RWX)
>  extern bool rodata_enabled;
> -#endif
> -#ifdef CONFIG_STRICT_KERNEL_RWX
>  void mark_rodata_ro(void);
> -#endif
>  
>  extern void (*late_time_init)(void);
>  
> diff --git a/init/main.c b/init/main.c
> index e24b0780fdff..807df08c501f 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -1396,10 +1396,9 @@ static int __init set_debug_rodata(char *str)
>  early_param("rodata", set_debug_rodata);
>  #endif
>  
> -#ifdef CONFIG_STRICT_KERNEL_RWX
>  static void mark_readonly(void)
>  {
> -	if (rodata_enabled) {
> +	if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX) && rodata_enabled) {
>  		/*
>  		 * load_module() results in W+X mappings, which are cleaned
>  		 * up with call_rcu().  Let's make sure that queued work is
> @@ -1409,20 +1408,14 @@ static void mark_readonly(void)
>  		rcu_barrier();
>  		mark_rodata_ro();
>  		rodata_test();
> -	} else
> +	} else if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX)) {
>  		pr_info("Kernel memory protection disabled.\n");
> +	} else if (IS_ENABLED(CONFIG_ARCH_HAS_STRICT_KERNEL_RWX)) {
> +		pr_warn("Kernel memory protection not selected by kernel config.\n");
> +	} else {
> +		pr_warn("This architecture does not have kernel memory protection.\n");
> +	}
>  }
> -#elif defined(CONFIG_ARCH_HAS_STRICT_KERNEL_RWX)
> -static inline void mark_readonly(void)
> -{
> -	pr_warn("Kernel memory protection not selected by kernel config.\n");
> -}
> -#else
> -static inline void mark_readonly(void)
> -{
> -	pr_warn("This architecture does not have kernel memory protection.\n");
> -}
> -#endif
>  
>  void __weak free_initmem(void)
>  {
> -- 
> 2.41.0
