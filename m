Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F102CEDAF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 13:06:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnWdy1sqQzDrdM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 23:06:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnWTw27DRzDrQc
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 22:59:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CnWTr6wKcz9sWl; Fri,  4 Dec 2020 22:59:44 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20201126102530.691335-1-npiggin@gmail.com>
References: <20201126102530.691335-1-npiggin@gmail.com>
Subject: Re: [PATCH 0/4] powerpc/64s: Fix for radix TLB invalidation bug
Message-Id: <160708314518.99163.9620002709140750963.b4-ty@ellerman.id.au>
Date: Fri,  4 Dec 2020 22:59:44 +1100 (AEDT)
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
Cc: Milton Miller <miltonm@us.ibm.com>, Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 26 Nov 2020 20:25:26 +1000, Nicholas Piggin wrote:
> This fixes a tricky bug that was noticed by TLB multi-hits in a guest
> stress testing CPU hotplug, but TLB invalidation means any kind of
> data corruption is possible.
> 
> Thanks,
> Nick
> 
> [...]

Applied to powerpc/fixes.

[1/4] powerpc/64s: Fix hash ISA v3.0 TLBIEL instruction generation
      https://git.kernel.org/powerpc/c/5844cc25fd121074de7895181a2fa1ce100a0fdd
[2/4] powerpc/64s/pseries: Fix hash tlbiel_all_isa300 for guest kernels
      https://git.kernel.org/powerpc/c/c0b27c517acf8a2b359dd373a7e7e88b01a8308e
[3/4] kernel/cpu: add arch override for clear_tasks_mm_cpumask() mm handling
      https://git.kernel.org/powerpc/c/8ff00399b153440c1c83e20c43020385b416415b
[4/4] powerpc/64s: Trim offlined CPUs from mm_cpumasks
      https://git.kernel.org/powerpc/c/01b0f0eae0812e80efeee4ee17687e5386335e08

cheers
