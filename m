Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAD1BC4CF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 11:28:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cwpW73LmzDqSK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 19:28:03 +1000 (AEST)
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
 header.b="lytUR31w"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cwmd69b5zDqS3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 19:26:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jpxNL12cNMAZAoNUWd3gZZ5abGhJ0ftyATBAiZSxSQU=; b=lytUR31wG42Kx44xHl1Qi+HEP
 d503DtCrHlkpVkJIig01ou5wdkagxJ8pPFOrHUWRzivw14hEO0i4UUB6FjPb7GXcgyodvG9h5SM7O
 /Mm31MMJM8e6CfMCQDt4HjEPRMRCwAF5YwjiPfWs81M8jd3n/Rl5vYQXPyGdffdlg9EDzmC8+qdY/
 uiwJ7MhOCy608Svimr/+uEstMd7G24lfij70nORC92UrTdg+CkE2IEzV9Fgl7prPY9UWbEwy5SSPF
 nzZkjyQy0GCM5v1NSmtubG67AIFpkW1pgFCB0OszOtjgX8e7Ama65wa8OgCnQiohUsv4HHh7IICil
 +ylXkIt3A==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCh4z-0002RC-TG; Tue, 24 Sep 2019 09:25:54 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E50D2305E35;
 Tue, 24 Sep 2019 11:25:05 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 6FC1F20D80D41; Tue, 24 Sep 2019 11:25:51 +0200 (CEST)
Date: Tue, 24 Sep 2019 11:25:51 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Yunsheng Lin <linyunsheng@huawei.com>
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Message-ID: <20190924092551.GK2369@hirez.programming.kicks-ass.net>
References: <1568724534-146242-1-git-send-email-linyunsheng@huawei.com>
 <20190923151519.GE2369@hirez.programming.kicks-ass.net>
 <20190923152856.GB17206@dhcp22.suse.cz>
 <20190923154852.GG2369@hirez.programming.kicks-ass.net>
 <20190923165235.GD17206@dhcp22.suse.cz>
 <20190923203410.GI2369@hirez.programming.kicks-ass.net>
 <f1362dbb-ad31-51a8-2b06-16c9d928b876@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1362dbb-ad31-51a8-2b06-16c9d928b876@huawei.com>
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
 dave.hansen@linux.intel.com, heiko.carstens@de.ibm.com,
 jiaxun.yang@flygoat.com, Michal Hocko <mhocko@kernel.org>,
 mwb@linux.vnet.ibm.com, paulus@samba.org, hpa@zytor.com,
 sparclinux@vger.kernel.org, chenhc@lemote.com, will@kernel.org, cai@lca.pw,
 linux-s390@vger.kernel.org, ysato@users.sourceforge.jp, x86@kernel.org,
 rppt@linux.ibm.com, borntraeger@de.ibm.com, dledford@redhat.com,
 mingo@redhat.com, jeffrey.t.kirsher@intel.com, jhogan@kernel.org,
 mattst88@gmail.com, linux-mips@vger.kernel.org, len.brown@intel.com,
 gor@linux.ibm.com, anshuman.khandual@arm.com, gregkh@linuxfoundation.org,
 bp@alien8.de, luto@kernel.org, tglx@linutronix.de,
 naveen.n.rao@linux.vnet.ibm.com, linux-arm-kernel@lists.infradead.org,
 rth@twiddle.net, axboe@kernel.dk, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, ralf@linux-mips.org, tbogendoerfer@suse.de,
 paul.burton@mips.com, linux-alpha@vger.kernel.org, rafael@kernel.org,
 ink@jurassic.park.msu.ru, akpm@linux-foundation.org, robin.murphy@arm.com,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 24, 2019 at 09:29:50AM +0800, Yunsheng Lin wrote:
> On 2019/9/24 4:34, Peter Zijlstra wrote:

> > I'm saying the ACPI standard is wrong. Explain to me how it is
> > physically possible to have a device without NUMA affinity in a NUMA
> > system?
> > 
> >  1) The fundamental interconnect is not uniform.
> >  2) The device needs to actually be somewhere.
> > 
> 
> From what I can see, NUMA_NO_NODE may make sense in the below case:
> 
> 1) Theoretically, there would be a device that can access all the memory
> uniformly and can be accessed by all cpus uniformly even in a NUMA system.
> Suppose we have two nodes, and the device just sit in the middle of the
> interconnect between the two nodes.
> 
> Even we define a third node solely for the device, we may need to look at
> the node distance to decide the device can be accessed uniformly.
> 
> Or we can decide that the device can be accessed uniformly by setting
> it's node to NUMA_NO_NODE.

This is indeed a theoretical case; it doesn't scale. The moment you're
adding multiple sockets or even board interconnects this all goes out
the window.

And in this case, forcing the device to either node is fine.

> 2) For many virtual deivces, such as tun or loopback netdevice, they
> are also accessed uniformly by all cpus.

Not true; the virtual device will sit in memory local to some node.

And as with physical devices, you probably want at least one (virtual)
queue per node.

