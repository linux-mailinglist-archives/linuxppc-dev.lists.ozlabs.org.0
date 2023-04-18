Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCC86E6F18
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 00:06:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1J174kdgz3fRR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 08:06:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=dxQBhdcr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=dxQBhdcr;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1J0C6T2mz2yJQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Apr 2023 08:06:02 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E916D62ED1;
	Tue, 18 Apr 2023 22:05:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85911C433D2;
	Tue, 18 Apr 2023 22:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1681855559;
	bh=4TzxYQM54gPj6fAMyI3AyBzp+dk5LpFT94Xr5/gjrX0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dxQBhdcrCQd5w9R2wn/07cf7rhZ8iADKh1CjHqyiIBLZHS/f7OVNSf/gt8KG0CR7h
	 Oz4N9A9EESIVDc/zZIanRvYdJy6Kbh1WqoSbL45tIyDhAh0VZ2Gkw4aRGPne/24EZV
	 EG4PhaKU8uuzDbgnkxxKnbzEtY58uWS7osG7BkGw=
Date: Tue, 18 Apr 2023 15:05:57 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v3 02/14] arm64: drop ranges in definition of
 ARCH_FORCE_MAX_ORDER
Message-Id: <20230418150557.ea8c87c96ec64c899c88ab08@linux-foundation.org>
In-Reply-To: <ZDbp7LAHES3YFo30@arm.com>
References: <20230325060828.2662773-1-rppt@kernel.org>
	<20230325060828.2662773-3-rppt@kernel.org>
	<CAFxkdAr5C7ggZ+WdvDbsfmwuXujT_z_x3qcUnhnCn-WrAurvgA@mail.gmail.com>
	<ZCvQGJzdED+An8an@kernel.org>
	<CAFbkSA38eTA_iJ3ttBvQ8G4Rjj8qB12GxY7Z=qmZ8wm+0tZieA@mail.gmail.com>
	<ZDbp7LAHES3YFo30@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Zi Yan <ziy@nvidia.com>, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Justin Forbes <jforbes@fedoraproject.org>, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Mike Rapoport <rppt@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 12 Apr 2023 18:27:08 +0100 Catalin Marinas <catalin.marinas@arm.com> wrote:

> > It sounds nice in theory. In practice. EXPERT hides too much. When you
> > flip expert, you expose over a 175ish new config options which are
> > hidden behind EXPERT.  You don't have to know what you are doing just
> > with the MAX_ORDER, but a whole bunch more as well.  If everyone were
> > already running 10, this might be less of a problem. At least Fedora
> > and RHEL are running 13 for 4K pages on aarch64. This was not some
> > accidental choice, we had to carry a patch to even allow it for a
> > while.  If this does go in as is, we will likely just carry a patch to
> > remove the "if EXPERT", but that is a bit of a disservice to users who
> > might be trying to debug something else upstream, bisecting upstream
> > kernels or testing a patch.  In those cases, people tend to use
> > pristine upstream sources without distro patches to verify, and they
> > tend to use their existing configs. With this change, their MAX_ORDER
> > will drop to 10 from 13 silently.   That can look like a different
> > issue enough to ruin a bisect or have them give bad feedback on a
> > patch because it introduces a "regression" which is not a regression
> > at all, but a config change they couldn't see.
> 
> If we remove EXPERT (as prior to this patch), I'd rather keep the ranges
> and avoid having to explain to people why some random MAX_ORDER doesn't
> build (keeping the range would also make sense for randconfig, not sure
> we got to any conclusion there).

Well this doesn't seem to have got anywhere.  I think I'll send the
patchset into Linus for the next merge window as-is.  Please let's take
a look at this Kconfig presentation issue during the following -rc
cycle.

