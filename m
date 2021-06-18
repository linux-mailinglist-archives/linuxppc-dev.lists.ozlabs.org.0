Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 970873AC241
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:25:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5m6x2Hpgz3cCq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 14:25:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5m4D2Qc6z3c21
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 14:22:49 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G5m435Prlz9sWl; Fri, 18 Jun 2021 14:22:43 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210610083639.387365-1-aneesh.kumar@linux.ibm.com>
References: <20210610083639.387365-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] powerpc/mm/book3s64: Fix possible build error
Message-Id: <162398829930.1363949.5957822176522261373.b4-ty@ellerman.id.au>
Date: Fri, 18 Jun 2021 13:51:39 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 10 Jun 2021 14:06:39 +0530, Aneesh Kumar K.V wrote:
> Update _tlbiel_pid() such that we can avoid build errors like below when
> using this function in other places.
> 
> arch/powerpc/mm/book3s64/radix_tlb.c: In function ‘__radix__flush_tlb_range_psize’:
> arch/powerpc/mm/book3s64/radix_tlb.c:114:2: warning: ‘asm’ operand 3 probably does not match constraints
>   114 |  asm volatile(PPC_TLBIEL(%0, %4, %3, %2, %1)
>       |  ^~~
> arch/powerpc/mm/book3s64/radix_tlb.c:114:2: error: impossible constraint in ‘asm’
> make[4]: *** [scripts/Makefile.build:271: arch/powerpc/mm/book3s64/radix_tlb.o] Error 1
> m
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/mm/book3s64: Fix possible build error
      https://git.kernel.org/powerpc/c/07d8ad6fd8a3d47f50595ca4826f41dbf4f3a0c6

cheers
