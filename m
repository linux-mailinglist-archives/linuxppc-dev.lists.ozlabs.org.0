Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C78EA32A06
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 09:48:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HRy205xnzDqSD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 17:48:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=newverein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HRtC0bGDzDqQb
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2019 17:45:23 +1000 (AEST)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 2E3F867358; Mon,  3 Jun 2019 09:44:56 +0200 (CEST)
Date: Mon, 3 Jun 2019 09:44:55 +0200
From: Christoph Hellwig <hch@lst.de>
To: Hillf Danton <hdanton@sina.com>
Subject: Re: [PATCH 10/16] sparc64: use the generic get_user_pages_fast code
Message-ID: <20190603074455.GC22920@lst.de>
References: <20190601074959.14036-1-hch@lst.de>
 <20190601074959.14036-11-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190601074959.14036-11-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: x86@kernel.org, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org,
 James Hogan <jhogan@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Khalid Aziz <khalid.aziz@oracle.com>, Nicholas Piggin <npiggin@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-mm@kvack.org,
 Paul Burton <paul.burton@mips.com>, Paul Mackerras <paulus@samba.org>,
 Andrey Konovalov <andreyknvl@google.com>, sparclinux@vger.kernel.org,
 linux-mips@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jun 02, 2019 at 03:39:48PM +0800, Hillf Danton wrote:
> 
> Hi Christoph 
> 
> On Sat,  1 Jun 2019 09:49:53 +0200 Christoph Hellwig wrote:
> > 
> > diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
> > index a93eca29e85a..2301ab5250e4 100644
> > --- a/arch/sparc/include/asm/pgtable_64.h
> > +++ b/arch/sparc/include/asm/pgtable_64.h
> > @@ -1098,6 +1098,24 @@ static inline unsigned long untagged_addr(unsigned long start)
> >  }
> >  #define untagged_addr untagged_addr
> >  
> > +static inline bool pte_access_permitted(pte_t pte, bool write)
> > +{
> > +	u64 prot;
> > +
> > +	if (tlb_type == hypervisor) {
> > +		prot = _PAGE_PRESENT_4V | _PAGE_P_4V;
> > +		if (prot)
> 
> Feel free to correct me if I misread or miss anything.
> It looks like a typo: s/prot/write/, as checking _PAGE_PRESENT_4V and
> _PAGE_P_4V makes prot always have _PAGE_WRITE_4V set, regardless of write.

True, the if prot should be if write.
