Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1F3414B17
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 15:52:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HF09Y6q9Xz2ynX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 23:52:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HF0921yndz2xtP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 23:52:20 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HF08x589pz9sSc;
 Wed, 22 Sep 2021 15:52:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3GF460nfqq_t; Wed, 22 Sep 2021 15:52:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HF08x4HJJz9sSS;
 Wed, 22 Sep 2021 15:52:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7F6CE8B775;
 Wed, 22 Sep 2021 15:52:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ZU-NHBvRosTT; Wed, 22 Sep 2021 15:52:17 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 608838B763;
 Wed, 22 Sep 2021 15:52:17 +0200 (CEST)
Subject: Re: [RESEND PATCH 1/2] powerpc/powermac: add missing
 g5_phy_disable_cpu1() declaration
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20210922084415.18269-1-krzysztof.kozlowski@canonical.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <ee9fc44e-daab-10e6-f293-fb45b43ff5b1@csgroup.eu>
Date: Wed, 22 Sep 2021 15:52:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210922084415.18269-1-krzysztof.kozlowski@canonical.com>
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
> g5_phy_disable_cpu1() is used outside of platforms/powermac/feature.c,
> so it should have a declaration to fix W=1 warning:
> 
>    arch/powerpc/platforms/powermac/feature.c:1533:6:
>      error: no previous prototype for ‘g5_phy_disable_cpu1’ [-Werror=missing-prototypes]


While you are at it, can you clean it up completely, that is remove the 
declaration in arch/powerpc/platforms/powermac/smp.c ?


> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>   arch/powerpc/include/asm/pmac_feature.h | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/pmac_feature.h b/arch/powerpc/include/asm/pmac_feature.h
> index e08e829261b6..7703e5bf1203 100644
> --- a/arch/powerpc/include/asm/pmac_feature.h
> +++ b/arch/powerpc/include/asm/pmac_feature.h
> @@ -143,6 +143,10 @@
>    */
>   struct device_node;
>   
> +#ifdef CONFIG_PPC64
> +void g5_phy_disable_cpu1(void);
> +#endif /* CONFIG_PPC64 */
> +
>   static inline long pmac_call_feature(int selector, struct device_node* node,
>   					long param, long value)
>   {
> 
