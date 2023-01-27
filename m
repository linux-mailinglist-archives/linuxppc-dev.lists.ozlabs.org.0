Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0B967DF16
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 09:28:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P39gy0jPVz3fFY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 19:28:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=kz/9gVbM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::222; helo=relay2-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=kz/9gVbM;
	dkim-atps=neutral
X-Greylist: delayed 61502 seconds by postgrey-1.36 at boromir; Fri, 27 Jan 2023 19:27:24 AEDT
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P39g00gbqz3fCY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 19:27:21 +1100 (AEDT)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 35C3440012;
	Fri, 27 Jan 2023 08:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674808033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lv7ewrCAvVErHpI7gEVltoemr6ftqALjKTyaA7BAA5M=;
	b=kz/9gVbMcBfzuF5NuB1JYn52NbhQxvOpuk40tZWkVTEp4NsySfuSzWFlpCej5onQD8DtzC
	TSvDRXO2FoUtFg58DJ+T4Kp1A05artpCbwJyzPxAMu6aT5J42TUKlP2Ahl3F2bbzOLAFfT
	yq/L+/a1ISoDaJ5c7t87knlCgdcMZlbaeXYZsBy4HfnltPkZbHI7O7j5PTxWBOC6Tb3pgT
	WhR7dR81Hy0quUooSXLcpK65PjfzBuPzCmkykN6yAFeCf29yx85clMRykicEWo7UhPBsoY
	EIGWH9Zi7KpFFM9Uhti1pxW/C65tfZpOf0z/mu++BuZh75AMGo3iDewPiLBsUA==
Date: Fri, 27 Jan 2023 09:27:08 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH] scripts/spelling.txt: add "exsits" pattern and fix typo
 instances
Message-ID: <20230127092708.43247f7e@booty>
In-Reply-To: <20230126155526.3247785a@kernel.org>
References: <20230126152205.959277-1-luca.ceresoli@bootlin.com>
	<20230126155526.3247785a@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: dev@openvswitch.org, alsa-devel@alsa-project.org, Leon Romanovsky <leon@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Pravin B Shelar <pshelar@ovn.org>, Nicolin Chen <nicoleotsuka@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Fabio Estevam <festevam@gmail.com>, Colin Ian King <colin.i.king@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Jakub,

thanks for our review.

On Thu, 26 Jan 2023 15:55:26 -0800
Jakub Kicinski <kuba@kernel.org> wrote:

> On Thu, 26 Jan 2023 16:22:05 +0100 Luca Ceresoli wrote:
> > Fix typos and add the following to the scripts/spelling.txt:
> > 
> >   exsits||exists
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>  
> 
> You need to split this up per subsystem, I reckon :(

Ironically, it was the case initially but I have squashed my commits
based on several prior commits that do it together. Now I rechecked
and it seems like this happened only until July 2019, so apparently the
policy has changed. Will split.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
