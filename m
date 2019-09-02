Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED09A5CA5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 21:17:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Mfwp5tMczDqd0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 05:17:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="ABUi6bxw"; dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Mftg6vfzzDqQs
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 05:15:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jLmXpLU6F1RGPbvNG04Pwx+M4aB058HdSSdmCuhuLak=; b=ABUi6bxwns6yQEN+1PnwjRCTK
 GpwKo/K2O4pz7QylK87ZTmWEBXC3cVnMf4e54Wg0s5A0GhBfCrxAY5UkSmMCD2l120rKEBOMtmmSx
 fQv7FhbjUE0Rpx3DiFQyebngjv0bSKpYfLtzd6C7v0yuII8sKLhPVKc2NYTg4oEjO86VlgdYYl2rw
 /2rqFgmolMcY8H2vtNv4U8p9VQ9qhC7n/cEEEv5csuBN+Cf0JtVgyQGd6kZTDlEJSlCZaDYqDu3gN
 nj7VnN5S6ckTuLGYXWcKmdyXpwxgRfmGWokUG7W1qrM5Pncbt6HIFrG7uIE9qeQYXi0H+WkSD6QRc
 ZKFJaOhww==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i4rmW-0003ny-LE; Mon, 02 Sep 2019 19:14:28 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 393DE306023;
 Mon,  2 Sep 2019 21:13:46 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id E09FA29B9FF21; Mon,  2 Sep 2019 21:14:21 +0200 (CEST)
Date: Mon, 2 Sep 2019 21:14:21 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v2 2/9] x86: numa: check the node id consistently for x86
Message-ID: <20190902191421.GT2369@hirez.programming.kicks-ass.net>
References: <1567231103-13237-1-git-send-email-linyunsheng@huawei.com>
 <1567231103-13237-3-git-send-email-linyunsheng@huawei.com>
 <20190831085539.GG2369@hirez.programming.kicks-ass.net>
 <4d89c688-49e4-a2aa-32ee-65e36edcd913@huawei.com>
 <20190831161247.GM2369@hirez.programming.kicks-ass.net>
 <ae64285f-5134-4147-7b02-34bb5d519e8c@huawei.com>
 <20190902072542.GN2369@hirez.programming.kicks-ass.net>
 <5fa2aa99-89fa-cd41-b090-36a23cfdeb73@huawei.com>
 <20190902125644.GQ2369@hirez.programming.kicks-ass.net>
 <20190902182252.GC35858@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190902182252.GC35858@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: dalias@libc.org, linux-sh@vger.kernel.org, catalin.marinas@arm.com,
 dave.hansen@linux.intel.com, heiko.carstens@de.ibm.com, linuxarm@huawei.com,
 jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, mwb@linux.vnet.ibm.com,
 paulus@samba.org, hpa@zytor.com, sparclinux@vger.kernel.org, chenhc@lemote.com,
 will@kernel.org, bp@alien8.de, linux-s390@vger.kernel.org,
 ysato@users.sourceforge.jp, x86@kernel.org, paul.burton@mips.com,
 rppt@linux.ibm.com, borntraeger@de.ibm.com, dledford@redhat.com,
 mingo@redhat.com, jeffrey.t.kirsher@intel.com, jhogan@kernel.org,
 nfont@linux.vnet.ibm.com, mattst88@gmail.com, len.brown@intel.com,
 gor@linux.ibm.com, anshuman.khandual@arm.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ink@jurassic.park.msu.ru,
 luto@kernel.org, tglx@linutronix.de, naveen.n.rao@linux.vnet.ibm.com,
 linux-arm-kernel@lists.infradead.org, rth@twiddle.net, axboe@kernel.dk,
 linuxppc-dev@lists.ozlabs.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, ralf@linux-mips.org, tbogendoerfer@suse.de,
 Yunsheng Lin <linyunsheng@huawei.com>, linux-alpha@vger.kernel.org, cai@lca.pw,
 akpm@linux-foundation.org, robin.murphy@arm.com, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 02, 2019 at 08:22:52PM +0200, Ingo Molnar wrote:
> 
> * Peter Zijlstra <peterz@infradead.org> wrote:

> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index f0dd8e38fee3..2caf204966a0 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -2120,8 +2120,16 @@ int device_add(struct device *dev)
> >  		dev->kobj.parent = kobj;
> >  
> >  	/* use parent numa_node */
> > -	if (parent && (dev_to_node(dev) == NUMA_NO_NODE))
> > -		set_dev_node(dev, dev_to_node(parent));
> > +	if (dev_to_node(dev) == NUMA_NO_NODE) {
> > +		if (parent)
> > +			set_dev_node(dev, dev_to_node(parent));
> > +#ifdef CONFIG_NUMA
> > +		else {
> > +			pr_err("device: '%s': has no assigned NUMA node\n", dev_name(dev));
> > +			set_dev_node(dev, 0);
> > +		}
> > +#endif
> 
> BTW., is firmware required to always provide a NUMA node on NUMA systems?
> 
> I.e. do we really want this warning on non-NUMA systems that don't assign 
> NUMA nodes?

Good point; we might have to exclude nr_node_ids==1 systems from
warning.

> Also, even on NUMA systems, is firmware required to provide a NUMA node - 
> i.e. is it in principle invalid to offer no NUMA binding?

I think so; a device needs to be _somewhere_, right? Typically though;
devices are on a PCI bus, and the PCI bridge itself will have a NUMA
binding and then the above parent rule will make everything just work.

But I don't see how you can be outside of the NUMA topology.
