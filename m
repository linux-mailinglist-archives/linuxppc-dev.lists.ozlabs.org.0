Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87374233284
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 15:00:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHVrC333szDqLV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 23:00:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHVcp1NgYzDqwh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 22:50:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BHVcn6N0cz9sSt; Thu, 30 Jul 2020 22:50:17 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <1595996214-5833-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1595996214-5833-1-git-send-email-atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc: Fix MMCRA_BHRB_DISABLE define to work with
 binutils version < 2.28
Message-Id: <159611328062.1601380.12272357146305380354.b4-ty@ellerman.id.au>
Date: Thu, 30 Jul 2020 22:50:17 +1000 (AEST)
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
Cc: maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 29 Jul 2020 00:16:54 -0400, Athira Rajeev wrote:
> commit 9908c826d5ed ("powerpc/perf: Add Power10 PMU feature to
> DT CPU features") defines MMCRA_BHRB_DISABLE as `0x2000000000UL`.
> Binutils version less than 2.28 doesn't support UL suffix.
> 
> linux-ppc/arch/powerpc/kernel/cpu_setup_power.S: Assembler messages:
> linux-ppc/arch/powerpc/kernel/cpu_setup_power.S:250: Error: found 'L', expected: ')'
> linux-ppc/arch/powerpc/kernel/cpu_setup_power.S:250: Error: junk at end of line, first unrecognized character is `L'
> linux-ppc/arch/powerpc/kernel/cpu_setup_power.S:250: Error: found 'L', expected: ')'
> linux-ppc/arch/powerpc/kernel/cpu_setup_power.S:250: Error: found 'L', expected: ')'
> linux-ppc/arch/powerpc/kernel/cpu_setup_power.S:250: Error: junk at end of line, first unrecognized character is `L'
> linux-ppc/arch/powerpc/kernel/cpu_setup_power.S:250: Error: found 'L', expected: ')'
> linux-ppc/arch/powerpc/kernel/cpu_setup_power.S:250: Error: found 'L', expected: ')'
> linux-ppc/arch/powerpc/kernel/cpu_setup_power.S:250: Error: operand out of range (0x0000002000000000 is not between 0xffffffffffff8000 and 0x000000000000ffff)
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/perf: Fix MMCRA_BHRB_DISABLE define for binutils < 2.28
      https://git.kernel.org/powerpc/c/443359aebce0e17148251c0e316801fe69aa7d33

cheers
