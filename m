Return-Path: <linuxppc-dev+bounces-2770-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9819B9F04
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Nov 2024 11:47:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XgZDm0WyFz2yGD;
	Sat,  2 Nov 2024 21:47:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730544440;
	cv=none; b=Ps/VRzOdRjUV4kd4PDEAyD4asOP9xdNn6IAgsr0xo2WUHkjZfc7kBoKup8Iz02DofSwqGUm3Q1e7Azid8m6puBtFZWMSPbHxIUnViA41wg9xSle81Y/6+KjUtujEUB805x1LHcX4jBzQR5lQHku5flEq/93ZOHeRSaQVq15gKiW5MYus0NOA0Nt052BrbbDshX4SQ9uilIRIxE12I8m1N1VY+CSvFN6kxQ7fpZONrYT/g0X5vFv4y73eJEAzIG0dr6Bd9j+7KxsQsoZNebJ35V//DJuTNNBMDyxfTdz1NEyxfQU/u7rHARAsY7RDjWBfGPNVwhfMDfMjnj6hxkXp+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730544440; c=relaxed/relaxed;
	bh=vV8yCMocDv/OPGrEgJmVudUgL/DOpRNs7uqcUGQkYYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VtZkfnzak9sWwLtmM8gHUr/A4lJWX8ansK0eKR4k7iYymprW7V2fUvCNPC7icvFtMpiyDg9isiZg8B9brTY879Evawph2OkWCwQwAY4boFXxE25G14qAlQZqT7pJo5s0AspPDbS8Z5wUlGFnimSznxURvOJ1CxvOB4kvUOMbQLOk8uC3v7DQjG/9LMHe+1iZPX09zeYSeNdWzPB4kA42LduGQK+eXEx994WKZMZ/FNcWQnghqafdSz4TESkSeyesKJ/GR/Efx+rgCzBY9Gi96vzHcGqUoZH03Dvs/WSnn0qlc/Z0P/3qX/bB+sD2O6GIbiAIpg85ET0RM9pZvVsfMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GETuJANe; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GETuJANe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XgZDk4yddz2xGt
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Nov 2024 21:47:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B14C4A4025E
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Nov 2024 10:45:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C75CEC4CEC3
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Nov 2024 10:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730544433;
	bh=M7FdSpu+PhluM81llzaa2KRxqj+jubQ2BPx4TOrWNTc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GETuJANeH7gctgmH/+nyiGbLZgU60kn5uvKaHdxC3jOHXyMIY+5SIP3FVcC5h/4vv
	 2F7xHCEoHJS0lX3P7aD3ut8mIFSrFv0fHm6Op2JrumAUKGqrtpD0EWeTVv6BzOthLb
	 cOPP8GebgckiemWtQdsi6mBWqLiYHzeSWyMzb1zENPEsHy5Xv2w9L9UtNhAaMFqePl
	 DwhnDPyV/TgRCpycn4X3kpJ24lrXa/PI2ONFP7TokPIoc1Slpz4EGZ4aA86XjzMGou
	 SSLprHHgimxQ0kP5J6bxA4m+lTjGXKTj+ngmbOktZM9E/03kahXIaRmHD6mbHIg0BX
	 2ajJSBCd/ctBA==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb50e84ec7so19110581fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 Nov 2024 03:47:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJ4ylk6uHTpGYbJ5nKWPC2HQa5XyErCqEQJhVZ+i70qgaMUb3AXfhKsI8HZqZrgvZVns3XOhlBRpjPo+c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yws2kBNUt/92Esndrc/jsYZ+8lh3zq520AmjQIM6VofY8nmlhrp
	dg29/GtiE0RPBW/WFT1ewT2RsGZBI1NnQ91OmGQ9iedTtzCJtXuz/uZuuSs6w6ux9JbM0IMz8Ce
	XkZlV/7XfSlUClE6fdbpEmVS9T0E=
X-Google-Smtp-Source: AGHT+IH0WCZimX1F/VX+DWohj1qqHgkCvV1OEM1qu/eyPpSjntB2c2S/MHD4wvbHvrBfL9ia8YhfUT4VBcWPbilaETQ=
X-Received: by 2002:a05:651c:506:b0:2fb:4603:da13 with SMTP id
 38308e7fff4ca-2fcbe0989bfmr124544811fa.39.1730544432162; Sat, 02 Nov 2024
 03:47:12 -0700 (PDT)
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
 <CAMj1kXFfPtO0vd1KqTa+QNSkRWNR7SUJ_A_zX6-Hz5HVLtLYtw@mail.gmail.com> <ZyX8yEqnjXjJ5itO@gondor.apana.org.au>
In-Reply-To: <ZyX8yEqnjXjJ5itO@gondor.apana.org.au>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 2 Nov 2024 11:46:59 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHje-BwJVffAxN9G96Gy4Gom3Ca7dJ-_K7sgcrz7_k7Kw@mail.gmail.com>
Message-ID: <CAMj1kXHje-BwJVffAxN9G96Gy4Gom3Ca7dJ-_K7sgcrz7_k7Kw@mail.gmail.com>
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
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, 2 Nov 2024 at 11:20, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Sat, Nov 02, 2024 at 10:58:53AM +0100, Ard Biesheuvel wrote:
> >
> > At least btrfs supports a variety of checksums/hashes (crc32c, xxhash,
> > sha) via the shash API.
>
> OK, given that btrfs is still doing this, I think we should still
> register crc32c-arch conditionally.  Having it point to crc32c-generic
> is just confusing (at least if you use btrfs).
>

Agreed. So we should take this patch.

The current issue with btrfs is that it will misidentify
crc32c-generic on arm64 as being 'slow', but this was already fixed by
my patches that are already in cryptodev.

On arm64, crc32 instructions are always available (the only known
micro-architecture that omitted them has been obsolete for years), and
on x86_64 the situation is similar in practice (introduced in SSE
4.2), and so this patch changes very little for the majority of btrfs
users.

But on architectures such as 32-bit ARM, where these instructions are
only available if you are booting a 32-bit kernel on a 64-bit CPU
(which is more common than you might think), this patch will ensure
that crc32-arm / crc32c-arm are only registered if the instructions
are actually available, and btrfs will take the slow async patch for
checksumming if they are not. (I seriously doubt that btrfs on 32-bit
ARM is a thing but who knows)

