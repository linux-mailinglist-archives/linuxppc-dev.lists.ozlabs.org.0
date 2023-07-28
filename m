Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F1F7669C7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 12:04:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tXpHkr01;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RC3Bs5NFkz3cSf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 20:04:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tXpHkr01;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RC3B33bV8z300f
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 20:03:39 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6AAB7620E8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 10:03:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C80C433C8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 10:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690538617;
	bh=Mwb3geMIex9bief6/MfEaJk/1F/fz+2cfnXdqIIS7kA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tXpHkr01M64W1DlXlgN/uXAgQO8lbyiEuO9Cf0SA6Q2RwpJdglx+2A0vRRYDmqeFx
	 QkTSlvyPqmqL5v2RGTmtZIQCphoyH1AMpe/MzjMnZbgbsn7ANvRddsPz5dfpMpeuOG
	 6l12lZNR0KLb31OrfsB25kBIZZCHOOCZrMFkKSzf3Sn9GeITMm80WpBC25fbo/MeiH
	 Is2QOewf3opADVOZGSDdpl0GZlOCa0klQ0zI98I6Yqddd2IP316tAkQeY8FyfGyUD1
	 jRK4ZYBZDSKe9POSmHbsNwVOrkLU/PqrDqdXT/BM+hMIHzatm8aiKxo28ex5ebGkj2
	 BmUzcKu/wrcCA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2b9d07a8d84so6372571fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 03:03:37 -0700 (PDT)
X-Gm-Message-State: ABy/qLa94zfUM/ZirUR5fq65EaN78iDK4HGyTCuZRtY+q86OU+UpqNq1
	zDDyyn1Zlf5dSm1M7+ZLCFeWOUKZ8PfP9fmP3rQ=
X-Google-Smtp-Source: APBJJlFx+dQYWLD4Q57imF/9JvEvN5dBgTWOloOyttLP1mjqjiHeaGuGhb9mmggYpjQLqdnp9xDE77NZuZ6h+uNdIwc=
X-Received: by 2002:a2e:828f:0:b0:2b7:7c:d5a1 with SMTP id y15-20020a2e828f000000b002b7007cd5a1mr1160535ljg.23.1690538615123;
 Fri, 28 Jul 2023 03:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230718125847.3869700-1-ardb@kernel.org> <ZMOQiPadP2jggZ2i@gondor.apana.org.au>
 <CAMj1kXFRAhoyRD8mGe4xKZ-xGord2vwPXHCM7O8DPOpYWcgnJw@mail.gmail.com> <ZMORcmIA/urS8OI4@gondor.apana.org.au>
In-Reply-To: <ZMORcmIA/urS8OI4@gondor.apana.org.au>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 28 Jul 2023 12:03:23 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFnr64b7SA1zYvSOrXazdH_O5G=i4re=taQa9hAeRbh-w@mail.gmail.com>
Message-ID: <CAMj1kXFnr64b7SA1zYvSOrXazdH_O5G=i4re=taQa9hAeRbh-w@mail.gmail.com>
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

On Fri, 28 Jul 2023 at 11:59, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Fri, Jul 28, 2023 at 11:57:42AM +0200, Ard Biesheuvel wrote:
> >
> > So will IPcomp be able to simply assign those pages to the SKB afterwards?
>
> Yes that is the idea.  The network stack is very much in love with
> SG lists :)
>

Fair enough. But my point remains: this requires a lot of boilerplate
on the part of the driver, and it would be better if we could do this
in the acomp generic layer.

Does the IPcomp case always know the decompressed size upfront?
