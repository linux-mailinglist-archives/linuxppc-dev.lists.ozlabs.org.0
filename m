Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B57B7A68B8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 18:16:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=n8pjl.ca header.i=@n8pjl.ca header.a=rsa-sha256 header.s=protonmail2 header.b=VjPOUfr+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RqmyD2ZSvz3c2G
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 02:16:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=n8pjl.ca header.i=@n8pjl.ca header.a=rsa-sha256 header.s=protonmail2 header.b=VjPOUfr+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=n8pjl.ca (client-ip=185.70.43.17; helo=mail-4317.proton.ch; envelope-from=peter@n8pjl.ca; receiver=lists.ozlabs.org)
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RqmxL44vWz30Pn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Sep 2023 02:16:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n8pjl.ca;
	s=protonmail2; t=1695140160; x=1695399360;
	bh=k2QmhXn3FHpsD31Ag66sjWvY57vLi94vGdI9Jg32c2Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VjPOUfr+BDKot6jNtzfiNQUBn+0rrhZJiA59iRWy30aLqarcEfUbJl13WNuPnXIoW
	 NywHiVkOkN0sAhAj5HVCpUg5MCHPnoVtVm3uKwvnlLQz2bUOxdLprD9u+w4LbKTPgA
	 bnBfsyBEq3NfeW6N9NlCpqkwDvrEgdVVXns49DKnopvogQCzzy0NJzr2/B+6TZ37p2
	 pBG3Imgo+IjObhl+GtscMyMDCDfzeNnzpCBmxFsxt25WKmx+xpxmqyJ0hqsjVZLW+n
	 JXFusuE18XA6ozPVKnAkxmiePcriJHUHal7GefK+IYNNYtydrpkBO7Z/E7Jw9j+Yfj
	 +4CaTlaacEEcQ==
Date: Tue, 19 Sep 2023 16:15:41 +0000
To: geert@linux-m68k.org
From: Peter Lafreniere <peter@n8pjl.ca>
Subject: Re: [PATCH 0/7] arch/*: config: Remove ReiserFS from defconfig
Message-ID: <20230919161535.4774-1-peter@n8pjl.ca>
In-Reply-To: <CAMuHMdXQ=xpeY3tmLXe1kgJbRtmVAn62rEhvzO+VB7GCgy4F8w@mail.gmail.com>
References: <20230918175529.19011-1-peter@n8pjl.ca> <20230918234108.GN19790@gate.crashing.org> <20230919000026.7409-1-peter@n8pjl.ca> <20230919151630.GO19790@gate.crashing.org> <20230919155832.4179-1-peter@n8pjl.ca> <CAMuHMdXQ=xpeY3tmLXe1kgJbRtmVAn62rEhvzO+VB7GCgy4F8w@mail.gmail.com>
Feedback-ID: 53133685:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-m68k@vger.kernel.org, tsbogend@alpha.franken.de, jack@suse.cz, reiserfs-devel@vger.kernel.org, linux-sh@vger.kernel.org, richard.henderson@linaro.org, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, richard@nod.at, ink@jurassic.park.msu.ru, peter@n8pjl.ca, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, anton.ivanov@cambridgegreys.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Geert,

On Tue, Sep 19, 2023 at 12:02, Geert Uytterhoeven <geert@linux-m68k.org> wr=
ote:
>=20
> Hi Peter,
>=20
> On Tue, Sep 19, 2023 at 5:58=E2=80=AFPM Peter Lafreniere peter@n8pjl.ca w=
rote:
>=20
> > 2) Stops building an obsolete and largely-unused filesystem unnecessari=
ly.
> > Some hobbyist targets like m68k and alpha may prefer to keep all filesy=
stems
> > available until total removal, but others like arm and UML have no need=
 for
> > ReiserFS to be built unless specifically configured.
>=20
>=20
> As UML is used a lot for testing, isn't it actually counter-productive
> to remove ReiserFS from the UML defconfig? The less testing it
> receives, the higher the chance of introducing regressions.

UML is used for testing, but in my view that makes the inclusion of
ReiserFS in its defconfig even worse. Users of UML are trying to test a
particular function, and so tend to use ext[2-4], as those are included in
the defconfig and are well tested and stable. So there is no extra testing
being done on ReiserFS due to its inclusion in the defconfig.

Keeping UML's defconfig as slim as possible improves build times, which is
particularly important for kernel testing and development.

>=20
> Gr{oetje,eeting}s,
>=20
> Geert
>

Cheers,
Peter Lafreniere=20

