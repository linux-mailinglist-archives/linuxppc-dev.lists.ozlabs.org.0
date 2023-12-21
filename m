Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AD281B42B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 11:47:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwnDp0hKvz3wNb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 21:47:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Swn5h58Jcz3cV9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 21:40:56 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Swn5g3808z4xPh;
	Thu, 21 Dec 2023 21:40:55 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
In-Reply-To: <20231214180720.310852-1-srikar@linux.vnet.ibm.com>
References: <20231214180720.310852-1-srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v5 0/5] powerpc/smp: Topology and shared processor optimizations
Message-Id: <170315510022.2192823.3630103323682637969.b4-ty@ellerman.id.au>
Date: Thu, 21 Dec 2023 21:38:20 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Valentin Schneider <vschneid@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, "Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Aneesh <aneesh.kumar@kernel.org>, Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 14 Dec 2023 23:37:10 +0530, Srikar Dronamraju wrote:
> PowerVM systems configured in shared processors mode have some unique
> challenges. Some device-tree properties will be missing on a shared
> processor. Hence some sched domains may not make sense for shared processor
> systems.
> 
> Most shared processor systems are over-provisioned. Underlying PowerVM
> Hypervisor would schedule at a Big Core granularity. The most recent power
> processors support two almost independent cores. In a lightly loaded
> condition, it helps the overall system performance if we pack to lesser
> number of Big Cores.
> 
> [...]

Applied to powerpc/next.

[1/5] powerpc/smp: Enable Asym packing for cores on shared processor
      https://git.kernel.org/powerpc/c/aa80c6343fcf53cbc29f84ba9f89ca87d4e41350
[2/5] powerpc/smp: Disable MC domain for shared processor
      https://git.kernel.org/powerpc/c/0e1c1986e0e65746daa05405d7747ce882f83cf1
[3/5] powerpc/smp: Add __ro_after_init attribute
      https://git.kernel.org/powerpc/c/fd535a858ebeb1f478b1d065b6c057f52aad483a
[4/5] powerpc/smp: Avoid asym packing within thread_group of a core
      https://git.kernel.org/powerpc/c/0e93f1c780e8fd315f1262467b7d35eb6f766d2f
[5/5] powerpc/smp: Dynamically build Powerpc topology
      https://git.kernel.org/powerpc/c/c46975715f5a7b941aa09bc0539a8dbe297f308f

cheers
