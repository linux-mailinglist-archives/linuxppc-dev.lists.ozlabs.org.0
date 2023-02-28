Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 465256A5E6F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 18:52:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PR4hD16gZz3cNF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 04:52:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=EaoRbcWC;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=aT4jNsQw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=EaoRbcWC;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=aT4jNsQw;
	dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PR4gB2jpjz2xHK
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Mar 2023 04:51:32 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id AA1265C00A8;
	Tue, 28 Feb 2023 12:51:27 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 28 Feb 2023 12:51:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1677606687; x=1677693087; bh=8vEdpsF00a
	uNJ/hokTbjb+1PKHR+Rt07j755vIlRZAg=; b=EaoRbcWCt240OLZp9i8zuu8PIn
	fRe1LZnZOP15jzZxDMxwcBjYkvuSl+gTyjEZjqk8lQCUzkkMRYl5NbouHNnvGESI
	4LS0mbfcPYZXEuV64zVqLMeGSVXRrF2k3kfvW+JifQLDwOTt6MAKTf6uLRdOw+FU
	nCjnHgVWBzRE3Y8Bdl40LnPEVfFeBktqVN7hjvnbTqkPJS4qpiQVG8H+KMXzp8AZ
	dUUOAlUjDkcA4LwePLhYWVtcIOmAel2emb8uU3KstqKkScu9OoCQ6pIU+G1QIQJI
	Ec+8VaSuXgP8dzmfpHErquDLwkqzaMak238RpG9cSJ+j0bUTD8UfG5vIlceg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1677606687; x=1677693087; bh=8vEdpsF00auNJ/hokTbjb+1PKHR+
	Rt07j755vIlRZAg=; b=aT4jNsQwqgkfpxx3UhSfPy3ofnZm/NYAszdHSf58QCdY
	Ctkzu/v0mg18NW3LrrNGxDAqYWb2GXSHfNjEm3pfcd8QHdpZ9xvhTIdOb0cpgPzr
	nRYFQgNWKqZSyLr9ndH3RNUR/Q9UeTOEzfL8ZpYR/a9JYQexZoJe68EKgMb/fycv
	WSSzZui3JC4O4SJIi8Vzsk1c3y6WpkvQaGZtFizZgaIHQAoJ8OxacLb8+Fg4c5aI
	DUgEPULdrG3s8bwxLh0b7uzB4urKQBT4NA0CKyzTmplaajW161+Z6XnlzNEAJ1YM
	FrkMkE3507hrWoFMP6XECsiZPtGxYXf02g3MI+KzWw==
X-ME-Sender: <xms:Hz_-Ywb7ZT5Z86BFuUbmchyD4L-g_EN8US7-KsQaodJW0INZh8Ecjg>
    <xme:Hz_-Y7ZhcRZk-bhachGjoQa_fed2AAa6_BO1ItaUu41oLRceqE40xegaRbG0B8Oap
    wR1xpSYsHBfmXGPFuY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelfedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:Hz_-Y692OEvkLEnVNg-DdPeqvqWtHNa27mzMnmjgwgqwSCwioAv73w>
    <xmx:Hz_-Y6ou4zFNxQR3Go0MBsBE3fvVKZK9PzUPqqba-4eRf6-TCpq0ZA>
    <xmx:Hz_-Y7peowaOl05SkKZuMCRpkLHI6Lym4IbYbBJXElUrQf5QDMAGwg>
    <xmx:Hz_-Y8lWh1xE6wx9T6QW4F9XuwILFTlkfvIuof2jSDcwPFZgRn5OIg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0D81BB60086; Tue, 28 Feb 2023 12:51:26 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-183-gbf7d00f500-fm-20230220.001-gbf7d00f5
Mime-Version: 1.0
Message-Id: <83565b97-8149-492e-8f22-e3722e659b98@app.fastmail.com>
In-Reply-To: <1b9d4d586ae7bb5cddbb97fbc9ec7de1c475afee.camel@infinera.com>
References: <20230220115913.25811-1-paul.gortmaker@windriver.com>
 <AM0PR04MB6289FA528F76DDADB2BB0F958FA89@AM0PR04MB6289.eurprd04.prod.outlook.com>
 <Y/o8bQz5CuRhdD8B@windriver.com>
 <CADRPPNRTZmhEbS0Ts6iA7bmviT_C+caUkyFwJ5WGcN6q1rTORg@mail.gmail.com>
 <1b9d4d586ae7bb5cddbb97fbc9ec7de1c475afee.camel@infinera.com>
Date: Tue, 28 Feb 2023 18:51:06 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Joakim Tjernlund" <Joakim.Tjernlund@infinera.com>,
 "Leo Li" <leoyang.li@nxp.com>,
 "Paul Gortmaker" <paul.gortmaker@windriver.com>
Subject: Re: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms
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
Cc: Scott Wood <oss@buserror.net>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Claudiu Manoil <claudiu.manoil@nxp.com>, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 28, 2023, at 11:03, Joakim Tjernlund wrote:
> On Mon, 2023-02-27 at 14:48 -0600, Li Yang wrote:
>> > > > 
>> > > > Here, we remove the MPC8548E-MDS[1], the MPC8360E-MDS[2], the
>> > > > MPC837xE-MDS[3], and the MPC832x-MDS[4] board support from the kernel.
>> > > > 
>> > > > There will still exist several e300 Freescale Reference Design System (RDS)
>> > > > boards[5] and mini-ITX boards[6] with support in the kernel.  While these
>> > > > were more of a COTS "ready to deploy" design more suited to hobbyists, it
>> > > > probably makes sense to consider removing these as well, based on age.
>> > > 
>> > > These boards are mass market boards that sold in larger amount and are much more likely to still be used.  We would suggest we keep them for now.
>
> Agreed, the RDS design is still used here.

Can you elaborate what the typical kernel upgrade schedule for
these boards?

Note that for the debate about dropping the machines from future
kernels, it does not really matter how many remaining users there
are or how many boards get sold. The only question is whether
someone is still planning to provide upgrades to kernels later
than linux-6.3 in the future.

It sounds like there are commercial requirements for validating
and distributing kernel upgrades (in addition to hobbyist uses), so
I would expect that whoever is paying for the upgrades has a clear
plan for how much longer they are going to do that, or at least
a some idea of how many of the previous LTS kernels (5.10, 5.15,
6.1) ended up actually getting shipped to users.

It may be worth pointing out that the official webpage for
the MPC8313ERDB board in the example only lists a hilariously
outdated BSP kernel based on a patched linux-2.6.23 release,
so maybe the marketing team can change that to point to the
latest validated LTS kernel instead.

     Arnd
