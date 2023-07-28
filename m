Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC96276698C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 11:58:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SUoVrrVL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RC34S4X4qz3cRr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 19:58:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SUoVrrVL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RC33Y3jWRz2yVJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 19:58:01 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6B3AD62099
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 09:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3958C433C7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 09:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690538275;
	bh=oJaH4FPNITgFoQ+abPo51cru9bJTKsgeWccgWhkv5cE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SUoVrrVL6fuFu9dh/fQxhreLndwtivej2cw8a+pevy2EpHU+QjJYN4XWPf/xfVkFF
	 HX9jFeNC2xSBe5QYPhMsk2oZgjV02lgtYWIc+GeJFb9Vw0R2PT4+vJmLahM1r9i0Nj
	 4yvyhCgjGeBSSHWTWWO3pKHYX12kUh0IpZ7nuYzXRwL8L1aWNF8rsVgyXae8BiBMl2
	 MTIpT59ZpxB9s2JK7kzGvqTd8NdggCK0QPZn/d0TGUKIUyv3DvKVPCXyGO+2ZYdUAi
	 zjzxxOXvK9RN19dlk7XHr8W4zFX7tOgc2fLardbWjO0l4ZdL4FVN/3Qk8r50UDks5F
	 B1sGZ7gJbjeXA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2b9d07a8d84so6271581fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 02:57:55 -0700 (PDT)
X-Gm-Message-State: ABy/qLZt1ZzJg3aFdJw6Cs75kbz3VVQ1y7qYAwKC77P4Bx/H95iJh3/M
	oZmxBF6RKgCa84x1qe8CyTYJm0a2u6iykD6ccY4=
X-Google-Smtp-Source: APBJJlGdvD0o+yLEzMNCc0c1pu2cw3CoX/pd5F5+PU3DAnRSXj0L5yohZi4+WeMBmC3e6J8LoSkPbHQyHGUQqY1xvjk=
X-Received: by 2002:a2e:97d7:0:b0:2b6:fa60:85a1 with SMTP id
 m23-20020a2e97d7000000b002b6fa6085a1mr1402058ljj.21.1690538273864; Fri, 28
 Jul 2023 02:57:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230718125847.3869700-1-ardb@kernel.org> <ZMOQiPadP2jggZ2i@gondor.apana.org.au>
In-Reply-To: <ZMOQiPadP2jggZ2i@gondor.apana.org.au>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 28 Jul 2023 11:57:42 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFRAhoyRD8mGe4xKZ-xGord2vwPXHCM7O8DPOpYWcgnJw@mail.gmail.com>
Message-ID: <CAMj1kXFRAhoyRD8mGe4xKZ-xGord2vwPXHCM7O8DPOpYWcgnJw@mail.gmail.com>
Subject: Re: [RFC PATCH 00/21] crypto: consolidate and clean up compression APIs
To: Herbert Xu <herbert@gondor.apana.org.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Jens Axboe <axboe@kernel.dk>, Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Steffen Klassert <steffen.klassert@secunet.com>, Kees Cook <keescook@chromium.org>, qat-linux@intel.com, Sergey Senozhatsky <senozhatsky@chromium.org>, Richard Weinberger <richard@nod.at>, David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>, Minchan Kim <minchan@kernel.org>, Nick Terrell <terrelln@fb.com>, linux-block@vger.kernel.org, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 28 Jul 2023 at 11:56, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Tue, Jul 18, 2023 at 02:58:26PM +0200, Ard Biesheuvel wrote:
> >
> > Patch #2 removes the support for on-the-fly allocation of destination
> > buffers and scatterlists from the Intel QAT driver. This is never used,
> > and not even implemented by all drivers (the HiSilicon ZIP driver does
> > not support it). The diffstat of this patch makes a good case why the
> > caller should be in charge of allocating the memory, not the driver.
>
> The implementation in qat may not be optimal, but being able to
> allocate memory in the algorithm is a big plus for IPComp at least.
>
> Being able to allocate memory page by page as you decompress
> means that:
>
> 1. We're not affected by memory fragmentation.
> 2. We don't waste memory by always allocating for the worst case.
>

So will IPcomp be able to simply assign those pages to the SKB afterwards?
