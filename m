Return-Path: <linuxppc-dev+bounces-17011-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EB+gK+9Tm2kLyQMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17011-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Feb 2026 20:07:27 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0941701F2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Feb 2026 20:07:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fJtlY6DlQz30T8;
	Mon, 23 Feb 2026 06:07:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=82.65.109.163
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771787241;
	cv=none; b=SfhpE6rVW1vZaZV+54pfUx0sjbZ1Z2Lu2ojdAspzzRZ/1KsVeWgYMfo+cGBRYrHy37EUK3SfKhlYzNT89847Mz3GdG+GMtsF3rwAjcjszQfyRf2YXDsmJ3tylIvfyEziIAyjDQB+lWMJah66+Ru/GOOMwPFpqzd7SoQrkJXkRib1zPeoN4GFu6hAdg0uGPxDLRgknz3zuSVK4Z/VYoP+q7fKNbMBTwY5g0uy68JkQM4Hv9+nxUZvW0XjGPWMuiYA77Er0WAj51zcXOtG297Q0Y/WJGgXHND+Ysizv6zLlosFyUgjAr8UXfRisrlvJZ7wqNHXcMpjD57YhnAqobGflw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771787241; c=relaxed/relaxed;
	bh=9L9Ul+43f+09Ca7GXYuYCGpJpb+ykODmxvRcEeMo7oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KwJlmMNHIdaAVaQftHSTYPeiA5+yr+BhJmnDlZuK7uJ11ho/wYOd5HNyfK3vF0EqF5YJFRiuB292yzW7eRQrIz6lRQtdheV1oIFKvviiTqZ9N14HGxCbhutkO9qBArb7zcnmECiPDOVx+UnLo4o1LA43E8+FWJplPCDXJ/6d03LZhoCdkO9t+wQkeDME1EJTVuIvGYL46AzAKDujsLhIwEXt7IRTtThFdzlkwkmTsmjj1vUdqfZPmOZ084ac9Gyes5QwuIuoGmyv4SrfN1CcCIgMb+vqtAwy7yRSS2wda7swgjkZDE0Scxfy9LvVJNsLAzHbwIGbzQOnPqAIXwtImg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass (client-ip=82.65.109.163; helo=luna.linkmauve.fr; envelope-from=linkmauve@linkmauve.fr; receiver=lists.ozlabs.org) smtp.mailfrom=linkmauve.fr
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linkmauve.fr (client-ip=82.65.109.163; helo=luna.linkmauve.fr; envelope-from=linkmauve@linkmauve.fr; receiver=lists.ozlabs.org)
Received: from luna.linkmauve.fr (luna.linkmauve.fr [82.65.109.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fJtlX5fr3z2xnj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 06:07:19 +1100 (AEDT)
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 322BAF43C7E; Sun, 22 Feb 2026 20:07:13 +0100 (CET)
Date: Sun, 22 Feb 2026 20:07:12 +0100
From: Link Mauve <linkmauve@linkmauve.fr>
To: Alice Ryhl <aliceryhl@google.com>
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
	linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org,
	corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org,
	jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org,
	ardb@kernel.org, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH V6 2/3] rust: Add PowerPC support
Message-ID: <aZtT4MH0Q8Ic9ZiM@luna>
References: <20260210090023.2587534-1-mkchauras@gmail.com>
 <20260210090023.2587534-3-mkchauras@gmail.com>
 <CAH5fLgi3Owm4=4g8wQ5Rnr7Y63XJ1D8apOdkewW6WpRfg6vV_w@mail.gmail.com>
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
In-Reply-To: <CAH5fLgi3Owm4=4g8wQ5Rnr7Y63XJ1D8apOdkewW6WpRfg6vV_w@mail.gmail.com>
Jabber-ID: linkmauve@linkmauve.fr
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[linkmauve.fr];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[linkmauve@linkmauve.fr,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17011-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:mkchauras@gmail.com,m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.953];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linkmauve@linkmauve.fr,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[gmail.com,linkmauve.fr,kernel.org,garyguo.net,protonmail.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 3A0941701F2
X-Rspamd-Action: no action

On Sun, Feb 22, 2026 at 07:09:38PM +0100, Alice Ryhl wrote:
> On Tue, Feb 10, 2026 at 10:00 AM Mukesh Kumar Chaurasiya (IBM)
> <mkchauras@gmail.com> wrote:
> >
> > From: Link Mauve <linkmauve@linkmauve.fr>
> >
> > For now only Big Endian 32-bit PowerPC is supported, as that is the only
> > hardware I have.  This has been tested on the Nintendo Wii so far, but I
> > plan on also using it on the GameCube, Wii U and Apple G4.
> >
> > These changes aren’t the only ones required to get the kernel to compile
> > and link on PowerPC, libcore will also have to be changed to not use
> > integer division to format u64, u128 and core::time::Duration, otherwise
> > __udivdi3() and __umoddi3() will have to be added.  I have tested this
> > change by replacing the three implementations with unimplemented!() and
> > it linked just fine.
> >
> > Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
> > Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> 
> > diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> > index a58b1029592c..9fd82c75dcbd 100644
> > --- a/arch/powerpc/Makefile
> > +++ b/arch/powerpc/Makefile
> > @@ -61,6 +61,8 @@ else
> >  KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
> >  endif
> >
> > +KBUILD_RUSTFLAGS += --target=powerpc-unknown-linux-gnu
> 
> This needs to be a softfloat target.

Should we come back to describing the target like I did in my first
patch[1] in scripts/generate_rust_target.rs, or should I bring that to
Rust to create a powerpc-unknown-unknown-softfloat target upstream?  Or
is there a better third solution I’m not thinking of?

> 
> Alice
> 

[1] https://lore.kernel.org/rust-for-linux/20260204030507.8203-1-linkmauve@linkmauve.fr/

-- 
Link Mauve

