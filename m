Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F402173160
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 07:51:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TKvw5yvtzDrLX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 17:51:56 +1100 (AEDT)
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
 header.s=mail header.b=ejCtIt1p; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TKqX4KdyzDrDZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 17:48:07 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48TKqP4kR7z9tyP0;
 Fri, 28 Feb 2020 07:48:01 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ejCtIt1p; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 6jR401TOlRIA; Fri, 28 Feb 2020 07:48:01 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48TKqP3BC8z9tyNy;
 Fri, 28 Feb 2020 07:48:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582872481; bh=Cohq9MVvU03XQUeGGqMuaEGuP4J4N2k2xbofXFWhiRw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ejCtIt1pd0JhHvXUzC8ZeqbHtAetHvxWh/WRA+/9D97XkCsZNfkoa5oSlOPs4ad/Z
 oNQbAQr7i6AfI0th7MHnXfnLXuZB26+Smf/qM+RVTIc0d5uN6K4h3rLubVFQUtwSgT
 SrEUoF1y1EqtDX5qO3hBiLDlNFbdc6uyV9ewJl8M=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 467B48B884;
 Fri, 28 Feb 2020 07:48:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fft1qqTPHigN; Fri, 28 Feb 2020 07:48:02 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ABD0F8B768;
 Fri, 28 Feb 2020 07:48:01 +0100 (CET)
Subject: Re: [PATCH 1/3] powerpc/of: split out new_property() for reusing
To: Pingfan Liu <kernelfans@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <1582869192-9284-1-git-send-email-kernelfans@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <f0f00d96-80a9-dd40-e1ed-204ad1cb954a@c-s.fr>
Date: Fri, 28 Feb 2020 07:47:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1582869192-9284-1-git-send-email-kernelfans@gmail.com>
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 kexec@lists.infradead.org, Paul Mackerras <paulus@samba.org>,
 Oliver O'Halloran <oohall@gmail.com>, Dan Williams <dan.j.williams@intel.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 28/02/2020 à 06:53, Pingfan Liu a écrit :
> Since new_property() is used in several calling sites, splitting it out for
> reusing.
> 
> To ease the review, although the split out part has coding style issue,
> keeping it untouched and fixed in next patch.

The moved function fits in one screen. I don't think it is worth 
splitting out for coding style that applies on the new lines only. You 
can squash the two patches, it will still be easy to review.

> 
> Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
> To: linuxppc-dev@lists.ozlabs.org
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Cc: Oliver O'Halloran <oohall@gmail.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: kexec@lists.infradead.org
> ---
>   arch/powerpc/include/asm/prom.h           |  2 ++
>   arch/powerpc/kernel/Makefile              |  2 +-
>   arch/powerpc/kernel/of_property.c         | 32 +++++++++++++++++++++++++++++++
>   arch/powerpc/mm/drmem.c                   | 26 -------------------------
>   arch/powerpc/platforms/pseries/reconfig.c | 26 -------------------------
>   5 files changed, 35 insertions(+), 53 deletions(-)
>   create mode 100644 arch/powerpc/kernel/of_property.c
> 
> diff --git a/arch/powerpc/include/asm/prom.h b/arch/powerpc/include/asm/prom.h
> index 94e3fd5..02f7b1b 100644
> --- a/arch/powerpc/include/asm/prom.h
> +++ b/arch/powerpc/include/asm/prom.h
> @@ -90,6 +90,8 @@ struct of_drc_info {
>   extern int of_read_drc_info_cell(struct property **prop,
>   			const __be32 **curval, struct of_drc_info *data);
>   
> +extern struct property *new_property(const char *name, const int length,
> +		const unsigned char *value, struct property *last);

Don't add useless 'extern' keyword.

>   
>   /*
>    * There are two methods for telling firmware what our capabilities are.
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index 157b014..23375fd 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -47,7 +47,7 @@ obj-y				:= cputable.o ptrace.o syscalls.o \
>   				   signal.o sysfs.o cacheinfo.o time.o \
>   				   prom.o traps.o setup-common.o \
>   				   udbg.o misc.o io.o misc_$(BITS).o \
> -				   of_platform.o prom_parse.o
> +				   of_platform.o prom_parse.o of_property.o
>   obj-$(CONFIG_PPC64)		+= setup_64.o sys_ppc32.o \
>   				   signal_64.o ptrace32.o \
>   				   paca.o nvram_64.o firmware.o note.o
> diff --git a/arch/powerpc/kernel/of_property.c b/arch/powerpc/kernel/of_property.c
> new file mode 100644
> index 0000000..e56c832
> --- /dev/null
> +++ b/arch/powerpc/kernel/of_property.c
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <linux/of.h>
> +#include <linux/string.h>
> +#include <linux/kernel.h>
> +#include <linux/slab.h>
> +
> +struct property *new_property(const char *name, const int length,
> +				     const unsigned char *value, struct property *last)
> +{
> +	struct property *new = kzalloc(sizeof(*new), GFP_KERNEL);
> +
> +	if (!new)
> +		return NULL;
> +
> +	if (!(new->name = kstrdup(name, GFP_KERNEL)))
> +		goto cleanup;
> +	if (!(new->value = kmalloc(length + 1, GFP_KERNEL)))
> +		goto cleanup;
> +
> +	memcpy(new->value, value, length);
> +	*(((char *)new->value) + length) = 0;
> +	new->length = length;
> +	new->next = last;
> +	return new;
> +
> +cleanup:
> +	kfree(new->name);
> +	kfree(new->value);
> +	kfree(new);
> +	return NULL;
> +}
> +
> diff --git a/arch/powerpc/mm/drmem.c b/arch/powerpc/mm/drmem.c
> index 85b088a..888227e 100644
> --- a/arch/powerpc/mm/drmem.c
> +++ b/arch/powerpc/mm/drmem.c
> @@ -99,32 +99,6 @@ static void init_drconf_v2_cell(struct of_drconf_cell_v2 *dr_cell,
>   
>   extern int test_hotplug;
>   
> -static struct property *new_property(const char *name, const int length,
> -				     const unsigned char *value, struct property *last)
> -{
> -	struct property *new = kzalloc(sizeof(*new), GFP_KERNEL);
> -
> -	if (!new)
> -		return NULL;
> -
> -	if (!(new->name = kstrdup(name, GFP_KERNEL)))
> -		goto cleanup;
> -	if (!(new->value = kmalloc(length + 1, GFP_KERNEL)))
> -		goto cleanup;
> -
> -	memcpy(new->value, value, length);
> -	*(((char *)new->value) + length) = 0;
> -	new->length = length;
> -	new->next = last;
> -	return new;
> -
> -cleanup:
> -	kfree(new->name);
> -	kfree(new->value);
> -	kfree(new);
> -	return NULL;
> -}
> -
>   static int drmem_update_dt_v2(struct device_node *memory,
>   			      struct property *prop)
>   {
> diff --git a/arch/powerpc/platforms/pseries/reconfig.c b/arch/powerpc/platforms/pseries/reconfig.c
> index 7f7369f..8e5a2ba 100644
> --- a/arch/powerpc/platforms/pseries/reconfig.c
> +++ b/arch/powerpc/platforms/pseries/reconfig.c
> @@ -165,32 +165,6 @@ static char * parse_next_property(char *buf, char *end, char **name, int *length
>   	return tmp;
>   }
>   
> -static struct property *new_property(const char *name, const int length,
> -				     const unsigned char *value, struct property *last)
> -{
> -	struct property *new = kzalloc(sizeof(*new), GFP_KERNEL);
> -
> -	if (!new)
> -		return NULL;
> -
> -	if (!(new->name = kstrdup(name, GFP_KERNEL)))
> -		goto cleanup;
> -	if (!(new->value = kmalloc(length + 1, GFP_KERNEL)))
> -		goto cleanup;
> -
> -	memcpy(new->value, value, length);
> -	*(((char *)new->value) + length) = 0;
> -	new->length = length;
> -	new->next = last;
> -	return new;
> -
> -cleanup:
> -	kfree(new->name);
> -	kfree(new->value);
> -	kfree(new);
> -	return NULL;
> -}
> -
>   static int do_add_node(char *buf, size_t bufsize)
>   {
>   	char *path, *end, *name;
> 

Christophe
