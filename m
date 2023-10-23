Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0243E7D385A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Oct 2023 15:46:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gOiJyFf5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SDc0Y6QGFz3cHT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 00:46:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gOiJyFf5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kvalo@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SDbzm0zTbz2y1l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Oct 2023 00:45:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4702460C52;
	Mon, 23 Oct 2023 13:45:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEAA1C433C8;
	Mon, 23 Oct 2023 13:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698068720;
	bh=n95Zh41JGelr3O3p08QGkpOeR0lKk99ScJmZPITwFqg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=gOiJyFf58KDoI1EC+uvC5TLms/dSNPrL8X/ENM0gtmJt8gSaRROYUg8eoYeYA8MmI
	 cgHFl/ELTh3IVs2GHzBmW9CAy0eIjLZr3qgVOFqA9Cripw3UMpcZTeZODLYhC75OrI
	 YJewTnFvm5/SF3SkC9pl3Mcz3sCSy6eO4Q2gJP2eb7sdHNP3F6x0zEAgp/ooPf3eyr
	 b3AoITkafQvIhj4iN7rQutmE1lo1YjZJG1t8l9rZGvnXv1PWwGHgNYCzM1nwspVaiV
	 6RHuPi/t7XVs9Sem5+IEBnIg28qFeR2VGsqdU+1bKNQ/Pn5mGgLd1Rnr1DlDg4zxJe
	 VR6udzdAzs38w==
From: Kalle Valo <kvalo@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 00/10] Remove obsolete and orphaned wifi drivers
References: <20231023131953.2876682-1-arnd@kernel.org>
Date: Mon, 23 Oct 2023 16:45:13 +0300
In-Reply-To: <20231023131953.2876682-1-arnd@kernel.org> (Arnd Bergmann's
	message of "Mon, 23 Oct 2023 15:19:42 +0200")
Message-ID: <87v8axzc46.fsf@kernel.org>
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
> I would suggest merging these for net-next after 6.7-rc1 is out

Why net-next? I want to take these to wireless-next to avoid any
conflicts with other wireless patches.

We could take these to wireless-next after we submit the last new
features (-next) pull request to v6.7, so most likely already next week.
So if anyone has any problems with these speak up now.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
