Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FFC26FC63
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 14:21:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtCcj5crdzDqcV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 22:21:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtCYN1KK0zDqbF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 22:18:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=mDA5YloO; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BtCYK40Jjz9sT5;
 Fri, 18 Sep 2020 22:18:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1600431526;
 bh=eZsLlZGMKeQkS+03FKo604w9V86XaFWLGzm8pTD5+uI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=mDA5YloOUUj1YlrkqhB+NWmP7C+oK2/lEb51pnY0pmK1q+xi+YZdJF9hhzLw5ssGQ
 5vsW8B/AbgZLkyYtLDnDusK8tTY7tnBUCe4RArSx6pTDEhm9wVpRd05HuuBAxdlGzv
 q3xStD52WpU801nnx+2eiKW4wL9M2IuTDP8yKJJiHVgJnP29Wlvxjc2hG4FL9b8n+V
 EQCPIKrQRI/VIOiFlLt9gv3zsRcuTbu8sqKgEppJ2TKcEsreQ6q172d2ktOnyrkxW7
 JeHMrR3RHMLBvdj9QS6Ee3N4/3EwF9bulqzLN+rYEgbu8Mga9FBrr/HEdUT7ehUqmg
 U/rIeVSqeMwbQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, peterz@infradead.org
Subject: Re: [PATCH v2 1/4] mm: fix exec activate_mm vs TLB shootdown and lazy
 tlb switching race
In-Reply-To: <1600137586.nypnz3sbcl.astroid@bobo.none>
References: <20200914045219.3736466-1-npiggin@gmail.com>
 <20200914045219.3736466-2-npiggin@gmail.com>
 <20200914105617.GP1362448@hirez.programming.kicks-ass.net>
 <1600137586.nypnz3sbcl.astroid@bobo.none>
Date: Fri, 18 Sep 2020 22:18:44 +1000
Message-ID: <87a6xn6zx7.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-arch@vger.kernel.org,
 Dave Hansen <dave.hansen@intel.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
 "linux-mm @ kvack . org" <linux-mm@kvack.org>, sparclinux@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Excerpts from peterz@infradead.org's message of September 14, 2020 8:56 pm:
>> On Mon, Sep 14, 2020 at 02:52:16PM +1000, Nicholas Piggin wrote:
>>> Reading and modifying current->mm and current->active_mm and switching
>>> mm should be done with irqs off, to prevent races seeing an intermediate
>>> state.
...
>>> 
>>> This is a bit ugly, but in the interest of fixing the bug and backporting
>>> before all architectures are converted this is a compromise.
>>> 
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> 
>> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>> 
>> I'm thinking we want this selected on x86 as well. Andy?
>
> Thanks for the ack. The plan was to take it through the powerpc tree,
> but if you'd want x86 to select it, maybe a topic branch?

I've put this series in a topic branch based on v5.9-rc2:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=topic/irqs-off-activate-mm

I plan to merge it into the powerpc/next tree for v5.10, but if anyone
else wants to merge it that's fine too.

cheers
