Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD687DEAA7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 03:21:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=eiH49h4f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLSLP36Zsz3cl9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 13:21:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=eiH49h4f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=out5-smtp.messagingengine.com (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 513 seconds by postgrey-1.37 at boromir; Thu, 02 Nov 2023 13:20:51 AEDT
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLSKH2S4Qz3cVR
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Nov 2023 13:20:50 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id A10545C00C2;
	Wed,  1 Nov 2023 22:12:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 01 Nov 2023 22:12:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1698891131; x=1698977531; bh=HHqX/8hxM76B+
	FqUHCdvEUxPTggyvwjZCDtqqtb1Dmk=; b=eiH49h4fK8FgGVQFFnNNGTJhWiB43
	xyANQlcmzwv9NVB25UXh3hJmBAWwYRaQunD9fsARH6wraWUnpENLcJm3o4y56dU9
	rsTUelmLqFthTDfYc30m3iwwjlrBnDKmwQNUaEH/vgoZWAlcGecKUUS/D3PfxDfG
	tDC28EMRknqawOWeZ7iWoI7iWwKUqeOZsk14yQj24gmOTuUum8+j755RsgcZU06R
	NzHadTFQsN+IzfHQyH3hnieua9xsknprKhL3o9sY9YAzFYqUQR4gGJ8Kin8B/4Ms
	ht3Ud56x9Jtb9FiZ24Gour2jcmxmBWLQ+3Nq/pTqvK2fxNnHYcOlcDP+w==
X-ME-Sender: <xms:egVDZTzFIP-Qo8i7_JvveW15OEMzZ-g-pr11xyS9qX18JXgMv-5Ocw>
    <xme:egVDZbT-bTW05EomEIpQYveltj8MXTrS5zTCrTjzf600Gtedn2u-T92Jn34Q0Xg6p
    t0cES3IIQ7uY2LGceU>
X-ME-Received: <xmr:egVDZdWC-29u3_EMD6_JRSFmN19uPjlmOoY_R-bmVJYDj0dfaq2v3_4q8eZdGBhGbYUoxMrsMTr28O0m-avV0SJP6Adzzj7_oq4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedruddthedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:egVDZdh-4TxXUUqnfocIihCEu8Iz3vRrCbo423kk58ioPj3FQKZAaA>
    <xmx:egVDZVDWXP98CTzh3m4Cwxp8MJNzCgh3D_XReaKJ4ct86XO1MUyxhg>
    <xmx:egVDZWK8uZVnzb9SehVJ959hGy9fsosnXWqvFO8lBj0pR4JLIEXzWA>
    <xmx:ewVDZY44ENfjR8drYZ9Xh7CEnmmnKfoM984o5NyQcaADL6Sm26yzTw>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Nov 2023 22:12:07 -0400 (EDT)
Date: Thu, 2 Nov 2023 13:13:49 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Does anyone use Appletalk?
In-Reply-To: <d40cd45a-e7e3-49c4-931b-c5ec75a6bf56@app.fastmail.com>
Message-ID: <973278b8-c9e5-b1cf-2e08-2ff8fd8e9aa4@linux-m68k.org>
References: <CAMuHMdWL2TnYmkt2W6=ohBuKmyof8kR3p7ZPzmXmWSGnKj9c3g@mail.gmail.com> <594446aaf91b282ff3cbd95953576ffd29f38dab.camel@physik.fu-berlin.de> <CAMuHMdWv=A6MiVwUuOp8zOCcf21HxKb8cdrndzdbAZik3VRXiw@mail.gmail.com> <5e3e52a48ba9cc0109a98cf4c5371c3f80c4b4cc.camel@physik.fu-berlin.de>
 <79b7f88e3dd6536fe69c63ed3b4cc1f2c551ce8d.camel@redhat.com> <d40cd45a-e7e3-49c4-931b-c5ec75a6bf56@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Dan Williams <dcbw@redhat.com>, Netdev <netdev@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jakub Kicinski <kuba@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 1 Nov 2023, Arnd Bergmann wrote:

> 
> If we had not removed all localtalk support already, ipddp might have 
> been used to bridge between a pre-ethernet mac running macip and an IP 
> based AFP server (netatalk or time machine). Without localtalk support, 
> that is not all that interesting of course.
> 

That line of reasoning misunderstands the value of the localtalk code (and 
conveniently neglects the actual cost of keeping it in-tree).

The existing zilog driver works on all 68k and powerpc Macs with built-in 
serial ports. If we were to complete that driver by adding the missing 
localtalk support, it would create new opportunities for creative 
users/developers who already run Linux on those systems.

Those users/developers would surely derive value from that functionality 
in ways we cannot anticipate, as happens over and over again in the 
(retrocomputing) community.

So the value of the missing zilog localtalk functionality would be 
proportional to the number of Linux systems out there with the necessary 
serial hardware. It's value is not a function of the potential business 
opportunities for your sponsors, despite the prevailing incentives.

It was the potential value of the missing code for localtalk (Zilog SCC) 
and Apple Sound Chip that caused me to place that work near the top of my 
to-do list. But that was several years ago. Unfortunately, with bug fixing 
and recapping, I still can't find time to write the necessary code.

So I can't object to the removal of the localtalk code. But I do object to 
the underhand manner in which it is done.
