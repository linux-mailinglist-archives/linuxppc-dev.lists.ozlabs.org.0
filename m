Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 143697D8B4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 11:38:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zlZr2qGFzDqth
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 19:37:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=87.98.172.249; helo=8.mo3.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 8.mo3.mail-out.ovh.net (8.mo3.mail-out.ovh.net [87.98.172.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zlXn21CczDqXb
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2019 19:36:06 +1000 (AEST)
Received: from player791.ha.ovh.net (unknown [10.108.35.74])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id AD7CE221EC9
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2019 10:58:57 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player791.ha.ovh.net (Postfix) with ESMTPSA id EAA2686678C9;
 Thu,  1 Aug 2019 08:58:45 +0000 (UTC)
Subject: Re: [PATCH 1/2] powerpc/xive: Use GFP_KERNEL instead of GFP_ATOMIC in
 'xive_irq_bitmap_add()'
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au,
 allison@lohutok.net, tglx@linutronix.de, groug@kaod.org
References: <cover.1564647619.git.christophe.jaillet@wanadoo.fr>
 <85d5d247ce753befd6aa63c473f7823de6520ccd.1564647619.git.christophe.jaillet@wanadoo.fr>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <669a1566-4048-1d81-f719-45e4ac05758b@kaod.org>
Date: Thu, 1 Aug 2019 10:58:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <85d5d247ce753befd6aa63c473f7823de6520ccd.1564647619.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12236561665022528369
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrleejgddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01/08/2019 10:32, Christophe JAILLET wrote:
> There is no need to use GFP_ATOMIC here. GFP_KERNEL should be enough.
> GFP_KERNEL is also already used for another allocation just a few lines
> below.

This is correct.
 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  arch/powerpc/sysdev/xive/spapr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
> index 8ef9cf4ebb1c..b4f5eb9e0f82 100644
> --- a/arch/powerpc/sysdev/xive/spapr.c
> +++ b/arch/powerpc/sysdev/xive/spapr.c
> @@ -45,7 +45,7 @@ static int xive_irq_bitmap_add(int base, int count)
>  {
>  	struct xive_irq_bitmap *xibm;
>  
> -	xibm = kzalloc(sizeof(*xibm), GFP_ATOMIC);
> +	xibm = kzalloc(sizeof(*xibm), GFP_KERNEL);
>  	if (!xibm)
>  		return -ENOMEM;
>  
> 

