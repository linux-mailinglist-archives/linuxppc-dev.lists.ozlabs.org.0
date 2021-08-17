Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C33683EED44
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 15:23:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpsCz4Y2Xz3bWb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 23:23:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpsCV1xSLz2yP0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 23:22:42 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GpsCM6FLvz9sTg;
 Tue, 17 Aug 2021 15:22:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 98tisP6h3gsf; Tue, 17 Aug 2021 15:22:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GpsCM5FSnz9sTf;
 Tue, 17 Aug 2021 15:22:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 886B28B7C8;
 Tue, 17 Aug 2021 15:22:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id z9ArqeFHdXUY; Tue, 17 Aug 2021 15:22:39 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1BB008B7A9;
 Tue, 17 Aug 2021 15:22:39 +0200 (CEST)
Subject: Re: [PATCH/RFC] powerpc/module_64: allow .init_array constructors to
 run
To: Jan Stancek <jstancek@redhat.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org
References: <920acea9aa18e4f2956581a8e158bdaa376fdf63.1629203945.git.jstancek@redhat.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <0bef6f5d-5c2a-efd4-6281-1e66b1709479@csgroup.eu>
Date: Tue, 17 Aug 2021 15:22:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <920acea9aa18e4f2956581a8e158bdaa376fdf63.1629203945.git.jstancek@redhat.com>
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
Cc: linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 17/08/2021 à 15:02, Jan Stancek a écrit :
> gcov and kasan rely on compiler generated constructor code.
> For modules, gcc-8 with gcov enabled generates .init_array section,
> but on ppc64le it doesn't get executed. find_module_sections() never
> finds .init_array section, because module_frob_arch_sections() renames
> it to _init_array.
> 
> Avoid renaming .init_array section, so do_mod_ctors() can use it.
> 
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
> I wasn't able to trace the comment:
>    "We don't handle .init for the moment: rename to _init"

Original patch there: https://github.com/mpe/linux-fullhistory/commit/d6ad6690aa72

> to original patch (it pre-dates .git). I'm not sure if it
> still applies today, so I limited patch to .init_array. This
> fixes gcov for modules for me on ppc64le 5.14.0-rc6.
> 
> Renaming issue is also mentioned in kasan patches here:
>    https://patchwork.ozlabs.org/project/linuxppc-dev/cover/20210319144058.772525-1-dja@axtens
> 
>   arch/powerpc/kernel/module_64.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
> index 6baa676e7cb6..c604b13ea6bf 100644
> --- a/arch/powerpc/kernel/module_64.c
> +++ b/arch/powerpc/kernel/module_64.c
> @@ -299,8 +299,16 @@ int module_frob_arch_sections(Elf64_Ehdr *hdr,
>   					  sechdrs[i].sh_size);
>   
>   		/* We don't handle .init for the moment: rename to _init */
> -		while ((p = strstr(secstrings + sechdrs[i].sh_name, ".init")))
> +		while ((p = strstr(secstrings + sechdrs[i].sh_name, ".init"))) {
> +#ifdef CONFIG_CONSTRUCTORS

Please avoid #ifdefery as much as possible.

I think here you can do:

			if (IS_ENABLED(CONFIG_CONSTRUCTORS) &&
			    strstr(secstrings + sechdrs[i].sh_name, ".init_array"))

> +			/* find_module_sections() needs .init_array intact */
> +			if (strstr(secstrings + sechdrs[i].sh_name,
> +				".init_array")) {

No { } for single statements (See 
https://www.kernel.org/doc/html/latest/process/coding-style.html#placing-braces-and-spaces)

> +				break;
> +			}
> +#endif
>   			p[0] = '_';
> +		}
>   
>   		if (sechdrs[i].sh_type == SHT_SYMTAB)
>   			dedotify((void *)hdr + sechdrs[i].sh_offset,
> 
