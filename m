Return-Path: <linuxppc-dev+bounces-1627-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D87509874D6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2024 15:55:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDw885QlCz2yVX;
	Thu, 26 Sep 2024 23:54:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.145
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727358888;
	cv=none; b=hHdsMZq+8UekfptEaJzVVRIOH2/SUeTMwGZVKsmR4ykAT7MK5q3T4XnRSIar9h3RGYpwC2RoR0wk2K+pnxQhrNTY1BjvCsZ5g4aBH4uKXnJ/25LwA7K9lnvf7p8EPahNa/XEJDm00RvHVIJXpplxlNk5mGnY+S2Ea/5+wx9WJYWDTqEukE3g0QYwtZ4DQiMXLwGunkoMwmXiDXEjG7WVaGZQQLV1dRHTZpK794VOdW21QiFMyTnIrIRJ31Mp0zMCDrz+VPJxBNC71MudScbnu//xHyTlcu2QQLTP6QLmxcysicJTU44JPMfpHvz8JUiNrawCJm6ZfONdHJlYEwKB5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727358888; c=relaxed/relaxed;
	bh=6riDWHgJboduwD6LaSFNyFPLRcRPaab9kSUcfli2BKY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Tzp9i+it1CHVJCJzz5p3YimyEFs6sZjSS+/UPteUNW4ad7jwMdw2imnCyxc7YTIwVeU6cimyr/soFTjHQO7YTeVvmwlqU3IZqHwlEaD+oQIfAd7z9Hmpp4zzw/XDHrRpGCk1nN59tpPgIJdvw/WkFV1MsI2wVX84VuDIjy0ot41v95ccV4Y3iBaa/WtAIJVWvq+fkoVTKEYRaiKzeDvnDOIV8acVmwAqHTjdkNrDQ+4xhOGOuLte6JQlG/OXv2vKhtEcEePrviSeBmCXDav+5bkPfJyiqFhpW5inQHkPuxyF+UYeYrhJCoBsmxNjBR6mdV2//bH6rv0aCNt3W5fEeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=Ed82I70M; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=R3y/KsXa; dkim-atps=neutral; spf=pass (client-ip=103.168.172.145; helo=fout-a2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=Ed82I70M;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=R3y/KsXa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.145; helo=fout-a2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDw854kdqz2yV8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 23:54:45 +1000 (AEST)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 152F51380297;
	Thu, 26 Sep 2024 09:54:42 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 26 Sep 2024 09:54:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1727358882;
	 x=1727445282; bh=6riDWHgJboduwD6LaSFNyFPLRcRPaab9kSUcfli2BKY=; b=
	Ed82I70M0gRdT9TOoYaLzrvfHoLQ2RkVw5BljDBCWBHW5/YtKj816v3sAP+b7ZSm
	cZoIFqIaVwq5PHBT/e35Wg4s5vbFREFevM//daefmaW6kP+XYxepPCYyTXHw3QZ0
	9Za1MYRn7T98NbA5SZfsbPsmZzSiI7SC3tSrSXiBBKVyfj2pBH6mBaNrjOxrFaHE
	j49q0/22DpSKg/bsY3mml7j9HF3n4sLnbkfP6PQILPBqWhYIc1DlKnqtFgxhz20J
	3kccxBEvmwm7gelOqzjUi/OyBkCJJShdYOKtnleaeWdN5njs6O1xbn4nIFM65Yhm
	YmauC2QVmPVGgRo9SrBwFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727358882; x=
	1727445282; bh=6riDWHgJboduwD6LaSFNyFPLRcRPaab9kSUcfli2BKY=; b=R
	3y/KsXabibaJ2Z/XkVysWRaZOs8MTtsGNxYTlNWKe7wzJP2qTTNiBsy3MdawjKzW
	0c/i8g4NVXfzSmdWt87jP66p8OWqjCS2WourGpBGTP2iwOVQgH79FH+EE3gQR0m0
	rheDEpOt7B7Dso+6iT/5xT59DHUYbAseI3FJ7vd9kVI6eGyd+dD6sxD56OuQ1Mgw
	4YU0P7chz9BoVPa9xYbZWK0T1egLvkjZunHNa98cjf8dNOsPcURxW/lkhDQYd9uT
	5YVDeZSGlPl3GmQQIK38QWLQjVwddi8BnzWgbhpeLRrZuKjZEtasvdnzWAy3mCM/
	WuF3u9Im8+31VwBTNF1PQ==
X-ME-Sender: <xms:oGf1ZkqdmIpA7o2_QzgaN1fdtEYURj_XJL8PbUipRTKbPtqfIWADNA>
    <xme:oGf1ZqqQeZTrmeBKpSvohuYmfbNnevz71Ar_g3IYdL_mHSretB_U6oJUuZO9-jznk
    16KkdMa_LQIOvQaVog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddtjedgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepgeehveefleethefhudfhjeeutedvtedttdejieff
    feeuieevhfehgeekieffgfeunecuffhomhgrihhnpehutghlihgstgdrohhrghdpuggvsg
    hirghnrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepfeefpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghn
    khgvnhdruggvpdhrtghpthhtohepvhhlrgguihhmihhrrdhmuhhriihinhesrghrmhdrtg
    homhdprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdr
    vghupdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdhrtghpthhtoh
    eprghlvgigrghnughrvgdrthhorhhguhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthht
    oheprghnughrvggrshesghgrihhslhgvrhdrtghomhdprhgtphhtthhopehjtghmvhgskh
    gstgesghhmrghilhdrtghomhdprhgtphhtthhopehmrghtthhsthekkeesghhmrghilhdr
    tghomhdprhgtphhtthhopehnphhighhgihhnsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:oGf1ZpOs0y-FbPti-OKl6xR1ZY2dhie4YLDkmurMdwnfxHpHtJYoFA>
    <xmx:oGf1Zr74k2DXoCSjpcxnYW6z-HhZzsyJVBY7ImllYBvWSFNv1qkDIA>
    <xmx:oGf1Zj5h518sYyyR-7X7t9gpI0zata-tw922AwVZ1WhK4IinxbpVLQ>
    <xmx:oGf1Zri38KCr4FELnXbIKGVGM8vn4Dn5Mz07V6elrrKyLhz_X1BznA>
    <xmx:omf1ZtSyM5YH_Y3K6L2LepXVBPOPk7t-GP7MIFO1kTmF_iVRLYo_xwlZ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E77A02220071; Thu, 26 Sep 2024 09:54:39 -0400 (EDT)
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
Date: Thu, 26 Sep 2024 13:54:09 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "David Hildenbrand" <david@redhat.com>, "Arnd Bergmann" <arnd@kernel.org>,
 linux-mm@kvack.org
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Ard Biesheuvel" <ardb@kernel.org>,
 "Christian Brauner" <brauner@kernel.org>,
 "Christoph Hellwig" <hch@lst.de>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Damien Le Moal" <dlemoal@kernel.org>,
 "Greg Ungerer" <gerg@linux-m68k.org>, "Helge Deller" <deller@gmx.de>,
 "Kees Cook" <kees@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Matt Turner" <mattst88@gmail.com>, "Max Filippov" <jcmvbkbc@gmail.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Michal Hocko" <mhocko@suse.com>, "Nicholas Piggin" <npiggin@gmail.com>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Vladimir Murzin" <vladimir.murzin@arm.com>,
 "Vlastimil Babka" <vbabka@suse.cz>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Linux-Arch <linux-arch@vger.kernel.org>
Message-Id: <1a1f118e-9a7c-4c66-b956-d21eb36fce48@app.fastmail.com>
In-Reply-To: <b7f7f849-00d1-49e5-8455-94eb9b45e273@redhat.com>
References: <20240925210615.2572360-1-arnd@kernel.org>
 <20240925210615.2572360-6-arnd@kernel.org>
 <b7f7f849-00d1-49e5-8455-94eb9b45e273@redhat.com>
Subject: Re: [PATCH 5/5] [RFC] mm: Remove MAP_UNINITIALIZED support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Sep 26, 2024, at 08:46, David Hildenbrand wrote:
> On 25.09.24 23:06, Arnd Bergmann wrote:
>
> The first, uncontroversial step could indeed be to make 
> MAP_UNINITIALIZED a nop, but still leave the definitions in mman.h etc 
> around.
>
> This is the same we did with MAP_DENYWRITE. There might be some weird 
> user out there, and carelessly reusing the bit could result in trouble. 
> (people might argue that they are not using it with MAP_HUGETLB, so it 
> would work)
>
> Going forward and removing MAP_UNINITIALIZED is a bit more 
> controversial, but maybe there really isn't any other user around. 
> Software that is not getting recompiled cannot be really identified by 
> letting it rest in -next only.
>
> My take would be to leave MAP_UNINITIALIZED in the headers in some form 
> for documentation purposes.

I don't think there is much point in doing this in multiple
steps, either we want to break it at compile time or leave
it silently doing nothing. There is also very little
difference in practice because applications almost always
use sys/mman.h instead of linux/mman.h.

FWIW, the main user appears to be the uClibc and uclibc-ng
malloc() implementation for NOMMU targets:

https://git.uclibc.org/uClibc/commit/libc/stdlib/malloc/malloc.c?id=00673f93826bf1f

Both of these also define this constant itself as 0x4000000
for all architectures.

There are a few others that I could find with Debian codesearch:

https://sources.debian.org/src/monado/21.0.0+git2905.e26a272c1~dfsg1-2/src/external/tracy/client/tracy_rpmalloc.cpp/?hl=890#L889
https://sources.debian.org/src/systemtap/5.1-4/testsuite/systemtap.syscall/mmap.c/?hl=224#L224
https://sources.debian.org/src/fuzzel/1.11.1+ds-1/shm.c/?hl=488#L488
https://sources.debian.org/src/notcurses/3.0.7+dfsg.1-1/src/lib/fbuf.h/?hl=35#L35
https://sources.debian.org/src/lmms/1.2.2+dfsg1-6/src/3rdparty/rpmalloc/rpmalloc/rpmalloc/rpmalloc.c/?hl=1753#L1753

All of these will fall back to not passing MAP_UNINITIALIZED
if it's not defined, which is what happens on glibc and musl.

       Arnd

