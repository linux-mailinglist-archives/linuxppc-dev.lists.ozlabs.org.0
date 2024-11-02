Return-Path: <linuxppc-dev+bounces-2771-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E4E9B9F1D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Nov 2024 12:05:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XgZdY1Vr8z2yHL;
	Sat,  2 Nov 2024 22:05:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730545521;
	cv=none; b=kJTdReGViWa5IRtgSSdfPM3GytFzW7+6+nEfffdlmNFQsyfxtrLN4nylABDmhL9+i3+rCEn08+RbpKQO6JyDhArZ4RKWXYQH8c79dFenQhFRBmNg7MYdFHUc39x/qMpcnd22TAnrMN8Ao8QqATf+wcG0n5H5AkP3IzUJo2yWII5OxioNTrjFLOnyoxX/o+Q6S2k+22z/CdKoSjyrg4XqusThXIVgR1bcLdpRCXeNkezZoDdHXxRVGQr/z26SccLtAKFXI02/Vvb7aX+MfoHJrNIJynxB3As0Owj4yMFMxMspJpeKK8h1uBSodOYK379T5ZlaIUK3nHj+kb5EYgos0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730545521; c=relaxed/relaxed;
	bh=cpwOXtHiGhxM0ZKZA5/j3dJMji48i72DmFeYN3xIIR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hf1YpBcT2tpVQiVKUjlpJiEn/XZ4/OJN/GgoRB+rhxCis8vfdfSvn4cxVm2TRLT+Mmc0uC9Eb1t83H8HniaOEPlwDHZIxN4mtk1C1A0mXd2wLn3DVrwhtocLA7axssgSOrRIVYMhedQsANkQX9Exyx0yl5BNsLJC282qe8vum9bpkmip0BRQ0xd1CdOFqBqrHAPRQZdxUMD7WF8Zgu04sMSyoSa4lKJmviaBTpt1WYneilNDd8sxZSzifvVRxVgHougaoLUCTr1LtjfPCMNKrpIL5ATDSCqG+rgL74/t8QiiCFSBcvlaADfPzZ4Mq2KhYk6Eao+hHac+nUUkAUlqwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aG8rN+aG; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aG8rN+aG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XgZdX0VrNz2xZj
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Nov 2024 22:05:19 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7985E5C39D4
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Nov 2024 11:04:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD45EC4CED4
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Nov 2024 11:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730545514;
	bh=/5V9RBqkx2P66EvYaaaASBdjOLj2pXbKfVO3Hh2MXq0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aG8rN+aGdtH1DPyPt0RE+7lAJgUL/xXXHUelv4xEoDkJGS1o2la6NNuXa5xis93nN
	 K8IKDmq8EiG0o9WOHBCJO193R3Cwdp0VFuoF6oYHS3VAZ2z7ZDdAaNSMmOu/MMLl0R
	 c+5IA9wcIbiEVqWbp16rgmOQIRrPNN2745gD9NAycIDtw6YYRxmQQEvGoyQopB0/Vg
	 9k08OIbmYhcPdDTgy3bov/BTbh35m6h2xJTok/8HFYPtgtvuO45X4GGAawAIkKqaMa
	 YSVdXfZNrwS+ONIBbLTrgDZiGfuTf4K6InWgWETrzpSoUbxTA5sO4ko6HmUl4OCzgy
	 RXaied76n8YRQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fc96f9c41fso29232491fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 Nov 2024 04:05:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVPjRR6dRibe5C28muNDzomHxec8b8mGT9NaVimvQBl3EQh8rH2botyu5ilmk7LpxraRVYBpt6/WTq9c3I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzIfMVMg+JTaPlDsqQuWSs+jNHJTXCZcwqThx6YhxxkQbzeqRdB
	fizVMQUZmFHF/C9zFMJu4il0ci0HQGo0hInPkXqWEqbjYOBc0zj0jiGQ2h4VIpBLwBfJm2sfZBe
	C7VRQG5bNwgDfGdxO4c5Y9P2tGp4=
X-Google-Smtp-Source: AGHT+IE5o/Xo+U8T2tXn6oxoafBjKshUHZrf+SWe+VK5IeGRU8mut4uUUJkKbM8eXFrd2HiwYXSp4cYXTpXetvFDWaA=
X-Received: by 2002:a2e:b8ca:0:b0:2fb:5a42:da45 with SMTP id
 38308e7fff4ca-2fedb46de0dmr21026331fa.16.1730545513001; Sat, 02 Nov 2024
 04:05:13 -0700 (PDT)
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
MIME-Version: 1.0
References: <20241026040958.GA34351@sol.localdomain> <ZyX0uGHg4Cmsk2oz@gondor.apana.org.au>
 <CAMj1kXFfPtO0vd1KqTa+QNSkRWNR7SUJ_A_zX6-Hz5HVLtLYtw@mail.gmail.com>
 <ZyX8yEqnjXjJ5itO@gondor.apana.org.au> <CAMj1kXHje-BwJVffAxN9G96Gy4Gom3Ca7dJ-_K7sgcrz7_k7Kw@mail.gmail.com>
In-Reply-To: <CAMj1kXHje-BwJVffAxN9G96Gy4Gom3Ca7dJ-_K7sgcrz7_k7Kw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 2 Nov 2024 12:05:01 +0100
X-Gmail-Original-Message-ID: <CAMj1kXG8Nqw_f8OsFTq_UKRbca6w58g4uyRAZXCoCr=OwC2sWA@mail.gmail.com>
Message-ID: <CAMj1kXG8Nqw_f8OsFTq_UKRbca6w58g4uyRAZXCoCr=OwC2sWA@mail.gmail.com>
Subject: Re: [PATCH v2 04/18] crypto: crc32 - don't unnecessarily register
 arch algorithms
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-crypto@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, 2 Nov 2024 at 11:46, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Sat, 2 Nov 2024 at 11:20, Herbert Xu <herbert@gondor.apana.org.au> wrote:
> >
> > On Sat, Nov 02, 2024 at 10:58:53AM +0100, Ard Biesheuvel wrote:
> > >
> > > At least btrfs supports a variety of checksums/hashes (crc32c, xxhash,
> > > sha) via the shash API.
> >
> > OK, given that btrfs is still doing this, I think we should still
> > register crc32c-arch conditionally.  Having it point to crc32c-generic
> > is just confusing (at least if you use btrfs).
> >
>
> Agreed. So we should take this patch.
>
> The current issue with btrfs is that it will misidentify
> crc32c-generic on arm64 as being 'slow', but this was already fixed by
> my patches that are already in cryptodev.
>
> On arm64, crc32 instructions are always available (the only known
> micro-architecture that omitted them has been obsolete for years), and
> on x86_64 the situation is similar in practice (introduced in SSE
> 4.2), and so this patch changes very little for the majority of btrfs
> users.
>
> But on architectures such as 32-bit ARM, where these instructions are
> only available if you are booting a 32-bit kernel on a 64-bit CPU
> (which is more common than you might think), this patch will ensure
> that crc32-arm / crc32c-arm are only registered if the instructions
> are actually available, and btrfs will take the slow async patch for
> checksumming if they are not. (I seriously doubt that btrfs on 32-bit
> ARM is a thing but who knows)

(actually, backpedalling a little bit - apologies)

OTOH,btrfs is the only user where this makes a difference, and its use
of the driver name is highly questionable IMO. On x86, it shouldn't
make a difference in practice, on arm64, it was broken for a long
time, and on the remaining architectures, I seriously doubt that
anyone cares about this, and so we can fix this properly if there is a
need.

The only issue resulting from *not* taking this patch is that btrfs
may misidentify the CRC32 implementation as being 'slow' and take an
alternative code path, which does not necessarily result in worse
performance.

And I'd prefer static_call() / static_call_query() over a separate
global variable to keep track of whether or not the generic code is in
use.

