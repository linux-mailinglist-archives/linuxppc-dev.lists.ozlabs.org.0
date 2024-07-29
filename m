Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DAA93F1CE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 11:55:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=sGeo6C1x;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=BYEV6eol;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXYdj0Cb5z3cXD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 19:55:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=sGeo6C1x;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=BYEV6eol;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.155; helo=fhigh4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXYcx1cwGz30Tp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2024 19:55:11 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 38B3A1140158;
	Mon, 29 Jul 2024 05:55:08 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute4.internal (MEProxy); Mon, 29 Jul 2024 05:55:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1722246908; x=1722333308; bh=wXV/r3Ef+R
	SOwF3n9b+Go+Q2efekHDW22bLwz2SfG8U=; b=sGeo6C1x+smISDrrbyZ04v7yjH
	iZ0mw8uxR0llQzXg1BRcJlNE0S9qM0PfgzAYcXWXOybVkmd6nPWhvCdpIY/8TESa
	s8QSOBViokCkYq7oeQURDo3I99SC2wA/LQRHxH2w4UW8p6WMpb1q9NnP7hYfnyUX
	+hhq5uc35LJD8aLqqloOaDogbX+baUzVeco9AbiucecA4HJrjwSZ3Qg1ZrE2MJzy
	pCX1sA86LQTlJnTi1mE0zafviR7WrMmhvw1ULywlXCE9KNqrC07veaq7byj3KEGc
	Zy8bYWy3dJnTNRmAQGBkhrtTI3tqHw7F+G1cl+OoB8DOs5UZcGIuexZUigPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1722246908; x=1722333308; bh=wXV/r3Ef+RSOwF3n9b+Go+Q2efek
	HDW22bLwz2SfG8U=; b=BYEV6eolZK5ALcEAnnnsWy2rseyxqIwqhekuEBooGfxD
	7KrNXk/OH6YQBNw1YlT9clYlTtk0DiCuRNt38id90a0aXgq6oj/BIWJZkUBhCiQf
	jaiLN2Zyj37g+Z8uy6O/NgySBsWOMlQz3mDxQHV0DKdXW/ejJKMcrIreCHEUzgj/
	3VExgSckmfDM4jrm5fVvf4/wPFm+gRhEKTTOCv2QOHka0wOz6PQg+8d5aAwu4x0W
	F+Dojy9u4xwYL4G/u4GtiZTkkItQ1yC0oTdBUvIHaRKL3+QlTP8+6IvVWvyP59dF
	95JebUMqIJpnI52cNdVv1fKREF4tg+Z5FNIWMmH+zQ==
X-ME-Sender: <xms:_GanZuUFj9a4RBACPe0wzqbttPE7veUNjUeWZ8rCXHqnfRFxmGkAIQ>
    <xme:_GanZqlcQycvH9Nwsr8pFF0SMHpAdvNkQJlVIYe-YI2gPHk4lNhd97IVgCwttA8gO
    5_k54V12HnxP6mPA1s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrjedvgddvvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedt
X-ME-Proxy: <xmx:_GanZiaiGi4ItI5HJqKLwKX8lOzNDC3NZ7MI-4UmXjAfZiY2oz3Z2g>
    <xmx:_GanZlWa8EJeZaqO_p8fzZTkloUL4bpdZryWl5E7xgzVJi6vl-Ml7g>
    <xmx:_GanZonYueOLEeXCG7W-f1RY4yUQV7OSCmBSnyZTyonKoC35cayIhw>
    <xmx:_GanZqfk3tsJlL3EsCDS-FlEQ1EvK20d-iRG8tAH4Lr1DsXB7JeMPQ>
    <xmx:_GanZhefW1QGQFVvsMx3iJHP8GHj0MEL_fFdncS-8VMEIz123uNHAZfP>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0A546B6008D; Mon, 29 Jul 2024 05:55:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-582-g5a02f8850-fm-20240719.002-g5a02f885
MIME-Version: 1.0
Message-Id: <502ee081-8e09-422a-a1f9-be40aeaa84fb@app.fastmail.com>
In-Reply-To: <bd4e9928-17b3-9257-8ba7-6b7f9bbb639a@linux-m68k.org>
References:  <CAHk-=wiyNokz0d3b=GRORij=mGvwoYHy=+bv6m2Hu_VqNdg66g@mail.gmail.com>
 <20240729092807.2235937-1-geert@linux-m68k.org>
 <bd4e9928-17b3-9257-8ba7-6b7f9bbb639a@linux-m68k.org>
Date: Mon, 29 Jul 2024 11:54:47 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>, linux-kernel@vger.kernel.org
Subject: Re: Build regressions/improvements in v6.11-rc1
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
Cc: dm-devel@lists.linux.dev, linux-sh@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org, linux-hexagon@vger.kernel.org, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 29, 2024, at 11:35, Geert Uytterhoeven wrote:
>
>>  + /kisskb/src/kernel/fork.c: error: #warning clone3() entry point is missing, please fix [-Werror=cpp]:  => 3072:2
>
> sh4-gcc13/se{7619,7750}_defconfig
> sh4-gcc13/sh-all{mod,no,yes}config
> sh4-gcc13/sh-defconfig
> sparc64-gcc5/sparc-allnoconfig
> sparc64-gcc{5,13}/sparc32_defconfig
> sparc64-gcc{5,13}/sparc64-{allno,def}config
> sparc64-gcc13/sparc-all{mod,no}config
> sparc64-gcc13/sparc64-allmodconfig

Hexagon and NIOS2 as well, but this is expected. I really just
moved the warning into the actual implementation, the warning
is the same as before. hexagon and sh look like they should be
trivial, it's just that nobody seems to care. I'm sure the
patches were posted before and never applied.

sparc and nios2 do need some real work to write and test
the wrappers.

It does look like CONFIG_WERROR did not fail the build before
505d66d1abfb ("clone3: drop __ARCH_WANT_SYS_CLONE3 macro")
as it probably was intended.

      Arnd
