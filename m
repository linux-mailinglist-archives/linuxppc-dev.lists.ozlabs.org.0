Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE97A19D3B9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 11:31:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tvny1Vd2zDqdS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 20:31:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.43.98; helo=14.mo3.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 77998 seconds by postgrey-1.36 at bilbo;
 Fri, 03 Apr 2020 20:27:58 AEDT
Received: from 14.mo3.mail-out.ovh.net (14.mo3.mail-out.ovh.net
 [188.165.43.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tvjp5JM7zDsGt
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 20:27:54 +1100 (AEDT)
Received: from player795.ha.ovh.net (unknown [10.108.42.82])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 58F0F240210
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 11:17:44 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player795.ha.ovh.net (Postfix) with ESMTPSA id D707E10F306D5;
 Fri,  3 Apr 2020 09:17:34 +0000 (UTC)
Date: Fri, 3 Apr 2020 11:17:33 +0200
From: Greg Kurz <groug@kaod.org>
To: Frederic Barrat <fbarrat@linux.ibm.com>
Subject: Re: [PATCH 2/4] ocxl: Access interrupt trigger page from xive directly
Message-ID: <20200403111733.7da91759@bahia.lan>
In-Reply-To: <20200402154352.586166-3-fbarrat@linux.ibm.com>
References: <20200402154352.586166-1-fbarrat@linux.ibm.com>
 <20200402154352.586166-3-fbarrat@linux.ibm.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 18390167606966589797
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrtdeigddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgsehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeelhedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
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
Cc: ukrishn@linux.ibm.com, ajd@linux.ibm.com, haren@linux.ibm.com, clg@kaod.org,
 linuxppc-dev@lists.ozlabs.org, christophe_lombard@fr.ibm.com,
 mrochs@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu,  2 Apr 2020 17:43:50 +0200
Frederic Barrat <fbarrat@linux.ibm.com> wrote:

> We can access the trigger page through standard APIs so let's use it
> and avoid saving it when allocating the interrupt. It will also allow
> to simplify allocation in a later patch.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

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

