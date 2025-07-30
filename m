Return-Path: <linuxppc-dev+bounces-10456-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 592EAB160EA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jul 2025 15:01:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsXQx0LpJz30Vq;
	Wed, 30 Jul 2025 23:01:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753880488;
	cv=none; b=CiLvjaOuWemUmM7VSHWjuF8twHQFeBPMkoqXbOjmyRHEj0yDed0rz3oiTqrJcxCAQD97to9Ayrw38iuosxa5GT6AfYzsZ3usPObZOU/6ZEdaRLdHBeEZNprdbtNipLorkGgZ7psTvQ0rIlChEQYbQR+K2HXY6jLY9MwxBR8q1cb9c6dfsmrFcN1u7pq2gSFNlD2AEMLupNpVEY5uHpL7qL85nEH33aWAmH4soWKs/vWnSpOHQlnLgyGrR4NlWlaAwZq6PRDnhR6s7TegDeWqekf5QtJJJZ6FB3+LdyTU0fHmLV97o7vbsageMtyrY54Uje7BGdxWPc2ZyHOg4k0Q0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753880488; c=relaxed/relaxed;
	bh=FxcW5AfQBhvjZrDjimNxBz0i81/wjNEByJW8vvVde5o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=l3xCAXjwwe0UYkHdPqLfrPNvyGm4puyonpDfkykpHJ/B2ltlxH4g2hozoLJ4KgUT/pbthxdvtghxO1sNZMvcqwf0V1+zP8N34Sj+iMFuSxQvk5CKABk0Q+VeX9cbTRTopJoJXvk95QkzSissJqwjH/YyOM9PGFXACP2mCtg76UpRBTq57PKjfUXp56xwHzxIUBMlzZTNMzq6LsdBWzxcCo+edEvFfxHxh8UNhDtQgLmHit+Ig8GhpDD/QSszQ+RLrmozoBShZGO9vFxg/qY8WIA2NCybsUlnhQbjK19YrePdxvxa9R8cMKYhAC2sGbIcm3grpkpv41HCPnv88XpoDQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lwn.net; dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=lA595RJB; dkim-atps=neutral; spf=pass (client-ip=45.79.88.28; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=lists.ozlabs.org) smtp.mailfrom=lwn.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=lA595RJB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lwn.net (client-ip=45.79.88.28; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=lists.ozlabs.org)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bsXQv0bDmz30RK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jul 2025 23:01:26 +1000 (AEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 77DE340AB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1753880482; bh=FxcW5AfQBhvjZrDjimNxBz0i81/wjNEByJW8vvVde5o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lA595RJBybnULCZpOmXQwqCuUmLbELW+ZzKl4dROmbltJ0rWJ6gs7712S6NfboGIp
	 btbdYE0JD+x1r2Gfy8vV0lDhqoAWNqMtFVDbpeStCcujRnqQdGny/B3/+fUj1stQoA
	 GoN42GixCjGr5V1qnHDYuZDRh8F9H1c7b2mtbobrIOvF2Y4y68OHZjoKXnhTwc/q9d
	 SU/kejmxrbQsBN8fQjK5UyO7ipfV5k5tmb7hYMnj7GkFK61JLxdWvnBJws1UUbXXVQ
	 TnfFM5A3ssSTffP0ZlrHZ5ux/9G+eIqbVz+ok7NhP7aO2L7tqYMSwhHHbMKvOd8Nep
	 O8RqO3iJ8GE5w==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 77DE340AB3;
	Wed, 30 Jul 2025 13:01:22 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>, Vishal Parmar
 <vishistriker@gmail.com>, Brigham Campbell <me@brighamcampbell.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the jc_docs tree
In-Reply-To: <20250730102931.6334022c@canb.auug.org.au>
References: <20250730102931.6334022c@canb.auug.org.au>
Date: Wed, 30 Jul 2025 07:01:21 -0600
Message-ID: <87cy9hx272.fsf@trenco.lwn.net>
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
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> After merging the jc_docs tree, today's linux-next build (htmldocs)
> produced this warning:
>
> Documentation/arch/powerpc/index.rst:7: WARNING: duplicated entry found in toctree: arch/powerpc/htm
>
> Introduced by commit
>
>   c361f76da696 ("docs: powerpc: Add htm.rst to table of contents")
>
> interacting with commit
>
>   19122a7c28ed ("docs: powerpc: add htm.rst to toctree")
>
> from the powerpc tree.

Did that just get added there?  I've had that fix since early June...I'd
rather not drop it (and have to redo my 6.17 pull request) now if
possible...

Thanks,

jon

