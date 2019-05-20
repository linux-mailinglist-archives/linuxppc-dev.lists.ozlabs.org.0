Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA4622FEA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 11:12:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 456tTP0DKNzDqM3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 19:12:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.79.203; helo=10.mo68.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 3577 seconds by postgrey-1.36 at bilbo;
 Mon, 20 May 2019 19:11:23 AEST
Received: from 10.mo68.mail-out.ovh.net (10.mo68.mail-out.ovh.net
 [46.105.79.203])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 456tRv5PPCzDqBc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 19:11:19 +1000 (AEST)
Received: from player799.ha.ovh.net (unknown [10.108.54.217])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id F058712E541
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 09:55:26 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player799.ha.ovh.net (Postfix) with ESMTPSA id C7FF45E9AA3C;
 Mon, 20 May 2019 07:55:21 +0000 (UTC)
Date: Mon, 20 May 2019 09:55:20 +0200
From: Greg Kurz <groug@kaod.org>
To: Frederic Barrat <fbarrat@linux.ibm.com>
Subject: Re: [PATCH v2] ocxl: Fix potential memory leak on context creation
Message-ID: <20190520095520.097b7f04@bahia.lan>
In-Reply-To: <20190520071618.1722-1-fbarrat@linux.ibm.com>
References: <20190520071618.1722-1-fbarrat@linux.ibm.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 6732318493272152421
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddtjedguddvlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
Cc: clombard@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, alastair@au1.ibm.com,
 andrew.donnellan@au1.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 20 May 2019 09:16:18 +0200
Frederic Barrat <fbarrat@linux.ibm.com> wrote:

> If we couldn't fully init a context, we were leaking memory.
> 
> Fixes: b9721d275cc2 ("ocxl: Allow external drivers to use OpenCAPI contexts")

Oops... missed that during review :-\

> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---
> 
> Changelog:
> v2: reset context pointer in case of allocation failure (Andrew)
> 

Alternatively you could change the code to do:

	ctx = kzalloc(sizeof(struct ocxl_context), GFP_KERNEL);
	if (!ctx)
		return -ENOMEM;
	.
	.
	.
	if (pasid < 0) {
		mutex_unlock(&afu->contexts_lock);
		kfree(ctx);
		return pasid;
	}
	.
	.
	.
	*context = ctx;
	return 0;
}

This has the advantage of clearing any risk of side-effect with
*context forever, which is a safer practice IMHO.

Patch is correct anyway, so:

Reviewed-by: Greg Kurz <groug@kaod.org>

>  drivers/misc/ocxl/context.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/misc/ocxl/context.c b/drivers/misc/ocxl/context.c
> index bab9c9364184..24e4fb010275 100644
> --- a/drivers/misc/ocxl/context.c
> +++ b/drivers/misc/ocxl/context.c
> @@ -22,6 +22,8 @@ int ocxl_context_alloc(struct ocxl_context **context, struct ocxl_afu *afu,
>  			afu->pasid_base + afu->pasid_max, GFP_KERNEL);
>  	if (pasid < 0) {
>  		mutex_unlock(&afu->contexts_lock);
> +		kfree(*context);
> +		*context = NULL;
>  		return pasid;
>  	}
>  	afu->pasid_count++;

