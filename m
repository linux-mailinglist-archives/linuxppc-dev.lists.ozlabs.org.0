Return-Path: <linuxppc-dev+bounces-13806-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 107B9C36145
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 15:34:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1nsK0Fkmz3bmk;
	Thu,  6 Nov 2025 01:34:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762353284;
	cv=none; b=gDjg0i/esNpm14M6ZkPSnve4f1XRmQJW+GGi1Yne97nizqCX99ZPhCzcI+S0Yt+4xeaaCHEuCbnlcpCY56xUfl4EbbwHVxWsd7nmJ8dMaTj2AwHXPuFV97lIfqbDlMqaPISedAjgl4mWjJk+rwg8IPz6hU6Ml++n60tDdS9epy6fgROY7flBjy2IBAxttCIv4p0BcMAoNaZ8Vfj9SlR2sxFUS8fgPLQwEcV1Q9/+H19etf+Y3mCdnZQ9OfS/xQL7QC/bx+ifL9pjsVSlcW2ueN7RptT/yC+kFI5iQMaAstCSWLuO/G/bW29qIXVwdxdXMQC7fLgmfasHEXgM/MK2nw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762353284; c=relaxed/relaxed;
	bh=G6DZt0IG7jUp3M/NuwlH6S9ylXXBqM+tUQv0TZtME1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ho8/pLCicuVoe0cFSRUh+Jhd21ZNc+3VWYjNAHZGBuZu7CavEqFmjEa+HIyTMTTASRvVN7Pja8cUBUs1pkCarDGqUDt1DShM9kHHPgtGAZBavKdPvwUExpfe+o84Fi9FhGMjsmddD9APEzfqZkK/dgCmde8zxrYShfB0TwLjIZMDye++q6IDyWEUbgVlg0Odp1EGeRxHDGuRWspi1pSYdjvrmwhvg6GOAQSM2VnKwzfp+LBC+Xe36Yha4CvC10wsQkyTT6X+fXU9ERR/usWWVDfkLTRkxJqoc2k37KJWP2+cKkWWmMYKiyPSE1dZiCqH++TgDsmUIYxLIF2y0Xjqfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eLG4m9XW; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eLG4m9XW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1nsJ1lHYz2yjp
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 01:34:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3DE656021F
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 14:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E37EAC4CEFB
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 14:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762353281;
	bh=Lws3O9Q9eWUWHaR1D9jjGEWwx/Fg3c+pD6vwOq6VklQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eLG4m9XWoTatrjavqtssn5k+xGF+Fior9Mu79vwdT032JLGEUoettavt8SEZnnlXQ
	 9TpVlHTRxRu42t45fqw9RT+vYwqSodHrasC29GJeriemWw5Se8fEiK0NaOD+mePinx
	 tECspgx27qGDxe3gA4E6QzWFA8NcAA1Rwf0PSlARHodGAN338DPS1PsA0tD2s/wdyB
	 GZ6icgXQC4z0vi3T+L+xYt2Ew9F06RYntrZ8rrKcQuyB0nxWl1YBKnmRNmG71c/gvB
	 r3eaOQIw1j6a8/CnIwO1nR4uI8bl59odYarSWc86IqMB63UAFXo9z5X3R3kHrMYjN6
	 2ZhagdvxF+Nog==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-37a492d3840so14344701fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Nov 2025 06:34:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXnAA4wl2WmVpr58y34tE/ZbN1chcnDH/iyk2n3Hy+HN8/5H+Oc68Ok4fgNhTaTUVntkGaClQX8X9vY4B8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyuQGQAg9v/UazWOTtaBz3jxmn27rcnaG04cF8Hwg0dUnehrMPa
	Dpqx8DeOOGNE+V1FTCaII4dVNS9gLRnySuJm39J/BRPhL1wWsZtTUwoJSpM3Rb8LVa/oOvu91lF
	wAnaPhou5E6w+MNb5+7L3RQO/AxMpcxc=
X-Google-Smtp-Source: AGHT+IEx5VuhTUzWGT5C3xk1ZCwXIz0HqLNQc4gHIQEVN/RV4yl9TQkUcvj3QI9yqUVwVZWCqZOKOmWyJ6CMatr8gc0=
X-Received: by 2002:a05:651c:1504:b0:372:904d:add4 with SMTP id
 38308e7fff4ca-37a51417cf6mr11398531fa.28.1762353280238; Wed, 05 Nov 2025
 06:34:40 -0800 (PST)
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
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk>
 <20251028004614.393374-23-viro@zeniv.linux.org.uk> <66300d81c5e127e3bca8c6c4d997da386b142004.camel@HansenPartnership.com>
 <20251028174540.GN2441659@ZenIV> <20251028210805.GP2441659@ZenIV>
 <CAMj1kXF6tvg6+CL_1x7h0HK1PoSGtxDjc0LQ1abGQBd5qrbffg@mail.gmail.com>
 <9f079d0c8cffb150c0decb673a12bfe1b835efc9.camel@HansenPartnership.com>
 <20251029193755.GU2441659@ZenIV> <CAMj1kXHnEq97bzt-C=zKJdV3BK3EDJCPz3Pfyk52p2735-4wFA@mail.gmail.com>
 <20251105-aufheben-ausmusterung-4588dab8c585@brauner>
In-Reply-To: <20251105-aufheben-ausmusterung-4588dab8c585@brauner>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 5 Nov 2025 15:34:28 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEt1i=4iGaum9MoQWMJT55LYxUd6=f+x=NKGCgz5vL4TQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnxYKD_q_DEqIXXuAAuvtynWG7mNNaOqPYQs_wBysPbMIk9Lu8V4S9c-i8
Message-ID: <CAMj1kXEt1i=4iGaum9MoQWMJT55LYxUd6=f+x=NKGCgz5vL4TQ@mail.gmail.com>
Subject: Re: [PATCH v2 22/50] convert efivarfs
To: Christian Brauner <brauner@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, 
	James Bottomley <james.bottomley@hansenpartnership.com>, linux-fsdevel@vger.kernel.org, 
	torvalds@linux-foundation.org, jack@suse.cz, raven@themaw.net, 
	miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org, linux-mm@kvack.org, 
	linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, kees@kernel.org, 
	rostedt@goodmis.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	paul@paul-moore.com, casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org, 
	john.johansen@canonical.com, selinux@vger.kernel.org, 
	borntraeger@linux.ibm.com, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 5 Nov 2025 at 12:48, Christian Brauner <brauner@kernel.org> wrote:
>
> On Thu, Oct 30, 2025 at 02:35:51PM +0100, Ard Biesheuvel wrote:
> > On Wed, 29 Oct 2025 at 20:38, Al Viro <viro@zeniv.linux.org.uk> wrote:
> > >
> > > On Wed, Oct 29, 2025 at 02:57:51PM -0400, James Bottomley wrote:
> > >
> > > > I think this all looks OK.  The reason for the convolution is that
> > > > simple_start/done_creating() didn't exist when I did the conversion ...
> > > > although if they had, I'm not sure I'd have thought of reworking
> > > > efivarfs_create_dentry to use them.  I tried to update some redundant
> > > > bits, but it wasn't the focus of what I was trying to fix.
> > > >
> > > > So I think the cleanup works and looks nice.
> > > >
> > > > >
> > > > > Relying on the -EEXIST return value to detect duplicates, and
> > > > > combining the two callbacks seem like neat optimizations to me, so
> > > > >
> > > > > Acked-by: Ard Biesheuvel <ardb@kernel.org>
> > > > >
> > > > > but I have to confess I am slightly out of my depth when it comes to
> > > > > VFS stuff.
> > > >
> > > > Yes, ack too.
> > >
> > >         Umm...  FWIW, I've got a few more followups on top of that (see
> > > #untested.efivarfs, current head at 36051c773015).  Not sure what would
> > > be the best way to deal with that stuff - I hope to get the main series
> > > stabilized and merged in the coming window.  Right now I'm collecting
> > > feedback (acked-by, etc.), and there's a couple of outright bugfixes
> > > in front of the series, so I'd expect at least a rebase to -rc4...
> > >
> >
> > I pulled your code and tried to test it. It works fine for the
> > ordinary case, but only now I realized that commit
> >
> > commit 0e4f9483959b785f65a36120bb0e4cf1407e492c
> > Author: Christian Brauner <brauner@kernel.org>
> > Date:   Mon Mar 31 14:42:12 2025 +0200
> >
> >     efivarfs: support freeze/thaw
> >
> > actually broke James's implementation of the post-resume sync with the
> > underlying variable store.
> >
> > So I wonder what the point is of all this complexity if it does not
> > work for the use case where it is the most important, i.e., resume
> > from hibernation, where the system goes through an ordinary cold boot
> > and so the EFI variable store may have gotten out of sync with the
> > hibernated kernel's view of it.
> >
> > If no freeze/thaw support in the suspend/resume path is forthcoming,
> > would it be better to just revert that change? That would badly
> > conflict with your changes, though, so I'd like to resolve this before
> > going further down this path.
>
> So first of all, this works. I've tested it extensively. If it doesn't
> work there's a regression.
>
> And suspend/resume works just fine with freeze/thaw. See commit
> eacfbf74196f ("power: freeze filesystems during suspend/resume") which
> implements exactly that.
>
> The reason this didn't work for you is very likely:
>
> cat /sys/power/freeze_filesystems
> 0
>
> which you must set to 1.
>

Yes, that does the trick, thanks.

But as James argued as well, this should not be an opt-in, at least
not for resume from hibernate: from the EFI firmware's PoV, it is just
a cold boot, and even the tiniest change in hardware state during boot
(docked vs undocked, USB drive plugged in, etc) could potentially
affect the state of the variable store. In practice, we are mostly
interested in some of the non-volatile variables to set the boot order
etc, so bad things rarely happen, but doing the sync unconditionally
is the safest choice here.

