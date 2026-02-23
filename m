Return-Path: <linuxppc-dev+bounces-17061-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKUqBe1ynGmcGAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17061-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 16:31:57 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 263E7178C16
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 16:31:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKPwT24dbz30FD;
	Tue, 24 Feb 2026 02:31:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::122e" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771860713;
	cv=pass; b=LgeW1PgHUTbTqkE5QBwbYzaf2SpBn1Q8Fp9nxv2dlyPRDTe4ZqyhYI9hqEmfehcnDlAgWWhXqVMoZ831bLZCFsFUuV4ZwNTNoMaC6c+4INIzf15tIO2QRkWdgnT0Uz2/RXSwAdbZPvWFwqxIdYo52rGTsdH4AMvXGPJvOGCyWlIkB/PBgxHGusSrPygZU10cn05YMU74R9+QJQKRfxaWPYZzT+DKV9Jt6Ft1yfS2u3Z4vvKSrJQDlhS/n9VU7uhXmiPko8j2zY5O/Ig1Aeb/FY5nUDk0IAMRnh0MEfkUgsQ7dJU3Y9DBoHP48TnubvdVcvR3hn4nHBkPl99aBhD/sw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771860713; c=relaxed/relaxed;
	bh=pAk8ejtYqNKil504XGxzm+aHwjMu2ZLiZ7Drb8rL6K4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=irmUTrkyQkWoZDMaHHPQ2Eq1FAwbs4PNbr4OjEot7YDFcFpvyk6kZXQ2rbPZTyikUof0YxbZUcbW2ijSs5uUUjYvG6HJ8FtpnHSCMd34Y7wELOkV5djuW0Ynww2eDzSfJtsY1PsdYLdjjJa1tSua1b6dGM0kCOF36W69aX7MTpFUn04Z2QDqJ6IDeZHUv9g7U8Duz3fMc9WRVAhlZtpHsaHH3E+UT/hyomcRetv/i1d9liSD8Us8nfGO1NR2dtBSRrVYDEX8+x1dJTmtpGIvjVAs728nbCtTafwc2/4ZvQdCT3UV7uVSiImGMTHFFD+zn6pVpJarN2VWsecuDRl4hg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X8B9RZqg; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::122e; helo=mail-dl1-x122e.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X8B9RZqg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::122e; helo=mail-dl1-x122e.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dl1-x122e.google.com (mail-dl1-x122e.google.com [IPv6:2607:f8b0:4864:20::122e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKPwS0tKkz2yDk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 02:31:51 +1100 (AEDT)
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-12739fe9a0eso244011c88.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 07:31:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771860709; cv=none;
        d=google.com; s=arc-20240605;
        b=QnT7o3flV/4hf6vWILJhAv4n9OFojIyyGh/Dzf3LhVv4eFlVHijczo6O2fhX+74z+s
         VOyIdMKChLXBFSA7VlnrdTGcOrkEy6Va5KxjPayaca0FLouWPGjoKShYgTiNKdVt0aNZ
         biaOR+AxqcZL9zELAlggzbTEbrGEblwIWx1/fFHgZcsL/7CEefL7fgpnpRaSepYr1sd+
         B8yULFlYw+QAA0uW5DCRyKI7/+9+16UDQQ/6m7vKJ+KuFQLpjHAVCMP9ut7xZ+xPvuEC
         l1sL1/jKBvndiRLfdlK/mJvCUR92xeCssPxm/jE4NffgLgKDxs4En2KYtZwqZyFYl2YS
         qk4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pAk8ejtYqNKil504XGxzm+aHwjMu2ZLiZ7Drb8rL6K4=;
        fh=hH8JQPPC5Mlb7EExpgtHSWmxgelHiYVI6wOWI448V3E=;
        b=B2VL4/EdFFbnDJDevaoQ9oBbZ7ibpHK9aZwVexnxoxnkRw+9n9FTcCJszy+Ej2L/rc
         Q1s43QT39ypQ2tkXHbIx4SP8IvrWQvaoxfoic8WfRzkTgN2Odb1hEBZ939mmPJfvcvdQ
         9rAHyrhqdil5w71yYsNvzeF+fsBdopqQwOLWVBwAF6RMj5O7e8kpTPoU/TasuBOSTAub
         BgQcIqBCvqn1W+/dpEzxiaCgBlc46wftsUa8P8v4EvE8TktKGCTtEhao9U1dXRoEpEyg
         nD8Xttt/jvsM9RLGFmf2bQ96OC3MPNnB/+7QGQKOHxZJbZuuWxRdOKzRNMyJhysNA4Fn
         LeAg==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771860709; x=1772465509; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAk8ejtYqNKil504XGxzm+aHwjMu2ZLiZ7Drb8rL6K4=;
        b=X8B9RZqg1idvL57BHSjxCExcaCzutgKncCuwfUHXBFgjcoBK7QSnkCXYIJBS+spLrR
         An8DzwTQGHWLt1ei/DKME34exlzLMgCp3UMS3t23Ht0gIN1mKmeZHHccRG7dU3uCmdmp
         r9qicyhEgXvC2FIpFZaazeXlP+T7m7v+SxMbHeiRiMkSHLCkSIDkW4OQE3qlWnp3X47x
         IgbtfKA2i4KKXV2qToQ9VE4TmuQERb9IfqYxGGNpNAob7XkJEtuVcGJpakmugDmQeOOa
         uiCpbKE3ZnJKFm115DDnplWVzGm9zoDXrlMGg0DndjuODGTwt9DYHwoRbHYUAK0Y4APK
         IRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771860709; x=1772465509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pAk8ejtYqNKil504XGxzm+aHwjMu2ZLiZ7Drb8rL6K4=;
        b=mcmpibFFULhWCYJVsxU8bjFEafS8fhi+EAN018aiIGwGg7dK/hm+5EQotCSfNyaZjY
         vsnoD1P3K6F6wkyEp+wrhWzht7I6HGtkPFvhi4rRqIOzxp3f93Wo9BJdM05/xVutKNF1
         rVgecmNaMJmZKs/YJ/qw7vJbo0ODq0lOif2m8w/D0kcK1dvG6lUjZZGy6PiPSMnyGpnA
         bgqlkEJ7G1uyOHHpw0HTLstlTOmo6la4lpz4qflWclAN5yCHvhpZ6qghOE7pxgYNnvE5
         td/19mQW1G6ugytUsTB1s9PqrXcTTyjpmZCmjC19OXnWcyXmfaR7wjK8j4ttoed6loCS
         l5ZA==
X-Forwarded-Encrypted: i=1; AJvYcCXSynz4db/31XDr3Fp1Yi1p7nB4iAUcrBR0YPUIBFxDlyaeQ1wA5rHoDEnmeNtTm2rL/nC2HRTzRzRBTC0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxfOLM4Ar41O6NjCaYkKB91SyOs9snsonPnqlp7a7xeBzH7Jtcj
	OXSdZm5pxjCld1iZuwO8Te1izNoeHfgjjh+t+DhHBl8M3Luvmqc8JvfYb7b07g7IZwIIOS5PgvK
	spO8mB9xgfEW10VmPFJKxNBF3UhhaUgE=
X-Gm-Gg: ATEYQzxZg1hCgC2G1wWShbd8dhsVEwVyeuy7v5fBSHGVQNr5judGoXtxLf0T3c1vgEc
	9Q5ICc6iTSpWTQjOfW7gCXHPwYb0ne8fuukP3q9H4JnRqorDPKyAmd4y0ycRonkXRKf3s1qr6Qb
	BVsR39471nvbYIxCg+8HlKs1AdToJoLfLXPwAJlMcTj6v1TgKDrCnvxyravAmuWlenvkETr6C1P
	1M12BxBlEikR6JMZ8Zc9IC8BS40lMq/DVnwUTy14VWdGhrHP685/IfPxpyy+y4KFnSGfXZD0IxX
	NDO+SHz0MELub8Qyqh07OusEkeQlNb+VZpWHGbYSRvOxdJfI7nRBQ6dH0RdnHyZkxHPQPJn6D5K
	+UqvEZKIPK8rXd8yX5oAgLA+4
X-Received: by 2002:a05:7300:e207:b0:2b7:1008:9f2e with SMTP id
 5a478bee46e88-2bd7bdaec6cmr1877425eec.7.1771860708535; Mon, 23 Feb 2026
 07:31:48 -0800 (PST)
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
MIME-Version: 1.0
References: <20260210090023.2587534-1-mkchauras@gmail.com> <20260210090023.2587534-3-mkchauras@gmail.com>
 <CAH5fLgi3Owm4=4g8wQ5Rnr7Y63XJ1D8apOdkewW6WpRfg6vV_w@mail.gmail.com>
 <aZtT4MH0Q8Ic9ZiM@luna> <CANiq72nEam8n_daX5LyYrpH=i71k+pb+HLn6EEPdJJc-Zi9Q3A@mail.gmail.com>
 <aZu6cSqnvO91w1m4@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
In-Reply-To: <aZu6cSqnvO91w1m4@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Feb 2026 16:31:36 +0100
X-Gm-Features: AaiRm52K4i0fpTeiP2c0ziG19k4_bQVuvrLcSD-qpk6IrkIxs1psp6f0fzvc-cQ
Message-ID: <CANiq72mg+D4QZmBhrNj7dB+V3GHsQoZT2cSG1ffHYDYJWXyopQ@mail.gmail.com>
Subject: Re: [PATCH V6 2/3] rust: Add PowerPC support
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: Link Mauve <linkmauve@linkmauve.fr>, Alice Ryhl <aliceryhl@google.com>, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	Ralf Jung <post@ralfj.de>, Jubilee Young <workingjubilee@gmail.com>, 
	Matthew Maurer <mmaurer@google.com>, David Wood <david@davidtw.co>, Wesley Wiser <wwiser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mkchauras@gmail.com,m:linkmauve@linkmauve.fr,m:aliceryhl@google.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:post@ralfj.de,m:workingjubilee@gmail.com,m:mmaurer@google.com,m:david@davidtw.co,m:wwiser@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17061-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[30];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linkmauve.fr,google.com,kernel.org,gmail.com,garyguo.net,protonmail.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org,ralfj.de,davidtw.co];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 263E7178C16
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 3:26=E2=80=AFAM Mukesh Kumar Chaurasiya
<mkchauras@gmail.com> wrote:
>
> I think, disabling altivec, fpu and vsx with compiler flag will work.
>
> What are your opinion on this?

It is really up to upstream Rust -- for us, i.e. the kernel, it
usually doesn't really matter much how things like that are
accomplished: whether via flags, a built-in target, a custom target,
etc. However, we need to know what the path to stability is.

My understanding (but I may be wrong) is that upstream Rust prefer we
use built-in targets for softfloat instead of disabling via
`-Ctarget-feature` (and that the other options may go away soon and/or
will never be stable) -- at least for some cases. For instance, for
arm64, please this recent change kernel-side regarding `neon` as an
entry point:

  446a8351f160 ("arm64: rust: clean Rust 1.85.0 warning using softfloat tar=
get")

So please ask upstream Rust (probably in their Zulip, e.g. in
t-compiler or rust-for-linux channels) what you should do for powerpc.
They will likely be happy with a PR adding the target (or whatever
they decide) as Alice mentions. And until we reach that minimum
version (in a year or more), we can use something else meanwhile. But
at least we will have a way towards the end goal, if that makes sense.

In case it helps, let me Cc Ralf, Jubilee and Matthew who were
involved in some of that discussion in the past, plus the compiler
leads.

Cheers,
Miguel

