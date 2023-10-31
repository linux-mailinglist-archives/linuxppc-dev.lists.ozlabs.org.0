Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 733EF7DC918
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 10:09:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VblEe006;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SKPT72s7Tz3cWD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 20:08:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VblEe006;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kvalo@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SKPSC0XsKz2yVN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Oct 2023 20:08:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 229A860E09;
	Tue, 31 Oct 2023 09:08:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84EEBC433C8;
	Tue, 31 Oct 2023 09:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698743286;
	bh=feIBOznLOh65axwYyiiYpq9McN8nBddJCuTkou94EY8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=VblEe006dkOhHKFV8lXYkjBoV+/BKggu8KsI5kMIAb2Q1426nw4dRAAVoYwb69UEw
	 G4GLrarHQQVvZuXCYCZpQm3MzyKeWeBmJjvlgQ6PMCq7xr4I4hB0HHfGshV2oZUG15
	 X6DMTAU3M/qqtSGFor+HnXWdZfMMByBst6bHmnUyfk/boW/rAygCoryItoD82ouGdQ
	 F5rgczw5G1IKtPxgez4yKfn8OvhBZ5q4umOXcv+za1DnTK33HU98GoVwOWr045jrBq
	 m/rH+Oca3fkh8qYaRN6iMziupF3suM3KgYmJZfX4wsLpF+TVmwMsBaFclHecefyoKM
	 WMmuIxn5gT6Nw==
From: Kalle Valo <kvalo@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 00/10] Remove obsolete and orphaned wifi drivers
References: <20231023131953.2876682-1-arnd@kernel.org>
Date: Tue, 31 Oct 2023 11:08:00 +0200
In-Reply-To: <20231023131953.2876682-1-arnd@kernel.org> (Arnd Bergmann's
	message of "Mon, 23 Oct 2023 15:19:42 +0200")
Message-ID: <874ji7w45r.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Stanislaw Gruszka <stf_xl@wp.pl>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Geoff Levand <geoff@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-wireless@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Nicolas Ferre <nicolas.ferre@microchip.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Pavel Machek <pavel@ucw.cz>, Gregory Greenman <gregory.greenman@intel.com>, Jakub Kicinski <kuba@kernel.org>, Johannes Berg <johannes@sipsolutions.net>, Jeff Johnson <quic_jjohnson@quicinc.com>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Larry Finger <Larry.Finger@lwfinger.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> As discussed previously, a lot of the older wifi drivers are likely
> entirely unused, Though we can't know for sure.
>
> As suggested by both Greg and Jakub, let's remove the ones that look
> are most likely to have no users left and also get in the way of the
> wext cleanup. If anyone is still using any of these, we can revert the
> driver removal individually.
>
> I would suggest merging these for net-next after 6.7-rc1 is out, to give
> them the maximum amount of time for users to speak up before a release
> comes out.
>
> This kills off all pcmcia wifi drivers, and all wext users in
> drivers/net/wireless, but not the ps3-gelic-wireless driver in
> drivers/net/ethernet, or the staging drivers.
>
> In staging, rtl8192u was already removed in the meantime, while rtl8712
> and rtl8192e are apparently still used.  I have not been able to find
> out whether ks7010 is still in use.
>
> 	Arnd
>
> Link: https://lore.kernel.org/lkml/20231011080955.1beeb010@kernel.org/
>
>
> Arnd Bergmann (10):
>   wifi: libertas: drop 16-bit PCMCIA support
>   wifi: atmel: remove wext style at76c50x drivers
>   wifi: remove orphaned cisco/aironet driver
>   wifi: remove obsolete hostap driver
>   wifi: remove orphaned zd1201 driver
>   wifi: remove orphaned orinoco driver
>   wifi: remove orphaned ray_cs driver
>   wifi: remove orphaned wl3501 driver
>   wifi: remove orphaned rndis_wlan driver
>   [RFC] wifi: remove ipw2100/ipw2200 drivers

I manually applied these 9 to wireless-next:

4b478bf6bdd8 wifi: libertas: drop 16-bit PCMCIA support
77e49bec6414 wifi: atmel: remove wext style at76c50x drivers
6853c70ba5ed wifi: remove orphaned cisco/aironet driver
d0172d5f7576 wifi: remove obsolete hostap driver
757a46c2a7a9 wifi: remove orphaned zd1201 driver
1535d5962d79 wifi: remove orphaned orinoco driver
6b9dbaff83d6 wifi: remove orphaned ray_cs driver
238349207cd3 wifi: remove orphaned wl3501 driver
bec95598b24a wifi: remove orphaned rndis_wlan driver

I dropped this patch as we got several reports about people using the
driver:

[RFC] wifi: remove ipw2100/ipw2200 drivers

The patches are queued for v6.8. Arnd, thanks a lot for cleaning this
up!

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
