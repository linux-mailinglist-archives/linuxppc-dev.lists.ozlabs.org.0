Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEB33168E0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 15:15:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbMGX2kBGzDsm9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 01:15:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbKYK43wXzDshb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 23:57:41 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DbKYG6yjzz9sS8; Wed, 10 Feb 2021 23:57:38 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20201217134731.488135-1-npiggin@gmail.com>
References: <20201217134731.488135-1-npiggin@gmail.com>
Subject: Re: [PATCH 0/7] powerpc/64s: TLB flushing improvements
Message-Id: <161296172253.3178259.10234887583607379821.b4-ty@ellerman.id.au>
Date: Wed, 10 Feb 2021 23:57:38 +1100 (AEDT)
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

On Thu, 17 Dec 2020 23:47:24 +1000, Nicholas Piggin wrote:
> Another round of reducing TLB flushing (mostly on radix).
> 
> Thanks,
> Nick
> 
> Nicholas Piggin (7):
>   powerpc/64s/radix: add warning and comments in mm_cpumask trim
>   powerpc/64s/radix: refactor TLB flush type selection
>   powerpc/64s/radix: Check for no TLB flush required
>   powerpc/64s/radix: Allow mm_cpumask trimming from external sources
>   powerpc/64s/radix: occasionally attempt to trim mm_cpumask
>   powerpc/64s/radix: serialize_against_pte_lookup IPIs trim mm_cpumask
>   powerpc/64s: Implement ptep_clear_flush_young that does not flush TLBs
> 
> [...]

Applied to powerpc/next.

[1/7] powerpc/64s/radix: add warning and comments in mm_cpumask trim
      https://git.kernel.org/powerpc/c/a2496049f1f1006178d0db706a8451dd03bd3ec6
[2/7] powerpc/64s/radix: refactor TLB flush type selection
      https://git.kernel.org/powerpc/c/26418b36a11f2eaf2556aa8cefe86132907e311f
[3/7] powerpc/64s/radix: Check for no TLB flush required
      https://git.kernel.org/powerpc/c/54bb503345b81399575e2b7a3a6497ae212ad827
[4/7] powerpc/64s/radix: Allow mm_cpumask trimming from external sources
      https://git.kernel.org/powerpc/c/780de40601aabeca41bc9aa717a329a77aa85e1a
[5/7] powerpc/64s/radix: occasionally attempt to trim mm_cpumask
      https://git.kernel.org/powerpc/c/9393544842d6c85ebfc387c43a5059f8171d598f
[6/7] powerpc/64s/radix: serialize_against_pte_lookup IPIs trim mm_cpumask
      https://git.kernel.org/powerpc/c/032b7f08932c9b212952d6d585e45b2941b3e8be
[7/7] powerpc/64s: Implement ptep_clear_flush_young that does not flush TLBs
      https://git.kernel.org/powerpc/c/3cb1aa7aa39402f4f2cb847b1f16ade3bce43a97

cheers
