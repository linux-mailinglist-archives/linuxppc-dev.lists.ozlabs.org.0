Return-Path: <linuxppc-dev+bounces-16636-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMcuD3n6hGkL7QMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16636-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 21:15:53 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB30EF713C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 21:15:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6T4N6Jc9z2yFb;
	Fri, 06 Feb 2026 07:15:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::1336" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770322548;
	cv=pass; b=AzXmLpnOFg26W2Ukx6gFB1Y2yN54rPFcfIK2pYbqdJNbViC7T5VBIHf40B5DWELiYBklv+AEEg1qpNTzMD8Rle9j+yaOYDSmoivNGgSL6dxZ/o/vJWyi8iTaVslC6X49Eq5XrTV2rAuhWkuwzztLWT+Bd5Z2y8uI27AT3JnkOik60wfsR8yVWyEVD5Pqpba8BDNoO9NkcX/sNc1EDQDDqPoLiV0TCYjAeksE4u1eRqvPN9pBCyFrMyJ5rAPmo7jKxEc3sgUzIbvBmQg6YVLu+vv7sjtLrRhCKfKIqsIaHy5zJuELCp6lY74uK2qkz5Hw5i94RT81XlyU/QzZ+1/m7A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770322548; c=relaxed/relaxed;
	bh=cvmMOG/Nbs2y01Em99NJUpodsaB5RsOB6Nm2Q6MYBKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hj8s2QdshnQcCFmPU7T+kNt6CK37EuNH/uJu61PfGkHzd+Ws0olrdjWa7Zy4y3Y9SZ3RTNVmbjO0ktN9VEzWpa0HqVJkJZXr2Acn4oWISSQK68ZLzBqO9yCS0r9k3kOYKsGHONkJk6KSOxzHdyJL8Llg/F34iF7x7Y735IAmqm73d8fEdtDS+7a6gYaK+R+WgZlQtiPWI/2wvFhNy24aBDgimpFFGYI4hsNuxTuregI51zOBgA481znPiQ08AgvZ+HxMPVBap+kBESjyt3H4ILvs6Y0VrhhIVNf5RIpr+ji+B0nJkBG93ZdhpKzEnJPjErUFWRh764DXe/cZPp5tOg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FKtjxwUk; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1336; helo=mail-dy1-x1336.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FKtjxwUk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1336; helo=mail-dy1-x1336.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dy1-x1336.google.com (mail-dy1-x1336.google.com [IPv6:2607:f8b0:4864:20::1336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6T4M5vpDz2xpk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Feb 2026 07:15:46 +1100 (AEDT)
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-2b78c97f57bso116026eec.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Feb 2026 12:15:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770322544; cv=none;
        d=google.com; s=arc-20240605;
        b=d3N5Gh5wRlU5nnttHtZGPP9qAU/H5CgTMkaTZV08ykpF6IP4Nhbc8E1Dc1d76fi5nw
         u6st3N8G61R6yhRa1nqD8E6dsJlltZZo1AbYQl45T7fCS4uLvrPdnKDYuWyiZDvoT8f8
         VFHDE/xcJbryLjLu2feIRdhImEX2eN9UMTLMcLtNW4OXS7h0U8mUk2m1uPjh8OUBBkRG
         IDekSzjefzsMhWXIavFZwQEjDtxwNIsdPvVdl/9hE+/LvqeZq1Y2zBKUsvbL+1WS7AQJ
         1f/XTDXOgfJwa3MQgNbMgBpl8XkwpP5R198C5OJZyDEmGNVaFfqRnmMZWqxZEMkYHr/5
         Qzjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cvmMOG/Nbs2y01Em99NJUpodsaB5RsOB6Nm2Q6MYBKw=;
        fh=E/KPDjpppGw6pZI4ZzKbi6GKRu27HU5gTceqgIOmBVA=;
        b=kCgptjsAeUg4cCHRuJvQB1T4d91Z+ge+716sojSKO7dAu+pSVbuGedF09ZaYX/hzA+
         6k4nKuV4J3RkD6fONuMIb+yysrOXg5NKir8ly4q4Xvv5jwBmmqbodoP07/ogrSeflgcg
         YZUFQbUXiegrw1zvUBJYMJIMPFYQS9Jb1oWvuPJdjUh0WZ15yDjW1odYuTcyq/yC3sAy
         inRGsSb5nj/tiMOzhj2EIc7B8QiIVhmV1nKLMEHdeBd+ZxgOICWPnHeSf1nZG8mLDFS3
         YWDC4o5YjKDALOhyBodX0gOUm+tjZCwC0zKNh3rwBOOGxCmbVVqTY3KBFWmRsrqxmd80
         aPHg==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770322544; x=1770927344; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvmMOG/Nbs2y01Em99NJUpodsaB5RsOB6Nm2Q6MYBKw=;
        b=FKtjxwUkK0EsXBgq/WPHKAECh0IU+zZ0QmWDyUu6jtL4CtfgdwIT/FZ6Yha/GZDRpL
         vs0eb0XZDun/rbGZ8uNtaXeWxv6nj5b0YNXbo8VYb1dfG8KL56lBU1H5VfzqRsPErP0C
         gSkVbkyxtjmIb8Q+ZQLAc9vdSmj9+DxxfuVCt3mvGrUKOOupnyOjfUQOY5COtWHB9lZ7
         WFdsyWnqCtvpn7GwnZN4rambemdx847K2nNOcWt0a+bC8qz9YQtrDfYFbgavDH2HJRRJ
         KMZJOsBw9vgU4NzIBUfkXs3VTc+z5EcrjluSrA+wzXozPJ11aWNypaEvJdPMITv8o/K/
         Fp8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770322544; x=1770927344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cvmMOG/Nbs2y01Em99NJUpodsaB5RsOB6Nm2Q6MYBKw=;
        b=qfDcatJbo/ZZCKRrkiePwu2ZOzoE4bzQwODp8PNC32Q9FaCGmf5eBMaBwc8LTRqLOH
         C9pPEUCQHOI0m0uAlqwy+0DkCO8Vj4Znpkhi7VGpOeEhohxkKTGFb4sQ8dCfPVp249HU
         OfpdNmEkO5tVUg0RqOqoN+p41tBPummXahte71uDaL3l7rIPTlwAfwAs6QWmvE7RFr8m
         Axg6V0HC7sHvMbdxtuNXO/ByImHJCHfvR4idNstUE6kGokJiwYwIXIRQUksqNF+uHV+b
         oAkSJiDGIbyOhmFkctj0taWKsqsxe8RVtuHpWYGxHQqarTSF8TnFZ5HjFTDmbhsh6UBh
         En7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUd4SnXTBgusx5d3ZG49hH24u8EYLH4tZhb6LRXA6c1KJ/yrzLDowLnFT8LUhGJmoDo68dWUi6922nLXiM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YydsEEz4ZGYxPDH+1kNERvfAZen8SI/8BRBp8ScdGDJJzfpiv5t
	Wf/tsU425mmISzBfjVsuVYiypRILcr82f1JSAdtHBsR0nB6L4j7WbULpVTUIqCwLMHWhEaOY5hV
	M+7Akfo2qLuuxaIsOKP+4S840VU/OJ+4=
X-Gm-Gg: AZuq6aLpbPaW0xw/RepcwZm7degERZcjN97M7JdUBSZSW1tIZ5X4yWUpdWx7cMaI8j0
	vBs5uOfvXZXGd8sPWu5/W4tuvVxWePJEotNXWi+OEGCxCnoEz9Qiwch+jqrZZYgrd9122lZ5/ff
	07SlWBJ/+xEN33h0ngvpz88+/p7Fg5QFTt7fL0hZ8dGKrAhPfkhzecs6kgla967e8ZK2TpN7dkI
	AFpNXXMs7NPn/SX/AdO2xPUvXxV/Vr03xyrCi3DDUeBh0FpQWlEuduvN/BvMVbpFwxKUNyW2t2z
	KEEfGnJ+9WM1P3tQ2CYO4VjS6UPnnRWPd4ggEXzDGzJlL3gyyx4bUdbT8rB/P8fRO/e2TYV9eQ5
	DrJ8fwYmd4wsRf/h1fXyAAhs=
X-Received: by 2002:a05:7301:290a:b0:2b7:1008:9f2e with SMTP id
 5a478bee46e88-2b8565170b8mr67598eec.7.1770322544408; Thu, 05 Feb 2026
 12:15:44 -0800 (PST)
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
References: <20260204210125.613350-1-mkchauras@gmail.com> <20260204210125.613350-4-mkchauras@gmail.com>
 <aYSgjPD5KRcNN0j4@luna> <1ed12a72-06e4-461b-907e-2581e25e3e38@linux.ibm.com>
 <aYS2oWCE0ZCC3don@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72mi-V_SF+JErMJu1wZEd27HPHqhsxE8dELtd5e3ZEaA4w@mail.gmail.com> <20260205200222.GA1298159@ax162>
In-Reply-To: <20260205200222.GA1298159@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 5 Feb 2026 21:15:32 +0100
X-Gm-Features: AZwV_QgYb-zr50IKZRngiPF2__DedHoXx9O8lOBxwz2l3ih7SO-AZRhJAl3SJvE
Message-ID: <CANiq72mqVNGJSFAm2UhjXRV=5cWQ1Z4xN2aVeYQ5Tn-veym3+g@mail.gmail.com>
Subject: Re: [PATCH V2 3/3] powerpc: Enable Rust for ppc64le
To: Nathan Chancellor <nathan@kernel.org>
Cc: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, Jubilee Young <workingjubilee@gmail.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Link Mauve <linkmauve@linkmauve.fr>, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	clang-built-linux <llvm@lists.linux.dev>
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16636-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:mkchauras@gmail.com,m:workingjubilee@gmail.com,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:venkat88@linux.ibm.com,m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:llvm@lists.linux.dev,m:nickdesaulniers@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[32];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[gmail.com,google.com,linux.ibm.com,linkmauve.fr,kernel.org,garyguo.net,protonmail.com,umich.edu,lwn.net,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org,lists.linux.dev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,lkml];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: CB30EF713C
X-Rspamd-Action: no action

On Thu, Feb 5, 2026 at 9:02=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> Thanks for the CC, I had not seen that issue. LLVM 22 is currently in
> the -rc phase and I see that the fix has been merged into the
> release/22.x branch as of yesterday so it should be in LLVM 21.1.0-rc3
> when it get released on February 10. LLVM 21.1.8 was the last release of
> the 21.x series (hard to keep up with all the numbers...) and it sounds
> like this is only a regression from the LLVM 22 development cycle.

Yeah, sorry, mixed up 21.1.9 with the potential 22.1.9 in summer this year,=
 bah!

Fixed my comment in the issue to avoid confusion.

Thanks!

Cheers,
Miguel

