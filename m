Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 792C614C5F2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 06:39:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486sk64RXLzDqQN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 16:39:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486sDk09WQzDqMn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 16:17:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 486sDj4pFyz9sRs; Wed, 29 Jan 2020 16:17:25 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 39413ae009674c6ba745850515b551bbb9d6374b
In-Reply-To: <05105deeaf63bc02151aea2cdeaf525534e0e9d4.1574790198.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, ravi.bangoria@linux.ibm.com
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2 1/2] powerpc/hw_breakpoints: Rewrite 8xx breakpoints to
 allow any address range size.
Message-Id: <486sDj4pFyz9sRs@ozlabs.org>
Date: Wed, 29 Jan 2020 16:17:25 +1100 (AEDT)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-11-26 at 17:43:29 UTC, Christophe Leroy wrote:
> Unlike standard powerpc, Powerpc 8xx doesn't have SPRN_DABR, but
> it has a breakpoint support based on a set of comparators which
> allow more flexibility.
> 
> Commit 4ad8622dc548 ("powerpc/8xx: Implement hw_breakpoint")
> implemented breakpoints by emulating the DABR behaviour. It did
> this by setting one comparator the match 4 bytes at breakpoint address
> and the other comparator to match 4 bytes at breakpoint address + 4.
> 
> Rewrite 8xx hw_breakpoint to make breakpoints match all addresses
> defined by the breakpoint address and length by making full use of
> comparators.
> 
> Now, comparator E is set to match any address greater than breakpoint
> address minus one. Comparator F is set to match any address lower than
> breakpoint address plus breakpoint length. Addresses are aligned
> to 32 bits.
> 
> When the breakpoint range starts at address 0, the breakpoint is set
> to match comparator F only. When the breakpoint range end at address
> 0xffffffff, the breakpoint is set to match comparator E only.
> Otherwise the breakpoint is set to match comparator E and F.
> 
> At the same time, use registers bit names instead of hardcoded values.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/39413ae009674c6ba745850515b551bbb9d6374b

cheers
