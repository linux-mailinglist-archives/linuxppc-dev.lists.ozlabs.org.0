Return-Path: <linuxppc-dev+bounces-4927-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D2FA080F9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 21:00:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTbHS66zzz3c71;
	Fri, 10 Jan 2025 07:00:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.154
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736452820;
	cv=none; b=WRiETA9Dj1AbKRaUDVSsjz5bn2teFtot71feVUx0R6/BFeRYIaPxgFt/ZRYc66MBEzYzttiv8CPRSLS5+Hr1xroq9XMCjriqcVc+YQ/iSGegbG57Fr+Hayo35jVgR77kL+TNhZz1m125IKjL2ETVDnr4mzNLZwJ21c9ioiUtyWfxLYsJPzwMPHKj+oq59JE6uUoPI9/11FggnzU75lDMB7eRjOJGIw2Yrp+pukmlPEZYmnV8poXjpt3w0U1ySC2TfVlIrxe06Nek+ncihUV8Ni6kphjMyfrCA8SSaV2T+sSFLLOYuubHAzqoF5g5479jmm2PIIwP/2Eynpa96OM2Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736452820; c=relaxed/relaxed;
	bh=XLTeDIvd7zmMPfL4q/D1OTLpXR3HFsMk56y3E9zO+KA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ZcRq/ZgAbPBNuqGrEwkJhAAEiKCg1sJUuKMYgH1B90TTkxhGLd7XYwTcnGgZ+1RL21pcutm5UckRcv5KCCUqFO5tnQskC1fgl6CMg9ySweoEAqjPOIZn9cKcCRZTm3zaqiLBF2RK04n7eUZ41hlQ+RnN0mdMjBZ2hcZkvrwSloMFOOwa5oPMSJO9zVhx3i5PXLHrpeW3DuW7yFeOuIMAjdc/R6DbfB3+EFFlsey0IaAg6tnbEzb299eg1TR1hTR/nYweZGLK8SH3gzy/GqXmWAIIjbJNfYRfAESAzC680wDufQMaQKT4loZI7xd+Y2mHpwXCL9FIIAjvOneLo4G5vQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=wqTVVK7d; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=bA527m9P; dkim-atps=neutral; spf=pass (client-ip=103.168.172.154; helo=fhigh-a3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=wqTVVK7d;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=bA527m9P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.154; helo=fhigh-a3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTbHK5QbVz3bPR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 07:00:12 +1100 (AEDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 744621140235;
	Thu,  9 Jan 2025 15:00:07 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 09 Jan 2025 15:00:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736452807;
	 x=1736539207; bh=XLTeDIvd7zmMPfL4q/D1OTLpXR3HFsMk56y3E9zO+KA=; b=
	wqTVVK7dPXJAB2lQStsN6IxoHN2Pj6d34ve3t+KQvJ1KMQpnsys/eJQxWbYklwb4
	OsAq8M5IBNnqSL6OP9ObN9lr1L2N76Jh+6gWue2R38DKnnIcsvnf5SSJ0z+xqUHQ
	k5dOQV1qZHGqvuxUSA02veKmYONF1xtJvge/c/zqo/kH6B8bYyNs93WlOHT71sGP
	OlC6sDDYVpY9/OGJbtI1wLJYkApPIRi0rjmpZfypp+IxOMcDTNEytl825EaViivU
	32seRLxpGbGkw6mREV5QxVROg6A++lg+UsVLWipHxI/BkNAcGSx08Ye90dmQzxxq
	/FY6hWjgMoCCZh//DUbtbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736452807; x=
	1736539207; bh=XLTeDIvd7zmMPfL4q/D1OTLpXR3HFsMk56y3E9zO+KA=; b=b
	A527m9PBFcwabQVd8yZImD6568uyMmtm1JIXXCIYUtS3OODLVDiYD73bOCWkQxOq
	IGGey/epZxo5OWqYFPFL8rmC7fhw/Q+IyiAT4QmpyKQt71us7NEESH5zp+RMXxna
	6lCvGMlG4XUUcA+x0ENll/WMwi8uArmiDWwLZy8Lhkk+o47kJY7jFeGE/fMWv+Kq
	ZGb3DufO/RK2ExnAnrnEyiPiU1W3sCftOJ7rPnMecgSN25NPcw3XLMBl+cGdfdek
	Hm9ctEPXkfxwxvPkYjHAYb4ZCzrSz/fuTqKDVscM59oGy2U+fe1Pg6ZVHUUHociA
	kPLBFE8EdrdczZbulsLGg==
X-ME-Sender: <xms:xSqAZxrURnPaa3dQJakFaALo8nuiVsSBuuMgSpV2-x-zITx1qK10sg>
    <xme:xSqAZzrHpROl3dL67vMtZhKKA_tifFhkQO_R26Mf-AF2U_ABfXmWosZQou3cFhhqa
    uM3BVx34LXfG9uiZj0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegiedguddvkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeef
    uddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpd
    hrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuhdp
    rhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdprhgtphhtthhopehjtg
    hmvhgskhgstgesghhmrghilhdrtghomhdprhgtphhtthhopehnphhighhgihhnsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepsghrrghunhgvrheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhuthhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnrghvvggvnhes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepgiekieeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:xSqAZ-NHbDtZv25PVnvrhdYKkO_XGBK5uacgLxnGjuRiVCxVJfbe3g>
    <xmx:xSqAZ8751_nx_wm3T7pycbKPKjyX_DprmSOI810Jf_zWkUQlYQfEwA>
    <xmx:xSqAZw41kJVFxoksZLEJIHGUPsJY1LDXgJMdaMNo21UuhcvsUuDuMQ>
    <xmx:xSqAZ0jH38ur-qtEMUQVvfGvkDvk5Ja80JKFM3V-VkHaqlAUxsRLKg>
    <xmx:xyqAZ8FPs8CB2q6dYLLfVz8oFDTaugCG4o3zlqe7SWmIznMsnuK4VEBV>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6DFD82220072; Thu,  9 Jan 2025 15:00:05 -0500 (EST)
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
Date: Thu, 09 Jan 2025 20:59:45 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andrey Albershteyn" <aalbersh@redhat.com>, linux-fsdevel@vger.kernel.org
Cc: linux-api@vger.kernel.org, "Michal Simek" <monstr@monstr.eu>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N Rao" <naveen@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Andy Lutomirski" <luto@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, chris@zankel.net,
 "Max Filippov" <jcmvbkbc@gmail.com>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christian Brauner" <brauner@kernel.org>, "Jan Kara" <jack@suse.cz>,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-security-module@vger.kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>
Message-Id: <e7deabf6-8bba-45d7-a0f4-395bc8e5aabe@app.fastmail.com>
In-Reply-To: <20250109174540.893098-1-aalbersh@kernel.org>
References: <20250109174540.893098-1-aalbersh@kernel.org>
Subject: Re: [PATCH] fs: introduce getfsxattrat and setfsxattrat syscalls
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Jan 9, 2025, at 18:45, Andrey Albershteyn wrote:
>
>  arch/alpha/kernel/syscalls/syscall.tbl      |   2 +
>  arch/m68k/kernel/syscalls/syscall.tbl       |   2 +
>  arch/microblaze/kernel/syscalls/syscall.tbl |   2 +
>  arch/parisc/kernel/syscalls/syscall.tbl     |   2 +
>  arch/powerpc/kernel/syscalls/syscall.tbl    |   2 +
>  arch/s390/kernel/syscalls/syscall.tbl       |   2 +
>  arch/sh/kernel/syscalls/syscall.tbl         |   2 +
>  arch/sparc/kernel/syscalls/syscall.tbl      |   2 +
>  arch/x86/entry/syscalls/syscall_32.tbl      |   2 +
>  arch/x86/entry/syscalls/syscall_64.tbl      |   2 +
>  arch/xtensa/kernel/syscalls/syscall.tbl     |   2 +

You seem to be missing a couple of files here: 

arch/arm/tools/syscall.tbl
arch/arm64/tools/syscall_32.tbl
arch/mips/kernel/syscalls/syscall_n32.tbl
arch/mips/kernel/syscalls/syscall_n64.tbl
arch/mips/kernel/syscalls/syscall_o32.tbl

       Arnd

