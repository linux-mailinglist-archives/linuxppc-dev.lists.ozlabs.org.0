Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F37285FFECD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Oct 2022 13:06:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mqy426Mnlz3bsK
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Oct 2022 22:06:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WPp3Ky2G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WPp3Ky2G;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mqy342srpz2xfm
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Oct 2022 22:05:36 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3133260A56;
	Sun, 16 Oct 2022 11:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC2CC433C1;
	Sun, 16 Oct 2022 11:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665918332;
	bh=8GPCkdFugY38wC2Jh0RlLIcIb8fIVMIagkAF+T9gYAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WPp3Ky2Gph19/Aj0KRkunIdzia+wxWTLdPtZ1du3WWgoCz3adqUurOIzYkU00/Ezd
	 +GHkP00ssW3psZ1tfkh+xazTAfCuWsIs0Dam5TET4d6vuAEDNe926b4V3WdfJ3m57I
	 V2TImuWgw3xBoAP+dMcLyt5NT6UrNdIej3eqdA8PXpivAKMGU4xs7sI3lQDrWyT4HW
	 uajz6VhOFvQx0UUgvbfp0AXPU4BZJmxj6mJzebpoLv971ceL86wMyJNt4dxiYVuPDM
	 nC8AZqrBh+QeeRLGLRkgKDz8ZkWf90+sT3uiQWWzzb9hqiBvxAqaY01Ny9cs7HsdCu
	 5wcxfSZ3UV2Gg==
Received: by pali.im (Postfix)
	id 73E31A3A; Sun, 16 Oct 2022 13:05:29 +0200 (CEST)
Date: Sun, 16 Oct 2022 13:05:29 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 2/7] powerpc/85xx: Mark mpc85xx_ds_pic_init() as static
Message-ID: <20221016110529.76bcgq2v2h4pg2of@pali>
References: <20220819191557.28116-1-pali@kernel.org>
 <20220819191557.28116-3-pali@kernel.org>
 <fd9c174e-2c89-7e11-9e68-d6044b7eab21@csgroup.eu>
 <20220926094706.km22rqzuuulvfssq@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220926094706.km22rqzuuulvfssq@pali>
User-Agent: NeoMutt/20180716
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
Cc: Sinan Akman <sinan@writeme.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Scott Wood <oss@buserror.net>, Paul Mackerras <paulus@samba.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Christophe! Do you have any other comments for this patch series?

On Monday 26 September 2022 11:47:06 Pali Rohár wrote:
> On Monday 26 September 2022 09:43:55 Christophe Leroy wrote:
> > Le 19/08/2022 à 21:15, Pali Rohár a écrit :
> > > Function mpc85xx_ds_pic_init() is not used out of the mpc85xx_ds.c file.
> > > 
> > > Signed-off-by: Pali Rohár <pali@kernel.org>
> > 
> > This patch should be squashed into patch 1.
> 
> No problem. Just to explain that I split those changes into different
> patches because they touch different files and different board code.
> And I thought that different things should be in different patches.
> 
> > > ---
> > >   arch/powerpc/platforms/85xx/mpc85xx_ds.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/powerpc/platforms/85xx/mpc85xx_ds.c b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
> > > index f8d2c97f39bd..9a6d637ef54a 100644
> > > --- a/arch/powerpc/platforms/85xx/mpc85xx_ds.c
> > > +++ b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
> > > @@ -54,7 +54,7 @@ static void mpc85xx_8259_cascade(struct irq_desc *desc)
> > >   }
> > >   #endif	/* CONFIG_PPC_I8259 */
> > >   
> > > -void __init mpc85xx_ds_pic_init(void)
> > > +static void __init mpc85xx_ds_pic_init(void)
> > >   {
> > >   	struct mpic *mpic;
> > >   #ifdef CONFIG_PPC_I8259
