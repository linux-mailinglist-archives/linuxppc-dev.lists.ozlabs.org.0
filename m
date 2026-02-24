Return-Path: <linuxppc-dev+bounces-17086-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBpXGswvnWkDNQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17086-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 05:57:48 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C10181C10
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 05:57:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKlpJ0pg7z3cDh;
	Tue, 24 Feb 2026 15:57:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771909064;
	cv=none; b=GIoslQSG4xKS5KipUi19E2w2aiXIJkyd6Kbb0AouzA8Bq9GfepkFOxLikoVofC1YEHDfbZhSBrBsVYFDdYH3FMjaQQCi6IS3/FiTVVHTIdiEZeG04rhhxIJj+z4EjSm0ky0L9fNugRFxfiflqES6dtVmrfWw+LC4itcYRlCa77ZOfI9xyBqyhakqLrKbs38hd71AgUKw4XvvhY1grSpoNUQBBNT+LSunrnHBsktGYWeQUfItn//fkgDy1mZ8eOKwcqH7Res8fptyXwX85kkN77szS6y6FheunSgzLZm0dT2/aHl1fANOZGyxKLzZHkBSiYPquBBlMHmi/LaLd+/kOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771909064; c=relaxed/relaxed;
	bh=SO/dk+j9JcFFZVxUw1AfWihYUjLrsfUxcptuevFkjZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JnQxfZh5yY3WgIa73v4nQY/d8DEBIl+jt9N/1MNtbx4ZH1ggpQOUdYRYvEW9q8DnC2lf7Wlbk0Z7tjV8WV1l8SXMiLjk9gwJRJO9Q9ahTVr49EOCaJ4ZP+yChN56vpZnIw9WbJ4SAANKzxbywVypD/v/5Ac7ZCTWSv4EdMDtu6Q3tnlqdwlCBz/MJKA5w8hvgD1TcWfeD8QKNtayXhMYAzBFcBqKY5z9aOTWfB/hGdVJsHPzYe2G3ex0FI0iwdEwGNhza4PgkTcTjkiAbLZYnoFUGBxnkOkUwItg2n9jDoMi6McXLT53n62VO5AjpR8fVKM5DkdL6F1rApJsW3zGsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WBk6xw+3; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WBk6xw+3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKlpG3bHQz3cBN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 15:57:41 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2aad1bb5058so52652275ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 20:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771909054; x=1772513854; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SO/dk+j9JcFFZVxUw1AfWihYUjLrsfUxcptuevFkjZs=;
        b=WBk6xw+3tswt8NOXd+/ULuNFreyiejliHYGpIXQbOvp1bxxzBEWHhfaACmnAG7I3RN
         X3x7mxBcXNBQc6GTe6GhliPsliIIS6nD97+FDIR9xt+hR+hMnueskeZoIWaUry8oKTwP
         LwB+Rdg72YAGgiTZc6hwnjfWtcGD8gcjeKR3dCGG/cYgwkig2j9UmU6p7dHeL4MaptNU
         bWjZbO16Hhd3iSu1Tj3NluNlZ+YfJ+baFT/E+9IROLoVWZoVktmL8z9jRGLkQXy0HkA4
         U9IM6pklDeQxGeZ2mCZmFeDX3O57ggCtKmrSIS30I08AiHo48Xd9QHXrgOnuOjIc0esk
         cQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771909054; x=1772513854;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SO/dk+j9JcFFZVxUw1AfWihYUjLrsfUxcptuevFkjZs=;
        b=XgQg3IB6L3IR16z4uXIIr70IcOiWmNoXTpjcVGjqSQiA0K8didEV/TniP9x5H6OUHt
         H86O8OneAtrh8G/op8f8B+KQF6M9eQp/DSiaCkS6xNLx24qnTjvO88WzZfHAW3woQ+z+
         ichV9vEzxqgTFu+CJtm5LSfWnTC/9ERKs5IwrottNs/VEGJQ4vTo8qIwo2p1DwYi+DBd
         XAYGf5y91VbJQAZUk+DbZYEnfOkMfmq/wBpa3/YreggbMco4bTBaH2m8Ray2yreaNJfG
         xTtf6SuDWobWyEZz2C/skmUXL8mcW9s+eJ4hkvMimn9dGYoA5WItIc2VknV7BXO69nx/
         W7mw==
X-Forwarded-Encrypted: i=1; AJvYcCVIgGDISIzlFOMtRi0t9C54V+AKXgIkWmVVqvfZUbZOhx9smQoJnwHwNHJIFBkrQ5/VTChT/shQouSfkX4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz/mmFes2KLHlNu2WNWeyyAHH++oMCuD5beRDNqW993pZwZ3/yx
	qYnWIVrbFDZYRNbhG30bzFj2GUc7JV7982Y26iPIXUVv0mS/dZcoCm9Y
X-Gm-Gg: ATEYQzwj4yoCNqTsNcR+Nd949vJmmTGvKSPx/K2mzVfsYyeuVjtzDvtanu5ZLwE19FG
	lW04x3A0gNrK7trNgJIJoy62e9rinOZ8Deuve0+ei4BspQr4gfWPNRGY/+BN2K13+spkeN6DNnW
	gHWPLdw9H+EKpkf7ah7n3Lq6CUDlOBq10yZA/WlQKTWS8gIU7yJTMs+uFu0HsJCJN+/cDr/HcXm
	7gUUUbK6NVaS8Q9lpJGhY2PbDMet5hgJ91p2jvZ7+F4HZdEdGKYBsAkO5gMR26T4+fQB7atpIFN
	wnAFqOWQLZqfEzf3AkbxDJwHYJSnZDWveLX6R6Q42ubZmO80qMBy0JF34agOf8RFcG5SEjbvVI0
	Q1geJ41PXmoK1TeLrXnUke2f5XISf5B+1YchyMNovN1GTMszEJCc9rYQbNkvsWtKLOIJtpospmP
	b47mmoBZgkXWNxV/be59ZOHOOwjhG5wLyrt/VijM+mLSiwVQfOnOVW/UZioeZnWgwrOO2q
X-Received: by 2002:a17:903:1ac8:b0:2aa:e0bd:1c7 with SMTP id d9443c01a7336-2ad743fb72dmr97466665ad.12.1771909054457;
        Mon, 23 Feb 2026 20:57:34 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([103.77.1.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7505bf1asm91807365ad.92.2026.02.23.20.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 20:57:34 -0800 (PST)
Date: Tue, 24 Feb 2026 10:27:24 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Link Mauve <linkmauve@linkmauve.fr>, ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH V6 2/3] rust: Add PowerPC support
Message-ID: <aZ0vXT2OAOeZ7AnS@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260210090023.2587534-1-mkchauras@gmail.com>
 <20260210090023.2587534-3-mkchauras@gmail.com>
 <CAH5fLgi3Owm4=4g8wQ5Rnr7Y63XJ1D8apOdkewW6WpRfg6vV_w@mail.gmail.com>
 <aZtT4MH0Q8Ic9ZiM@luna>
 <CANiq72nEam8n_daX5LyYrpH=i71k+pb+HLn6EEPdJJc-Zi9Q3A@mail.gmail.com>
 <aZu6cSqnvO91w1m4@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aZwcWfYkBnivrgNa@google.com>
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
In-Reply-To: <aZwcWfYkBnivrgNa@google.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-17086-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:miguel.ojeda.sandonis@gmail.com,m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:miguelojedasandonis@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[gmail.com,linkmauve.fr,kernel.org,garyguo.net,protonmail.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com:mid,linkmauve.fr:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: D2C10181C10
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 09:22:33AM +0000, Alice Ryhl wrote:
> On Mon, Feb 23, 2026 at 07:56:02AM +0530, Mukesh Kumar Chaurasiya wrote:
> > On Sun, Feb 22, 2026 at 08:11:17PM +0100, Miguel Ojeda wrote:
> > > On Sun, Feb 22, 2026 at 8:07 PM Link Mauve <linkmauve@linkmauve.fr> wrote:
> > > >
> > > > Should we come back to describing the target like I did in my first
> > > > patch[1] in scripts/generate_rust_target.rs, or should I bring that to
> > > > Rust to create a powerpc-unknown-unknown-softfloat target upstream?  Or
> > > > is there a better third solution I’m not thinking of?
> > > 
> > > We are trying to stop using the custom target specs, so we should ask
> > > upstream to give you a built-in target you can use (or equivalently, a
> > > flag to do what you need, but I think the idea is to not have such a
> > > flag).
> > > 
> > > i.e. even if you used the custom target JSON, we would still need to
> > > ask, since the goal is to remove that script entirely.
> > 
> > I think, disabling altivec, fpu and vsx with compiler flag will work.
> > 
> > What are your opinion on this?
> 
> I think you can and should submit a PR to add a softfloat target to
> upstream Rust right now, and I believe there should be no issue in
> accepting that.
> 
> If there's a workaround we can use on existing compiler versions without
> the target, that's great too, but we should get the target in upstream
> asap.
Cool, sounds good.

Regards,
Mukesh
> 
> Alice

