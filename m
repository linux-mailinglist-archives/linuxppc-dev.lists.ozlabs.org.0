Return-Path: <linuxppc-dev+bounces-1081-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C4696EBCC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 09:18:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0SHq5yZbz301v;
	Fri,  6 Sep 2024 17:18:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.136
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725607095;
	cv=none; b=KL8EnPvSqCjKphJIaYZet9AkwoNrw0fLStT/O7Y1LKPbqA+bQUYH188F6E+LklW8VcRBaS7UJowJyVOvCYv3mvUf1rJ+lpjJ2GpvNgjNXDXct9XCoXt6fQGF8z4L8tOVI3rmLwl1PJZeEpdPVdUc8G23nP0T2S/ZnrKPUbfiYtLkdmQwKcVS6hQUfbfyL2VV1nfUZvr+GHaYk40yhoLuTgC9iUk1aFHYGTtyC6jC8etnkYWB47m0wo+RliEOhJzSLq4ACd38YW2md520IKUKFumWkUaTDyjDcYrlEJHILbZNOYLiWuM1dv9wjLPTAoXx9dkSBT74uQGcs02IOCON+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725607095; c=relaxed/relaxed;
	bh=v3KUbqaJkdY70T8W1uPjXNY2qtbx3TSnJ5p4uWowLhw=;
	h=DKIM-Signature:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Message-Id:In-Reply-To:References:Subject:Content-Type; b=TI+C4wJrEAndGRQ/+m42u8vzOZY5q17W0Jxq/EjWLlgIpBWqafL3buU06qIho/2WdFkuJUDwf3enYYLm9pUWJaY7EGRDuK+pOmPdDhzD8tyL//x/SLRm+i/YWZKGeqL7wO8nIQEzIyKIEXK187DtcgpV1W7QDRzR7QrGQqIpOMh526Fv0QX2YQXQUvVJD9pqyXdEk4yN3cI0MRURrrR1YCKTJv3JUDsmcfUDZOj310vOaAVlgizlsk85DiLksSlnw/EHoTJn6pCBx7Wk+7DazDOaDZgVkTaxYDMgqYOKldU16qSxV1Rq5W7fV0gXNCxNxhkLf354nG3RRetxMCvLBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=aLq1/tQM; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=o2QCm3RU; dkim-atps=neutral; spf=pass (client-ip=103.168.172.136; helo=flow1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=aLq1/tQM;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=o2QCm3RU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.136; helo=flow1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from flow1-smtp.messagingengine.com (flow1-smtp.messagingengine.com [103.168.172.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0SHm66czz301n
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 17:18:11 +1000 (AEST)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailflow.phl.internal (Postfix) with ESMTP id E698B2002CB;
	Fri,  6 Sep 2024 03:18:07 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 06 Sep 2024 03:18:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725607087;
	 x=1725614287; bh=v3KUbqaJkdY70T8W1uPjXNY2qtbx3TSnJ5p4uWowLhw=; b=
	aLq1/tQMzmLulGgoq1JTbuWQ4lSo6PtfGwXy1aA73MEfseBN97Y+UmeAAjHfyg/5
	jUbmy+yH4P6nI7XZUXIJ1fG6Cexa4OKSy8o2PK9JUPEoPIcA5o18rcnBgyp54w0j
	2J8HZhcPE5rKzsA2DhQEFHocMDIE73Q4lMwekiiRSf3QhtOaMbo0leRXV/N0UEdy
	TX61xKsIdM76ba7PDckxmgH6aYJo4Ou5x/SHcQtxwK/poLKsJ6Tt+8HVdGUlRJlv
	xKtQPovCqqn/VszCPDR9Vwn6wIYfV/BLj4wFFTd9FY1pLuiBxOlfJ0R7ifNJ/oov
	cEh7czryvx5BZskI5QQnUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725607087; x=
	1725614287; bh=v3KUbqaJkdY70T8W1uPjXNY2qtbx3TSnJ5p4uWowLhw=; b=o
	2QCm3RUBkvdyIc0G6rV/KlX5op/78YryYTFHh+oWZtXUPin2BDjVFk3IE6vP9veB
	l1Qbfba0iQxH5dD906hjINFvCE4HARQyl2AFsCXjJwAXKdqH80qfAJiZZ+e9t1xc
	/S+a6hP4Se7CKsKjopgkM2LD04E44C4dQii9oUE5P/T/aWv4eDrHBVz9C/vn0ERj
	IdHM5EvzCq9heAtXxhs1ZvyZxgE7JWx/Vs4MHe3pNPNcOqPNJ2zXyD+Rb2Okgu3t
	1auhr89onDdcWYwo/aykRC/NWJt7dwj7B/GpNH40FTxRpvPvRAJkuqlrHh2sgBIU
	sQ3zk2hwxSi+MW78Hmx+w==
X-ME-Sender: <xms:rKzaZt5PUx2awmbvkLlPn1QnBtbVF79QfYME7xJL0tjtTTBBxExbCw>
    <xme:rKzaZq6R2ML2ByKU5dFHXJWnqNZIlkfNq_Qw9_HTFNQNz4yK_avaOOWHRIj8vz038
    kstsUHtBi-0YZObKdA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeitddguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeh
    tddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpd
    hrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgt
    phhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoheptg
    hhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopegu
    rghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhhpvgesvghllhgvrh
    hmrghnrdhiugdrrghupdhrtghpthhtoheprghnughrvggrshesghgrihhslhgvrhdrtgho
    mhdprhgtphhtthhopegthhhrihhsrdhtohhrvghksehgmhgrihhlrdgtohhmpdhrtghpth
    htohepmhgrthhtshhtkeeksehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:rKzaZkez4LA7tX9hpcEB8D9J8BRBU7hdAy_-dxVzqgTW3TLpWq-U3g>
    <xmx:rKzaZmKLFU2eWg80ImcEkx9_a8GMHJ46iO2onMEowq5enIahZloO2w>
    <xmx:rKzaZhIpAuSbbsH3org--1LUAk0dAT6rezieBcnRKofjTIlaF8HO8A>
    <xmx:rKzaZvxEUP-4UOlB4rgdIuaaEnQO1PjOxXxM57Y6bUSNFWDtErzcYg>
    <xmx:r6zaZnZCpuO_FJUglH9u5W_GV8xg0dvGTBq8eZ4ASwuda2wXiCUWanxI>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 99D14222006F; Fri,  6 Sep 2024 03:18:04 -0400 (EDT)
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
Date: Fri, 06 Sep 2024 07:17:44 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Charlie Jenkins" <charlie@rivosinc.com>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Ivan Kokshaysky" <ink@jurassic.park.msu.ru>,
 "Matt Turner" <mattst88@gmail.com>, "Vineet Gupta" <vgupta@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>, guoren <guoren@kernel.org>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>, "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N Rao" <naveen@kernel.org>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Gerald Schaefer" <gerald.schaefer@linux.ibm.com>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "David S . Miller" <davem@davemloft.net>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Andy Lutomirski" <luto@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Muchun Song" <muchun.song@linux.dev>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>, shuah <shuah@kernel.org>,
 "Christoph Hellwig" <hch@infradead.org>,
 "Michal Hocko" <mhocko@suse.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 "Chris Torek" <chris.torek@gmail.com>
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-abi-devel@lists.sourceforge.net
Message-Id: <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
In-Reply-To: 
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to 47 bits
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Sep 5, 2024, at 21:15, Charlie Jenkins wrote:
> Create a personality flag ADDR_LIMIT_47BIT to support applications
> that wish to transition from running in environments that support at
> most 47-bit VAs to environments that support larger VAs. This
> personality can be set to cause all allocations to be below the 47-bit
> boundary. Using MAP_FIXED with mmap() will bypass this restriction.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

I think having an architecture-independent mechanism to limit the size
of the 64-bit address space is useful in general, and we've discussed
the same thing for arm64 in the past, though we have not actually
reached an agreement on the ABI previously.

> @@ -22,6 +22,7 @@ enum {
>  	WHOLE_SECONDS =		0x2000000,
>  	STICKY_TIMEOUTS	=	0x4000000,
>  	ADDR_LIMIT_3GB = 	0x8000000,
> +	ADDR_LIMIT_47BIT = 	0x10000000,
> };

I'm a bit worried about having this done specifically in the
personality flag bits, as they are rather limited. We obviously
don't want to add many more such flags when there could be
a way to just set the default limit.

It's also unclear to me how we want this flag to interact with
the existing logic in arch_get_mmap_end(), which attempts to
limit the default mapping to a 47-bit address space already.

For some reason, it appears that the arch_get_mmap_end()
logic on RISC-V defaults to the maximum address
space for the 'addr==0' case which is inconsistentn with
the other architectures, so we should probably fix that
part first, possibly moving more of that logic into a
shared implementation.

      Arnd

