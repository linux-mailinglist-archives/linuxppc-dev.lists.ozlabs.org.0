Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 326C667EFFC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 21:53:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3VDG74dDz3fF2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 07:53:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=R5OFcqos;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=R5OFcqos;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3VCJ5bDgz3cfh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 07:52:59 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id ADE0CB821E5;
	Fri, 27 Jan 2023 20:52:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA0AFC433D2;
	Fri, 27 Jan 2023 20:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1674852774;
	bh=EI2Cd7DddQ4cHwZUEfRyPJFASLDITgFJfNb4SBvJYLw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=R5OFcqos3HQAWVVDc/HnM15Sr+c+WZRBXzeCBu/YpesDbR+NFyB63Ki/LLNuDBZ2f
	 hS07f2aywYK3zr3NoQh8p+ko9QG+Q9imfg82EVJHMXw1fLXczGfnCKUiEsrdNG86js
	 60MpZ4Ka+SfAAhLTam2Bm0hf/FhlTGzPly4haWIM=
Date: Fri, 27 Jan 2023 12:52:53 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] scripts/spelling.txt: add "exsits" pattern and fix typo
 instances
Message-Id: <20230127125253.0cee02d6e286b5f7ac63dab6@linux-foundation.org>
In-Reply-To: <20230127092708.43247f7e@booty>
References: <20230126152205.959277-1-luca.ceresoli@bootlin.com>
	<20230126155526.3247785a@kernel.org>
	<20230127092708.43247f7e@booty>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
Cc: dev@openvswitch.org, alsa-devel@alsa-project.org, Leon Romanovsky <leon@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Pravin B Shelar <pshelar@ovn.org>, Nicolin Chen <nicoleotsuka@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>, Colin Ian King <colin.i.king@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 27 Jan 2023 09:27:08 +0100 Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> > On Thu, 26 Jan 2023 16:22:05 +0100 Luca Ceresoli wrote:
> > > Fix typos and add the following to the scripts/spelling.txt:
> > > 
> > >   exsits||exists
> > > 
> > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>  
> > 
> > You need to split this up per subsystem, I reckon :(
> 
> Ironically, it was the case initially but I have squashed my commits
> based on several prior commits that do it together. Now I rechecked
> and it seems like this happened only until July 2019, so apparently the
> policy has changed. Will split.

It's not worth the effort.  I'll send the patch upstream as-is.
