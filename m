Return-Path: <linuxppc-dev+bounces-2697-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2676E9B5B3A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2024 06:35:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XdbSG68S5z2xdZ;
	Wed, 30 Oct 2024 16:35:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730266526;
	cv=none; b=MQnHe6L6i3D83MLWjk86k1XiKZ51fTNBThGbTqluZdeIHq+vOj2ENRovLKGvtLZG8EhMMR8HWH+Wwd5J5/yV5IBYFD3Gtlw0ZNYMdNapCgYfNynsm7O0/g5IMOx0zWzUOKRvzc8LkYdo6WVceN96SCu7Pvikf6j89trxcRg0ea+aQ7ujHx8fppaL5sNZoc6sfeRDSf46VQKlytMLJAqOkmVBfayPIZdWio0gzv8maeJuJIZUV04jaRgSd5pS7eyZussMLp1QepfmydxuoMqBn6cbqxvKhtixBiMbvnZu8WurPE5GsTQYLalxkgNpIzjHQsaC6jQ8eqYEGFCYUA3OZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730266526; c=relaxed/relaxed;
	bh=fTiOGMiECd5augAVpcP0FAu96xmTgJEVxQ1j0YsCjtE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=E0mWKiNWDdY6+TEVgSReoGSsEMTjuwSSESN05h/KmOmxIVOBoLiOGxJEEU0I5njoqCIh4x4hWBdHEkreGLr2v3S4EPttdT0SA5V3Mm7CCDxindz/HObMDHj/5ev6SHTtSxWQNyRht97BQC71GCq+rRNY+nF94oG8+10IJT+fqMnz/wrLVlkPO2aBdZrVrAFONM0nNwKuuBXybd2waICVMAmrC+RCTpxGZAC1PSug7pDw1JhbCj6TBVVLPuoWkc8cYuzm3BL98hb6gx9Bw/SwuQowEKuGEpET4DLr8ciEUl4whLvN/OZ+HJVjR/P6eYVNiMxTyJgJJQxzVX2R/lUoxw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iBvnjoKY; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iBvnjoKY;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XdbSD4J0Wz2xb3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2024 16:35:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730266522;
	bh=fTiOGMiECd5augAVpcP0FAu96xmTgJEVxQ1j0YsCjtE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iBvnjoKYWd263kXfDZH/Sh3Gw+wTz+mRV6lTEiTnUbqNaziGATw0mFF/3EToCY/PD
	 udF0Al/to8Vm7A/g41rEuux1jQmB83t1Kr6C9ZcQq4Xq/UaQGqAjDuqJV9oYMQ82jV
	 DVKSCXTurLYVR3+ooGcH3Sq/8S1VGrbDhpePRLxQaDxfhTLlnj2C0cZONLKusDrrK8
	 Up/XjvkE6J4cyUVYfviZrBdnHI4CfI/7Nodpb4xfjVNDjDyDZi2/hCfSA9SdvnllD2
	 wZb6ggjadgnszxDjHOe9PnHOTusOlD1OemAGIwvANBqjeV8PiDciNgQEVMkU1dnQnL
	 n0M/8hQTWodXw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XdbS75X7wz4x8f;
	Wed, 30 Oct 2024 16:35:19 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Matthew Maurer <mmaurer@google.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>,
 Daniel Gomez <da.gomez@samsung.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas
 Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v7 1/3] modules: Support extended MODVERSIONS info
In-Reply-To: <CAGSQo03L--HDUBeo3xEUANbBcSf4GK5GUNGmHSBzL+ixpRGuqA@mail.gmail.com>
References: <20241023-extended-modversions-v7-0-339787b43373@google.com>
 <20241023-extended-modversions-v7-1-339787b43373@google.com>
 <874j50juyp.fsf@mail.lhotse>
 <CAGSQo03L--HDUBeo3xEUANbBcSf4GK5GUNGmHSBzL+ixpRGuqA@mail.gmail.com>
Date: Wed, 30 Oct 2024 16:35:10 +1100
Message-ID: <878qu6dugh.fsf@mpe.ellerman.id.au>
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
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Matthew Maurer <mmaurer@google.com> writes:
>> Sorry I realise it's version 7, but although the above looks correct it's
>> kind of dense.
>>
>> I think the below would also work and is (I think) easier to follow, and
>> is more obviously similar to the existing code. I'm sure your version is
>> faster, but I don't think it's that performance critical.
>>
>> static void dedotify_ext_version_names(char *str_seq, unsigned long size)
>> {
>>         char *end = str_seq + size;
>>         char *p = str_seq;
>>
>>         while (p < end) {
>>                 if (*p == '.')
>>                         memmove(p, p + 1, end - p - 1);
>>
>>                 p += strlen(p) + 1;
>>         }
>> }
>>
>> The tail of str_seq will be filled with nulls as long as the last string
>> was null terminated.
>
> As you alluded to, what you're providing is potentially O(n^2) in the
> number of symbols a module depends on - the existing code is O(n).
> If leading dots on names are rare, this is probably fine. If they're
> common, this will potentially make loading modules with a large number
> of imported symbols actually take a measurable amount of additional
> time.

It should only be a single symbol these days, .TOC., for both big and
little endian builds.

But maybe someone out there is still building their kernel ELFv1, in
which case every function will begin with '.'.

I still don't think it will be measurable, but n^2 is asking for
trouble.

So forget it, just use your version, you've already written it anyway.
Sorry for the noise.

cheers

