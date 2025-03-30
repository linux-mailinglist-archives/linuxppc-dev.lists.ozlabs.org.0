Return-Path: <linuxppc-dev+bounces-7384-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77ACBA75909
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Mar 2025 10:52:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZQSgH72QCz2ygL;
	Sun, 30 Mar 2025 19:51:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.150
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743324715;
	cv=none; b=IojWW+CLm2ZB+D6r+ZIW5jI1EwO0vRMebRWRBPBjcFC08LI3fBO+KjQTc4T1/cYDSmEjOEZThKtOdZuGqbselsgNOqAeAsnGfCSrIGmIcth8CCvKRAWDYYDyCYGPdbnraRLl2tNsqviXgxraxR1VMja8/3Kg6LIIRw+qSAxeCsFTToam4kTxC9ggcBRVpBn0hTCkmUtd5xW+Lyb2v0oAHNpvQMKRHUmNjaInFvy7V+IL8KfrIymLAOFL5wmWRH2aUEi8PRyKHmFnsvjRLVtA45TNOJZP5gbQkFTi7zqi4erXZVSDLYu253kRxn/PQiqnZ5AwEB273nhhhET64EzOIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743324715; c=relaxed/relaxed;
	bh=dTqWupLjl7cdoWEq+RC/Hw7jFYiUJzqNImVvEUcMouk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=STj388X3fpCTJjSSnlIu45uL+C1GwVwvW2sBEbtKMrrxFn40e4A0dkkDtdxa9dvuzAS598A8300lX4ArBus00cI/tqxOnnqSDdjFb80KIWZbACnZpg6nXI/OWDTFX3aeeI0r+duclhA4lBe1I4Yfcs/XwS7nZo7mRPV/CThM9ausm+AeuaLriOcroSr+RaE3FuyQR6qR1wKu4UhMAyOCH+P2LM+58tF0fcAXtGzlWXCADcTn6sIi8N7Ojk5wooB5VPPMws8xup0L0MkRsSA74Sfi8Mf/esFCfoexfkO/9I9D7UpoKNbRMLgCStpoDbqOu8r1Fhz17GAu+H5b8+6xRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev; dkim=pass (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.a=rsa-sha256 header.s=fm3 header.b=DJnJtTkx; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=E1rLm3UZ; dkim-atps=neutral; spf=pass (client-ip=202.12.124.150; helo=fout-b7-smtp.messagingengine.com; envelope-from=sven@svenpeter.dev; receiver=lists.ozlabs.org) smtp.mailfrom=svenpeter.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.a=rsa-sha256 header.s=fm3 header.b=DJnJtTkx;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=E1rLm3UZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=svenpeter.dev (client-ip=202.12.124.150; helo=fout-b7-smtp.messagingengine.com; envelope-from=sven@svenpeter.dev; receiver=lists.ozlabs.org)
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZQSgF34bDz2yVX
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Mar 2025 19:51:52 +1100 (AEDT)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 42846114011B;
	Sun, 30 Mar 2025 04:51:48 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-12.internal (MEProxy); Sun, 30 Mar 2025 04:51:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1743324708; x=1743411108; bh=dTqWupLjl7cdoWEq+RC/Hw7jFYiUJzqN
	ImVvEUcMouk=; b=DJnJtTkx4FtwTGs+MCsrm43hFIkfqw4YaAN/iAf6TgpR0LbC
	o+1eLQsYmMCqFU1GY8C+JR/xcq53SyuUQywH6k3f+PP1xqqCMv9G5aU89r5KCy7E
	esU9ANb6BbU6oi4EDQAzKVSib3TPZUA7xmK25k/ZZsKjfKtCF6MoRwSqR4WaoGe8
	O5OzmT+DbH6fhcpx1/IDh8wahLKCbFydU1W83a2yls0+1pkAqVzGrWsoPFPE5XyJ
	Y/XUuouU25KflRa/Z0Ls1fDdWHp1E198ihXjdvNIjSRzMTLSmO6B00nsLqG++heE
	fHBafwieQnBMeyIkmNAQbORXHzaf3WjS83JPyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743324708; x=
	1743411108; bh=dTqWupLjl7cdoWEq+RC/Hw7jFYiUJzqNImVvEUcMouk=; b=E
	1rLm3UZ5lxXQ2IfWIxo+qXUsKga+l/AU8skmGxFy4QX4/GQMa7NMcwYOkgewM8MM
	Ck2QOI5duUsk+T0zZ73+5fRGnrHWUJpLxQfmTBxKHvLxZ37Bzst3f4/D9Aet4zPK
	vOgJMbpaqGbLUZxVKfusy3ZI1dT+e+3LN1NpU4mmUtL35tL+byFt99Z6c/pV4ZSN
	uUeqpQfeoHqKB5nu19xAOrAniDep7IG7sgoWkpNOmIRjPokDdFYgVM+pSzZrLWEv
	GnTOHRPwGChr0agwfrfbJJy/ClTXEAOTmVJpcLQ8GfyQO2s3598YjeYrrFFrG+l/
	rFhIHueaTk3zZB6vnEPsg==
X-ME-Sender: <xms:IQbpZzmp2KoRE1ljRh7hr-SHuOTQ2BaiFqboNbdzG_3Q0dfu64n51w>
    <xme:IQbpZ21fyxznLm7bF4IiUP9f_YTDHzitZJ2fyRbK0EmkF6a6No9IdIhjWcm98H6T1
    A2xYMiPn647jbr-MX4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeeiieduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedfufhvvghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvth
    gvrhdruggvvheqnecuggftrfgrthhtvghrnhepleefteeugeduudeuudeuhfefheegveek
    ueefffdvffektdffffelveffvddvueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhnsggp
    rhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptghhrhhish
    htohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopehmphgvsegv
    lhhlvghrmhgrnhdrihgurdgruhdprhgtphhtthhopegrnhguhidrshhhvghvtghhvghnkh
    hosehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhpihhgghhinhesghhmrghilhdrtgho
    mhdprhgtphhtthhopehjsehjrghnnhgruhdrnhgvthdprhgtphhtthhopegrnhguihdrsh
    hhhihtiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgrvhgvvghnsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehmrgguugihsehlihhnuhigrdhisghmrdgtohhmpdhrtg
    hpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggv
    rggurdhorhhg
X-ME-Proxy: <xmx:IQbpZ5rnL3CUphbOwpi10Itieqzl_zNrcEz9pXzntZMIsAR_r15lcA>
    <xmx:IQbpZ7lkVSFcsxeK4r1GNWXI3qP-UoeTeih7LDrpKSLezZoXZ4wdPg>
    <xmx:IQbpZx3dqW678wETZPJesy7jhheRYZyXtPWyvLhjpFCIv-K2IQuvLA>
    <xmx:IQbpZ6vPnTiLL8VLuFuGSM6VQQv3--z4cZRdI-xpQHE9Lvz7z9kgOg>
    <xmx:JAbpZ7MTq30YCxSfV2OaJOKEeOCcrUXIfDBhrimcqMIKp5boESOGqfpz>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B0DB1BA006F; Sun, 30 Mar 2025 04:51:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-ThreadId: T14a5dff03e1db70d
Date: Sun, 30 Mar 2025 10:50:53 +0200
From: "Sven Peter" <sven@svenpeter.dev>
To: "Andy Shevchenko" <andy.shevchenko@gmail.com>,
 "Andi Shyti" <andi.shyti@kernel.org>
Cc: "Janne Grunau" <j@jannau.net>, "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N Rao" <naveen@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Hector Martin" <marcan@marcan.st>
Message-Id: <b647d45f-32e3-4864-8a94-2e0b819fba18@app.fastmail.com>
In-Reply-To: <Z965tVhC5jxy1kqZ@surfacebook.localdomain>
References: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
 <20250222-pasemi-fixes-v1-1-d7ea33d50c5e@svenpeter.dev>
 <rjvak3c2k5a64jw4ef23i5uptg4zzl3u7lqszqbg56l4hqms77@hrkn5eydxwiy>
 <Z965tVhC5jxy1kqZ@surfacebook.localdomain>
Subject: Re: [PATCH 1/4] i2c: pasemi: Add registers bits and switch to BIT()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Mar 22, 2025, at 14:23, Andy Shevchenko wrote:
> Thu, Mar 20, 2025 at 01:23:25AM +0100, Andi Shyti kirjoitti:
>> Hi Sven,
>> 
>> On Sat, Feb 22, 2025 at 01:38:33PM +0000, Sven Peter via B4 Relay wrote:
>> > From: Sven Peter <sven@svenpeter.dev>
>> > 
>> > Add the missing register bits to the defines and also switch
>> > those to use the BIT macro which is much more readable than
>> > using hardcoded masks
>> > 
>> > Co-developed-by: Hector Martin <marcan@marcan.st>
>> > Signed-off-by: Hector Martin <marcan@marcan.st>
>> > Signed-off-by: Sven Peter <sven@svenpeter.dev>
>> 
>> Just this patch merged to i2c/i2c-host.
>
> This needs an update as well. The proper header for BIT() et al. is bits.h.
> bitfield.h is for FIELD_*() et al.

Ugh, good catch. Since this commit is already on the way upstream I'll send a fix
(and another one to sort the headers alphabetically while I'm at it anyway).


Thanks,


Sven

