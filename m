Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8148C288197
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 07:06:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6wyH69CHzDqYJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 16:05:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6wwb4bwLzDqWt
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Oct 2020 16:04:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=aXi98sUP; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4C6wwb3JxLz9sTK; Fri,  9 Oct 2020 16:04:31 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4C6wwb2Bvnz9sRk;
 Fri,  9 Oct 2020 16:04:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1602219871;
 bh=o9XX+VwMKSWMOZWIR1rupQIs61sxxahm7xGxsxm5Kos=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=aXi98sUPEZvfOinMGE6D0KHzzKRwf5vng69pHWH0I+/qnu5P+6BUFXEPhs2sG2AK1
 kLBjHP1cEMY3ZkM534+5L0O9n1K0Iu8ncyKdk+mLXuyMRsM5dV0ilcFsYqeLrEpfLr
 BkB5PQBCvcwNJ8YgMqVdKPWQJ+BdErNwGeqNCViqx+PvHyKfRglq9msx9p1E7HWo5b
 FnewEg+2BgQID2aBDQd9XPOHTRr3tBzWdZ4awSFgvXyoayGnu7Ee+5e1itdZWftWPO
 BgOB7QlfSnTbblH256plgvEpCjeTgXCyY8k1RVYyjNzANtzECgt4hCQd9JlB1qQD61
 vXKXjuhab2Ahw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH] powerpc/powernv/elog: Reduce elog message severity
In-Reply-To: <20201007101756.40811-1-hegdevasant@linux.vnet.ibm.com>
References: <20201007101756.40811-1-hegdevasant@linux.vnet.ibm.com>
Date: Fri, 09 Oct 2020 16:04:28 +1100
Message-ID: <87d01s0z37.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vasant Hegde <hegdevasant@linux.vnet.ibm.com> writes:
> OPAL interrupts kernel whenever it has new error log. Kernel calls
> interrupt handler (elog_event()) to retrieve event. elog_event makes
> OPAL API call (opal_get_elog_size()) to retrieve elog info.
>
> In some case before kernel makes opal_get_elog_size() call, it gets interrupt
> again. So second time when elog_event() calls opal_get_elog_size API OPAL
> returns error.

Can you give more detail there? Do you have a stack trace?

We use IRQF_ONESHOT for elog_event(), which (I thought) meant it
shouldn't be called again until it has completed.

So I'm unclear how you're seeing the behaviour you describe.

cheers

> Its safe to ignore this error. Hence reduce the severity
> of log message.
>
> CC: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
> ---
>  arch/powerpc/platforms/powernv/opal-elog.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/platforms/powernv/opal-elog.c b/arch/powerpc/platforms/powernv/opal-elog.c
> index 62ef7ad995da..67f435bb1ec4 100644
> --- a/arch/powerpc/platforms/powernv/opal-elog.c
> +++ b/arch/powerpc/platforms/powernv/opal-elog.c
> @@ -247,7 +247,7 @@ static irqreturn_t elog_event(int irq, void *data)
>  
>  	rc = opal_get_elog_size(&id, &size, &type);
>  	if (rc != OPAL_SUCCESS) {
> -		pr_err("ELOG: OPAL log info read failed\n");
> +		pr_debug("ELOG: OPAL log info read failed\n");
>  		return IRQ_HANDLED;
>  	}
>  
> -- 
> 2.26.2
