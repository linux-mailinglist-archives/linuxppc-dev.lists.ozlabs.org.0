Return-Path: <linuxppc-dev+bounces-12998-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 084F3BE816A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 12:38:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cp1WF71bwz3cYL;
	Fri, 17 Oct 2025 21:38:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760697497;
	cv=none; b=Oikknunrzc1VZmFAiKnqO8hKZWgQgTtTQnrUnXZNHcFQkn5B9hKhwXE1Mmbk43wLN91EsP9x2GHMQD89fXVsXw2Zwx+S0V/XzXJc0ebeVDiRhvCevIoN4qJiUwU/7wFRRGhQJv968YAVYKckANVqSji1m89pXjgiH7BZeRM/d+Ej4Q9M3qYgWNsOObk9xZAhNKoyZXkzDq3o6tBiEizrQNox+Ptqb/nvu/DRDDRnqGOLtBR50ivaStE7QWm5HBki0aE+2GwU8R6hbD7MoUbrBajw/jZ2wQPU6ljH8jFQwlhzkBAbE3vBLNdaMXK5oJiyVGCxvIYwIUCr15cWEbY8lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760697497; c=relaxed/relaxed;
	bh=nWS8mbbAyKknksTkgFaSq1Uk5/fAQaz/isktn9K57hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ai3CP734hiM8VrhpdVLOIrB9A8lnuiqLEAhHvucxKUOx6bmzVwSTg/NygrFk+avYXY6mwlNQ2zXk2f+LQgYLQl++XGeLGWNtCw86W2A1e6qs9rgjzxUb4LBovxRfAy8Y3/I+q8D2fSsyhgufSAy1JKDJUom6donL/3iLrS5LA/TJ9pewh5ZVVLJp789nS/BbFzxZxR36gERpyPIkP4x+tDXXWQLBa6zTc4xgnKEDlrXfL/OgFEveaGZGJf59hSCrb0dLOEJq8ZIPJz5jAhpH4jMe7ptXJVu1zdBpAEjNHcahmK6+DIrvQIm+q5jxBFQXLJZIzpWOvYr1zXsVz+5Wmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=rx05nYJA; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=rx05nYJA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cp1WC0J0zz30Vl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 21:38:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nWS8mbbAyKknksTkgFaSq1Uk5/fAQaz/isktn9K57hg=; b=rx05nYJAYN+RTwLB2lGfP1bKqX
	cPz5fqwLakGazsonqYKuradYhuAqs/nZNMp1UmMdmEfCx/0wwDD1Jo8DUW2lVPnJwIO6NufWGAA9r
	ZiUDqFrLMAam5RoKlt9adHo8b8Nkesw6GoiJ3pPrPHmQwBLTDcZDeMMDpoeIh/vzMVcK8i9VuHnvA
	GdtPmogaKpTQntPRIva/xPzJCazhbx9a7ZE/fV3ObzJngfuEGmNt4pPpmcf/oqbUye2TOgbB5JjbS
	DIiU97r47NbJ1u6sTo7huCPbrCOm4ElFLO5G2diIbCi3+DVFhpmeU5zExTsMiYzZevf9n4rETyW3X
	VfZs2JcA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hqO-00000008mcj-0Bmj;
	Fri, 17 Oct 2025 10:37:57 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8AB1130023C; Fri, 17 Oct 2025 12:37:55 +0200 (CEST)
Date: Fri, 17 Oct 2025 12:37:55 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org
Subject: Re: [patch V3 00/12] uaccess: Provide and use scopes for user masked
 access
Message-ID: <20251017103755.GZ4067720@noisy.programming.kicks-ass.net>
References: <20251017085938.150569636@linutronix.de>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017085938.150569636@linutronix.de>
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Oct 17, 2025 at 12:08:54PM +0200, Thomas Gleixner wrote:

> After some back and forth discussion Linus suggested to put the local label
> workaround into the user access functions themself.

> Andrew thankfully pointed me to nested for() loops and after some head
> scratching I managed to get all of it hidden in that construct.

These two hacks are awesome and made my day; thanks!

> Thomas Gleixner (12):
>       ARM: uaccess: Implement missing __get_user_asm_dword()
>       uaccess: Provide ASM GOTO safe wrappers for unsafe_*_user()
>       x86/uaccess: Use unsafe wrappers for ASM GOTO
>       powerpc/uaccess: Use unsafe wrappers for ASM GOTO
>       riscv/uaccess: Use unsafe wrappers for ASM GOTO
>       s390/uaccess: Use unsafe wrappers for ASM GOTO
>       uaccess: Provide scoped masked user access regions
>       uaccess: Provide put/get_user_masked()
>       futex: Convert to scoped masked user access
>       x86/futex: Convert to scoped masked user access

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

>       select: Convert to scoped masked user access

Basically okay on this one too, except see the comment.

>       coccinelle: misc: Add scoped_masked_$MODE_access() checker script

And that's just pure magic, I can't seem to get me head around
coccinelle syntax.

