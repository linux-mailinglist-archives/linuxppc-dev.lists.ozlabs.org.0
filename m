Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B73204F8BF2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 04:37:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZMqC5TlZz3bdL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 12:37:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CrkVJRLO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42b;
 helo=mail-wr1-x42b.google.com; envelope-from=ecree.xilinx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=CrkVJRLO; dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZ7xf2WWGz2xn9
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Apr 2022 03:42:28 +1000 (AEST)
Received: by mail-wr1-x42b.google.com with SMTP id c7so9030236wrd.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Apr 2022 10:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Qf5/HY0H/HARlpQawjWcubI38eU259kawMq8gp9O7d4=;
 b=CrkVJRLO1aSJixV9DWKUTF746y41oFcj/ZYQXCMA93sWiB0r8cbHO/f8LZz8KS6V2R
 VtJYpBNgDsp6YUKM35f2uF3N+8gfMhpVgeHmhzuz8xy4T8pCvh4xoKIQ25X6AicMAZXP
 deImoshAMsKtF6YC9AZ2M7IJUaUdxIiycCgtpArV5rA0mTPv8LpJEcJyarvYcnZXmNCI
 aWlfhIlk0mpOrWQ6OdxS5X8MjD75utFVj5Sl/xPB855dp78ch/LkHjf2soCCgGydwfVJ
 cTIojrIudwVz04FEA14NfrVFmBYZG7vKl9ICFrjbOEbVg9rmja7sZ7v3ms1J2iW6OXWv
 jt3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Qf5/HY0H/HARlpQawjWcubI38eU259kawMq8gp9O7d4=;
 b=cS6e6luwShKJ87MAMehi+LpKGtNxll5BrjT2/IVSVbIVXk+3n+LZEJu3/X9iHm2QUl
 4ECrrz/Ig34fJgprD/zJ0WJ78+KVkxLKQM/rB6V5wL0QsoFTk6elW6lBhYH8c3kUsb7s
 A5TfyccvvTDPLbC8XjXucxN3i+imtE8/0msCiCe+j6nLFyHlIvgmz0fVhRJvszlz5oKR
 ObOIApN9LiZSC71tAU9U5fduKjRoVQ8tBkXfD5vjvTCx+RHo+N/vyRrO3uceltNiz1oz
 myvtFWfU479UpeXXQ4IkMeYBYsn9t6oeuk6lK6vDR08Awn8Sw1fzmoZ57EHrZu30u4a0
 6yHg==
X-Gm-Message-State: AOAM532OZpUNi7vDqEVJURHYG7g9TOpZRH2es+kzYe5zgi2zpAdt/DM7
 x/kWLewqk30ZQBZFWiEpp6E=
X-Google-Smtp-Source: ABdhPJygSojkbPQ9T6nmuvpmWKE0eBxm5eOSmqhSZlDa5KHyWLaKpOYDGTp1qDvg6zbYeK2/pSW5Og==
X-Received: by 2002:adf:d222:0:b0:206:17ba:5f76 with SMTP id
 k2-20020adfd222000000b0020617ba5f76mr11454903wrh.484.1649353339722; 
 Thu, 07 Apr 2022 10:42:19 -0700 (PDT)
Received: from [192.168.1.122]
 (cpc159313-cmbg20-2-0-cust161.5-4.cable.virginm.net. [82.0.78.162])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a05600015c600b00203fa70b4ebsm21873677wry.53.2022.04.07.10.42.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 10:42:19 -0700 (PDT)
Subject: Re: [PATCH net-next 11/15] sfc: Remove usage of list iterator for
 list_add() after the loop body
To: Jakob Koschel <jakobkoschel@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
References: <20220407102900.3086255-1-jakobkoschel@gmail.com>
 <20220407102900.3086255-12-jakobkoschel@gmail.com>
From: Edward Cree <ecree.xilinx@gmail.com>
Message-ID: <4520e9c5-8871-b281-f621-ac737e64333b@gmail.com>
Date: Thu, 7 Apr 2022 18:42:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20220407102900.3086255-12-jakobkoschel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 08 Apr 2022 12:37:11 +1000
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
 Manish Chopra <manishc@marvell.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, "Bos, H.J." <h.j.bos@vu.nl>,
 linux-arm-kernel@lists.infradead.org, Martin Habets <habetsm.xilinx@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Bjarni Jonasson <bjarni.jonasson@microchip.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakub Kicinski <kuba@kernel.org>, Di Zhu <zhudi21@huawei.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Colin Ian King <colin.king@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com,
 Michael Walle <michael@walle.cc>, Xu Wang <vulab@iscas.ac.cn>,
 Vladimir Oltean <olteanv@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Casper Andersson <casper.casan@gmail.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 07/04/2022 11:28, Jakob Koschel wrote:
> In preparation to limit the scope of a list iterator to the list
> traversal loop, use a dedicated pointer to point to the found element [1].
> 
> Before, the code implicitly used the head when no element was found
> when using &pos->list. Since the new variable is only set if an
> element was found, the list_add() is performed within the loop
> and only done after the loop if it is done on the list head directly.
> 
> Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>

The commit message doesn't accurately describe the patch; it states
 that "the list_add() is performed within the loop", which doesn't
 appear to be the case.
Also it seems a bit subtle to use `head` as both the head of the
 list to iterate over and the found entry/gap to insert before; a
 comment explaining that wouldn't go amiss.
(I'd question whether this change is really an improvement in this
 case, where the iterator really does hold the thing we want at the
 end of the search and so there's no if(found) special-casing —
 we're not even abusing the type system, because efx->rss_context
 is of the same type as all the list entries, so ctx really is a
 valid pointer and there shouldn't be any issues with speculative
 accesses or whatever — but it seems Linus has already pronounced
 in favour of the scope limiting, and far be it from me to gainsay
 him.)

-ed

> ---
>  drivers/net/ethernet/sfc/rx_common.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/sfc/rx_common.c b/drivers/net/ethernet/sfc/rx_common.c
> index 1b22c7be0088..a8822152ff83 100644
> --- a/drivers/net/ethernet/sfc/rx_common.c
> +++ b/drivers/net/ethernet/sfc/rx_common.c
> @@ -563,8 +563,10 @@ struct efx_rss_context *efx_alloc_rss_context_entry(struct efx_nic *efx)
>  
>  	/* Search for first gap in the numbering */
>  	list_for_each_entry(ctx, head, list) {
> -		if (ctx->user_id != id)
> +		if (ctx->user_id != id) {
> +			head = &ctx->list;
>  			break;
> +		}
>  		id++;
>  		/* Check for wrap.  If this happens, we have nearly 2^32
>  		 * allocated RSS contexts, which seems unlikely.
> @@ -582,7 +584,7 @@ struct efx_rss_context *efx_alloc_rss_context_entry(struct efx_nic *efx)
>  
>  	/* Insert the new entry into the gap */
>  	new->user_id = id;
> -	list_add_tail(&new->list, &ctx->list);
> +	list_add_tail(&new->list, head);
>  	return new;
>  }
>  
> 

