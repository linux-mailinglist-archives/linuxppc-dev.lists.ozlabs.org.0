Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EFD7C7205
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 18:05:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=OsNIazpG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S5vcj6ZGVz3cQP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 03:05:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=OsNIazpG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sipsolutions.net (client-ip=2a01:4f8:242:246e::2; helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net; receiver=lists.ozlabs.org)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S5vbr3d6Rz3btq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Oct 2023 03:04:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=Y3vhvxIcoWBz8+4W1+pMn0rc7jF/ULpbocNtPW87JTA=;
	t=1697126696; x=1698336296; b=OsNIazpGM9thGZyQdm26mPEqIvfp+OzK+HRV8TbE1RpnO4R
	HRRuINEewCKtZwNJZRx5ZELKXWe8Slp9AT6/tlFnvwlbKaAiS9Ia7MmzxEgaveJm3lDNInapmzfRD
	s4oBS08duJpdCbhzEH1uLaKMXdNmdjvrbzHtd/gEupf18yh9PT6Pzfo0S66JUDB1xiUX3En49osgt
	Dr2lXUjFgbewqV7G8L5eHsT8lJ2j9eICZYPsBUQzfmAQADvE4Kw0Iv0WQ5KcuCZoDW+h4ILQxHorw
	wsAG96JFuaHtRl2JGxdGEzfA+UKiiL9a6ZfpynClNlJGCOKqNnz/SU6DtP3FSDYA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97-RC1)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qqxby-00000003SHc-0xxw;
	Thu, 12 Oct 2023 17:28:30 +0200
Message-ID: <b1c87f71abef5aba6b39893a417466bf9f65c2d5.camel@sipsolutions.net>
Subject: Re: [PATCH] [RFC] wireless: move obsolete drivers to staging
From: Johannes Berg <johannes@sipsolutions.net>
To: Arnd Bergmann <arnd@arndb.de>, Kalle Valo <kvalo@kernel.org>, Jakub
	Kicinski <kuba@kernel.org>
Date: Thu, 12 Oct 2023 17:28:28 +0200
In-Reply-To: <63e57ef8-c9f2-489a-8df8-51dcffd437c6@app.fastmail.com>
References: <20231010155444.858483-1-arnd@kernel.org>
	 <2023101051-unmasked-cleaver-79b3@gregkh> <87y1g94szz.fsf@kernel.org>
	 <2023101139-pyromania-game-2237@gregkh> <87r0m1fwg9.fsf@kernel.org>
	 <20231011080955.1beeb010@kernel.org> <87sf6g2hc8.fsf@kernel.org>
	 <63e57ef8-c9f2-489a-8df8-51dcffd437c6@app.fastmail.com>
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
Cc: Arnd Bergmann <arnd@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Geoff Levand <geoff@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-arm-kernel@lists.infradead.org, Pavel Machek <pavel@ucw.cz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "David S . Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, Larry Finger <Larry.Finger@lwfinger.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2023-10-12 at 16:36 +0200, Arnd Bergmann wrote:
>=20
> ps3-gelic-wireless

Didn't Sony disable Linux on PS3 eventually? Though maybe someone still
has some devices with old software.

johannes
