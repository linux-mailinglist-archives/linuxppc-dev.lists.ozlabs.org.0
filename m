Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1932E2D5B75
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 14:19:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsDyt0FcqzDr0K
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 00:19:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsBXp108vzDqcD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 22:30:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CsBXm6rsJz9sXN; Thu, 10 Dec 2020 22:30:00 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: fbarrat@linux.vnet.ibm.com, ajd@linux.ibm.com,
 Christophe Lombard <clombard@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20201125155013.39955-1-clombard@linux.vnet.ibm.com>
References: <20201125155013.39955-1-clombard@linux.vnet.ibm.com>
Subject: Re: [PATCH V4 0/5] ocxl: Mmio invalidation support
Message-Id: <160756606831.1313423.5733540078262067619.b4-ty@ellerman.id.au>
Date: Thu, 10 Dec 2020 22:30:00 +1100 (AEDT)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 25 Nov 2020 16:50:08 +0100, Christophe Lombard wrote:
> OpenCAPI 4.0/5.0 with TLBI/SLBI Snooping, is not used due to performance
> problems caused by the PAU having to process all incoming TLBI/SLBI
> commands which will cause them to back up on the PowerBus.
> 
> When the Address Translation Mode requires TLB operations to be initiated
> using MMIO registers, a set of registers like the following is used:
> • XTS MMIO ATSD0 LPARID register
> • XTS MMIO ATSD0 AVA register
> • XTS MMIO ATSD0 launch register, write access initiates a shoot down
> • XTS MMIO ATSD0 status register
> 
> [...]

Applied to powerpc/next.

[1/5] ocxl: Assign a register set to a Logical Partition
      https://git.kernel.org/powerpc/c/fc1347b5feb685073ce2108c68cd8147340be016
[2/5] ocxl: Initiate a TLB invalidate command
      https://git.kernel.org/powerpc/c/19b311ca51e108b6d8d679496af8635fdc1984a8
[3/5] ocxl: Update the Process Element Entry
      https://git.kernel.org/powerpc/c/d731feea00c7c1734c9697558f2a1962c12d2710
[4/5] ocxl: Add mmu notifier
      https://git.kernel.org/powerpc/c/5f686eea4b3cb1d311f02b81ce4264e66a21d979
[5/5] ocxl: Add new kernel traces
      https://git.kernel.org/powerpc/c/98f5559a439a68e0773f42352f7c0806cac9e76e

cheers
