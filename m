Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C81CB31694B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 15:42:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbMsY28zGzDsgc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 01:41:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbKYX2bF0zDslj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 23:57:52 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DbKYR2vL9z9sWl; Wed, 10 Feb 2021 23:57:46 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Sandipan Das <sandipan@linux.ibm.com>
In-Reply-To: <20210202150050.75335-1-sandipan@linux.ibm.com>
References: <20210202150050.75335-1-sandipan@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pkeys: Remove unused code
Message-Id: <161296172018.3178259.2790527364997214851.b4-ty@ellerman.id.au>
Date: Wed, 10 Feb 2021 23:57:46 +1100 (AEDT)
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
Cc: linuxram@us.ibm.com, linuxppc-dev@lists.ozlabs.org,
 aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2 Feb 2021 20:30:50 +0530, Sandipan Das wrote:
> This removes arch_supports_pkeys(), arch_usable_pkeys() and
> thread_pkey_regs_*() which are remnants from the following:
> 
> commit 06bb53b33804 ("powerpc: store and restore the pkey state across context switches")
> commit 2cd4bd192ee9 ("powerpc/pkeys: Fix handling of pkey state across fork()")
> commit cf43d3b26452 ("powerpc: Enable pkey subsystem")
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pkeys: Remove unused code
      https://git.kernel.org/powerpc/c/266d8f7586533a4c473ccb392204e32df99b72b5

cheers
