Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF12286EA7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 08:23:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6Lkb5ryRzDqP5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 17:23:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+84bc492865ddab46dda0+6255+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=hdRv5sr7; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6Lhg0TsNzDqLx
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 17:22:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=yUoIc9I8zBFW1l1RUkMTpa9dMjCgFjwiUO5I2agyv3s=; b=hdRv5sr7QtXVOGXnAnhUe3FNGb
 SRotAyEmN3rCMEJEhz3DikQcIqwCTG7CrAXiGiJWRUiku6BDUa42w6DZZiCTkfkbxFoXIe7hgn76r
 +C3TZkRE3oivb3DH5SBC/7jmkOXuTxXsYCUrSeefXQOupAXXmHcOAHPsplH9Um35Qqw3L/7lh0c2R
 i2QFfuqlGN1tfs6y+SyuJJCpyrrrN502ektDR3lor/9mvl6TtW94LyJ01rK7Nbdg2H7PMHKQIP93E
 NeJhUT3dXGmvhbe8Yp0AXOEET4abmXiWKvn13m9skKm3U05B8wtsNCsN+hd1Ih2h7T+f9vwrEqpAW
 cwLC1J/Q==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kQPJ6-00070T-71; Thu, 08 Oct 2020 06:21:40 +0000
Date: Thu, 8 Oct 2020 07:21:40 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jann Horn <jannh@google.com>
Subject: Re: [PATCH 1/2] mm/mprotect: Call arch_validate_prot under mmap_lock
 and with length
Message-ID: <20201008062140.GA24315@infradead.org>
References: <20201007073932.865218-1-jannh@google.com>
 <20201007123544.GA11433@infradead.org>
 <CAG48ez3kjTeVtQcjQerYYRs7sX5qq3O7SU-FEaYLNXisFmAeOg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG48ez3kjTeVtQcjQerYYRs7sX5qq3O7SU-FEaYLNXisFmAeOg@mail.gmail.com>
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
Cc: Dave Kleikamp <shaggy@linux.vnet.ibm.com>, Will Deacon <will@kernel.org>,
 Linux-MM <linux-mm@kvack.org>, kernel list <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Khalid Aziz <khalid.aziz@oracle.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Anthony Yznaga <anthony.yznaga@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 07, 2020 at 04:42:55PM +0200, Jann Horn wrote:
> > > @@ -43,7 +43,7 @@ static inline long do_mmap2(unsigned long addr, size_t len,
> > >  {
> > >       long ret = -EINVAL;
> > >
> > > -     if (!arch_validate_prot(prot, addr))
> > > +     if (!arch_validate_prot(prot, addr, len))
> >
> > This call isn't under mmap lock.  I also find it rather weird as the
> > generic code only calls arch_validate_prot from mprotect, only powerpc
> > also calls it from mmap.
> >
> > This seems to go back to commit ef3d3246a0d0
> > ("powerpc/mm: Add Strong Access Ordering support")
> 
> I'm _guessing_ the idea in the generic case might be that mmap()
> doesn't check unknown bits in the protection flags, and therefore
> maybe people wanted to avoid adding new error cases that could be
> caused by random high bits being set? So while the mprotect() case
> checks the flags and refuses unknown values, the mmap() code just lets
> the architecture figure out which bits are actually valid to set (via
> arch_calc_vm_prot_bits()) and silently ignores the rest?
> 
> And powerpc apparently decided that they do want to error out on bogus
> prot values passed to their version of mmap(), and in exchange, assume
> in arch_calc_vm_prot_bits() that the protection bits are valid?

The problem really is that now programs behave different on powerpc
compared to all other architectures.

> powerpc's arch_validate_prot() doesn't actually need the mmap lock, so
> I think this is fine-ish for now (as in, while the code is a bit
> unclean, I don't think I'm making it worse, and I don't think it's
> actually buggy). In theory, we could move the arch_validate_prot()
> call over into the mmap guts, where we're holding the lock, and gate
> it on the architecture or on some feature CONFIG that powerpc can
> activate in its Kconfig. But I'm not sure whether that'd be helping or
> making things worse, so when I sent this patch, I deliberately left
> the powerpc stuff as-is.

For now I'd just duplicate the trivial logic from arch_validate_prot
in the powerpc version of do_mmap2 and add a comment that this check
causes a gratious incompatibility to all other architectures.  And then
hope that the powerpc maintainers fix it up :)
