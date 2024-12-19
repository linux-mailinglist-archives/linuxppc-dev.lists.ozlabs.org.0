Return-Path: <linuxppc-dev+bounces-4344-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A9F9F7512
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2024 08:04:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YDM3K5N9Vz2yD8;
	Thu, 19 Dec 2024 18:03:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.137
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734591837;
	cv=none; b=PXx1FSfDSAfHCPkvwWKDH20Cbgeuf87X184h7yZ2rvTfeNQ1uJm7kTXZ/xSK+4a2aLXISnNcei7/O8/WHMvKrwM6WZg7ikZ7aSbRkvbTf+Ee+YSEJlatdrf+HlD6D7FnUqBFhHK9XLfm1sqy9BRTrTTHqq5SxeSuKrBpp+USqw8oLY6WWpCC379tUYkxkb1bm2sbaxnTK2KxCOqx4Yl7pMUAeg7tsYY3bo5zRhShBxiPBAgFXDabHSgJyjO3Wlay/c4UedVRrrVXRnTRQoLfPtiBvnhEb/y89yetkKdAxFaxYQRkTa67ZdEmCdT6aoGJ0B46uhz6eRp7eahB/DYYRg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734591837; c=relaxed/relaxed;
	bh=k43J5anAB96Ch7IfLVC26goHMZDYKuV3hVA5bdHwPjc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=I/4FuOy2zST96WHfcAhI7i4Ni9GSsnxULjm3M0oi8WJyeGxqkUleqF9GKkGFBNWoZG/PKdKWOsVf8Hg3a8+UCRqf98qORl4JeIs/3ACN4RM2Lsm9x03wvX7hGjFO27ngoOCY6GM9b7O8erNT1cT0tLZR3lt4MaDOr48B399umVUb7eFcYIvl8hcTzO3Wis5GR4dihrHcYaHfa4PlFLN7y+Qce7YuPyK5z/7QTUAZYAEKq31JsiDq3UzqiprZsPVZfBTvIh3N21y7kfciOZrHxmvpHOcoZ5024GFi0fp2lj1wytOARjNgrSjgUXewl2u5ujjUz4I3NQnTAM1Z3pslrQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=oY/eWZPR; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=xmVIewcr; dkim-atps=neutral; spf=pass (client-ip=103.168.172.137; helo=flow-a2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=oY/eWZPR;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=xmVIewcr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.137; helo=flow-a2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from flow-a2-smtp.messagingengine.com (flow-a2-smtp.messagingengine.com [103.168.172.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YDM3F3lXzz2yD4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2024 18:03:53 +1100 (AEDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailflow.phl.internal (Postfix) with ESMTP id A81192003B4;
	Thu, 19 Dec 2024 02:03:49 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 19 Dec 2024 02:03:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734591829;
	 x=1734599029; bh=k43J5anAB96Ch7IfLVC26goHMZDYKuV3hVA5bdHwPjc=; b=
	oY/eWZPR2hoZOZEID//SUz40plFO0YmL/cDeTW7TVToY9wBGdc79QSqYm/3ZddWP
	+Th5hMXNmlvbAUs4xZsNDVpDtdM7JfAg3wPu/DpEK8xbSRjPm7xvrGYBe+D/RPr5
	uhBvghppkGDojAe9Sc7VdMaJzJvwWDn2yP1SzDpqjgeylzcD5rHha+sBf10Z8MUY
	zjfm122PgsBOKR0kHiwP5TRV3NXqtXgI94ycCBwNvW6SMx4sNtkjl2NCTDuO3GEu
	iKfUTsB4AbJSooNGUEabOjQIahs4jCKEhxVyNGATifNR+f3n3w+MTX/xutBM/8gb
	UBxrEYQCQfco5c4mIW21CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734591829; x=
	1734599029; bh=k43J5anAB96Ch7IfLVC26goHMZDYKuV3hVA5bdHwPjc=; b=x
	mVIewcrb+S5H9Li9t0EtG4J0oD/8yiqFu1YmmnOqwRgrgp9J5yPMWL8Rvxl1fuoZ
	NpoDGZDH8YCBHIu2prkjS8vgZ1vqCIabCOCUlGvuAIufD4Ous8eQIININ4VO9lVw
	5oZ77qqHBP1sYs1oduV+I8oTsihoTp8mJ8JBNCfft4os1YlVvfssjYddbR05S5qa
	jp9Onrs43lK4MxJGpdF3toNCpEh2AI1l/M1u8wIZnvPb613KhWovocwi+UBYD+wH
	5hhbjShUCWAzYPLG092kKaKD6vRVVA1SH4DmfNX2Qj6+vDBJR3iQl+bz4MrGsA3l
	xjUjyx4Pe4xatF866CFrQ==
X-ME-Sender: <xms:UcVjZ08o9oSr4vC-yWs_0rkX3tF_de-kiIiySpphPyx8XsVfKRVEXg>
    <xme:UcVjZ8s_0LfBT76dpGaKaKC5xNr7F44n3_6mhljodlJWfmRa80fVfIJed_f2dC3Ra
    cfcwMot3wYtb8tzXWI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrleelgddutddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdeg
    jedvfeehtdeggeevheefleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepgeei
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprh
    gtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghp
    thhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhope
    hvihhntggvnhiiohdrfhhrrghstghinhhosegrrhhmrdgtohhmpdhrtghpthhtoheplhhi
    nhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegthhhrihhsthhoph
    hhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhrtghpthhtohepphgrlhhmvghrsegu
    rggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhi
    drvgguuhdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruh
X-ME-Proxy: <xmx:UcVjZ6Djfy0CqQN4vTzFpZUghuE4c8_GRSujiFZOpqKobULrY7d6Fw>
    <xmx:UcVjZ0cXWSJU04bKlE7dy4vLBmwTvHF0ozAlW27OV-4AamEkxEZKtw>
    <xmx:UcVjZ5N3kO7cMmjcmc96BjTIos7f-PzF-xBfcJV5KR5s8w423K77xQ>
    <xmx:UcVjZ-mXW5UA98QDpStGWiYswp6ZnLl6BM4yXYMLy5PwKkxQmfIdZw>
    <xmx:VcVjZyNnjyvt_EgMYqaOa0zhC1TPcMH5UJqxxwhazRVa7nzB-KExPgbA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 84E632220072; Thu, 19 Dec 2024 02:03:45 -0500 (EST)
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
Date: Thu, 19 Dec 2024 08:03:24 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: "Conor Dooley" <conor@kernel.org>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>, "Andy Lutomirski" <luto@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Anna-Maria Gleixner" <anna-maria@linutronix.de>,
 "Frederic Weisbecker" <frederic@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 "Russell King" <linux@armlinux.org.uk>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N Rao" <naveen@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
 linux-s390@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Linux-Arch <linux-arch@vger.kernel.org>,
 "Nam Cao" <namcao@linutronix.de>
Message-Id: <0bdeda72-73e6-4749-8d54-66c7614a6f83@app.fastmail.com>
In-Reply-To: 
 <20241219072552-7cd4512c-4f61-408a-9422-167a6f2810db@linutronix.de>
References: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
 <20241216-vdso-store-rng-v1-7-f7aed1bdb3b2@linutronix.de>
 <20241218-action-matchbook-571b597b7f55@spud>
 <20241218162031-ee920684-db10-4f17-b1cb-50373d7ea954@linutronix.de>
 <137c0594-e178-4c91-bc8b-5f99b3ddb2f0@app.fastmail.com>
 <20241219072552-7cd4512c-4f61-408a-9422-167a6f2810db@linutronix.de>
Subject: Re: [PATCH 07/17] riscv: vdso: Switch to generic storage implementation
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Dec 19, 2024, at 07:30, Thomas Wei=C3=9Fschuh wrote:
> On Wed, Dec 18, 2024 at 05:35:31PM +0100, Arnd Bergmann wrote:
>>
>> > There is precedence in providing 64bit only vDSO functions, for exa=
mple
>> > __vdso_clock_gettime64() in arm.
>> > I do have a small, so far untested, proof-of-concept patch for it.
>> > This would even be less code than the ifdefs.
>> >
>> > What do you think about it?
>>=20
>> Yes, simply exposing the normal time64 syscalls through vdso
>> should be fine. I think this currently works on everything except
>> rv32 and sparc32, probably because neither of them have actual
>> users that are able to test.
>
> Should it use the specific _vdso_clock_gettime64() naming or leave out
> the 64 suffix?

The VDSO function name should match the syscall name, with the '64'
suffix. Any syscall ending in _time64 uses the __kernel_time64_t
derived types, while the corresponding syscall names that don't end
in _time64 take a __kernel_old_time_t, which is defined as
__kernel_long_t and only 32 bits wide.

      Arnd

