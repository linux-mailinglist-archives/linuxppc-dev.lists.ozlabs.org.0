Return-Path: <linuxppc-dev+bounces-16711-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id G8XDL4rFiGm4vwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16711-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sun, 08 Feb 2026 18:19:06 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8301098A2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 08 Feb 2026 18:19:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8F0t07h5z2yrn;
	Mon, 09 Feb 2026 04:18:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=136.143.188.112 arc.chain=zohomail.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770571133;
	cv=pass; b=jnl1z7GQVy6BCF2KgwbLrbsRDoSgkVw3rTBDpK6PxSw6srIvKtDhcrpdgdPuDuEm4eTkW9zHt13w+xsFj6c2yPh1d7dlsIvjxXzvNNqqiXDD7EbNQW8RqejGtDzK70Wt4Nk2HxTsHYWJ6BFUI0NhFvawARVeczniR/jux0fEJfdMxleeyu2enLQ5Q0MCurxDVmwH0bD9oAUUpEObjU+mday8D088sNDYM63xbN41HRZdWCNYVOUNhPh4SBweBZxhwRVcgqR3lelk5ab8tR+OZf6ZuW5YGvREmnysZiSbq4Np7SmF/2U/0uEdXeB2GU0dLxt3SkQK8knJzdhcv+dJBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770571133; c=relaxed/relaxed;
	bh=sicy4xMoxAuHL8RXwWOhV8FvUn+Eu6nJRWh8VCO7q58=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=DRcesPJ69YUYkOoAAasX+QLq6NYQ1j1saa5GK3bXPK0S6EFoZyYbo8vBSsSMg/A3jgjJ4RdFUGNZ+ASKy6CXM7Y4QkCpx5ChBor0ZFIm7uDEMBu+5dMjqOytYY0xINQdG80gl/OTODzR6JJqntnV3OVOmsQHRQf/8WT6zvYXSwwcS0riBUPwTlzkOf1OhffQMHkLIhMpE8VOxixdlsHXczW6nhv4Io77/FmtmEAGmfhOgjBco/0n2u4coKYdVdRZlQStfy/852pNrEoTpNylVZFoA1kX9gIm0TvdNAwDOIdbRGlBJYxguwAIDKPy0AH6rH8ClwXK19q0ervpsQHSNA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=collabora.com; dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=AzepAojX; dkim-atps=neutral; spf=pass (client-ip=136.143.188.112; helo=sender4-pp-f112.zoho.com; envelope-from=daniel.almeida@collabora.com; receiver=lists.ozlabs.org) smtp.mailfrom=collabora.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=AzepAojX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=collabora.com (client-ip=136.143.188.112; helo=sender4-pp-f112.zoho.com; envelope-from=daniel.almeida@collabora.com; receiver=lists.ozlabs.org)
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f8F0q48kTz2xHX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Feb 2026 04:18:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1770571078; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TjW8QXxKiPuz34T4Ff27H6By7JKuN3j/GdKLMnQezk4UHqxkfRTvmheqHPcxxMMxWd2sSOVSp/gaUKypM6juofHvfP2N52a3nvV40/0fcC7M6XjJF9PZ3W2Jk4qOzIRFvSq3AIC4soJ1mhhF5eLoJJ0ytPaRRo2lVHMGSaSDF0I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770571078; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sicy4xMoxAuHL8RXwWOhV8FvUn+Eu6nJRWh8VCO7q58=; 
	b=ficZVusMXoRPFZBEOD/QeVgmgsmDJENvcChOAgxy+b2oXA+mzyJCHSLbTb2qzA+ZfNMQSbodFhaON9hdQNwQ1a6nAPzo9rO9fzznCRwa4PqAt/V6OjunUJAQNMt88M0mMos+/ndiSSGo7JKZXTrWlOFLAFkcsPWUBWez4HyfdIg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770571078;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=sicy4xMoxAuHL8RXwWOhV8FvUn+Eu6nJRWh8VCO7q58=;
	b=AzepAojXyowkYf1LNyu3FRouaQaoqAP+TfpP/0B2kiHSrU5MRZpAZUngB6KLGCAN
	7tqQz3p4o4DIAW4qWYOfDPQ0PDXf6voDiK6Pms7jAz6Ezsj/ufn3vwr6d+NzfyMcXNv
	8Rp6CxcYG8lu1rsH9OSeTYMzQYYqYLWEFhLrLvik=
Received: by mx.zohomail.com with SMTPS id 1770571074486302.15984943030605;
	Sun, 8 Feb 2026 09:17:54 -0800 (PST)
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
In-Reply-To: <DG7E46M9VINC.3KTNQ1T7USPVO@kernel.org>
Date: Sun, 8 Feb 2026 14:17:36 -0300
Cc: Gary Guo <gary@garyguo.net>,
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
Message-Id: <45A7698F-6AE9-46DA-8CB2-9E09F7223229@collabora.com>
References: <20260204040505.8447-1-linkmauve@linkmauve.fr>
 <20260204040505.8447-2-linkmauve@linkmauve.fr>
 <DG6A0WRA0JZC.SPDT9WEXF92K@kernel.org>
 <EC479D9E-ADBF-461C-BEA6-06EA2D4FD8A6@collabora.com>
 <DG74LUHX3NPX.3BLARQEIFG1DD@garyguo.net>
 <D6227AA2-A727-4F29-B7CD-BE0AAB0A13F1@collabora.com>
 <DG79GRI3NOLS.3ASMS9RJ80IXM@kernel.org>
 <DG7DUN9M4YIU.KNRN6FM1K687@garyguo.net>
 <DG7E46M9VINC.3KTNQ1T7USPVO@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16711-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gary@garyguo.net,m:linkmauve@linkmauve.fr,m:rust-for-linux@vger.kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:srini@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:ardb@kernel.org,m:martin.petersen@oracle.com,m:ebiggers@google.com,m:gregkh@linuxfoundation.org,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:viresh.kumar@linaro.org,m:lorenzo.stoakes@oracle.com,m:tamird@kernel.org,m:fujita.tomonori@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:officialTechflashYT@gmail.com,m:ash@heyquark.com,m:rw-r-r-0644@protonmail.com,m:j.neuschaefer@gmx.net,m:dakr@kernel.org,m:lina@asahilina.net,m:fujitatomonori@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[daniel.almeida@collabora.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[32];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[garyguo.net,linkmauve.fr,vger.kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,protonmail.com,google.com,umich.edu,oracle.com,linuxfoundation.org,redhat.com,asahilina.net,linaro.org,lists.ozlabs.org,heyquark.com,gmx.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.almeida@collabora.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linuxppc-dev,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	APPLE_MAILER_COMMON(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,collabora.com:mid,collabora.com:dkim]
X-Rspamd-Queue-Id: 7B8301098A2
X-Rspamd-Action: no action



> On 5 Feb 2026, at 19:43, Danilo Krummrich <dakr@kernel.org> wrote:
>=20
> On Thu Feb 5, 2026 at 11:31 PM CET, Gary Guo wrote:
>> On Thu Feb 5, 2026 at 7:05 PM GMT, Danilo Krummrich wrote:
>>>  (1) Devices are either little-endian or big-endian. Hence, having =
to write
>>>=20
>>> io.big_endian().write()
>>>=20
>>>      is excessive, we always want big-endian for a big-endian =
device.
>>=20
>> You don't need to always write this. You just need to do =
`big_endian()` once
>> when you obtain the io, and then keep using `BigEndian<Mmio>` instead =
of just
>> `Mmio`, and the rest of code is still `.write()`.
>=20
> <snip>
>=20
>>>  (2) It is error prone, if you forget to call big_endian() first, it =
is a bug.
>>=20
>> Moot point when `big_endian()` is only done once.
>=20
> Well, you need to do it at least once per driver entry point. For DRM =
IOCTLs for
> instance you also have to consider that it is always Devres<Mmio>.
>=20

Well, this is also the case for relaxed(). I basically made peace with =
the fact that

let mmio =3D mmio.relaxed();
< use mmio >

is going to be a reality per driver entrypoint, unless I misunderstood?

=E2=80=94 Daniel=

