Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1367A7C71BF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 17:42:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=YuZoPYWl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S5v5t6Jv5z3cnS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 02:42:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=YuZoPYWl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sipsolutions.net (client-ip=2a01:4f8:242:246e::2; helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 766 seconds by postgrey-1.37 at boromir; Fri, 13 Oct 2023 02:41:40 AEDT
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S5v503cdjz3c7q
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Oct 2023 02:41:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=1AUZ4kSi2AEEEv3nuAS4HldMWbbuyLi811omII/FRFQ=;
	t=1697125300; x=1698334900; b=YuZoPYWlancrBYpzye4ruAsyQGeOH4GoO2oG7CHFtEd3aEc
	LAgofW3RHAL1SvXvf+7vcfw9CKPXpwxRA+beZMs52+DngQmln/31BUt+N9EgRCrBquuMEx/HqU/2E
	wv9fSNlMiTQcY6Kg4I9GeS8ggAYgFL5zzScCvNsDjXwupHDH2/8AwbeAArC3DfHPYQ6IsZENaYBQv
	Vnk7dAO425mUCieptYLQFdr9Ox2CDERyRHjJmrEG3BWRqqWZq09KTt1LCHYOKqJUZHiZav/tH5M1J
	BFXBt4bJ0H63PMwcENiHuaubkkEGvaTAEvtzTZhtO+j487f16VyUZlcCVIfQZPxA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97-RC1)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qqxoW-00000003T2i-3J0o;
	Thu, 12 Oct 2023 17:41:29 +0200
Message-ID: <d336126d58e12e8e67078c8142a524c667cc5639.camel@sipsolutions.net>
Subject: Re: [PATCH] [RFC] wireless: move obsolete drivers to staging
From: Johannes Berg <johannes@sipsolutions.net>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Oct 2023 17:41:27 +0200
In-Reply-To: <CAMuHMdX3F9rvD3Fzbc1dwm7Vm73VW1x5ETbxkk-jJm3Bpr5i+A@mail.gmail.com>
References: <20231010155444.858483-1-arnd@kernel.org>
	 <2023101051-unmasked-cleaver-79b3@gregkh> <87y1g94szz.fsf@kernel.org>
	 <2023101139-pyromania-game-2237@gregkh> <87r0m1fwg9.fsf@kernel.org>
	 <20231011080955.1beeb010@kernel.org> <87sf6g2hc8.fsf@kernel.org>
	 <63e57ef8-c9f2-489a-8df8-51dcffd437c6@app.fastmail.com>
	 <b1c87f71abef5aba6b39893a417466bf9f65c2d5.camel@sipsolutions.net>
	 <CAMuHMdX3F9rvD3Fzbc1dwm7Vm73VW1x5ETbxkk-jJm3Bpr5i+A@mail.gmail.com>
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
Cc: Arnd Bergmann <arnd@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Geoff Levand <geoff@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kalle Valo <kvalo@kernel.org>, linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-arm-kernel@lists.infradead.org, Pavel Machek <pavel@ucw.cz>, Jakub Kicinski <kuba@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "David S . Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, Larry Finger <Larry.Finger@lwfinger.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2023-10-12 at 17:39 +0200, Geert Uytterhoeven wrote:
> Hi Johannes,
>=20
> On Thu, Oct 12, 2023 at 5:28=E2=80=AFPM Johannes Berg <johannes@sipsoluti=
ons.net> wrote:
> > On Thu, 2023-10-12 at 16:36 +0200, Arnd Bergmann wrote:
> > >=20
> > > ps3-gelic-wireless
> >=20
> > Didn't Sony disable Linux on PS3 eventually? Though maybe someone still
> > has some devices with old software.
>=20
> If you didn't update the firmware, you could keep on using Linux.
>=20
> And people may have found a vulnerability in more recent firmware
> versions that allows them to run custom software.

Yeah, fair.

> I don't know, it's been +10 years ago I touched a PS3 ;-)

I never had one :-)

But seriously - is it worth to try to keep a wireless driver for it if
we don't even know anyone using a PS3 at all?

But maybe we'll find someone :-)

johannes
