Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F834D9A92
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 12:45:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHs6p4x51z3bV1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 22:45:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHs6L1b5Kz2yV7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 22:45:26 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KHs6C55q1z9sSm;
 Tue, 15 Mar 2022 12:45:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FxMvbyD66mSB; Tue, 15 Mar 2022 12:45:23 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KHs6C4HkPz9sSj;
 Tue, 15 Mar 2022 12:45:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 80F848B770;
 Tue, 15 Mar 2022 12:45:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4vf2hETzTAz6; Tue, 15 Mar 2022 12:45:23 +0100 (CET)
Received: from [192.168.202.50] (unknown [192.168.202.50])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 20B068B763;
 Tue, 15 Mar 2022 12:45:23 +0100 (CET)
Message-ID: <4cfd1a57-f3c1-86ff-3acc-61b1cc8a3602@csgroup.eu>
Date: Tue, 15 Mar 2022 12:45:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 6/6] powerpc/compat_sys: Declare syscalls
Content-Language: fr-FR
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
References: <20210819125656.14498-1-clg@kaod.org>
 <20210819125656.14498-7-clg@kaod.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20210819125656.14498-7-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/08/2021 à 14:56, Cédric Le Goater a écrit :
> This fixes a compile error with W=1.
> 
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>


Instead of doing that, we should use COMPAT_SYSCALL_DEFINEx macros in 
the function definitions.

Thanks
Christophe

> ---
>   arch/powerpc/include/asm/syscalls.h | 31 +++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/include/asm/syscalls.h
> index 398171fdcd9f..1d5f2abaa38a 100644
> --- a/arch/powerpc/include/asm/syscalls.h
> +++ b/arch/powerpc/include/asm/syscalls.h
> @@ -6,6 +6,7 @@
>   #include <linux/compiler.h>
>   #include <linux/linkage.h>
>   #include <linux/types.h>
> +#include <linux/compat.h>
>   
>   struct rtas_args;
>   
> @@ -18,5 +19,35 @@ asmlinkage long sys_mmap2(unsigned long addr, size_t len,
>   asmlinkage long ppc64_personality(unsigned long personality);
>   asmlinkage long sys_rtas(struct rtas_args __user *uargs);
>   
> +#ifdef CONFIG_COMPAT
> +unsigned long compat_sys_mmap2(unsigned long addr, size_t len,
> +			       unsigned long prot, unsigned long flags,
> +			       unsigned long fd, unsigned long pgoff);
> +
> +compat_ssize_t compat_sys_pread64(unsigned int fd, char __user *ubuf, compat_size_t count,
> +				  u32 reg6, u32 pos1, u32 pos2);
> +
> +compat_ssize_t compat_sys_pwrite64(unsigned int fd, const char __user *ubuf, compat_size_t count,
> +				   u32 reg6, u32 pos1, u32 pos2);
> +
> +compat_ssize_t compat_sys_readahead(int fd, u32 r4, u32 offset1, u32 offset2, u32 count);
> +
> +asmlinkage int compat_sys_truncate64(const char __user *path, u32 reg4,
> +				     unsigned long len1, unsigned long len2);
> +
> +asmlinkage long compat_sys_fallocate(int fd, int mode, u32 offset1, u32 offset2,
> +				     u32 len1, u32 len2);
> +
> +asmlinkage int compat_sys_ftruncate64(unsigned int fd, u32 reg4, unsigned long len1,
> +				      unsigned long len2);
> +
> +long ppc32_fadvise64(int fd, u32 unused, u32 offset1, u32 offset2,
> +		     size_t len, int advice);
> +
> +asmlinkage long compat_sys_sync_file_range2(int fd, unsigned int flags,
> +					    unsigned int offset1, unsigned int offset2,
> +					    unsigned int nbytes1, unsigned int nbytes2);
> +#endif
> +
>   #endif /* __KERNEL__ */
>   #endif /* __ASM_POWERPC_SYSCALLS_H */
