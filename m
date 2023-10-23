Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9280C7D3974
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Oct 2023 16:37:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qQjhSgSZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SDd7H3S5Tz3cSy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 01:36:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qQjhSgSZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=kvalo@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SDd6P1k5Nz3bT8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Oct 2023 01:36:13 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 02FE4B81E6B;
	Mon, 23 Oct 2023 14:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 256C7C433C7;
	Mon, 23 Oct 2023 14:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698071767;
	bh=PgA9yYa6/1qxru0Rwr8SOL4n9Sf+KY4AdlDhFZNeRMo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=qQjhSgSZxVDSNrUricToBpOO3r3/9HPO9ePt28aLe38EMuSbiPvh0DhTtdiZt8DKb
	 zccwbQRXYv7h1SjVPXd+UphUB4VILi6IE0ef/Jkpf14TinQSLXWHSeg1KNGKZlGKdO
	 qUPTnR5EwpEQOYod9oelcttVvxy2u8hinktsyJNfh6eVdJ8aPD5hfQisqosvKojUQG
	 s89phH1sbMPTAH5f61vmorwhTOeop64y9KNMHJEaAYKBLRVJ2+mAsiMTUv4cjo5tZH
	 MD1WPybZUAYpoiJZgnv8d32NDcnx73frJGkJDJswEYZjFVVWqdMGI8b1ndc4MtJw14
	 Op5z3rREu0YVA==
From: Kalle Valo <kvalo@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 04/10] wifi: remove obsolete hostap driver
References: <20231023131953.2876682-1-arnd@kernel.org>
	<20231023131953.2876682-5-arnd@kernel.org>
Date: Mon, 23 Oct 2023 17:36:00 +0300
In-Reply-To: <20231023131953.2876682-5-arnd@kernel.org> (Arnd Bergmann's
	message of "Mon, 23 Oct 2023 15:19:46 +0200")
Message-ID: <87msw9z9rj.fsf@kernel.org>
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
> HostAP is an ISA/PCMCIA style 802.11b driver supporting only
> wireless extensions, and some custom ioctls (already removed).
> Some devices include a legacy PCI bridge but no DMA.
>
> The driver was marked obsolete in 2016 and is highly unlikely
> to still have any users.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

This patch didn't make it to the list, I guess it was too big. But it's
available from the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git/commit/?h=pending&id=39ed2ce3bdc43bc9dbed65608d98828f21b9f33d

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
