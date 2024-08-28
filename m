Return-Path: <linuxppc-dev+bounces-688-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7549A9626F4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 14:25:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv3Wv5nyBz2xs1;
	Wed, 28 Aug 2024 22:24:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724847899;
	cv=none; b=LGSchadRS9/RaIQHSLzxxPkuqt4HUjklgP8ODPD35+2dz5+b9IqiPillLNpj+xmzPCY/vc/uA/cEOTmK9WwGLbUg2RGXTbP3/lZGwCF8fdOGPj2Qfe5IwFSb6voY3knQHzf6ttActRKRdRSIapJat1ro+XK/9h/xBwQ9emsUvIp4+5GxxlM6AKM593XXhtq+/rfQpNg8Gl14Vb0weTxiW6A89rCf4bCKvLP/Z6yTAM3dxbytrdiWRekNSJ9Vv1mIlWS4rmM9Dxd/CbvcHuXJDJTNUx8M2g6pvp8VQtQaaRueUVNlKtZRe1Hh5aokXWq5pSRpp4pEfbIhYwQ4IDwQrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724847899; c=relaxed/relaxed;
	bh=tY4Yx5IDHNetp4MTmQE+UU5YSZdVDbIQ+s16XnY6VHA=;
	h=Received:Received:DKIM-Signature:DKIM-Signature:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type:Content-Transfer-Encoding; b=OstjDuWyGpi+QqicYYUfmon+TVePpGLTAzWt/2DzWhUKriYOuZij/reTmjNcdp34WNCFNd1DdTDxlOLvSBuPHA20PMXCNIYDZu0+GTaYBBO060MnzckXD94LnYm6jUfcwfZKC5s9UgEHFJyw0j/G+72UCBbFf+w1H7mE93ZRTsDfUZDM/8EyELZyC4I3lUHDuDsy8wmncrVbKft/9S/x9yDygDEK7zo5M9wfNHEtSjYwPaJcgkzG0/aJNLEQEY67dr5DSurOOJS5dS8tHtsIh7cXjsEOy/b7Gx1s8P4xQ4BrC3FSOaxaZFfDOyKC9Aq220XIfBxph4z1sOX6voLpRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=m9CzRuMF; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=ckmK29ZZ; dkim-atps=neutral; spf=pass (client-ip=103.168.172.158; helo=fhigh7-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=m9CzRuMF;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=ckmK29ZZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.158; helo=fhigh7-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh7-smtp.messagingengine.com (fhigh7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv3Wr4kcMz2xWZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 22:24:55 +1000 (AEST)
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id B595D1151B67;
	Wed, 28 Aug 2024 08:24:52 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-04.internal (MEProxy); Wed, 28 Aug 2024 08:24:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724847892;
	 x=1724934292; bh=tY4Yx5IDHNetp4MTmQE+UU5YSZdVDbIQ+s16XnY6VHA=; b=
	m9CzRuMFuDktN8Yxab7/MTUNiNtnaAIQOREZk9jjycv6D91m5zjje3Pmc6icfTK0
	q0K27qIOs4UyDrAKJQJX0FBIO+tUmWddth1CEgvorBEOCG6l6nz9N8YvXLk5axtj
	i0ajed/S70WicxTwpgdUm1TJzgsOgXN/nX1xgzxuOkH4ZSN/h3lWoqz/1ZWsuIPt
	Zplth0SYdgt0mWLMzPgrlNPLzG91C2tPxk2KsjmQFcLeWDvkXvy3ySf092PbG6YN
	WKeqlKsiXplWIYoTCcRBBUIUK53bivDgxOcfRkSS+ZC7MzWvEeYtNV/6ImvSmjy6
	er1//mswqR8MEvwaCWrfnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724847892; x=
	1724934292; bh=tY4Yx5IDHNetp4MTmQE+UU5YSZdVDbIQ+s16XnY6VHA=; b=c
	kmK29ZZccV35e8dETfYrVy65EUSjgfRcekjV/BZAAtL1g0vJGdlvpDVedxeUMD8j
	atB9GnwQ2Q2fozkN1Gl0AxVYJQY9M+pQUZEch8yoFYuB2kaL9EoKwMHR3rqEPYH/
	zpm7XaFTgbv+OGCRaSZ0uNyGfB+nro9AMXdCf1G5Q34/ZXdjn6WtvUZuU2mnlrnP
	RblNo27ua/jI4uOp8sUyBIatt9ZCLwXcx2kSS3GOpIVrTQtqj0kcx1HFJ5La9qjw
	9w//s7t+lw0idbi26p9SkRfnU9ytRRrb5+HPohHAksSRwse5UGmB+COWpQurKeO8
	Y49ciEs5aU++Tbhj2lqvw==
X-ME-Sender: <xms:ExfPZgpmmCTaWmb1k5uO4H68WiOjVz5lzVAlBpXUHsvhA8nWgn9Fjg>
    <xme:ExfPZmqKvoWcmA08FwAKPqAKwN2LVWH9_UesOzSoxCdIkcUzymv4dURsVgy-CYSGb
    6p5bmgmrIuDaO78i0o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudefvddghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvdek
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprh
    gtphhtthhopehvihhntggvnhiiohdrfhhrrghstghinhhosegrrhhmrdgtohhmpdhrtghp
    thhtoheptghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuhdprhgtph
    htthhopehmrghthhhivghurdguvghsnhhohigvrhhssegvfhhfihgtihhoshdrtghomhdp
    rhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdprhgtphhtthhopehnph
    highhgihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhoshhtvgguthesghhoohgu
    mhhishdrohhrghdprhgtphhtthhopehsvghghhgvrheskhgvrhhnvghlrdgtrhgrshhhih
    hnghdrohhrghdprhgtphhtthhopegvsghighhgvghrsheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:ExfPZlODlJ_zCkkXWT9Y-0sIxDZ8NvMj0IB_XcmqAB3mVKQNFWXDGA>
    <xmx:ExfPZn7on6_zmOjYvJdPBIO3av104-XvmzFPSMnBvrdixITq_grskA>
    <xmx:ExfPZv71YkY3sqPjtxMWeEc76-CNYwacmMVUgQGZijeq4yttJsb6mQ>
    <xmx:ExfPZniNM2xn1Wo8ehGmIW8Y3Vuvhtc4oct4DQfUsBRyWz-yzPOoMA>
    <xmx:FBfPZj7W4QeHlPPFDOB1-T6Fhpnlj9dtVl-xMRU7bvSsvfwYiXmSUGNy>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id EFF1B222006F; Wed, 28 Aug 2024 08:24:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Date: Wed, 28 Aug 2024 12:24:12 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "Segher Boessenkool" <segher@kernel.crashing.org>
Cc: "Eric Biggers" <ebiggers@kernel.org>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>, "Naveen N Rao" <naveen@kernel.org>,
 "Andy Lutomirski" <luto@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Theodore Ts'o" <tytso@mit.edu>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Steven Rostedt" <rostedt@goodmis.org>,
 "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>, shuah <shuah@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Message-Id: <fc19bf63-d519-46e2-be70-80202c85ff92@app.fastmail.com>
In-Reply-To: <Zs8HirKLk-SrwTIu@zx2c4.com>
References: <cover.1724309198.git.christophe.leroy@csgroup.eu>
 <5deb67090b214f0e6eae96b7c406546d1a16f89b.1724309198.git.christophe.leroy@csgroup.eu>
 <20240827180819.GB2049@sol.localdomain>
 <20240827225330.GC29862@gate.crashing.org> <Zs8HirKLk-SrwTIu@zx2c4.com>
Subject: Re: [PATCH v2 05/17] vdso: Avoid call to memset() by getrandom
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Aug 28, 2024, at 11:18, Jason A. Donenfeld wrote:
> On Tue, Aug 27, 2024 at 05:53:30PM -0500, Segher Boessenkool wrote:
>> On Tue, Aug 27, 2024 at 11:08:19AM -0700, Eric Biggers wrote:
>> > 
>> > Is there a compiler flag that could be used to disable the generation of calls
>> > to memset?
>> 
>> -fno-tree-loop-distribute-patterns .  But, as always, read up on it, see
>> what it actually does (and how it avoids your problem, and mostly: learn
>> what the actual problem *was*!)
>
> This might help with various loops, but it doesn't help with the matter
> that this patch fixes, which is struct initialization. I just tried it
> with the arm64 patch to no avail.

Maybe -ffreestanding can help here? That should cause the vdso to be built
with the assumption that there is no libc, so it would neither add nor
remove standard library calls. Not sure if that causes other problems,
e.g. if the calling conventions are different.

       Arnd

