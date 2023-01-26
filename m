Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B561D67DA0D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 00:56:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2yKM3qJTz3fMg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 10:56:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EjNRBD0x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EjNRBD0x;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2yJN0rXYz3000
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 10:55:32 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B8989B80DF7;
	Thu, 26 Jan 2023 23:55:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B99C433D2;
	Thu, 26 Jan 2023 23:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674777327;
	bh=b4RDpwEILaDiIt/LpUYj6ICO+dPIjXDR8ok9CctcPps=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EjNRBD0x7DqI5RWqrQB53Z5Y0dhJERyDmr8qkJ5N0IoJEoVb5kEuCBlXqazqg6NTt
	 6R1V2ndj99lVu1sCQxKtDdEvjIFacZKGSz+Lhy8uRjmFYWsORmUCS1u6B8hKs7DvvJ
	 j1FgWk9FgznH/mM6ARjb4iGeX/fRGcraMjEx28xzEE+9uopEpF5TN4NUx/rv882+aK
	 0qPw/IDwT4whMeGcK+EVs7cfVrMEUVyhvhE8ZLvKc3iXMSWP0zWUKUlOon9CyXo0NJ
	 FLHAStWX96PnCHsfv4ZDYqqht1TBsrX82BA4jCSphv+pENkmWr6WVrpyCmT4VPx0nr
	 kJTXOhmZm70/Q==
Date: Thu, 26 Jan 2023 15:55:26 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] scripts/spelling.txt: add "exsits" pattern and fix typo
 instances
Message-ID: <20230126155526.3247785a@kernel.org>
In-Reply-To: <20230126152205.959277-1-luca.ceresoli@bootlin.com>
References: <20230126152205.959277-1-luca.ceresoli@bootlin.com>
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

On Thu, 26 Jan 2023 16:22:05 +0100 Luca Ceresoli wrote:
> Fix typos and add the following to the scripts/spelling.txt:
> 
>   exsits||exists
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

You need to split this up per subsystem, I reckon :(
