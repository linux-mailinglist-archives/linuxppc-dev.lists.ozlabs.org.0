Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2880794AD28
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 17:43:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=bxeYvS+X;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=exKmP3jz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfDx90XWfz3dHL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 01:43:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=bxeYvS+X;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=exKmP3jz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.157; helo=fhigh6-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh6-smtp.messagingengine.com (fhigh6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfDwP0qFYz3cdn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 01:43:16 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 49219114EA9D;
	Wed,  7 Aug 2024 11:43:13 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute4.internal (MEProxy); Wed, 07 Aug 2024 11:43:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1723045393;
	 x=1723131793; bh=GmXLkrFZAsugNyP57xRFNgv2S9AFoG7Hpwkv4yw8wuw=; b=
	bxeYvS+XLKJTyVoWC4GwjqSI2peT76zGkI3b3SJ4cMozO6eCo90ZA7GW3bVwxkKd
	Q1Vct9AxPjzBO40EJXzJ2MJP7rkg6K68kvFOExNjG9aMZhdtU8X70JBqDS8pAa+4
	ZeCJjxV3PAucqqcIOXOdyptNb75t6T0MchTrUgWr92Tmd3DSJ1DFcg7K/wyNHVXi
	1UUJvgtG/Vnpn7elYuomTCkN79F7a072cncoggwMUdi22/80fHqy3Hr0FCqThbnv
	XCFPB2s+OoumFeqe6FF+3g8Z/7FjUhHUsGhobriwQG/y2PXXeGYyUfDkd2zld2EG
	WO43NRhMLukCpkS98MUqZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723045393; x=
	1723131793; bh=GmXLkrFZAsugNyP57xRFNgv2S9AFoG7Hpwkv4yw8wuw=; b=e
	xKmP3jzjwzEi3xr+5dJ/nKvhdnUCgs5trLyhS3cR+Dp2Pl50lHMn3NsY288gZ7e8
	wLpMoUOjaG1yA1ej09ITc4MtLzU7Di8idxng2MiTLiyep43Vap+1zr8aVq6WT4Jx
	nKg0vWti10jMPZR24kTqcqalFYyXZe8cwhGF4595BMfZxX4rI7DnlHoFTtOfYUWF
	TNUYv8aS2KbFqQ9SfcyRUVJht4sn9S6di1ue+SuZWgSWenMjHvNcNo4KbUUlw3bc
	fewP+uxyLPyq+OqOd2PN2kd0pVDuLxjjfn/KCjsUTeJ6A2JPlNUbWqOe3gm05cDm
	cE4Du7WX90fT21RIJ3ZXw==
X-ME-Sender: <xms:EJazZpIxO6cWtA-7XcQEs8_iuPolxyF5dApHJ9hj89YOb18tWBnPFg>
    <xme:EJazZlJjS_llroA7_Q3Q0sGJMawBpC0S4OordxfaWTwrVG93LX7lblWPULvPQvjry
    IvdkX0DaZ9_0lT01wo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrledtgdelvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdv
    ieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedt
X-ME-Proxy: <xmx:EJazZhtOTYO95RWKtu_-hYlrmF00XW2QHgHrL67TJdQrI0pT8QL4VQ>
    <xmx:EJazZqbv3Qv23N7qWw_hE8lrX8Ea-xhaIGWSU0eYQaXNR3CJ9KpSJw>
    <xmx:EJazZgbyGZDbogV8cN2B6h3FqmY5dO96PHjBpWXJhFd-MCN5GMdrBg>
    <xmx:EJazZuAM7Hy50f4w-Y7ssuECjBv8083MGJGq71z9hWSZ-iY4tzEU1A>
    <xmx:EZazZgM9J1Hj1voS7a0XIddiivmxcCnr13whQ1rhSym7gyb7nmAr3hkY>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 75F3DB6008F; Wed,  7 Aug 2024 11:43:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 07 Aug 2024 17:42:03 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Stewart Hildebrand" <stewart.hildebrand@amd.com>,
 "Bjorn Helgaas" <bhelgaas@google.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Sam Ravnborg" <sam@ravnborg.org>,
 "Yongji Xie" <elohimes@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Philipp Stanner" <pstanner@redhat.com>
Message-Id: <877b71ea-341b-4013-bbee-8f4df9c961c9@app.fastmail.com>
In-Reply-To: <20240807151723.613742-1-stewart.hildebrand@amd.com>
References: <20240807151723.613742-1-stewart.hildebrand@amd.com>
Subject: Re: [PATCH v3 0/8] PCI: Align small BARs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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
Cc: linux-pci@vger.kernel.org, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 7, 2024, at 17:17, Stewart Hildebrand wrote:
> In this context, "small" is defined as max(SZ_4K, PAGE_SIZE).
>
> This series sets the default minimum resource alignment to
> max(SZ_4K, PAGE_SIZE) for memory BARs. In preparation, it makes an
> optimization and addresses some corner cases observed when reallocating
> BARs. I consider the prepapatory patches to be prerequisites to changing
> the default BAR alignment.

It's probably worth noting that Linux does not support any
architectures with software page sizes smaller than 4KB,
and it would likely break a lot of assumptions, so
max(SZ_4K, PAGE_SIZE) is really the same as PAGE_SIZE
in practice.


     Arnd
