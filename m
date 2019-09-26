Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94415BF2EC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2019 14:26:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fDgx2h6XzDqj4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2019 22:26:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="hubXmZfA"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fDdS42ckzDqgn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2019 22:24:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=afRaN/LY/H1zbCDadcDtmH+ZWsJBTHhKnFzc00nLmQ8=; b=hubXmZfA3To1Ex3YRmRRRH7lQ
 OepCjKKz8C5Ztc+dCXmmwxQq5WYAAdbGp0yfpxmb91trKituvJle34POlOe5cs18X3tN9aqJTyKh4
 gqLF/wgE7398CboKIwmyOl0R5cWmlS3RAiLmJJjTuU8xd5q8bajMm/w+CCndClH8TT+wDwVDIzwTR
 mdLwlKTZXtvAtRnY6YnviaDrIkl6xa5HqDB9QA3sk+H6nnwFeGiKdO5jq5uuT2J1oT5DPuXSgHsUm
 5xNIHhsJAkaVrTLL+gEXO/XM/xmDp0I1AYSmlqMsDCrdmfaeO0cLvGGA1V3MxJLAt8KhPerUpY2rt
 KngGAuEVg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDSoc-0005oB-To; Thu, 26 Sep 2019 12:24:11 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 941DD300F40;
 Thu, 26 Sep 2019 14:23:20 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id EB0F32013B75A; Thu, 26 Sep 2019 14:24:06 +0200 (CEST)
Date: Thu, 26 Sep 2019 14:24:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Message-ID: <20190926122406.GB4519@hirez.programming.kicks-ass.net>
References: <20190924115401.GM23050@dhcp22.suse.cz>
 <20190924120943.GP2349@hirez.programming.kicks-ass.net>
 <20190924122500.GP23050@dhcp22.suse.cz>
 <20190924124325.GQ2349@hirez.programming.kicks-ass.net>
 <20190924125936.GR2349@hirez.programming.kicks-ass.net>
 <20190924131939.GS23050@dhcp22.suse.cz>
 <20190925104040.GD4553@hirez.programming.kicks-ass.net>
 <20190925132544.GL23050@dhcp22.suse.cz>
 <20190925163154.GF4553@hirez.programming.kicks-ass.net>
 <CAMuHMdVJ6RbEbKc8s_rhJaUBNnA8sOByq9cJ3KH-qmcqQrm_UQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVJ6RbEbKc8s_rhJaUBNnA8sOByq9cJ3KH-qmcqQrm_UQ@mail.gmail.com>
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
Cc: Rich Felker <dalias@libc.org>, Linux-sh list <linux-sh@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, jiaxun.yang@flygoat.com,
 Michal Hocko <mhocko@kernel.org>, Michael Bringmann <mwb@linux.vnet.ibm.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux <sparclinux@vger.kernel.org>, Huacai Chen <chenhc@lemote.com>,
 Will Deacon <will@kernel.org>, Qian Cai <cai@lca.pw>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 the arch/x86 maintainers <x86@kernel.org>,
 Yunsheng Lin <linyunsheng@huawei.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Doug Ledford <dledford@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Jeff Kirsher <jeffrey.t.kirsher@intel.com>, James Hogan <jhogan@kernel.org>,
 Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org,
 Len Brown <len.brown@intel.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Greg KH <gregkh@linuxfoundation.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 naveen.n.rao@linux.vnet.ibm.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>, Jens Axboe <axboe@kernel.dk>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>,
 Thomas Bogendoerfer <tbogendoerfer@suse.de>,
 Paul Burton <paul.burton@mips.com>, alpha <linux-alpha@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 26, 2019 at 01:45:53PM +0200, Geert Uytterhoeven wrote:
> Hi Peter,
> 
> On Thu, Sep 26, 2019 at 11:42 AM Peter Zijlstra <peterz@infradead.org> wrote:
> > On Wed, Sep 25, 2019 at 03:25:44PM +0200, Michal Hocko wrote:
> > > I am sorry but I still do not understand why you consider this whack a
> > > mole better then simply live with the fact that NUMA_NO_NODE is a
> > > reality and that using the full cpu mask is a reasonable answer to that.
> >
> > Because it doesn't make physical sense. A device _cannot_ be local to
> > all CPUs in a NUMA system.
> 
> While it cannot be local to all CPUs, it can be at a uniform (equal) distance
> to each CPU node, can't it?

Only in some really narrow cases; and I'm not sure those are realistic,
nor if then not providing NUMA info is the best way to describe that.

I suppose it is possible to have a PCI bridge shared between two nodes,
such that the PCI devices have equidistance; esp. if that all lives in a
package. But the moment you scale this out, you either get devices that
are 'local' to a package while having multiple packages, or if you
maintain a single bridge in a big system, things become so slow it all
doesn't matter anyway (try having a equidistant device in a 16 node
system).

I'm saying that assigning a node (one of the shared) is, in the generic
ase of multiple packages, the better solution over assigning all nodes.

The other solution is migrating the device model over to a node mask,
instead of a single node. But like said; I'm not sure anybody actually
build something like this. So I'm not sure it matters.

OTOH allowing to not describe NUMA has led to a whole host of crap,
which if we don't become stricter will only get worse.
