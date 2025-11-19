Return-Path: <linuxppc-dev+bounces-14346-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E107AC6E649
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 13:13:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBL3Y52VJz3c3W;
	Wed, 19 Nov 2025 23:13:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.150
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763554393;
	cv=none; b=jUhg8LBunlsbQChABK9R6oEZCM/v+t8wgVQ3YzC2zHFtzkM3VBEkTHbdgBBq8QI2Jq0TTouxLptVMfpIkSRNmia/BLtZLi3rEuBKj92A7NIxE8PqsogIBrzut7IT3TBV5hz5hS54fdT4ybxzn6br1ZjTQBomjdbOrmKOZEjPu1gykXFwe+spfditjf+bZqh4BuwYjq9P8gejbQ2h1tJELEqk1/Q5xHK2O8OzlFyJFWkISPTM0Iu7/mAxKioIsS30ynlWfo9h0/JRda9y5l9Uemux91+IUFjh+q48CwDNyno24w90b6Fq+9VRiZT1Mcw+0bGOz96xhOOlv3b4Us5Yqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763554393; c=relaxed/relaxed;
	bh=shwCsrIWJI8x8NNqpp/kq4mSwNMvFi+d1jzVLUSvxEM=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=fGwUppOCu8NZD7+4VFMK3mw/PrINbbneiG8gh6fWmqQRieA1vzGYa7JoFHA8GgBMwOhVe7h5yPkg1Ftpl9WI1djPKUbqpeY1PQupLpmC4kLNoyVQL5PmmZGgOhwzasJnQHa/jqQH/xxPxX5XxL7pjPvb2IKLgDfbiyE3nVWlsAawEhymlzVKwfB7df7WomzZoA1wbkdfT8JFXLZd+/Qxo3FJ3iitQ3c3gOXXgRpZy+69t1PGFJzMOh5xvUwgnX2vpqiuR9d+rxSVRMwSkrIbsCx3G17eA2yP8YcYHHm4zHGdJ8zlDxICLSLYfALeTkPuXQMNzPgWH7mGEinCUG0QGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=TzL0tJDv; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=cxEMCVsD; dkim-atps=neutral; spf=pass (client-ip=103.168.172.150; helo=fout-a7-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=TzL0tJDv;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=cxEMCVsD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.150; helo=fout-a7-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBL3V3lLSz3c2P
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 23:13:10 +1100 (AEDT)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id AA171EC011B;
	Wed, 19 Nov 2025 07:13:06 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 19 Nov 2025 07:13:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1763554386;
	 x=1763640786; bh=shwCsrIWJI8x8NNqpp/kq4mSwNMvFi+d1jzVLUSvxEM=; b=
	TzL0tJDvqKyhgjue5u/Gyh0/aLzH+K9Kf86R1nXHb0LD3O8g3gA7ksJotUWW/PYK
	vhKyCGcbKRkA86+vCMjFbiMORKNd65UbWic8AYwF0hTPqrzRLIl043cj98tCM1q8
	o1eeyfJF8HYK64iYLZmfhZqyvAHBMFjk7AG2vzUsKDF0yWfrmtcZsJTs0TFWC46K
	DuDLIYsQPTsVf8jFr6CAtWjlZY+0gF5aeoenjmp5Bpx+fr8SsgLtVLUvQyueafaz
	L+lupAVenrfXdoqwTrghTEkpRQfAldaJdrXzPZrFJcE2W5Q9ruv2eQT1lUdk/kWB
	a1quG0cZehsu4IiGHRI1Lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1763554386; x=1763640786; bh=s
	hwCsrIWJI8x8NNqpp/kq4mSwNMvFi+d1jzVLUSvxEM=; b=cxEMCVsDdHFeCZ9oQ
	vfb9tHLhmUqXl8hbAg0FWuSLUXNJrx1+Qqplv6zRNrzl3ekLySPv4ZVGWeZC6UI7
	yt44H9dJyBbJNqm+qCDF5Zkg+q4TDskfIEWQ5/jc4gNAkAFTUdO0wxm+QJmTXJeX
	Obz/X3gaFok+44bZSLIpYhCOGbp69BMMSsQ/C9Q4XGWdJ0MY7OcfM/I+P1DPUpMC
	D+FP2NdE8ShiCOOGBr7H56l2vT4D62Xza8nW3CiSavRuOI4Q5N2yUqjWtTs9zyAS
	UQg4FBh5L0PdAv7Vmdkw7Hamy7icLMTjw1Xf3TahZ6gLgUeF+Ds0DkvXPD4Yq0yL
	ext9g==
X-ME-Sender: <xms:UrQdab3x8jJfV9Fchoto8x1gYOfQZi5le_EExxCulUkDpJspVUUwrg>
    <xme:UrQdaU6Pa5ICJkspJkFYPLtNwr5_DTY5bnw2z_4yN-kZSUTGNqNphnAD9seGX3xVt
    RqPLY2hDOx05t41SjNpcE52DFvS4VcuX1WmrNzp_CEQTlJPexU2LBIi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvvdegudejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvffkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhfeduveehheejgfeileelheduieffleevudelvdejtdektedtgfeggffffefgvden
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupd
    hrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhr
    ghdprhgtphhtthhopegthhhrihhsthhirghnrdhmvghlkhhiseifvghsthgvrhhmohdrtg
    homh
X-ME-Proxy: <xmx:UrQdaWx4vxuUx3BoQgxj6Mrh6BoUat-ERSk6lFbNSE6bq8CFEMy2Lw>
    <xmx:UrQdaaDREWtZEN86_kRNv1pSzQmugbr8NEssTSG6Dgg4wspFcyszkQ>
    <xmx:UrQdabZ8zQL8OahxSWDhXVB2jEgvuePBKGgZptoa5V5_cjfZEd9-yA>
    <xmx:UrQdaage46UN84Qk68qtRunZcAefsYR_-2mIRFqTLRSjWud77rIsag>
    <xmx:UrQdaRSSot0ZdmUlh_B5EkXLXwsrwrU_TCStbT0edRjPbgKfu8XrBiiq>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6BD8E700063; Wed, 19 Nov 2025 07:13:06 -0500 (EST)
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
Precedence: list
MIME-Version: 1.0
X-ThreadId: A82zVOdlIBLo
Date: Wed, 19 Nov 2025 13:12:46 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Christian Melki" <christian.melki@westermo.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Message-Id: <6aea6b7f-9bb8-4598-ba12-629a557b6cc4@app.fastmail.com>
In-Reply-To: <4f3e8320-c417-4de9-8026-f9b72ede7601@csgroup.eu>
References: 
 <PA3P192MB2865C07D634E3B775D003C7F8CD7A@PA3P192MB2865.EURP192.PROD.OUTLOOK.COM>
 <4f3e8320-c417-4de9-8026-f9b72ede7601@csgroup.eu>
Subject: Re: PPC code-patching calls tlb flush with irqs disabled?
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Nov 19, 2025, at 11:40, Christophe Leroy wrote:
> Le 19/11/2025 =C3=A0 08:38, Christian Melki a =C3=A9crit=C2=A0:

> We don't want an interrupt in the middle of a patching sequence were t=
he=20
> code would be in a wobbly situation.
> We also don't want other parts of kelnel being able to access that=20
> temporary RW mapping of kernel code until it is unmapped.
>
> How can we achieve this goal if we can't flush TLBs while IRQs are=20
> disabled ?

On 32-bit arm, we have the same problem, and AFAICT the workaround
here is to use stop_machine() as part of patch_text(), to
ensure a local TLB flush is sufficient.

   Arnd

