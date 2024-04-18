Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B8A8A93A6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 09:01:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=kHMXESl3;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=iXh/6N4b;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VKpb936V2z3cnR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 17:01:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=kHMXESl3;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=iXh/6N4b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.148; helo=wfout5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from wfout5-smtp.messagingengine.com (wfout5-smtp.messagingengine.com [64.147.123.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VKpZF1qTHz3cQT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Apr 2024 17:00:20 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id A8A881C00191;
	Thu, 18 Apr 2024 03:00:14 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 18 Apr 2024 03:00:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1713423614; x=1713510014; bh=KbwfIs/6Rd
	Z169pWLYEvYHb3ipb41NqCczuUbSCEOtU=; b=kHMXESl38JFREZFyRJU/hhID99
	e5wf7SLLXpyo9VQI/ZfBb8n8s2Io+riBvulUuy7sycVkoy/p142vHqKuuUEAwroU
	3/P7QIMsgmHPxDQNIm0FWJQf224unfL7BKe/Vf6H08e2oQZQ89OnxIDhES5tX2I1
	KARD2IrClQHpPDpW7iu2Fklbbp+yoexldewV0MsdSl9FlTGi/WenvIVGVZN+0hmh
	BlEFF29+wsml8l5RYhDbdNYFxuQ2It6SF4d75ZVLMD8tVDR/XEjw+BLNnj3DOjM5
	NqjcXK5uEIWElTEyIy+oIJcitcxZzxxHcWDOHtUGi63L3IdN6GpgU/TQGulA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1713423614; x=1713510014; bh=KbwfIs/6RdZ169pWLYEvYHb3ipb4
	1NqCczuUbSCEOtU=; b=iXh/6N4bWlks9FcbDfFX3qRLp7064tMTwKDCO3ZNY+J4
	h9b8HTUpragYfJmZOR6RKhkxnroEx5sf+EqpyiKOzuMprP5AY/uiRysmwEt20c+z
	k1EJ9fInFWstN5A200FDv/5RMXTg0XTK8uyIysqkqnvsBLWNKCx7OI1ZUTHkoeGm
	ha3rvRvXYptu6IwWi5qvUp2XdvFvQa1z8b7IiwclKASuHdyz8Dzz3qHytC5orvdo
	sNqgYGlaM31f/NMd7lveKdFSGwQ8hpZLrlAqkjqTDaH2Z3PXJg+wopIyQV3Z2jRM
	LBzS0B4xZkuTl/TSy8ZCrQ0gWWpONKGtTAcNlt+ROQ==
X-ME-Sender: <xms:_cQgZtExQWF1vEtmI-j1NgrNOOK6QYI4hbm8iz3ZZDL9Z-KpUWjX0A>
    <xme:_cQgZiUYJm5yGmRI7W1bIqb4eG9Jm_Sjli87tqqmYkqYHnCxel-5uDm9kmAeHBBAD
    jKvnfc1QbK4CfkeYTs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudejledgudduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:_cQgZvLdZW-AwjeAIS_AGEYOBjLQVGOJ7Nt3QE2kBw1gNc2b2-5FMw>
    <xmx:_cQgZjFYwq9Rk9HXz6uYzviwGUjGLIAL1uRoLpRc2Dopi5Rj_4Qp4Q>
    <xmx:_cQgZjVXa3huu584Ghls8Qm-9KeqHgKrFKF9pAfJjmbcdpUEA7808A>
    <xmx:_cQgZuNb0JHfCZpnJfAeqD1EonV81n3gs2Hx9whI0l7rebP5Jm2UGw>
    <xmx:_sQgZg2KJAffrwszZxlTZgPiracHu0cXhTyNKvm7rj0Fj7JIu9eirDus>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 96D7EB6008F; Thu, 18 Apr 2024 03:00:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-379-gabd37849b7-fm-20240408.001-gabd37849
MIME-Version: 1.0
Message-Id: <59473eb6-1707-4bbf-85a3-ba4835f3ee7f@app.fastmail.com>
In-Reply-To: <878r1bb2zj.fsf@mail.lhotse>
References: <20240416153331.1617772-1-arnd@kernel.org>
 <878r1bb2zj.fsf@mail.lhotse>
Date: Thu, 18 Apr 2024 08:59:52 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Michael Ellerman" <mpe@ellerman.id.au>, "Arnd Bergmann" <arnd@kernel.org>
Subject: Re: [PATCH] powerpc: drop port I/O helpers for CONFIG_HAS_IOPORT=n
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
Cc: Nathan Chancellor <nathan@kernel.org>, Anders Roxell <anders.roxell@linaro.org>, Kees Cook <keescook@chromium.org>, Baoquan He <bhe@redhat.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Naresh Kamboju <naresh.kamboju@linaro.org>, clang-built-linux <llvm@lists.linux.dev>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Jeff Xu <jeffxu@chromium.org>, Mike Rapoport <rppt@kernel.org>, Justin Stitt <justinstitt@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Dan Carpenter <dan.carpenter@linaro.org>, Bill Wendling <morbo@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 18, 2024, at 08:26, Michael Ellerman wrote:
> Arnd Bergmann <arnd@kernel.org> writes:

> @@ -692,6 +692,7 @@ static inline void name at                          
>         \
>  #define writesw writesw
>  #define writesl writesl
>
> +#ifdef CONFIG_HAS_IOPORT
>  #define inb inb
>  #define inw inw
>  #define inl inl
> @@ -704,6 +705,8 @@ static inline void name at                          
>         \
>  #define outsb outsb
>  #define outsw outsw
>  #define outsl outsl
> +#endif // CONFIG_HAS_IOPORT
> +
>  #ifdef __powerpc64__
>  #define readq  readq
>  #define writeq writeq

I had included this at first, but then I still ran into
the same warnings because it ends up pulling in the
generic outsb() etc from include/asm-generic/io.h
that relies on setting a non-NULL PCI_IOBASE.

      Arnd
