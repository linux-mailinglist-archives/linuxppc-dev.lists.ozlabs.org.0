Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 826E217B2AC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 01:13:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YSkl3PpMzDqsH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 11:13:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YSj12SHCzDqhY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 11:11:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48YSj11sTcz9sSM; Fri,  6 Mar 2020 11:11:49 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: fc37a1632d40c80c067eb1bc235139f5867a2667
In-Reply-To: <20200227134715.9715-1-desnesn@linux.ibm.com>
To: "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH,
 v2] powerpc: fix hardware PMU exception bug on PowerVM compatibility
 mode systems
Message-Id: <48YSj11sTcz9sSM@ozlabs.org>
Date: Fri,  6 Mar 2020 11:11:49 +1100 (AEDT)
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
Cc: leonardo@linux.ibm.com, desnesn@linux.ibm.com, gromero@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2020-02-27 at 13:47:15 UTC, "Desnes A. Nunes do Rosario" wrote:
> PowerVM systems running compatibility mode on a few Power8 revisions are
> still vulnerable to the hardware defect that loses PMU exceptions arriving
> prior to a context switch.
> 
> The software fix for this issue is enabled through the CPU_FTR_PMAO_BUG
> cpu_feature bit, nevertheless this bit also needs to be set for PowerVM
> compatibility mode systems.
> 
> Fixes: 68f2f0d431d9ea4 ("powerpc: Add a cpu feature CPU_FTR_PMAO_BUG")
> Signed-off-by: Desnes A. Nunes do Rosario <desnesn@linux.ibm.com>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/fc37a1632d40c80c067eb1bc235139f5867a2667

cheers
