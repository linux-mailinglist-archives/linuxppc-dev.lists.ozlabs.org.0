Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5CC2DABBA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 12:19:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwG4P3bjQzDqHh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 22:19:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwFPB4VXRzDqMf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Dec 2020 21:49:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CwFPB2Ysxz9sVk; Tue, 15 Dec 2020 21:49:01 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Michael Neuling <mikey@neuling.org>, Peter Zijlstra <peterz@infradead.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nathan Lynch <nathanl@linux.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Anton Blanchard <anton@ozlabs.org>
In-Reply-To: <1607596739-32439-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1607596739-32439-1-git-send-email-ego@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 0/5] Extend Parsing "ibm,
 thread-groups" for Shared-L2 information
Message-Id: <160802921455.504444.5516120059698119802.b4-ty@ellerman.id.au>
Date: Tue, 15 Dec 2020 21:49:01 +1100 (AEDT)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 10 Dec 2020 16:08:54 +0530, Gautham R. Shenoy wrote:
> This is the v2 of the patchset to extend parsing of "ibm,thread-groups" property
> to discover the Shared-L2 cache information.
> 
> The previous versions can be found here :
> 
> v2 : https://lore.kernel.org/linuxppc-dev/1607533700-5546-1-git-send-email-ego@linux.vnet.ibm.com/T/#m043ea15d3832658527fca94765202b9cbefd330d
> 
> [...]

Applied to powerpc/next.

[1/5] powerpc/smp: Parse ibm,thread-groups with multiple properties
      https://git.kernel.org/powerpc/c/790a1662d3a26fe9fa5f691386d8fde6bb8b0dc2
[2/5] powerpc/smp: Rename cpu_l1_cache_map as thread_group_l1_cache_map
      https://git.kernel.org/powerpc/c/1fdc1d6632ff3f6813a2f15b65586bde8fe0f0ba
[3/5] powerpc/smp: Rename init_thread_group_l1_cache_map() to make it generic
      https://git.kernel.org/powerpc/c/fbd2b672e91d276b9fa5a729e4a823ba29fa2692
[4/5] powerpc/smp: Add support detecting thread-groups sharing L2 cache
      https://git.kernel.org/powerpc/c/9538abee18cca70ffd03cef56027388b0c5084cc
[5/5] powerpc/cacheinfo: Print correct cache-sibling map/list for L2 cache
      https://git.kernel.org/powerpc/c/0be47634db0baa9e91c7e635e7e73355d6a5cf43

cheers
