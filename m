Return-Path: <linuxppc-dev+bounces-16883-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UL/+N43/kmlY0wEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16883-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Feb 2026 12:29:17 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F83142FA4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Feb 2026 12:29:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fF0sj3C3Zz2yhZ;
	Mon, 16 Feb 2026 22:29:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::649"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771241353;
	cv=none; b=JK/+vHxAi+qnXi1wDKasNzBplR2+mUL0+veRrOuaQ1eV1okHTOQVKa0v/oRcLfv2Mqhw/ZVM8kqBIeb4s6OdgCQr7ilkldX4Mh/95W73plY/z/SPyT+/YXajDBNH6PQhO2sJHSOghDtHqu7QQl4f98nKRkxPIR/434Gk5yYJ51at+nJbIyWAxsEdLuCY30k1OCvjoBnHEznXZFafxIIKwZX38LXLbUoEw3hg4DHi8sw11BXQmMM2FVaB+8Ls1oBFBYWp5HaI8dCY9CYpMAQ6h6z4uAA5VSim/F0gFRjXMYiEDNQnuvPZawwLpD39cVm7XLwFyxk4uFwem8SIwLiYgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771241353; c=relaxed/relaxed;
	bh=Vo1OOIvCISDxl5O3fpiaDD0IWyIfX7wGxG8VPYZFpaE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XyJvFBRWGmOsiW+TBeDjWZYy9NxQ1kuuXQjAl3rHwl84ac+FcKkZF6NCopOScoDOTaHfdQu7mF/iNoIFk2JJvnue/xZaXmKCYd6uv1eR/piypuE9PYHIFMcEYWO+oks4QMqeCm2KzpTUV9q4ctC5+Mp8voGokxc+uFt7THiNVpV0Txu1ROP+t/F7iwoM4v7x+NvKc20/cwo4+B3ibuDzYrYRFe7j7XotIroK9En+AbK1ZdlrQ4zZ+SWaDK6N77fP3PBrH1AKnByPmAA7S+DTrEQjh2HDWYKlmTtKOiFQYmKLB8k+d18YVE4frqwNfxhBKArL+OSx/lYmlhxG5r8zAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=2y2Pmw/2; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::649; helo=mail-ej1-x649.google.com; envelope-from=3gv-saqkkdce7if9boveidlldib.9ljifkrumm9-absifpqp.lwi78p.lod@flex--aliceryhl.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=2y2Pmw/2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--aliceryhl.bounces.google.com (client-ip=2a00:1450:4864:20::649; helo=mail-ej1-x649.google.com; envelope-from=3gv-saqkkdce7if9boveidlldib.9ljifkrumm9-absifpqp.lwi78p.lod@flex--aliceryhl.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x649.google.com (mail-ej1-x649.google.com [IPv6:2a00:1450:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fF0sg22Qgz2xVT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Feb 2026 22:29:10 +1100 (AEDT)
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b8861544696so325504966b.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Feb 2026 03:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771241347; x=1771846147; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vo1OOIvCISDxl5O3fpiaDD0IWyIfX7wGxG8VPYZFpaE=;
        b=2y2Pmw/2iN5905trhzxy9Ngkhysnpo3G09Z3CuHgeXW++aNebgNsW6iff9O+tkNPpm
         YpIWln9V4I+gFEG25QtLLEtF66Rf9JvRXNzEi+21Gk3d/x0DLiEdtK1k6hOkqEMUPCxM
         qUX8vEWdMlskl5KF2IVkKv8CkrMoXyOarVPFPb7t39ic87dUx+h4FxuncElsiTI0TZyq
         rL5+EgaBtIqr7rp9xyCZE9/+rwnEZGLhCXi5EEusfkhcSpXhkODg25p4lrGEJOy7OkCb
         fESHQW5a1/SqhANatHF03l5cJgMIZOTakilCFi4sleI1ljoSc/DrzwKzhA0VGbWAf2uQ
         M0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771241347; x=1771846147;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Vo1OOIvCISDxl5O3fpiaDD0IWyIfX7wGxG8VPYZFpaE=;
        b=gGqAu6QDukFSJ9sZC94/C+qhfHT7XnOuNqBzF90vkDIpDBGos1uqLCcssgyBTIE+Nt
         gNTKtX75uD5PEu6u+0FmQKT3BHLwM53KONbFM66GjUln/jNuRWxTHi8VEI1RIesRO6dP
         ZTVeDOQ6nRDdx9VTlacxwQRPLEgjBpsE1CZE64JklSi3l4FwjnEPYLqLIIi+DXuP9nw4
         bvg7Ub+nzVOJIlUKsCxIVdHWEqW3jm7V6Hz1vB9l1peO7Y/EwGmCd4HhSgShdCyYc497
         ZDxTtr6J1iVXQCFfI/zpsmsf2ADSEsNdaaP3BOzkcfHQQUz+l043X78ZqDvQfUlUm+Ne
         QnWw==
X-Forwarded-Encrypted: i=1; AJvYcCUjVony1cccuZGw2vsJ1NzL0Wc+efDPufSIP3RHdaj2xZxoRNb4XbdLq0UNgB5MTFTzLRsWdpt0AR+lwY0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxAyofaZ8S78C2WLqc2ENXVMY/mKOq1yaAllUOFUWOvRIJfpQ70
	gUxQgItwZxy4kZl48oKZ5O9/T0tUHpgwZ+dXRCraUMTal4XI620a2LBupmh3sZsrnlGKZkLr2+N
	Ns4b1Lp0hkDPSg2AEFQ==
X-Received: from edqp10.prod.google.com ([2002:aa7:d30a:0:b0:659:474e:caf2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:869e:b0:b8e:9e11:6615 with SMTP id a640c23a62f3a-b8fb44d5e4fmr626744366b.47.1771241346405;
 Mon, 16 Feb 2026 03:29:06 -0800 (PST)
Date: Mon, 16 Feb 2026 11:29:05 +0000
In-Reply-To: <aZL-JO3950gc9YO_@probook>
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
References: <20260204210125.613350-1-mkchauras@gmail.com> <20260204210125.613350-4-mkchauras@gmail.com>
 <aYSgjPD5KRcNN0j4@luna> <1ed12a72-06e4-461b-907e-2581e25e3e38@linux.ibm.com>
 <aYS2oWCE0ZCC3don@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com> <aZL-JO3950gc9YO_@probook>
Message-ID: <aZL_gVBFVzMjQkYK@google.com>
Subject: Re: Rust version requirement (was: [PATCH V2 3/3] powerpc: Enable
 Rust for ppc64le)
From: Alice Ryhl <aliceryhl@google.com>
To: "=?utf-8?Q?J=2E_Neusch=C3=A4fer?=" <j.neuschaefer@gmx.net>
Cc: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Link Mauve <linkmauve@linkmauve.fr>, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:j.neuschaefer@gmx.net,m:mkchauras@gmail.com,m:venkat88@linux.ibm.com,m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[aliceryhl@google.com,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16883-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_TO(0.00)[gmx.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[gmail.com,linux.ibm.com,linkmauve.fr,kernel.org,garyguo.net,protonmail.com,umich.edu,lwn.net,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 35F83142FA4
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 12:23:16PM +0100, J. Neusch=C3=A4fer wrote:
> On Thu, Feb 05, 2026 at 09:12:01PM +0530, Mukesh Kumar Chaurasiya wrote:
> [...]
> > use rust version nightly-2026-01-28
> >=20
> > the latest one has some issue. I just raised a bug for the rustc
> > here[1].
> >=20
> > [1] https://github.com/rust-lang/rust/issues/152177
>=20
> Another reason to use a nightly version is that Rust inline assembly for
> PowerPC will only be stabilized[1] in version 1.94, so current release
> versions fail like this (tested with 1.91.1):
>=20
>     error[E0658]: inline assembly is not stable yet on this architecture
>       --> ../rust/kernel/sync/barrier.rs:19:14
>        |
>     19 |     unsafe { core::arch::asm!("") };
>        |              ^^^^^^^^^^^^^^^^^^^^
>        |
>        =3D note: see issue #93335 <https://github.com/rust-lang/rust/issu=
es/93335> for more information
>        =3D help: add `#![feature(asm_experimental_arch)]` to the crate at=
tributes to enable
>        =3D note: this compiler was built on 2025-11-07; consider upgradin=
g it if it is out of date
>=20
> This is somewhat at odds with Documentation/process/changes.rst which
> only requires Rust 1.78. I wonder if the rust version requirement should
> generally be bumped, or if there should be arch-specific requirements
> somewhere in changes.rst or rust/arch-support.rst.
>=20
> Best regards,
> J. Neusch=C3=A4fer
>=20
> [1]: https://github.com/rust-lang/rust/pull/147996

The MSRV is planned to be bumped to 1.85.

If it's available as a nightly feature on 1.78, then you can just add
#![feature(asm_experimental_arch)] to lib.rs, which already enables
several other stabilized feature on older compilers.

Otherwise powerpc support can always be gated to require a larger
rustc version than other platforms.

Alice

