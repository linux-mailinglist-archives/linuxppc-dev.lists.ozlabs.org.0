Return-Path: <linuxppc-dev+bounces-16630-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAGyJqndhGkV6AMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16630-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 19:12:57 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD29DF663A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 19:12:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6QLZ0D4hz2yFb;
	Fri, 06 Feb 2026 05:12:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=136.143.188.112 arc.chain=zohomail.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770312561;
	cv=pass; b=j99oKcnX6P8L5wNwYAlGhZT8naWJMCsPBptY2zWmhFj6u4VbL2iFwCv69ndj2Ve814B/BxCURBz5x+bRAF/9iPAzc/ufuI/I8walUKSRe9ABXJfZyJqaXjAGM/nBkdlk5rqNkIeKMp5LwVtB0c6eTlZreK2NBX0Eq/gkUArdt9AEDh9xAbI85hlS/2soWZoAPptJHBcpnjqJbR14IXExqCjynmpHvxoF//AQgP86cuUujYktxNEqXKtHjnh62KFfmvla8p8k8GlZIegFPkhXCTVNjpPpjPXavQDYN4u15lVPbxFR9B4wRIfD4zCpmQu2HtaTscyRo+BZ/vorLx0XNw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770312561; c=relaxed/relaxed;
	bh=M3obdoKTXeSYmymRy2ZWHekuDCWgCx8je6+4eO2cz9k=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=oLgtTYOiSGFcXVAAZ5wHnr+cl8SbbaKazDNNI8u4OKqh6kcquQ2RHhfYEy1H1T4hN0t6m41CXje6ovgFpNPFGQI8pgwjfHHXgUkTaMYZ5PDxxS69HWHmP5O25nUCYrNmB6ZeTbmoc+d3JW/IsTEg3W1Plvv3wXGeN8xF9aBrB1Qn8JvRGaNBEW7R+Vc8UY9xJh1uZuOXVJtLPwSNJ+9QbW7gOm+CmhBvrQg7Bzi22c7P3gEehm6BMEv/8JFLWGdyqLaiSHtd6+PvvlVQj+rfWIkTltsEewyK9W8REj61yYxn4yU1Ddb/9xpLFaw0Pb/SMR3RLd4erQ7vJXrJ+OPjPw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=collabora.com; dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Yc9/zHHe; dkim-atps=neutral; spf=pass (client-ip=136.143.188.112; helo=sender4-pp-f112.zoho.com; envelope-from=daniel.almeida@collabora.com; receiver=lists.ozlabs.org) smtp.mailfrom=collabora.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Yc9/zHHe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=collabora.com (client-ip=136.143.188.112; helo=sender4-pp-f112.zoho.com; envelope-from=daniel.almeida@collabora.com; receiver=lists.ozlabs.org)
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6PNH39p7z2xQC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Feb 2026 04:29:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1770312503; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KY6VO4SW0l1XxLDMZAUouQ9cD/iD79peHutQ0KQl5cAI58ncNvJiwtti9CY+/LYTVq8LVGaLx336qvFBW1nK0uYYN2FuP/dNcWPaFKQ6jtUH8q6nkX08vhqiZNfvamEqVNCEL490lsca1gNnCM+e8ABuf1gRRhdJeaEVBl/m0ds=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770312503; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=M3obdoKTXeSYmymRy2ZWHekuDCWgCx8je6+4eO2cz9k=; 
	b=AI9TcGWkwp+RSBSUD9nITIIqJfIVXzeaXrynOiGtGCeC7xga1Mx2FZqa545SafwUkohb0usPV2V+uykcUAtSnpNwHPaADnqfWKH5kkc58PPZkwlRvwUMF96l42SKABb/Ab8vR9WJ01ZMPFDwFKGvWfLr0+koo4PQJpOuC2fqL2E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770312503;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=M3obdoKTXeSYmymRy2ZWHekuDCWgCx8je6+4eO2cz9k=;
	b=Yc9/zHHe5skqGxSIwFV74mpj8b7Z8wpKWECEoqUHgcOO/reDAn1SN404GZ5Hqgyx
	WCLGah93CW5lnhrUrCd7P5HLtEWOa6Aq6dSg99urt9jhv8/vJFTRFq6KzJpIG68pkpU
	uWM6vu+6u0jcTtdMq20BY875GeV0LtkJT1Jsjj1M=
Received: by mx.zohomail.com with SMTPS id 1770312501926532.5023520135724;
	Thu, 5 Feb 2026 09:28:21 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2 1/4] rust: io: Add big-endian read and write functions
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <DG74LUHX3NPX.3BLARQEIFG1DD@garyguo.net>
Date: Thu, 5 Feb 2026 14:28:01 -0300
Cc: Danilo Krummrich <dakr@kernel.org>,
 Link Mauve <linkmauve@linkmauve.fr>,
 rust-for-linux@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Ard Biesheuvel <ardb@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Eric Biggers <ebiggers@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lyude Paul <lyude@redhat.com>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Tamir Duberstein <tamird@kernel.org>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,
 officialTechflashYT@gmail.com,
 Ash Logan <ash@heyquark.com>,
 Roberto Van Eeden <rw-r-r-0644@protonmail.com>,
 =?utf-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D6227AA2-A727-4F29-B7CD-BE0AAB0A13F1@collabora.com>
References: <20260204040505.8447-1-linkmauve@linkmauve.fr>
 <20260204040505.8447-2-linkmauve@linkmauve.fr>
 <DG6A0WRA0JZC.SPDT9WEXF92K@kernel.org>
 <EC479D9E-ADBF-461C-BEA6-06EA2D4FD8A6@collabora.com>
 <DG74LUHX3NPX.3BLARQEIFG1DD@garyguo.net>
To: Gary Guo <gary@garyguo.net>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16630-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_CC(0.00)[kernel.org,linkmauve.fr,vger.kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,protonmail.com,google.com,umich.edu,oracle.com,linuxfoundation.org,redhat.com,asahilina.net,linaro.org,lists.ozlabs.org,heyquark.com,gmx.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:linkmauve@linkmauve.fr,m:rust-for-linux@vger.kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:srini@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:ardb@kernel.org,m:martin.petersen@oracle.com,m:ebiggers@google.com,m:gregkh@linuxfoundation.org,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:viresh.kumar@linaro.org,m:lorenzo.stoakes@oracle.com,m:tamird@kernel.org,m:fujita.tomonori@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:officialTechflashYT@gmail.com,m:ash@heyquark.com,m:rw-r-r-0644@protonmail.com,m:j.neuschaefer@gmx.net,m:gary@garyguo.net,m:lina@asahilina.net,m:fujitatomonori@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[daniel.almeida@collabora.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.almeida@collabora.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	APPLE_MAILER_COMMON(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: AD29DF663A
X-Rspamd-Action: no action



> On 5 Feb 2026, at 12:16, Gary Guo <gary@garyguo.net> wrote:
>=20
> On Thu Feb 5, 2026 at 2:28 PM GMT, Daniel Almeida wrote:
>>=20
>>=20
>>> On 4 Feb 2026, at 12:18, Danilo Krummrich <dakr@kernel.org> wrote:
>>>=20
>>> On Wed Feb 4, 2026 at 5:04 AM CET, Link Mauve wrote:
>>>> Another option would be to call u32::swap_bytes() on the data being
>>>> read/written, but these helpers make the Rust code as ergonomic as =
the C
>>>> code.
>>>>=20
>>>> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
>>>=20
>>> The I/O stuff recently changed quite significantly, please have a =
look at the
>>> driver-core-next branch [1] in the driver-core tree.
>>>=20
>>> Also, instead of providing additional *be() methods, we should just =
create a new
>>> type io::Endianness and use it to indicate the device endianness =
when requesting
>>> the I/O resource.
>>>=20
>>> For instance, for your driver we could have
>>>=20
>>> request.iomap_exclusive_sized::<8>(Endianness::Big)?
>>=20
>> Can we please structure this in a way that LittleEndian is the =
default?
>> Perhaps using a const generic that is defaulted, or something along =
these lines.
>=20
> I think we should have everything default to little endian, and have =
wrapper
> types that do big endian which require expicit construction, similar =
to
> RelaxedMmio in Alex's series.
>=20
> Best,
> Gary
>=20

Ah yes, the RelaxedMmio pattern is definitely a good one. I agree that =
we should head in this direction.

=E2=80=94 Daniel


