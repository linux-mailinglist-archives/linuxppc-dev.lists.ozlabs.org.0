Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3155AD4E14
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2019 09:42:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qxc64q3JzDqcT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2019 18:42:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ot8f41TK"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qxZK5zC3zDqNv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2019 18:40:39 +1100 (AEDT)
Received: from localhost (unknown [62.119.166.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B8F421850;
 Sat, 12 Oct 2019 07:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570866037;
 bh=ymNNDx8Fo6uelERv6sLz5FrpkUpLXJNH+cXIPy6IgQo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ot8f41TKzj8Uyk3uaJjDgmRmJCCUEX5IwsF6OZJejumM5mBiZmWoPWs0TNXw34Cvm
 lc0PGWk6jgAwWW+ruUVJqAQEpuG/UBMsvUrDGYEz8PQHRKAzc1Z9YYyro/ls3L8ddT
 9kwveJ9nnRcV63+0ftQ9noDCsvnzMi6Pp/krJ0jg=
Date: Sat, 12 Oct 2019 09:40:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yunsheng Lin <linyunsheng@huawei.com>
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Message-ID: <20191012074014.GA2037204@kroah.com>
References: <20190924131939.GS23050@dhcp22.suse.cz>
 <1adcbe68-6753-3497-48a0-cc84ac503372@huawei.com>
 <20190925104108.GE4553@hirez.programming.kicks-ass.net>
 <47fa4cee-8528-7c23-c7de-7be1b65aa2ae@huawei.com>
 <bec80499-86d9-bf1f-df23-9044a8099992@arm.com>
 <a5f0fc80-8e88-b781-77ce-1213e5d62125@huawei.com>
 <20191010073212.GB18412@dhcp22.suse.cz>
 <6cc94f9b-0d79-93a8-5ec2-4f6c21639268@huawei.com>
 <20191011111539.GX2311@hirez.programming.kicks-ass.net>
 <7fad58d6-5126-e8b8-a7d8-a91814da53ba@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fad58d6-5126-e8b8-a7d8-a91814da53ba@huawei.com>
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
Cc: dalias@libc.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, catalin.marinas@arm.com,
 dave.hansen@linux.intel.com, heiko.carstens@de.ibm.com,
 jiaxun.yang@flygoat.com, Michal Hocko <mhocko@kernel.org>,
 mwb@linux.vnet.ibm.com, paulus@samba.org, hpa@zytor.com,
 sparclinux@vger.kernel.org, chenhc@lemote.com, will@kernel.org, cai@lca.pw,
 linux-s390@vger.kernel.org, ysato@users.sourceforge.jp,
 linux-acpi@vger.kernel.org, x86@kernel.org, rppt@linux.ibm.com,
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

On Sat, Oct 12, 2019 at 02:17:26PM +0800, Yunsheng Lin wrote:
> add pci and acpi maintainer
> cc linux-pci@vger.kernel.org and linux-acpi@vger.kernel.org
> 
> On 2019/10/11 19:15, Peter Zijlstra wrote:
> > On Fri, Oct 11, 2019 at 11:27:54AM +0800, Yunsheng Lin wrote:
> >> But I failed to see why the above is related to making node_to_cpumask_map()
> >> NUMA_NO_NODE aware?
> > 
> > Your initial bug is for hns3, which is a PCI device, which really _MUST_
> > have a node assigned.
> > 
> > It not having one, is a straight up bug. We must not silently accept
> > NO_NODE there, ever.
> > 
> 
> I suppose you mean reporting a lack of affinity when the node of a pcie
> device is not set by "not silently accept NO_NODE".

If the firmware of a pci device does not provide the node information,
then yes, warn about that.

> As Greg has asked about in [1]:
> what is a user to do when the user sees the kernel reporting that?
> 
> We may tell user to contact their vendor for info or updates about
> that when they do not know about their system well enough, but their
> vendor may get away with this by quoting ACPI spec as the spec
> considering this optional. Should the user believe this is indeed a
> fw bug or a misreport from the kernel?

Say it is a firmware bug, if it is a firmware bug, that's simple.

> If this kind of reporting is common pratice and will not cause any
> misunderstanding, then maybe we can report that.

Yes, please do so, that's the only way those boxes are ever going to get
fixed.  And go add the test to the "firmware testing" tool that is based
on Linux that Intel has somewhere, to give vendors a chance to fix this
before they ship hardware.

This shouldn't be a big deal, we warn of other hardware bugs all the
time.

thanks,

greg k-h
