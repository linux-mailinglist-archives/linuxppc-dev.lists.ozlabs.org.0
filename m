Return-Path: <linuxppc-dev+bounces-17490-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GTWEG4mpWm14AUAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17490-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 06:55:58 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF5C1D34B8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 06:55:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPSpg0NsSz3bhq;
	Mon, 02 Mar 2026 16:55:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772430954;
	cv=none; b=Ld8MgcHDsMS5acbiCy40+b9EYxXMZK2tPMvER7OK0mUYSrGhXlnw7h0DZoW1UW9NmAJCEtFrurdmUw2oWjE1G6NGDHqsTzsO5VgINijR6HQFghcrtXSPoZmd0sOhranDzUzm2ZiyOQB+12bRwsps6YWrY+gPd7jxJlTuvxf/CIRLwAlnhRlG3ANy/Xr0xpA7XGoTXpFrxki9HJ9zfkBdCtMWIjs6IvvYxZqzsfCmFM4w8vDmCXrbo3Yndo3tymbmJXvaROoHrJAXH90Kg5VY0OnaZvVUz+VrXk0fIvNNPpWnbpEexwNtT1ePnVYR0VGc9BszCyJkhM9JfZA8WoMusw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772430954; c=relaxed/relaxed;
	bh=uEUolpT/Arp1A2P5xnAR07p4qbMZiaO92OoqOxRTnXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nMZLB5BksRfnOAhHRYKBwDwOhEVFzsOFiYfw0aCcWiNKY4DGmax/ZALJ7CgC1Jqkc/sIHH6FBk/1167ITDqsheg3lvMX7U1Ivc6bT/ogb/46YRlJQDft6iJDP/b4WJ950dzrlKENJY7Y41q++lUEAVm3o5dbwWVP3jh5PojaATlOSirxR1sk1n/C6fo5yJxDPsbjiV/eOvonaQw1Q2zMMJ4egtVXqGE7H4lEfOg+3zAaZFljxZYY3hsJv2wE2I/QXO7Q5LL0JjctvXsOVj2htkULtZuhx9B/S7Wb7sB8dSlLZcY7Z+GnCEkU95lyVGtCW/VdPvlrV24nji95UhsXrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JgfEfTin; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JgfEfTin;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPSpd6jc1z2xNC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 16:55:53 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2adff872068so19851295ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Mar 2026 21:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772430952; x=1773035752; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uEUolpT/Arp1A2P5xnAR07p4qbMZiaO92OoqOxRTnXU=;
        b=JgfEfTin6zilyyy/7W5F6Fp+1e7EGNijgC/qddpWHjRBRezouILqkrGiVDcc/rktre
         kqyXWDjcQeHEAVO5OCb63lDr5evLInh6F+62b03Cp42Jz3ALUSzKRkbsxi02TY2QV8RY
         zdC/wKEGGnsDoqgckodo5CuOpqQArnk++YO30FuHrH7kHm82B2A09+dmjIlEiNzj/Rh+
         VOJuYuLGIUYslGUB2CseEZjqfcobZQXHeV1mrXwyzfFhHJCXBycxiMXQfiSzjdlqhjIO
         njI94gWUDR9eRXfGMPrg6VsE4ZQQJ9Ydh11dkNqLfbQU5ataYLNEVmT87rZZuUB18WkH
         xg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772430952; x=1773035752;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uEUolpT/Arp1A2P5xnAR07p4qbMZiaO92OoqOxRTnXU=;
        b=nloAjIlatp20eSR7S0CVMP3yDP3cU0ajh++WXd7bcKokKnTgsHRy3Gfl2i9tCqnIjn
         Svyp29G6mFPNnNrhFhPOo9m2QUkADJVWlqg0VkEWOPJEJg/eYXqs1AgvRwK1ydjXuSJc
         GEao4ZeLKEve142aGymGHMj53xhD8/Sp0EPM+EdjDr2JqIwUo+z+Fh7hvJ93NOYYQDGx
         0GwOccIumwFCdfFaCMmaXllu0Hz9KPprSEbgttuQ15XNzAXX8OMIWmUqqhNR2z+bBuuJ
         QZaE/AQuUzINUA/vvxsLy1x+Q0FRPLCZX0hemj3DOcR31TcqUHMuXfsasGuoDQqwsFza
         PYLw==
X-Forwarded-Encrypted: i=1; AJvYcCWJXI/na7uMroo37SbHU26mzW+wp33FiefKlsgA1JX3+rDgUNlQ3NmVUlfCk0FsbRBZ0do1ccEsewIyfmo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwWnVhHE4UpClKARvI2gqQs27PFdTxWM5wVve50ioAb+07+zFnD
	6SIcs7Damb+3Ok/eIWgbUtyOMXBiWrKhpsGdKXWv6IN1liiwyRSoazvS
X-Gm-Gg: ATEYQzwY5n80YcYssRQ1lqE8G+57pK7xRyUgq5FMQnA8TfWKz71OOwcN+mp0ARB9nZl
	9jaCO6sUEP8BjxTYZMCzD9fBlwCTjQFPRx4pIcONrB66Elim/TVUTkGFESAngfErKtnBXNcYUmy
	kYUpOdFNuVJGBBXH554uPx7iI2zNKja1jQydNZlDD698cODXwZkit3UbyFtJmlQ4nntMmzKVTZ4
	DulBipnIUj7VRW33jGZqv1QG9UQ6eVx6QLd97aiLk0qAFKG+QP+nCnRr7JOBzl7iJdyZ6NkE+Gm
	uOXs+mi1fkqkkMUtIt8NIHi+feMC/G/YzsybRib6m5rCcvjCRuj35UlypIpNASROpmgjF+v5mzu
	VAOaROan8K+RWv3f67zFpBLPIkAYW9KtREu1Ac+6SSJZhZkW9+MrIOvwQW6OM+6aMHnySKovCb0
	xhAcnFvB/V39xYoj3085aoli7zOdVC+/bsV5tJreQOROpV5vipIuOaTHiahhrAqXpaoT8QgTii
X-Received: by 2002:a17:903:1786:b0:2a9:2ab2:e50d with SMTP id d9443c01a7336-2ae2e4e1e73mr98276195ad.51.1772430951599;
        Sun, 01 Mar 2026 21:55:51 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([103.219.228.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5c2e4bsm179629825ad.32.2026.03.01.21.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 21:55:51 -0800 (PST)
Date: Mon, 2 Mar 2026 11:25:54 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Ralf Jung <post@ralfj.de>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Link Mauve <linkmauve@linkmauve.fr>, Alice Ryhl <aliceryhl@google.com>, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, 
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, 
	ardb@kernel.org, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	Jubilee Young <workingjubilee@gmail.com>, Matthew Maurer <mmaurer@google.com>, 
	David Wood <david@davidtw.co>, Wesley Wiser <wwiser@gmail.com>
Subject: Re: [PATCH V6 2/3] rust: Add PowerPC support
Message-ID: <aaUlwfP72ZpshLPL@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260210090023.2587534-1-mkchauras@gmail.com>
 <20260210090023.2587534-3-mkchauras@gmail.com>
 <CAH5fLgi3Owm4=4g8wQ5Rnr7Y63XJ1D8apOdkewW6WpRfg6vV_w@mail.gmail.com>
 <aZtT4MH0Q8Ic9ZiM@luna>
 <CANiq72nEam8n_daX5LyYrpH=i71k+pb+HLn6EEPdJJc-Zi9Q3A@mail.gmail.com>
 <aZu6cSqnvO91w1m4@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72mg+D4QZmBhrNj7dB+V3GHsQoZT2cSG1ffHYDYJWXyopQ@mail.gmail.com>
 <0a176f95-eeba-428e-b19b-b08503d9ca5d@ralfj.de>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a176f95-eeba-428e-b19b-b08503d9ca5d@ralfj.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-17490-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:post@ralfj.de,m:miguel.ojeda.sandonis@gmail.com,m:linkmauve@linkmauve.fr,m:aliceryhl@google.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:workingjubilee@gmail.com,m:mmaurer@google.com,m:david@davidtw.co,m:wwiser@gmail.com,m:miguelojedasandonis@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[gmail.com,linkmauve.fr,google.com,kernel.org,garyguo.net,protonmail.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org,davidtw.co];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com:mid]
X-Rspamd-Queue-Id: 6EF5C1D34B8
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 09:58:10AM +0100, Ralf Jung wrote:
> Hi all,
> 
> On 23.02.26 16:31, Miguel Ojeda wrote:
> > On Mon, Feb 23, 2026 at 3:26 AM Mukesh Kumar Chaurasiya
> > <mkchauras@gmail.com> wrote:
> > > 
> > > I think, disabling altivec, fpu and vsx with compiler flag will work.
> > > 
> > > What are your opinion on this?
> > 
> > It is really up to upstream Rust -- for us, i.e. the kernel, it
> > usually doesn't really matter much how things like that are
> > accomplished: whether via flags, a built-in target, a custom target,
> > etc. However, we need to know what the path to stability is.
> > 
> > My understanding (but I may be wrong) is that upstream Rust prefer we
> > use built-in targets for softfloat instead of disabling via
> > `-Ctarget-feature` (and that the other options may go away soon and/or
> > will never be stable) -- at least for some cases. For instance, for
> > arm64, please this recent change kernel-side regarding `neon` as an
> > entry point:
> > 
> >    446a8351f160 ("arm64: rust: clean Rust 1.85.0 warning using softfloat target")
> > 
> > So please ask upstream Rust (probably in their Zulip, e.g. in
> > t-compiler or rust-for-linux channels) what you should do for powerpc.
> > They will likely be happy with a PR adding the target (or whatever
> > they decide) as Alice mentions. And until we reach that minimum
> > version (in a year or more), we can use something else meanwhile. But
> > at least we will have a way towards the end goal, if that makes sense.
> > 
> > In case it helps, let me Cc Ralf, Jubilee and Matthew who were
> > involved in some of that discussion in the past, plus the compiler
> > leads.
> 
> Upstream Rust dev here. Indeed we'd strongly prefer if this could use a
> built-in Rust target; we can work with you on adding a new target if that is
> needed.
> The kernel currently uses a custom JSON target on x86 and that's quite the
> headache for compiler development: JSON targets are highly unstable and
> directly expose low-level details of how the compiler internally represents
> targets. When we change that representation, we update all built-in targets,
> but of course we cannot update JSON targets. So whenever possible we'd like
> to move towards reducing the number of JSON targets used by the kernel, not
> increase it. :)
> 
> Kind regards,
> Ralf
> 
Hey,

Sorry for delayed response. I was out of network zone.

I am not sure about the process of how to get this in rust toolchain.
Should I raise an issue of github for this?

Regards,
Mukesh

