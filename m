Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFE44FA06A
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 02:05:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZwNd0Jz5z3bYZ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 10:05:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AwBP3ICs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AwBP3ICs; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZwN06hfBz2xnM
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Apr 2022 10:04:32 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2C601B82DEE;
 Sat,  9 Apr 2022 00:04:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 892C8C385A3;
 Sat,  9 Apr 2022 00:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649462665;
 bh=bd8rzBS+vEc4ttPjaHAQjZ7XjvJdbi78cn8u1jcSgnY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AwBP3ICswtwn4xr9uXInDJ4nqqlw/9l7rsH7J5AmSQ38K7fhTXA/NIsNkI3Cku5LF
 UyOlYbhACeeY/VSub9qNl02fo6GS4pMScAhZgzr371jyLskztqeh5z1ZItO+hxfMLV
 /aPzSIUVhfVwrmhDdf/FLz7WbjqYG23kHHCcNWNodIQ4ejDS5PdzQ/dHAtIGLry+hQ
 ir5v8brOrIClr3cwwWDmp3wWYO8brZ/IyRy3D1ItZTpXVEm//sr5Cwr/s/1cBmrtEG
 x7Tt7OnYb+8u5jUHUvv635ozDpZ13jxsnG+j3lNWF2SHpwUVQ3yLXRLZgCTH9fQ3Ku
 rHHyHCSlsR/Ww==
Date: Fri, 8 Apr 2022 17:04:23 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jakob Koschel <jakobkoschel@gmail.com>
Subject: Re: [PATCH net-next 02/15] net: dsa: sja1105: Remove usage of
 iterator for list_add() after loop
Message-ID: <20220408170423.35b379d9@kernel.org>
In-Reply-To: <AAB64C72-5B45-4BA1-BB48-106F08BDFF1B@gmail.com>
References: <20220407102900.3086255-1-jakobkoschel@gmail.com>
 <20220407102900.3086255-3-jakobkoschel@gmail.com>
 <20220407205426.6a31e4b2@kernel.org>
 <AAB64C72-5B45-4BA1-BB48-106F08BDFF1B@gmail.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Cristiano Giuffrida <c.giuffrida@vu.nl>,
 Eric Dumazet <edumazet@google.com>, Paul Mackerras <paulus@samba.org>,
 Ariel Elior <aelior@marvell.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Manish Chopra <manishc@marvell.com>, "David S. Miller" <davem@davemloft.net>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, "Bos, H.J." <h.j.bos@vu.nl>,
 linux-arm-kernel@lists.infradead.org, Martin Habets <habetsm.xilinx@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Bjarni Jonasson <bjarni.jonasson@microchip.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Di Zhu <zhudi21@huawei.com>, Lars Povlsen <lars.povlsen@microchip.com>,
 Colin Ian King <colin.king@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com,
 Edward Cree <ecree.xilinx@gmail.com>, Michael Walle <michael@walle.cc>,
 Xu Wang <vulab@iscas.ac.cn>, Vladimir Oltean <olteanv@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Casper Andersson <casper.casan@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 9 Apr 2022 01:58:29 +0200 Jakob Koschel wrote:
> > This turns a pretty slick piece of code into something ugly :(
> > I'd rather you open coded the iteration here than make it more 
> > complex to satisfy "safe coding guidelines".  
> 
> I'm not entirely sure I understand what you mean with 
> "open coded the iteration". But maybe the solution proposed by Vladimir [1]
> works for you?

Yup, that's what I meant!

> I'm planning to rewrite the cases in that way for the relevant ones.
>
> > Also the list_add() could be converted to list_add_tail().  
> 
> Good point, I wasn't sure if that's considered as something that should be
> done as a separate change. I'm happy to include it in v2.

Ack, separate patch would be better for that. I guess Vladimir may have
used .prev on purpose, since _tail() doesn't intuitively scream _after()
Anyway, not important.
