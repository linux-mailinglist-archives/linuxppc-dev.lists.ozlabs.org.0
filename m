Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 705CB363A24
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 06:12:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNtgc3G04z3gFv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 14:12:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNtVy2PDyz3cYh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 14:04:42 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FNtVn71wLz9vHb; Mon, 19 Apr 2021 14:04:33 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20210415120934.232271-1-srikar@linux.vnet.ibm.com>
References: <20210415120934.232271-1-srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/3] Reintroduce cpu_core_mask
Message-Id: <161880480693.1398509.4708894086317354098.b4-ty@ellerman.id.au>
Date: Mon, 19 Apr 2021 14:00:06 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 15 Apr 2021 17:39:31 +0530, Srikar Dronamraju wrote:
> Daniel had reported that
>  QEMU is now unable to see requested topologies in a multi socket single
>  NUMA node configurations.
>  -smp 8,maxcpus=8,cores=2,threads=2,sockets=2
> 
> This patchset reintroduces cpu_core_mask so that users can see requested
> topologies while still maintaining the boot time of very large system
> configurations.
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/smp: Reintroduce cpu_core_mask
      https://git.kernel.org/powerpc/c/c47f892d7aa62765bf0689073f75990b4517a4cf
[2/3] Revert "powerpc/topology: Update topology_core_cpumask"
      https://git.kernel.org/powerpc/c/131c82b6a1d261705a6f98368e501d43d994018d
[3/3] powerpc/smp: Cache CPU to chip lookup
      https://git.kernel.org/powerpc/c/c1e53367dab15e41814cff4e37df8ec4ac8fb9d7

cheers
