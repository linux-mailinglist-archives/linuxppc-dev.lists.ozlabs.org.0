Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D9176E522
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 12:00:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f6TRORx2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGkq454z7z3cLk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 20:00:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f6TRORx2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGkpD73m2z2yVs
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 19:59:16 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B8CAC61D27
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 09:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 250D1C433CC
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 09:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691056754;
	bh=BFZpJsShnV7chFQ6j5N/0sdSDzzhIsWCO5shMzIbM/I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f6TRORx24cAafVSY/2poXHwp7rxU18r1K2aJNN9yeq3kXCsxm4bI2hBcbOWs78KVq
	 HbsTA9sypvIIASMxyhj7/G84fO4EmdSEPdg9FH9UcSSEbnyiCCJRfeB8B1PPag+lcX
	 65F822tXdwVPsVCQ9ucJykAOer38/AAhlHNjDcCz8KVLUPFJoG38Kceta0YNqPbVq1
	 xZix6QfzbGfdiNe1rLUvmc7v0ysdO5RNr/maVjx0nkLz0SbFY4UHNT3ZspfACC/bpr
	 S3wuFm9JglB696Va/pFddQ/QMF7ATouYo1Lu24XYcnK0/xXuxQDBQ2oJw3amZw8Lze
	 Mx7I9EZeHORjA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4fe55d70973so373555e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Aug 2023 02:59:14 -0700 (PDT)
X-Gm-Message-State: ABy/qLY1v6V2pnsEPfEpR+dRviPxaUCC77uEQCUJT/v9RV9Yd5RD7vTJ
	9UCWeOZmcp7OOIM0dmFquChjBX9eZ+LGr0ongXk=
X-Google-Smtp-Source: APBJJlFw2V3wcRa5v0Vnt1fPUZW5N5QfqaQ6cwXmzUW+1y1w1ET8IiAveXFEKGiBw1l2gDcoGbIc2BvfscEj5e4U4I4=
X-Received: by 2002:a05:6512:158b:b0:4fb:7624:85a5 with SMTP id
 bp11-20020a056512158b00b004fb762485a5mr3778949lfb.0.1691056752072; Thu, 03
 Aug 2023 02:59:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230718125847.3869700-1-ardb@kernel.org> <20230718125847.3869700-2-ardb@kernel.org>
 <ZMt4nkfpdCXxAkr5@gcabiddu-mobl1.ger.corp.intel.com>
In-Reply-To: <ZMt4nkfpdCXxAkr5@gcabiddu-mobl1.ger.corp.intel.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 3 Aug 2023 11:59:00 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGn70sGAHgOttKkC6n6jfVZ9Y61NZ9ffLmJV8MK2Kh8nQ@mail.gmail.com>
Message-ID: <CAMj1kXGn70sGAHgOttKkC6n6jfVZ9Y61NZ9ffLmJV8MK2Kh8nQ@mail.gmail.com>
Subject: Re: [RFC PATCH 01/21] crypto: scomp - Revert "add support for deflate
 rfc1950 (zlib)"
To: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
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
Cc: Jens Axboe <axboe@kernel.dk>, Steffen Klassert <steffen.klassert@secunet.com>, Kees Cook <keescook@chromium.org>, qat-linux <qat-linux@intel.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, Richard Weinberger <richard@nod.at>, David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Eric Biggers <ebiggers@kernel.org>, Minchan Kim <minchan@kernel.org>, Nick Terrell <terrelln@fb.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Jakub Kicinski <kuba@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, Paolo Abeni <pabeni@redhat.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Giovanni,

On Thu, 3 Aug 2023 at 11:51, Giovanni Cabiddu
<giovanni.cabiddu@intel.com> wrote:
>
> Hi Ard,
>
> On Tue, Jul 18, 2023 at 01:58:27PM +0100, Ard Biesheuvel wrote:
> > This reverts commit a368f43d6e3a001e684e9191a27df384fbff12f5.
> >
> > "zlib-deflate" was introduced 6 years ago, but it does not have any
> > users. So let's remove the generic implementation and the test vectors,
> > but retain the "zlib-deflate" entry in the testmgr code to avoid
> > introducing warning messages on systems that implement zlib-deflate in
> > hardware.
> >
> > Note that RFC 1950 which forms the basis of this algorithm dates back to
> > 1996, and predates RFC 1951, on which the existing IPcomp is based and
> > which we have supported in the kernel since 2003. So it seems rather
> > unlikely that we will ever grow the need to support zlib-deflate.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> Support for zlib-deflate was added for [1] but that work was not
> completed.
>

Any clue why zlib_deflate was chosen in this case?

/me also notes that this is another occurrence of the antipattern
where we use an asynchronous API and subsequently sleep on the
completion.

> Based on [2], either we leave this SW implementation or we remove the HW
> implementations in the QAT [3] and in the Hisilicon Zip [4] drivers.
>

That would work for me as well - dead code is just busywork.

> [1] https://patchwork.kernel.org/project/linux-btrfs/patch/1467083180-111750-1-git-send-email-weigang.li@intel.com/
> [2] https://lore.kernel.org/lkml/ZIw%2Fjtxdg6O1O0j3@gondor.apana.org.au/
> [3] https://elixir.bootlin.com/linux/latest/source/drivers/crypto/intel/qat/qat_common/qat_comp_algs.c#L457
> [4] https://elixir.bootlin.com/linux/latest/source/drivers/crypto/hisilicon/zip/zip_crypto.c#L754
>
> Regards,
>
> --
> Giovanni
