Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C6820AB9B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 06:58:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tPlr57N7zDqtY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 14:58:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tPTb2rTXzDqlf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 14:45:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49tPTZ5hYkz9sT8; Fri, 26 Jun 2020 14:45:53 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <9f2df6621fcaf9eba15fadc61c169d0c8e2fb849.1592481938.git.christophe.leroy@csgroup.eu>
References: <9f2df6621fcaf9eba15fadc61c169d0c8e2fb849.1592481938.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/8xx: Modify ptep_get()
Message-Id: <159314672826.1150869.11989654987721504305.b4-ty@ellerman.id.au>
Date: Fri, 26 Jun 2020 14:45:53 +1000 (AEST)
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 18 Jun 2020 12:07:46 +0000 (UTC), Christophe Leroy wrote:
> Move ptep_get() close to pte_update(), in an ifdef section already
> dedicated to powerpc 8xx. This section contains explanation about
> the layout of page table entries.
> 
> Also modify it to return 4 times the pte value instead of padding
> with zeroes.

Applied to powerpc/next.

[1/1] powerpc/8xx: Modify ptep_get()
      https://git.kernel.org/powerpc/c/105fb38124a490f38e9c1e23bb4c4a0b6ba12fdb

cheers
