Return-Path: <linuxppc-dev+bounces-8534-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 131C7AB5071
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 May 2025 11:54:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZxWyX5XVsz2xgQ;
	Tue, 13 May 2025 19:53:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.140
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747130036;
	cv=none; b=nu5JXYt2br81Ge7B8oLe/W8nXJisQxn8jcBAWFyMlS8O+Vw4s4Z/ea5rzCOXWJn+GI1fNo1Hew/zGM7+MGouutGg4ooUmBhjjGRXNHRuTccxdiUSYMrORt3P7rW5NBAwB/mAHCnByOqSeVhZ0iFNta6s/rD/w+uxKfyH84w1iXRX2CjxTuNGwpc+T/xsp16uVFEM6dV75cEXPHQB1n5FEVptt6Fgvv8mWZ5mvZ1400Hk7eAWqFAxp5X2I5jBeeWzob2OhZCLya5cEBWw6H7SHmsL4i+xyL5zV3DEU/TjCjGx9yK9V1IDhtLXx8VDT8wTrH7M/O8wLU3foZOpxFwQgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747130036; c=relaxed/relaxed;
	bh=2stkMgjnTvYjnZGlIOEgk4TUXFdwLQsjjGMrGxJEng4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=kJUDRq9gM1IM4CkxUTHCwqZnvphc/SxpcSRoBZIOAYZlC16XqHj7QPUWDUBxcYnvy19/4OAM7cjim4jUm0eCEUjhV421dfum4z8mn2AA6725+K6l4MDgKrwYPj0zW9YSsglz6gZkD3w8+7TJasVmG9k7iy9sGEwXOrDJuYtj0IcbKH1wxXh9TAUN8jpV6efsGUZ9mL0cNZQ6p5ysl9yMaH7vkXr4a9r6aIFNOwO8t1E8QGlMJ6X/7XvreUNE3VmewFYdb08fAD0kvd8wwk7iiFdM5voPpxZ2yVdj+rhGtQeqsmgrIaYUDXRuU2E1OB9TLmQxHcRp3LIaNYTEe1JSdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=WYyUQxoF; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=AEELkgMT; dkim-atps=neutral; spf=pass (client-ip=103.168.172.140; helo=flow-a5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=WYyUQxoF;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=AEELkgMT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.140; helo=flow-a5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from flow-a5-smtp.messagingengine.com (flow-a5-smtp.messagingengine.com [103.168.172.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZxWyT2XSJz2xS0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 May 2025 19:53:52 +1000 (AEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id CA3382001E7;
	Tue, 13 May 2025 05:53:48 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Tue, 13 May 2025 05:53:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1747130028;
	 x=1747137228; bh=2stkMgjnTvYjnZGlIOEgk4TUXFdwLQsjjGMrGxJEng4=; b=
	WYyUQxoFJEJG2TxNUqkYZaozv7ki1sEPfp+e0DgttRWUAEBJ5m/Nulv6wDMgiZFu
	ZXGhV2HX6hLyepP/MCBiwJxQq+gSBm3qkUj2ZcS14XWq7TXU2eGwM1FkhTuYbaTN
	QTdlJYijuyH9psa3/vztyI49EeCMF/rQ1Vw+cT3e4UwKSGPlU5To9+3e6ijlu62G
	qVL2dhk/in2PJGdWeQc/2t1KrlN1b5JtzNgDxxVvhZJZsL8d1722pAFne5WV4YSq
	GUBWE8p6b4Nvck7X7vYCxsmGC9tBy+067SVnaVHRtw4UPu8kv5oMdVUzjlpUAudX
	s9TgoIZ7pe3V7YMmgEyx+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747130028; x=
	1747137228; bh=2stkMgjnTvYjnZGlIOEgk4TUXFdwLQsjjGMrGxJEng4=; b=A
	EELkgMThLE/eZr5z/8Zu380mQpF1U2n4l1J7+89SkHBMoHjU8kAJPnbWZsjGPW0l
	mc+r+7qbaJCA7dj6lwJqoqv0Q2dgX1C9gndhKEfcoutfQmu9g7GVWeu67s3uv0xN
	w1NeNeQlUh6xFP6n/v1SXcnk97uRYsQihn5Js+a57a9bWKvrP/iLDEfxIDNslPFU
	OrZ5b6zqojwm9zriy52n4qA2N2ZBMADPzNhYv8XVxEyN39/YNDTHkHvyqua4Q7lT
	zTTDN8I+UkHJ3SmPI7gU+CyX/0+12P55/OkyZF2Z7v4w0fJkRzn/Jm3pd5wB0Vzh
	kKYxcROkGyAkL+yRJ9BOg==
X-ME-Sender: <xms:pxYjaDuCrtoLCe2TM5AQoECeRzn60vp1TpYjbFh19t2G92KHMjZLCA>
    <xme:pxYjaEeRqGXY6YdP7QViyGSAtpUSLuq_q5nrXJXRuDHodq_37lo0B4qqaEs8y8pdw
    9gaLH-6Gi3iakv3BPw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdefkeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    hedtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvg
    dprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhr
    tghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtth
    hopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoheptghhrhhi
    shhtohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopegurghvvg
    hmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhhitgesughighhikhhougdr
    nhgvthdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdprhgtphhtth
    hopegrnhgurhgvrghssehgrghishhlvghrrdgtohhm
X-ME-Proxy: <xmx:qBYjaGz9HzIZcWZ8Rmc6wdWuoEjpS7OgEvVMigKbnaPo4v6JM-M91Q>
    <xmx:qBYjaCNbwaFl5jHdhYW4jdiojQcWJ3NoeqKOsFh5AH0bUcQVyFX9_w>
    <xmx:qBYjaD8EvTGV3vet04PP8Y5sUPlHvpdr-JS265c8P7rLb9pmhu6TGg>
    <xmx:qBYjaCUFRgwjTMe8PR3Dbq-x9nNpk-7hHOiSRy8VZsR-5JLBp-6xuw>
    <xmx:rBYjaOdX2gNw0hxrV2biCIkCy9on4QdHR6GYDc-Mt04O2dJBlCQH_VqO>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D7A291C20068; Tue, 13 May 2025 05:53:43 -0400 (EDT)
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
X-ThreadId: Tdb8541d917685bac
Date: Tue, 13 May 2025 11:53:23 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andrey Albershteyn" <aalbersh@redhat.com>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Matt Turner" <mattst88@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Michal Simek" <monstr@monstr.eu>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N Rao" <naveen@kernel.org>, "Heiko Carstens" <hca@linux.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "David S . Miller" <davem@davemloft.net>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Andy Lutomirski" <luto@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Chris Zankel" <chris@zankel.net>,
 "Max Filippov" <jcmvbkbc@gmail.com>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christian Brauner" <brauner@kernel.org>, "Jan Kara" <jack@suse.cz>,
 =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 "Paul Moore" <paul@paul-moore.com>, "James Morris" <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 "Stephen Smalley" <stephen.smalley.work@gmail.com>,
 "Ondrej Mosnacek" <omosnace@redhat.com>,
 "Tyler Hicks" <code@tyhicks.com>, "Miklos Szeredi" <miklos@szeredi.hu>,
 "Amir Goldstein" <amir73il@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-api@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 selinux@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org,
 "Andrey Albershteyn" <aalbersh@kernel.org>
Message-Id: <399fdabb-74d3-4dd6-9eee-7884a986dab1@app.fastmail.com>
In-Reply-To: <20250513-xattrat-syscall-v5-0-22bb9c6c767f@kernel.org>
References: <20250513-xattrat-syscall-v5-0-22bb9c6c767f@kernel.org>
Subject: Re: [PATCH v5 0/7] fs: introduce file_getattr and file_setattr syscalls
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, May 13, 2025, at 11:17, Andrey Albershteyn wrote:

>
> 	long syscall(SYS_file_getattr, int dirfd, const char *pathname,
> 		struct fsxattr *fsx, size_t size, unsigned int at_flags);
> 	long syscall(SYS_file_setattr, int dirfd, const char *pathname,
> 		struct fsxattr *fsx, size_t size, unsigned int at_flags);

I don't think we can have both the "struct fsxattr" from the uapi
headers, and a variable size as an additional argument. I would
still prefer not having the extensible structure at all and just
use fsxattr, but if you want to make it extensible in this way,
it should use a different structure (name). Otherwise adding
fields after fsx_pad[] would break the ioctl interface.

I also find the bit confusing where the argument contains both
"ignored but assumed zero" flags, and "required to be zero"
flags depending on whether it's in the fsx_pad[] field or
after it. This would be fine if it was better documented.


> 		fsx.fsx_xflags |= FS_XFLAG_NODUMP;
> 		error = syscall(468, dfd, "./foo", &fsx, 0);

The example still uses the calling conventions from a previous
version.

       Arnd

