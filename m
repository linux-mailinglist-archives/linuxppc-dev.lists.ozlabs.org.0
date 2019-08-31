Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2C1A4383
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 10:58:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46L9HR3NyWzDrDJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 18:58:27 +1000 (AEST)
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
 header.b="qiono8HQ"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46L9FF5ZqVzDrBp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 18:56:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bpmJrLVfa0mf3hodzsOvY8P9oDNTTP+ppQS83HW7TuU=; b=qiono8HQcx8QMb67P+xwGsPTW
 hJjYBTrxg3+Yk4GWZfJcquXrDgt7B8HtUI5jx+NHxBPbjbFcDxbkxbEX4rFiYOgNzm8rjxiXYXCY2
 etA1eNQAnRoonCmdg9YEYakEi5hwYc0X5eLurwRMdQXe8Uj/3PK3Er7egbBd2c5r5NlfHKsbbhaUS
 cudRPM4bnnBGRIQlI03YwfyYpc4rAy2PySVqM3qgv4L5CQdE3KJtvuEgdJEMxcWQYVEPsQVue2EU7
 8A8Otkomvo6eVA4C7FxNvLKS8ZmxTAuQbczi1YAXTglJ91f5i3n8lWYqQge3fqosoxI+qv9c2aFlp
 L6kX9czzA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i3zAh-0003Sj-AG; Sat, 31 Aug 2019 08:55:47 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id C4B93300B8D;
 Sat, 31 Aug 2019 10:55:04 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id A1EE429B2CD09; Sat, 31 Aug 2019 10:55:39 +0200 (CEST)
Date: Sat, 31 Aug 2019 10:55:39 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Yunsheng Lin <linyunsheng@huawei.com>
Subject: Re: [PATCH v2 2/9] x86: numa: check the node id consistently for x86
Message-ID: <20190831085539.GG2369@hirez.programming.kicks-ass.net>
References: <1567231103-13237-1-git-send-email-linyunsheng@huawei.com>
 <1567231103-13237-3-git-send-email-linyunsheng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1567231103-13237-3-git-send-email-linyunsheng@huawei.com>
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
 will@kernel.org, cai@lca.pw, linux-s390@vger.kernel.org,
 ysato@users.sourceforge.jp, x86@kernel.org, rppt@linux.ibm.com,
 borntraeger@de.ibm.com, dledford@redhat.com, mingo@redhat.com,
 jeffrey.t.kirsher@intel.com, jhogan@kernel.org, nfont@linux.vnet.ibm.com,
 mattst88@gmail.com, len.brown@intel.com, gor@linux.ibm.com,
 anshuman.khandual@arm.com, bp@alien8.de, luto@kernel.org, tglx@linutronix.de,
 naveen.n.rao@linux.vnet.ibm.com, linux-arm-kernel@lists.infradead.org,
 rth@twiddle.net, axboe@kernel.dk, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, ralf@linux-mips.org, tbogendoerfer@suse.de,
 paul.burton@mips.com, linux-alpha@vger.kernel.org, ink@jurassic.park.msu.ru,
 akpm@linux-foundation.org, robin.murphy@arm.com, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Aug 31, 2019 at 01:58:16PM +0800, Yunsheng Lin wrote:
> According to Section 6.2.14 from ACPI spec 6.3 [1], the setting
> of proximity domain is optional, as below:
> 
> This optional object is used to describe proximity domain
> associations within a machine. _PXM evaluates to an integer
> that identifies a device as belonging to a Proximity Domain
> defined in the System Resource Affinity Table (SRAT).

That's just words.. what does it actually mean?

> This patch checks node id with the below case before returning
> node_to_cpumask_map[node]:
> 1. if node_id >= nr_node_ids, return cpu_none_mask
> 2. if node_id < 0, return cpu_online_mask
> 3. if node_to_cpumask_map[node_id] is NULL, return cpu_online_mask
> 
> [1] https://uefi.org/sites/default/files/resources/ACPI_6_3_final_Jan30.pdf
> 
> Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>
> ---
>  arch/x86/include/asm/topology.h | 6 ++++++
>  arch/x86/mm/numa.c              | 2 +-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/include/asm/topology.h b/arch/x86/include/asm/topology.h
> index 4b14d23..f36e9c8 100644
> --- a/arch/x86/include/asm/topology.h
> +++ b/arch/x86/include/asm/topology.h
> @@ -69,6 +69,12 @@ extern const struct cpumask *cpumask_of_node(int node);
>  /* Returns a pointer to the cpumask of CPUs on Node 'node'. */
>  static inline const struct cpumask *cpumask_of_node(int node)
>  {
> +	if (node >= nr_node_ids)
> +		return cpu_none_mask;
> +
> +	if (node < 0 || !node_to_cpumask_map[node])
> +		return cpu_online_mask;
> +
>  	return node_to_cpumask_map[node];
>  }
>  #endif

I _reallly_ hate this. Users are expected to use valid numa ids. Now
we're adding all this checking to all users. Why do we want to do that?

Using '(unsigned)node >= nr_nods_ids' is an error.

> diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
> index e6dad60..5e393d2 100644
> --- a/arch/x86/mm/numa.c
> +++ b/arch/x86/mm/numa.c
> @@ -868,7 +868,7 @@ const struct cpumask *cpumask_of_node(int node)
>  		dump_stack();
>  		return cpu_none_mask;
>  	}
> -	if (node_to_cpumask_map[node] == NULL) {
> +	if (node < 0 || !node_to_cpumask_map[node]) {
>  		printk(KERN_WARNING
>  			"cpumask_of_node(%d): no node_to_cpumask_map!\n",
>  			node);
> -- 
> 2.8.1
> 
