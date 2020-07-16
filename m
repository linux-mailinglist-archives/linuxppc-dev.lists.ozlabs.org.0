Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C55DF2225CB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 16:36:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6xdv6z3BzDr1S
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 00:36:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6vQL0nl6zDqll
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 22:56:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4B6vQB1hKYz9sVj; Thu, 16 Jul 2020 22:56:17 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
In-Reply-To: <20200629103703.4538-1-srikar@linux.vnet.ibm.com>
References: <20200629103703.4538-1-srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/3] Implement shared_cpu_list for powerpc
Message-Id: <159490400590.3805857.12420499524607707011.b4-ty@ellerman.id.au>
Date: Thu, 16 Jul 2020 22:56:17 +1000 (AEST)
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 29 Jun 2020 16:07:00 +0530, Srikar Dronamraju wrote:
> shared_cpu_list sysfs file is missing in powerpc and shared_cpu_map gives an
> extra newline character.
> 
> Before this patchset
> # ls /sys/devices/system/cpu0/cache/index1
> coherency_line_size  number_of_sets  size  ways_of_associativity
> level                shared_cpu_map  type
> # cat /sys/devices/system/cpu0/cache/index1/shared_cpu_map
> 00ff
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/cacheinfo: Use cpumap_print to print cpumap
      https://git.kernel.org/powerpc/c/5658cf085ba3c3f3c24ac0f7210f0473794df506
[2/3] powerpc/cacheinfo: Make cpumap_show code reusable
      https://git.kernel.org/powerpc/c/74b7492e417812ea0f5002e210e2ac07a5728d17
[3/3] powerpc/cacheinfo: Add per cpu per index shared_cpu_list
      https://git.kernel.org/powerpc/c/a87a77cb947cc9fc89f0dad51aeee66a61cc7fc4

cheers
