Return-Path: <linuxppc-dev+bounces-14091-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A896C4D38C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 11:56:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5Nkv0JfGz30C6;
	Tue, 11 Nov 2025 21:56:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762858598;
	cv=none; b=fO1GG7iRyTF9bOZwpq3wjnGuHbUZ6b2jF5DafYQDKPuAY3GWjRSKzZeYY2P4n/xUtVzvK0KmOS7R9NdKvBGqe+xSZfliQivj5WeUkM002kTfOyqZAY1GzquqEEezKq1UvKk96K4BpJB2+E+Ibn3+qXRtXX/Jeufa4lWf2+Me9+nQih94shw2fdD/5TZHYJKcOA1hjQTS5vn4lDdHW+aMdbDbseFHMMmBfIM5w1XVh5GSomjOz+WL4tf5GzoME8d/CMYc1RjuorcpwYbqVfv87EiSBZjNqmmv1WqXaaqwxVKjfYAIm0752z0r4OQv5MbK5VNiq7O7iJhbSreljuzf+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762858598; c=relaxed/relaxed;
	bh=rjRq0YRtxMoRBmf76gnK3sXsLqWZGz3LL8//ivtwijk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZzIb02Q8K77IjQroo2b0x0AU2aaLSm0l8lLksOzNmRpSOTTyNKhnsAzmwmlaUmYdp3i8DFoIm2m6XQDb17tcxEuL1iHp0llARIRifZyJJD6M9+/HI++/XCXu8Y52OKIiAvSQBTeaYeBoAT1wOb4j+B4aXNUvWrkJP+WGi1vS9h5TzShAgFKwwU1Y1fI4kT7EYBHbFsgn/8GAbwAhH4avsepIYqHhv8XniskRfU3Tm5/LkTVR+FX8k8PL1gYydOkXgH72K0VsJQ8CKsXtlzI2jug1iOWTt6uRQxQZ4VTEtwRF7t4Le+Z149V51Y2ukKbEss6TtZAKyJy9tLK04SIxIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YKJFap5K; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YKJFap5K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5Nks6tZ2z2xFR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 21:56:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BF0FD61909;
	Tue, 11 Nov 2025 10:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 313A8C4CEF7;
	Tue, 11 Nov 2025 10:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762858594;
	bh=LLE8UQmsCCogkZVKSd1TLbVt9gs72Jh93jqozm60ebU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YKJFap5K6aImcv2glJeiNMSpxrwhX6LrxJE9jB2o/nF/WyKkn1WH6018FXJoi/UCP
	 kwILmx0XpLJxYnaUhsyl42/On0deramtMNIHMDakZ3XBWX3DBuNSISALizcXkP5J1g
	 As9tysDbaFlf4n4MhlGm4iCSknWQmP/uRA7y3UcgxHHrHNeSX1vdVQgCeGvYZzT/xd
	 4kN6IgSEXZHZeuWLm2Bdu2rfQ3za3HSpRsHwoEVGtapRsGF7Y0ZMbazAjnKP+Hw6s1
	 1ehJojThYLaGzj/AfbW9ZcFiZLxCIHI4qKUiP0ztlFxRlVs0DdQDmb3wCyvyfh4liI
	 CUKpd3rfxq+1w==
Date: Tue, 11 Nov 2025 11:56:27 +0100
From: Christian Brauner <brauner@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Ard Biesheuvel <ardb@kernel.org>, linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org, 
	jack@suse.cz, raven@themaw.net, miklos@szeredi.hu, neil@brown.name, 
	a.hindborg@kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, kees@kernel.org, rostedt@goodmis.org, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, paul@paul-moore.com, casey@schaufler-ca.com, 
	linuxppc-dev@lists.ozlabs.org, john.johansen@canonical.com, selinux@vger.kernel.org, 
	borntraeger@linux.ibm.com, bpf@vger.kernel.org
Subject: Re: [PATCH v2 22/50] convert efivarfs
Message-ID: <20251111-tolerant-profan-0aff1cc76691@brauner>
References: <20251028210805.GP2441659@ZenIV>
 <CAMj1kXF6tvg6+CL_1x7h0HK1PoSGtxDjc0LQ1abGQBd5qrbffg@mail.gmail.com>
 <9f079d0c8cffb150c0decb673a12bfe1b835efc9.camel@HansenPartnership.com>
 <20251029193755.GU2441659@ZenIV>
 <CAMj1kXHnEq97bzt-C=zKJdV3BK3EDJCPz3Pfyk52p2735-4wFA@mail.gmail.com>
 <20251105-aufheben-ausmusterung-4588dab8c585@brauner>
 <423f5cc5352c54fc21e0570daeeddc4a58e74974.camel@HansenPartnership.com>
 <20251105-sohlen-fenster-e7c5af1204c4@brauner>
 <20251105-vorbild-zutreffen-fe00d1dd98db@brauner>
 <20251109204018.GH2441659@ZenIV>
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
In-Reply-To: <20251109204018.GH2441659@ZenIV>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Nov 09, 2025 at 08:40:18PM +0000, Al Viro wrote:
> On Wed, Nov 05, 2025 at 02:43:34PM +0100, Christian Brauner wrote:
> 
> > -static void filesystems_freeze_callback(struct super_block *sb, void *unused)
> > +static void filesystems_freeze_callback(struct super_block *sb, void *bool_freeze_all)
> >  {
> > +	bool freeze_all = *(bool *)bool_freeze_all;
> > +
> >  	if (!sb->s_op->freeze_fs && !sb->s_op->freeze_super)
> >  		return;
> >  
> > +	if (!freeze_all) {
> 
> Minor nitpick: do we even need a dereference here?  Just check
> whether the argument is NULL and adjust the caller...

Yup, sounds good.

