Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 970B56A6EBF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 15:46:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRcW52phYz3cMn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 01:46:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=WI6ErPTA;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=WJ8xAd0z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=WI6ErPTA;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=WJ8xAd0z;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRcV71jXVz3bgX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 01:45:34 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id D5ACC5C0100;
	Wed,  1 Mar 2023 09:45:32 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 01 Mar 2023 09:45:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1677681932; x=1677768332; bh=iypH0MdZHv
	JtKF700L2M/2TbnXQ0IRYI2E4BYc3g7pU=; b=WI6ErPTAy8FzIqg0JrtzNfJxLu
	FAJ0rDXw7dku2/XI94wnFoH71VJuo6n1iDDkbaTEgZNqr/ebs/QgDT98AM8CpCqX
	zVqroRQw6G8ycQRntfDuZImRVGetP1I9EZ8MFB4BnrPjN4hk2LzR9UUffkaienX3
	Sl1Zgmx0mIq/92n5dkJV3L8sYvopt7kxttLSN9u9WcippMdK9TNeNKMO65FTf01v
	3VGucP90RNwUniwqPCweTvHdaM7bzn55j1Z5Us/non2pNZ/yiygWw4h2sGWFo9Bj
	Mavrxn3d0WyNypBNQDd3WbZCl7o3P7MLH2LXKQMRPOiqQyA/npg7wB7qEGYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1677681932; x=1677768332; bh=iypH0MdZHvJtKF700L2M/2TbnXQ0
	IRYI2E4BYc3g7pU=; b=WJ8xAd0z0LqfwdC68V50mdcgo4qpeCoiYKVrE+JAjXdk
	A80wLWhePBF371Cza4H7nv+9XGcg3z+Q8kuwfC3P9aQBT93hJGlG7ZZf4277otoT
	SMQ4Fb/ZIP+2ljRf7rVuZ2PSsP0phD6MRE6ApYARTI7tfO02og1tbUCGK24Lzj0R
	8sxNQS4W5Vyc8qNVIT6JXDY2uSNNr/xH6N5trNx76uQOgMUOc9yph6PZB9Ey3o34
	pWglDWGiogDFNtOzjrbVdGWQqZweHCcKJWuLhCFZIr1mhQQcvy77WiqGCso5t4Fm
	LGOvq/i82LuxawZm71cnveK7vDHnb0RcZOpy7OKtgg==
X-ME-Sender: <xms:DGX_Y_Pdq06aMvilO9UwqSz6N1s0jY3FmZy1toBpdPv_z3IHkM4upw>
    <xme:DGX_Y5_uj4bl41rQnI0fFo7dw7vTUNy0ng4ueQFjgkyfUnCza_O4sLaHPe5iq6Efd
    LJwW4JumfUjrXgJs0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelhedgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:DGX_Y-TLn28KDDvcIqY0BRc78yFe3qHEIM_OKBLtjILJxshNKNz_BQ>
    <xmx:DGX_YzsUTAtO4j6NaTuaLUNxBcLHsWhc9atPIqKl6mNLXIz9cUZRJQ>
    <xmx:DGX_Y3djOTZ2HUd1YXzpDLpXeUc4os_rqoY1526chGUTpVUMDkcC9Q>
    <xmx:DGX_Y4FAf0gFuo8_a2BguYQ9-K5iQTKl1nflKjH1GtcTKGQYciTvTg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4F809B60086; Wed,  1 Mar 2023 09:45:32 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-183-gbf7d00f500-fm-20230220.001-gbf7d00f5
Mime-Version: 1.0
Message-Id: <7e506606-95e0-4863-ba7e-48e35882b492@app.fastmail.com>
In-Reply-To: <a1e955cb-f48d-4630-6c9d-2fb3e2212aff@csgroup.eu>
References: <20230220115913.25811-1-paul.gortmaker@windriver.com>
 <AM0PR04MB6289FA528F76DDADB2BB0F958FA89@AM0PR04MB6289.eurprd04.prod.outlook.com>
 <Y/o8bQz5CuRhdD8B@windriver.com>
 <CADRPPNRTZmhEbS0Ts6iA7bmviT_C+caUkyFwJ5WGcN6q1rTORg@mail.gmail.com>
 <1b9d4d586ae7bb5cddbb97fbc9ec7de1c475afee.camel@infinera.com>
 <83565b97-8149-492e-8f22-e3722e659b98@app.fastmail.com>
 <a1e955cb-f48d-4630-6c9d-2fb3e2212aff@csgroup.eu>
Date: Wed, 01 Mar 2023 15:45:12 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Joakim Tjernlund" <Joakim.Tjernlund@infinera.com>,
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
Cc: Scott Wood <oss@buserror.net>, Paul Mackerras <paulus@samba.org>, Claudiu Manoil <claudiu.manoil@nxp.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 1, 2023, at 15:23, Christophe Leroy wrote:

> So, to come back about the RDB boards, we have a couple of MPC 885 ADS 
> and a couple of MPC 8321 RDB. They are reference boards and we always 
> check that a given kernel version properly runs on them before starting 
> to port it to our hardware.
>
> Hope it clarifies how those reference boards are used.

Indeed it does, thanks a lot for the clarification!

     Arnd
