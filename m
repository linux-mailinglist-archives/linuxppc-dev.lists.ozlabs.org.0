Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE163F1BD6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 16:45:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gr6xj52cmz3cn5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 00:45:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gr6xK3FJhz3bTV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Aug 2021 00:44:53 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Gr6xG0sFzz9sVh;
 Thu, 19 Aug 2021 16:44:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gyESCA7ThCpg; Thu, 19 Aug 2021 16:44:50 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Gr6xF73ynz9sVX;
 Thu, 19 Aug 2021 16:44:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CA9798B842;
 Thu, 19 Aug 2021 16:44:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id d2UJWNosSxQY; Thu, 19 Aug 2021 16:44:49 +0200 (CEST)
Received: from [172.25.230.102] (po15451.idsi0.si.c-s.fr [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8988C8B837;
 Thu, 19 Aug 2021 16:44:49 +0200 (CEST)
Subject: Re: [PATCH 3/6] KVM: PPC: Book3S PR: Declare kvmppc_handle_exit_pr()
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
References: <20210819125656.14498-1-clg@kaod.org>
 <20210819125656.14498-4-clg@kaod.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <59d11f91-c235-6b7d-6d9a-de8d852aba35@csgroup.eu>
Date: Thu, 19 Aug 2021 16:44:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210819125656.14498-4-clg@kaod.org>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/08/2021 à 14:56, Cédric Le Goater a écrit :
> This fixes a compile error with W=1.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   arch/powerpc/kvm/book3s.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/kvm/book3s.h b/arch/powerpc/kvm/book3s.h
> index 740e51def5a5..c08f93b7f523 100644
> --- a/arch/powerpc/kvm/book3s.h
> +++ b/arch/powerpc/kvm/book3s.h
> @@ -24,6 +24,7 @@ extern int kvmppc_core_emulate_mfspr_pr(struct kvm_vcpu *vcpu,
>   					int sprn, ulong *spr_val);
>   extern int kvmppc_book3s_init_pr(void);
>   extern void kvmppc_book3s_exit_pr(void);
> +extern int kvmppc_handle_exit_pr(struct kvm_vcpu *vcpu, unsigned int exit_nr);

Don't add new 'extern' keywords, they are useless and pointless for functions prototypes.

>   
>   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>   extern void kvmppc_emulate_tabort(struct kvm_vcpu *vcpu, int ra_val);
> 
