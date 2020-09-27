Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48346279F48
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 09:27:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bzcfz24XwzDqNw
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 17:27:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BzcdP09mjzDqCG
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Sep 2020 17:25:57 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bzcd82glTz9vCyc;
 Sun, 27 Sep 2020 09:25:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id yhfmN9Orc819; Sun, 27 Sep 2020 09:25:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bzcd80Bg3z9v3H3;
 Sun, 27 Sep 2020 09:25:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 555938B771;
 Sun, 27 Sep 2020 09:25:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id gbolnZbz-bPu; Sun, 27 Sep 2020 09:25:52 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CFBE78B75B;
 Sun, 27 Sep 2020 09:25:51 +0200 (CEST)
Subject: Re: [RFC PATCH 18/18] powerpc/powermac: Move PHB discovery
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200924063819.262830-1-oohall@gmail.com>
 <20200924063819.262830-18-oohall@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <24ea73ce-90b7-6bdf-a02d-13ae29346a45@csgroup.eu>
Date: Sun, 27 Sep 2020 09:25:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200924063819.262830-18-oohall@gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 24/09/2020 à 08:38, Oliver O'Halloran a écrit :
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>

Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>

This series is a really good step forward to the elimination of
early support for ioremap(), thanks.

Tested with pmac32_defconfig on QEMU MAC99.

Before the series we have 9000 kbytes mapped as early ioremap

ioremap() called early from pmac_feature_init+0xc8/0xac8. Use early_ioremap() instead
ioremap() called early from probe_one_macio+0x170/0x2a8. Use early_ioremap() instead
ioremap() called early from udbg_scc_init+0x1d8/0x494. Use early_ioremap() instead
ioremap() called early from find_via_cuda+0xa8/0x3f8. Use early_ioremap() instead
ioremap() called early from pmac_pci_init+0x214/0x778. Use early_ioremap() instead
ioremap() called early from pmac_pci_init+0x228/0x778. Use early_ioremap() instead
ioremap() called early from pci_process_bridge_OF_ranges+0x158/0x2d0. Use early_ioremap() instead
ioremap() called early from pmac_setup_arch+0x110/0x298. Use early_ioremap() instead
ioremap() called early from pmac_nvram_init+0x144/0x534. Use early_ioremap() instead
   * 0xfeb36000..0xff400000  : early ioremap
   * 0xf1000000..0xfeb36000  : vmalloc & ioremap

After the series we have 800 kbytes mapped as early ioremap

ioremap() called early from pmac_feature_init+0xc8/0xac8. Use early_ioremap() instead
ioremap() called early from probe_one_macio+0x170/0x2a8. Use early_ioremap() instead
ioremap() called early from udbg_scc_init+0x1d8/0x494. Use early_ioremap() instead
ioremap() called early from find_via_cuda+0xa8/0x3f8. Use early_ioremap() instead
ioremap() called early from pmac_setup_arch+0x10c/0x294. Use early_ioremap() instead
ioremap() called early from pmac_nvram_init+0x144/0x534. Use early_ioremap() instead
   * 0xff338000..0xff400000  : early ioremap
   * 0xf1000000..0xff338000  : vmalloc & ioremap

Christophe


> ---
> compile tested with pmac32_defconfig and g5_defconfig
> ---
>   arch/powerpc/platforms/powermac/setup.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powermac/setup.c b/arch/powerpc/platforms/powermac/setup.c
> index f002b0fa69b8..0f8669139a21 100644
> --- a/arch/powerpc/platforms/powermac/setup.c
> +++ b/arch/powerpc/platforms/powermac/setup.c
> @@ -298,9 +298,6 @@ static void __init pmac_setup_arch(void)
>   		of_node_put(ic);
>   	}
>   
> -	/* Lookup PCI hosts */
> -	pmac_pci_init();
> -
>   #ifdef CONFIG_PPC32
>   	ohare_init();
>   	l2cr_init();
> @@ -600,6 +597,7 @@ define_machine(powermac) {
>   	.name			= "PowerMac",
>   	.probe			= pmac_probe,
>   	.setup_arch		= pmac_setup_arch,
> +	.discover_phbs		= pmac_pci_init,
>   	.show_cpuinfo		= pmac_show_cpuinfo,
>   	.init_IRQ		= pmac_pic_init,
>   	.get_irq		= NULL,	/* changed later */
> 
