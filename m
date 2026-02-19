Return-Path: <linuxppc-dev+bounces-16968-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SsNoIVasl2nO5QIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16968-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Feb 2026 01:35:34 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F03163DD1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Feb 2026 01:35:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fHB9X3T37z2yvy;
	Fri, 20 Feb 2026 11:35:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::ab"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771545072;
	cv=none; b=HWoWPe+Vlr3jwc9dmESpnucQteroLiwxFeQC5jnS+5NxKt4Fhn/liGE/VKZfuWXRI/FGA4a8EJKy3IXRwKQCafErQml8eSejWoWwS0EEwSObK4PRQRIIZhDFV45pdkUC3FxCcF2DV7KI40r83F6DYR+QRDB1lITUPyvD5MnHycsoWBChqFNiMHKaTpg72L1Zopy24Ng6sJD0CFc5FEXpfL/SoA1lt2UYXYWeTeKULbb7oQQbl51ww2vU9jB84j86ZSHMfDUNpGwdQwgSfqb2Qdq7fF8/01LoUtKHFZOc0sicwkp2edvCVdleHszyRr+YwBehVorNSfT6xbyiBtqwJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771545072; c=relaxed/relaxed;
	bh=CRO5rWml1QK70tgKl06x/aVYyKWj/aRzqe+fxQOhkKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TP2iwuD3ihCNT1Skh7NwOusHDjdG4PRynpk/5AJBCEck9j/HJ/J9rAY1o6MZXR0yxe7xxMYxdI11Hl6wpbwKHLT+2Ud53nLtHnT9ilKjFHRB/WpAsPeLB+Oe1J+2AEM6V44/5kB7vU7NYWRskcZwCgPAeLVFcnEIuZQtxMPa7MmC51+gxXawPWx41jSjUhm074X6z2jpwgLHlGuw2EMZVnGaVx1GKYJaiNrTr7Usj+7wxx2rDYTE3ocuZO1bVmUKtQVXiV3oMvuE2iKlcuU3JF1KqyRzj4c90LdmRkAxROd56dQYDKIkgnU6XhKVMUQcz51yAo5dfC+FghDbKCnviQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fhQrXZgH; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::ab; helo=out-171.mta1.migadu.com; envelope-from=russ.weight@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fhQrXZgH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::ab; helo=out-171.mta1.migadu.com; envelope-from=russ.weight@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 391 seconds by postgrey-1.37 at boromir; Fri, 20 Feb 2026 10:51:07 AEDT
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [IPv6:2001:41d0:203:375::ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fH9BM46Mjz2xls
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Feb 2026 10:51:07 +1100 (AEDT)
Date: Thu, 19 Feb 2026 16:43:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771544647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CRO5rWml1QK70tgKl06x/aVYyKWj/aRzqe+fxQOhkKU=;
	b=fhQrXZgHJkvalaKby2C9z8kNEAxoIH1m4n89qWYP4oV4FrEttt7O/TFwSqck5NetZ+5GDD
	r85/jEND3KIXN+QZQViJ5D6/7XLpG0063G/hobulPpZrlBoCjyKRIHgQ8/tmHR3cbJhttp
	PROJqJgnuOXtp4Pi0UJPkEoNJ3l8aaM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Russ Weight <russ.weight@linux.dev>
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
Subject: Re: [PATCH 09/12] fpga: m10bmc-sec: switch show_canceled_csk() to
 using scnprintf()
Message-ID: <nsymcnuakoxcuq55csc5dsyevuftlp4vahz7yljziwnbbe7vhr@6n3kddtcuwh7>
References: <20260219181407.290201-1-ynorov@nvidia.com>
 <20260219181407.290201-10-ynorov@nvidia.com>
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
In-Reply-To: <20260219181407.290201-10-ynorov@nvidia.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16968-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ynorov@nvidia.com,m:linux-kernel@vger.kernel.org,m:chleroy@kernel.org,m:davem@davemloft.net,m:peterz@infradead.org,m:rafael@kernel.org,m:alexander.shishkin@linux.intel.com,m:andrew+netdev@lunn.ch,m:akpm@linux-foundation.org,m:atenart@kernel.org,m:brauner@kernel.org,m:daniel.lezcano@linaro.org,m:edumazet@google.com,m:gakula@marvell.com,m:mingo@kernel.org,m:kuba@kernel.org,m:james.clark@linaro.org,m:jerinj@marvell.com,m:lcherian@marvell.com,m:lukasz.luba@arm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:mike.leach@linaro.org,m:mdf@kernel.org,m:npiggin@gmail.com,m:pabeni@redhat.com,m:linux@rasmusvillemoes.dk,m:horms@kernel.org,m:sdf@fomichev.me,m:sbhatta@marvell.com,m:sgoutham@marvell.com,m:suzuki.poulose@arm.com,m:trix@redhat.com,m:yilun.xu@intel.com,m:yajun.deng@linux.dev,m:yury.norov@gmail.com,m:rui.zhang@intel.com,m:hkelam@marvell.com,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-fpga@vger.kernel.org,m:linux-pm@vger.kernel.
 org,m:linuxppc-dev@lists.ozlabs.org,m:netdev@vger.kernel.org,m:andrew@lunn.ch,m:yurynorov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[44];
	FORGED_SENDER(0.00)[russ.weight@linux.dev,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,davemloft.net,infradead.org,linux.intel.com,lunn.ch,linux-foundation.org,linaro.org,google.com,marvell.com,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,redhat.com,rasmusvillemoes.dk,fomichev.me,intel.com,linux.dev,lists.linaro.org,lists.infradead.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[russ.weight@linux.dev,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linuxppc-dev,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,linux.dev:dkim]
X-Rspamd-Queue-Id: 28F03163DD1
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 01:14:01PM -0500, Yury Norov wrote:
> Switch show_canceled_csk() to use a more common scnprintf("%*pbl").
> 
> Signed-off-by: Yury Norov <ynorov@nvidia.com>

Reviewed-by: Russ Weight <russ.weight@linux.dev>

> ---
>  drivers/fpga/intel-m10-bmc-sec-update.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/fpga/intel-m10-bmc-sec-update.c b/drivers/fpga/intel-m10-bmc-sec-update.c
> index 10f678b9ed36..5ae76b8ece18 100644
> --- a/drivers/fpga/intel-m10-bmc-sec-update.c
> +++ b/drivers/fpga/intel-m10-bmc-sec-update.c
> @@ -10,6 +10,7 @@
>  #include <linux/firmware.h>
>  #include <linux/mfd/intel-m10-bmc.h>
>  #include <linux/mod_devicetable.h>
> +#include <linux/mm.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> @@ -183,7 +184,7 @@ show_canceled_csk(struct device *dev, u32 addr, char *buf)
>  
>  	bitmap_from_arr32(csk_map, csk32, CSK_BIT_LEN);
>  	bitmap_complement(csk_map, csk_map, CSK_BIT_LEN);
> -	return bitmap_print_to_pagebuf(1, buf, csk_map, CSK_BIT_LEN);
> +	return scnprintf(buf, rest_of_page(buf), "%*pbl\n", CSK_BIT_LEN, csk_map);
>  }
>  
>  #define DEVICE_ATTR_SEC_CSK_RO(_name)						\
> -- 
> 2.43.0
> 

