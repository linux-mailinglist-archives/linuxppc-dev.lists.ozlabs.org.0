Return-Path: <linuxppc-dev+bounces-16582-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIfzE8FBg2kPkQMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16582-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 13:55:29 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EB3E60F9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 13:55:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5gLh4FW7z2xpk;
	Wed, 04 Feb 2026 23:55:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::34a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770209724;
	cv=none; b=gnZXPqQHSfDjpPaXeVjdh/ZxDpzg3myg7APvHH11++MicfMFt4/WdIq3ZuUXffh8+gwYXQdFvK43gYwmLVe4pLIWVSx2JiZVYCanYjYXpQSNrc7oMyNALCQFnOlQQdYPCV0PETEMlrOo3HlEqUFnV4HkmDLz/n+oCS98pAu3UciUbWmT5eOS6ujympDaJ6253UiPLNseA49146P1hBSZqRoX5UhoLQmYVRJ999yn4zY8sZ+comNf3utrtr/5lU+imjysoKcdXshfeoTP62IhTF+2NKGXEHRkaE4Y42IP1i5WnrJmeOHAdaazocZxvjjED2yl2GW30t10FX9c6WZ3Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770209724; c=relaxed/relaxed;
	bh=D1+zqDYtEzNHH8qUq1QENLiYsBbkZqTWhXubUu0+QkU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=N70zGDMrI0xzwP4eTDW2rvHSGmMsU6GnB4fH1mbM4p2bSAY6Tv1nRL+DByU7oI0w+T+prOsBffb2uuWPTDikTjHFp9JPUeNFQJnvDHt+Tbj6UVOiDNi01vVCk0YKcrORo6TViVZedrB63sdEZVKv/4xEewohDUB7oxMcgE4SuTo+X1t3U5p1yY9skK6WSKX/koxmns86sGibMrnX8m32oErDuyHNUDKTqm5qjclzMcYGS0o0lsOnYX8KS6Bxo2FV34Yfz2T/EbgZi4zP8MyUXof6uKWyPI3jk5ZtYc/2/CW2VlyM/JLj8YldMFy1CiQj0Dh2qk1iCrifHIb/I7YLow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=H+x6uFV7; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::34a; helo=mail-wm1-x34a.google.com; envelope-from=3tkgdaqkkdjk3eb57krae9hh9e7.5hfebgnqii5-67oeblml.hse34l.hk9@flex--aliceryhl.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=H+x6uFV7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--aliceryhl.bounces.google.com (client-ip=2a00:1450:4864:20::34a; helo=mail-wm1-x34a.google.com; envelope-from=3tkgdaqkkdjk3eb57krae9hh9e7.5hfebgnqii5-67oeblml.hse34l.hk9@flex--aliceryhl.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x34a.google.com (mail-wm1-x34a.google.com [IPv6:2a00:1450:4864:20::34a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5gLf48qjz2xJ5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Feb 2026 23:55:21 +1100 (AEDT)
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4803e8b6007so56350835e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Feb 2026 04:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770209719; x=1770814519; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D1+zqDYtEzNHH8qUq1QENLiYsBbkZqTWhXubUu0+QkU=;
        b=H+x6uFV7u7YR4IY89atQfarC18pitMPjgzzPzxwP7EemL0RPlEW52aB3P1Oly+wAr+
         YfxdsRjn3pDWKLooZKI0vbT4i1l5glmdH5s1n2iWU0gDvwkpO2Dj4f1dedxdSEJ5SVe3
         Kz8K62/zGTRg8rFpweF+2r14ZWpxSUtK2MolLVIvjgeD+iNYDlHqClk7vNcC3sPZ81rz
         1kWT2yd99AwWfmQKiJI9FXfz3UH/n97XkDmjCXBoe8cl2SvxpGdf9Kn0nyuzusb8OZ6u
         qgkJzTaYcv2MVCC+5WGjw9K/ZD262zSzd6njI9WWwROM8J9xSUAt2+FACJFH7jCIGq3V
         K4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770209719; x=1770814519;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D1+zqDYtEzNHH8qUq1QENLiYsBbkZqTWhXubUu0+QkU=;
        b=sytm+DUJlExkkSpbM03cI/M5upj3KSGSsA0WPo6MZokGi0C2DBo6sBfEO7SR/6wpIy
         6ubLL0vjnAvCYOuSDUPX/4V96cWetA5Z2kHHoF31kcdSR8eCktoFJJmHs019GjNwssXe
         zY6qF4fT1SQwJvjrX9Of8QQXW3NGWK16t4NZaN5hIsd7gQe5zNafuChh6yKraXm8NdQ2
         g00JFXTa7lPBxA3HOpLxuwYtAiRNAxB9yJjE+SqqI4xX7Kv5EAv2rtRRoRWOsEwaZ3rI
         GcaolITyxq4gdxGNHQI8W7UwDZuJ7egCmqlEx2VmcuPdRvvZo2yNNBvoeG549NTHRNyi
         8Zjg==
X-Forwarded-Encrypted: i=1; AJvYcCUxRdWS+fRLpGvLGDLbD5AuT5h+B1FVMRdw+htasNbZFtBAmPorz+CqLEIL7gm6rO/JYhH/9TPO8Ogpwjc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxMJVwkOguIFOgSMCLNs/aXBXj50QKb3rdEAvSoJKec+UxGZpJ5
	djwaZiMH61jPJjVBtgMHo3TY8MjnAF4GO7MM5wiO4T5Y7e8LbVV8qS7IhWTXMRh3/4TKFyUcZ8w
	NmFsnkYIQAE9z1HjJ1w==
X-Received: from wmxa18-n2.prod.google.com ([2002:a05:600d:6452:20b0:480:6c6f:8c06])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b88:b0:480:4a90:1b00 with SMTP id 5b1f17b1804b1-4830e96d623mr34918315e9.20.1770209718861;
 Wed, 04 Feb 2026 04:55:18 -0800 (PST)
Date: Wed, 4 Feb 2026 12:55:17 +0000
In-Reply-To: <DG66KRKI62WA.3GILMBH1UCYB@garyguo.net>
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
References: <20260204030507.8203-1-linkmauve@linkmauve.fr> <aYMiXcy33YEVkgYM@google.com>
 <DG66KRKI62WA.3GILMBH1UCYB@garyguo.net>
Message-ID: <aYNBtc2Jbtg9sLIE@google.com>
Subject: Re: [PATCH] rust: Add PowerPC support
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Link Mauve <linkmauve@linkmauve.fr>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev, officialTechflashYT@gmail.com, 
	Ash Logan <ash@heyquark.com>, Roberto Van Eeden <rw-r-r-0644@protonmail.com>, 
	"Jonathan =?utf-8?Q?Neusch=C3=A4fer?=" <j.neuschaefer@gmx.net>
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16582-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[aliceryhl@google.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:gary@garyguo.net,m:linkmauve@linkmauve.fr,m:rust-for-linux@vger.kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:llvm@lists.linux.dev,m:officialTechflashYT@gmail.com,m:ash@heyquark.com,m:rw-r-r-0644@protonmail.com,m:j.neuschaefer@gmx.net,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[32];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linkmauve.fr,vger.kernel.org,kernel.org,protonmail.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,gmail.com,infradead.org,akamai.com,goodmis.org,google.com,lists.ozlabs.org,lists.linux.dev,heyquark.com,gmx.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 42EB3E60F9
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 12:36:38PM +0000, Gary Guo wrote:
> On Wed Feb 4, 2026 at 10:41 AM GMT, Alice Ryhl wrote:
> > On Wed, Feb 04, 2026 at 04:05:04AM +0100, Link Mauve wrote:
> >> For now only Big Endian 32-bit PowerPC is supported, as that is the on=
ly
> >> hardware I have.  This has been tested on the Nintendo Wii so far, but=
 I
> >> plan on also using it on the GameCube, Wii U and Apple G4.
> >
> > Super cool!
> >
> >> These changes aren=E2=80=99t the only ones required to get the kernel =
to compile
> >> and link on PowerPC, libcore will also have to be changed to not use
> >> integer division to format u64, u128 and core::time::Duration, otherwi=
se
> >> __udivdi3() and __umoddi3() will have to be added.  I have tested this
> >> change by replacing the three implementations with unimplemented!() an=
d
> >> it linked just fine.
> >
> > Uh oh this seems tricky. How is this not a problem on arm32 too?
> >
> > Perhaps we should just be providing __udivdi3() and __umoddi3() in
> > general?
>=20
> I think there is some concern that if this is provided, then C side that =
uses
> the divide operator instead of dividing function doesn't get linker error
> anymore.
>=20
> However, a proper way is to do this via the hooks that we already have in
> `compiler_builtins.rs`.
>=20
> This can either be replace these with panics or actual implementation, bu=
t for
> libcore.o only.

Is there any reason to not make it Rust-only but for all Rust code?
Making the / operator work seems like it would be a good idea.

Alice

