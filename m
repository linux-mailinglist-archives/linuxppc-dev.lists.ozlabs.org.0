Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3D3303BB5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 12:34:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQ4QG4b8xzDqDF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 22:34:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.254.192; helo=3.mo52.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 14592 seconds by postgrey-1.36 at bilbo;
 Tue, 26 Jan 2021 22:29:07 AEDT
Received: from 3.mo52.mail-out.ovh.net (3.mo52.mail-out.ovh.net
 [178.33.254.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQ4J34WrDzDqn1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 22:28:57 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.163])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 259872368DE;
 Tue, 26 Jan 2021 08:25:37 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 26 Jan
 2021 08:25:37 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0036943b526-2570-4cdc-a1d4-711e75c6cee5,
 5D556FFD98B84F2EA34A7A8BED120B5F5B9D3368) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 3/5] powerpc/xive: remove unnecessary unmap_kernel_range
To: Nicholas Piggin <npiggin@gmail.com>, <linux-mm@kvack.org>, Andrew Morton
 <akpm@linux-foundation.org>
References: <20210126045404.2492588-1-npiggin@gmail.com>
 <20210126045404.2492588-4-npiggin@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <336902f4-58e6-0240-fe7a-ec06a45e118e@kaod.org>
Date: Tue, 26 Jan 2021 08:25:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210126045404.2492588-4-npiggin@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 85cc3d89-2df3-4a71-b88c-7de071b97d5b
X-Ovh-Tracer-Id: 14119066310198463270
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvdeggddutdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehnphhighhgihhnsehgmhgrihhlrdgtohhm
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
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/26/21 5:54 AM, Nicholas Piggin wrote:
> iounmap will remove ptes.
> 
> Cc: "Cédric Le Goater" <clg@kaod.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Looks good. 

Acked-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C. 

> ---
>  arch/powerpc/sysdev/xive/common.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
> index 595310e056f4..d6c2069cc828 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -959,16 +959,12 @@ EXPORT_SYMBOL_GPL(is_xive_irq);
>  void xive_cleanup_irq_data(struct xive_irq_data *xd)
>  {
>  	if (xd->eoi_mmio) {
> -		unmap_kernel_range((unsigned long)xd->eoi_mmio,
> -				   1u << xd->esb_shift);
>  		iounmap(xd->eoi_mmio);
>  		if (xd->eoi_mmio == xd->trig_mmio)
>  			xd->trig_mmio = NULL;
>  		xd->eoi_mmio = NULL;
>  	}
>  	if (xd->trig_mmio) {
> -		unmap_kernel_range((unsigned long)xd->trig_mmio,
> -				   1u << xd->esb_shift);
>  		iounmap(xd->trig_mmio);
>  		xd->trig_mmio = NULL;
>  	}
> 

