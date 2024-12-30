Return-Path: <linuxppc-dev+bounces-4517-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7B99FE3ED
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Dec 2024 09:48:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YM8rl0DTZz2ykZ;
	Mon, 30 Dec 2024 19:48:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:242:246e::2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735548502;
	cv=none; b=PNl9lapeMKT4ukD4mcS9FWtmDR+4ALxl1GIhOE7yCrqOfJdnSlj6MQjc4R1/TR15g4nMs1FRqAbOVGbDylDI58tpAIh5PdDgHlvqXTkzYQCjpWeDMsVjd98hWAVPZIPzEnd2nugCUqKc7LUe1ITj+k0PpohhGcOYp/CwAkgAlKt1dQF5g0h2eJkVQeuUNUFsO+UI7WcQo3w6N4xfTWtQBwViv3w+03wYPe+SdRGOEWMC4u9t/OdGpMowB4WhSop+Aj5VGqZo1Czp7Da/spkEXTfMcre3jKI5XzYA5BJ8t55yaeAkv3P1bIF6zkvLWaaCkpYN+8imuif9KhcAh4n6rg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735548502; c=relaxed/relaxed;
	bh=hKke8sGGINCImp0epVWbfl1Lh5lnzQ6cg5cR2+VSiCI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zvqn6tCb5bADOVcq1nAbp89QgEukjBUNlKOLt7pLXBQ4PFKfKVSI76hEjpW66yvnA64SGa/ntQWwRker5Zw/7gdEEa2Dgrdgm+mfE7pabQiXqEVz3lCoge44ZRC7uLdCPFzPcp+5bW9w8W9JRXpvpppQ3qn62NK2xLAQNIwdyebFvMwfb0GCKL1/BmjrfrWzENsyJjhNx6/grifE22tShIdJqAU9NR+DJF0UhIHasNe1XaVFX27KGfCPIFWVasqQD/jIP1ueO7cuhJ+s1iaA4EDrCe3Hm1pJLJE7pKQqx3rViqGKeicgRDDlrZBU1Cpae8fNm3NqM5M9U1YPfhG/Uw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; dkim=pass (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=dv3vK5mI; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:242:246e::2; helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net; receiver=lists.ozlabs.org) smtp.mailfrom=sipsolutions.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=dv3vK5mI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sipsolutions.net (client-ip=2a01:4f8:242:246e::2; helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 1526 seconds by postgrey-1.37 at boromir; Mon, 30 Dec 2024 19:48:21 AEDT
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YM8rj1xY3z2yXY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2024 19:48:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=hKke8sGGINCImp0epVWbfl1Lh5lnzQ6cg5cR2+VSiCI=;
	t=1735548501; x=1736758101; b=dv3vK5mIbF42egV4r+VnRFqa3TrO9R1x1AmG8wneuIevBSO
	kEMvdpAT9Kz7UZGKcM00e+sL7f/cd8rwoBmHD0KrBdFbgOKK++iWkBBnB9tc+BZJvR73kry2OMY4H
	4PskyZmr5X2x5e1ytBFA4N/f5V5hT7leLkAzRhhMwloYbMQaloSKpL39MUJqjvDH6VHMev3p2AAHI
	oXxNdOWwKFOK6jXg6/PuS5stJhscAZZbD7EocmfC26MtDEm7Kqi19qpUgE/iRw7gkX73EJjj5TfuS
	4mvXQcRMkUeOF+ku2xy7TbeLJpQ5Uvj7n3wbJVW1spyfQFy4MI5fIpOiSPxvPWNA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1tSB2k-0000000FtmF-0Qhn;
	Mon, 30 Dec 2024 09:22:30 +0100
Message-ID: <b811d4af6a634d61389dfefacd49853c0e77f1d7.camel@sipsolutions.net>
Subject: Re: [PATCH] net: ethernet: toshiba: ps3_gelic_wireless: Remove
 driver using deprecated API wext
From: Johannes Berg <johannes@sipsolutions.net>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>, Andrew Lunn	
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet	 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni	 <pabeni@redhat.com>, Geoff Levand <geoff@infradead.org>, Simon
 Horman	 <horms@kernel.org>, Alexander Lobakin
 <aleksander.lobakin@intel.com>, 	netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>, Alexandre Belloni	
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
  Geert Uytterhoeven <geert@linux-m68k.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jeff Johnson	 <quic_jjohnson@quicinc.com>,
 Larry Finger <Larry.Finger@lwfinger.net>,  Nicolas Ferre
 <nicolas.ferre@microchip.com>, Pavel Machek <pavel@ucw.cz>, Stanislaw
 Gruszka <stf_xl@wp.pl>,  Gregory Greenman <gregory.greenman@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org, Arnd
 Bergmann	 <arnd@arndb.de>, Stefan Lippers-Hollmann <s.l-h@gmx.de>
Date: Mon, 30 Dec 2024 09:22:28 +0100
In-Reply-To: <20241224080755.194508-1-philipp.g.hortmann@gmail.com>
References: <20241224080755.194508-1-philipp.g.hortmann@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
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
X-malware-bazaar: not-scanned
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 2024-12-24 at 09:07 +0100, Philipp Hortmann wrote:
> Driver was contributed in 2008.
>=20
> The following reasons lead to the removal:
> - This driver generates maintenance workload for itself and for API wext

So I've been wondering, why are you so concerned about this? And in
particular, more concerned about it than the people actually doing the
maintenance? :)

We got here because I removed a *staging* driver that was in the way of
some wext cleanups, but that had a thousand other reasons to never go
anywhere anyway.

> - wext is deprecated and only used by two wireless drivers in
>   mainline kernel

true

> - no progress changing to mac80211

It fundamentally cannot be converted to mac80211, it has a whole
different model. In fact it cannot even be converted to cfg80211 because
some APIs it uses just never existed there, and likely never will.

> Tested a rebased version of this patch on the Playstation 3. Used
> T2 Linux with Kernel 6.12.5 to test the Ethernet connection.
>=20

Arguably that's a pretty strong argument for *not* removing it, if it's
actually relatively simple today to bring up the latest kernel on a PS3.

johannes

