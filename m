Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D04E26305A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 17:18:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bmlz22lMQzDqB3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 01:18:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmjkP1Z0czDqWx
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 23:37:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BmjkP07Fhz9sTv; Wed,  9 Sep 2020 23:37:32 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20200731113500.248306-1-aneesh.kumar@linux.ibm.com>
References: <20200731113500.248306-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/vmemmap: Fix memory leak with vmemmap list
 allocation failures.
Message-Id: <159965824077.811679.711766695254409970.b4-ty@ellerman.id.au>
Date: Wed,  9 Sep 2020 23:37:32 +1000 (AEST)
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

On Fri, 31 Jul 2020 17:04:59 +0530, Aneesh Kumar K.V wrote:
> If we fail to allocate vmemmap list, we don't keep track of allocated
> vmemmap block buf. Hence on section deactivate we skip vmemmap block
> buf free. This results in memory leak.

Applied to powerpc/next.

[1/2] powerpc/vmemmap: Fix memory leak with vmemmap list allocation failures.
      https://git.kernel.org/powerpc/c/ccaea15296f9773abd43aaa17ee4b88848e4a505
[2/2] powerpc/vmemmap: Don't warn if we don't find a mapping vmemmap list entry
      https://git.kernel.org/powerpc/c/1c0a7ac0ec63ee626f669c9a4e278f6ae1dbfcf2

cheers
