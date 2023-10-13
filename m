Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F647C8CBF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 20:04:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=LGUFqBJR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6ZBp2PG0z3vYf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Oct 2023 05:04:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=LGUFqBJR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sipsolutions.net (client-ip=2a01:4f8:242:246e::2; helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net; receiver=lists.ozlabs.org)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6Z9w0NMkz2yh5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Oct 2023 05:03:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=+YCPIF7bIuvSFdfYLoHL+t68NvW/EnMItKeS5kyuoaw=;
	t=1697220194; x=1698429794; b=LGUFqBJRDSQz5DffLHzZTeJ4jMlwtWA6p2fMYUeVM8uLdUt
	k5eJsA8NjxUV4MyJ0OsiIUikw0WDuuXZ6BoqV0LQh75b4ba+k5eQx2OJGWbE1wC1p7aenM8UtIiNN
	74Wts7eojwfum47p9BKoTuEmZ4x5MR/SbuiqW+EdkqWmo1z6BFZcHon2D+J8l5N0elJSXEhoOiQma
	+v5ktwHxVzVNnDF7TT7SwLIkheVC2OdVQx0721olZtKaTizugG7JiRJOK/xqQxGhvM6gISuXo5isZ
	fmDU6YuRfBjhgq5BDpbLqG+zpVk4wFCgJwxqYLF85QJ1kSh44tahbnG9Ps3x/txQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97-RC1)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qrMUs-00000004lf0-44Ty;
	Fri, 13 Oct 2023 20:02:51 +0200
Message-ID: <789449f63ff6175ff46951507c03753f4430aa85.camel@sipsolutions.net>
Subject: Re: [PATCH] [RFC] wireless: move obsolete drivers to staging
From: Johannes Berg <johannes@sipsolutions.net>
To: Arnd Bergmann <arnd@arndb.de>, Geoff Levand <geoff@infradead.org>, Geert
	Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Oct 2023 20:02:49 +0200
In-Reply-To: <2fb4f151-9146-4cce-a3e6-ca80a95cf590@app.fastmail.com>
References: <20231010155444.858483-1-arnd@kernel.org>
	 <2023101051-unmasked-cleaver-79b3@gregkh> <87y1g94szz.fsf@kernel.org>
	 <2023101139-pyromania-game-2237@gregkh> <87r0m1fwg9.fsf@kernel.org>
	 <20231011080955.1beeb010@kernel.org> <87sf6g2hc8.fsf@kernel.org>
	 <63e57ef8-c9f2-489a-8df8-51dcffd437c6@app.fastmail.com>
	 <b1c87f71abef5aba6b39893a417466bf9f65c2d5.camel@sipsolutions.net>
	 <CAMuHMdX3F9rvD3Fzbc1dwm7Vm73VW1x5ETbxkk-jJm3Bpr5i+A@mail.gmail.com>
	 <d336126d58e12e8e67078c8142a524c667cc5639.camel@sipsolutions.net>
	 <39719eae-f166-4059-a70d-c6b74ecd46e2@infradead.org>
	 <2fb4f151-9146-4cce-a3e6-ca80a95cf590@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
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
Cc: Arnd Bergmann <arnd@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kalle Valo <kvalo@kernel.org>, linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-arm-kernel@lists.infradead.org, Pavel Machek <pavel@ucw.cz>, Jakub Kicinski <kuba@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "David S . Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, Larry Finger <Larry.Finger@lwfinger.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2023-10-13 at 17:44 +0200, Arnd Bergmann wrote:
> On Thu, Oct 12, 2023, at 18:36, Geoff Levand wrote:
> > On 10/12/23 17:41, Johannes Berg wrote:
> > > But seriously - is it worth to try to keep a wireless driver for it i=
f
> > > we don't even know anyone using a PS3 at all?
> >=20
> > There is still a considerable user base for the PS3, so we
> > must keep the ps3-gelic-wireless driver.
>=20
> Do you know if anyone has tried changing this driver over to the
> cfg80211 interface from the wireless extensions?

I looked at that yesterday, and sadly I _think_ it's not even possible,
there are some corner cases in it like "no WPA2" that don't seem to be
fully covered in cfg80211/nl80211, at least not with the APIs today and
with current versions of wpa_supplicant.

It might still be doable because things like
WPA_DRIVER_CAPA_KEY_MGMT_WPA2_PSK don't really seem to be used much in
wpa_supplicant, but we'd have to carefully test that I guess.

Also, it depends on the PS3 firmware version whether or not that's
supported.

Then again, arguably wifi without WPA2 is pretty much useless these
days?

johannes
