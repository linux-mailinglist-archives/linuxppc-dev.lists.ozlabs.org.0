Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE4A247CB4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 05:24:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVx9Q07XWzDqXR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 13:24:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVx5Q4LmXzDqXN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 13:21:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BVx5Q3GDFz9sTT; Tue, 18 Aug 2020 13:21:14 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <20200817005618.3305028-1-maddy@linux.ibm.com>
References: <20200817005618.3305028-1-maddy@linux.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/kernel/cputable: cleanup the function
 declarations
Message-Id: <159772076231.1537671.8380311708899292462.b4-ty@ellerman.id.au>
Date: Tue, 18 Aug 2020 13:21:14 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 17 Aug 2020 06:26:17 +0530, Madhavan Srinivasan wrote:
> __machine_check_early_realmode_p*() are currently declared
> as extern in cputable.c and because of this when compiled
> with "C=1" (which enables semantic checker) produces these
> warnings.
> 
>   CHECK   arch/powerpc/kernel/mce_power.c
> arch/powerpc/kernel/mce_power.c:709:6: warning: symbol '__machine_check_early_realmode_p7' was not declared. Should it be static?
> arch/powerpc/kernel/mce_power.c:717:6: warning: symbol '__machine_check_early_realmode_p8' was not declared. Should it be static?
> arch/powerpc/kernel/mce_power.c:722:6: warning: symbol '__machine_check_early_realmode_p9' was not declared. Should it be static?
> arch/powerpc/kernel/mce_power.c:740:6: warning: symbol '__machine_check_early_realmode_p10' was not declared. Should it be static?
> 
> [...]

Applied to powerpc/fixes.

[1/2] powerpc/kernel: Cleanup machine check function declarations
      https://git.kernel.org/powerpc/c/388692e943a58f28aac0fe83e75f5994da9ff8a1
[2/2] powerpc: Add POWER10 raw mode cputable entry
      https://git.kernel.org/powerpc/c/327da008e65a25b8206b36b7fc0c9e4edbb36a58

cheers
