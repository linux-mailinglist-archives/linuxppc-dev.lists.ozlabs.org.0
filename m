Return-Path: <linuxppc-dev+bounces-16640-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sI4NLDcdhWla8gMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16640-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 23:44:07 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D1DF82CF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 23:44:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6XMM1mZkz2yFb;
	Fri, 06 Feb 2026 09:43:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770331439;
	cv=none; b=CmMlyOrq9AHUJrsO5XGVUWAtUmftZVD1clT+5Y5Ssg4Bdd0Usqb3MruJi76wo1JmCjNW1J8Bra0Gx29NMJQA9Cic3JtR5DViFGQB516OOG9FMXoKkS9NnbROr7EZBcVRG/cCqhL0oPNPfvGvvkk32ugVWOnLCqIEBv4tWgU3Y2I80tapCrjIUwtV8NlZ7wAtTMckhWpEvA4UVok3Bk5HDFakPTAq+RqLMO2HvGdg5OW/MtZmFGg3su0vduQRlBct/wR5GkqSggvVmcaV5LWoeWLcnsThyycpJLCAmcmCD48zzJiQ8XNt43uCLmdDM7WehwHcfZI7ajjE/pjlgRVXUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770331439; c=relaxed/relaxed;
	bh=00ZItawsL1jMxe0aVbb5Eh5Za/GC3Kl87nKVXLZOXv0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=WNpU/VpKwWnpoB/PvwZe0gKNxtEOXAgb0awWOT7L8+6u4GxfeYLNcUF8QpBqeAUAIArZIXFIqFxru2ufFJCpv80i1PnsPTojwP+SvL5/q+F5d5zbG+o+wNfqVNJeI6B/KOVosjGo4qcOcJRTLQGdvpNg5YYv9HAke2VaZjQO1TszNi2v6sSWfZ/U5uaSjbF6ykZxTTtHDyphjo3dzzvxrIOpG2jirbrgg4M+czeDTUlatb/Q0z8iMAs7JojfI8XgLvATV4Oh4rd6mjG7aMYr4SmI+PQmGTGTMxjTQb5Z+e/uZLCyRL7Y9p9t56l0/VAQ0lsng2EEScNxBN1Nb07nbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Cq4mDnAK; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=dakr@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Cq4mDnAK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=dakr@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6XML3cHwz2xqj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Feb 2026 09:43:58 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 16BCA600AD;
	Thu,  5 Feb 2026 22:43:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6563C4CEF7;
	Thu,  5 Feb 2026 22:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770331435;
	bh=BLZubPyxzY4kDURUlK2y8s17DmJ2s1rb3y59eXB/ze4=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Cq4mDnAKeu/gwoqwVhYxePHfG2GvzTbpMKt1srXw0uyYG+eviwnylSx+QdNqEmBx9
	 w7uKFgzxiB5d1vu9II/w6yi7+zx8DEnspzM7i0ySSYVdd2kM/y2IvRRV5FXvse43dH
	 HYDmUCYABz/Sbp2XEChzpMPNgEbDIbSxzp0yA4Q35iw7Zgnlq4M8szaInXVo85iqm0
	 J9SwfE3kadxaI4LHpssXYSAX2B4ACy9k82g2Z/tJVAPAZGkBIk0fjl19vm2uznHRzY
	 //uA36cI7MfNbkxBWu7pefjP5eTgymaNIC/KkpItKan1V26wo66Lh2WxHL5CLZeO1M
	 6+BF3NMP+qfqQ==
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
Date: Thu, 05 Feb 2026 23:43:48 +0100
Message-Id: <DG7E46M9VINC.3KTNQ1T7USPVO@kernel.org>
Subject: Re: [PATCH v2 1/4] rust: io: Add big-endian read and write
 functions
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Link Mauve"
 <linkmauve@linkmauve.fr>, <rust-for-linux@vger.kernel.org>, "Madhavan
 Srinivasan" <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, "Srinivas Kandagatla" <srini@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
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
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260204040505.8447-1-linkmauve@linkmauve.fr>
 <20260204040505.8447-2-linkmauve@linkmauve.fr>
 <DG6A0WRA0JZC.SPDT9WEXF92K@kernel.org>
 <EC479D9E-ADBF-461C-BEA6-06EA2D4FD8A6@collabora.com>
 <DG74LUHX3NPX.3BLARQEIFG1DD@garyguo.net>
 <D6227AA2-A727-4F29-B7CD-BE0AAB0A13F1@collabora.com>
 <DG79GRI3NOLS.3ASMS9RJ80IXM@kernel.org>
 <DG7DUN9M4YIU.KNRN6FM1K687@garyguo.net>
In-Reply-To: <DG7DUN9M4YIU.KNRN6FM1K687@garyguo.net>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16640-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:daniel.almeida@collabora.com,m:linkmauve@linkmauve.fr,m:rust-for-linux@vger.kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:srini@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:ardb@kernel.org,m:martin.petersen@oracle.com,m:ebiggers@google.com,m:gregkh@linuxfoundation.org,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:viresh.kumar@linaro.org,m:lorenzo.stoakes@oracle.com,m:tamird@kernel.org,m:fujita.tomonori@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:officialTechflashYT@gmail.com,m:ash@heyquark.com,m:rw-r-r-0644@protonmail.com,m:j.neuschaefer@gmx.net,m:gary@garyguo.net,m:lina@asahilina.net,m:fujitatomonori@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dakr@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[collabora.com,linkmauve.fr,vger.kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,protonmail.com,google.com,umich.edu,oracle.com,linuxfoundation.org,redhat.com,asahilina.net,linaro.org,lists.ozlabs.org,heyquark.com,gmx.net];
	RCPT_COUNT_TWELVE(0.00)[32];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
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
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: D1D1DF82CF
X-Rspamd-Action: no action

On Thu Feb 5, 2026 at 11:31 PM CET, Gary Guo wrote:
> On Thu Feb 5, 2026 at 7:05 PM GMT, Danilo Krummrich wrote:
>>   (1) Devices are either little-endian or big-endian. Hence, having to w=
rite
>>
>> 	io.big_endian().write()
>>
>>       is excessive, we always want big-endian for a big-endian device.
>
> You don't need to always write this. You just need to do `big_endian()` o=
nce
> when you obtain the io, and then keep using `BigEndian<Mmio>` instead of =
just
> `Mmio`, and the rest of code is still `.write()`.

<snip>

>>   (2) It is error prone, if you forget to call big_endian() first, it is=
 a bug.
>
> Moot point when `big_endian()` is only done once.

Well, you need to do it at least once per driver entry point. For DRM IOCTL=
s for
instance you also have to consider that it is always Devres<Mmio>.

