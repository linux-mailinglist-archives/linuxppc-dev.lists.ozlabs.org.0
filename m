Return-Path: <linuxppc-dev+bounces-12284-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3A1B58E62
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Sep 2025 08:21:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQsH01qp8z301G;
	Tue, 16 Sep 2025 16:21:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.153
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758003676;
	cv=none; b=csrGX7gvJ4uQE0Qv9aZA/H1WoYqoOGxhPia+pNtI9g6njFHPSQiQGwIOejFVdahM6i5koGxPCUXJNUTAAoCzgGodmT+yHiPWMy3x1FOPNAwcHLZegTJDTCbS1WvoN8cPfTguwjbLdtbzUqpQJT64Xr5VFWwA6zuVM+p6Ws0iO2stLZtpcl63sMuyy5+xOXpsr0fp9+KZR7MEpOEZVVr8p2boAfIB47rbzMrxPrYPQr4LLZrdl+4D5niJcfYzbv56ffaQugtd9NrtKoH8LedcQXf6ymvuq5OLwysrrGI/yZtEajJHPj9eeQCXwWojMB1ixq7aZqyTCRqINQY/Y04LSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758003676; c=relaxed/relaxed;
	bh=xjyueAXEmWPEqLrRzLXEg+Jxf3wlaTkFjrq4o1OfOb0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=bkcuf1RZHhd8QPzD1BX20tKajgH0+ylQis4f1irdkDO26dK0nFS0veX0LIvIU3QszILoP6VFmIhbnaTi+tV0psZ6k1K1Ap0qXMoaDHWkGjMpff7OQLWVVHBC+EpqDLodS+b6gEF0pnHpueR8iUHWPnWdW2TGL6mILccaytdgcIU2cZKGiTtx0J/Jhsmul9ttAStbiBvnHtRnCiIvrMbGEaXlYtEIhXRMfQgnlf+ilSTP39TFr42Y8dqDb1Iu7cQDtsaOhDmcdY7ZGxmjxqtLvMx8kaltPTYmsE2zfFEKCRMJ2+wnBpa8myNB3K2bvUqEjLY6qa86+Roi/AJUoaytdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=Bn4k/Yu3; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=oKTU2dC1; dkim-atps=neutral; spf=pass (client-ip=202.12.124.153; helo=fhigh-b2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=Bn4k/Yu3;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=oKTU2dC1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=202.12.124.153; helo=fhigh-b2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQsGt41J6z2yrF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 16:21:09 +1000 (AEST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 858B97A0276;
	Tue, 16 Sep 2025 02:21:06 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Tue, 16 Sep 2025 02:21:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1758003666;
	 x=1758090066; bh=xjyueAXEmWPEqLrRzLXEg+Jxf3wlaTkFjrq4o1OfOb0=; b=
	Bn4k/Yu3QuSvb/F9KSUsKbWKShCAwc+XVf74skhDyiKwumQ1Hd3Qp9B2M/sCxiHW
	XcAJ5wXHq8aDL0jVr3q76sKLwoBASIBKZ7RVvrPS0WwntURSyCZIi8/jDMvalP0d
	DoNUGiJw35QPFZphV6ZWI+wcGuGjb11yDPlLLmhxC9xmX/gS5P8dA5XU+uzi+Ayf
	62Y9pqToEngyI731c35+4mEfXibQwdB8g/TTpJna+MG+O9JaDQxesqPdCHKHM+Zh
	+SOZ20AELgSzfEb8D76TiME0tUfGwXirOFT4FyX6tgCZnbJwxpmyg6cA1uBZyAd1
	exOyvXj+vekl7i4tKcatfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758003666; x=
	1758090066; bh=xjyueAXEmWPEqLrRzLXEg+Jxf3wlaTkFjrq4o1OfOb0=; b=o
	KTU2dC1H0UltUgtkG4QSNsbAfNEC6GyVBOl4zt3+fZlO4PyqyNSoizX2KoqyFQEh
	2ZFiyHuGJ4IALN59BbIGGDnoEHGcvpOntxXxN4NN4ofQRNqgG7uodxarJzRv5cb8
	nTCYRaZ/CZ+FOKtAOXCGCz1GnN9ieiB3fgRDMBynn2nSneXqvhOMcdNCuEdSN3m5
	8TUHVfdcKMBoidj6D7rDTYqe6jHrj7Y7FK5EfMP3OcVddBJv5NX4mp+PpmlE3f9O
	KL7YrUSOgykvPEnBUg0hmqbWuXc8JEwnli+MSc4KjUaZRf3K11Mzg4ARvSDzUzIj
	4SmeTkj5yeOSl6LbdSLuQ==
X-ME-Sender: <xms:0QHJaN_xzSyOwfU9Uo31SDIihXRhGtsnoPr-1AhXrBKLoWdcDoZ1Jw>
    <xme:0QHJaBtyiL6m5CN7DCU3TQ5Imd5qYV_MritapegMBwhra96EclPCy817JZXLGpYKV
    0Sc-DoH0KKU5N3Dzeo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefleekfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupd
    hrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdhrtghpthhtohepohhf
    fhhitghirghlthgvtghhfhhlrghshhihthesghhmrghilhdrtghomhdprhgtphhtthhope
    grshhhsehhvgihqhhurghrkhdrtghomhdprhgtphhtthhopehlihhnuhigphhptgdquggv
    vheslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrh
    hnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgifihhltghogies
    fihilhgtohigqdhtvggthhdrtghomh
X-ME-Proxy: <xmx:0QHJaMDFaCoirxWjy9HyBoPkBR3rXgoCjkgkjNh4ne1kS-5MfxvoNg>
    <xmx:0QHJaLdw05ATlXhl1Qqkiy3whw7HD8BKVGKFe-RT7bCtZhx0vIGB5Q>
    <xmx:0QHJaLOF6LCGiXJD9h-7-_A-w8sqFBz9HE7dNxgFVOQRzO_lyZSvjQ>
    <xmx:0QHJaLJNYt4WWbmACfasDgexQrWdfiJ9dL34F-cy-8d_9hiQBC5FxA>
    <xmx:0gHJaLC0NyI6JICwRGIm6Sk-7XVtO4cjK1OLwnWlnf1b63tMNLyZnZL3>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id ACC30700069; Tue, 16 Sep 2025 02:21:05 -0400 (EDT)
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
X-ThreadId: ADclxERWIs8s
Date: Tue, 16 Sep 2025 08:20:35 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ash Logan" <ash@heyquark.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 officialTechflashYT@gmail.com, "A. Wilcox" <AWilcox@wilcox-tech.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>
Message-Id: <39164c56-78f8-4bac-acd2-a996149c1c57@app.fastmail.com>
In-Reply-To: <11e667d6-2210-47f0-a9ec-a134a60e138c@heyquark.com>
References: <3e8cb683-a084-4847-8f69-e1f4d9125c45@heyquark.com>
 <432e049f-886d-4734-ad59-52569a796046@app.fastmail.com>
 <11e667d6-2210-47f0-a9ec-a134a60e138c@heyquark.com>
Subject: Re: 32-bit HIGHMEM and game console downstreams
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Sep 16, 2025, at 03:57, Ash Logan wrote:
> On 13/9/25 23:52, Arnd Bergmann wrote:
>
>> Like most other machines, this one is probably fine with a combination
>> of a custom LOWMEM_SIZE setting and using zram-highmem, even if we
>> end up removing support for highmem page cache.
>
> Good shout - I'm now testing a 2G/2G split which allows for 1536MiB 
> lowmem. I know that's a somewhat aggressive setting for userspace, so 
> we'll see if anything breaks. I read Rasbian shipped similar kernels and 
> had issues with Wine, though that's not a common use case on PowerPC ^^

For experiments I would suggest going all the way to 2GB lowmem on MEM2,
which would require running without MEM1. At least on powerpc you have
complete flexibility with the vmsplit, compared to arm and x86 that
only have a few distinct options.

If you run into problems with ~1.8GB user addressing, you can still
see where exactly the problem is and whether it's fixable. E.g. If
there is a single process that tries to actually use most of the
available RAM, it will likely fail when it runs out of address
space in malloc(), and there is not much we can do about that.

>> The smaller devices are probable getting problematic sooner, 96MB
>> in the Wii is already really tight and this only gets worse over
>> time.
>
> The maintainer of that downstream claims to be able to boot modern 
> text-mode distros on the GameCube' 24MB, which I find really impressive!

24MB is impressive indeed. In my latest tests I did not get below 32MB
(+swap) on an ARMv7 kernel with Debian Bookworm, and major features
turned off in both kernel and userland.

On a simpler musl+busybox userland and even more feature reduced
kernel (no network, initramfs-only) I could get to ~10MB, but then it
doesn't really do anything besides showing a shell.

    Arnd

