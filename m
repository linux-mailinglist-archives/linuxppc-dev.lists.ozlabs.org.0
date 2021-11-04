Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A782F444E9C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 07:04:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlCl94jtBz2ypT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 17:04:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EmbGkDhX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlCkY1yt8z2xCN
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Nov 2021 17:03:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=EmbGkDhX; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HlCkX4GkPz4xcG;
 Thu,  4 Nov 2021 17:03:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1636005829;
 bh=p/s4JP6PbvtWu7khsyF8vJ6QmABC6L59+cG94M8kDLc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=EmbGkDhXHcKUm2lpYjR8DUXtGW9HMpO2NjVP3Q9G8oRoGvIfTQ6U1PfO0ey0OP0Xd
 ny5VwgSYcgfRia/ufrmRTdJDeeljrp4voPBfH5YNZV09/GCFoP/KLGmUHW/H/HX7pb
 v0YO1hbpvsqXajkmj4txxqkW9VKPyiUPR23rlm5U0qYNZfCKBs7yw4wG2u9aIH9xgF
 Hxmo3FzPOgF0Jc18QSXTbexj0F0RJRdhXimP92F+gpmjBS04H/mbUGu4QtsGbEbMqC
 4CAd7PFmlLbyoUpYGFDVfB+pRROSgHCIcrrwyQk8RkND8E4q/l4On9EiHHjLyX3XyJ
 UDQrDE7+Ea4DA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, leoyang.li@nxp.com,
 tyreld@linux.ibm.com
Subject: Re: [PATCH 2/2] soc: fsl: guts: Add a missing memory allocation
 failure check
In-Reply-To: <4890990418ecbcfb8921efe8adb2019a03e5a1c1.1635969326.git.christophe.jaillet@wanadoo.fr>
References: <1063e5a4738d897adcaffce2ab8e4e45f07998ff.1635969326.git.christophe.jaillet@wanadoo.fr>
 <4890990418ecbcfb8921efe8adb2019a03e5a1c1.1635969326.git.christophe.jaillet@wanadoo.fr>
Date: Thu, 04 Nov 2021 17:03:47 +1100
Message-ID: <874k8s8njw.fsf@mpe.ellerman.id.au>
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
Cc: kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe JAILLET <christophe.jaillet@wanadoo.fr> writes:
> If 'devm_kstrdup()' fails, we should return -ENOMEM.
>
> While at it, move the 'of_node_put()' call in the error handling path and
> after the 'machine' has been copied.
> Better safe than sorry.
>
> Suggested-by: Tyrel Datwyler <tyreld@linux.ibm.com>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Not sure of which Fixes tag to add. Should be a6fc3b698130, but since
> another commit needs to be reverted for this patch to make sense, I'm
> unsure of what to do. :(
> So, none is given.

I think it's still correct to add:

  Fixes: a6fc3b698130 ("soc: fsl: add GUTS driver for QorIQ platforms")

That is where the bug was introduced, and adding the tag creates a link
between the fix and the bug, which is what we want.

The fact that it also requires the revert in order to apply is kind of
orthogonal, it means an automated backport of this commit will probably
fail, but that's OK it just means someone might have to do it manually.

There is some use of "Depends-on:" to flag a commit that is depended on,
but you can't use that in a patch submission because you don't know the
SHA of the parent commit.

Possibly whoever applies this can add a Depends-on: pointing to patch 1.

cheers

> ---
>  drivers/soc/fsl/guts.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
> index af7741eafc57..5ed2fc1c53a0 100644
> --- a/drivers/soc/fsl/guts.c
> +++ b/drivers/soc/fsl/guts.c
> @@ -158,9 +158,14 @@ static int fsl_guts_probe(struct platform_device *pdev)
>  	root = of_find_node_by_path("/");
>  	if (of_property_read_string(root, "model", &machine))
>  		of_property_read_string_index(root, "compatible", 0, &machine);
> -	of_node_put(root);
> -	if (machine)
> +	if (machine) {
>  		soc_dev_attr.machine = devm_kstrdup(dev, machine, GFP_KERNEL);
> +		if (!soc_dev_attr.machine) {
> +			of_node_put(root);
> +			return -ENOMEM;
> +		}
> +	}
> +	of_node_put(root);
>  
>  	svr = fsl_guts_get_svr();
>  	soc_die = fsl_soc_die_match(svr, fsl_soc_die);
> -- 
> 2.30.2
