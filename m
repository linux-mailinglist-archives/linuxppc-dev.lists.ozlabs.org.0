Return-Path: <linuxppc-dev+bounces-13540-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6078C1CC55
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 19:26:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxbKk33Bkz2yjm;
	Thu, 30 Oct 2025 05:26:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761762378;
	cv=none; b=MylhAIMKHSApbFPYLnn9oH6RVOR7mfqSsJHKaS7qCGmHMS05mp62N3sWgLskO3wT6c7dNoyoMNai3JYcL5EYsXBsFUR8+4jnGxwkHi0leWM+B+qv7JqlMaf0Rz7/pmv15o48Lj8vxZ94fYS7mSQr5Tp6pyQsqn3LH5WSiaXcZSreOKlU+Qx/luGawvGHyYVoloC5bPjpbcFqHj6wBDTPiJpg9UsjQu+g3uRP/DHJBhy4dB9g5miJ5OJMSmQP9QY3AvrUNebKPpZLUC8gjKyqelsVuhKz5qvTYE4RegpKmJaHIxZPmhVdMUBVdteGIbMCcnltYk92PCdBRJHfTm1KkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761762378; c=relaxed/relaxed;
	bh=2z56nIm+5e1IvigR9gpmQ54kGrlw/bMFXbXEDGYlOqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dyIMkwLyTlo8pgKIb0AkO0Rd65O9yEyvxFbWsd6TXOyz//iEvxjMdARvB92/U7kOIiTIdNBXDdt2sAHegsAS9xRyfwi//NpKN45le2WMHdYJqn5xm3XBsSW8czyIaAPCk8BnDsuXD1Wa6YPE8DDIk6Rh0N35KuLdrXAXrus9/qygmpS3RVCD+wvKTdcw4JCy2qS9/7v+2duMLAfWTmGO/4DmtMBARulwLxLGy4QYEdiT5Tg1zFm1tb297bV571s3wVND9Xhzhs11xANOkZOgJu6OSi/Y4/8NKjL2ZKznFrnf+1g4EwpPFewzzm1RC8BFJyLmwZNvffTVhJlSYNuCTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ndpPn+k4; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ndpPn+k4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxbKj4FP5z2xsq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 05:26:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EEB1B48B34
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 18:26:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFCBCC116B1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 18:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761762374;
	bh=SOFE0nE/iwywHZBzY2PA6i2R26wO5/VtY5Jl8lJ4X0I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ndpPn+k4EfUaw6fNwY0zWNL1ecVLo8aBHRZnSz07kFgD/dq8DvyELXxj76gXV4oVi
	 ktU0XjzrjKbY7uijyq0vT7UtIcjyb/ND1tDToftHHtDIAiRt0YVm3arL2lh8baMuAI
	 +vz8+RoK0Jww3pqJv+AvrM17kvv5Zn3eqLes/WMlFA/6VE5WWXYm60bfEKGra5Xg6r
	 thZTXHsYe14mAvd0C1rleJrkFPDe0BuI4HmI2JV5mxGnO4BhQlXQdt5qvo6Gy0KBaT
	 P6l6n7spmgQ3gWjfr6j6dtYxaD0JXVPuWt+vLn28H15m5YyfxxytbyH5B0vKNTckDF
	 7LduBId0jKXTw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-378d246f0f1so938171fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 11:26:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVqOp1f+yUNGBYKoJwBvuCmjD2BF6AGaH7vMPzfPPU3K7x2YxcyzvV07wW41/rrEL32gCY0B0x2buYE06s=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyFbD1q1RQQxoVpZbfy4qGw/04Nnay4MJeRYmiOKGMgxyElRaTy
	4GdfcHs+6PRir28noBxb/QOGFUJG3NXXgPvqbHXlup1Ztmr5xgdayBKchaOAKlkLAqrqy7r/lOK
	AwPIfB1WBxP9CpcEzfoktLKQk+xnJ6rY=
X-Google-Smtp-Source: AGHT+IGWFfmJwHuAqzPgZNMRZ1ozVQDIzy88Y1FgQVzyMri4R3xOByg4mInRl7CgPci19RHNrfDbNPxS6PSkoSTGQDU=
X-Received: by 2002:a05:651c:1986:b0:365:b79:8845 with SMTP id
 38308e7fff4ca-37a023ba9e9mr11427831fa.10.1761762372950; Wed, 29 Oct 2025
 11:26:12 -0700 (PDT)
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
 <CAMj1kXF6tvg6+CL_1x7h0HK1PoSGtxDjc0LQ1abGQBd5qrbffg@mail.gmail.com> <20251029180835.GT2441659@ZenIV>
In-Reply-To: <20251029180835.GT2441659@ZenIV>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 29 Oct 2025 19:26:01 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEB+W6wNDUnWeaeiuRqR-AKDwNhsoCAXokAEqRjSt7v7Q@mail.gmail.com>
X-Gm-Features: AWmQ_bl33W7u9Z27QoRt9V2mEw_lUKBXPTlGyVImKaOffP2I82t-eoqvuUfjNRY
Message-ID: <CAMj1kXEB+W6wNDUnWeaeiuRqR-AKDwNhsoCAXokAEqRjSt7v7Q@mail.gmail.com>
Subject: Re: [PATCH v2 22/50] convert efivarfs
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, linux-fsdevel@vger.kernel.org, 
	torvalds@linux-foundation.org, brauner@kernel.org, jack@suse.cz, 
	raven@themaw.net, miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org, 
	linux-mm@kvack.org, linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	kees@kernel.org, rostedt@goodmis.org, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, paul@paul-moore.com, casey@schaufler-ca.com, 
	linuxppc-dev@lists.ozlabs.org, john.johansen@canonical.com, 
	selinux@vger.kernel.org, borntraeger@linux.ibm.com, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 29 Oct 2025 at 19:08, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Tue, Oct 28, 2025 at 10:34:51PM +0100, Ard Biesheuvel wrote:
>
> > I'll let James respond to the specifics of your suggestion, but I'll
> > just note that this code has a rather convoluted history, as we used
> > to have two separate pseudo-filesystem drivers, up until a few years
> > ago: the sysfs based 'efivars' and this efivarfs driver. Given that
> > modifications in one needed to be visible in the other, they shared a
> > linked list that shadowed the state of the underlying variable store.
> > 'efivars' was removed years ago, but it was only recently that James
> > replaced the linked list in this driver with the dentry cache as the
> > shadow mechanism.
>
> Hmm...  Another question about that code: is efivar_get_variable()
> safe outside of efivar_lock()?

Not according to its kerneldoc

/*
 * efivar_get_variable() - retrieve a variable identified by name/vendor
 *
 * Must be called with efivars_lock held.
 */

But actually, I'm not convinced this is accurate. The reason for
locking at this level is mainly to ensure that a SetVariable() call
does not interfere with an ongoing enumeration calling
GetNextVariable() in a loop. The individual EFI runtime calls are
still serialized at a lower level, given that the firmware is not
reentrant, and so holding efivars_lock does not provide anything
meaningful for a GetVariable() call.

