Return-Path: <linuxppc-dev+bounces-16629-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OP0MO63chGkV6AMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16629-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 19:08:45 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54832F6548
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 19:08:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6QFk00Ksz2yFb;
	Fri, 06 Feb 2026 05:08:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=136.143.188.103 arc.chain=zohomail.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770302659;
	cv=pass; b=WG0nrNHXbFjdg5MoTNrqM6psZeTRUTlMu3WppZYqvsFRt+sRKkJC28xePpN/G8nDiXewIWVrM6YxqB4OQHFQ/LUqnlhIskEniRjq7dta/qPbdZu5Utc3qHlWio2FewG80Mk0gHJyRKgI6bNbLajBo/buINdEoX3E8CqAHDOqO2Xlg4IM2aV2WsN32J7HF15JoY45YrJ+tCFpjVzVB6qls2ZjKBdG6u1vnoxe8rJZ00A/WsfnwMmKQFxrj3+VXkLeccUaakjmUDrp8G/qzacPNmik1W2EFRvt6Zo9elBkJr2IgRA94DUrbbo4y0ElyC289Ebz50I3cNx7G70T5W/KMw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770302659; c=relaxed/relaxed;
	bh=Qc1uiAFxrbLUJY1lZJ2hPTXPxu1uxTuoB4PMQ6ccxF4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=LUHihtwylz0CECSnjPyfUT3oSTUwuooB+n0Kz9kcUb/acn/a92emRo96gN6tm4rqvaQfJfZ8LRa46xFS0Amh2j7mGUJhYnFcImUNvP+GAHjggSfz+/p+Hd1SdXMrYlkeGTwfocB265AbaLxiqErFeoSY8g5aEmsGrQz0hdYseLekKW4zxwVQ/wJ2rlrEYBxvsDQJrOTiCV4Ngyu/LbO0Cue9Aoc+WS1vJB3pOUk9HIKVpudHK7FMeJyCwtf0T07WV50SLto2e5OXSXehs3iIAlQtwpvI+lb+qt0ID1fr0Sarg/oS1sGUJNgBAjxzM18WoUgScdnWjmv3PVhoTVBgHQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=collabora.com; dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Nd7mF5t7; dkim-atps=neutral; spf=pass (client-ip=136.143.188.103; helo=sender4-pp-e103.zoho.com; envelope-from=daniel.almeida@collabora.com; receiver=lists.ozlabs.org) smtp.mailfrom=collabora.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Nd7mF5t7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=collabora.com (client-ip=136.143.188.103; helo=sender4-pp-e103.zoho.com; envelope-from=daniel.almeida@collabora.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 909 seconds by postgrey-1.37 at boromir; Fri, 06 Feb 2026 01:44:17 AEDT
Received: from sender4-pp-e103.zoho.com (sender4-pp-e103.zoho.com [136.143.188.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6Kjs2gDhz2xrk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Feb 2026 01:44:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1770301713; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QSHFHjAa99OTsHyo5WeoPv5AV9EjQ0E9CCqkc/P1ek8zbHF5ygGvwJsFdiHrgoqhy2ugUygi/WQgy4RwlfB+hfiKtivaqNSl/OQ3WwEEEGA1lzyUikm+2T9E25w7B08IgE5gF8u5o1sYJumHLR699+/8Fazs0E3KTlkOzs90yHw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770301713; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Qc1uiAFxrbLUJY1lZJ2hPTXPxu1uxTuoB4PMQ6ccxF4=; 
	b=l6oEINuDc/5/QcYD7ikomuZP+zz6goGoswPCOJfahIgja7xnNIFEq4XQIs2zljH5faIZoq9qRCu57RkO69KPLkB2xIyyUC2st/zHMv9rcdghcDo6vT/0YZJtNuVUZXO1fmhlnXany0Gi6ZRv1Mc4Asdpke/3Mnu+/qFLfbe2VFo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770301713;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=Qc1uiAFxrbLUJY1lZJ2hPTXPxu1uxTuoB4PMQ6ccxF4=;
	b=Nd7mF5t7UX1hhdRejJ5dTJ8sBkXzpqebV9DrOCx4zQtMOdHVWEpIsk/77WhSq4gz
	6oSg6CWjheB2LaN1fTXIpTEKtjxYScZ+PHimltaStwkZcQHucBZRbnOVv0owIsRavB4
	GuqXAOZ1UuNjygzxQSH7pMYGYhq/1lFrAyCFw0B8=
Received: by mx.zohomail.com with SMTPS id 1770301712607806.8941192551862;
	Thu, 5 Feb 2026 06:28:32 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
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
In-Reply-To: <DG6A0WRA0JZC.SPDT9WEXF92K@kernel.org>
Date: Thu, 5 Feb 2026 11:28:12 -0300
Cc: Link Mauve <linkmauve@linkmauve.fr>,
 rust-for-linux@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
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
Message-Id: <EC479D9E-ADBF-461C-BEA6-06EA2D4FD8A6@collabora.com>
References: <20260204040505.8447-1-linkmauve@linkmauve.fr>
 <20260204040505.8447-2-linkmauve@linkmauve.fr>
 <DG6A0WRA0JZC.SPDT9WEXF92K@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16629-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[daniel.almeida@collabora.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[32];
	FORGED_RECIPIENTS(0.00)[m:linkmauve@linkmauve.fr,m:rust-for-linux@vger.kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:srini@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:ardb@kernel.org,m:martin.petersen@oracle.com,m:ebiggers@google.com,m:gregkh@linuxfoundation.org,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:viresh.kumar@linaro.org,m:lorenzo.stoakes@oracle.com,m:tamird@kernel.org,m:fujita.tomonori@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:officialTechflashYT@gmail.com,m:ash@heyquark.com,m:rw-r-r-0644@protonmail.com,m:j.neuschaefer@gmx.net,m:dakr@kernel.org,m:lina@asahilina.net,m:fujitatomonori@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linkmauve.fr,vger.kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,oracle.com,linuxfoundation.org,redhat.com,asahilina.net,linaro.org,lists.ozlabs.org,heyquark.com,gmx.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linkmauve.fr:email]
X-Rspamd-Queue-Id: 54832F6548
X-Rspamd-Action: no action



> On 4 Feb 2026, at 12:18, Danilo Krummrich <dakr@kernel.org> wrote:
>=20
> On Wed Feb 4, 2026 at 5:04 AM CET, Link Mauve wrote:
>> Another option would be to call u32::swap_bytes() on the data being
>> read/written, but these helpers make the Rust code as ergonomic as =
the C
>> code.
>>=20
>> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
>=20
> The I/O stuff recently changed quite significantly, please have a look =
at the
> driver-core-next branch [1] in the driver-core tree.
>=20
> Also, instead of providing additional *be() methods, we should just =
create a new
> type io::Endianness and use it to indicate the device endianness when =
requesting
> the I/O resource.
>=20
> For instance, for your driver we could have
>=20
> request.iomap_exclusive_sized::<8>(Endianness::Big)?

Can we please structure this in a way that LittleEndian is the default?
Perhaps using a const generic that is defaulted, or something along =
these lines.

>=20
> and then let the I/O backend choose the correct accessors based on =
this.
>=20
> I.e. the device is either big or little endian, hence we don't need to =
provide
> both accessors at the same time.
>=20
> [1] =
https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.gi=
t/log/?h=3Ddriver-core-next
>=20


