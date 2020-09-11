Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF2F2658EA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 07:44:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bnl7C6pDtzDqNx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 15:44:07 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bnl463LTVzDqpH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 15:41:26 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bnl4258Hmz9tynV;
 Fri, 11 Sep 2020 07:41:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id aXh553hPHijA; Fri, 11 Sep 2020 07:41:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bnl424Mxgz9tynT;
 Fri, 11 Sep 2020 07:41:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 604438B832;
 Fri, 11 Sep 2020 07:41:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0usWCdnc9ue9; Fri, 11 Sep 2020 07:41:23 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D34778B75E;
 Fri, 11 Sep 2020 07:41:22 +0200 (CEST)
Subject: Re: [PATCH 5/7] powerpc/powernv/pci: Fix W=1 compile warning
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20200910210250.1962595-1-clg@kaod.org>
 <20200910210250.1962595-6-clg@kaod.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <d930f5b2-6e0e-311d-0889-bf952d6af8c6@csgroup.eu>
Date: Fri, 11 Sep 2020 07:41:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200910210250.1962595-6-clg@kaod.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 10/09/2020 à 23:02, Cédric Le Goater a écrit :
>    CC      arch/powerpc/platforms/powernv/pci-ioda.o
> ../arch/powerpc/platforms/powernv/pci-ioda.c: In function ‘pnv_ioda_configure_pe’:
> ../arch/powerpc/platforms/powernv/pci-ioda.c:897:18: error: variable ‘parent’ set but not used [-Werror=unused-but-set-variable]
>    struct pci_dev *parent;
>                    ^~~~~~
> 

A small sentence explaining how this is fixed would be welcome, so that 
you don't need to read the code the know what the commit does to fix the 
warning. Also the subject should be more explicit.


> Cc: Oliver O'Halloran <oohall@gmail.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   arch/powerpc/platforms/powernv/pci-ioda.c | 8 --------
>   1 file changed, 8 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index 023a4f987bb2..2b4ceb5e6ce4 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -894,7 +894,6 @@ int pnv_ioda_deconfigure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
>   
>   int pnv_ioda_configure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
>   {
> -	struct pci_dev *parent;
>   	uint8_t bcomp, dcomp, fcomp;
>   	long rc, rid_end, rid;
>   
> @@ -904,7 +903,6 @@ int pnv_ioda_configure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
>   
>   		dcomp = OPAL_IGNORE_RID_DEVICE_NUMBER;
>   		fcomp = OPAL_IGNORE_RID_FUNCTION_NUMBER;
> -		parent = pe->pbus->self;
>   		if (pe->flags & PNV_IODA_PE_BUS_ALL)
>   			count = resource_size(&pe->pbus->busn_res);
>   		else
> @@ -925,12 +923,6 @@ int pnv_ioda_configure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
>   		}
>   		rid_end = pe->rid + (count << 8);
>   	} else {
> -#ifdef CONFIG_PCI_IOV
> -		if (pe->flags & PNV_IODA_PE_VF)
> -			parent = pe->parent_dev;
> -		else
> -#endif /* CONFIG_PCI_IOV */
> -			parent = pe->pdev->bus->self;
>   		bcomp = OpalPciBusAll;
>   		dcomp = OPAL_COMPARE_RID_DEVICE_NUMBER;
>   		fcomp = OPAL_COMPARE_RID_FUNCTION_NUMBER;
> 
