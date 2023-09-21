Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7BB7A9448
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 14:28:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=Xdx4hQsT;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=AsHXnvbT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rrvns2p6xz3cGJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 22:28:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=Xdx4hQsT;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=AsHXnvbT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.17; helo=wnew3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com [64.147.123.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rrvmt70jYz2yVh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 22:27:42 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id 0FCFB2B00167;
	Thu, 21 Sep 2023 08:27:35 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 21 Sep 2023 08:27:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1695299255; x=1695306455; bh=Xq
	U4+PADbmN/YvqQXLrRCGcZ07y18plfxqgBBJgIpjw=; b=Xdx4hQsTzl4c24llIz
	192HiWdE2r0Z17h7hha/5B+uybwHOw+lHySp5dgSFIyremltJv6BupWCCE7vqAtS
	DUduuni5p7SDjaoxP7Y0c3dI1L3DDC96hM3q6xwLck95D6CeqCmsxrkKZ6Zgv2mQ
	ih8pZz4GlPyAEKT2EByi/sbL53k7F9MpaztW3ubpkI67GluVKqoEgJAoZkJac6xf
	L40yx+zPXQSonM/qQqXr+/44QEGY/LW3tmoWxfCIXGmvbDY8YlzEj56Y1t4Q3Ooi
	aLhMW+mRkUenODaIJ7pTKXCN8HhFkJ2SLPpatk0e1cLMSpNqYk1QxmquZjzyFqfT
	dFiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1695299255; x=1695306455; bh=XqU4+PADbmN/Y
	vqQXLrRCGcZ07y18plfxqgBBJgIpjw=; b=AsHXnvbTE0NoKn8UR1wNiZEQ0Izgl
	oJ1le/svDXQKmB5iunzfl757K0xMqaKgwpjVCaw2UuP2Vt2mi2RMkN55AQsiD+0o
	/NGYpK0Q1N3N8f+y8hlvcaJaEnVYzzUXulTecLj6OPE2kfCABIE81WZlt/TQWRym
	a3YS2kb9o3UDiIqmT6Muw7WaDcpWDjOLS4FEg9ERk6Zsv5Hp/uVcGqvfRusPbRxs
	/TkNZpWQa1QyBFLzjTES+Opz/HvajxF5Bnwti4DvpslyUHWi81WsLXmneMghKGmm
	5uLl0cSZ1BQNDmkjOK4WmcBmk5Rvp6jy4BVNblrnY0nqT6NYPATO7irCQ==
X-ME-Sender: <xms:tzYMZUXcSuZhEjYsCWLs0tRkqLt6ojmPoMPl4a4ip4r-sgw8vTC6og>
    <xme:tzYMZYnjV322WYYdSTMoXm4rPGFrj126uFz03pQ5jZLRtclncn1Vn2e5IKuSknQur
    nwLBT-aUOiRNbskyLQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudekiedgheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:tzYMZYZPhdycibP7W_ddmUBtLn0YGUONRmMTwUtOUl4FxP4TbdnjHQ>
    <xmx:tzYMZTWsoHJEmyjcJspV67bM8725seq0dG7wF9ka6iwdPlA97rgN6Q>
    <xmx:tzYMZem0QBzUTaJpXkKhVHcTIdTE5qwySok6bADpAf29P4FWOrLpBA>
    <xmx:tzYMZdec6437asUuro7oN_lGHpAgzzqxstK0csnQRsD1an1TXXRMnjq-9-g>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0F24AB60089; Thu, 21 Sep 2023 08:27:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-761-gece9e40c48-fm-20230913.001-gece9e40c
MIME-Version: 1.0
Message-Id: <c4a96578-b27c-44fa-82ef-1c5bf43b972a@app.fastmail.com>
In-Reply-To: <20230921110424.215592-4-bhe@redhat.com>
References: <20230921110424.215592-1-bhe@redhat.com>
 <20230921110424.215592-4-bhe@redhat.com>
Date: Thu, 21 Sep 2023 08:27:14 -0400
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Baoquan He" <bhe@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] arch/*/io.h: remove ioremap_uc in some architectures
Content-Type: text/plain
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, linux-m68k@lists.linux-m68k.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org, Luis Chamberlain <mcgrof@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 21, 2023, at 07:04, Baoquan He wrote:
> ioremap_uc() is only meaningful on old x86-32 systems with the PAT
> extension, and on ia64 with its slightly unconventional ioremap()
> behavior. So remove the ioremap_uc() definition in architecutures
> other than x86 and ia64. These architectures all have asm-generic/io.h
> included and will have the default ioremap_uc() definition which
> returns NULL.
>
> This changes the existing behaviour, while no need to worry about
> any breakage because in the only callsite of ioremap_uc(), code
> has been adjusted to eliminate the impact. Please see
> atyfb_setup_generic() of drivers/video/fbdev/aty/atyfb_base.c.
>
> If any new invocation of ioremap_uc() need be added, please consider
> using ioremap() intead or adding a ARCH specific version if necessary.
>
> Signed-off-by: Baoquan He <bhe@redhat.com>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> Acked-by: Helge Deller <deller@gmx.de>  # parisc
> Cc: linux-alpha@vger.kernel.org
> Cc: linux-hexagon@vger.kernel.org
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-sh@vger.kernel.org
> Cc: sparclinux@vger.kernel.org

Acked-by: Arnd Bergmann <arnd@arndb.de>
