Return-Path: <linuxppc-dev+bounces-9203-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C116AD107A
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jun 2025 01:47:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bFFGV362Rz2yGQ;
	Sun,  8 Jun 2025 09:47:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749340034;
	cv=none; b=aUhhu8Je6vlH+yIy0olyPHnqKe0MgVVAiZawZVSCCuOiur793xasnj2WYqdx/QESk1IpQGOEZt5s6OewhujXLfs2Z0Sz5+2Nc9K2LztHTcuMhSgDG/+qQhbG1sraeQ9znxsE6dXYZNDDkN2QvgDzzT7gazWWpNn+cLWF0IdR3TJfTcBAhgIc8yQqq/wh4ND/siux1WHupSRJwhC9cFRpUPje+2t9ELIWCr2FG6IfXs0iaIxwwwJ7TM4HIa5IiaFLhwcHw5vJXsERwyO9K9IQR+mSLvddDZlfB6YlG8h6KhDJIAfpoQ6XYz4SOvQHIgV4d2WoIP0q6f7NSEnD+rnSRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749340034; c=relaxed/relaxed;
	bh=9BLd3zVhm1uyr2zWfOpGUqAHdfaRE3TGpoHRN6aaMSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IUdIZEBMDz/sIYCC4zRwfvRj0ZQ8AHTuFeEzvFsDKR/Ff/BOih6YlxI91bnZ2f3DCf7QGafD64jwvQpfWl/zDClXlEnTvjLI9KY7kiLPge6fI/G+25IeBzGBgl6Sq3Gm3aWHMVUIxxPfKQttJ/Ob6VGvSfxbOman72++0TH1oHrlDr47PrTMWfV7YZCfNZk5XnXRVs31GU2PTzjPzTTRFYZetjlp/SOOy5IQN7bry4D2Vd/T9u6cINYm/hUR7MUsuYekYXu5x6l2OwaVk0D+UP/TyjbCThelVGNuXUFvteonidoRLCA+nOlvB1Yko32ehAvmrfmn5BH3i6xALQEHzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=jsPgU/cc; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=cnmf=yw=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=jsPgU/cc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=cnmf=yw=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bFFGS1Wvpz2xsM
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Jun 2025 09:47:12 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 333DAA40311;
	Sat,  7 Jun 2025 23:47:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE6DC4CEE4;
	Sat,  7 Jun 2025 23:47:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="jsPgU/cc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1749340025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9BLd3zVhm1uyr2zWfOpGUqAHdfaRE3TGpoHRN6aaMSk=;
	b=jsPgU/ccygnXS60vh3VCJ8IeDnGtsomv+dciNUeunJ0SO8LqmCcTqPcJBkB2QFrLru1ll1
	E9OF1lkNEqMRShrw2za9BAoJsJQKmF9rvzmtd3v/rLI1EduGNSPRtry+Kyl+tncxIkS+aK
	UrU1VhYkP4pcQtnNoKmPvrZIA/DIb6Q=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 669734c3 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Sat, 7 Jun 2025 23:47:04 +0000 (UTC)
Date: Sat, 7 Jun 2025 17:47:02 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	linux-arch@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 00/12] lib/crc: improve how arch-optimized code is
 integrated
Message-ID: <aETPdvg8qXv18MDu@zx2c4.com>
References: <20250607200454.73587-1-ebiggers@kernel.org>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250607200454.73587-1-ebiggers@kernel.org>
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Jun 07, 2025 at 01:04:42PM -0700, Eric Biggers wrote:
> Having arch-specific code outside arch/ was somewhat controversial when
> Zinc proposed it back in 2018.  But I don't think the concerns are
> warranted.  It's better from a technical perspective, as it enables the
> improvements mentioned above.  This model is already successfully used
> in other places in the kernel such as lib/raid6/.  The community of each
> architecture still remains free to work on the code, even if it's not in
> arch/.  At the time there was also a desire to put the library code in
> the same files as the old-school crypto API, but that was a mistake; now
> that the library is separate, that's no longer a constraint either.

I can't express how happy I am to see this revived. It's clearly the
right way forward and makes it a lot simpler for us to dispatch to
various arch implementations and also is organizationally simpler.

Jason

