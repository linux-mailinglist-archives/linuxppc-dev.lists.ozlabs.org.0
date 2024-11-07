Return-Path: <linuxppc-dev+bounces-3010-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A33E89C0DA4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 19:16:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xkqyc29k3z3bqB;
	Fri,  8 Nov 2024 05:16:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::227"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731003384;
	cv=none; b=fJAoa3TtLoVehzb0xyQQgRgEY2LwTvoCQ9pohNE/LLC70ShtJtc4bXgTbiJcvAp3fxybTWQUv6ruHps20VKgXMfiqHZCBxAR9HKKPbcJexsEsWpa4Ic/N81S8Dvr4Vr+rkuLwOtZEuZcpOqW0Qe6HyQKjTsAMEsiEFwz6O7CrgfQBH35DSC8kTASCq5TMUu50c7QLcHFR8ktyE3XkMO+4qLSEFIn5ECrkkJfHaje/zpNEtn3X+VqIAbP0eFbQPipIduZUo92LcJlrpnwjLQvgEG/kc3ZfkcHhK8BYoLOSaMN9bSDMwpjoRqpXyIQmeSku2npnwY5zRsQiKGLM+GW6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731003384; c=relaxed/relaxed;
	bh=7aH+YamaB5+L+7dV8UCOYyw7UnZu/8epHdr5FqD/+g8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ar3/hOkOMK0+YrutlHmrMwRK7ih+QVtzHAs6vMwF6rk0CT9g2S+Hl9s16+MH8cZY/ScI5TfY8BTdAbZCOiNL6DwXiMLOOVfKh/O7tLFcxXJCpCl06DNV5GpX0P+Jnk4u3TQo/reLhZEOATOXcg19l9W2BmHydQjV3MpuQBmRtocd6OgYUZGyt23kA3ukk+OGBMjvcAHgIrMbYAJSPqo+uRs3PPad+5vT1KJT7B8rhqA5v1oHFEt2anGVUpOKDhmEw+jeE8pp0wjw9ZR2mz+zYFMfc+0SDmgo13yLufKYKu13CWvVehVMKDyZpQAFr+3/B9rH8Ld2LwXmjB1UTvLj/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=pGQCKrzF; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::227; helo=relay7-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=pGQCKrzF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::227; helo=relay7-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkqyZ279Sz3bq4
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 05:16:21 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9DFC20005;
	Thu,  7 Nov 2024 18:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731003378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7aH+YamaB5+L+7dV8UCOYyw7UnZu/8epHdr5FqD/+g8=;
	b=pGQCKrzFC4Tjz/QbNUrWfas+lfJ3l8p0TO7a+cS3Gul4L9PmHWkojBPeePUxqTIJ/5vZAn
	OI2nE0iQF6m/GX8JOHjO7uJ6l+5pYUD8TBv1t9X9Tnu/HZIE8u1AvZlLADNHO8LL52BYkz
	PPliKyEPVRFd5ozDa+i4qYFJDKcw4OPHMVfL3HmBe/sk1Dcbb1BoIDoUZ9cwpfq4yhlGRL
	AQ8o8YKibuEqD18udqEyR1c37RkMjKGSvtmy5NLSMb5Jo/AYJB0B+kHBynMUCqszF1FW9r
	9Wz+STl+q0eTekgOIUwiIzhK+IoDBfD/Cj5CYOSer3yqGJIcUBmnEPQlkvSQjQ==
Date: Thu, 7 Nov 2024 19:16:17 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: davem@davemloft.net, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell King
 <linux@armlinux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, Herve Codina
 <herve.codina@bootlin.com>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@baylibre.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next 4/7] net: freescale: ucc_geth: Fix WOL
 configuration
Message-ID: <20241107191617.00e0584a@fedora.home>
In-Reply-To: <83151aa4-62e9-4be9-ae64-a728be004dae@lunn.ch>
References: <20241107170255.1058124-1-maxime.chevallier@bootlin.com>
	<20241107170255.1058124-5-maxime.chevallier@bootlin.com>
	<83151aa4-62e9-4be9-ae64-a728be004dae@lunn.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Andrew,

On Thu, 7 Nov 2024 18:49:00 +0100
Andrew Lunn <andrew@lunn.ch> wrote:

> > +	if (phydev)
> > +		phy_ethtool_get_wol(phydev, wol);
> > +
> >  	if (qe_alive_during_sleep())
> >  		wol->supported |= WAKE_MAGIC;  
> 
> So get WoL will return whatever methods the PHY supports, plus
> WAKE_MAGIC is added because i assume the MAC can do that. So depending
> on the PHY, it could be the full list:

> > +	if (wol->wolopts & WAKE_PHY)
> > +		ret = phy_ethtool_set_wol(phydev, wol);  
> 
> Here, the code only calls into the PHY for WAKE_PHY, when in fact the
> PHY could be handling WAKE_UCAST, WAKE_MCAST, WAKE_ARP etc.
> 
> So these conditions are wrong. It could we be that X years ago when
> this code was added only WAKE_PHY and WAKE_MAGIC existed?

Ah that's right indeed. So yeah my changes aren't enough, I'll go over
that patch again.

Thanks for spotting this,

Maxime

