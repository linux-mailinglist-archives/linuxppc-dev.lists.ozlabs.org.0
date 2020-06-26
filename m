Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7015E20AB76
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 06:46:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tPVP6Nz7zDqXS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 14:46:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tPRV113bzDqWW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 14:44:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49tPRT6R2Mz9sSS; Fri, 26 Jun 2020 14:44:05 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 paulus@ozlabs.org
In-Reply-To: <20200611120159.680284-1-aneesh.kumar@linux.ibm.com>
References: <20200611120159.680284-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] powerpc/kvm/book3s64/nested: Fix kernel crash with nested
 kvm
Message-Id: <159314666257.1149515.13073891259313686170.b4-ty@ellerman.id.au>
Date: Fri, 26 Jun 2020 14:44:05 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 11 Jun 2020 17:31:59 +0530, Aneesh Kumar K.V wrote:
> __pa() do check for addr value passed and if < PAGE_OFFSET
> results in BUG.
> 
>  #define __pa(x)								\
> ({									\
> 	VIRTUAL_BUG_ON((unsigned long)(x) < PAGE_OFFSET);		\
> 	(unsigned long)(x) & 0x0fffffffffffffffUL;			\
> })
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/kvm/book3s64: Fix kernel crash with nested kvm & DEBUG_VIRTUAL
      https://git.kernel.org/powerpc/c/c1ed1754f271f6b7acb1bfdc8cfb62220fbed423

cheers
