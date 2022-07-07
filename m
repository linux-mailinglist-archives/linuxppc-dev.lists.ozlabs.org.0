Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D5F56A0C4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 13:03:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdtnT2mGfz3cd4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 21:03:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ldtn304kRz3blG
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 21:03:16 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Ldtmx1Fpdz9tCd;
	Thu,  7 Jul 2022 13:03:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id efQ1yoNuCuig; Thu,  7 Jul 2022 13:03:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Ldtmx0P46z9tCW;
	Thu,  7 Jul 2022 13:03:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F288D8B79F;
	Thu,  7 Jul 2022 13:03:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 0jiyn1_nHucC; Thu,  7 Jul 2022 13:03:12 +0200 (CEST)
Received: from [192.168.233.174] (unknown [192.168.233.174])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 89E5E8B768;
	Thu,  7 Jul 2022 13:03:12 +0200 (CEST)
Message-ID: <95f35287-3d66-1788-e54c-7275fdba16ac@csgroup.eu>
Date: Thu, 7 Jul 2022 13:03:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH/RFC] powerpc/module_64: allow .init_array constructors to
 run
Content-Language: fr-FR
To: Jan Stancek <jstancek@redhat.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 Wedson Almeida Filho <wedsonaf@google.com>
References: <920acea9aa18e4f2956581a8e158bdaa376fdf63.1629203945.git.jstancek@redhat.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <920acea9aa18e4f2956581a8e158bdaa376fdf63.1629203945.git.jstancek@redhat.com>
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
Cc: linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



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

Does commit d4be60fe66b7 ("powerpc/module_64: use module_init_section 
instead of patching names") fixes your issue ?

If not, please rebase and resubmit.

Thanks
Christophe


> ---
> I wasn't able to trace the comment:
>    "We don't handle .init for the moment: rename to _init"
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
> +			/* find_module_sections() needs .init_array intact */
> +			if (strstr(secstrings + sechdrs[i].sh_name,
> +				".init_array")) {
> +				break;
> +			}
> +#endif
>   			p[0] = '_';
> +		}
>   
>   		if (sechdrs[i].sh_type == SHT_SYMTAB)
>   			dedotify((void *)hdr + sechdrs[i].sh_offset,
