Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 921326A9383
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 10:15:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PSj4K3Ykzz3cjP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 20:15:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=mYHIII7V;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=XhCUxSo4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=mYHIII7V;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=XhCUxSo4;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSj3J39B5z3bNn
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Mar 2023 20:14:34 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 2E82A5C0190;
	Fri,  3 Mar 2023 04:14:30 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 03 Mar 2023 04:14:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1677834870; x=1677921270; bh=qkXaNEI7C4WuUSsRrKltcxyz7Ki8KZpxM9o
	6GxfBHQc=; b=mYHIII7V+cFIXnMScfBSivaXBhu6MuUO7lI8FxLkv7C1UyfaSwV
	gGINal6u3cHSywurllIRUH9HLOOvaLoa0elSg4qSCFlnCLx6yHrC6K3LeZSiW9XG
	yc7XwM+RhxTDje7vqzSX4nTYMIm3UowXJrxUK9yH79WSHDX3AGYIbV2Lko9lJbCs
	0RkXEVk2QaJuzTl+yoUCEvoUyMobXsxOyCu0cCvqEHhECMDXTtuKijPHyAK7zaZh
	x+utfBmEPadWaKti+6T8lcCB3WaT26BEBCkfxOuYJShLAk1drRY7S5naxa2TpoSl
	UBJOxU0ah4WFXy6I78gP8pLWjPfy1tesZiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1677834870; x=1677921270; bh=qkXaNEI7C4WuUSsRrKltcxyz7Ki8KZpxM9o
	6GxfBHQc=; b=XhCUxSo41GUK7I3EDcWhJlNuEs5bkIMvEqhF+oTXdjuF/pKrUqy
	MV4T744KusiLb4KGLN6uPM9OnA4QAf8E2jphm8kUip5Qioe7fB6Ws8ElpoYGm/F0
	Vnev2u419Vvxk77cHTaxmMQg85KDDZLRr2zO6+Hdn93+BcnTh9slRlMBa2aZsoK+
	mUpSuoj3nIHbHFN20S6sn4D2Cu7P7fRPlaZBaBCEfMHwP6pe0RI1gbIJWfDjsRrR
	k9Ea37Z9QRpmHrDDNP8PmyQNHDV0G8Kf3Eeszd8ZtKmZwx5tWitKwOh3kfp6cDab
	sTdCdxAX8+SLcJg8LfqzLN1moCHAjoiFmmg==
X-ME-Sender: <xms:dboBZBXqDy7rLTUq7vv9uLS3S_0f6951IicM3NE2w6CLfGEievFuyw>
    <xme:dboBZBmlZzKqOshopu4NBboVmqz5LreGNuiHAI8b13aKrpXvmCtWnXD21dwHPfND4
    g4NnZX7Yc7F8p12DfI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelkedguddvkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    tehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrf
    grthhtvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudek
    tdfgjeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:dboBZNYZ4mx6TsZovH_BQkja1oHl04ijqgjYivHdK1q1uGeKodcs-g>
    <xmx:dboBZEWwpikLzi3Xw6mHuQ0YJzkIQrF5gJjEpzw2oeHGBZ7TNqWnCg>
    <xmx:dboBZLnPNhCEYRPsgdcFCEGjPIsgnGopgbyNJNum9UKS72kYNHZPzQ>
    <xmx:droBZEBBF9tIUlk6DYrdAYKnugpl4mWp7bu-KnrVZruDqHLL1MykQw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8D995B60086; Fri,  3 Mar 2023 04:14:29 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-183-gbf7d00f500-fm-20230220.001-gbf7d00f5
Mime-Version: 1.0
Message-Id: <3efa1e29-3be9-4047-beef-eb02762ae8db@app.fastmail.com>
In-Reply-To: <ZAFHnaSN6F5ZYTO5@windriver.com>
References: <20230220115913.25811-1-paul.gortmaker@windriver.com>
 <AM0PR04MB6289FA528F76DDADB2BB0F958FA89@AM0PR04MB6289.eurprd04.prod.outlook.com>
 <Y/o8bQz5CuRhdD8B@windriver.com>
 <CADRPPNRTZmhEbS0Ts6iA7bmviT_C+caUkyFwJ5WGcN6q1rTORg@mail.gmail.com>
 <1b9d4d586ae7bb5cddbb97fbc9ec7de1c475afee.camel@infinera.com>
 <83565b97-8149-492e-8f22-e3722e659b98@app.fastmail.com>
 <a1e955cb-f48d-4630-6c9d-2fb3e2212aff@csgroup.eu>
 <ZAFHnaSN6F5ZYTO5@windriver.com>
Date: Fri, 03 Mar 2023 10:14:09 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Paul Gortmaker" <paul.gortmaker@windriver.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms
Content-Type: text/plain;charset=utf-8
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
Cc: Scott Wood <oss@buserror.net>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Claudiu Manoil <claudiu.manoil@nxp.com>, Paul Mackerras <paulus@samba.org>, Leo Li <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 3, 2023, at 02:04, Paul Gortmaker wrote:
> 01/03/2023 (Wed 14:23) Christophe Leroy wrote:
>> Le 28/02/2023 ?? 18:51, Arnd Bergmann a ??crit??:
>> Hope it clarifies how those reference boards are used.
>
> It was really useful input and gave an insight into how things get use=
d.
>
> But let me put a slightly different slant on things.  If there is no
> maintainer for the platform/architecture/CPU, then where is the
> obligation for mainline to keep it up to date just for your company to
> use the code/BSP as a reference?
>
> Do they continue to do this for one more year, or three or ...  ???
> Does someone list themselves in MAINTAINERS for arch/powerpc/83xx ?
...
>
> If you see change 0123abcdef breaks boot on your platform, you have a
> legit voice to gripe about it right then and there.  Don't wait!!!

I think the answer here is that Christophe is already the only person
that does this, so he is the de-facto maintainer for ppc32 regardless
of whether he wants himself listed in the file or not:

$ git log --no-merges --format=3D"%an" v5.0.. arch/powerpc/platforms/[45=
8e]* | sort | uniq -c | sort -rn | grep -vw 1
     61 Christophe Leroy
     12 Michael Ellerman
     11 Thomas Gleixner
     11 Oliver O'Halloran
     11 Liang He
      7 Uwe Kleine-K=C3=B6nig
      6 Nick Child
      4 Rasmus Villemoes
      4 Randy Dunlap
      4 Mike Rapoport
      4 Julia Lawall
      4 Andy Shevchenko
      3 Xiaoming Ni
      3 Nicholas Piggin
      3 Marc Zyngier
      3 Christophe JAILLET
      3 Christoph Hellwig
      2 Paul Gortmaker
      2 Mathieu Malaterre
      2 Markus Elfring
      2 Jordan Niethe
      2 Dmitry Torokhov
      2 Arnd Bergmann

Pretty much everyone else on the list above only did treewide
cleanups, dead code removal or compile-time fixes, while Christophe
is the one that fixed machine specific bugs and added new features.

    Arnd
