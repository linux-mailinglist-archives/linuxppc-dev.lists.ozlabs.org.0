Return-Path: <linuxppc-dev+bounces-17492-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qL0mBWU8pWne6QUAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17492-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 08:29:41 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 507601D3E94
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 08:29:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPVtm4zbxz3bW7;
	Mon, 02 Mar 2026 18:29:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::349"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772436576;
	cv=none; b=moq6v/xaGL0X7hfSSZbV0IKxjXvw052NdqDpKicpJs5pbzbMT/MCxWIRlekbcg3J/vHKPg8b+iWePmseYFv9RCwIQy/NKP8t0xbyRGt2OUh7VcfMevzB4/pGcaW7Z2gbR6FMEo9PSDhcBhxNaMvzbXWiWljzTrkMqGCc97OT1Fl2uJOn4RnF40Uv2yArJmVhdavnKrygB3QvU5T4X2VNtVMG+jD2bcPcQRBIjetDTMH7sJgTG7U6ngqYv7A7vSqqhsMw2MA1tR0m5PxUZPofUhZVsyemekPh1gp0vptwkt5TBktd4Tff3FVp03wMzMpGbS9gxr9xvfypQOXO1G1GNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772436576; c=relaxed/relaxed;
	bh=B++JTSOCDEejhrrruo0lwnBFAI5zm/KxsIu6HPW4OXU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZYh7gbv8DARoSrHc5p8e8zMZa82SLvK0FkshF8cmjD0bzy/wuQdxYYwfbmUdi1caTW0XGJ03WeOEebMqJ+EiEhHyoWKddD5RRZXxWhDLjRZorRH3XdZY+J2el6yf06aLOgX1+6DDsg68tjdJFuoNLyxEhg1nPu8eKGCQlVXhTsbCVebxJAibxe/t6M2DRWoUDIHQJHM0c+uy5bqcsTS8JFGpElISsNWUThLGsT/D87rbL2fKTF9GLUviMm3k1x3jfs44P7qUVTd/mCvgIGmHwKDvB0SgI6wwhp/DmQIkMT5DySLJF4Z1HuvTUeVgqCNQZqZP1bn7ng2ABNKeMKGB+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Kze8wGKA; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::349; helo=mail-wm1-x349.google.com; envelope-from=3vtylaqkkdlywheyanudhckkcha.ykihejqtlly-zarheopo.kvhwxo.knc@flex--aliceryhl.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Kze8wGKA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--aliceryhl.bounces.google.com (client-ip=2a00:1450:4864:20::349; helo=mail-wm1-x349.google.com; envelope-from=3vtylaqkkdlywheyanudhckkcha.ykihejqtlly-zarheopo.kvhwxo.knc@flex--aliceryhl.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x349.google.com (mail-wm1-x349.google.com [IPv6:2a00:1450:4864:20::349])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPVtk3Ly6z2xYw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 18:29:33 +1100 (AEDT)
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4836abfc742so32500415e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Mar 2026 23:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772436566; x=1773041366; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B++JTSOCDEejhrrruo0lwnBFAI5zm/KxsIu6HPW4OXU=;
        b=Kze8wGKAt8bxqVNQdTRwvAMDF0xtVSVJSzuzc8n3cHQkPWAzGm1A5TioNWdFprcA9B
         rbPHHoG9Cj04WBLUyEJfBr3eOibA5EtpDqQuv9iqeH7rJTS3sL5Y1RT9aazoQP7Py1gI
         evl/YCDq/gtwEtdbsoKQTP6hj4oNjHbI8+UQWp++rhxAL6zSLCpRLrwEDbrt2zwFDpjb
         1VhlWoHdcdDf//9eyaF+WOCYFqreVmYwvu5YDxToijwHm7O6Nfz7Y+5TAPynRbubsYt5
         vBTmosM4QZj6Qwtvj0r4oYdCwyjGVtsS6YCInPpxNG0Z439WqfzrP1YufKmTKdZExWUG
         LYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772436566; x=1773041366;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B++JTSOCDEejhrrruo0lwnBFAI5zm/KxsIu6HPW4OXU=;
        b=Ja2pPPmHooSXCXNvCjSrVhXDhRcRHeI1Ov4HBs/zjv7EvIlK9fjfwZb6OZmfx91qrR
         qYCm1spuWCXTCB+gMQoCBMjnvG1rgoB4RomGAIfrNKlyo4JX5ED69MpTH5Ak6dj22VAG
         75Wluay1zZD111Mx78Ig9loYyfyNAqj9GD6swj6fBgafEqjcW+EyYDH1aePS3ffvbRPH
         1X68kd/xBjQIYAs3VK6647x7Ky+Wp+7wfY4/hVT9hCHtQzRT+hsm0FWNI4z7UyRRf81q
         biBZf0HXQWSWsG6ovnu17i52jWiB/G8sjR5Qf3wOGwf0yuqmhnn12yDnHOmk+chUGkz1
         XRiw==
X-Forwarded-Encrypted: i=1; AJvYcCWNDY9LZhiQYl7NyXFEaXAeM9WgAfTGg0q0tdUQuS16azBVQsBRMLsq8ey7T5Q6uxmh/2+ye3Q90IeTyHY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzhV1nvirWG5QMroUVErYj6a/nWXWn7d/LDWtifWXoDL7Wees0+
	FOMpTtBMRjHn7S3zCukmElDKaDbdsujTLyGbwnTIcZGaxgYxLlraD82iMnNzXIjoDkYa6T0j2Fd
	XX9eAdg4fW979ZgQRBQ==
X-Received: from wmna22.prod.google.com ([2002:a05:600c:696:b0:483:272e:764f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e8e:b0:47a:8cce:2940 with SMTP id 5b1f17b1804b1-483c9ba2922mr208928775e9.14.1772436565594;
 Sun, 01 Mar 2026 23:29:25 -0800 (PST)
Date: Mon, 2 Mar 2026 07:29:24 +0000
In-Reply-To: <aaUlwfP72ZpshLPL@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
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
References: <20260210090023.2587534-1-mkchauras@gmail.com> <20260210090023.2587534-3-mkchauras@gmail.com>
 <CAH5fLgi3Owm4=4g8wQ5Rnr7Y63XJ1D8apOdkewW6WpRfg6vV_w@mail.gmail.com>
 <aZtT4MH0Q8Ic9ZiM@luna> <CANiq72nEam8n_daX5LyYrpH=i71k+pb+HLn6EEPdJJc-Zi9Q3A@mail.gmail.com>
 <aZu6cSqnvO91w1m4@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72mg+D4QZmBhrNj7dB+V3GHsQoZT2cSG1ffHYDYJWXyopQ@mail.gmail.com>
 <0a176f95-eeba-428e-b19b-b08503d9ca5d@ralfj.de> <aaUlwfP72ZpshLPL@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
Message-ID: <aaU8VC-kLOKDyYDP@google.com>
Subject: Re: [PATCH V6 2/3] rust: Add PowerPC support
From: Alice Ryhl <aliceryhl@google.com>
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: Ralf Jung <post@ralfj.de>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Link Mauve <linkmauve@linkmauve.fr>, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	Jubilee Young <workingjubilee@gmail.com>, Matthew Maurer <mmaurer@google.com>, 
	David Wood <david@davidtw.co>, Wesley Wiser <wwiser@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17492-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[aliceryhl@google.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_RECIPIENTS(0.00)[m:mkchauras@gmail.com,m:post@ralfj.de,m:miguel.ojeda.sandonis@gmail.com,m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:workingjubilee@gmail.com,m:mmaurer@google.com,m:david@davidtw.co,m:wwiser@gmail.com,m:miguelojedasandonis@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[ralfj.de,gmail.com,linkmauve.fr,kernel.org,garyguo.net,protonmail.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org,google.com,davidtw.co];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 507601D3E94
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 11:25:54AM +0530, Mukesh Kumar Chaurasiya wrote:
> On Tue, Feb 24, 2026 at 09:58:10AM +0100, Ralf Jung wrote:
> > Hi all,
> >=20
> > On 23.02.26 16:31, Miguel Ojeda wrote:
> > > On Mon, Feb 23, 2026 at 3:26=E2=80=AFAM Mukesh Kumar Chaurasiya
> > > <mkchauras@gmail.com> wrote:
> > > >=20
> > > > I think, disabling altivec, fpu and vsx with compiler flag will wor=
k.
> > > >=20
> > > > What are your opinion on this?
> > >=20
> > > It is really up to upstream Rust -- for us, i.e. the kernel, it
> > > usually doesn't really matter much how things like that are
> > > accomplished: whether via flags, a built-in target, a custom target,
> > > etc. However, we need to know what the path to stability is.
> > >=20
> > > My understanding (but I may be wrong) is that upstream Rust prefer we
> > > use built-in targets for softfloat instead of disabling via
> > > `-Ctarget-feature` (and that the other options may go away soon and/o=
r
> > > will never be stable) -- at least for some cases. For instance, for
> > > arm64, please this recent change kernel-side regarding `neon` as an
> > > entry point:
> > >=20
> > >    446a8351f160 ("arm64: rust: clean Rust 1.85.0 warning using softfl=
oat target")
> > >=20
> > > So please ask upstream Rust (probably in their Zulip, e.g. in
> > > t-compiler or rust-for-linux channels) what you should do for powerpc=
.
> > > They will likely be happy with a PR adding the target (or whatever
> > > they decide) as Alice mentions. And until we reach that minimum
> > > version (in a year or more), we can use something else meanwhile. But
> > > at least we will have a way towards the end goal, if that makes sense=
.
> > >=20
> > > In case it helps, let me Cc Ralf, Jubilee and Matthew who were
> > > involved in some of that discussion in the past, plus the compiler
> > > leads.
> >=20
> > Upstream Rust dev here. Indeed we'd strongly prefer if this could use a
> > built-in Rust target; we can work with you on adding a new target if th=
at is
> > needed.
> > The kernel currently uses a custom JSON target on x86 and that's quite =
the
> > headache for compiler development: JSON targets are highly unstable and
> > directly expose low-level details of how the compiler internally repres=
ents
> > targets. When we change that representation, we update all built-in tar=
gets,
> > but of course we cannot update JSON targets. So whenever possible we'd =
like
> > to move towards reducing the number of JSON targets used by the kernel,=
 not
> > increase it. :)
> >=20
> > Kind regards,
> > Ralf
> >=20
> Hey,
>=20
> Sorry for delayed response. I was out of network zone.
>=20
> I am not sure about the process of how to get this in rust toolchain.
> Should I raise an issue of github for this?

You would need to add a new file to compiler/rustc_target/src/spec/targets
in the rustc repository.

If you're not sure what to put there, I would suggest coming up with
something that looks plausible, and opening a PR with that. Then others
can help you with filling out the target correctly.

Alice

