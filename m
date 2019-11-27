Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 970B910ABE9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 09:39:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NDhy5tlKzDqjh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 19:39:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+230b1395c146a7dc824f+5939+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="lHlMLmry"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NDbZ1kKWzDqgs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 19:34:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AT9UghkO4fq0I9L3pqZzFdumeW8DrClZYJcOYkMOuVM=; b=lHlMLmryIW9QLDY3Y2XQ/CvtD
 rNORXZOyqaPdZFk/SqsGbKeBiMRJa2K20MY0RVQqyP0OOxSFxJVV3U1jvdxD5RTWGP5CfS0kGzrtm
 v5gnMqYe5bBKAs+j2qOo1wqgMHOiQ6WZUGlafUDR3dz9p8l8La/H+MOqWjRbVe+hUkT7EPdKE12Sa
 XOmfSjQQa1Unu92TCaJ1G/ta24SwhjSM7xE7rh3jiyU8QP+tdsB1kJNAxwdBUW199f9AKGpIah4P9
 vxTNMYDEx+/fxVzP9QSGovD0vU1oCyrIu6FCs9eOIopdvh/YiLJyNfYmMuGVH8ZZ/XrkWbDpVxWt9
 N8bMFSvbw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iZsmd-0007jY-FK; Wed, 27 Nov 2019 08:34:47 +0000
Date: Wed, 27 Nov 2019 00:34:47 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Haren Myneni <haren@linux.vnet.ibm.com>
Subject: Re: [PATCH 06/14] powerpc/vas: Setup fault handler per VAS instance
Message-ID: <20191127083447.GE17097@infradead.org>
References: <1574816900.13250.12.camel@hbabu-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1574816900.13250.12.camel@hbabu-laptop>
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
 npiggin@gmail.com, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>  
> +struct task_struct *fault_handler;
> +
> +void vas_wakeup_fault_handler(int virq, void *arg)
> +{
> +	struct vas_instance *vinst = arg;
> +
> +	atomic_inc(&vinst->pending_fault);
> +	wake_up(&vinst->fault_wq);
> +}
> +
> +/*
> + * Fault handler thread for each VAS instance and process fault CRBs.
> + */
> +static int fault_handler_func(void *arg)
> +{
> +	struct vas_instance *vinst = (struct vas_instance *)arg;
> +
> +	do {
> +		if (signal_pending(current))
> +			flush_signals(current);
> +
> +		wait_event_interruptible(vinst->fault_wq,
> +					atomic_read(&vinst->pending_fault) ||
> +					kthread_should_stop());
> +
> +		if (kthread_should_stop())
> +			break;
> +
> +		atomic_dec(&vinst->pending_fault);
> +	} while (!kthread_should_stop());
> +
> +	return 0;
> +}

Pleae use threaded interrupts instead of reinventing them badly.
