Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1B37D3904
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Oct 2023 16:11:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=qXXUQDlq;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=hwUXLudl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SDcZ03Hrrz3cWH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 01:11:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=qXXUQDlq;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=hwUXLudl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.229; helo=new3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SDcY13hSHz2xYk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Oct 2023 01:10:44 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id 63CC4581579;
	Mon, 23 Oct 2023 10:10:39 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 23 Oct 2023 10:10:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1698070239; x=1698077439; bh=Cd
	D00F6lo71GUCVAQ5trDcf1jHXe2aUX3dC/0CHjbQ4=; b=qXXUQDlq0gAM5PfthE
	tj0+25tcD8B0dHKH53Y8/RBXX924Jv6+TCHgZ2DmBOPjpvDgoA6vfpQG4R5hBMmt
	yHtfzcx94RUzYA4BDrAoin2MGZ9kXM/rf7x82Q//kq1W0KkIWXdbljW91rPjUY10
	iRUXdIVSZOXRcMy+b0MSGV4mTsBo28657zFxjy3PRri+A74kVikmvO6Xd/Sb8C1A
	oMniFTNPeg0h1+dV/VIixGCsQ9XQZL88wvFFNQCjTxIPUd7T5AlibIF/mb+73/mn
	rD6df1qJCAMghE6/MeI4S6hQKhruJM8DpbU8wOeo3F8pqdD07HqekPFue6fcWKC2
	Nfyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1698070239; x=1698077439; bh=CdD00F6lo71GU
	CVAQ5trDcf1jHXe2aUX3dC/0CHjbQ4=; b=hwUXLudllnoVroI4li0WSBuEKuS0m
	x5JRGf4/rrt20gTiLKboQBd6YiuI3HjGNfNnZ9Qt/2j90IzlMAv0YnNIbqMbmY55
	jVswrzfOKf8HCvbXFn/kXKL9/sGSehUbUCFycV0fu7SSdmzd2sLmz31QFbgIxbd0
	EhrKOBsPWx2hBCzFogyLfVylT3+4xDBLCoPQKZtY7fPCOnYGrDFcS9nep+3kBW4I
	jQet8pbe+BVl0IMhMejxkIqBU0Qd47FVWAuQTSGij7McKriKYUY8QW6/R4Fbk+2C
	Z6myKGW5RtMaGCBgn86OL+EXsFoa64U8ph445g0QiK8ba1orns8o2vIHg==
X-ME-Sender: <xms:3X42ZQ_ItFV-GbRI3mbqY1F_ZfsutV9aIgWdaivjEnFtaDWXrbZDOg>
    <xme:3X42ZYvEgKFXGNttA0kthbKP0HLq0YI2X_Hj9IO3rnRWR05AcK2f_hmbe7Xk4pECK
    UIWY5T0CA5vr3FM3nw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrkeeigdejudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:3X42ZWDp7CUTlUyBhid-28tQffehzvNNNvbBz8kQ2uCuoFOyovsmgw>
    <xmx:3X42ZQcK76hDhVVMBr3tH9vKd0PzjWN6deGqeG4iQ0StSHA-h6qjSA>
    <xmx:3X42ZVNTgT22xJcQiBBH_8M8IxNt2AOYjo-XZR2bJW2uGJGy0lLQtQ>
    <xmx:3342ZQGdEQ1YnY6VFN2tafTbr289GUD9MriSoShSnfxIvV8srUdX-g>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1EB20B60089; Mon, 23 Oct 2023 10:10:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1048-g9229b632c5-fm-20231019.001-g9229b632
MIME-Version: 1.0
Message-Id: <50eafe40-9c50-48e2-8d48-6a113c8fd87d@app.fastmail.com>
In-Reply-To: <87v8axzc46.fsf@kernel.org>
References: <20231023131953.2876682-1-arnd@kernel.org>
 <87v8axzc46.fsf@kernel.org>
Date: Mon, 23 Oct 2023 16:10:16 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Kalle Valo" <kvalo@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Subject: Re: [PATCH 00/10] Remove obsolete and orphaned wifi drivers
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
Cc: Stanislaw Gruszka <stf_xl@wp.pl>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Geoff Levand <geoff@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-wireless@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Nicolas Ferre <nicolas.ferre@microchip.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Pavel Machek <pavel@ucw.cz>, Gregory Greenman <gregory.greenman@intel.com>, Jakub Kicinski <kuba@kernel.org>, Johannes Berg <johannes@sipsolutions.net>, Jeff Johnson <quic_jjohnson@quicinc.com>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Larry Finger <Larry.Finger@lwfinger.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 23, 2023, at 15:45, Kalle Valo wrote:
> Arnd Bergmann <arnd@kernel.org> writes:
>
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> As discussed previously, a lot of the older wifi drivers are likely
>> entirely unused, Though we can't know for sure.
>>
>> As suggested by both Greg and Jakub, let's remove the ones that look
>> are most likely to have no users left and also get in the way of the
>> wext cleanup. If anyone is still using any of these, we can revert the
>> driver removal individually.
>>
>> I would suggest merging these for net-next after 6.7-rc1 is out
>
> Why net-next? I want to take these to wireless-next to avoid any
> conflicts with other wireless patches.

My mistake, I actually rebased them on top of wireless-next before
sending out the patches, I just forgot update the text I had
already written a week earlier.

> We could take these to wireless-next after we submit the last new
> features (-next) pull request to v6.7, so most likely already next week.
> So if anyone has any problems with these speak up now.

Sounds good to me, thanks!

    Arnd
