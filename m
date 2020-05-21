Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE6C1DC76B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 09:15:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SLVj0HQ4zDqnW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 17:15:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.51.53; helo=5.mo178.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 5.mo178.mail-out.ovh.net (5.mo178.mail-out.ovh.net
 [46.105.51.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SLSf0fxyzDqNd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 17:13:33 +1000 (AEST)
Received: from player772.ha.ovh.net (unknown [10.110.208.131])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 557E99F7C2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 09:13:28 +0200 (CEST)
Received: from kaod.org (lfbn-tou-1-335-225.w86-206.abo.wanadoo.fr
 [86.206.169.225]) (Authenticated sender: clg@kaod.org)
 by player772.ha.ovh.net (Postfix) with ESMTPSA id 46A5212A2CB86;
 Thu, 21 May 2020 07:13:21 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001d40a19ad-c67a-4e20-82bc-321d3485d35f,814BE501F1048BCFB57FB4F14E8CAD466B88CA3D)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH 2/3] powerpc/pci: unmap legacy INTx interrupts of
 passthrough IO adapters
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20200429075122.1216388-1-clg@kaod.org>
 <20200429075122.1216388-3-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <bd19a249-fc46-35a4-2053-3b5b54827742@kaod.org>
Date: Thu, 21 May 2020 09:13:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200429075122.1216388-3-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3033174353310026741
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedruddutddguddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfeffvddtudegieefudeugffhjefgieegieegleettdehgfeiieevueeihfegfefgnecukfhppedtrddtrddtrddtpdekiedrvddtiedrudeiledrvddvheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejjedvrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: Carol L Soto <clsoto@us.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Greg Kurz <groug@kaod.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/29/20 9:51 AM, Cédric Le Goater wrote:
> When a passthrough IO adapter is removed from a pseries machine using
> hash MMU and the XIVE interrupt mode, the POWER hypervisor, pHyp,
> expects the guest OS to have cleared all page table entries related to
> the adapter. If some are still present, the RTAS call which isolates
> the PCI slot returns error 9001 "valid outstanding translations" and
> the removal of the IO adapter fails.
> 
> INTx interrupt numbers need special care because Linux maps the
> interrupts automatically in the Linux interrupt number space if they
> are presented in the device tree node describing the IO adapter. These
> interrupts are not un-mapped automatically and in case of an hot-plug
> adapter, the PCI hot-plug layer needs to handle the cleanup to make
> sure that all the page table entries of the XIVE ESB pages are
> cleared.
> 
> Cc: "Oliver O'Halloran" <oohall@gmail.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>


We did some tests with differnt passthrough adapters under LPAPRs (PowerVM) 
and KVM guests P8 (HPT) and P9 (HPT+Radix). Baremetal behaves correctly. 
But I would feel more comfortable if someone could give a try (PATCH1-2) 
on a different system.


Thanks,

C. 


> ---
>  arch/powerpc/kernel/pci-hotplug.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/pci-hotplug.c b/arch/powerpc/kernel/pci-hotplug.c
> index bf83f76563a3..9e9c6befd7ea 100644
> --- a/arch/powerpc/kernel/pci-hotplug.c
> +++ b/arch/powerpc/kernel/pci-hotplug.c
> @@ -57,6 +57,8 @@ void pcibios_release_device(struct pci_dev *dev)
>  	struct pci_controller *phb = pci_bus_to_host(dev->bus);
>  	struct pci_dn *pdn = pci_get_pdn(dev);
>  
> +	irq_dispose_mapping(dev->irq);
> +
>  	eeh_remove_device(dev);
>  
>  	if (phb->controller_ops.release_device)
> 

