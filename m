Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7F430D931
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 12:52:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW0Qv0gVJzDwtW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 22:52:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW0916ngzzDwtn
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 22:40:05 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DW08y6TrGz9sX5; Wed,  3 Feb 2021 22:40:02 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Qian Cai <cai@lca.pw>
In-Reply-To: <20200510051559.1959-1-cai@lca.pw>
References: <20200510051559.1959-1-cai@lca.pw>
Subject: Re: [PATCH] powerpc/mm/book3s64/iommu: fix some RCU-list locks
Message-Id: <161235200882.1516112.5579154052220245435.b4-ty@ellerman.id.au>
Date: Wed,  3 Feb 2021 22:40:02 +1100 (AEDT)
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
Cc: aik@ozlabs.ru, paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, paulmck@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 10 May 2020 01:15:59 -0400, Qian Cai wrote:
> It is safe to traverse mm->context.iommu_group_mem_list with either
> mem_list_mutex or the RCU read lock held. Silence a few RCU-list false
> positive warnings and fix a few missing RCU read locks.
> 
>  arch/powerpc/mm/book3s64/iommu_api.c:330 RCU-list traversed in non-reader section!!
> 
>  other info that might help us debug this:
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/mm/book3s64/iommu: fix some RCU-list locks
      https://git.kernel.org/powerpc/c/b5952f8125ae512420d5fc569adce591bea73bf5

cheers
