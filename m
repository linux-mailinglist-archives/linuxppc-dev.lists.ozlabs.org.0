Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C837258B29
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 11:13:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BghF50L47zDqVd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 19:13:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BghBm4CjYzDqQm
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 19:11:11 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5724168B05; Tue,  1 Sep 2020 11:11:05 +0200 (CEST)
Date: Tue, 1 Sep 2020 11:11:05 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [RESEND][PATCH 0/7] Avoid overflow at boundary_size
Message-ID: <20200901091105.GA4959@lst.de>
References: <20200831203811.8494-1-nicoleotsuka@gmail.com>
 <20200901073623.GA30418@lst.de> <20200901075401.GA5667@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200901075401.GA5667@Asurada-Nvidia>
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
Cc: linux-ia64@vger.kernel.org, James.Bottomley@HansenPartnership.com,
 paulus@samba.org, hpa@zytor.com, sparclinux@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, sfr@canb.auug.org.au, deller@gmx.de,
 x86@kernel.org, borntraeger@de.ibm.com, mingo@redhat.com, mattst88@gmail.com,
 fenghua.yu@intel.com, gor@linux.ibm.com, schnelle@linux.ibm.com,
 hca@linux.ibm.com, ink@jurassic.park.msu.ru, tglx@linutronix.de,
 gerald.schaefer@linux.ibm.com, rth@twiddle.net, tony.luck@intel.com,
 linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, bp@alien8.de,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 01, 2020 at 12:54:01AM -0700, Nicolin Chen wrote:
> Hi Christoph,
> 
> On Tue, Sep 01, 2020 at 09:36:23AM +0200, Christoph Hellwig wrote:
> > I really don't like all the open coded smarts in the various drivers.
> > What do you think about a helper like the one in the untested patch
> 
> A helper function will be actually better. I was thinking of
> one yet not very sure about the naming and where to put it.
> 
> > below (on top of your series).  Also please include the original
> > segment boundary patch with the next resend so that the series has
> > the full context.
> 
> I will use your change instead and resend with the ULONG_MAX
> change. But in that case, should I make separate changes for
> different files like this series, or just one single change
> like yours?
> 
> Asking this as I was expecting that those changes would get
> applied by different maintainers. But now it feels like you
> will merge it to your tree at once?

I guess one patch is fine.  I can queue it up in the dma-mapping
tree as a prep patch for the default boundary change.
