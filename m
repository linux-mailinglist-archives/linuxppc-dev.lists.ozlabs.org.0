Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2034F8CE3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 05:55:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZPXX2dGkz3bfC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 13:55:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=avEXtVrk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1;
 helo=sin.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=avEXtVrk; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZPWt5bmLz2xBv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Apr 2022 13:54:34 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 616C0CE29C1;
 Fri,  8 Apr 2022 03:54:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FD55C385A1;
 Fri,  8 Apr 2022 03:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649390068;
 bh=XvrZjZaX5Rsi5fiZFoDR7A0z44p/01oSQz1BX2ODyvU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=avEXtVrk7mOyW8zohyzfG6CeVAW9WHmglJH2zFNO6BqivVAiwRFXM5FysYbfpSW4R
 e5ioNTKU9dR9CdSfVo/qzoEX+KFzJXpGKeUC7RYWphXdJ9lD7QEgvw1cEHhAK3riim
 SfLqUUEiyZ6Fo9fMpvbleZcmaOnWtrU+CsAVL3b/ftZoe3QS1owYNeov9z652aNwns
 +dhbMjxfJFqASqlpcBfHfh/dNAHNoXw1FYbDqttp1G+Tba1An+xtmjAldSlNV81Un0
 hXlyPc0jm4HYBSy2zICqZdHsaMx79AWrW1iGEJpX+m85MDo32q6JDwBzIWVYqdGVM3
 4k9iubEHtRGQg==
Date: Thu, 7 Apr 2022 20:54:26 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jakob Koschel <jakobkoschel@gmail.com>
Subject: Re: [PATCH net-next 02/15] net: dsa: sja1105: Remove usage of
 iterator for list_add() after loop
Message-ID: <20220407205426.6a31e4b2@kernel.org>
In-Reply-To: <20220407102900.3086255-3-jakobkoschel@gmail.com>
References: <20220407102900.3086255-1-jakobkoschel@gmail.com>
 <20220407102900.3086255-3-jakobkoschel@gmail.com>
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
 Steen Hegelund <Steen.Hegelund@microchip.com>, "Bos, 
 H.J." <h.j.bos@vu.nl>, linux-arm-kernel@lists.infradead.org,
 Martin Habets <habetsm.xilinx@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
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

On Thu,  7 Apr 2022 12:28:47 +0200 Jakob Koschel wrote:
> diff --git a/drivers/net/dsa/sja1105/sja1105_vl.c b/drivers/net/dsa/sja1105/sja1105_vl.c
> index b7e95d60a6e4..cfcae4d19eef 100644
> --- a/drivers/net/dsa/sja1105/sja1105_vl.c
> +++ b/drivers/net/dsa/sja1105/sja1105_vl.c
> @@ -27,20 +27,24 @@ static int sja1105_insert_gate_entry(struct sja1105_gating_config *gating_cfg,
>  	if (list_empty(&gating_cfg->entries)) {
>  		list_add(&e->list, &gating_cfg->entries);
>  	} else {
> -		struct sja1105_gate_entry *p;
> +		struct sja1105_gate_entry *p = NULL, *iter;
>  
> -		list_for_each_entry(p, &gating_cfg->entries, list) {
> -			if (p->interval == e->interval) {
> +		list_for_each_entry(iter, &gating_cfg->entries, list) {
> +			if (iter->interval == e->interval) {
>  				NL_SET_ERR_MSG_MOD(extack,
>  						   "Gate conflict");
>  				rc = -EBUSY;
>  				goto err;
>  			}
>  
> -			if (e->interval < p->interval)
> +			if (e->interval < iter->interval) {
> +				p = iter;
> +				list_add(&e->list, iter->list.prev);
>  				break;
> +			}
>  		}
> -		list_add(&e->list, p->list.prev);
> +		if (!p)
> +			list_add(&e->list, gating_cfg->entries.prev);

This turns a pretty slick piece of code into something ugly :(
I'd rather you open coded the iteration here than make it more 
complex to satisfy "safe coding guidelines".

Also the list_add() could be converted to list_add_tail().
