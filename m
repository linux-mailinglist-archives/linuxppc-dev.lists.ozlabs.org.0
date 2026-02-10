Return-Path: <linuxppc-dev+bounces-16770-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SM6CB4b9imlyPAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16770-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 10:42:30 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2986511902F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 10:42:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9Gn93vyKz30N8;
	Tue, 10 Feb 2026 20:42:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=82.65.109.163
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770716541;
	cv=none; b=mIwf86/U+DNRLSoaRq5OEnqKbM4rtzGmjiM1CGXuJ0Eh2YbY5+qLaCdDyJLiq7oLPcHPmeGWfLojJp8iKKHOn7Yr4xTk5f0LgBLbKNrC/9/yRDwWH9ZtV59zzVFKBKlKblSCl7rcC1/tSQAdgepmckFxiVYVOXeAJJJHIcAytVmKbHpzXkbQ8TTqoi2X7WZ6sMdDNYsY2C4bnmIFk8GxFxEtFblMZ0W1aSybzxiUvtO87Wdz/FpATLaWJIvtCjRmnrwUrrM4hgvXr3K1XkYLPkGIOCWaij4RuYjy86BG0DGHJB6I4MV0VQ/pDAIhIyvQPx/Wu6NIwg+CzqbdBb9J7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770716541; c=relaxed/relaxed;
	bh=EG0zXJ8ltsyxJXATW/asHing3gKZtEbi10dCNb045iI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lahIZHOnCStqS1R8auo5Tcn1TQX188VM1ADpQDRYaG0qZUe97GTI+UPM7GknEMViKf4bpOYoMD3v3Nngff82JFFYrQQnTWcWSUb8gdCA9YPvUQcwBZ3F5oL+CfrHZqP9pm2UzPt9KSYGEK9o0tPSyd50uwfaal7aC8lZPicf02OS+2Q91mkr7HA1/jh3FwpxaUicMgM8pTjOt3Vne3WkIQC7InGXNhCbA9IEzkx/9LMct7fQQ5w5LtejyXHk4OCbJeSUb4fY8uTEWnShfbcxp5g7tOkO7IrVGg/J3f1AqcEGGIwTV74+rV5EvnPlbrM6xs+arD80JlOLiaeEtjkVhA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass (client-ip=82.65.109.163; helo=luna.linkmauve.fr; envelope-from=linkmauve@linkmauve.fr; receiver=lists.ozlabs.org) smtp.mailfrom=linkmauve.fr
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linkmauve.fr (client-ip=82.65.109.163; helo=luna.linkmauve.fr; envelope-from=linkmauve@linkmauve.fr; receiver=lists.ozlabs.org)
Received: from luna.linkmauve.fr (luna.linkmauve.fr [82.65.109.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9Gn83BQHz30M6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 20:42:19 +1100 (AEDT)
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 7ACCEF43B79; Tue, 10 Feb 2026 10:42:11 +0100 (CET)
Date: Tue, 10 Feb 2026 10:42:11 +0100
From: Link Mauve <linkmauve@linkmauve.fr>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
	linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, peterz@infradead.org,
	jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org,
	ardb@kernel.org, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH V4 2/3] rust: Add PowerPC support
Message-ID: <aYr9c90CWAXZ3AVl@luna>
References: <20260209105456.1551677-1-mkchauras@gmail.com>
 <20260209105456.1551677-3-mkchauras@gmail.com>
 <CANiq72nqH=H4a_Yo17KPmku5pPRMVRBADgj8j+=TcR=3r0vOdQ@mail.gmail.com>
 <b07f1bc6-c63e-4b97-95d6-c639186a89dd@kernel.org>
 <CANiq72nkVmE_91yz82e1cRuJK8F9SPP5GpD1mT=NYLBbRTL8OQ@mail.gmail.com>
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
In-Reply-To: <CANiq72nkVmE_91yz82e1cRuJK8F9SPP5GpD1mT=NYLBbRTL8OQ@mail.gmail.com>
Jabber-ID: linkmauve@linkmauve.fr
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[linkmauve.fr];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:miguel.ojeda.sandonis@gmail.com,m:chleroy@kernel.org,m:mkchauras@gmail.com,m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:miguelojedasandonis@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linkmauve@linkmauve.fr,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linkmauve.fr,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linkmauve@linkmauve.fr,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16770-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 2986511902F
X-Rspamd-Action: no action

Hi,

On Mon, Feb 09, 2026 at 01:48:01PM +0100, Miguel Ojeda wrote:
> On Mon, Feb 9, 2026 at 1:29 PM Christophe Leroy (CS GROUP)
> <chleroy@kernel.org> wrote:
> >
> > As far as I understand the patch is complete, the problem is outside the
> > kernel, it is in the libcore provided by rust or the rust compiler.
> >
> > That libcore seems to call __udivdi3() and __umoddi3() which are not
> > provided by the kernel. Instead if should call the functions do_div()
> > and friends provided by include/asm-generic/div64.h, or provide
> > __udivdi3() and __umoddi3() on its own.
> 
> Yeah, but what I mean is, should we add this if it doesn't link,
> especially without a note or comment of some kind? (Perhaps to your
> tracking issue in GitHub?)
> 
> i.e. if I understand correctly, you prefer to not add the panicking
> intrinsics to `rust/compiler_builtins.rs`, which I agree isn't ideal.
> By the way, it would be nice if IBM could join one of the meetings
> with have with upstream Rust to raise this topic again with them.

I’m just an unemployed contributor, with no ties to any of that but
sheer interest, would it be ok for me to join that call as well?  I am
interested in resolving that issue in core, only three types have that
issue and only in their formatting code so far.

> 
> In any case, it is up to you, of course. My only concern on the Rust
> bits is on the docs side, the rest looks fine.
> 
> Thanks!
> 
> Cheers,
> Miguel
> 

-- 
Link Mauve

