Return-Path: <linuxppc-dev+bounces-469-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3551595D519
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 20:16:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wr7Z85pfwz2yxj;
	Sat, 24 Aug 2024 04:16:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=130.133.4.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724437008;
	cv=none; b=oLZeN4cXR7kgwdjjaf572fTBNx5lO8IwUpF4qenXtmGV1LOFAg7d8bUMp3VOBxjNX3ykXrGxSfDOca16iqh118hazLw6h8xM7l1Bm7nIVlBA2eUXNs1MHeYdxfhB3MHGWAG6kRaI1V+mgVnO75JyWl5pipIWa7O7uCMnscpqFVJ6sk9fuNsJDrCLD4lu1Z2CKi92RKgBnSKQYZix6eblKrW0wWbnOQn6wJuRQAr3sQ3n/v1+dyXufBTMbWzzZofpEUGpl9XXALKk1nX9r94PqoX5PHZkN7vcQSFTAOXalljvUlvjFShDu9UIp4aJEYmQERGs5/H1pKmHRQmWWvXgtA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724437008; c=relaxed/relaxed;
	bh=lF3IGhVEk01uLE12Kfo9B/+81jxDEguey7tV3Pj8R54=;
	h=DKIM-Signature:Received:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-Original-Sender:X-Originating-IP:
	 X-ZEDAT-Hint; b=j+zEZ+M8mKtFXAVSbRp4mplf6tPHtxvJQ4qoSVjfPjbSpJH8Hw4OrS0pz+nuAsSmw8NW4bCRsf4s1x6PflDnn9MEiPd+FUWsvrlMmTNlDz5b+KosYuF/vqP3KLQ0vSzyVkTELc3XJT/FgUaJC8hDY3MQlrPonrdOpzXoScgMpn9hs2p78kzr7X5eUmiuqIFk6rdL47xXcAbiT6pErZAQjnnF4FLNijydExhzxyz8to6z9elPId7wdadfzfaAIs7bwCqyTT8n7P5JxN7+K1K6DBoT6w0TTtml3PLf8vJvQ2pOwitlYdNIevUWn+wSY7VnsaFSibKlFDxvUYUGDsdUyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=ojJtSSzA; dkim-atps=neutral; spf=pass (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org) smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=ojJtSSzA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wr7Z56K5xz2yx7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2024 04:16:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lF3IGhVEk01uLE12Kfo9B/+81jxDEguey7tV3Pj8R54=; t=1724437006; x=1725041806; 
	b=ojJtSSzABVbmwszZ5DoMFnrkMfaKtjNdtOzW7i3GsV6bJ+ZXReO/rFYT9j8zBbAC2Q5olpL+3cL
	M1aAMBdu1FJzmnKY2JsPsaxliAQtRX2Y1ap3scisfw0JPKu4NrYr9/yxy61MVy/B5TY8BFGdQlgn/
	4te2f8oc0qNEUMVc6VZi+oLFYyNpnZmCk9K5uh9p/VUjEkxtmTQyIlRYeOyae9roRqWLE7e+UARva
	VyLJTMTOsIcHp5EnVWGKpDC8ra5uy0mIdg6k4Ywb69xizULnn0GKdf2cIsxHkxaTYzjVuJq7Q8nG9
	Tm2jTw9qmx/jcZZB7rqkihO4ecAfknAgGS9Q==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1shYpw-00000002CKl-2SPB; Fri, 23 Aug 2024 20:16:36 +0200
Received: from p5b13a2bf.dip0.t-ipconnect.de ([91.19.162.191] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1shYpw-00000003fE3-1W3A; Fri, 23 Aug 2024 20:16:36 +0200
Message-ID: <09c29a3c4879d4ce5d8b97fd60d8ba5e38bed979.camel@physik.fu-berlin.de>
Subject: Re: [PATCH] crash: Default to CRASH_DUMP=n when support for it is
 unlikely
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Dave Vasilevsky
	 <dave@vasilevsky.ca>
Cc: bhe@redhat.com, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
  mpe@ellerman.id.au, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org,  Reimar =?ISO-8859-1?Q?D=F6ffinger?=
 <Reimar.Doeffinger@gmx.de>
Date: Fri, 23 Aug 2024 20:16:35 +0200
In-Reply-To: <CAMuHMdVYNhFJ+qBDP3_fi9oeHsgOL0vqPe1YqE18+M8n1onssw@mail.gmail.com>
References: <20240823125156.104775-1-dave@vasilevsky.ca>
	 <CAMuHMdVYNhFJ+qBDP3_fi9oeHsgOL0vqPe1YqE18+M8n1onssw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.162.191
X-ZEDAT-Hint: PO

Hi Geert,

On Fri, 2024-08-23 at 15:13 +0200, Geert Uytterhoeven wrote:
> IMHO CRASH_DUMP should just default to n, like most kernel options, as
> it enables non-trivial extra functionality: the kernel source tree has
> more than 100 locations that check if CONFIG_CRASH_DUMP is enabled.

I guess we should then revert that part of Baoquan's original patch.

> What is so special about CRASH_DUMP, that it should be enabled by
> default?

Let's ask Baoquan who made the original change to enable CRASH_DUMP by defa=
ult.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

