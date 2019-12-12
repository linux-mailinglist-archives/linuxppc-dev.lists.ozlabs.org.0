Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5734611CDBF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 14:04:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YYt5607kzDr3r
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 00:04:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+27c5b7719eecc710bb1c+5954+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="gOQm/8nE"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YYln4jgpzDqkq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 23:59:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zur5xyiSqo2xJ830yHt30nv2fsD+zD/jl1PNVNPO19U=; b=gOQm/8nEdZRE6nXCBxHkEobBu
 5uhOst9BFjVlAVcljEgbyf7/YeoAP4g+yl7FFyvBrsqrhqDPcF1oC5+lHhQYEU6bOi7EcePXriI67
 3Hw+0azaByfFIMHP7DHeq1dD2HsqeBd2DGLAfy3/g8H0ZWCSJfp/FLBf+wwwCPXxzievt7rISXxhi
 UM4CEHtw4ocCUB0wfVlJCGoMGVDn0u1kvCDgp0ejr8hvCEGHy5V/kV7+0j3lzMWkKblPO5U7OYqPp
 mXMs5B6WQuFeaXcprcOzOFNy1Mjd2/Wlu5I2ozgeofPNe5Hm5W5/nO9Bd2QWnsvsLphCU+yHUXgVT
 QUxB2ibqw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1ifO3k-0004Q1-7a; Thu, 12 Dec 2019 12:59:12 +0000
Date: Thu, 12 Dec 2019 04:59:12 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Haren Myneni <haren@linux.ibm.com>
Subject: Re: [PATCH V2 05/13] powerpc/vas: Setup thread IRQ handler per VAS
 instance
Message-ID: <20191212125912.GD3381@infradead.org>
References: <1575861522.16318.9.camel@hbabu-laptop>
 <1575862284.16318.22.camel@hbabu-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1575862284.16318.22.camel@hbabu-laptop>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: devicetree@vger.kernel.org, mikey@neuling.org, herbert@gondor.apana.org.au,
 npiggin@gmail.com, hch@infradead.org, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Dec 08, 2019 at 07:31:24PM -0800, Haren Myneni wrote:
> 
> Setup thread IRQ handler per each VAS instance. When NX sees a fault
> on CRB, kernel gets an interrupt and vas_fault_handler will be
> executed to process fault CRBs. Read all valid CRBs from fault FIFO,
> determine the corresponding send window from CRB and process fault
> requests.
> 
> Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
> Signed-off-by: Haren Myneni <haren@us.ibm.com>
> ---
>  arch/powerpc/platforms/powernv/vas-fault.c  | 83 +++++++++++++++++++++++++++++
>  arch/powerpc/platforms/powernv/vas-window.c | 60 +++++++++++++++++++++
>  arch/powerpc/platforms/powernv/vas.c        | 15 +++++-
>  arch/powerpc/platforms/powernv/vas.h        |  4 ++
>  4 files changed, 161 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
> index b0258ed..e1e34c6 100644
> --- a/arch/powerpc/platforms/powernv/vas-fault.c
> +++ b/arch/powerpc/platforms/powernv/vas-fault.c
> @@ -11,6 +11,7 @@
>  #include <linux/slab.h>
>  #include <linux/uaccess.h>
>  #include <linux/kthread.h>
> +#include <linux/mmu_context.h>
>  #include <asm/icswx.h>
>  
>  #include "vas.h"
> @@ -25,6 +26,88 @@
>  #define VAS_FAULT_WIN_FIFO_SIZE	(4 << 20)
>  
>  /*
> + * Process CRBs that we receive on the fault window.
> + */
> +irqreturn_t vas_fault_handler(int irq, void *data)
> +{
> +	struct vas_instance *vinst = (struct vas_instance *)data;

No need for the cast.

> +		crb = (struct coprocessor_request_block *)fifo;

Or this one.

> +		if (vinst->fault_crbs == vinst->fault_fifo_size/CRB_SIZE)

Missing whitespace before and after the /

> +	rc = request_threaded_irq(vinst->virq, NULL, vas_fault_handler,
> +					IRQF_ONESHOT, devname, vinst);
> +	if (rc) {
> +		pr_err("VAS[%d]: Request IRQ(%d) failed with %d\n",
> +				vinst->vas_id, vinst->virq, rc);
> +	} else {
> +		rc = vas_setup_fault_window(vinst);
> +		if (rc)
> +			free_irq(vinst->virq, vinst);
> +	}
>  
>  	return rc;

This would be a tad cleaner with proper goto unwinding:

	rc = request_threaded_irq(vinst->virq, NULL, vas_fault_handler,
					IRQF_ONESHOT, devname, vinst);
	if (rc) {
		pr_err("VAS[%d]: Request IRQ(%d) failed with %d\n",
				vinst->vas_id, vinst->virq, rc);
		goto out;
	}
	rc = vas_setup_fault_window(vinst);
	if (rc)
		goto out_free_irq;
	return 0;
out_free_irq:
	free_irq(vinst->virq, vinst);
out:
 	return rc;
