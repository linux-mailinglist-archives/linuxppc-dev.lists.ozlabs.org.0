Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7D03F1685
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 11:46:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gr0Jj3ynxz3cYZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 19:46:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gr0JF3Q0kz2yNp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Aug 2021 19:45:45 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Gr0J53D8Lz9sWP;
 Thu, 19 Aug 2021 11:45:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hAGfMF3bk9Rp; Thu, 19 Aug 2021 11:45:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Gr0J16mshz9sWW;
 Thu, 19 Aug 2021 11:45:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C619E8B834;
 Thu, 19 Aug 2021 11:45:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id zVjoN77zbbiB; Thu, 19 Aug 2021 11:45:37 +0200 (CEST)
Received: from [172.25.230.102] (po15451.idsi0.si.c-s.fr [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 890878B835;
 Thu, 19 Aug 2021 11:45:37 +0200 (CEST)
Subject: Re: [PATCH 1/2] powerpc: kvm: rectify selection to PPC_DAWR
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Neuling <mikey@neuling.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20210819093226.13955-1-lukas.bulwahn@gmail.com>
 <20210819093226.13955-2-lukas.bulwahn@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <475fa73c-5eef-a60c-c70f-9f6ea7a079d8@csgroup.eu>
Date: Thu, 19 Aug 2021 11:45:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210819093226.13955-2-lukas.bulwahn@gmail.com>
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/08/2021 à 11:32, Lukas Bulwahn a écrit :
> Commit a278e7ea608b ("powerpc: Fix compile issue with force DAWR")
> selects the non-existing config PPC_DAWR_FORCE_ENABLE for config
> KVM_BOOK3S_64_HANDLER. As this commit also introduces a config PPC_DAWR,
> it probably intends to select PPC_DAWR instead.
> 
> Rectify the selection in config KVM_BOOK3S_64_HANDLER to PPC_DAWR.
> 
> The issue was identified with ./scripts/checkkconfigsymbols.py.
> 
> Fixes: a278e7ea608b ("powerpc: Fix compile issue with force DAWR")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>   arch/powerpc/kvm/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
> index e45644657d49..aa29ea56c80a 100644
> --- a/arch/powerpc/kvm/Kconfig
> +++ b/arch/powerpc/kvm/Kconfig
> @@ -38,7 +38,7 @@ config KVM_BOOK3S_32_HANDLER
>   config KVM_BOOK3S_64_HANDLER
>   	bool
>   	select KVM_BOOK3S_HANDLER
> -	select PPC_DAWR_FORCE_ENABLE
> +	select PPC_DAWR

That's useless, see https://elixir.bootlin.com/linux/v5.14-rc6/source/arch/powerpc/Kconfig#L267

In arch/powerpc/Kconfig, you already have:

	select PPC_DAWR				if PPC64




>   
>   config KVM_BOOK3S_PR_POSSIBLE
>   	bool
> 
