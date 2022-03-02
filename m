Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7AC4CA9D3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 17:09:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7zZM2JMNz3c5L
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 03:08:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7zYx5tlJz3bpX
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 03:08:35 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4K7zYs2Xs1z9sSf;
 Wed,  2 Mar 2022 17:08:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rxWtBRSv_3dy; Wed,  2 Mar 2022 17:08:33 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4K7zYs1qcGz9sSN;
 Wed,  2 Mar 2022 17:08:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2E7F58B76D;
 Wed,  2 Mar 2022 17:08:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 3ADqIjmPOceC; Wed,  2 Mar 2022 17:08:33 +0100 (CET)
Received: from [172.25.230.108] (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E66A98B763;
 Wed,  2 Mar 2022 17:08:32 +0100 (CET)
Message-ID: <4001045b-c404-763d-d1ba-41f6ed05ff8b@csgroup.eu>
Date: Wed, 2 Mar 2022 17:08:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] arch: powerpc: kvm: remove unnecessary casting
Content-Language: fr-FR
To: Nour-eddine Taleb <1337.noureddine@gmail.com>, paulus@ozlabs.org,
 mpe@ellerman.id.au, benh@kernel.crashing.org
References: <CAJO4vZwtVrYoMPZ9XoEAUJYgo-rND21eGorPrRF5m6rW4WT76w@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <CAJO4vZwtVrYoMPZ9XoEAUJYgo-rND21eGorPrRF5m6rW4WT76w@mail.gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 09/05/2021 à 14:00, Nour-eddine Taleb a écrit :
> remove unnecessary castings, from "void *" to "struct kvmppc_xics *"
> 
> Signed-off-by: Nour-eddine Taleb <1337.noureddine@gmail.com>

This patch doesn't apply. Tabs are broken, they've been replaced by 4 
space chars.

> ---
>   arch/powerpc/kvm/book3s_xics.c        | 2 +-
>   arch/powerpc/kvm/book3s_xive.c        | 2 +-
>   arch/powerpc/kvm/book3s_xive_native.c | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_xics.c b/arch/powerpc/kvm/book3s_xics.c
> index 303e3cb096db..9ae74fa551a6 100644
> --- a/arch/powerpc/kvm/book3s_xics.c
> +++ b/arch/powerpc/kvm/book3s_xics.c
> @@ -1440,7 +1440,7 @@ static int kvmppc_xics_create(struct kvm_device
> *dev, u32 type)
> 
>   static void kvmppc_xics_init(struct kvm_device *dev)
>   {
> -    struct kvmppc_xics *xics = (struct kvmppc_xics *)dev->private;
> +    struct kvmppc_xics *xics = dev->private;
> 
>       xics_debugfs_init(xics);
>   }
> diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
> index e7219b6f5f9a..05bcaf81a90a 100644
> --- a/arch/powerpc/kvm/book3s_xive.c
> +++ b/arch/powerpc/kvm/book3s_xive.c
> @@ -2242,7 +2242,7 @@ static void xive_debugfs_init(struct kvmppc_xive *xive)
> 
>   static void kvmppc_xive_init(struct kvm_device *dev)
>   {
> -    struct kvmppc_xive *xive = (struct kvmppc_xive *)dev->private;
> +    struct kvmppc_xive *xive = dev->private;
> 
>       /* Register some debug interfaces */
>       xive_debugfs_init(xive);
> diff --git a/arch/powerpc/kvm/book3s_xive_native.c
> b/arch/powerpc/kvm/book3s_xive_native.c
> index 76800c84f2a3..2703432cea78 100644
> --- a/arch/powerpc/kvm/book3s_xive_native.c
> +++ b/arch/powerpc/kvm/book3s_xive_native.c
> @@ -1265,7 +1265,7 @@ static void xive_native_debugfs_init(struct
> kvmppc_xive *xive)
> 
>   static void kvmppc_xive_native_init(struct kvm_device *dev)
>   {
> -    struct kvmppc_xive *xive = (struct kvmppc_xive *)dev->private;
> +    struct kvmppc_xive *xive = dev->private;
> 
>       /* Register some debug interfaces */
>       xive_native_debugfs_init(xive);
