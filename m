Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1087CE9A07
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 11:30:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4734Tq3czMzF40p
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 21:30:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="TTZFxiKp"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4734Rn5xfXzF3x7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 21:28:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+iN3V487rLzT6LAFR1lzAXcK6hHjNNfijwtxuSgahPs=; b=TTZFxiKpbgiZniSx8bKJLugvS
 OC2zXy5c+p6FtvBkyb3BecvsK5LyHyquAbLYzb2lPhR53c8294ub4Gw8FB9HlpLKkYSrKD/QZrJ41
 8+0hg7SzG5mNB9ioHbCpVpPxxfuG/efYdDcDuuV8BPA8VNijtdrHBwFqxseWrFuZdqn9y2lItlShZ
 Ow99esDEZpnLKXV/aD+uqeIO/vQTiY9XyVVKzJ9VV+yRQkKpRO/a6K+Tm3BHosnK9D+xC42zG51Ob
 IG/Ao62HuZeuXpUoKF6v2tov3gFSeHA0oYTo/X1IpRjjjOeQmFS5hR8CtaxIa1bgup+FMSaKmWEkE
 K2LC03wzA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPlCw-0000Ux-HX; Wed, 30 Oct 2019 10:28:06 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id CC14F300596;
 Wed, 30 Oct 2019 11:26:59 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id E85FD2B437E86; Wed, 30 Oct 2019 11:28:00 +0100 (CET)
Date: Wed, 30 Oct 2019 11:28:00 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH v7] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Message-ID: <20191030102800.GX4097@hirez.programming.kicks-ass.net>
References: <1572428068-180880-1-git-send-email-linyunsheng@huawei.com>
 <20191030101449.GW4097@hirez.programming.kicks-ass.net>
 <20191030102229.GY31513@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191030102229.GY31513@dhcp22.suse.cz>
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
 jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, mwb@linux.vnet.ibm.com,
 paulus@samba.org, hpa@zytor.com, sparclinux@vger.kernel.org, chenhc@lemote.com,
 will@kernel.org, cai@lca.pw, linux-s390@vger.kernel.org,
 ysato@users.sourceforge.jp, linux-acpi@vger.kernel.org, x86@kernel.org,
 Yunsheng Lin <linyunsheng@huawei.com>, rppt@linux.ibm.com,
 borntraeger@de.ibm.com, dledford@redhat.com, mingo@redhat.com,
 jeffrey.t.kirsher@intel.com, jhogan@kernel.org, mattst88@gmail.com,
 lenb@kernel.org, len.brown@intel.com, gor@linux.ibm.com,
 anshuman.khandual@arm.com, gregkh@linuxfoundation.org, bp@alien8.de,
 luto@kernel.org, bhelgaas@google.com, tglx@linutronix.de,
 naveen.n.rao@linux.vnet.ibm.com, linux-arm-kernel@lists.infradead.org,
 rth@twiddle.net, axboe@kernel.dk, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 ralf@linux-mips.org, tbogendoerfer@suse.de, paul.burton@mips.com,
 linux-alpha@vger.kernel.org, rafael@kernel.org, ink@jurassic.park.msu.ru,
 akpm@linux-foundation.org, robin.murphy@arm.com, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 30, 2019 at 11:22:29AM +0100, Michal Hocko wrote:
> On Wed 30-10-19 11:14:49, Peter Zijlstra wrote:
> > On Wed, Oct 30, 2019 at 05:34:28PM +0800, Yunsheng Lin wrote:
> > > When passing the return value of dev_to_node() to cpumask_of_node()
> > > without checking if the device's node id is NUMA_NO_NODE, there is
> > > global-out-of-bounds detected by KASAN.
> > > 
> > > From the discussion [1], NUMA_NO_NODE really means no node affinity,
> > > which also means all cpus should be usable. So the cpumask_of_node()
> > > should always return all cpus online when user passes the node id as
> > > NUMA_NO_NODE, just like similar semantic that page allocator handles
> > > NUMA_NO_NODE.
> > > 
> > > But we cannot really copy the page allocator logic. Simply because the
> > > page allocator doesn't enforce the near node affinity. It just picks it
> > > up as a preferred node but then it is free to fallback to any other numa
> > > node. This is not the case here and node_to_cpumask_map will only restrict
> > > to the particular node's cpus which would have really non deterministic
> > > behavior depending on where the code is executed. So in fact we really
> > > want to return cpu_online_mask for NUMA_NO_NODE.
> > > 
> > > Also there is a debugging version of node_to_cpumask_map() for x86 and
> > > arm64, which is only used when CONFIG_DEBUG_PER_CPU_MAPS is defined, this
> > > patch changes it to handle NUMA_NO_NODE as normal node_to_cpumask_map().
> > > 
> > > [1] https://lkml.org/lkml/2019/9/11/66
> > > Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>
> > > Suggested-by: Michal Hocko <mhocko@kernel.org>
> > > Acked-by: Michal Hocko <mhocko@suse.com>
> > > Acked-by: Paul Burton <paul.burton@mips.com> # MIPS bits
> > 
> > Still:
> > 
> > Nacked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> 
> Do you have any other proposal that doesn't make any wild guesses about
> which node to use instead of the undefined one?

It only makes 'wild' guesses when the BIOS is shit and it complains
about that.

Or do you like you BIOS broken?
