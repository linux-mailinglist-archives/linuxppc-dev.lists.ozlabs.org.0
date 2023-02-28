Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD0F6A612D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 22:22:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PR9M24bsTz3cBm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 08:22:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EWCQE/HQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EWCQE/HQ;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PR95h6Z4Nz2ylk
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Mar 2023 08:11:20 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 25887611D8;
	Tue, 28 Feb 2023 21:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 620DBC433EF;
	Tue, 28 Feb 2023 21:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677618677;
	bh=hQNwE+IEUbKQvI91yvljJosaVP7JCZ7+8bppV3cOFbg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EWCQE/HQjrWuM9JLi5n8h88COIVDC0Dwj8Ls7hxDeYr4SIALkO/qqCk/UGcAvWK5o
	 c02+sh/QcUi/6bE0ILdbEb/C+A8GV+CJaLo8WfaGxJWgLFvkSK7vL/E7uokCa4MOxg
	 ngdg3jXiJrkGUm98gEQXAgu/dxa50c+7WgMlmDgNw1PpnJ2oFrWoeU4ingGh4tZ7R7
	 NCLLPqaZ1Zn4rnovGjIPX8BlJ6CPAfDs1vwTGYqI9oMCtgbAk9Bh8oF1Q3q6KxteX4
	 j5u6Jm2tA55Z1q6NEJRkgLy4vCcaaRiYhIH8qBVhYl9/Ucn2GR4gvjnvRg/iSe5UV4
	 UdVCGz5UeLKDg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3FB70C691DE;
	Tue, 28 Feb 2023 21:11:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH mm-unstable v1 00/26] mm: support
 __HAVE_ARCH_PTE_SWP_EXCLUSIVE on all architectures with swap PTEs
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167761867725.10135.3611718470427113262.git-patchwork-notify@kernel.org>
Date: Tue, 28 Feb 2023 21:11:17 +0000
References: <20230113171026.582290-1-david@redhat.com>
In-Reply-To: <20230113171026.582290-1-david@redhat.com>
To: David Hildenbrand <david@redhat.com>
X-Mailman-Approved-At: Wed, 01 Mar 2023 08:22:08 +1100
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
Cc: chenhuacai@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, shy828301@gmail.com, dave.hansen@linux.intel.com, peterx@redhat.com, linux-mips@vger.kernel.org, James.Bottomley@HansenPartnership.com, linux-mm@kvack.org, dalias@libc.org, namit@vmware.com, hpa@zytor.com, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, gerg@linux-m68k.org, anton.ivanov@cambridgegreys.com, aarcange@redhat.com, linux-s390@vger.kernel.org, ysato@users.sourceforge.jp, linux-hexagon@vger.kernel.org, deller@gmx.de, x86@kernel.org, hughd@google.com, linux@armlinux.org.uk, linux-csky@vger.kernel.org, rppt@linux.ibm.com, mingo@redhat.com, geert@linux-m68k.org, vbabka@suse.cz, jgg@nvidia.com, vgupta@kernel.org, mattst88@gmail.com, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, aou@eecs.berkeley.edu, chris@zankel.net, ink@jurassic.park.msu.ru, jhubbard@nvidia.com, linux-um@lists.infradead.org, npiggin@gmail.com, stefan.kristiansson@saunalahti.fi, richard@nod.at, li
 nux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, bp@alien8.de, loongarch@lists.linux.dev, paul.walmsley@sifive.com, shorne@gmail.com, richard.henderson@linaro.org, johannes@sipsolutions.net, linux-arm-kernel@lists.infradead.org, kernel@xen0n.name, bcain@quicinc.com, monstr@monstr.eu, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, jcmvbkbc@gmail.com, linux-kernel@vger.kernel.org, dinguyen@kernel.org, palmer@dabbelt.com, linux-alpha@vger.kernel.org, tglx@linutronix.de, guoren@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This series was applied to riscv/linux.git (for-next)
by Andrew Morton <akpm@linux-foundation.org>:

On Fri, 13 Jan 2023 18:10:00 +0100 you wrote:
> This is the follow-up on [1]:
> 	[PATCH v2 0/8] mm: COW fixes part 3: reliable GUP R/W FOLL_GET of
> 	anonymous pages
> 
> After we implemented __HAVE_ARCH_PTE_SWP_EXCLUSIVE on most prominent
> enterprise architectures, implement __HAVE_ARCH_PTE_SWP_EXCLUSIVE on all
> remaining architectures that support swap PTEs.
> 
> [...]

Here is the summary with links:
  - [mm-unstable,v1,01/26] mm/debug_vm_pgtable: more pte_swp_exclusive() sanity checks
    (no matching commit)
  - [mm-unstable,v1,02/26] alpha/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
    (no matching commit)
  - [mm-unstable,v1,03/26] arc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
    (no matching commit)
  - [mm-unstable,v1,04/26] arm/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
    (no matching commit)
  - [mm-unstable,v1,05/26] csky/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
    (no matching commit)
  - [mm-unstable,v1,06/26] hexagon/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
    (no matching commit)
  - [mm-unstable,v1,07/26] ia64/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
    (no matching commit)
  - [mm-unstable,v1,08/26] loongarch/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
    (no matching commit)
  - [mm-unstable,v1,09/26] m68k/mm: remove dummy __swp definitions for nommu
    (no matching commit)
  - [mm-unstable,v1,10/26] m68k/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
    (no matching commit)
  - [mm-unstable,v1,11/26] microblaze/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
    (no matching commit)
  - [mm-unstable,v1,12/26] mips/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
    (no matching commit)
  - [mm-unstable,v1,13/26] nios2/mm: refactor swap PTE layout
    (no matching commit)
  - [mm-unstable,v1,14/26] nios2/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
    (no matching commit)
  - [mm-unstable,v1,15/26] openrisc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
    (no matching commit)
  - [mm-unstable,v1,16/26] parisc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
    (no matching commit)
  - [mm-unstable,v1,17/26] powerpc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE on 32bit book3s
    (no matching commit)
  - [mm-unstable,v1,18/26] powerpc/nohash/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
    (no matching commit)
  - [mm-unstable,v1,19/26] riscv/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
    https://git.kernel.org/riscv/c/51a1007d4113
  - [mm-unstable,v1,20/26] sh/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
    (no matching commit)
  - [mm-unstable,v1,21/26] sparc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE on 32bit
    (no matching commit)
  - [mm-unstable,v1,22/26] sparc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE on 64bit
    (no matching commit)
  - [mm-unstable,v1,23/26] um/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
    (no matching commit)
  - [mm-unstable,v1,24/26] x86/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE also on 32bit
    (no matching commit)
  - [mm-unstable,v1,25/26] xtensa/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
    (no matching commit)
  - [mm-unstable,v1,26/26] mm: remove __HAVE_ARCH_PTE_SWP_EXCLUSIVE
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


