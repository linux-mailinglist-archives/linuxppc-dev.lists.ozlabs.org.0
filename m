Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3672566AEE6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Jan 2023 01:28:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nvbc00ZBBz3fBV
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Jan 2023 11:28:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=cEsfEytJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=cEsfEytJ;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NvbZy1Pj2z3bZk
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Jan 2023 11:27:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2C00BT3n+YbTKiQeV33HXBf4b40S5kmIf4Iwv6fNwSI=; b=cEsfEytJF+y/mCwOWmsbB5zBf+
	QmCBVBptSk+O6m0cm4cfLPa5ShHQSCMlrhNHumJB6bgibUH/o/5BHwuE0K18BcHt3G3hO27KYlczD
	D3tPQMZa079DW8BpDz/T2NRRZgVn7hmL+VOJ732+Zl/dW5s9uHubN0DRj6fmOcRY8RG+LvRUyTvt9
	4/dYbVnu4AV9tYYPjerktwM/aFjoNl/PwWYVY3go6ass1frXujjw7g/4x4DBVwg4E+ek8E0wL59VN
	f/gulWhYFDavCFogA4T8Y13KaVGrW3FngLR+qH64YlPfqnAl3YPcrqODSv79K+0UFd0ZIvFhpwLz/
	qPDkfI6Q==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGqrh-007QIv-F1; Sun, 15 Jan 2023 00:27:13 +0000
Date: Sun, 15 Jan 2023 00:27:13 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: ia64 removal (was: Re: lockref scalability on x86-64 vs
 cpu_relax)
Message-ID: <Y8NIYSMqAk7BhSv5@casper.infradead.org>
References: <CAMj1kXEqbMEcrKYzz2-huLPMnotPoxFY8adyH=Xb4Ex8o98x-w@mail.gmail.com>
 <db6937a1-e817-2d7b-0062-9aff012bb3e8@physik.fu-berlin.de>
 <CAMj1kXEtTuaNFiKWn3cJngR0J2vr0G07HR6+5PBodtr1b7vNxg@mail.gmail.com>
 <CA+icZUXEz7ZxmkV5bw5O2ORjF4bwDXBMyj3Wk_HST98gMPt97g@mail.gmail.com>
 <CA+icZUUhY7-F5Bpw-jxofhw4nMP3nzyfpt9huzeSWwUguguNsA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+icZUUhY7-F5Bpw-jxofhw4nMP3nzyfpt9huzeSWwUguguNsA@mail.gmail.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Mateusz Guzik <mjguzik@gmail.com>, Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "Luck, Tony" <tony.luck@intel.com>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, Jan Glauber <jan.glauber@gmail.com>, "Torvalds, Linus" <torvalds@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jan 14, 2023 at 12:28:30PM +0100, Sedat Dilek wrote:
> [ ... ]
> 
> > Best is to ask the Debian release-team or (if there exist) maintainers
> > or responsibles for the IA64 port - which is an ***unofficial*** port.
> >
> 
> Here we go:
> 
> https://lists.debian.org/debian-ia64/
> 
> Posting address: debian-ia64@lists.debian.org
> 
> Found via <https://lists.debian.org/completeindex.html>

More useful perhaps is to look at https://popcon.debian.org/

There are three machines reporting popcon results.  It's dead.
