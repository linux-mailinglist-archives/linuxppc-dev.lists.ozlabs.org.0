Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FC3730E0D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 06:23:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PTLVkEDs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhTgl2RJ2z3bYg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 14:23:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PTLVkEDs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhTft6GBVz304q
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 14:23:02 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 07FF760E97;
	Thu, 15 Jun 2023 04:23:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DCC2C433C8;
	Thu, 15 Jun 2023 04:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686802980;
	bh=5N8o/o183j5+lfPlQ9NzHLSv4tXsodrtqqQYeYdS7gE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PTLVkEDsiteFJLDXoFGOgt+0xzq7y8tzKRTOmXVRjARB8agqVlRCu/pvfnV2qmz5T
	 7hb9CpjBWpKBzpJXfXCuU0GJRlte2Q+t23mJWB47FORChvCGRTaeHoBFqeODWY4MA8
	 d5OpZIh7nApaCk2eUHsnokS1reIcw4+Z9VlV/2osFI9Bh0t7EiV4/vWfiFl2V5O8ZW
	 PbLUbqeYXmqcg6oRp2y4RhSrJGXaOSr1swt9PjTCAmuraOT53Wfu539PCwLBQsf5rX
	 rQQMGigKfhCdZ9nwsy7KpJXfNyXXiQJqWBWxXdXXAfzPjOLCSStDdqQ3WjIqPqs1cE
	 hmoZf3L4sC7kg==
Date: Wed, 14 Jun 2023 21:22:59 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH net-next] eth: fs_enet: fix print format for resource
 size
Message-ID: <20230614212259.1e19900c@kernel.org>
In-Reply-To: <4ebd2741-1788-dc05-2d04-448f3fea17ab@infradead.org>
References: <20230615035231.2184880-1-kuba@kernel.org>
	<4ebd2741-1788-dc05-2d04-448f3fea17ab@infradead.org>
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
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 14 Jun 2023 21:02:33 -0700 Randy Dunlap wrote:
> On 6/14/23 20:52, Jakub Kicinski wrote:
> > Randy forwarded report from Stephen that on PowerPC:  
> 
> Stephen forwarded report from Randy?
> 
> netdev & pantelis were cc-ed...

Ah, I misread, you were reporting to Stephen the status for the latest
linux-next!

https://lore.kernel.org/all/8f9f8d38-d9c7-9f1b-feb0-103d76902d14@infradead.org/

Seems obvious in hindsight, sorry. I'll reword when applying.

> > drivers/net/ethernet/freescale/fs_enet/mii-fec.c: In function 'fs_enet_mdio_probe':
> > drivers/net/ethernet/freescale/fs_enet/mii-fec.c:130:50: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t' {aka 'long long unsigned int'} [-Wformat=]
> >   130 |         snprintf(new_bus->id, MII_BUS_ID_SIZE, "%x", res.start);
> >       |                                                 ~^   ~~~~~~~~~
> >       |                                                  |      |
> >       |                                                  |      resource_size_t {aka long long unsigned int}
> >       |                                                  unsigned int
> >       |                                                 %llx
> > 
> > Use the right print format.
> > 
> > Untested, I can't repro this warning myself. With or without
> > the patch mpc512x_defconfig builds just fine.
> > 
> > Link: https://lore.kernel.org/all/8f9f8d38-d9c7-9f1b-feb0-103d76902d14@infradead.org/
> > Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> > ---
> > CC: Randy Dunlap <rdunlap@infradead.org>
> > CC: pantelis.antoniou@gmail.com
> > CC: linuxppc-dev@lists.ozlabs.org  
> 
> I'm using gcc-12.2.0.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thank you! GCC 11.1 here, FWIW.
