Return-Path: <linuxppc-dev+bounces-2199-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0844B99C5BB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 11:32:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRsSv5PM2z3bgs;
	Mon, 14 Oct 2024 20:32:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728898335;
	cv=none; b=RssvFeJCZ9TOYiHWAUty7BGK5e96mLgy0BX9UhDflY1kWA4UCFaF5luZk1b5idBW6sRFXL07+GHR+sMG9UlLBVcB3cZu++EkTQtswMkEOGaG5PSutjCAwApS1OZli4AEPemzO5ge6gZey8JIh3BJjQWBh5tboLT4yIJGkPw5fj2GQhGq/C2MYvvdFsTbiYeBhupD8roEQqMj5Unz9isoZjm62ByxeaqJyiSOdecEd22AD8hqIrTOKMe8vEU/hr2+rWl2JFpY4FAQ1Hu9F7hOd39gCWEUqEs6RtP03LGuf0WS7u+K8AK5V0kSXdER114RkcylZ+BiCqWhZCciiGGPsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728898335; c=relaxed/relaxed;
	bh=54OEPTCVAH3B7cz4kg6+MVY3l9aybsbg+IOAzgW/+Vo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=kaMKfOJTROuD/Tp9e4S8uEcWK4z45UW4xwnm5aN9JJSms4bUQOtqbfKuQY/pYrjPCy3QlO6kf+DAiA1o9qmhUIQRHUmnY9T/l6ah20B/EKB+CCeFgAGpawYdVG52o0DPsMhQAo1Dw7JqbxHxR0Bc74P3W2OUY7QWfB2rSCSLlL4fvkZpLCGC0IzAyawfMzzlp0coVQhejWI6Nx7LqT14FKGK/wGMkZMdyzdSnqNHbt2BGuLUOIjgUUG3VwVhPa4Xb2Eo+cT1UCEG9r2hZMBd/yEkUmSdURcFiiHjIFKPCkQHyG9nN53Kx/pLRajdMQVPOjPMbI2ildQpRhCOXH43vA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M6Zq3N3P; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=kvalo@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M6Zq3N3P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=kvalo@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRsSt43c5z2ywq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 20:32:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4DEB4A415FF;
	Mon, 14 Oct 2024 09:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01007C4CEC3;
	Mon, 14 Oct 2024 09:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728898330;
	bh=H6iAE2LegkHNp+32/yt3whqw8Zq05OwWueCyBd7K+Hw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=M6Zq3N3PCiStt2G83cEgWx8o4bKzMfBezq8TBjf4oGBUTNEwompWn+LQ/C+ofFioi
	 y7WQ13MM0GVVi0W3B6Hym4d+I3V5V8ZBR2kr+f4jNWmP8gmCgbg/zh815ABruto0MV
	 VmL6/GEUM7HCmgVVgArGynSv8rRhxFCFyrFyEKYc6rMQjbUSA/zvCZ9t3rmqNOFYve
	 1HjWL/E+cqCRztuiQXTISR5Dlhj3NfdkZ4qW+GeNqOuaVyTHPMP2oAdjT5MUpJoCC9
	 EWbTAkigiQZvikWPgvJrMC8qDRSBC/tAEfk22ek16SHNc6FehtMIBFD5/z1eVv1xOo
	 zUixQub5fHfuA==
From: Kalle Valo <kvalo@kernel.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: linux-kernel@vger.kernel.org,  "David S . Miller" <davem@davemloft.net>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Geert Uytterhoeven <geert@linux-m68k.org>,
  Geoff Levand <geoff@infradead.org>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Jakub Kicinski <kuba@kernel.org>,  Jeff
 Johnson <quic_jjohnson@quicinc.com>,  Johannes Berg
 <johannes@sipsolutions.net>,  Larry Finger <Larry.Finger@lwfinger.net>,
  Nicolas Ferre <nicolas.ferre@microchip.com>,  Pavel Machek
 <pavel@ucw.cz>,  Stanislaw Gruszka <stf_xl@wp.pl>,  Gregory Greenman
 <gregory.greenman@intel.com>,  linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>,  linux-arm-kernel@lists.infradead.org,
  linux-staging@lists.linux.dev,  linux-wireless@vger.kernel.org,  Arnd
 Bergmann <arnd@arndb.de>,  Stefan Lippers-Hollmann <s.l-h@gmx.de>
Subject: Re: [RFC] ipw2100 ipw2200 ps3_gelic rtl8712 --- Are we ready for
 wext cleanup?
References: <a7eb3db4-ad0d-451a-9106-90d481bd3231@gmail.com>
Date: Mon, 14 Oct 2024 12:32:04 +0300
In-Reply-To: <a7eb3db4-ad0d-451a-9106-90d481bd3231@gmail.com> (Philipp
	Hortmann's message of "Sun, 13 Oct 2024 22:28:48 +0200")
Message-ID: <87iktv58tn.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Philipp Hortmann <philipp.g.hortmann@gmail.com> writes:

> origin of this question was the following patch series from Arnd Bergmann
> [PATCH 00/10] Remove obsolete and orphaned wifi drivers
> https://lore.kernel.org/linux-staging/20231023131953.2876682-1-arnd@kerne=
l.org/
>
> Here the remaining files that use iw_handler_def:
> drivers/net/ethernet/toshiba/ps3_gelic_wireless.c:static const struct
> iw_handler_def gelic_wl_wext_handler_def =3D {
> drivers/net/wireless/intel/ipw2x00/ipw2100.c:static const struct
> iw_handler_def ipw2100_wx_handler_def;
> drivers/net/wireless/intel/ipw2x00/ipw2100.c:static const struct
> iw_handler_def ipw2100_wx_handler_def =3D {
> drivers/net/wireless/intel/ipw2x00/ipw2200.c:static const struct
> iw_handler_def ipw_wx_handler_def =3D {
> drivers/staging/rtl8712/os_intfs.c:     pnetdev->wireless_handlers =3D
> (struct iw_handler_def *)
> drivers/staging/rtl8712/rtl871x_ioctl.h:extern struct iw_handler_def
> r871x_handlers_def;
> drivers/staging/rtl8712/rtl871x_ioctl_linux.c:struct iw_handler_def
> r871x_handlers_def =3D {
>
>
> In this Email Greg writes over rtl8192e:
> https://lore.kernel.org/linux-staging/2024100810-payback-suds-8c15@gregkh/
> "...
> No staging driver should ever get in the way of api changes elsewhere in
> the kernel, that's one of the rules of this part of the tree.  So from
> my opinion, it's fine to delete it now.  It can always come back in a
> new way later on.
> ..."
>
> So it should not be an issue to remove rtl8712.
>
> Stefan Lippers-Hollmann was one year ago still using the ipw2200.
> https://lore.kernel.org/linux-staging/20231024014302.0a0b79b0@mir/
>
> Here my opinion why I think we should reconsider this:
>
> I really like to use old hardware. One of my computers is from trash
> and the other one is bought for 50=E2=82=AC three years ago. But non of my
> hardware is from before 2012. Do we as a community really need to
> support hardware from 2003 in kernel 6.13 for WLAN that evolved so
> rapidly? I do not think so.
>
> People around me are complaining that the 2,4GHz WLAN is difficult to
> use because so many devices are using it. Such slow devices consume a
> lot of time to send and receive the data and block therefore other
> devices.
>
> The longterm kernels will still support this hardware for years.
>
> Please explain to our very high value resources (Maintainers,
> Developers with wext and mac80211 expierience) that you cannot find
> any other solution that is within technical possibility and budget
> (USB WLAN Stick or exchange of WLAN module) and that they need to
> invest their time for maintenance.
> Here the example of invested time from Johannes Berg:
> https://lore.kernel.org/all/20241007213525.8b2d52b60531.I6a27aaf30bded9a0=
977f07f47fba2bd31a3b3330@changeid/
>
> I cannot ask the Linux kernel community to support my test hardware
> just because I bought it some time ago. Rather, I have to show that I
> use it for private or business purposes on a regular basis and that I
> cannot easily change.
>
> Using this hardware is security wise not state of the art as WPA3 is
> not supported. We put so much effort into security. Why not here?

I didn't quite get what you are saying here, are you proposing that we
should remove ancient drivers faster?

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

