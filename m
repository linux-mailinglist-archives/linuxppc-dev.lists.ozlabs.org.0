Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD24D5FB6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 12:06:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sDjZ3b4dzDqhl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 21:06:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="TWTxU8aa"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sDgQ2P8zzDqgq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 21:04:32 +1100 (AEDT)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 93474207FF;
 Mon, 14 Oct 2019 10:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571047470;
 bh=1L6BHHyZGzdbxZWv4acGRnc0Va1vbCVjc4KDhtWjTqM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TWTxU8aaHNdrVeedNaAfxRnATKwQqldi45eCabLzrJUjucHv6x6k8odH8CVoEQbPR
 w4oWGHOb3hLuaMuJ2jSTXq/ppPzZIjrhbS4OaxKJeinja9bxujNH+7bHo+Z4BvD0Vx
 z3dLPHIeCCsbnOLqYk6lsozxHfWvVXR06RTUURHI=
Date: Mon, 14 Oct 2019 12:04:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Message-ID: <20191014100427.GA6307@kroah.com>
References: <6cc94f9b-0d79-93a8-5ec2-4f6c21639268@huawei.com>
 <20191011111539.GX2311@hirez.programming.kicks-ass.net>
 <7fad58d6-5126-e8b8-a7d8-a91814da53ba@huawei.com>
 <20191012074014.GA2037204@kroah.com>
 <1e1ec851-b5e7-8f35-a627-4c12ca9c2d3c@huawei.com>
 <20191012104001.GA2052933@kroah.com>
 <20191012104742.GA2053473@kroah.com>
 <82000bc8-6912-205b-0251-25b9cc430973@huawei.com>
 <20191014092509.GA3050088@kroah.com>
 <20191014094912.GY2311@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191014094912.GY2311@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
 linux-s390@vger.kernel.org, ysato@users.sourceforge.jp,
 linux-acpi@vger.kernel.org, x86@kernel.org,
 Yunsheng Lin <linyunsheng@huawei.com>, rppt@linux.ibm.com,
 borntraeger@de.ibm.com, dledford@redhat.com, mingo@redhat.com,
 jeffrey.t.kirsher@intel.com, jhogan@kernel.org, mattst88@gmail.com,
 linux-mips@vger.kernel.org, lenb@kernel.org, len.brown@intel.com,
 gor@linux.ibm.com, anshuman.khandual@arm.com, bp@alien8.de, luto@kernel.org,
 bhelgaas@google.com, tglx@linutronix.de, naveen.n.rao@linux.vnet.ibm.com,
 linux-arm-kernel@lists.infradead.org, rth@twiddle.net, axboe@kernel.dk,
 linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 ralf@linux-mips.org, tbogendoerfer@suse.de, paul.burton@mips.com,
 linux-alpha@vger.kernel.org, rafael@kernel.org, ink@jurassic.park.msu.ru,
 akpm@linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 14, 2019 at 11:49:12AM +0200, Peter Zijlstra wrote:
> On Mon, Oct 14, 2019 at 11:25:09AM +0200, Greg KH wrote:
> > Good luck, I don't really think that most, if any, of this is needed,
> > but hey, it's nice to clean it up where it can be :)
> 
> Some of the virtual devices we have (that use devm) really ought to set
> the node too, like drivers/base/cpu.c and driver/base/node.c and
> arguably the cooling devices too (they create a device per cpu).
> 
> The patch I had here:
> 
>   https://lkml.kernel.org/r/20190925214526.GA4643@worktop.programming.kicks-ass.net
> 
> takes the more radical approach of requiring a node, except when
> explicitly marked not (the fake devices that don't use devm for
> example).

I like that patch :)

> But yes, PCI and other physical busses really should be having a node
> set, no excuses.

Agreed, at least just warning on the bus creation will make it a bit
less "noisy", in contrast to your patch.  But the messages in your patch
show people just how broken their bioses really are.  Which is always
fun...

> Anyway, I don't think non-physical devices actually use
> cpumask_of_node() much, a quick grep didn't show any.

That's good.

thanks,

greg k-h
