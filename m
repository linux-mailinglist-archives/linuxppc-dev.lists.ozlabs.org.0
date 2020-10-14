Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 501D428D9B5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 07:54:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CB1ng5y4DzDqg9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 16:54:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+b5550e02a2edd4696799+6261+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=OMo7hmfN; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CB1kg619DzDqkb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Oct 2020 16:51:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Zj/mSELh0gkQiJzxNFapB7VTFgX/SPaMVeSie4q6aLI=; b=OMo7hmfNufPo6rVhRGuQHzLQ0b
 1VAPwm7au3dwZhP2U8KCBzhdLGuGCJg4Y6BujKWfQq2J1qHSQizXWY3eydQmN9Z/I4vBdS6zYKs5j
 8G4vo2y4z0B+BuZzAKnFd/zlkgAkwf4/KGUd29HlOFzuWZb9K09Z7harllEIKARBJ+lNl3gcIyJwx
 IgDSWugwC2Wi8bsLi3iEMqOtFQSkJCi/2zicQQg/+6U0CE8rkkSKMimmb2xrSDPfAVVBj7aqg8wnj
 QMZqWCmfY9u5oHJiUeflNjGtB6dSKh1s54zSdXMn8V4HVtnycq0plQXp5B1021lCYA4/A3ZxNhsFb
 Ml0gOVXw==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kSZgx-0005RW-Py; Wed, 14 Oct 2020 05:51:15 +0000
Date: Wed, 14 Oct 2020 06:51:15 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Alexander Viro <aviro@redhat.com>
Subject: Re: [PATCH 05/14] fs: don't allow kernel reads and writes without
 iter ops
Message-ID: <20201014055115.GA19844@infradead.org>
References: <20200903142242.925828-1-hch@lst.de>
 <20200903142242.925828-6-hch@lst.de>
 <20201001223852.GA855@sol.localdomain>
 <20201001224051.GI3421308@ZenIV.linux.org.uk>
 <CAHk-=wgj=mKeN-EfV5tKwJNeHPLG0dybq+R5ZyGuc4WeUnqcmA@mail.gmail.com>
 <20201009220633.GA1122@sol.localdomain>
 <CAHk-=whcEzYjkqdpZciHh+iAdUttvfWZYoiHiF67XuTXB1YJLw@mail.gmail.com>
 <20201010011919.GC1122@sol.localdomain>
 <CAHk-=wigvcmp-jcgoNCbx45W7j3=0jA320CfpskwuoEjefM7nQ@mail.gmail.com>
 <20201010015524.GB101464@shell-el7.hosts.prod.upshift.rdu2.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201010015524.GB101464@shell-el7.hosts.prod.upshift.rdu2.redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Kees Cook <keescook@chromium.org>, the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Alexey Dobriyan <adobriyan@gmail.com>, Eric Biggers <ebiggers@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Oct 10, 2020 at 01:55:24AM +0000, Alexander Viro wrote:
> FWIW, I hadn't pushed that branch out (or merged it into #for-next yet);
> for one thing, uml part (mconsole) is simply broken, for another...
> IMO ##5--8 are asking for kernel_pread() and if you look at binfmt_elf.c,
> you'll see elf_read() being pretty much that.  acct.c, keys and usermode
> parts are asking for kernel_pwrite() as well.
> 
> I've got stuck looking through the drivers/target stuff - it would've
> been another kernel_pwrite() candidate, but it smells like its use of
> filp_open() is really asking for trouble, starting with symlink attacks.
> Not sure - I'm not familiar with the area, but...

Can you just pull in the minimal fix so that the branch gets fixed
for this merge window?  All the cleanups can come later.
