Return-Path: <linuxppc-dev+bounces-16584-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8E4nEopEg2nqkgMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16584-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 14:07:22 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B90E62B7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 14:07:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5gcQ4N9hz2xpk;
	Thu, 05 Feb 2026 00:07:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770210438;
	cv=none; b=M7xyKz6NWBdXuF/yy5MjF1QwdHh5UjGtWcfhA3UlRTk7SFyxXrHyMcTh07+g5IQM0ccD4tHHpitKvVKabcWKm0vZzTyOkhorDvmigWwbyMx9aM/VdvhqTzUPSviFSv4Wqg/t1vBD4Pxiio3NhhEALAA7YuV6Ykh5rM38ASaqaQYP/YTfTSU12OCrM5cIHnk+RxsZdSbmwCnLkKRZy3JEb7RsnmoDUtm6RV1b76sX5o/E7VJUn7asFiTiqlBDfYtUw9qmHjsZfaCf6G389l4yAFH50ZOpBofqXhJLVLVPm/gStzAAPaEfsI2AlqUnB9FDXOM45pRyuN71EH2HwjYAJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770210438; c=relaxed/relaxed;
	bh=IG7z+rMybMa4HuzoAClaZJTClqKa1ijErCJG0QFQoWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4soLLASqROAzaSQLcU+xwaBHNh7HnZAaIYOjxOW3ij5VwCrdGslXxNe8J5T0yliKFC9YdHD3lPNyjreYrjr9YytS7WbyOo2Ip7RFdk2RXiBNwhasEK7IMAfE6gupB8i+opedvIuQExyP0G/UX3rQz0g6DnPY+0SGAxw7NBlVeZrMLCSGPC7aNXn0nlycPWjLGoglKUJqOw3kFveekwUrTmqwwelHmqGNycpyDcjaJSukPBfLBW8+lA3lHCLOvmyClu53K/2X4eHlA6fwbzX2IDTTzs4RvVpnKuz12H0XsVrfKxMBrZ4SlKS4vyn/eabZ9h8g4taM0n1PQp7D68qXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=JnNmj20m; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=JnNmj20m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5gcH0PDhz2xJ5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Feb 2026 00:07:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IG7z+rMybMa4HuzoAClaZJTClqKa1ijErCJG0QFQoWY=; b=JnNmj20mm0cT/SAQkT0IEJ72Jn
	yFL0UFRybqecdOVM/1xS8zNEz1CsA2VmJqWKJL3pxSz/3Eb2QQee1rOZVnsoWdN+d67Q12Xe7aLog
	Ed3/oC2V3ikJ7KOnUEvk3UE2dvpREAv4XJym9QeEGR+lPtkcpb8Z8Mp0nqyqJ4++32t1lIVBU/dIZ
	QP4uqO2SDYDTum3xaUZR9zNluxP4M84YOZdgXelOkAE0NgSQ/beE75OCCIB2t8Efrte/uLOGy8Nb0
	CasrpB2NDBcpW0kyHSlgGeA0BtuQlhgFzv6a/uvF22OLPZsgx09OPvQ496GWarL+3HLP2b/orH+kv
	ylDfNAGA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncas-000000026VB-09Dm;
	Wed, 04 Feb 2026 13:06:54 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7D24B302F8E; Wed, 04 Feb 2026 14:06:53 +0100 (CET)
Date: Wed, 4 Feb 2026 14:06:53 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Gary Guo <gary@garyguo.net>, Link Mauve <linkmauve@linkmauve.fr>,
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev, officialTechflashYT@gmail.com,
	Ash Logan <ash@heyquark.com>,
	Roberto Van Eeden <rw-r-r-0644@protonmail.com>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH] rust: Add PowerPC support
Message-ID: <20260204130653.GH2995752@noisy.programming.kicks-ass.net>
References: <20260204030507.8203-1-linkmauve@linkmauve.fr>
 <aYMiXcy33YEVkgYM@google.com>
 <DG66KRKI62WA.3GILMBH1UCYB@garyguo.net>
 <aYNBtc2Jbtg9sLIE@google.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYNBtc2Jbtg9sLIE@google.com>
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16584-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:gary@garyguo.net,m:linkmauve@linkmauve.fr,m:rust-for-linux@vger.kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:llvm@lists.linux.dev,m:officialTechflashYT@gmail.com,m:ash@heyquark.com,m:rw-r-r-0644@protonmail.com,m:j.neuschaefer@gmx.net,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[garyguo.net,linkmauve.fr,vger.kernel.org,kernel.org,protonmail.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,gmail.com,akamai.com,goodmis.org,google.com,lists.ozlabs.org,lists.linux.dev,heyquark.com,gmx.net];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[peterz@infradead.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 37B90E62B7
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 12:55:17PM +0000, Alice Ryhl wrote:

> Is there any reason to not make it Rust-only but for all Rust code?
> Making the / operator work seems like it would be a good idea.

Why would it be a good idea to have it work on non-native types in Rust?

The reason we don't have them in C is because non-native divisions are
expensive and doing them should be a conscious choice. The very same
argument should be true for Rust code too.

