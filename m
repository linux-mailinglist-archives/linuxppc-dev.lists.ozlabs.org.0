Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D7966BFC7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 14:29:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NwXtW27FMz3cdQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 00:29:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=QzG7PjWc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NwXsS1VyTz3bV1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 00:28:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3WX91qejGpsVe+BTTVWqlDspV1ielBR/ADdhl0/AtKo=; b=QzG7PjWcPxLw4/tmqmezWk8aBn
	pBJ4EqKrNT6uJNUcYnxh13ieXCiKeGn7/6oT8qRxi5gNIltu9KYa0EsL8lo/uoeL226HnX1u9BPmE
	A74YKueRDxUG8xipGk0ujcWtymHeOkvaDEXSw0KCzlPwXphLfxtR5kGV6WW8ZTy3WUC1omfXTtl7t
	7tO/FwR0rPIqBMmHRgAp77kOBQJYyfVU+Bi5q1qGMEosK3P7fgJq/xrxEbwJB+bM1HjK32vtkZ/TP
	h9CvuMt48vuRHdsI7bedqah2Z8cCA1R8ehXjISVSKIzdy7H5M5KZQFD+WLQEfDsoHyt7b/Ucafaon
	rNQRBiAg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHPX1-008ln6-MQ; Mon, 16 Jan 2023 13:28:11 +0000
Date: Mon, 16 Jan 2023 13:28:11 +0000
From: Matthew Wilcox <willy@infradead.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: ia64 removal (was: Re: lockref scalability on x86-64 vs
 cpu_relax)
Message-ID: <Y8VQ612fm0Wi4j4w@casper.infradead.org>
References: <CAMj1kXEqbMEcrKYzz2-huLPMnotPoxFY8adyH=Xb4Ex8o98x-w@mail.gmail.com>
 <db6937a1-e817-2d7b-0062-9aff012bb3e8@physik.fu-berlin.de>
 <CAMj1kXEtTuaNFiKWn3cJngR0J2vr0G07HR6+5PBodtr1b7vNxg@mail.gmail.com>
 <CA+icZUXEz7ZxmkV5bw5O2ORjF4bwDXBMyj3Wk_HST98gMPt97g@mail.gmail.com>
 <CA+icZUUhY7-F5Bpw-jxofhw4nMP3nzyfpt9huzeSWwUguguNsA@mail.gmail.com>
 <Y8NIYSMqAk7BhSv5@casper.infradead.org>
 <a6dda4b2-1124-7189-ecd8-9cf85c1b790d@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6dda4b2-1124-7189-ecd8-9cf85c1b790d@physik.fu-berlin.de>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Mateusz Guzik <mjguzik@gmail.com>, Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "Luck, Tony" <tony.luck@intel.com>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, Sedat Dilek <sedat.dilek@gmail.com>, Jan Glauber <jan.glauber@gmail.com>, "Torvalds, Linus" <torvalds@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 16, 2023 at 10:41:14AM +0100, John Paul Adrian Glaubitz wrote:
> On 1/15/23 01:27, Matthew Wilcox wrote:
> > More useful perhaps is to look at https://popcon.debian.org/
> > 
> > There are three machines reporting popcon results.  It's dead.
> 
> It's an opt-in mechanism that reports 190,000 machines running Debian
> on x86_64. Do you think that there are only 190,000 servers world-wide
> running Debian?

No.  I think there are so few ia64 machines still in operation that the
effort required to continue to support them is now too high relative
to the benefits.  We've dropped support for hardware that still exists
before, and we'll do it again.  The only question is when.

I still have two ia64 machines in my basement.  I've turned one of them
on once since 2009.  And that was because I had a bug I needed to track
down and fix (2018, commits 4b664e739f77 and 2879b65f9de8).
