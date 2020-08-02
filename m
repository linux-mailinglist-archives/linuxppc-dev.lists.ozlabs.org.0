Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96473235764
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 16:19:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKNSd5HP6zDqJf
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 00:19:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKMYn4TGczDqPy
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Aug 2020 23:39:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BKMYm44Vvz9sSG; Sun,  2 Aug 2020 23:39:08 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Harish <harish@linux.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <20200609081423.529664-1-harish@linux.ibm.com>
References: <20200609081423.529664-1-harish@linux.ibm.com>
Subject: Re: [PATCH v3] selftests: powerpc: Fix CPU affinity for child process
Message-Id: <159637552967.48736.853088921052517044.b4-ty@ellerman.id.au>
Date: Sun,  2 Aug 2020 23:39:08 +1000 (AEST)
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
 sathnaga@linux.vnet.ibm.com, sandipan@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 9 Jun 2020 13:44:23 +0530, Harish wrote:
> On systems with large number of cpus, test fails trying to set
> affinity by calling sched_setaffinity() with smaller size for
> affinity mask. This patch fixes it by making sure that the size of
> allocated affinity mask is dependent on the number of CPUs as
> reported by get_nprocs().

Applied to powerpc/next.

[1/1] selftests/powerpc: Fix CPU affinity for child process
      https://git.kernel.org/powerpc/c/854eb5022be04f81e318765f089f41a57c8e5d83

cheers
