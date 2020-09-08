Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A77FF2610EB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 13:47:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bm3Kf5JJ7zDqST
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 21:47:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bm3Hb4tS1zDqHh
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Sep 2020 21:45:28 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.195])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 4EC8F58B7BEF;
 Tue,  8 Sep 2020 13:45:04 +0200 (CEST)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 8 Sep 2020
 13:45:03 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003710aca84-74e5-4363-be75-62e9e2f68754,
 C140F6A5C7B222948263C4B5CC45CB8199AAF5B0) smtp.auth=clg@kaod.org
Subject: Re: [PATCH kernel] powerpc/dma: Fix dma_map_ops::get_required_mask
To: Alexey Kardashevskiy <aik@ozlabs.ru>, <linuxppc-dev@lists.ozlabs.org>
References: <20200908015106.79661-1-aik@ozlabs.ru>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <03b46b7c-b51b-4f84-21d5-79d5e49a338e@kaod.org>
Date: Tue, 8 Sep 2020 13:45:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200908015106.79661-1-aik@ozlabs.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e1504cdb-b552-4bb9-958c-5505e5140b66
X-Ovh-Tracer-Id: 7980378543706049504
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudehfedgvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegrihhksehoiihlrggsshdrrhhu
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
Cc: Oliver O'Halloran <oohall@gmail.com>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/8/20 3:51 AM, Alexey Kardashevskiy wrote:
> There are 2 problems with it:
> 1. "<" vs expected "<<"
> 2. the shift number is an IOMMU page number mask, not an address mask
> as the IOMMU page shift is missing.
> 
> This did not hit us before f1565c24b596 ("powerpc: use the generic
> dma_ops_bypass mode") because we had there additional code to handle
> bypass mask so this chunk (almost?) never executed. However there
> were reports that aacraid does not work with "iommu=nobypass".
> After f1565c24b596, aacraid (and probably others which call
> dma_get_required_mask() before setting the mask) was unable to
> enable 64bit DMA and fall back to using IOMMU which was known not to work,
> one of the problems is double free of an IOMMU page.
> 
> This fixes DMA for aacraid, both with and without "iommu=nobypass"
> in the kernel command line. Verified with "stress-ng -d 4".
> 
> Fixes: f1565c24b596 ("powerpc: use the generic dma_ops_bypass mode")
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>


The boston system looks solid with this patch.

Tested-by: Cédric Le Goater <clg@kaod.org>

Thanks a lot ! 

C. 


> ---
> 
> The original code came Jun 24 2011:
> 6a5c7be5e484 ("powerpc: Override dma_get_required_mask by platform hook and ops")
> 
> 
> What is dma_get_required_mask() for anyway? What "requires" what here?
> 
> Even though it works for now (due to huge - >4GB - default DMA window),
> I am still not convinced we do not want this chunk here
> (this is what f1565c24b596 removed):
> 
> if (dev_is_pci(dev)) {
>         u64 bypass_mask = dma_direct_get_required_mask(dev);
> 
>         if (dma_iommu_bypass_supported(dev, bypass_mask))
>                 return bypass_mask;
> }
> ---
>  arch/powerpc/kernel/dma-iommu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/dma-iommu.c b/arch/powerpc/kernel/dma-iommu.c
> index 569fecd7b5b2..9053fc9d20c7 100644
> --- a/arch/powerpc/kernel/dma-iommu.c
> +++ b/arch/powerpc/kernel/dma-iommu.c
> @@ -120,7 +120,8 @@ u64 dma_iommu_get_required_mask(struct device *dev)
>  	if (!tbl)
>  		return 0;
>  
> -	mask = 1ULL < (fls_long(tbl->it_offset + tbl->it_size) - 1);
> +	mask = 1ULL << (fls_long(tbl->it_offset + tbl->it_size) +
> +			tbl->it_page_shift - 1);
>  	mask += mask - 1;
>  
>  	return mask;
> 

