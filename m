Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E872D5D61
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 15:20:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsGKp6KF6zDr1G
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 01:20:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsBY76cH9zDqk7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 22:30:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4CsBY56Y86z9shh; Thu, 10 Dec 2020 22:30:17 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CsBY51qyvz9sfN; Thu, 10 Dec 2020 22:30:16 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20201124120547.1940635-1-mpe@ellerman.id.au>
References: <20201124120547.1940635-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 1/3] powerpc: Make NUMA depend on SMP
Message-Id: <160756604761.1313423.18058608408740419327.b4-ty@ellerman.id.au>
Date: Thu, 10 Dec 2020 22:30:16 +1100 (AEDT)
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
Cc: rdunlap@infradead.org, srikar@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 24 Nov 2020 23:05:45 +1100, Michael Ellerman wrote:
> Our Kconfig allows NUMA to be enabled without SMP, but none of
> our defconfigs use that combination. This means it can easily be
> broken inadvertently by code changes, which has happened recently.
> 
> Although it's theoretically possible to have a machine with a single
> CPU and multiple memory nodes, I can't think of any real systems where
> that's the case. Even so if such a system exists, it can just run an
> SMP kernel anyway.
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc: Make NUMA depend on SMP
      https://git.kernel.org/powerpc/c/25395cd2f8cb24ce6a5ce073c898acfb091e06cf
[2/3] powerpc: Make NUMA default y for powernv
      https://git.kernel.org/powerpc/c/4c28b32b886f1489c5f510ed8e3f0c4e3dcb59f5
[3/3] powerpc: Update NUMA Kconfig description & help text
      https://git.kernel.org/powerpc/c/bae80c27fc2195b9e5723d7b05c592e0874f4ba9

cheers
