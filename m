Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5484D97EC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 10:42:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHpNw53q7z30Dv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 20:42:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHpNW3W43z2xTs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 20:42:33 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KHpNP6vFQz9sSm;
 Tue, 15 Mar 2022 10:42:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dF2zyDWcfBkw; Tue, 15 Mar 2022 10:42:29 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KHpNP5ySrz9sSj;
 Tue, 15 Mar 2022 10:42:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B8C778B770;
 Tue, 15 Mar 2022 10:42:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id LEBbleLzX4BU; Tue, 15 Mar 2022 10:42:29 +0100 (CET)
Received: from [192.168.202.50] (unknown [192.168.202.50])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0465E8B763;
 Tue, 15 Mar 2022 10:42:28 +0100 (CET)
Message-ID: <2f2cafaa-e1f3-7f75-10a5-b8edb6de26d7@csgroup.eu>
Date: Tue, 15 Mar 2022 10:42:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH -next] powerpc/eeh: Add correct inline functions
Content-Language: fr-FR
To: YueHaibing <yuehaibing@huawei.com>, ruscur@russell.cc, oohall@gmail.com,
 mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 sbobroff@linux.ibm.com
References: <20210331125313.24036-1-yuehaibing@huawei.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20210331125313.24036-1-yuehaibing@huawei.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 31/03/2021 à 14:53, YueHaibing a écrit :
> pseries_eeh_add_device_early()/pseries_eeh_add_device_tree_early() is
> never used since adding, however pseries_eeh_init_edev() and
> pseries_eeh_init_edev_recursive() need their inline versions.
> 
> Fixes: b6eebb093cad ("powerpc/eeh: Make early EEH init pseries specific")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Those inline are not needed at all:
- pseries_eeh_init_edev_recursive() is only called from files build wich 
CONFIG_HOTPLUG_PCI_RPA which depends on CONFIG_PSERIES and CONFIG_EEH
- pseries_eeh_init_edev() is used exclusively in
arch/powerpc/platforms/pseries/eeh_pseries.c and should be made static.

Can you update your patch ?

Thanks
Christophe

> ---
>   arch/powerpc/include/asm/eeh.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
> index b1a5bba2e0b9..0b6c2a6711d3 100644
> --- a/arch/powerpc/include/asm/eeh.h
> +++ b/arch/powerpc/include/asm/eeh.h
> @@ -357,8 +357,8 @@ static inline int eeh_phb_pe_create(struct pci_controller *phb) { return 0; }
>   void pseries_eeh_init_edev(struct pci_dn *pdn);
>   void pseries_eeh_init_edev_recursive(struct pci_dn *pdn);
>   #else
> -static inline void pseries_eeh_add_device_early(struct pci_dn *pdn) { }
> -static inline void pseries_eeh_add_device_tree_early(struct pci_dn *pdn) { }
> +static inline void pseries_eeh_init_edev(struct pci_dn *pdn) { }
> +static inline void pseries_eeh_init_edev_recursive(struct pci_dn *pdn) { }
>   #endif
>   
>   #ifdef CONFIG_PPC64
