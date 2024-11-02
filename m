Return-Path: <linuxppc-dev+bounces-2774-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D6B9BA17A
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Nov 2024 17:46:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XgkCd64g6z2xks;
	Sun,  3 Nov 2024 03:46:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730566013;
	cv=none; b=az9TiA1zHTTDXc6w97uzdsJesq5oJPtr1rNrFycM9OMr9jKkiX8kOlmLkYYNFmGZeOFiechO9ttaCsevQcbBxUg8KrgIWkKquGv4m+8L02FrdIYw3CP8CR5AIO0y3cJb/U0cc+ayWbwy9Am1L2vIfP75oxrkcKb6406vKQGim6GMXgxLktkDGwRoTzFMfa5gESGH6oCg5hV9vdF4P8tMzpUUQz2Zq/aU0D0G7SeiKLs6jtFp04flAU+blHZIwF0fI1xWPyUrVnXEmMgjSMhJ+0QCWjsgjajBmvfxrx63skbM+kvb++f3c0vj6xs5gKjRahn+0IP+FVA76dIV5iB3lg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730566013; c=relaxed/relaxed;
	bh=E38ED0bvZ8ViDN76LuuGorJVL00ITAOwya5y2WsL3AA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=klpcxdvAy6qtF7fqo9nUIQX5J61zrpwocuQjDfEjLtIYwU4zuvLFGwyji26r9D3Z2dg48JI+dVjqfeXYgYdQepuYzpR23H6ArA4BIaR8WfS4OIbC1/teFBK9ep6N8Rw7DyP8N/WYALfyw32WFxS7wlqdNcjPAni3NHM5gUsZDLDU0zEF8umnUhS+T5mEb0gLoCjZNNCODr1UuMjOjtnj/rplgsNrp9OfGdjlSHbcmMt5Jckkz2lzxalqLxrZcpPS86o4eOK+pTjJ4A80sxGzaLbWUxhBEqGbetAdJjLKQNtILPr8WbUNo6Zd73Ph1Vryl2ZDH35l9O9+4KJkrMkjKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NJ+1XHVr; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NJ+1XHVr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XgkCc4dSgz2xgQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Nov 2024 03:46:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A72975C34F7
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Nov 2024 16:46:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E650C4CEC3
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Nov 2024 16:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730566008;
	bh=GxoXhXGyHNH8GVqUExL8Ti1VvRWiwrpIEQI7tN7LYew=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NJ+1XHVrktQ9WGmo2EqP6wMVn/OEt/Sv2350oNUT4r8GsAp9SYm0VRx1/D+bpxg8g
	 AhMeZGuz9tEsHn97hHwlwmvLVZz1BdRK3HPFE5YqLcs8A8XoDyXbcjgPGJYTBYv2lw
	 e7zJmHAonSkqpKaKaw6UnNUCHZimTZLKO1FLqORq1mUqGyfy2E7ES/38e2axn3jHVc
	 vyfrkc6wWAWUTuzFcDsIW2fxGUusCopNRtdPosLD46rmwBPJUZoGz8kFjaYjXuuFth
	 EueP60OBXtYFWJvxL+0V8IT2yf0FfbKIXjL0+19V3Zm0XEOHjVKdBVOhl1og12Usc6
	 DBoCweRx5bdQg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb5743074bso23761201fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 Nov 2024 09:46:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWId5BO2pejwgi9tLSzhyLgcdN+Op7gKt4VeNcQaSfHNfXFczYkipYP2++bWCPYWsISckXW/92rDDjO60s=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwtL9ScMuYEBM2wTg03XtVQ8KWyLCaA+WiWCyFROVr96X5Ssi8l
	pvuJWSLgRs3ENR5OZdy79vjS1PzYIdipMXYRD52+zdzBFz72xphMD0EgbYsuu25IUwLTkshIsYu
	XMmhFF6OZYdlTqesnmi05vQT67rU=
X-Google-Smtp-Source: AGHT+IF1qWuAPM7OXxHa9PDtIx4xdAi/SPdwq1d4i906hC2y1gUwoZbqVs2/tV8+cHeYBRRGdC2ase7pF6ri9+FpJxc=
X-Received: by 2002:a2e:bd87:0:b0:2f9:e1ce:1276 with SMTP id
 38308e7fff4ca-2fedb414a6amr24137441fa.11.1730566006632; Sat, 02 Nov 2024
 09:46:46 -0700 (PDT)
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
 <CAMj1kXG8Nqw_f8OsFTq_UKRbca6w58g4uyRAZXCoCr=OwC2sWA@mail.gmail.com>
 <ZyYIO6RpjTFteaxH@gondor.apana.org.au> <20241102163605.GA28213@sol.localdomain>
In-Reply-To: <20241102163605.GA28213@sol.localdomain>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 2 Nov 2024 17:46:34 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEQHiqkO7j1W55UHGg-LNF2CNiPnpHcKfCdKnxFQSJ14g@mail.gmail.com>
Message-ID: <CAMj1kXEQHiqkO7j1W55UHGg-LNF2CNiPnpHcKfCdKnxFQSJ14g@mail.gmail.com>
Subject: Re: [PATCH v2 04/18] crypto: crc32 - don't unnecessarily register
 arch algorithms
To: Eric Biggers <ebiggers@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-crypto@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, 2 Nov 2024 at 17:36, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Sat, Nov 02, 2024 at 07:08:43PM +0800, Herbert Xu wrote:
> > On Sat, Nov 02, 2024 at 12:05:01PM +0100, Ard Biesheuvel wrote:
> > >
> > > The only issue resulting from *not* taking this patch is that btrfs
> > > may misidentify the CRC32 implementation as being 'slow' and take an
> > > alternative code path, which does not necessarily result in worse
> > > performance.
> >
> > If we were removing crc32* (or at least crc32*-arch) from the Crypto
> > API then these patches would be redundant.  But if we're keeping them
> > because btrfs uses them then we should definitely make crc32*-arch
> > do the right thing.  IOW they should not be registered if they're
> > the same as crc32*-generic.
> >
> > Thanks,
>
> I would like to eventually remove crc32 and crc32c from the crypto API, but it
> will take some time to get all the users converted.  If there are AF_ALG users
> it could even be impossible, though the usual culprit, iwd, doesn't appear to
> use any CRCs, so hopefully we are fine there.
>
> I will plan to keep this patch, but change it to use a crc32_optimizations()
> function instead which was Ard's first suggestion.
>
> I don't think Ard's static_call suggestion would work as-is, since considering
> the following:
>
>     static inline u32 __pure crc32_le(u32 crc, const u8 *p, size_t len)
>     {
>             if (IS_ENABLED(CONFIG_CRC32_ARCH))
>                     return static_call(crc32_le_arch)(crc, p, len);
>             return crc32_le_base(crc, p, len);
>     }
>
> ... the 'static_call(crc32_le_arch)(crc, p, len)' will be inlined into every
> user, which could be a loadable module which gets loaded after crc32-${arch}.ko.
> And AFAIK, static calls in that module won't be updated in that case.
>

Any call to static_call_update() will update all existing users, so
this should work as expected.

(Only x86 has a non-trivial implementation that patches callers inline
- otherwise, it is either an indirect call involving a global function
pointer variable, or a single trampoline that gets patched to point
somewhere else)

...
>
> So I plan to go with the crc32_optimizations() solution in v3.
>

That is also fine with me.

