Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A9A6A54F5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 09:59:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQrry57vnz3cDM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 19:59:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=dvFldP2n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=dvFldP2n;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQrr02KF8z3bg5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 19:58:23 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 378F660FDD;
	Tue, 28 Feb 2023 08:58:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24246C433D2;
	Tue, 28 Feb 2023 08:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1677574699;
	bh=UztsLsaqmIXyoCT63yUOOYX/F2RBn+tEboh82iUTl84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dvFldP2nDPK1JM1UdTSvrNFQgLKdCKwOzfkHHphaxtZJbfiOb+x1w8SgrPHVVLpTM
	 0+DGxsyLVGr/st2iaB5VqG6eeN9RmbwrKyu1S1M0ogYouEhMNuHsdIhPyL2tnEfVU1
	 gTZGjIJffgoh26CK72V24tXXKN+/RvSZ3yTVgjyc=
Date: Tue, 28 Feb 2023 09:58:16 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tom Saeger <tom.saeger@oracle.com>
Subject: Re: [PATCH 5.15 v2 1/5] arch: fix broken BuildID for arm64 and riscv
Message-ID: <Y/3CKO8XjvyMlg+5@kroah.com>
References: <20230210-tsaeger-upstream-linux-stable-5-15-v2-0-6c68622745e9@oracle.com>
 <20230210-tsaeger-upstream-linux-stable-5-15-v2-1-6c68622745e9@oracle.com>
 <Y/c3MSvnN4DcvzSx@kroah.com>
 <20230223175331.7tsgvkvcur6wl7h7@oracle.com>
 <20230224024724.whvtsrljz5k3jpln@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224024724.whvtsrljz5k3jpln@oracle.com>
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
Cc: Sasha Levin <sashal@kernel.org>, linux-arch@vger.kernel.org, Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Dennis Gilmore <dennis@ausil.us>, Naresh Kamboju <naresh.kamboju@linaro.org>, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Nathan Chancellor <nathan@kernel.org>, linux-riscv@lists.infradead.org, stable@vger.kernel.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 23, 2023 at 08:47:24PM -0600, Tom Saeger wrote:
> On Thu, Feb 23, 2023 at 11:53:42AM -0600, Tom Saeger wrote:
> > On Thu, Feb 23, 2023 at 10:51:45AM +0100, Greg Kroah-Hartman wrote:
> > > On Fri, Feb 10, 2023 at 01:18:40PM -0700, Tom Saeger wrote:
> > > > From: Masahiro Yamada <masahiroy@kernel.org>
> > > > 
> > > > commit 99cb0d917ffa1ab628bb67364ca9b162c07699b1 upstream.
> > > > 
> > > > Dennis Gilmore reports that the BuildID is missing in the arm64 vmlinux
> > > > since commit 994b7ac1697b ("arm64: remove special treatment for the
> > > > link order of head.o").
> > > > 
> > > > The issue is that the type of .notes section, which contains the BuildID,
> > > > changed from NOTES to PROGBITS.
> > > > 
> > > > Ard Biesheuvel figured out that whichever object gets linked first gets
> > > > to decide the type of a section. The PROGBITS type is the result of the
> > > > compiler emitting .note.GNU-stack as PROGBITS rather than NOTE.
> > > > 
> > > > While Ard provided a fix for arm64, I want to fix this globally because
> > > > the same issue is happening on riscv since commit 2348e6bf4421 ("riscv:
> > > > remove special treatment for the link order of head.o"). This problem
> > > > will happen in general for other architectures if they start to drop
> > > > unneeded entries from scripts/head-object-list.txt.
> > > > 
> > > > Discard .note.GNU-stack in include/asm-generic/vmlinux.lds.h.
> > > > 
> > > > Link: https://lore.kernel.org/lkml/CAABkxwuQoz1CTbyb57n0ZX65eSYiTonFCU8-LCQc=74D=xE=rA@mail.gmail.com/
> > > > Fixes: 994b7ac1697b ("arm64: remove special treatment for the link order of head.o")
> > > > Fixes: 2348e6bf4421 ("riscv: remove special treatment for the link order of head.o")
> 
> Greg, how about something like this tacked onto backport of this commit?
> 
> [Tom: stable backport 5.15.y, 5.10.y, 5.4.y]
> 
> Though the above "Fixes:" commits are not in this kernel, the conditions
> which lead to a missing Build ID in arm64 vmlinux are similar.
> 
> Evidence points to these conditions:
> 1. ld version > 2.36 (exact binutils commit documented in a494398bde27)
> 2. first object which gets linked (head.o) has a PROGBITS .note.GNU-stack segment
> 
> These conditions can be observed when:
> - 5.15.60+ OR 5.10.136+ OR 5.4.210+
> - AND ld version > 2.36
> - AND arch=arm64
> - AND CONFIG_MODVERSIONS=y
> 
> This was previously bisected to the stable backport of 0d362be5b142.
> Follow-up experiments were discussed here: https://lore.kernel.org/all/20221221235413.xaisboqmr7dkqwn6@oracle.com/ 
> which strongly hints at condition 2.
> 
> 
> > > 
> > > Why are we adding a commit to 5.15.y that fixes an issue that only
> > > showed up in 6.1.y?
> 
> If you approve - I'll send v3 for 5.15, 5.10, and 5.4 (with style fixes).

That would make more sense, thanks.

greg k-h
