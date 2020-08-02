Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F353235740
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 15:54:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKMvs5N8kzDqM1
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 23:54:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKMT56gWTzDqH2
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Aug 2020 23:35:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4BKMT405vkz9sSt; Sun,  2 Aug 2020 23:35:04 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BKMT34hVPz9sTY; Sun,  2 Aug 2020 23:35:03 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
In-Reply-To: <159290806973.3642154.5244613424529764050.stgit@jupiter>
References: <159290806973.3642154.5244613424529764050.stgit@jupiter>
Subject: Re: [PATCH v2] hmi: Move hmi irq stat from percpu variable to paca.
Message-Id: <159637523542.42190.10686121786281678786.b4-ty@ellerman.id.au>
Date: Sun,  2 Aug 2020 23:35:03 +1000 (AEST)
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
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 23 Jun 2020 15:57:50 +0530, Mahesh Salgaonkar wrote:
> With the proposed change in percpu bootmem allocator to use page mapping
> [1], the percpu first chunk memory area can come from vmalloc ranges. This
> makes hmi handler to crash the kernel whenever percpu variable is accessed
> in real mode.  This patch fixes this issue by moving the hmi irq stat
> inside paca for safe access in realmode.
> 
> [1] https://lore.kernel.org/linuxppc-dev/20200608070904.387440-1-aneesh.kumar@linux.ibm.com/

Applied to powerpc/next.

[1/1] powerpc/64s: Move HMI IRQ stat from percpu variable to paca.
      https://git.kernel.org/powerpc/c/ada68a66b72687e6b74e35c42efd1783e84b01fd

cheers
