Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B438818B8B6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 15:09:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jpgx00gMzDqvt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 01:09:49 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jnft1MPDzDr7Z
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 00:23:50 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 927ECABDC;
 Thu, 19 Mar 2020 13:23:43 +0000 (UTC)
Subject: Re: [RFC 1/2] mm, slub: prevent kmalloc_node crashes and memory leaks
To: Sachin Sant <sachinp@linux.vnet.ibm.com>
References: <20200318144220.18083-1-vbabka@suse.cz>
 <20200318160610.GD26049@in.ibm.com>
 <e060ad43-ff4e-0e59-2e64-ce8a4916ec70@suse.cz>
 <0F67B5AA-96DF-4977-BDC6-D72959B3F7EF@linux.vnet.ibm.com>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <b9b95895-ca6b-5ad2-1f67-45fee93d1e67@suse.cz>
Date: Thu, 19 Mar 2020 14:23:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <0F67B5AA-96DF-4977-BDC6-D72959B3F7EF@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Mel Gorman <mgorman@techsingularity.net>, Michal Hocko <mhocko@kernel.org>,
 Pekka Enberg <penberg@kernel.org>, linux-mm@kvack.org,
 Kirill Tkhai <ktkhai@virtuozzo.com>, David Rientjes <rientjes@google.com>,
 Christopher Lameter <cl@linux.com>, bharata@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, Joonsoo Kim <iamjoonsoo.kim@lge.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/19/20 9:52 AM, Sachin Sant wrote:
> 
>> OK how about this version? It's somewhat ugly, but important is that the fast
>> path case (c->page exists) is unaffected and another common case (c->page is
>> NULL, but node is NUMA_NO_NODE) is just one extra check - impossible to avoid at
>> some point anyway.
>> 
> 
> I attempted the suggested tests.
> 
> Test 1: March 18 linux-next + Patch 1 [1] + Patch  2 [2]
> 
> Machine boots fine. numactl o/p after boot:

Great, thanks! Can I add your Tested-by: then?

If Bharata confirms his scenario with updated patch, I will send it properly.

> # numactl -H
> available: 2 nodes (0-1)
> node 0 cpus:
> node 0 size: 0 MB
> node 0 free: 0 MB
> node 1 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
> node 1 size: 35631 MB
> node 1 free: 32724 MB
> node distances:
> node   0   1
>   0:  10  40
>   1:  40  10
> #
> 
> Test 2: Code base as used in Test 1 + 3 patch series from Srikar [3]
> 
> Machine boots fine. numactl o/p after boot:
> 
> # numactl -H
> available: 1 nodes (1)
> node 1 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
> node 1 size: 35631 MB
> node 1 free: 32711 MB
> node distances:
> node   1
>   1:  10
> #
> 
> Thanks!
> -Sachin
> 
> 
> [1] https://lore.kernel.org/linux-mm/e060ad43-ff4e-0e59-2e64-ce8a4916ec70@suse.cz/T/#mb8d0a358dc5c5fb9661fa45047072a92c510faf2
> [2] https://lore.kernel.org/linux-mm/e060ad43-ff4e-0e59-2e64-ce8a4916ec70@suse.cz/T/#mce342e54a95ce2ee3043901e52d70ee2fd94c516
> [3] https://lore.kernel.org/linux-mm/20200311110237.5731-1-srikar@linux.vnet.ibm.com/
> 

