Return-Path: <linuxppc-dev+bounces-16757-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHbYG+HBimkeNgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16757-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 06:28:01 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7DA11718C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 06:27:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f997d2VBVz309N;
	Tue, 10 Feb 2026 16:27:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::433"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770701277;
	cv=none; b=L/GDocod6QEVyA95AUskvK44VONkMgOecSPn14LS1FbYguOtvO1NhB3NV/cTTyc4pHb0wRmUaG61mP7N/o+qAj9rpN3BpvLNirPplD34gKe0PjCkTKTY9Yw+TQ0HAGiGueVn2Tst/dTp68w0rEMQat65A6648wptxPuGy5zKMTTAQDQtcOD/5mQLSAE1jaUwBpkrwSyFycdDvfmQlE/zCp2KWXTu+s5L7wGVDNl70MWimQBowsqIs68CyVytow3ybn9VUgrvprdwRtYVB+BBp4Jc1OM13K3RSD/EQZ2XgSYZ1gqcgWLuv42d8L9Jg6DKnZFY5KrRnJbq7gl53dpcXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770701277; c=relaxed/relaxed;
	bh=ub/c+5nle4jo1LOlgEbt6FoOGItUZ21Wn4ncWd1nj3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PP4f0eoCCa7mBomSly+RdR53B2q1kzhaunWCPjNB3eBYYUErl1OmipNEuLCBWanAJ+P60EXssvMNP2Q0tSzSYNrFqRHKy3ymhMxVp5gJ7ce6HUbstwlchWmwdzHAXd8Gpuvo59+nJbta16rA9XYjYX28Yc7blaJl5n3ZarZ9nUC31Iy6ZVzvNCS1kRWnfq96Kue5m8luBoxRx2wKAVhKZb3mUyY8NFfD02HQlt3K2rfPTsHAaCuTTmnGmBZgzkgSLw6aFklHN9JTXdeM8CWj9HdAAlLlo4lPsV6oUFXP78WVVMPFOTocAe4NAZFsJqGHbF74O5knMSlGzQ4wqfCJCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F0bmLNFy; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F0bmLNFy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f997c2S1Fz2xN5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 16:27:55 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-823c56765fdso227977b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Feb 2026 21:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770701273; x=1771306073; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ub/c+5nle4jo1LOlgEbt6FoOGItUZ21Wn4ncWd1nj3w=;
        b=F0bmLNFyfNzYUIthoiKA9SdKRiwxpm+Tgv2n0/fztkRrx8gc7Z6zGl/uObM0rxXCYr
         gpSvVf+4ax69M2TmEqMUUIGSwz4kqUZYlM/LG12zVYIARu/mA3EDQlq+DjM8eglGtorj
         wjCe8SlAfJUdQs2oEFQr+adJ09H3nVT2GYePswTo7RaQQGsItdqytUrDAjlNfUktEBrQ
         /nmJ3pMb+tmDwr9MsMxKklApQbrtvWOOVJYPkFyM9dBdOULaw9kL9usPLRNeWTLGwzeK
         a1CpfwDb+ZEkIKmDc8fCLpRcGsB0lA9WCTCxzwspKdKwVS3w/GrqFW+AhQq09RNDsho8
         5Bow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770701273; x=1771306073;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ub/c+5nle4jo1LOlgEbt6FoOGItUZ21Wn4ncWd1nj3w=;
        b=uTD5+3HBAYd/PW7u6duFb+ZQY5n/IyNNwxX7lgTJkERl316lgUlGo5glecbpJpX/iK
         fCFm9c5EOJ8lgpULc38L9Ir11khJXunLDqIHTEph6qAhH64RbEjBRRs5iUsLwSDEyT3i
         WN4b9pq5kJ8tvbk/67ae1yaTQvxFMlsXfmC0P+md+1vzkuUKlCoCFEn88NFCx/DFz+R5
         +libeOzYm49pPHrGijX3dM0cYW+SJVepcYo38P3UqOYzY6Xoa3ssKNd6usCR1pxg4W44
         nOycciMQ2DaI0ZscvHgbQDZHCtDVwNpuWJgTNrKeaML15oFownm0Li13Dvryo9DbagHL
         /fzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdbw94kwmoYsQWrv6/iA0wDUu2nJZKJTbELxUQoMExa4Ag8pjkp33UwvrMAFiuie0o5XS9IgAJj9XowXY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzkceDPg1Zc14OTYgrE0GHzJ0AgTlB9722KtsS97fU8u8XyMPgr
	GdpJNJBpSQnMloa+QE81WWQWQCaRlANVXULoDSExxleM4occXRp3k0s9
X-Gm-Gg: AZuq6aIQxmz7fJ6k/wogjvTN94tzwhUa7Xde6DP18uL+wjix8v9DNi/jrNsdVjw3PZ6
	QRB63EcgaC5FpvvFSKKREhDy39tVJbhk/gRbv15mHSDa2EhU4aOA1HNDtV4NzMMbGYP6EDQxfHZ
	BsgrnlzBqe9n6BzBJcVaBvQwlS0qjT2Vyj7bgnBu53C75LbTxVmaAP7h4AEtkZKNObLMhX4bWaM
	vSw3BEjwGrcY40d4Lz3lbPSlAdyATM3KewByL1FUXEbruAYq1/dFzlJTWAgxNbNRCN1aM/hMyTs
	zJvaFHueLRE6wxYGoPaGTZsQEsrbgaBkkUymvxYN/1YsaZTnYr62o4LmHrep484YNNTwAFQHWvM
	mXvo4phY8wHDXYzo8PzHg2m2oCPJ95PmJJo67m4iQ3Nc6hCw6ToHlLFkZ0GkB5Oyhrjwv8QZ4KY
	ezZYN0yJfXv3bFnVkYBSzHotSdJP9CwzPsugd/czZkuaxsZ+nJBbe2DObFe9UYa8aYsh4=
X-Received: by 2002:a05:6a00:2381:b0:7e8:43f5:bd39 with SMTP id d2e1a72fcca58-824416f2b42mr12082799b3a.37.1770701273149;
        Mon, 09 Feb 2026 21:27:53 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8244152456asm12794630b3a.0.2026.02.09.21.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:27:52 -0800 (PST)
Date: Tue, 10 Feb 2026 10:57:44 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH V4 2/3] rust: Add PowerPC support
Message-ID: <aYrBU52OBCgR-chY@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:miguel.ojeda.sandonis@gmail.com,m:chleroy@kernel.org,m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:miguelojedasandonis@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-16757-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,linkmauve.fr,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: CC7DA11718C
X-Rspamd-Action: no action

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
Hey,

I'll put this as a note in out rust support issue on github.


> i.e. if I understand correctly, you prefer to not add the panicking
> intrinsics to `rust/compiler_builtins.rs`, which I agree isn't ideal.
> By the way, it would be nice if IBM could join one of the meetings
> with have with upstream Rust to raise this topic again with them.
> 
Sure, i'll try to join the call and bring this up.

> In any case, it is up to you, of course. My only concern on the Rust
> bits is on the docs side, the rest looks fine.
> 
> Thanks!
> 
> Cheers,
> Miguel

Regards,
Mukesh

