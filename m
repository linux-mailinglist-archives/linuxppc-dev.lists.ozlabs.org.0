Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8559F1291B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 09:51:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wPTt6sq6zDqZn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 17:51:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wNKY2m0pzDqS6
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 16:59:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 44wNKW2x7Jz9sPC; Fri,  3 May 2019 16:59:27 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 2c474c03505677cfd987d52e8bf42abe8c270529
X-Patchwork-Hint: ignore
In-Reply-To: <20190430075907.7701-1-aneesh.kumar@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com,
 paulus@samba.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/mm/radix: Fix kernel crash when running subpage
 protect test
Message-Id: <44wNKW2x7Jz9sPC@ozlabs.org>
Date: Fri,  3 May 2019 16:59:27 +1000 (AEST)
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-04-30 at 07:59:07 UTC, "Aneesh Kumar K.V" wrote:
> This patch fixes the below crash by making sure we touch the subpage protection
> related structures only if we know they are allocated on the platform. With
> radix translation we don't allocate hash context at all and trying to access
> subpage_prot_table results in
> 
>  Faulting instruction address: 0xc00000000008bdb4
>  Oops: Kernel access of bad area, sig: 11 [#1]
>  LE PAGE_SIZE=64K MMU=Radix MMU=Hash SMP NR_CPUS=2048 NUMA PowerNV
>  ....
>  NIP [c00000000008bdb4] sys_subpage_prot+0x74/0x590
>  LR [c00000000000b688] system_call+0x5c/0x70
>  Call Trace:
>  [c00020002c6b7d30] [c00020002c6b7d90] 0xc00020002c6b7d90 (unreliable)
>  [c00020002c6b7e20] [c00000000000b688] system_call+0x5c/0x70
>  Instruction dump:
>  fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f821ff11 e92d1178 f9210068
>  39200000 e92d0968 ebe90630 e93f03e8 <eb891038> 60000000 3860fffe e9410068
> 
> We also move the subpage_prot_table with mmp_sem held to avoid racec
> between two parallel subpage_prot syscall.
> 
> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com <mailto:sachinp@linux.vnet.ibm.com>>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/2c474c03505677cfd987d52e8bf42abe

cheers
