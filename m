Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A777D7FFE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 11:50:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nYXOeX9D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGLcw6Qk2z3cPk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 20:50:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nYXOeX9D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=kvalo@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGLc602mmz300g
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Oct 2023 20:49:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 66715CE3E6C;
	Thu, 26 Oct 2023 09:49:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F324C433C8;
	Thu, 26 Oct 2023 09:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698313763;
	bh=ncOp1N3ea9kk7KOsgsA6VBFVmgEpZN509tgZREJl3nI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=nYXOeX9DvwUB+3aK3+/M2o7umYxQkiX614IgM/dz6QQUgLin0rb/tevRZ5GKkNAFQ
	 qvVgvbclmMTkgbU7mFfK2UaWXDDz54TyUV+B126gobsPLpP6BbW/gASlmmCmpXC8Kf
	 IMP6Yq1/B//x3DS6NM3vSLnh7sHcfYVBLkoMgV1Y0N0K9FkD/jRYy74jAzJvpJqbdF
	 2qQd3WuJUrlch/+kJVNo7me+AqaIx+KIg7EsauYZtErmrveOhXoVhRr7VOSfZ9sW6e
	 kON1WQhgi/1UrkGISBe7RuW2QbbdS6jpg7CpgHPzsINfXGL/CsbviAx6PbyvEq0Rt/
	 GwJp7g3bvdzXg==
From: Kalle Valo <kvalo@kernel.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: Re: [PATCH 10/10] [RFC] wifi: remove ipw2100/ipw2200 drivers
References: <CAEGMnwo6RFqADPO5FRkRUNL=GfV6DY8UuwgsypEYOD3LTnXdJg@mail.gmail.com>
	<c608f328-387e-431b-b3c2-4b8fa0c4f11f@gmail.com>
Date: Thu, 26 Oct 2023 12:49:16 +0300
In-Reply-To: <c608f328-387e-431b-b3c2-4b8fa0c4f11f@gmail.com> (Philipp
	Hortmann's message of "Thu, 26 Oct 2023 00:48:18 +0200")
Message-ID: <87jzr9d883.fsf@kernel.org>
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
Cc: alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, Witold Baryluk <witold.baryluk@gmail.com>, pavel@ucw.cz, gregory.greenman@intel.com, stf_xl@wp.pl, linux-staging@lists.linux.dev, ilw@linux.intel.com, geert@linux-m68k.org, kuba@kernel.org, stas.yakovlev@gmail.com, arnd@arndb.de, nicolas.ferre@microchip.com, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, arnd@kernel.org, geoff@infradead.org, gregkh@linuxfoundation.org, linux-wireless@vger.kernel.org, claudiu.beznea@tuxon.dev, johannes@sipsolutions.net, quic_jjohnson@quicinc.com, davem@davemloft.net, Larry.Finger@lwfinger.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Philipp Hortmann <philipp.g.hortmann@gmail.com> writes:

> On 10/26/23 00:27, Witold Baryluk wrote:
>> I might be interested in modernizing the driver, but I have no idea
>> how much effort it would be (in terms of changed fraction of code).
>> 20k LOC is neither small or big, and not obvious (a lot of it would
>> be unchanged), if it is a week of work, or months of work.
>
> Hi Witold,
>
> I am trying to do this with rtl8192e.
> One possibility is to take the following patch series as a starting point:
> https://yhbt.net/lore/all/1414604649-9105-1-git-send-email-tvboxspy@gmail.com/
>
> For me as a beginner and hobbyist this is a huge task. I am happy when
> I can finish it until next summer.

We also have some docs available:

https://docs.kernel.org/driver-api/80211/

And I also recommend looking at our hwsim driver as that gives a good
idea how a simple mac80211 driver works:

https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git/tree/drivers/net/wireless/virtual/mac80211_hwsim.c

And you can even tinker the driver and run tests without needing any
real hardware:

https://docs.kernel.org/networking/mac80211_hwsim/mac80211_hwsim.html

And if there are any questions about mac80211 or anything wireless
related please send them to linux-wireless. Usually someone will answer
as long the question is well formulated.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
