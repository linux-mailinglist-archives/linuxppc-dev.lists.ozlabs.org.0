Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E1119D3C4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 11:33:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tvqw3W79zDqRg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 20:33:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.54.31; helo=5.mo6.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 12001 seconds by postgrey-1.36 at bilbo;
 Fri, 03 Apr 2020 20:31:46 AEDT
Received: from 5.mo6.mail-out.ovh.net (5.mo6.mail-out.ovh.net [46.105.54.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tvpB1nNSzDqWX
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 20:31:44 +1100 (AEDT)
Received: from player732.ha.ovh.net (unknown [10.110.115.229])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 3D623208C87
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 07:55:48 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player732.ha.ovh.net (Postfix) with ESMTPSA id EA21710F41D43;
 Fri,  3 Apr 2020 05:55:39 +0000 (UTC)
Subject: Re: [PATCH 2/4] ocxl: Access interrupt trigger page from xive directly
To: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 christophe_lombard@fr.ibm.com, ajd@linux.ibm.com, ukrishn@linux.ibm.com,
 mrochs@linux.ibm.com
References: <20200402154352.586166-1-fbarrat@linux.ibm.com>
 <20200402154352.586166-3-fbarrat@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6a1aaf90-4b6a-d3f7-69f8-26e44f992c25@kaod.org>
Date: Fri, 3 Apr 2020 07:55:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200402154352.586166-3-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14979816789517372313
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrtdehgddutddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejfedvrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: haren@linux.ibm.com, groug@kaod.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/2/20 5:43 PM, Frederic Barrat wrote:
> We can access the trigger page through standard APIs so let's use it
> and avoid saving it when allocating the interrupt. It will also allow
> to simplify allocation in a later patch.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>  drivers/misc/ocxl/afu_irq.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/ocxl/afu_irq.c b/drivers/misc/ocxl/afu_irq.c
> index 70f8f1c3929d..b30ec0ef7be7 100644
> --- a/drivers/misc/ocxl/afu_irq.c
> +++ b/drivers/misc/ocxl/afu_irq.c
> @@ -2,6 +2,7 @@
>  // Copyright 2017 IBM Corp.
>  #include <linux/interrupt.h>
>  #include <asm/pnv-ocxl.h>
> +#include <asm/xive.h>
>  #include "ocxl_internal.h"
>  #include "trace.h"
>  
> @@ -196,13 +197,16 @@ void ocxl_afu_irq_free_all(struct ocxl_context *ctx)
>  
>  u64 ocxl_afu_irq_get_addr(struct ocxl_context *ctx, int irq_id)
>  {
> +	struct xive_irq_data *xd;
>  	struct afu_irq *irq;
>  	u64 addr = 0;
>  
>  	mutex_lock(&ctx->irq_lock);
>  	irq = idr_find(&ctx->irq_idr, irq_id);
> -	if (irq)
> -		addr = irq->trigger_page;
> +	if (irq) {
> +		xd = irq_get_handler_data(irq->virq);
> +		addr = xd ? xd->trig_page : 0;
> +	}
>  	mutex_unlock(&ctx->irq_lock);
>  	return addr;
>  }
> 

