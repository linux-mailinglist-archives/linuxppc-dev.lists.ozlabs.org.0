Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F2239836A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 09:44:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fw1JX3V29z2xfd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 17:44:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fw1JB09YGz2xZH
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jun 2021 17:44:21 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4Fw1J12j0hzBCJg;
 Wed,  2 Jun 2021 09:44:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8FGfsZLeU5Ok; Wed,  2 Jun 2021 09:44:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Fw1J04z0FzBCP1;
 Wed,  2 Jun 2021 09:44:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9275C8B7D4;
 Wed,  2 Jun 2021 09:44:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id RFZfY_rbGftx; Wed,  2 Jun 2021 09:44:16 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 25BA58B771;
 Wed,  2 Jun 2021 09:44:16 +0200 (CEST)
Subject: Re: [PATCH] powerpc/8xx: select CPM1 for MPC8XXFADS
To: trix@redhat.com, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org
References: <20210601175304.2634549-1-trix@redhat.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <50ed000a-c1af-8552-9d35-771b3bc131e5@csgroup.eu>
Date: Wed, 2 Jun 2021 09:44:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210601175304.2634549-1-trix@redhat.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 01/06/2021 à 19:53, trix@redhat.com a écrit :
> From: Tom Rix <trix@redhat.com>
> 
> With MPC8XXFADS, there is this linker error
> ppc64-linux-ld: m8xx_setup.o: in function `cpm_cascade':
> m8xx_setup.c: undefined reference to `cpm_get_irq'

It looks like this config item is stale, it doesn't build any board support, there is no 
define_machine() for this config item, no file is linked to that config item.

I think you should just remove that item from the possible choices.

Christophe


> 
> cpm_get_irq() is conditionally complied by CPM1
> So add a select, like the other plaforms
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>   arch/powerpc/platforms/8xx/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/platforms/8xx/Kconfig b/arch/powerpc/platforms/8xx/Kconfig
> index 60cc5b537a98..919082cdb2f1 100644
> --- a/arch/powerpc/platforms/8xx/Kconfig
> +++ b/arch/powerpc/platforms/8xx/Kconfig
> @@ -10,6 +10,7 @@ choice
>   
>   config MPC8XXFADS
>   	bool "FADS"
> +	select CPM1
>   
>   config MPC86XADS
>   	bool "MPC86XADS"
> 
