Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF732B3A51
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2019 14:27:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46X59H1cJSzF4KK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2019 22:27:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=mhocko@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46X56361y3zF1f3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 22:24:42 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2F895B643;
 Mon, 16 Sep 2019 12:24:37 +0000 (UTC)
Date: Mon, 16 Sep 2019 14:23:59 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Yunsheng Lin <linyunsheng@huawei.com>
Subject: Re: [PATCH v4] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Message-ID: <20190916122359.GG10231@dhcp22.suse.cz>
References: <1568535656-158979-1-git-send-email-linyunsheng@huawei.com>
 <20190916084328.GC10231@dhcp22.suse.cz>
 <8df06e27-ad21-bf14-dbd6-cc8f5a274ec2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8df06e27-ad21-bf14-dbd6-cc8f5a274ec2@huawei.com>
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
Cc: dalias@libc.org, linux-sh@vger.kernel.org, peterz@infradead.org,
 catalin.marinas@arm.com, dave.hansen@linux.intel.com,
 heiko.carstens@de.ibm.com, jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org,
 mwb@linux.vnet.ibm.com, paulus@samba.org, hpa@zytor.com,
 sparclinux@vger.kernel.org, chenhc@lemote.com, will@kernel.org, cai@lca.pw,
 linux-s390@vger.kernel.org, ysato@users.sourceforge.jp, x86@kernel.org,
 rppt@linux.ibm.com, borntraeger@de.ibm.com, dledford@redhat.com,
 mingo@redhat.com, jeffrey.t.kirsher@intel.com, jhogan@kernel.org,
 mattst88@gmail.com, len.brown@intel.com, gor@linux.ibm.com,
 anshuman.khandual@arm.com, gregkh@linuxfoundation.org, bp@alien8.de,
 luto@kernel.org, tglx@linutronix.de, naveen.n.rao@linux.vnet.ibm.com,
 linux-arm-kernel@lists.infradead.org, rth@twiddle.net, axboe@kernel.dk,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 ralf@linux-mips.org, tbogendoerfer@suse.de, paul.burton@mips.com,
 linux-alpha@vger.kernel.org, rafael@kernel.org, ink@jurassic.park.msu.ru,
 akpm@linux-foundation.org, robin.murphy@arm.com, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon 16-09-19 20:07:22, Yunsheng Lin wrote:
[...]
> >> @@ -861,9 +861,12 @@ void numa_remove_cpu(int cpu)
> >>   */
> >>  const struct cpumask *cpumask_of_node(int node)
> >>  {
> >> -	if (node >= nr_node_ids) {
> >> +	if (node == NUMA_NO_NODE)
> >> +		return cpu_online_mask;
> >> +
> >> +	if ((unsigned int)node >= nr_node_ids) {
> >>  		printk(KERN_WARNING
> >> -			"cpumask_of_node(%d): node > nr_node_ids(%u)\n",
> >> +			"cpumask_of_node(%d): node >= nr_node_ids(%u)\n",
> >>  			node, nr_node_ids);
> >>  		dump_stack();
> >>  		return cpu_none_mask;
> > 
> > Why do we need this?
> 
> As the commit log says, the above cpumask_of_node() is for debugging,
> it should catch other "node < 0" cases except NUMA_NO_NODE.

OK, I would just make it a separate patch.

-- 
Michal Hocko
SUSE Labs
