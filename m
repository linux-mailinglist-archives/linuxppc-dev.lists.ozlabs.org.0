Return-Path: <linuxppc-dev+bounces-16952-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIWFDIdZl2lPxAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16952-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 19:42:15 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DA1161C0E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 19:42:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fH2Kt3qVMz30GV;
	Fri, 20 Feb 2026 05:42:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771526530;
	cv=none; b=g0gVeMjHtodOBh6KMFFDsDS7SFPmH3WqN8WshFEdHG9OjzM1SnSC1s42TmEz7U3cLhMHh5ma0M7dsqt6N+JApCvjrlOsZk0M8cL/rTDN6PkNFSh/uaq6rYZ7yG3i3v9ZkQe7+mqjUkTGfSNz8Sk3CNoivwORYRxezjGH7Os1dgpGfs+Sx4U3DLWTnkKj6aNT+LrbiZj9pRl8XLkczdDftAJlwOxvvInFP0EhTmn10XNctmbj+G9hclEVvJexjJLGtPtaInJxqXlWJAuPaK2CuiBn/3mf37Hq89ajXQlhi7oz9YX09Sh7iFS4rgA/medJJmAeXeArVxWq7n/KQA9HZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771526530; c=relaxed/relaxed;
	bh=XMZYMKCfRO1P00AFy8aKMQ+jjXDkHAdCnmx8W4egAKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eU1EvSnTkRuufVIIgmQS/kS6EZDhrW7h+zP/4VEz6fCTPov90D9fvgzwszTizNfBwxI00CVfZFOjHicKeJszrO8aHPEX7tjYcnF2rjOhwxXmss7JS6kWiXw8RFrs+0RgpsOHKKS+17BF60ghs11nXuuKX+ByWyJIrBsThZkgXbZ7dXX+WIKDuTHlynBu7oZKvIH1K4+hQR5cnysRPdvplw+wgUYbiS8NHsbbipnRG4uD2YpDNxjN6G2IoOrHnR0rVnUXu1m6t047Gjp2deCva44GQ1SCWXMh7a98UiThKBPfvSGhDgRSB/RL5hS+/ac+DXtNEUAQPFvA3p0zERtPTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=rR28TUEv; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=rR28TUEv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fH2Kr5b3bz2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Feb 2026 05:42:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1771526522;
	bh=6/iezbvx6MIXp+pbGoZW7PKtUMMWOusSDApm2rJKtYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rR28TUEv4Jls8PLGjd1MVfZpFs8m0ZVg+yghXO1Rb+SpBWCLpUKYvE6iUmsZPZmMr
	 RU4I4s1JnrZpD6F/GMsuVkSkQz+gB+4bLd02mur96IEHpmd2AG0aJsOIbygBFi4dFU
	 h98LqnIXxT6lINGuoHzN59SzLiZJlRy69D2g17cM=
Date: Thu, 19 Feb 2026 19:42:01 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Yury Norov <ynorov@nvidia.com>
Cc: linux-kernel@vger.kernel.org, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Andrew Morton <akpm@linux-foundation.org>, Antoine Tenart <atenart@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Eric Dumazet <edumazet@google.com>, Geetha sowjanya <gakula@marvell.com>, 
	Ingo Molnar <mingo@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	James Clark <james.clark@linaro.org>, Jerin Jacob <jerinj@marvell.com>, 
	Linu Cherian <lcherian@marvell.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Mike Leach <mike.leach@linaro.org>, Moritz Fischer <mdf@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Subbaraya Sundeep <sbhatta@marvell.com>, 
	Sunil Goutham <sgoutham@marvell.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Tom Rix <trix@redhat.com>, Xu Yilun <yilun.xu@intel.com>, Yajun Deng <yajun.deng@linux.dev>, 
	Yury Norov <yury.norov@gmail.com>, Zhang Rui <rui.zhang@intel.com>, hariprasad <hkelam@marvell.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, linux-fpga@vger.kernel.org, 
	linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org
Subject: Re: [PATCH 08/12] coresight: don't use bitmap_print_to_pagebuf()
Message-ID: <68f8d4b0-6df2-4743-bb71-f44671219931@t-8ch.de>
References: <20260219181407.290201-1-ynorov@nvidia.com>
 <20260219181407.290201-9-ynorov@nvidia.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219181407.290201-9-ynorov@nvidia.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16952-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[linux@weissschuh.net,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,davemloft.net,infradead.org,linux.intel.com,lunn.ch,linux-foundation.org,linaro.org,google.com,marvell.com,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,redhat.com,rasmusvillemoes.dk,fomichev.me,intel.com,linux.dev,lists.linaro.org,lists.infradead.org,lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[44];
	FORGED_RECIPIENTS(0.00)[m:ynorov@nvidia.com,m:linux-kernel@vger.kernel.org,m:chleroy@kernel.org,m:davem@davemloft.net,m:peterz@infradead.org,m:rafael@kernel.org,m:alexander.shishkin@linux.intel.com,m:andrew+netdev@lunn.ch,m:akpm@linux-foundation.org,m:atenart@kernel.org,m:brauner@kernel.org,m:daniel.lezcano@linaro.org,m:edumazet@google.com,m:gakula@marvell.com,m:mingo@kernel.org,m:kuba@kernel.org,m:james.clark@linaro.org,m:jerinj@marvell.com,m:lcherian@marvell.com,m:lukasz.luba@arm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:mike.leach@linaro.org,m:mdf@kernel.org,m:npiggin@gmail.com,m:pabeni@redhat.com,m:linux@rasmusvillemoes.dk,m:horms@kernel.org,m:sdf@fomichev.me,m:sbhatta@marvell.com,m:sgoutham@marvell.com,m:suzuki.poulose@arm.com,m:trix@redhat.com,m:yilun.xu@intel.com,m:yajun.deng@linux.dev,m:yury.norov@gmail.com,m:rui.zhang@intel.com,m:hkelam@marvell.com,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-fpga@vger.kernel.org,m:linux-pm@vger.kernel.
 org,m:linuxppc-dev@lists.ozlabs.org,m:netdev@vger.kernel.org,m:andrew@lunn.ch,m:yurynorov@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linuxppc-dev,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: A1DA1161C0E
X-Rspamd-Action: no action

Hi Yury,

On 2026-02-19 13:14:00-0500, Yury Norov wrote:
> Switch to a more common scnprintf("%*pbl") where appropriate.
> 
> Signed-off-by: Yury Norov <ynorov@nvidia.com>
> ---
>  .../hwtracing/coresight/coresight-cti-sysfs.c | 33 +++++++++----------
>  1 file changed, 15 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> index 572b80ee96fb..182c8db52a04 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> @@ -606,14 +606,11 @@ static ssize_t chan_gate_enable_show(struct device *dev,
>  	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>  	struct cti_config *cfg = &drvdata->config;
>  	unsigned long ctigate_bitmask = cfg->ctigate;
> -	int size = 0;
>  
>  	if (cfg->ctigate == 0)
> -		size = sprintf(buf, "\n");
> -	else
> -		size = bitmap_print_to_pagebuf(true, buf, &ctigate_bitmask,
> -					       cfg->nr_ctm_channels);
> -	return size;
> +		return sprintf(buf, "\n");
> +
> +	return scnprintf(buf, rest_of_page(buf), "%*pbl\n", cfg->nr_ctm_channels, &ctigate_bitmask);

For sysfs show handlers the correct formatting function is sysfs_emit()
rather than raw scnprintf(). It validates that buf is page-aligned
(which is always true for sysfs show handlers) and that the output does
not exceed PAGE_SIZE.

(...)


Thomas

