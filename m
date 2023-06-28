Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F00741492
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 17:08:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=vs2gmnkN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrlMC74mpz3bTS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 01:08:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=vs2gmnkN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QrlLN5rh7z30Jc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 01:07:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=qmTXXrFz0E6R4ltZ86kan94IWacvSfn7Y1jZEOiQyFo=; b=vs2gmnkNvAn9GHzNb9dS764WOe
	DB1It/rw3/dNF0wR12aINRAE5VH3Xt406ctOWfh1l5GT6vtm5AcmZbgSdQF8qmpo+Efh/4O0T90dP
	HB4FXssXprb06ZNzlqzzAY1IT02lN/B2p6neqT6ceHbAKSNOJSZHouYFbj3cQofBagHc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qEWIh-0007qk-QH; Wed, 28 Jun 2023 16:37:43 +0200
Date: Wed, 28 Jun 2023 16:37:43 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: yunchuan <yunchuan@nfschina.com>
Subject: Re: [PATCH net-next 00/10] Remove unnecessary (void*) conversions
Message-ID: <badb3550-e157-4a31-9e49-ad184990c06d@lunn.ch>
References: <1f5652f7-7eb2-11f0-4a07-c87f2992e509@huawei.com>
 <734b846f-3235-f2e3-db06-6e852803cd7f@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <734b846f-3235-f2e3-db06-6e852803cd7f@nfschina.com>
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
Cc: irusskikh@marvell.com, kernel-janitors@vger.kernel.org, linux@armlinux.org.uk, edumazet@google.com, iyappan@os.amperecomputing.com, anthony.l.nguyen@intel.com, quan@os.amperecomputing.com, Hao Lan <lanhao@huawei.com>, qiang.zhao@nxp.com, f.fainelli@gmail.com, jesse.brandeburg@intel.com, xeb@mail.ru, intel-wired-lan@lists.osuosl.org, yangyingliang@huawei.com, kuba@kernel.org, pabeni@redhat.com, yisen.zhuang@huawei.com, ansuelsmth@gmail.com, steve.glendinning@shawell.net, keyur@os.amperecomputing.com, mostrows@earthlink.net, salil.mehta@huawei.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux@rempel-privat.de, olteanv@gmail.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, hkallweit1@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Hi, Hao Lan,
> 
> Sorry for that, I just compiled these patches in the mainline branch.
> I know now, it's also necessary to compile patches in net and net-next
> branch.
> Thanks for your reply!

net-next is also closed at the moment due to the merge window. Please
wait two weeks before reposting, by which time net-next will be open
again.

	Andrew
