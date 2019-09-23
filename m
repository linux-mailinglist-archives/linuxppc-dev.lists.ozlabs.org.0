Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0602ABAE8B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 09:33:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cGJj1CPTzDqFC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 17:33:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kroah.com
 (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com;
 envelope-from=greg@kroah.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kroah.com header.i=@kroah.com header.b="IU9T2ogO"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="rdX3MdZz"; dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cGGk2ym3zDqFC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2019 17:31:35 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 8B463411;
 Mon, 23 Sep 2019 03:31:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 23 Sep 2019 03:31:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=r
 xsMSOP5XeiSeGHz7OFZXR7UFFdSRMCjzoz5TVekqzk=; b=IU9T2ogObc4GOXfVw
 cDKExsM/z4MhupAhl7wTXi58GNueTRNtjy74yhP+kR6VoJiLIM3papLy8/LBQFrw
 AZ+oAD1lE1s+tBBnyOyB/TfwpFOq95NRIPlQu2x1W26QdrS+MC2j6fAAJ1yhlGju
 PLMbWVoASchDH8pdvgqDCTq5uXT4vifxXqO324rW85IQt8MdJRDs3yYEwQfUKCDJ
 0RVQ8Yf+335PB3z8cLpdrg6Vo4nytorI5rdMD/eoC6/mxiB5xowk4DMPoep60++K
 46Xkd49bSngAMpmRvQggg114RuGmxSqbdLmyxweX4/3qIOcv6WyeMwoDc3NHQAXs
 WfgxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=rxsMSOP5XeiSeGHz7OFZXR7UFFdSRMCjzoz5TVekq
 zk=; b=rdX3MdZzimSqenjfAPRmB0LpcTlHcwTyuPRElEz7EWS1jDXStgiB0DYVo
 A6NsHHJtGWImOwcoi0EDq/E0UO0Xquj7VUBo2BWKWwdiTel1QV83+2Ixb605O69d
 VDC4Tk05Rzr65KqgyLMW98Hu/kHNQ9RIn1HFLZZnJCiPL0ih4EDZQ7uDY66Kk+x5
 2GU76AN0h/uEwg8Rm3PYw/yl9nYyg1N/ln+Kzenk2KJWYUXksEt5RYNBzkFlDe3b
 JymN5OI9TPlsVP7DLkpmahPDWQ0JEyJ6aaVUC4n02k9p8g0uvuZnJ9dLWCT6LiyN
 X2ucApqgr09EAdWRcyJJU8nINqF/Q==
X-ME-Sender: <xms:03SIXesps-KQELljUBJecmJ7kXLhMjKqIKm5WM4lSW7e2SiY85qUIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdejgdduvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjggfsehtkeertddtredunecuhfhrohhmpefirhgv
 ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucffohhmrghinhepkhgvrhhnvg
 hlrdhorhhgnecukfhppeekfedrkeeirdekledruddtjeenucfrrghrrghmpehmrghilhhf
 rhhomhepghhrvghgsehkrhhorghhrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:03SIXfznQK4LgEKDeFBju_nN68H2rKyO6cL1QSBI94T-9vUrBEZdFQ>
 <xmx:03SIXcg3XvWUxQWMtLRcatQSEqU3Zi85yD9n6aa0UQzha1704RejVg>
 <xmx:03SIXbAPL9Ts6dNraW3aTlKdx5MoYJINnGUiN0i5EH5m7CbGhx85Tg>
 <xmx:03SIXQkq_DSDv3ZxyOej92OjnYMxb-M_KaLmWaJEp4g-Cl2PFfNKkA>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id E360FD6005B;
 Mon, 23 Sep 2019 03:31:30 -0400 (EDT)
Date: Mon, 23 Sep 2019 09:31:29 +0200
From: Greg KH <greg@kroah.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] powerpc/xive: Fix bogus error code returned by OPAL
Message-ID: <20190923073129.GA2749134@kroah.com>
References: <156922009207.910857.10785273696571088534.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <156922009207.910857.10785273696571088534.stgit@bahia.lan>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 23, 2019 at 08:29:40AM +0200, Greg Kurz wrote:
> There's a bug in skiboot that causes the OPAL_XIVE_ALLOCATE_IRQ call
> to return the 32-bit value 0xffffffff when OPAL has run out of IRQs.
> Unfortunatelty, OPAL return values are signed 64-bit entities and
> errors are supposed to be negative. If that happens, the linux code
> confusingly treats 0xffffffff as a valid IRQ number and panics at some
> point.
> 
> A fix was recently merged in skiboot:
> 
> e97391ae2bb5 ("xive: fix return value of opal_xive_allocate_irq()")
> 
> but we need a workaround anyway to support older skiboots already
> in the field.
> 
> Internally convert 0xffffffff to OPAL_RESOURCE which is the usual error
> returned upon resource exhaustion.
> 
> Cc: stable@vger.kernel.org # v4.12+
> Signed-off-by: Greg Kurz <groug@kaod.org>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> Link: https://lore.kernel.org/r/156821713818.1985334.14123187368108582810.stgit@bahia.lan
> (cherry picked from commit 6ccb4ac2bf8a35c694ead92f8ac5530a16e8f2c8,
>  groug: fix arch/powerpc/platforms/powernv/opal-wrappers.S instead of
>         non-existing arch/powerpc/platforms/powernv/opal-call.c)
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
> 
> This is for 4.14 and 4.19.

Thanks for the backport, now queued up.

greg k-h
