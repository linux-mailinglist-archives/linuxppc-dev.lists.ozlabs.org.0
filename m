Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4832D59F9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 13:07:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsCMN3f60zDqR7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 23:06:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsBXN3MlczDqc4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 22:29:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CsBXN01xMz9sWX; Thu, 10 Dec 2020 22:29:39 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <1606409684-1589-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1606409684-1589-1-git-send-email-atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V2 0/7] powerpc/perf: Fixes for power10 PMU
Message-Id: <160756606739.1313423.17340323025629761768.b4-ty@ellerman.id.au>
Date: Thu, 10 Dec 2020 22:29:39 +1100 (AEDT)
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
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 26 Nov 2020 11:54:37 -0500, Athira Rajeev wrote:
> Patchset contains PMU fixes for power10.
> 
> This patchset contains 7 patches.
> Patch1 includes fix to update event code with radix_scope_qual
> bit in power10.
> Patch2 and Patch3 updates the event group constraints for L2/L3
> and threshold events in power10.
> Patch4, patch5 and patch6 includes the event code changes for
> l2/l3 events and some of the generic events.
> Patch7 adds fixes for PMCCEXT bit in power10.
> 
> [...]

Applied to powerpc/next.

[1/7] powerpc/perf: Fix to update radix_scope_qual in power10
      https://git.kernel.org/powerpc/c/d3afd28cd2f35b2a1046b76e0cf010b684da2e84
[2/7] powerpc/perf: Update the PMU group constraints for l2l3 events in power10
      https://git.kernel.org/powerpc/c/e924be7b0b0d1f37d0509c854a92c7a71e3cdfe7
[3/7] powerpc/perf: Fix the PMU group constraints for threshold events in power10
      https://git.kernel.org/powerpc/c/0263bbb377af0c2d38bc8b2ad2ff147e240094de
[4/7] powerpc/perf: Add generic and cache event list for power10 DD1
      https://git.kernel.org/powerpc/c/c0e3985790251b307b7b71b687ed0128741b3f34
[5/7] powerpc/perf: Fix to update generic event codes for power10
      https://git.kernel.org/powerpc/c/1f12316394e3b241e70ed620ca846002c8ace3ec
[6/7] powerpc/perf: Fix to update cache events with l2l3 events in power10
      https://git.kernel.org/powerpc/c/9a8ee52634235993273c43ef67669d8168497dd7
[7/7] powerpc/perf: MMCR0 control for PMU registers under PMCC=00
      https://git.kernel.org/powerpc/c/91668ab7db4bcfae332e561df1de2401f3f18553

cheers
