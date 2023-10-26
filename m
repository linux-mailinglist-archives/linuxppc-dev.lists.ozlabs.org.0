Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAAA7D7FD3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 11:42:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D8Qcd0yw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGLS16Mj8z3c5m
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 20:42:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D8Qcd0yw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=kvalo@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGLR64PMZz2xZG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Oct 2023 20:41:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 4EB96B834DA;
	Thu, 26 Oct 2023 09:41:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F74C433C9;
	Thu, 26 Oct 2023 09:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698313293;
	bh=QxFYe5c/XElEhgs94iEddJdQGcgkPEwi4At0UDjpW3s=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=D8Qcd0yw0e1bKprF3WY9/beM4PynUZcxc7qiLy+kDXAU5l3hcsS4Mim+vfWdBMmcg
	 evRtytNOqMHSiWa86KjruNGFbTypqfGfc+JfNGBGoNhFKQvjmRDY4AzLwRT9MN/GwT
	 MwQDD6YhBGEWONQP1eD2V9cCPxApJbE9GovocKzlG2NMZhal6BTZUxu+2rOYaRvdQy
	 gE3f6cCidYwxkdLUiMEN1FQhTnvj+rVnE2d8mkEW913UcUFccA4uK7VWOW4XVYOhMz
	 AqoKItcYNTa6KEU2tohytxe7qzEzklXKV6lMbvS/RCSr7plb6zYL9x2ZjNsk+hKiYL
	 tNstCpZgMxf8Q==
From: Kalle Valo <kvalo@kernel.org>
To: Witold Baryluk <witold.baryluk@gmail.com>
Subject: Re: [PATCH 10/10] [RFC] wifi: remove ipw2100/ipw2200 drivers
References: <CAEGMnwo6RFqADPO5FRkRUNL=GfV6DY8UuwgsypEYOD3LTnXdJg@mail.gmail.com>
Date: Thu, 26 Oct 2023 12:41:27 +0300
In-Reply-To: <CAEGMnwo6RFqADPO5FRkRUNL=GfV6DY8UuwgsypEYOD3LTnXdJg@mail.gmail.com>
	(Witold Baryluk's message of "Wed, 25 Oct 2023 22:27:20 +0000")
Message-ID: <87o7gld8l4.fsf@kernel.org>
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
Cc: alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, pavel@ucw.cz, gregory.greenman@intel.com, stf_xl@wp.pl, linux-staging@lists.linux.dev, ilw@linux.intel.com, geert@linux-m68k.org, kuba@kernel.org, stas.yakovlev@gmail.com, arnd@arndb.de, nicolas.ferre@microchip.com, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, arnd@kernel.org, geoff@infradead.org, gregkh@linuxfoundation.org, linux-wireless@vger.kernel.org, claudiu.beznea@tuxon.dev, johannes@sipsolutions.net, quic_jjohnson@quicinc.com, davem@davemloft.net, Larry.Finger@lwfinger.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Witold Baryluk <witold.baryluk@gmail.com> writes:

>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> These two drivers were used for the earliest "Centrino" branded Intel
>> laptops during the late 32-bit Pentium-M era, roughly 2003 to 2005, which
>> probably makes it the most modern platform that still uses the wireless
>> extension interface instead of cfg80211. Unlike the other drivers that
>> are suggested for removal, this one is still officially maintained.
>>
>> According to Johannes Berg, there was an effort to finish the move away
>> from wext in the past, but the last evidence of this that I could find
>> is from commit a3caa99e6c68f ("libipw: initiate cfg80211 API conversion
>> (v2)") in 2009.
>>
>> Link: https://lore.kernel.org/all/87fs2fgals.fsf@kernel.org/
>> Cc: Stanislav Yakovlev <stas.yakovlev@gmail.com>
>> Cc: Linux Wireless <ilw@linux.intel.com>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>> I'm not convinced this should be in the same set of drivers as the
>> rest, since this is clearly less obsolete than the other hardware
>> that I would remove support for.
>
> I still use ipw2200 on Intel PRO/Wireless 2915ABG [Calexico2] Network
> Connection card, in my IBM Thinkpad X41 (Pentium-M 1.73GHz, Centrino
> platform). The laptop is rock solid, and I use it as a backup for my
> other Thinkpad. In fact is sometimes preferable to more modern machines
> (IMHO X41 itself is the best laptop ever made in terms of a design).
>
> Never had really issues with WiFi on it. In terms of speed it is neither
> far or slow, but does the job anyway.
>
> Now, I do not use this laptop frequently, maybe once or twice a month.
> But that is more because in I use laptops less in general these days. Not
> because the machine is not usable. I have modern SSD in it, second hard
> drive, two USB 3.0 ports via ExpressCard, high res 4:3 (1440x1050)
> display, full disk encryption, etc.
>
> I would really like for this driver to stay in the mainline for another 5-10
> years.

Thanks for the thorough report. By my calculations that's the third user
report about ipw2x00 so clearly there are users still and we shouldn't
remove the driver. I'm dropping this patch 10 from my queue now.

> I might be interested in modernizing the driver, but I have no idea how
> much effort it would be (in terms of changed fraction of code). 20k LOC is
> neither small or big, and not obvious (a lot of it would be unchanged),
> if it is a week of work, or months of work.
>
> I would not have an issue with removing it, and readding back if somebody
> (or me) ports it, if not for re-review from scratch concerns. If I port
> it, I would not be able to do re-review, 1) out of date coding standards,
> 2) different reviewers, 3) I would only port needed parts, and keep rest
> of the driver intact, so I would not be able to really provide much
> insight. So, readding after porting might be harder than keeping and
> porting.

It would be great if you could cleanup the driver and convert it to use
mac80211. In the wiki link below there is more info how to contribute
patches to the wireless subsystem. I always recommend starting with
something small and going towards more complex patches with baby steps.
Avoid patchbombing as much as possible!

For example, I see lots of dead code under '#ifdef NOT_YET' and '#if 0',
removing those is a good a start. Also converting the ugly debug_level
procfs file to something more modern would be nice, maybe using just
dev_dbg() throught the driver is a good option? Or maybe use a module
parameter instead?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
