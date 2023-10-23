Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9897D39D9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Oct 2023 16:42:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qD+ozjaj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SDdFQ2vGqz3d8Y
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 01:42:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qD+ozjaj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=kvalo@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SDdDY4ZWtz2y1j
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Oct 2023 01:41:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BC73ECE259A;
	Mon, 23 Oct 2023 14:41:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF551C433C8;
	Mon, 23 Oct 2023 14:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698072091;
	bh=N4If+wgwsD8dFTdUHEouchVNBSUFE+9hWZEa6Th40ts=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=qD+ozjajwsL/rFVAaZsugmIyEH3vwd5drmhXUIXfjLh1gKwHJWIN1dobJ88kx4Egh
	 RHA4m/cy5OiAXs+dPr2hUVPCKRKLzCsK4ipHu/V3SBzjatw9ibogQb9E3+cQVZZSnW
	 bhogHTKie9F8J4xFYhhGmRkymJ2uqsEoy6vRAmBgpTjNE6DooXvbMnRHTmt80js1v6
	 fUJE2AEkblMuFSj6kajAKMdP8frLSty/xG8TbjwDC7PenDxpsGKxWxCWhf0BxcJUWQ
	 N2wZvRaECSlzwYO5tL4q7HJCK+XVhR8pNAV7KKU/ZGN5RO8kx5lGbXFRPOluU7RHcB
	 A9gJHTEZj/aqA==
From: Kalle Valo <kvalo@kernel.org>
To: "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH 00/10] Remove obsolete and orphaned wifi drivers
References: <20231023131953.2876682-1-arnd@kernel.org>
	<87v8axzc46.fsf@kernel.org>
	<50eafe40-9c50-48e2-8d48-6a113c8fd87d@app.fastmail.com>
Date: Mon, 23 Oct 2023 17:41:24 +0300
In-Reply-To: <50eafe40-9c50-48e2-8d48-6a113c8fd87d@app.fastmail.com> (Arnd
	Bergmann's message of "Mon, 23 Oct 2023 16:10:16 +0200")
Message-ID: <87edhlz9ij.fsf@kernel.org>
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
Cc: Arnd Bergmann <arnd@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Stanislaw Gruszka <stf_xl@wp.pl>, Geoff Levand <geoff@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-wireless@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Nicolas Ferre <nicolas.ferre@microchip.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Pavel Machek <pavel@ucw.cz>, Gregory Greenman <gregory.greenman@intel.com>, Jakub Kicinski <kuba@kernel.org>, Johannes Berg <johannes@sipsolutions.net>, Jeff
 Johnson <quic_jjohnson@quicinc.com>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Larry Finger <Larry.Finger@lwfinger.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Arnd Bergmann" <arnd@arndb.de> writes:

> On Mon, Oct 23, 2023, at 15:45, Kalle Valo wrote:
>> Arnd Bergmann <arnd@kernel.org> writes:
>>
>>> From: Arnd Bergmann <arnd@arndb.de>
>>>
>>> As discussed previously, a lot of the older wifi drivers are likely
>>> entirely unused, Though we can't know for sure.
>>>
>>> As suggested by both Greg and Jakub, let's remove the ones that look
>>> are most likely to have no users left and also get in the way of the
>>> wext cleanup. If anyone is still using any of these, we can revert the
>>> driver removal individually.
>>>
>>> I would suggest merging these for net-next after 6.7-rc1 is out
>>
>> Why net-next? I want to take these to wireless-next to avoid any
>> conflicts with other wireless patches.
>
> My mistake, I actually rebased them on top of wireless-next before
> sending out the patches, I just forgot update the text I had
> already written a week earlier.

Ah, good that we are on the same page then :)

>> We could take these to wireless-next after we submit the last new
>> features (-next) pull request to v6.7, so most likely already next week.
>> So if anyone has any problems with these speak up now.
>
> Sounds good to me, thanks!

Thanks for the patches! I applied them to our pending branch for some
build testing, there were few conflicts I guess due to recent cleanup
patches but obviously easy to fix :)

https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git/log/?h=pending

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
