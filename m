Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7D36E4B0F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Apr 2023 16:13:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0TYS2v8gz3f5Z
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Apr 2023 00:13:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=cvpI950j;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=aD83kUhj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=cvpI950j;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=aD83kUhj;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0TXV1s4Kz3cGk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Apr 2023 00:12:40 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 3CB715C0076;
	Mon, 17 Apr 2023 10:12:36 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 17 Apr 2023 10:12:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1681740756; x=1681827156; bh=rt
	mXUVStrgw6nKVv7ID95dfZD6+whmhR2sZpfAx2JC8=; b=cvpI950jylHNWGGxX3
	ffHYboh+iDIsBvhpEDw08gT0LYZ8oMMkcdcXDZVKzSkh8esFParV3MdHeic+dgn+
	kH0rbkdfurwqLl5v5uDyvgv2Zfru5aIsiX+9hVd4psY1p8GfC9rDavxuvI0+p+vV
	HopcxWe/RDLjKvGegghWwXZuxEWZTQL17wUgNwlbJVpWThS7jri3Bq5bz/+fBp8a
	C9ogLLe/DWQcOTqHQ3w2nVO8Jy28kXGWEQlTt1fhSgoUOE5X4sfausj36i66OtQq
	n+sFD0KYJ9gc9yFZJbxxbxucxrkLiwRn2Ike/DVt9GdSUl4cglZbI9zSDG53SEdY
	jt2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1681740756; x=1681827156; bh=rtmXUVStrgw6n
	KVv7ID95dfZD6+whmhR2sZpfAx2JC8=; b=aD83kUhjQpSMNmNM/jNLZdKF7Z1Y9
	aAF8LixyaBK3Kb9Alnq4xfmtqhcmzQfzFzhW54TeND6tHtJ6DlFW0p7RY6giFVXL
	tf9egb1+THfNCfp2se+/8HsOhTd+4Sq7v2bWd17TyxcJ4+J4B0MofIb6m9cSZrEQ
	wzfIBj34Bfh2DUjI/GhTces0G4/SxB0KIBf+7D0zRQHMGkLcJ/1RMKY97H8eThSf
	aqCPgo8YFDSNijB+9gI6uSiAa1ep9EHgcG7rmPXjeQSNwIvQjZ+dOlNI9Q2dvc5A
	i2eHfsj9szgXcC+xocDDLHhNF3PDLhPslESBV1Jdy07DSiQsw8Vhd5Z+g==
X-ME-Sender: <xms:01M9ZLDvPtWAPmi3WXNzECAofp8SL7yIxzpWl6AAWPVMnFZITSexig>
    <xme:01M9ZBhKWjWONa2OiIi9-RqJwrx92V0sTYJWqtEZOVy0Lm4y32eWpPkSBIKJxwd9n
    z3hjS-kxClz5Wygqt8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeliedgjedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:01M9ZGl0g-tLHtvweyZxjzJgmeNqpttS9QZsz_hHc4GKSgFu8tXu5Q>
    <xmx:01M9ZNxSPgUXj44dwCEqX3eLnDK1yoDkjqmHV181SYugEkImQvHuiw>
    <xmx:01M9ZAS0DqGZ_SAOY1Oquyq7riLCXVeBCKulpduFz67EWr0UDhOBtg>
    <xmx:1FM9ZCFTyE9BhjDjf2qCzcWdgAa-x5jPF0aSST4sLwe56mYmcMZMXA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C62C0B60089; Mon, 17 Apr 2023 10:12:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-372-g43825cb665-fm-20230411.003-g43825cb6
Mime-Version: 1.0
Message-Id: <1641007d-7953-426a-a3de-ca9c90f6c5a9@app.fastmail.com>
In-Reply-To: <20230417125651.25126-1-tzimmermann@suse.de>
References: <20230417125651.25126-1-tzimmermann@suse.de>
Date: Mon, 17 Apr 2023 16:12:15 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Daniel Vetter" <daniel.vetter@ffwll.ch>, "Helge Deller" <deller@gmx.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 00/19] arch: Consolidate <asm/fb.h>
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 17, 2023, at 14:56, Thomas Zimmermann wrote:
> Various architectures provide <asm/fb.h> with helpers for fbdev
> framebuffer devices. Share the contained code where possible. There
> is already <asm-generic/fb.h>, which implements generic (as in
> 'empty') functions of the fbdev helpers. The header was added in
> commit aafe4dbed0bf ("asm-generic: add generic versions of common
> headers"), but never used.
>
> Each per-architecture header file declares and/or implements fbdev
> helpers and defines a preprocessor token for each. The generic
> header then provides the remaining helpers. It works like the I/O
> helpers in <asm/io.h>.

Looks all good to me,

Acked-by: Arnd Bergmann <arnd@arndb.de>

     Arnd
