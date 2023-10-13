Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0087B7C8909
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 17:46:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=QfSe04c+;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=HlebnGki;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6W7d5P9pz3vZT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Oct 2023 02:46:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=QfSe04c+;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=HlebnGki;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6W6f42D1z30LM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Oct 2023 02:45:14 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 8C99C3200A38;
	Fri, 13 Oct 2023 11:45:07 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 13 Oct 2023 11:45:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1697211907; x=1697298307; bh=0S
	q5aN/LEeIdEtvpU4m3Ee5Hif+IIBF9F9j0cI69vvg=; b=QfSe04c+Y6UV+PgVX8
	ipjzO11XYYPPGyAwgDHlq+Bw0zIP9gWxJjcNcvCQYhHzdsqlEySU7hdPN3yXE+kV
	sWIdr6p69QcAUCyXmWoN8OoJVh9UYAm31S2HsNFANMOZ461tIkn8J0AZn79Rs2Ow
	dVx5XpBZcN0Ku1DApCTl9EIRhjigzffykqoUclC3McWBRt19TcHEnIpOZ7NpBtZ+
	rn+g30Wq4JRQS67BuZfmFi7hegvvc3ZScX3HvcCBn72A+DwO1Jub5FnhEQItUMUe
	yy/UhIHvvgHCOBus5Ot8HJpEvyAGmchRO/LMfr79D3c7l1GIIegFPc2e1gwvFnUM
	0ZJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1697211907; x=1697298307; bh=0Sq5aN/LEeIdE
	tvpU4m3Ee5Hif+IIBF9F9j0cI69vvg=; b=HlebnGkiYLove2NgAjXZ1BrX1E4BO
	rllh75aIqbF3UPjtExUKH1fFjWwxqzxGKFxLl85cMBN6oiqj3/obCkMIe/j27JEx
	K6DUA2H+433N0yckEmdVYfKJvUD3obb++KT36pLVOMtXKhsr3CWeVTXdt6mJCEBb
	PRkdaHcARKcWSO0U3zjYR/06rvY3243LEPC3l53pJvWsQ3RE+BQGeCDISzOcuq12
	FEyXi4Hfu5JGncNXSB7sLdl52wzOKLPivcp6qMc29pnS6gJdRElg2oezts5g3W+D
	qfy+CEH/my0ScNwhjtXM8gpvTMORnfsFRknJkpeGP/kh7UQNI1gntuQZg==
X-ME-Sender: <xms:AmYpZcsvVDyOhwSyQ70izb8_xBVsCY_kfn6gdWQWio7HXLWxZusBPA>
    <xme:AmYpZZfX4rNm-lh5GW_s8Fpfo0otpXih4YpZZlPZePJEwjIo-TOIu6moQ8_b7hGSl
    eOLjPNmu67Og7Fx9Qs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrieefgdeilecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:AmYpZXzN2w3dbR22gN4m-cKujh4GRSIxI8kLEk5iXqN-3zzR1xutyw>
    <xmx:AmYpZfNRZ5xYU705tJzb4gFqaDT5P2H_jwJmbuRMJMxX7Sa3ug505A>
    <xmx:AmYpZc_65e0KsmA9vWgubuAuTXNCLVK-UdJEwJ7CoQcBqQM2LCorag>
    <xmx:A2YpZfeA7_dBOkylpD1LmWWHIkTTd6VjkTkNStwUHhVVjHjqWRhgug>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4F568B60089; Fri, 13 Oct 2023 11:45:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1019-ged83ad8595-fm-20231002.001-ged83ad85
MIME-Version: 1.0
Message-Id: <2fb4f151-9146-4cce-a3e6-ca80a95cf590@app.fastmail.com>
In-Reply-To: <39719eae-f166-4059-a70d-c6b74ecd46e2@infradead.org>
References: <20231010155444.858483-1-arnd@kernel.org>
 <2023101051-unmasked-cleaver-79b3@gregkh> <87y1g94szz.fsf@kernel.org>
 <2023101139-pyromania-game-2237@gregkh> <87r0m1fwg9.fsf@kernel.org>
 <20231011080955.1beeb010@kernel.org> <87sf6g2hc8.fsf@kernel.org>
 <63e57ef8-c9f2-489a-8df8-51dcffd437c6@app.fastmail.com>
 <b1c87f71abef5aba6b39893a417466bf9f65c2d5.camel@sipsolutions.net>
 <CAMuHMdX3F9rvD3Fzbc1dwm7Vm73VW1x5ETbxkk-jJm3Bpr5i+A@mail.gmail.com>
 <d336126d58e12e8e67078c8142a524c667cc5639.camel@sipsolutions.net>
 <39719eae-f166-4059-a70d-c6b74ecd46e2@infradead.org>
Date: Fri, 13 Oct 2023 17:44:43 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geoff Levand" <geoff@infradead.org>,
 "Johannes Berg" <johannes@sipsolutions.net>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>
Subject: Re: [PATCH] [RFC] wireless: move obsolete drivers to staging
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
Cc: Arnd Bergmann <arnd@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kalle Valo <kvalo@kernel.org>, linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-arm-kernel@lists.infradead.org, Pavel Machek <pavel@ucw.cz>, Jakub Kicinski <kuba@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "David S . Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, Larry Finger <Larry.Finger@lwfinger.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 12, 2023, at 18:36, Geoff Levand wrote:
> On 10/12/23 17:41, Johannes Berg wrote:
>> But seriously - is it worth to try to keep a wireless driver for it if
>> we don't even know anyone using a PS3 at all?
>
> There is still a considerable user base for the PS3, so we
> must keep the ps3-gelic-wireless driver.

Do you know if anyone has tried changing this driver over to the
cfg80211 interface from the wireless extensions? With the
series I have prepared now, it is the only driver outside of
drivers/staging that still uses wext and stops us from removing
that altogether. 

[side note: it appears that the PS3 I have is the only model
 without wireless networking, as I bought cheapest Asian 20GB version
 back in early 2007. It still has the original firmware on it
 and should run Linux, but I haven't tried it since at least
 2009].

    Arnd
