Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC1D26DB55
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 14:19:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bsbcc2H4rzDqLM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 22:19:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsZSp1rWBzDqWZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 21:27:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BsZSl4Jkgz9sVN; Thu, 17 Sep 2020 21:27:35 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
In-Reply-To: <20200818081104.57888-1-srikar@linux.vnet.ibm.com>
References: <20200818081104.57888-1-srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v6 0/3] Offline memoryless cpuless node 0
Message-Id: <160034200804.3339803.1749893588789945413.b4-ty@ellerman.id.au>
Date: Thu, 17 Sep 2020 21:27:35 +1000 (AEST)
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
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>, Michal Hocko <mhocko@suse.com>,
 David Hildenbrand <david@redhat.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-mm@kvack.org,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, Mel Gorman <mgorman@suse.de>,
 Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christopher Lameter <cl@linux.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 18 Aug 2020 13:41:01 +0530, Srikar Dronamraju wrote:
> Changelog v5:->v6:
> - Now the fix is Powerpc specific.
> 	(David Hildenbrand, Michal Hocko, Christopher Lamater)
> - rebased to v5.8
> link v5: https://lore.kernel.org/linuxppc-dev/20200624092846.9194-1-srikar@linux.vnet.ibm.com/t/#u
> 
> Changelog v4:->v5:
> - rebased to v5.8
> link v4: http://lore.kernel.org/lkml/20200512132937.19295-1-srikar@linux.vnet.ibm.com/t/#u
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/numa: Set numa_node for all possible cpus
      https://git.kernel.org/powerpc/c/a874f1005ef5dfe53dfd8cda59a6600e89986ecd
[2/3] powerpc/numa: Prefer node id queried from vphn
      https://git.kernel.org/powerpc/c/6398eaa268168b528dd1d3d0e70e61e9c13bea23
[3/3] powerpc/numa: Offline memoryless cpuless node 0
      https://git.kernel.org/powerpc/c/e75130f20b1f48e04ccc806aea01f0a361f9cb6b

cheers
