Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F04CFA6B9D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 16:35:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46N8cb6g0JzDqrs
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 00:35:11 +1000 (AEST)
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
 header.b="hScFHEtW"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46N8Vb29BgzDqnV
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 00:29:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O0vMqdd0CVfcLwe8ztibkw7pTl1sYEubPo8aMD2xLx0=; b=hScFHEtWp1N1rzg5nlCTz+Y7W
 +tUV4KU9048Mdt0gs//aT/p8NbdNDFzqXzyT7Hq+O3dM4aK47758OEA43NBs5hhl7YsjAC4DLG8V9
 cuQIjW9qmvhc7YNvWFjkn6k0G/VAocrRxMfLRmFSX3WLF8Wstq2ts/ffKvzWPvnxx8nVyFfEL1Tba
 w9nMXoTByi9GSWC6eckGCD8CJ+ae1XNFmfzBnR8A/+LOe1Gvwt1rXl0VUbz6JqzJyj/XTF/JMbvth
 QYNZzNFIEC2qpggjMo8xRXga5GJJRdp+9Y4UREXMnI24TosND5eL4FWzE1jC/tImZvsc1f61jFFDf
 m6tYNCrvg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i59nm-0005Cx-Oq; Tue, 03 Sep 2019 14:28:59 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id AD646306037;
 Tue,  3 Sep 2019 16:28:16 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id D58D82097776B; Tue,  3 Sep 2019 16:28:52 +0200 (CEST)
Date: Tue, 3 Sep 2019 16:28:52 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Salil Mehta <salil.mehta@huawei.com>
Subject: Re: [PATCH v2 2/9] x86: numa: check the node id consistently for x86
Message-ID: <20190903142852.GT2349@hirez.programming.kicks-ass.net>
References: <20190831085539.GG2369@hirez.programming.kicks-ass.net>
 <4d89c688-49e4-a2aa-32ee-65e36edcd913@huawei.com>
 <20190831161247.GM2369@hirez.programming.kicks-ass.net>
 <ae64285f-5134-4147-7b02-34bb5d519e8c@huawei.com>
 <20190902072542.GN2369@hirez.programming.kicks-ass.net>
 <5fa2aa99-89fa-cd41-b090-36a23cfdeb73@huawei.com>
 <20190902125644.GQ2369@hirez.programming.kicks-ass.net>
 <1f48081c-c9d6-8f3e-9559-8b0bec98f125@huawei.com>
 <20190903071111.GU2369@hirez.programming.kicks-ass.net>
 <3bc19c01095545ddbe2ba424f5488b4d@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bc19c01095545ddbe2ba424f5488b4d@huawei.com>
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
Cc: "dalias@libc.org" <dalias@libc.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 Linuxarm <linuxarm@huawei.com>,
 "jiaxun.yang@flygoat.com" <jiaxun.yang@flygoat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mwb@linux.vnet.ibm.com" <mwb@linux.vnet.ibm.com>,
 "paulus@samba.org" <paulus@samba.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "chenhc@lemote.com" <chenhc@lemote.com>, "will@kernel.org" <will@kernel.org>,
 "cai@lca.pw" <cai@lca.pw>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "ysato@users.sourceforge.jp" <ysato@users.sourceforge.jp>,
 "x86@kernel.org" <x86@kernel.org>,
 "paul.burton@mips.com" <paul.burton@mips.com>,
 "rppt@linux.ibm.com" <rppt@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "dledford@redhat.com" <dledford@redhat.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "jeffrey.t.kirsher@intel.com" <jeffrey.t.kirsher@intel.com>,
 "jhogan@kernel.org" <jhogan@kernel.org>,
 "nfont@linux.vnet.ibm.com" <nfont@linux.vnet.ibm.com>,
 "mattst88@gmail.com" <mattst88@gmail.com>,
 "len.brown@intel.com" <len.brown@intel.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "anshuman.khandual@arm.com" <anshuman.khandual@arm.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>, "bp@alien8.de" <bp@alien8.de>,
 "luto@kernel.org" <luto@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "rth@twiddle.net" <rth@twiddle.net>, "axboe@kernel.dk" <axboe@kernel.dk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "ralf@linux-mips.org" <ralf@linux-mips.org>,
 "tbogendoerfer@suse.de" <tbogendoerfer@suse.de>,
 linyunsheng <linyunsheng@huawei.com>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "ink@jurassic.park.msu.ru" <ink@jurassic.park.msu.ru>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "davem@davemloft.net" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 03, 2019 at 12:15:24PM +0000, Salil Mehta wrote:
> > From: Linuxarm [mailto:linuxarm-bounces@huawei.com] On Behalf Of Peter Zijlstra
> > On Tue, Sep 03, 2019 at 02:19:04PM +0800, Yunsheng Lin wrote:

> > > Is it possible that the node id set by device_add() become invalid
> > > if the node is offlined, then dev_to_node() may return a invalid
> > > node id.
> > 
> > In that case I would expect the device to go away too. Once the memory
> > controller goes away, the PCI bus connected to it cannot continue to
> > function.
> 
> I am not sure if this is *exactly* true on our system as NUMA nodes are
> part of the SoCs and devices could still be used even if all the memory
> and CPUs part of the node are turned off. Although, it is highly unlikely
> anybody would do that(maybe could be debated for the Power Management case?) 

Cute; anyway, we never change nr_node_ids (after boot), so once a node
is deemed valid it always is.

The worst that can happen in the above case, is that cpumask_of_node()
returns an empty mask, which, if all CPUs (of said node) are offline, is
an accurate representation.

