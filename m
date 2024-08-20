Return-Path: <linuxppc-dev+bounces-197-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A95E6957B94
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 04:46:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wnv442Y4Kz2xX4;
	Tue, 20 Aug 2024 12:46:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=E2yfneeX;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wnv440VL6z2xTl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 12:46:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1724121987;
	bh=8TS0uracIC8varmqf+MaZ6AfHrQ8Ib61Fw/7CChwcgA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=E2yfneeXxrvfHg8GYHkTYxBdI76bEnuGlExoEN4PVHAvgR6CMMkbvD7QCW8Po51Ab
	 W2y5WB7Hqk1J6y93pfiVYUUB16NzeGSbyX0B2lNaDJftTWeX1H0uBgqoJCQpuivsQ2
	 1EMGYI3kVXsYz2ZoFL0SxPdjAzSrSrUgwT6B/zsBbVOQspL0vsMdZieYZhX9xkssfI
	 tzlZ0aFoDfJMfxtLp0ef9W1B6iWrZHv/6N7PxpLzbqSERKQ0swCeAwcdszFVWSXSOi
	 HNSvpapaGOjuGLer4braR93wtId1Y0g4ZRs4E9E/aX9q63XS2iNDYLk2xyzPCdq4lt
	 BbAGROjV/nmwQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wnv410TKjz4w2F;
	Tue, 20 Aug 2024 12:46:24 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Matthew Maurer <mmaurer@google.com>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org,
 gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st,
 j@jannau.net, asahi@lists.linux.dev, Nicholas Piggin <npiggin@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas
 Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>,
 linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Subject: Re: [PATCH v3 14/16] modules: Support extended MODVERSIONS info
In-Reply-To: <CAGSQo02r3NhWnpBF--5nB2RJ=1Hh97VshtiZmasDfknnL+UjmA@mail.gmail.com>
References: <20240806212106.617164-1-mmaurer@google.com>
 <20240806212106.617164-15-mmaurer@google.com> <87le0w2hop.fsf@mail.lhotse>
 <CAGSQo02r3NhWnpBF--5nB2RJ=1Hh97VshtiZmasDfknnL+UjmA@mail.gmail.com>
Date: Tue, 20 Aug 2024 12:46:24 +1000
Message-ID: <878qwrud1b.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Matthew Maurer <mmaurer@google.com> writes:
> On Fri, Aug 16, 2024 at 4:04=E2=80=AFPM Michael Ellerman <mpe@ellerman.id=
.au> wrote:
>> Matthew Maurer <mmaurer@google.com> writes:
>> > Adds a new format for MODVERSIONS which stores each field in a separate
>> > ELF section. This initially adds support for variable length names, but
>> > could later be used to add additional fields to MODVERSIONS in a
>> > backwards compatible way if needed. Any new fields will be ignored by
>> > old user tooling, unlike the current format where user tooling cannot
>> > tolerate adjustments to the format (for example making the name field
>> > longer).
>> >
>> > Since PPC munges its version records to strip leading dots, we reprodu=
ce
>> > the munging for the new format.
>>
>> AFAICS the existing code only strips a single leading dot, not all
>> leading dots?
>
> You appear to be correct, I'll update that in the next version, but
> want to wait for more feedback on the rest of the patchset before
> sending up another full series.

Yep, no worries.

cheers

