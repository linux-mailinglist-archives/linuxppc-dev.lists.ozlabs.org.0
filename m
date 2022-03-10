Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1474D4308
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 10:03:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDjls3mhFz3bVJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 20:03:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDjlS4Y5fz2xTp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 20:03:14 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KDjlN26zmz9sS0;
 Thu, 10 Mar 2022 10:03:12 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L9Pqo92huods; Thu, 10 Mar 2022 10:03:12 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KDjlN1LLtz9sRr;
 Thu, 10 Mar 2022 10:03:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 18C9B8B780;
 Thu, 10 Mar 2022 10:03:12 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id mD1I_YrfZu-y; Thu, 10 Mar 2022 10:03:12 +0100 (CET)
Received: from [192.168.202.40] (unknown [192.168.202.40])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C4DB98B763;
 Thu, 10 Mar 2022 10:03:11 +0100 (CET)
Message-ID: <23fd8d03-965b-a252-020e-4185c2ef5681@csgroup.eu>
Date: Thu, 10 Mar 2022 10:03:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] powerpc/powernv/pci: Drop VF MPS fixup
Content-Language: fr-FR
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200902035159.1762596-1-oohall@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20200902035159.1762596-1-oohall@gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 02/09/2020 à 05:51, Oliver O'Halloran a écrit :
> The MPS field in the VF config space is marked as reserved in current
> versions of the SR-IOV spec. In other words, this fixup doesn't do
> anything.
> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>

A lot of cleanup patches from Oliver were merged in Septembre 2020 but 
not this one.

Any reason ?

Thanks
Christophe


> ---
>   arch/powerpc/platforms/powernv/eeh-powernv.c | 18 ------------------
>   1 file changed, 18 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
> index 9af8c3b98853..0cabe4e632e3 100644
> --- a/arch/powerpc/platforms/powernv/eeh-powernv.c
> +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
> @@ -1689,24 +1689,6 @@ static struct eeh_ops pnv_eeh_ops = {
>   	.notify_resume		= NULL
>   };
>   
> -#ifdef CONFIG_PCI_IOV
> -static void pnv_pci_fixup_vf_mps(struct pci_dev *pdev)
> -{
> -	struct pci_dn *pdn = pci_get_pdn(pdev);
> -	int parent_mps;
> -
> -	if (!pdev->is_virtfn)
> -		return;
> -
> -	/* Synchronize MPS for VF and PF */
> -	parent_mps = pcie_get_mps(pdev->physfn);
> -	if ((128 << pdev->pcie_mpss) >= parent_mps)
> -		pcie_set_mps(pdev, parent_mps);
> -	pdn->mps = pcie_get_mps(pdev);
> -}
> -DECLARE_PCI_FIXUP_HEADER(PCI_ANY_ID, PCI_ANY_ID, pnv_pci_fixup_vf_mps);
> -#endif /* CONFIG_PCI_IOV */
> -
>   /**
>    * eeh_powernv_init - Register platform dependent EEH operations
>    *
