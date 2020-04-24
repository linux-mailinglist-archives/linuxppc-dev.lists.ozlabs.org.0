Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E8F1B6F0B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 09:28:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497m4S0h3XzDqY1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 17:28:40 +1000 (AEST)
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
 header.s=mail header.b=pkckESzc; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497lw01XmvzDqVW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 17:21:18 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 497lvr5T01z9tyJm;
 Fri, 24 Apr 2020 09:21:12 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=pkckESzc; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id wSHBft-AlAuN; Fri, 24 Apr 2020 09:21:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 497lvr43CXz9tyJl;
 Fri, 24 Apr 2020 09:21:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1587712872; bh=gElz+irgb5pZXKsTtCEsCa9jmvIEXBXElnqTn0G0itA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=pkckESzcazhl0l+06rf32KK9v5++yUkAixH67vxMH7QyzBQxPuaa+j2YFGb4Llh5h
 UytnyWhHetlJAI9Vwr3Meb1rWPfjs+8e9izF9LCPEHc+ehD2vk3jN6UxTWD5ZKZ+Yp
 O5yAxyg3cqmeAz8pfp1iwJuUjdo47oCAWUAN9Tfc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9DE6A8B86C;
 Fri, 24 Apr 2020 09:21:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id GrCHfk9VqGq4; Fri, 24 Apr 2020 09:21:13 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CCB528B860;
 Fri, 24 Apr 2020 09:21:10 +0200 (CEST)
Subject: Re: [PATCH v3,5/5] powerpc: sysdev: support userspace access of
 fsl_85xx_sram
To: =?UTF-8?B?546L5paH6JmO?= <wenhu.wang@vivo.com>
References: <AHIA-gAFCMi-wI-WAB9biKqO.3.1587711910539.Hmail.wenhu.wang@vivo.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <3da78776-f126-8815-e397-c5090c84d83a@c-s.fr>
Date: Fri, 24 Apr 2020 09:21:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <AHIA-gAFCMi-wI-WAB9biKqO.3.1587711910539.Hmail.wenhu.wang@vivo.com>
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
Cc: robh@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, oss@buserror.net, kernel@vivo.com,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 24/04/2020 à 09:05, 王文虎 a écrit :
>> Le 24/04/2020 à 04:45, Wang Wenhu a écrit :
>>> New module which registers its memory allocation and free APIs to the
>>> sram_dynamic module, which would create a device of struct sram_device
>>> type to act as an interface for user level applications to access the
>>> backend hardware device, fsl_85xx_cache_sram, which is drived by the
>>> FSL_85XX_CACHE_SRAM module.
>>>
>>> Signed-off-by: Wang Wenhu <wenhu.wang@vivo.com>
>>> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
>>> Cc: Scott Wood <oss@buserror.net>
>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>> Cc: Arnd Bergmann <arnd@arndb.de>
>>> Cc: linuxppc-dev@lists.ozlabs.org
>>> ---
>>>    .../powerpc/include/asm/fsl_85xx_cache_sram.h |  4 ++
>>>    arch/powerpc/platforms/85xx/Kconfig           | 10 +++++
>>>    arch/powerpc/sysdev/Makefile                  |  1 +
>>>    arch/powerpc/sysdev/fsl_85xx_cache_ctlr.h     |  6 +++
>>>    arch/powerpc/sysdev/fsl_85xx_cache_sram.c     | 12 ++++++
>>>    arch/powerpc/sysdev/fsl_85xx_sram_uapi.c      | 39 +++++++++++++++++++
>>>    6 files changed, 72 insertions(+)
>>>    create mode 100644 arch/powerpc/sysdev/fsl_85xx_sram_uapi.c
>>
>> We shouldn't add more stuff in arch/powerpc/sysdev/
>>
>> Either it is dedicated to 85xx, and it should go into
>> arch/powerpc/platform/85xx/ , or it is common to several
>> platforms/architectures and should be moved to drivers/soc/fsl/
>>
> 
> Sure, actually I tried to find a better place, but did not recognize
> the driver/soc. Thanks, and I will put fsl_85xx_sram_uapi there.
> 
>>>
>>> diff --git a/arch/powerpc/include/asm/fsl_85xx_cache_sram.h b/arch/powerpc/include/asm/fsl_85xx_cache_sram.h
>>> index 0235a0447baa..99cb7e202c38 100644
>>> --- a/arch/powerpc/include/asm/fsl_85xx_cache_sram.h
>>> +++ b/arch/powerpc/include/asm/fsl_85xx_cache_sram.h
>>> @@ -26,6 +26,10 @@ struct mpc85xx_cache_sram {
>>>    	unsigned int size;
>>>    	rh_info_t *rh;
>>>    	spinlock_t lock;
>>> +
>>> +#ifdef CONFIG_FSL_85XX_SRAM_UAPI
>>> +	struct device *dev;
>>> +#endif
>>>    };
>>>    
>>>    extern void mpc85xx_cache_sram_free(void *ptr);
>>> diff --git a/arch/powerpc/platforms/85xx/Kconfig b/arch/powerpc/platforms/85xx/Kconfig
>>> index fa3d29dcb57e..3a6f6af973eb 100644
>>> --- a/arch/powerpc/platforms/85xx/Kconfig
>>> +++ b/arch/powerpc/platforms/85xx/Kconfig
>>> @@ -16,6 +16,16 @@ if FSL_SOC_BOOKE
>>>    
>>>    if PPC32
>>>    
>>> +config FSL_85XX_SRAM_UAPI
>>> +	tristate "Freescale MPC85xx SRAM UAPI Support"
>>> +	depends on FSL_SOC_BOOKE && SRAM_DYNAMIC
>>
>> Is SRAM_DYNAMIC usefull on its own, without a driver like this one ? Is
>> that worth allowing tiny selection of both drivers ? Shouldn't one of
>> them imply the other one ?
> 
> Truely the module like this is the top level selection, and SRAM_DYNAMIC
> should be selected by any caller modules. As SRAM_DYNAMIC may be used by
> other drivers(in the future, but currently only us here), I think make it
> seleted by this is better? (show below)
> 
> diff --git a/drivers/soc/fsl/Kconfig b/drivers/soc/fsl/Kconfig
> index 4df32bc4c7a6..ceeebb22f6d3 100644
> --- a/drivers/soc/fsl/Kconfig
> +++ b/drivers/soc/fsl/Kconfig
> @@ -50,4 +50,16 @@ config FSL_RCPM
>   	  tasks associated with power management, such as wakeup source control.
>   	  Note that currently this driver will not support PowerPC based
>   	  QorIQ processor.
> +
> +config FSL_85XX_SRAM_UAPI
> +	tristate "Freescale MPC85xx SRAM UAPI Support"
> +	depends on FSL_SOC_BOOKE && PPC32
> +	select FSL_85XX_CACHE_SRAM
> +	select SRAM_DYNAMIC
> +	help
> +	  This registers a device of struct sram_device type which would act as
> +	  an interface for user level applications to access the Freescale 85xx
> +	  Cache-SRAM memory dynamically, meaning allocate on demand dynamically
> +	  while they are running.
> +

And then in patch 4, I'm not sure it is worth to keep SRAM_DYNAMIC as 
user selectable.

>   endmenu
> diff --git a/drivers/soc/fsl/Makefile b/drivers/soc/fsl/Makefile
> index 906f1cd8af01..716e38f75735 100644
> --- a/drivers/soc/fsl/Makefile
> +++ b/drivers/soc/fsl/Makefile
> @@ -10,3 +10,4 @@ obj-$(CONFIG_FSL_RCPM)			+= rcpm.o
>   obj-$(CONFIG_FSL_GUTS)			+= guts.o
>   obj-$(CONFIG_FSL_MC_DPIO) 		+= dpio/
>   obj-$(CONFIG_DPAA2_CONSOLE)		+= dpaa2-console.o
> +obj-$(CONFIG_FSL_85XX_SRAM_UAPI)	+= fsl_85xx_sram_uapi.o
> 
>>>    
>>> +#ifdef CONFIG_FSL_85XX_SRAM_UAPI
>>> +extern struct mpc85xx_cache_sram *mpc85xx_get_cache_sram(void);
>>
>> 'extern' keywork is meaningless here, remove it.
>>
> 
> I will remove it in patch v4.
> 
>>> +#endif
>>> +
>>>    extern int instantiate_cache_sram(struct platform_device *dev,
>>>    		struct sram_parameters sram_params);
>>>    extern void remove_cache_sram(struct platform_device *dev);
>>> diff --git a/arch/powerpc/sysdev/fsl_85xx_cache_sram.c b/arch/powerpc/sysdev/fsl_85xx_cache_sram.c
>>> index 3de5ac8382c0..0156ea63a3a2 100644
>>> --- a/arch/powerpc/sysdev/fsl_85xx_cache_sram.c
>>> +++ b/arch/powerpc/sysdev/fsl_85xx_cache_sram.c
>>> @@ -23,6 +23,14 @@
>>>    
>>>    struct mpc85xx_cache_sram *cache_sram;
>>>    
>>> +
>>> +#ifdef CONFIG_FSL_85XX_SRAM_UAPI
>>> +struct mpc85xx_cache_sram *mpc85xx_get_cache_sram(void)
>>> +{
>>> +	return cache_sram;
>>> +}
>>> +#endif
>>
>> This function is not worth the mess of an #ifdef in a .c file.
>> cache_sram is already globaly visible, so this function should go in
>> fsl_85xx_cache_ctlr.h as a 'static inline'
>>
> 
> Yes, and I will change it like this, with an extern of cache_sram.
> 
>   #define L2CR_SRAM_ZERO		0x00000000	/* L2SRAM zero size */
> @@ -81,6 +83,15 @@ struct sram_parameters {
>   	phys_addr_t sram_offset;
>   };
>   
> +#ifdef CONFIG_FSL_85XX_SRAM_UAPI
> +extern struct mpc85xx_cache_sram *cache_sram;
> +
> +static inline struct mpc85xx_cache_sram *mpc85xx_get_cache_sram(void)
> +{
> +	return cache_sram;
> +}
> +#endif
> +
>   extern int instantiate_cache_sram(struct platform_device *dev,
> 
>>> +
>>>    void *mpc85xx_cache_sram_alloc(unsigned int size,
>>>    				phys_addr_t *phys, unsigned int align)
>>>    {
>>> @@ -115,6 +123,10 @@ int instantiate_cache_sram(struct platform_device *dev,
>>>    	rh_attach_region(cache_sram->rh, 0, cache_sram->size);
>>>    	spin_lock_init(&cache_sram->lock);
>>>    
>>> +#ifdef CONFIG_FSL_85XX_SRAM_UAPI
>>> +	cache_sram->dev = &dev->dev;
>>> +#endif
>>
>> 	Can we avoid the #ifdef in .c file ? (see
>> https://www.kernel.org/doc/html/latest/process/coding-style.html#conditional-compilation)
>>
> 
> Definitely, and I will change it as below in patch v4:
> 
> +	if (IS_ENABLED(CONFIG_FSL_85XX_SRAM_UAPI))
> +		cache_sram->dev = &dev->dev;
> +

This will work only if is defined all the time in the .h regardless of 
CONFIG_FSL_85XX_SRAM_UAPI. Otherwise you should have something like that 
in the .h, that you call all the time from the .c:

#ifdef CONFIG_FSL_85XX_SRAM_UAPI
static inline void set_cache_sram_dev(struct mpc85xx_cache_sram *sram, 
struct device *dev)
{
	sram->dev = dev;
}
#else
static inline void set_cache_sram_dev(struct mpc85xx_cache_sram *sram, 
struct device *dev) { }
#endif


>   	dev_info(&dev->dev, "[base:0x%llx, size:0x%x] configured and loaded\n",
> 
> Thanks, for your suggestions, as these are minor modifications,
> I will send a new patch series v4 soon.
> 
> Regards,
> Wenhu
> 

Christophe
