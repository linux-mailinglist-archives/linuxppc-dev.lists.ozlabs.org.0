Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDA9414B32
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 15:55:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HF0Dl313cz2ywh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 23:55:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HF0DC4dlnz2xX2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 23:55:06 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HF0D76Byhz9sSc;
 Wed, 22 Sep 2021 15:55:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hao_HVFbY-Ej; Wed, 22 Sep 2021 15:55:03 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HF0D75Qbdz9sSS;
 Wed, 22 Sep 2021 15:55:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A63228B775;
 Wed, 22 Sep 2021 15:55:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id qnJexAkC8nr1; Wed, 22 Sep 2021 15:55:03 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6638D8B763;
 Wed, 22 Sep 2021 15:55:03 +0200 (CEST)
Subject: Re: [RESEND PATCH 2/2] powerpc/powermac: constify device_node in
 of_irq_parse_oldworld()
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20210922084415.18269-1-krzysztof.kozlowski@canonical.com>
 <20210922084415.18269-2-krzysztof.kozlowski@canonical.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <a33f0978-b617-6a07-7240-ec011f894680@csgroup.eu>
Date: Wed, 22 Sep 2021 15:55:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210922084415.18269-2-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-FR
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



Le 22/09/2021 à 10:44, Krzysztof Kozlowski a écrit :
> The of_irq_parse_oldworld() does not modify passed device_node so make
> it a pointer to const for safety.

AFAIKS this patch is unrelated to previous one so you should send them 
out separately instead of sending as a series.

> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>   arch/powerpc/platforms/powermac/pic.c | 2 +-
>   include/linux/of_irq.h                | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powermac/pic.c b/arch/powerpc/platforms/powermac/pic.c
> index 4921bccf0376..af5ca1f41bb1 100644
> --- a/arch/powerpc/platforms/powermac/pic.c
> +++ b/arch/powerpc/platforms/powermac/pic.c
> @@ -384,7 +384,7 @@ static void __init pmac_pic_probe_oldstyle(void)
>   #endif
>   }
>   
> -int of_irq_parse_oldworld(struct device_node *device, int index,
> +int of_irq_parse_oldworld(const struct device_node *device, int index,
>   			struct of_phandle_args *out_irq)
>   {
>   	const u32 *ints = NULL;
> diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
> index aaf219bd0354..6074fdf51f0c 100644
> --- a/include/linux/of_irq.h
> +++ b/include/linux/of_irq.h
> @@ -20,12 +20,12 @@ typedef int (*of_irq_init_cb_t)(struct device_node *, struct device_node *);
>   #if defined(CONFIG_PPC32) && defined(CONFIG_PPC_PMAC)
>   extern unsigned int of_irq_workarounds;
>   extern struct device_node *of_irq_dflt_pic;
> -extern int of_irq_parse_oldworld(struct device_node *device, int index,
> +extern int of_irq_parse_oldworld(const struct device_node *device, int index,
>   			       struct of_phandle_args *out_irq);

Please remove 'extern' which is useless for prototypes.

>   #else /* CONFIG_PPC32 && CONFIG_PPC_PMAC */
>   #define of_irq_workarounds (0)
>   #define of_irq_dflt_pic (NULL)
> -static inline int of_irq_parse_oldworld(struct device_node *device, int index,
> +static inline int of_irq_parse_oldworld(const struct device_node *device, int index,
>   				      struct of_phandle_args *out_irq)
>   {
>   	return -EINVAL;
> 
