Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCEC1951D0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 08:15:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pY6V01JtzDqb1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 18:15:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=ebTGgL0u; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pY4c750lzDqMv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 18:14:08 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48pY4X5jrvz9txq9;
 Fri, 27 Mar 2020 08:14:04 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ebTGgL0u; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id DCrdTEX4EsDF; Fri, 27 Mar 2020 08:14:04 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48pY4X4NMVz9txq8;
 Fri, 27 Mar 2020 08:14:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585293244; bh=4zOuNviTmdeBTvOzKclpo9g5G+LSQaVQdykYtdE7NKk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ebTGgL0uC0m7TVSg7XC5wCP7g2qM+19irZMZcLriabObkZD47XudxvwnLQqq+WnLE
 th9appiL8hNu3QLyxJaCoPJDAmKfTbm5BlvP+CukUlEoEGzTYX9W1cAIHWPseHNvGo
 T9ksGV61b5TxXm8jA9mOQ7cC32iF+2wPrXesEymY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7E00D8B7BC;
 Fri, 27 Mar 2020 08:14:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id U6hipSrX50Qi; Fri, 27 Mar 2020 08:14:05 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CFC458B756;
 Fri, 27 Mar 2020 08:14:04 +0100 (CET)
Subject: Re: [PATCH 1/4] powerpc/64s: implement probe_kernel_read/write
 without touching AMR
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200327070240.427074-1-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <d619b378-3a88-f941-b2d5-42b79574e2ab@c-s.fr>
Date: Fri, 27 Mar 2020 08:13:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200327070240.427074-1-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 27/03/2020 à 08:02, Nicholas Piggin a écrit :
> There is no need to allow user accesses when probing kernel addresses.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/uaccess.h | 25 ++++++++++-----
>   arch/powerpc/lib/Makefile          |  2 +-
>   arch/powerpc/lib/uaccess.c         | 50 ++++++++++++++++++++++++++++++
>   3 files changed, 68 insertions(+), 9 deletions(-)
>   create mode 100644 arch/powerpc/lib/uaccess.c
> 

[...]

> diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
> index b8de3be10eb4..a15060b5008e 100644
> --- a/arch/powerpc/lib/Makefile
> +++ b/arch/powerpc/lib/Makefile
> @@ -36,7 +36,7 @@ extra-$(CONFIG_PPC64)	+= crtsavres.o
>   endif
>   
>   obj-$(CONFIG_PPC_BOOK3S_64) += copyuser_power7.o copypage_power7.o \
> -			       memcpy_power7.o
> +			       memcpy_power7.o uaccess.o

Why only book3s/64 ? It applies to the 8xx and book3s/32 as well, I 
think it should just be for all powerpc.

>   
>   obj64-y	+= copypage_64.o copyuser_64.o mem_64.o hweight_64.o \
>   	   memcpy_64.o memcpy_mcsafe_64.o
> diff --git a/arch/powerpc/lib/uaccess.c b/arch/powerpc/lib/uaccess.c
> new file mode 100644
> index 000000000000..0057ab52d6fe
> --- /dev/null
> +++ b/arch/powerpc/lib/uaccess.c
> @@ -0,0 +1,50 @@
> +#include <linux/mm.h>
> +#include <linux/uaccess.h>
> +
> +static __always_inline long
> +probe_read_common(void *dst, const void __user *src, size_t size)
> +{
> +	long ret;
> +
> +	pagefault_disable();
> +	ret = raw_copy_from_user_allowed(dst, src, size);
> +	pagefault_enable();
> +
> +	return ret ? -EFAULT : 0;
> +}
> +
> +static __always_inline long
> +probe_write_common(void __user *dst, const void *src, size_t size)
> +{
> +	long ret;
> +
> +	pagefault_disable();
> +	ret = raw_copy_to_user_allowed(dst, src, size);
> +	pagefault_enable();
> +
> +	return ret ? -EFAULT : 0;
> +}
> +
> +long probe_kernel_read(void *dst, const void *src, size_t size)
> +{
> +	long ret;
> +	mm_segment_t old_fs = get_fs();
> +
> +	set_fs(KERNEL_DS);
> +	ret = probe_read_common(dst, (__force const void __user *)src, size);

I think you should squash probe_read_common() here, having it separated 
is a lot of lines for no added value. It also may make people believe it 
overwrites the generic probe_read_common()


> +	set_fs(old_fs);
> +
> +	return ret;
> +}
> +
> +long probe_kernel_write(void *dst, const void *src, size_t size)
> +{
> +	long ret;
> +	mm_segment_t old_fs = get_fs();
> +
> +	set_fs(KERNEL_DS);
> +	ret = probe_write_common((__force void __user *)dst, src, size);

Same comment as for probe_read_common()

> +	set_fs(old_fs);
> +
> +	return ret;
> +}
> 

Christophe
