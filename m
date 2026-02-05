Return-Path: <linuxppc-dev+bounces-16620-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DeHFMOvhGk14QMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16620-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 15:57:07 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBE7F451E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 15:57:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6L0c1VZ6z30FD;
	Fri, 06 Feb 2026 01:57:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770303424;
	cv=none; b=ay08B+sYvmPi6ixV2gs4IXTzTBSW4Z4/5Nt/mmpVCzp9PJGcroSjZghp0lKJSU7sCZ2YD3nPttAhRraefHHmVA8279EmgM9a17ouT9auiFmTUx0R5VW5MS6QqHMGTF88P2T6a3kjQD5Fop4pGcxV2/5Y6pC9zRwuSK/BFIdpzQib2xS29tKi4cka22h3rucf51OPiFssm6R5Fpa/B/WPir9lUkwbcSM8xhgtCWoKm3QAvKPiFx0aqiOAs/dRSGXzyNniKPeCwwcXd9Ly+TXH7mBqKPMHoYannBiaZ/7R88JxcXoANrLeGknbl/ldG5UK5RTQSWL8rFd20ervJmZAgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770303424; c=relaxed/relaxed;
	bh=gMmsQzoS6PLGmI/k3RPElkgBbzOIjikIFD020ivXMLE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=O8LzYBmbSUsAKRdenVXh/agnYTbxgngXAK1cOI+z8xtZi+EdikARmQXAfbWlZyg1UvXrlMJokyiV1pgZvl/roCfpDndzK5V9fMjh2tHfnQMIouENT8nJRLvMZR7RjEywC+x2etzk7sAXPqNCp57Fel4r4G35DH8u2q8E1MK3MQbuUtwHaauVVa7IpjE1wCx8UWa5qIJHWnJOjxQ8SoLePRXj2nM79cLGf6ni6clFlm/9J2GcmD7ZXw6fihtkT9rnpQ86OhWTD7Dn4rJj/mx/GcPZ23wn21cKZzQjMyX+2gkv4QuCPdaVTuSSGRoZX8JHDDEfpGTecFa+TpKvgWTsTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E/58bSTR; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=dakr@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E/58bSTR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=dakr@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6L0b0kZ9z2xrk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Feb 2026 01:57:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 31A6F6001A;
	Thu,  5 Feb 2026 14:57:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8A20C4CEF7;
	Thu,  5 Feb 2026 14:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770303419;
	bh=gMmsQzoS6PLGmI/k3RPElkgBbzOIjikIFD020ivXMLE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=E/58bSTRIAF2nMzj3w1phnYwa5sjfbTDc484MGSp0cUDxYfH8kjLuLyzUw0ZnUE+j
	 D8A5WFmrQ4i1E7rGsOpwApJc24jcWQmblYfYRMR7odI8SR0fHDKIR73gq30BDZxuAI
	 5JFk5ex2pdJWaTFjurJUZVE6X09Sa+OV+bbIXxMvidYn5gAami7E9USVEt6gG8ctm+
	 YKnvpo/r7z5pP1GHhdHOJ0NkPvUsTsMHZbzHrK0VUYGf6BB/rvIQqZMrY6w/64+5On
	 UJ5UlV+gIX1dlsDipGrKlfzXu0iOjR2DdnMAURdGYp8vnpRHGTJ7MGd/9B7GPoKIrS
	 NYFkT20GbQvKQ==
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
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 15:56:51 +0100
Message-Id: <DG746O6SKUQ0.H2A7OAVXTFZB@kernel.org>
Subject: Re: [PATCH v2 1/4] rust: io: Add big-endian read and write
 functions
Cc: "Link Mauve" <linkmauve@linkmauve.fr>, <rust-for-linux@vger.kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>, "Michael Ellerman"
 <mpe@ellerman.id.au>, "Nicholas Piggin" <npiggin@gmail.com>, "Christophe
 Leroy (CS GROUP)" <chleroy@kernel.org>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Ard
 Biesheuvel" <ardb@kernel.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, "Eric Biggers" <ebiggers@google.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Lyude Paul"
 <lyude@redhat.com>, "Asahi Lina" <lina+kernel@asahilina.net>, "Viresh
 Kumar" <viresh.kumar@linaro.org>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <officialTechflashYT@gmail.com>, "Ash Logan" <ash@heyquark.com>, "Roberto
 Van Eeden" <rw-r-r-0644@protonmail.com>,
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260204040505.8447-1-linkmauve@linkmauve.fr>
 <20260204040505.8447-2-linkmauve@linkmauve.fr>
 <DG6A0WRA0JZC.SPDT9WEXF92K@kernel.org>
 <EC479D9E-ADBF-461C-BEA6-06EA2D4FD8A6@collabora.com>
In-Reply-To: <EC479D9E-ADBF-461C-BEA6-06EA2D4FD8A6@collabora.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16620-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[linkmauve.fr,vger.kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,oracle.com,linuxfoundation.org,redhat.com,asahilina.net,linaro.org,lists.ozlabs.org,heyquark.com,gmx.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linkmauve@linkmauve.fr,m:rust-for-linux@vger.kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:srini@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:ardb@kernel.org,m:martin.petersen@oracle.com,m:ebiggers@google.com,m:gregkh@linuxfoundation.org,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:viresh.kumar@linaro.org,m:lorenzo.stoakes@oracle.com,m:tamird@kernel.org,m:fujita.tomonori@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:officialTechflashYT@gmail.com,m:ash@heyquark.com,m:rw-r-r-0644@protonmail.com,m:j.neuschaefer@gmx.net,m:daniel.almeida@collabora.com,m:lina@asahilina.net,m:fujitatomonori@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[dakr@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev,kernel];
	RCPT_COUNT_TWELVE(0.00)[32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6DBE7F451E
X-Rspamd-Action: no action

On Thu Feb 5, 2026 at 3:28 PM CET, Daniel Almeida wrote:
>
>
>> On 4 Feb 2026, at 12:18, Danilo Krummrich <dakr@kernel.org> wrote:
>>=20
>> On Wed Feb 4, 2026 at 5:04 AM CET, Link Mauve wrote:
>>> Another option would be to call u32::swap_bytes() on the data being
>>> read/written, but these helpers make the Rust code as ergonomic as the =
C
>>> code.
>>>=20
>>> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
>>=20
>> The I/O stuff recently changed quite significantly, please have a look a=
t the
>> driver-core-next branch [1] in the driver-core tree.
>>=20
>> Also, instead of providing additional *be() methods, we should just crea=
te a new
>> type io::Endianness and use it to indicate the device endianness when re=
questing
>> the I/O resource.
>>=20
>> For instance, for your driver we could have
>>=20
>> request.iomap_exclusive_sized::<8>(Endianness::Big)?
>
> Can we please structure this in a way that LittleEndian is the default?
> Perhaps using a const generic that is defaulted, or something along these=
 lines.

Yes, little-endian should absolutely be the default. Please don't take the =
above
as specific suggestion. :)

>>=20
>> and then let the I/O backend choose the correct accessors based on this.
>>=20
>> I.e. the device is either big or little endian, hence we don't need to p=
rovide
>> both accessors at the same time.
>>=20
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-c=
ore.git/log/?h=3Ddriver-core-next
>>=20


