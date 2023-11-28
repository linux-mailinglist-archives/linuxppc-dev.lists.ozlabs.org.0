Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 486607FBEA3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Nov 2023 16:53:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qhCM0efN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sfn6t5Pzdz3cZx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 02:53:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qhCM0efN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sfn6274xYz2ygX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 02:52:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 7A7D2B810A8;
	Tue, 28 Nov 2023 15:52:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69B3AC433C7;
	Tue, 28 Nov 2023 15:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701186757;
	bh=W49ajMFtN9aTN86Tnl430idPA/txjACjmrkpyxn3DE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qhCM0efNQ55/CadBsgmu3A+z7I663gGmRlop+aHtsSVP3W3KCJxS4fFnJj2rO9RpG
	 y+R924PIXTrR+evJd3GTxqaL5irmDkrqNbRWw9SV1YHNS71I8J/El1OHEQtPkEIRyr
	 Afc1O5Xcnr2agGFbz1OiKZ75NeDBlttGNDF5zEkddR7IRkSJ/bYJXRhvwXvYTDouWl
	 WOc9GyV32DURezCRx7CTi+a6DGNmgsBWfsB2RHkt8xIdcAxiZzDkyVQICDB2vFML3C
	 hmh8wYtpto+fz3KlsQeu2I/pmzyU/Po0vKVV7MZySBCX95gqixVMLw42/5bpJlCqj3
	 T2wz5oaTTY4Gw==
Date: Tue, 28 Nov 2023 16:52:31 +0100
From: Christian Brauner <brauner@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [linus:master] [file] 0ede61d858: will-it-scale.per_thread_ops
 -2.9% regression
Message-ID: <20231128-serpentinen-sinnieren-e186ea8742e9@brauner>
References: <202311201406.2022ca3f-oliver.sang@intel.com>
 <CAHk-=wjMKONPsXAJ=yJuPBEAx6HdYRkYE8TdYVBvpm3=x_EnCw@mail.gmail.com>
 <CAHk-=wiCJtLbFWNURB34b9a_R_unaH3CiMRXfkR0-iihB_z68A@mail.gmail.com>
 <20231127-kirschen-dissens-b511900fa85a@brauner>
 <CAHk-=wgwpzgoSYU9Ob+MRyFuHRow4s5J099=DsCo1hGT=bkCtw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wgwpzgoSYU9Ob+MRyFuHRow4s5J099=DsCo1hGT=bkCtw@mail.gmail.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: feng.tang@intel.com, lkp@intel.com, Jann Horn <jannh@google.com>, intel-gfx@lists.freedesktop.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, fengwei.yin@intel.com, gfs2@lists.linux.dev, linux-fsdevel@vger.kernel.org, kernel test robot <oliver.sang@intel.com>, ying.huang@intel.com, oe-lkp@lists.linux.dev, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 27, 2023 at 09:10:54AM -0800, Linus Torvalds wrote:
> On Mon, 27 Nov 2023 at 02:27, Christian Brauner <brauner@kernel.org> wrote:
> >
> > So I've picked up your patch (vfs.misc). It's clever alright so thanks
> > for the comments in there otherwise I would've stared at this for far
> > too long.
> 
> Note that I should probably have commented on one other thing: that
> whole "just load from fd[0] is always safe, because the fd[] array
> always exists".

I added a comment to that effect in the code.

> 
> IOW, that whole "load and mask" thing only works when you know the
> array exists at all.
> 
> Doing that "just mask the index" wouldn't be valid if "size = 0" is an
> option and might mean that we don't have an array at all (ie if "->fd"
> itself could be NULL.
> 
> But we never have a completely empty file descriptor array, and
> fdp->fd is never NULL.  At a minimum 'max_fds' is NR_OPEN_DEFAULT.
> 
> (The whole 'tsk->files' could be NULL, but only for kernel threads or
> when exiting, so fget_task() will check for *that*, but it's a
> separate thing)

Yep.

> 
> So that's why it's safe to *entirely* remove the whole
> 
>                 if (unlikely(fd >= fdt->max_fds))
> 
> test, and do it *all* with just "mask the index, and mask the resulting load".

Yep.
