Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C882BDCD9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 13:18:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dbBs1Q8QzDqdp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 21:17:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dZwN2m71zDqdf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 21:05:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46dZwM5n2sz9sPJ; Wed, 25 Sep 2019 21:05:23 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 7aec584eaf1cc1a527dcbe7d80f2e44e3bfcfe1d
In-Reply-To: <20190918140103.24395-1-aneesh.kumar@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/book3s64/radix: Avoid WARN_ON in destroy_context
Message-Id: <46dZwM5n2sz9sPJ@ozlabs.org>
Date: Wed, 25 Sep 2019 21:05:23 +1000 (AEST)
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 "Priya M . A" <priyama2@in.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-09-18 at 14:01:03 UTC, "Aneesh Kumar K.V" wrote:
> On failed task initialization due to memory allocation failures,
> we can call into destroy_context with process_tb entry set. This patch
> forces the process_tb entry to zero in destroy_context. With
> this patch, we lose the ability to track if we are destroying a context
> without flushing the process table entry.
> 
>  WARNING: CPU: 4 PID: 6368 at arch/powerpc/mm/mmu_context_book3s64.c:246 destroy_context+0x58/0x340
>  NIP [c0000000000875f8] destroy_context+0x58/0x340
>  LR [c00000000013da18] __mmdrop+0x78/0x270
>  Call Trace:
>  [c000000f7db77c80] [c00000000013da18] __mmdrop+0x78/0x270
>  [c000000f7db77cf0] [c0000000004d6a34] __do_execve_file.isra.13+0xbd4/0x1000
>  [c000000f7db77e00] [c0000000004d7428] sys_execve+0x58/0x70
>  [c000000f7db77e30] [c00000000000b388] system_call+0x5c/0x70
> 
> Reported-by: Priya M.A <priyama2@in.ibm.com>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/7aec584eaf1cc1a527dcbe7d80f2e44e3bfcfe1d

cheers
