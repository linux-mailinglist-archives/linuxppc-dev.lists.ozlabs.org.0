Return-Path: <linuxppc-dev+bounces-3223-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CEF9C8DFF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 16:29:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq3wc5PRmz3023;
	Fri, 15 Nov 2024 02:29:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.154
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731598160;
	cv=none; b=G8cxrHq6lWXJTleAsi9fbxJI857QXL1yaJ6GMsiGgmFtPEQ+fnLfiTrn7uSarrG654uyTnkw0rQK3wVUTXU/vH4Dwi7I1HyP9qarJvy77nJrQCCRDn+kE5hdAoagUjBvn3mKzhxM6afDiusyl8ycNg5ZHT/tQ6CL4OYIlkcZC0JFtbfULQukTuVnlgU/rzhbKSjH/KawzATpiIew0EaBwwVwjuFuglbzHS1NYMMMmdMs4t4Unn5oot7BbYT5RikrT79C7Reanhu/wIQx2wGjQFp3moAH6hdEYI7HZ+ZDCyKAq7pYU3jHKNRLmgy3bVa0jpQRNr8hqQA3FeBLYTikIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731598160; c=relaxed/relaxed;
	bh=JNXio+hFYDSW3CeIUnq8bODDYIvYBVTs341BclxdZkI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=lT5E0/RsCD7UxD52sVPUYVP4IioSTaNxqwWeQ2flsNdQLChutq1bM92/FW6KFCYrIjLUZAakzdwmy++GfVv4Wvk5MKLRyjwcf5ALnX12EOjh4hP0L6WZJq2ROUf8VXlYsNm2ctvLc4JQf+FxodW8nhYiCIFSF3Z8JHkSqCkwZw7sRdQkuDXtEAGziQNhTL0mrxBfw721GAjkXmYH56lP7iu5BdYBNnsRMnJLkaYZItxZNvU6AszducGr4KorIFILaVZwAhEJewtMGoXPgi/qfKOZtZeNAmhE788jSORkcK1juO2j/eNMFsF4dOTSBkjldHgP6LDw8sqfh5pYaUk4KQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=PJjSsaGA; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Au+VDt7j; dkim-atps=neutral; spf=pass (client-ip=103.168.172.154; helo=fhigh-a3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=PJjSsaGA;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Au+VDt7j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.154; helo=fhigh-a3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq3wb68F6z2yxP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 02:29:19 +1100 (AEDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A184A114017C;
	Thu, 14 Nov 2024 10:29:17 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 14 Nov 2024 10:29:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1731598157;
	 x=1731684557; bh=JNXio+hFYDSW3CeIUnq8bODDYIvYBVTs341BclxdZkI=; b=
	PJjSsaGAbC3uED6V7+qefxjF3UQbb3pmKIk9AW5Ka/WAcmsWKAGwR5JtfUMCAAKj
	PrCkS68NeuA08AhiRm8MleRpCKYfSll1OASnHAtNALB9RmCnOxGIWkAeMxf2Rt4k
	fGeRqx79rizqdZeVAN1dlCP2Wf027KLwOOYzdWq1051Si6Am2bGWPJRgJHRZmwfy
	PuaebXIwUzdGtyg8pFbgWGJVsk0JEOu6b6rAsy8IuN5X4jM7OIqh9GiQTBR8VTo4
	KQbwZWE9X2bkIYZ+pXAHtJV22v20s91o9sKO2Bq0yCvRdeaX7n5VOsPK0rwJzKob
	lK01aKvmrVyiAol80Mx4Wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1731598157; x=
	1731684557; bh=JNXio+hFYDSW3CeIUnq8bODDYIvYBVTs341BclxdZkI=; b=A
	u+VDt7jVrcckF2sIZatNXZURl0ukGFXsFADH49mc7CAFuhgRcrplca97ZUImAhni
	LWBy3EZOjR5ENPZ/6lTCqqsQAEk7Gx5dZRmu1hT6Fx6BdfhdmAqQ7nCHWSmWCXrX
	wX2h5a7reRAqLQ6C4Em6m/DZlP78VqBftde4V6s6Ei/L2bYLtM7Mu6yxJOR7EtRH
	abhFNHxXLe3Mw19MeNc9ud6oeCfUL5kiNAls5Fwp8wuAhg+Ct9v6n3dDjDHu5OT6
	FTqWiVcGkzIrU9pJNOdsyXP2PaqqmbK3yhxS1gUxhZIJYsn3WIOuBeCaEb1ugUZl
	EmrtWVIWclEwGJMgdE73A==
X-ME-Sender: <xms:TRc2Z-jMBNtjQCb-HQa7A1_p_aOR3Tw1shX1YLBh4_VF-l0FiVrX3Q>
    <xme:TRc2Z_DK-e728oKOpYc8_NJtjoIg_dqvR1QcdKysVpB9Yw7f9MmHKRYTMPha5eiyt
    yyVDLs6Mzwiij2ys_E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrvddvgdejiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpeeufefggeejjeekudeivdfhieeivddvgedtkeeivdek
    feegffevgfehleehuefhieenucffohhmrghinhepthhhvghrvghgihhsthgvrhdrtghomh
    dpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohephedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdr
    rghupdhrtghpthhtohepghgvohhffhesihhnfhhrrgguvggrugdrohhrghdprhgtphhtth
    hopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtghp
    thhtohepjhhksehoiihlrggsshdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnh
    gvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:TRc2Z2FgT1kIrz5NjxvlNXDzqCUWmXoLmLybU3ifufI61Pfv6NENdQ>
    <xmx:TRc2Z3SbspPkgZtoU5U8pT5C_8g5zLgxPVPunPmSvA7C1Z-TpDHd1g>
    <xmx:TRc2Z7ws6n0h-XN_z0meiUWU-ehcqp7Z23JnhgxfbgsmPcegxTSvlQ>
    <xmx:TRc2Z16QHMfpdODpaubS8tP-9ZxT6A50JMGFsB1K-OyqrtzFMY7DiQ>
    <xmx:TRc2Z9uxurvTtHY39hT-3CvSvfLqw_mwGTWfMAiGE-8t0ZtQM-L7bK8X>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 32DA72220072; Thu, 14 Nov 2024 10:29:17 -0500 (EST)
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
Date: Thu, 14 Nov 2024 16:28:56 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Michael Ellerman" <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, "Jeremy Kerr" <jk@ozlabs.org>,
 "Geoff Levand" <geoff@infradead.org>
Message-Id: <9eed5e2a-4ed1-4195-a5b5-511b4d5cd53a@app.fastmail.com>
In-Reply-To: <20241114125111.599093-1-mpe@ellerman.id.au>
References: <20241114125111.599093-1-mpe@ellerman.id.au>
Subject: Re: [RFC PATCH 01/20] powerpc/cell: Remove support for IBM Cell Blades
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Nov 14, 2024, at 13:50, Michael Ellerman wrote:
> IBM Cell Blades used the Cell processor and the "blade" server form
> factor. They were sold as models QS20, QS21 & QS22 from roughly 2006 to
> 2012 [1]. They were used in a few supercomputers (eg. Roadrunner) that
> have since been dismantled, and were not that widely used otherwise.
>
> Until recently I still had a working QS22, which meant I was able to
> keep the platform support working, but unfortunately that machine has
> now died.
>
> I'm not aware of any users. If there is a user that wants to keep the
> upstream support working, we can look at bringing some of the code back
> as appropriate.
>
> See previous discussion at [2].
>
> Remove the top-level config symbol PPC_IBM_CELL_BLADE, and then
> the dependent symbols PPC_CELL_NATIVE, PPC_CELL_COMMON, CBE_RAS,
> PPC_IBM_CELL_RESETBUTTON, PPC_IBM_CELL_POWERBUTTON, CBE_THERM, and
> AXON_MSI. Then remove the associated C files and headers, and trim
> unused header content (some is shared with PS3).
>
> Note that PPC_CELL_COMMON sounds like it would build code shared with
> PS3, but it does not. It's a relic from when code was shared between the
> Blade support and QPACE support.
>
> Most of the primary authors already have CREDITS entries, with the
> exception of Christian, so add one for him.
>
> [1]: https://www.theregister.com/2011/06/28/ibm_kills_qs22_blade
> [2]: 
> https://lore.kernel.org/linuxppc-dev/60581044-df82-40ad-b94c-56468007a93e@app.fastmail.com
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Nice clearnup! Whole series

Acked-by: Arnd Bergmann <arnd@arndb.de>

Everything here looks good, I had a few comments, but those
are all for follow-up work.

      Arnd

