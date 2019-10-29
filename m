Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55884E839E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 09:56:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472QRn0VBwzDqWQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 19:56:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=195.135.220.15; helo=mx1.suse.de;
 envelope-from=mhocko@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472QNx4yKmzF1fj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 19:53:53 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A3A1DB43E;
 Tue, 29 Oct 2019 08:53:44 +0000 (UTC)
Date: Tue, 29 Oct 2019 09:53:36 +0100
From: Michal Hocko <mhocko@kernel.org>
To: Yunsheng Lin <linyunsheng@huawei.com>
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Message-ID: <20191029085336.GF31513@dhcp22.suse.cz>
References: <20190925104108.GE4553@hirez.programming.kicks-ass.net>
 <47fa4cee-8528-7c23-c7de-7be1b65aa2ae@huawei.com>
 <bec80499-86d9-bf1f-df23-9044a8099992@arm.com>
 <a5f0fc80-8e88-b781-77ce-1213e5d62125@huawei.com>
 <20191010073212.GB18412@dhcp22.suse.cz>
 <6cc94f9b-0d79-93a8-5ec2-4f6c21639268@huawei.com>
 <20191011111539.GX2311@hirez.programming.kicks-ass.net>
 <7fad58d6-5126-e8b8-a7d8-a91814da53ba@huawei.com>
 <20191012074014.GA2037204@kroah.com>
 <1ec704df-97a5-04b7-1f20-8e3db19440a3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ec704df-97a5-04b7-1f20-8e3db19440a3@huawei.com>
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
Cc: dalias@libc.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, dave.hansen@linux.intel.com,
 heiko.carstens@de.ibm.com, jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org,
 mwb@linux.vnet.ibm.com, paulus@samba.org, hpa@zytor.com,
 sparclinux@vger.kernel.org, chenhc@lemote.com, will@kernel.org, cai@lca.pw,
 linux-s390@vger.kernel.org, ysato@users.sourceforge.jp,
 linux-acpi@vger.kernel.org, x86@kernel.org, rppt@linux.ibm.com,
 borntraeger@de.ibm.com, dledford@redhat.com, mingo@redhat.com,
 jeffrey.t.kirsher@intel.com, catalin.marinas@arm.com, jhogan@kernel.org,
 mattst88@gmail.com, lenb@kernel.org, len.brown@intel.com, gor@linux.ibm.com,
 anshuman.khandual@arm.com, linuxppc-dev@lists.ozlabs.org, bp@alien8.de,
 luto@kernel.org, bhelgaas@google.com, tglx@linutronix.de,
 naveen.n.rao@linux.vnet.ibm.com, linux-arm-kernel@lists.infradead.org,
 rth@twiddle.net, axboe@kernel.dk, linux-pci@vger.kernel.org,
 Greg KH <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, ralf@linux-mips.org, tbogendoerfer@suse.de,
 paul.burton@mips.com, linux-alpha@vger.kernel.org, rafael@kernel.org,
 ink@jurassic.park.msu.ru, akpm@linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon 28-10-19 17:20:33, Yunsheng Lin wrote:
> On 2019/10/12 15:40, Greg KH wrote:
> > On Sat, Oct 12, 2019 at 02:17:26PM +0800, Yunsheng Lin wrote:
> >> add pci and acpi maintainer
> >> cc linux-pci@vger.kernel.org and linux-acpi@vger.kernel.org
> >>
> >> On 2019/10/11 19:15, Peter Zijlstra wrote:
> >>> On Fri, Oct 11, 2019 at 11:27:54AM +0800, Yunsheng Lin wrote:
> >>>> But I failed to see why the above is related to making node_to_cpumask_map()
> >>>> NUMA_NO_NODE aware?
> >>>
> >>> Your initial bug is for hns3, which is a PCI device, which really _MUST_
> >>> have a node assigned.
> >>>
> >>> It not having one, is a straight up bug. We must not silently accept
> >>> NO_NODE there, ever.
> >>>
> >>
> >> I suppose you mean reporting a lack of affinity when the node of a pcie
> >> device is not set by "not silently accept NO_NODE".
> > 
> > If the firmware of a pci device does not provide the node information,
> > then yes, warn about that.
> > 
> >> As Greg has asked about in [1]:
> >> what is a user to do when the user sees the kernel reporting that?
> >>
> >> We may tell user to contact their vendor for info or updates about
> >> that when they do not know about their system well enough, but their
> >> vendor may get away with this by quoting ACPI spec as the spec
> >> considering this optional. Should the user believe this is indeed a
> >> fw bug or a misreport from the kernel?
> > 
> > Say it is a firmware bug, if it is a firmware bug, that's simple.
> > 
> >> If this kind of reporting is common pratice and will not cause any
> >> misunderstanding, then maybe we can report that.
> > 
> > Yes, please do so, that's the only way those boxes are ever going to get
> > fixed.  And go add the test to the "firmware testing" tool that is based
> > on Linux that Intel has somewhere, to give vendors a chance to fix this
> > before they ship hardware.
> > 
> > This shouldn't be a big deal, we warn of other hardware bugs all the
> > time.
> 
> Hi, all.
> 
> The warning for the above case has been added in [1].
> 
> So maybe it makes sense to make node_to_cpumask_map() NUMA_NO_NODE aware
> now?
> 
> If Yes, this patch still can be applied to the latest linus' tree cleanly,
> Do I need to resend it?
> 

By this patch you mean http://lkml.kernel.org/r/1568724534-146242-1-git-send-email-linyunsheng@huawei.com
right?

I would just resend it unless there is still a clear disagreement over
it.

> [1] https://lore.kernel.org/linux-pci/1571467543-26125-1-git-send-email-linyunsheng@huawei.com/

-- 
Michal Hocko
SUSE Labs
