Return-Path: <linuxppc-dev+bounces-941-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CFB96AC8C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 00:55:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wz1Dw0z99z2xjh;
	Wed,  4 Sep 2024 08:55:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725404144;
	cv=none; b=CBuQXGarD+QXLu/Ayr55MNp9DTEpxhQZDIz70dPAcLEj3T7QkwbNJccqGKDtShVetxE/+ysAJx6Y+aYrfPt7qEkBxGeBo388xzdyN5KmhNkNNCp33JMtDT+mp9/IjZ1u7jCp+Auf/1k7JUUNPY+Mie2m24GaFSiBOp+pnk7mWc6MTdG+vbEhLi7NuZ+7E85yBFpKv9P8AN4CI0VDyEl181Cu8SqkM37iFILdMeMxhHb20oWS4GnAhjD5uRDngLUTOktdcwizEilBodvdTiRnpWF8Xs+JLHm+RBwxHatwyyXUYuqccu7it9LEjhHLkd5y3XVlnsUePSMFSrpluN5h1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725404144; c=relaxed/relaxed;
	bh=CbaWqDovG+ohtkpCOQ3fg4acmFkRuPzG7NgRf1Zltsg=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=nkbf93xluVThiTy6u2ru7ZzuxgbQwMV7YQBDXTfbrfMDUl9kR979WCSV4htkvdl8O0UD3XP9CUdrxjXS3FkmhfLImAzExCu1pvEuZKn9+CfhdtLr771QYqYtRvaseijRqa04E/V+EJJPdBLorHoJ3MI0NlSupNus/xyn6tl9ZOUTrqo3NueX4SkX6uRsv7qtMyJTF5SkuWKayVHjg5fs1rOvyfYVcYZH91SjrkXkMBvY2M/Zx+gSn0OjTA/TYOAjhCaTZRdAu+lHaJ9V4VqiEWQOd4yZXzdIuTKDhjllD1i4nJOGxdq503bVITQVrZnS6Ht8/3cPBP85cOzqe6K5rw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NRlwE7Lv; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NRlwE7Lv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wz1Dv6DmGz2xdw
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 08:55:43 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 49150A4400B;
	Tue,  3 Sep 2024 22:55:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6410EC4CEC4;
	Tue,  3 Sep 2024 22:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725404139;
	bh=JaFeuTgF5zkNdK6dIe1LkaFh5oqtU0LVvqZXpKHmJ4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NRlwE7LvocDygbDhIt5g8nT6IbP52AIzW+TpfoYqne4Y4W56FzQIU1lS/Fl83xPJA
	 w6UMPMDvkrdQHJ5UJ5MGPebfjrxDgk49mGWgmR/GZoDkCV4tNGya/RHngnTKhlN5GC
	 P/mHemNWkgkbmcUr3sPPs9ROmLh4fFLML/4nPYwrF9XHsUSoIp9EMR61R0o7obXd/c
	 A5iL0S0yjha5eEMpnEAuA2frZEit4Bj+IKiSWh8Yggq0S/mIbStNOMU85gwGEtEEY+
	 GarctGUW2gaEnOXxzQV9rxbcRjju9E8BUUN01y8IWZ8m/JeqVCb5+Y42UGMCVZeb7W
	 xgAIYBPilOqDg==
Date: Wed, 4 Sep 2024 00:55:35 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Ma Ke <make24@iscas.ac.cn>, jochen@scram.de, grant.likely@linaro.org, 
	thierry.reding@gmail.com, rob.herring@calxeda.com, linuxppc-dev@lists.ozlabs.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] of/irq: handle irq_of_parse_and_map() errors
Message-ID: <u4qlhdhmya5pwfboffbuvmgabmmpjxh6dfqptw65k5fiiaeqoy@pnmzj2lgh5z4>
References: <20240830142127.3446406-1-make24@iscas.ac.cn>
 <90924209-888d-4ff3-8f60-f82a073bcf1c@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90924209-888d-4ff3-8f60-f82a073bcf1c@csgroup.eu>

On Tue, Sep 03, 2024 at 06:56:41PM GMT, Christophe Leroy wrote:
> Le 30/08/2024 à 16:21, Ma Ke a écrit :
> > Zero and negative number is not a valid IRQ for in-kernel code and the
> > irq_of_parse_and_map() function returns zero on error.  So this check for
> > valid IRQs should only accept values > 0.
> 
> unsigned int irq_of_parse_and_map(struct device_node *node, int index);
> 
> I can't see how an 'unsigned int' can be negative.

hehe... correct... even though looks like we are walking on a
slackline, relying too much that no one in the future, inside
irq_of_parse_and_map() (and various callers), someone will try to
fit an -ENOSOMETHING into the unsigned int.

I wouldn't mind something like this[*] to ensure I can sleep
soundly.

Thanks for the review,
Andi

[*]
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index cea8f6874b1fb..df44a8ffa6843 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -954,6 +954,8 @@ unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
 out:
        mutex_unlock(&domain->root->mutex);

+       BUG_ON(virq < 0);
+
        return virq;
 }
 EXPORT_SYMBOL_GPL(irq_create_fwspec_mapping);

> Christophe
> 
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: f7578496a671 ("of/irq: Use irq_of_parse_and_map()")
> > Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> > ---
> >   drivers/i2c/busses/i2c-cpm.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c
> > index 4794ec066eb0..41e3c95c0ef7 100644
> > --- a/drivers/i2c/busses/i2c-cpm.c
> > +++ b/drivers/i2c/busses/i2c-cpm.c
> > @@ -435,7 +435,7 @@ static int cpm_i2c_setup(struct cpm_i2c *cpm)
> >   	init_waitqueue_head(&cpm->i2c_wait);
> >   	cpm->irq = irq_of_parse_and_map(ofdev->dev.of_node, 0);
> > -	if (!cpm->irq)
> > +	if (cpm->irq <= 0)
> >   		return -EINVAL;
> >   	/* Install interrupt handler. */

