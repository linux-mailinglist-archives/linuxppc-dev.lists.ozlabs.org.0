Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6499F235758
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 16:10:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKNFL34TzzDqGl
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 00:09:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKMT866pDzDqKK
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Aug 2020 23:35:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BKMT82DX9z9sSt; Sun,  2 Aug 2020 23:35:08 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Sandipan Das <sandipan@linux.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <a408c4b8e9a23bb39b539417a21eb0ff47bb5127.1596084858.git.sandipan@linux.ibm.com>
References: <a408c4b8e9a23bb39b539417a21eb0ff47bb5127.1596084858.git.sandipan@linux.ibm.com>
Subject: Re: [PATCH v3] selftests: powerpc: Fix online CPU selection
Message-Id: <159637524083.42190.8594799492751560663.b4-ty@ellerman.id.au>
Date: Sun,  2 Aug 2020 23:35:08 +1000 (AEST)
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
Cc: srikar@linux.vnet.ibm.com, kamalesh@linux.vnet.ibm.com, shiganta@in.ibm.com,
 nasastry@in.ibm.com, harish@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 30 Jul 2020 10:38:46 +0530, Sandipan Das wrote:
> The size of the CPU affinity mask must be large enough for
> systems with a very large number of CPUs. Otherwise, tests
> which try to determine the first online CPU by calling
> sched_getaffinity() will fail. This makes sure that the size
> of the allocated affinity mask is dependent on the number of
> CPUs as reported by get_nprocs_conf().

Applied to powerpc/next.

[1/1] selftests/powerpc: Fix online CPU selection
      https://git.kernel.org/powerpc/c/dfa03fff86027e58c8dba5c03ae68150d4e513ad

cheers
