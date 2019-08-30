Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E968A3EF0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 22:25:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KrZN0sXtzDqcl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 06:25:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="V6Ps4YjA"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KrVF0T30zDqwn
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 06:21:41 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46KrV86Md0z9v7DV;
 Fri, 30 Aug 2019 22:21:36 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=V6Ps4YjA; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id IyCuknZygVPR; Fri, 30 Aug 2019 22:21:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46KrV859B7z9v7DT;
 Fri, 30 Aug 2019 22:21:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1567196496; bh=yamZ/uoZZ/8N8l60SIEdp4gAbxpE6C6fN89lCQF9GyA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=V6Ps4YjAJcG1xn8iVemR4dWplz6+YHrm5TUEci82McqyDzka3geO/zdxuYz+YUj9r
 9VwyYzFddQcrFACr222SVJeo/rJBTkQgVIs3P/FVMQpxbo0UEOjoYDYdft7I3Ptt+1
 KMmpXoX5CVDXCUjkyaB6f9AgBm8kQe8UIKD17Kms=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 060658B911;
 Fri, 30 Aug 2019 22:21:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 3ST1DPzSo99M; Fri, 30 Aug 2019 22:21:36 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BC7028B90B;
 Fri, 30 Aug 2019 22:21:35 +0200 (CEST)
Subject: Re: [PATCH v6 3/6] powerpc/perf: consolidate read_user_stack_32
To: Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
References: <cover.1567188299.git.msuchanek@suse.de>
 <630c0889c1fb841bcd2054d90205e61d175b965b.1567188299.git.msuchanek@suse.de>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <688e9db0-f00f-7629-5162-f711c3627708@c-s.fr>
Date: Fri, 30 Aug 2019 22:21:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <630c0889c1fb841bcd2054d90205e61d175b965b.1567188299.git.msuchanek@suse.de>
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
Cc: David Hildenbrand <david@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 David Howells <dhowells@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Breno Leitao <leitao@debian.org>, Michael Neuling <mikey@neuling.org>,
 Nicolai Stange <nstange@suse.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Allison Randal <allison@lohutok.net>, Firoz Khan <firoz.khan@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Arnd Bergmann <arnd@arndb.de>,
 Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Christian Brauner <christian@brauner.io>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/08/2019 à 20:57, Michal Suchanek a écrit :
> There are two almost identical copies for 32bit and 64bit.
> 
> The function is used only in 32bit code which will be split out in next
> patch so consolidate to one function.
> 
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>

Reviewed-by: Christophe.Leroy@c-s.fr

> ---
> new patch in v6
> ---
>   arch/powerpc/perf/callchain.c | 25 +++++++++----------------
>   1 file changed, 9 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
> index c84bbd4298a0..b7cdcce20280 100644
> --- a/arch/powerpc/perf/callchain.c
> +++ b/arch/powerpc/perf/callchain.c
> @@ -165,22 +165,6 @@ static int read_user_stack_64(unsigned long __user *ptr, unsigned long *ret)
>   	return read_user_stack_slow(ptr, ret, 8);
>   }
>   
> -static int read_user_stack_32(unsigned int __user *ptr, unsigned int *ret)
> -{
> -	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
> -	    ((unsigned long)ptr & 3))
> -		return -EFAULT;
> -
> -	pagefault_disable();
> -	if (!__get_user_inatomic(*ret, ptr)) {
> -		pagefault_enable();
> -		return 0;
> -	}
> -	pagefault_enable();
> -
> -	return read_user_stack_slow(ptr, ret, 4);
> -}
> -
>   static inline int valid_user_sp(unsigned long sp, int is_64)
>   {
>   	if (!sp || (sp & 7) || sp > (is_64 ? TASK_SIZE : 0x100000000UL) - 32)
> @@ -295,6 +279,12 @@ static inline int current_is_64bit(void)
>   }
>   
>   #else  /* CONFIG_PPC64 */
> +static int read_user_stack_slow(void __user *ptr, void *buf, int nb)
> +{
> +	return 0;
> +}
> +#endif /* CONFIG_PPC64 */
> +
>   /*
>    * On 32-bit we just access the address and let hash_page create a
>    * HPTE if necessary, so there is no need to fall back to reading
> @@ -313,9 +303,12 @@ static int read_user_stack_32(unsigned int __user *ptr, unsigned int *ret)
>   	rc = __get_user_inatomic(*ret, ptr);
>   	pagefault_enable();
>   
> +	if (IS_ENABLED(CONFIG_PPC64) && rc)
> +		return read_user_stack_slow(ptr, ret, 4);
>   	return rc;
>   }
>   
> +#ifndef CONFIG_PPC64
>   static inline void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
>   					  struct pt_regs *regs)
>   {
> 
