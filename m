Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5947F9D3B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 11:14:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gua2LBTg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sf1df0yS3z3cYj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 21:13:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gua2LBTg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sf1cr1kf8z3cCl
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Nov 2023 21:13:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 93D04B817DF;
	Mon, 27 Nov 2023 10:13:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8059AC433C7;
	Mon, 27 Nov 2023 10:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701079987;
	bh=fGgNP5lLqq06gIKE/Ay6zDb25xpoQWkuhpClm6E4Od8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gua2LBTgox+kA/7qWhP6aBawjywyAf4plI5DEpsh3Ijh1TglJVJalcbdoLVzj+4dc
	 QSMDDVQUYBZq1RQQekKvMiY6PsTT6dCQ73qwrTxCOVqua3ItxtNNh1CT5mMK1rwkOo
	 pNmaaaZz8ibyvGn9pVWA4lfTSRxkUENw1NZF/9NxE7CpRhALbo9b8kxwPL+7e+tpwW
	 hsJPsy3p5qFhBnTvSRETrsFsNAloxWs+4rOiSkqNw7cPppUIDXmoc2h/jD710Ik/tG
	 IqbNDJzviU6gnDPxieDGBRlc5nKcmAT2tWnTWaAy3wiDb1nqr1v6ODL4SEN8gHX01N
	 FGTK2menaKnbw==
Date: Mon, 27 Nov 2023 11:13:00 +0100
From: Christian Brauner <brauner@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [linus:master] [file] 0ede61d858: will-it-scale.per_thread_ops
 -2.9% regression
Message-ID: <20231127-protokollieren-ermuntern-748cc3855fe8@brauner>
References: <202311201406.2022ca3f-oliver.sang@intel.com>
 <CAHk-=wjMKONPsXAJ=yJuPBEAx6HdYRkYE8TdYVBvpm3=x_EnCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wjMKONPsXAJ=yJuPBEAx6HdYRkYE8TdYVBvpm3=x_EnCw@mail.gmail.com>
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

> I took a look at the code generation, and honestly, I think we're
> better off just making __fget_files_rcu() have special logic for this
> all, and not use __get_file_rcu().

My initial massaging of the patch did that btw. Then I sat there
wondering whether it would matter if we just made it possible to reuse
that code and I went through a bunch of iterations. Oh well, it seems to
matter.

> Comments? I also looked at that odd OPTIMIZER_HIDE_VAR() that

Concept looks sane to me.

> __get_file_rcu() does, and I don't get it. Both things come from
> volatile accesses, I don't see the point of those games, but I also
> didn't care, since it's no longer in a critical code path.
> 
> Christian?

Puts his completely imagined "I understand RCU head on".
SLAB_TYPESAFE_BY_RCU makes the RCU consume memory ordering that the
compiler doesn't officialy support (afaik) a bit wonky.

So the thinking was that we could have code patterns where you could
free the object and reallocate it while legitimatly passing the pointer
recheck. In that case there is no memory ordering between the allocation
and the pointer recheck because the last (re)allocation could have been
after the rcu_dereference().

To combat that all future loads were made to have a dependency on the
first load using the hidevar trick.

I guess that might only be theoretically possible but not in practice?
But then I liked that we explicitly commented on it as a reminder.
