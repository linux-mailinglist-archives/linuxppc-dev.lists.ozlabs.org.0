Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC52294000
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 17:54:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFyqS43bNzDqdb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 02:54:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=vbabka@suse.cz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.cz
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFymx1XcqzDqK5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Oct 2020 02:52:12 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2661AAE95;
 Tue, 20 Oct 2020 15:52:08 +0000 (UTC)
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-mm <linux-mm@kvack.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>
References: <31ef1305-1fd4-8159-a2ca-e9968a568ff0@csgroup.eu>
From: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: mm: Question about the use of 'accessed' flags and pte_young()
 helper
Message-ID: <ed3d1e19-b18b-d10e-2c86-0fb7ce3a431d@suse.cz>
Date: Tue, 20 Oct 2020 17:52:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <31ef1305-1fd4-8159-a2ca-e9968a568ff0@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/8/20 11:49 AM, Christophe Leroy wrote:
> In a 10 years old commit
> (https://github.com/linuxppc/linux/commit/d069cb4373fe0d451357c4d3769623a7564dfa9f), powerpc 8xx has
> made the handling of PTE accessed bit conditional to CONFIG_SWAP.
> Since then, this has been extended to some other powerpc variants.
> 
> That commit means that when CONFIG_SWAP is not selected, the accessed bit is not set by SW TLB miss
> handlers, leading to pte_young() returning garbage, or should I say possibly returning false
> allthough a page has been accessed since its access flag was reset.
> 
> Looking at various mm/ places, pte_young() is used independent of CONFIG_SWAP
> 
> Is it still valid the not manage accessed flags when CONFIG_SWAP is not selected ?

AFAIK it's wrong, reclaim needs it to detect accessed pages on inactive list, 
via page_referenced(), including file pages (page cache) where CONFIG_SWAP plays 
no role. Maybe it was different 10 years ago.

> If yes, should pte_young() always return true in that case ?

It should best work as intended. If not possible, true is maybe better, as false 
will lead to inactive file list thrashing.

> While we are at it, I'm wondering whether powerpc should redefine arch_faults_on_old_pte()
> On some variants of powerpc, accessed flag is managed by HW. On others, it is managed by SW TLB miss
> handlers via page fault handling.
> 
> Thanks
> Christophe
> 

