Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EAA2EB04B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 17:39:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9JBH4phPzDqfK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jan 2021 03:39:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9J8023VhzDqcG
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jan 2021 03:37:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=Zn9Jeh+wfsmeZ8Kq39gSdD4WJohBEoNPA6/OyBxQvc4=; b=W9LdNbFyUJiYe4Igi7trBCh09W
 dU5OhOWsJnmIDyHBzwHRZTyPMFx64HwIbTXQBh7gyCJzdWcUsEQ2WxRAJWskQiOuEhy0b6bE152NZ
 sXE2x5ffBSo4RcnqYRHfCChmQppvv/t6u8aLkVQQAPVPDN/3F7w2A3MG887DP5WJmCrfftZi7Z+AC
 Ri80MMCtdo/0Y81aJQ2iCoh1V8DMrZE0Qe1IG35yePUiR/oRYePfuyin4jUazSoBVFvIxhQ8Q2cWK
 AaS7NqtK6UoLG1n0LbD4CSv2+MgQ2fyGiL1QFhAD5Wthi60eLUgVSQ6whG/nN2TWTZ2oWWXBahadX
 I6zb6MgA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwpKw-0004Bv-QX; Tue, 05 Jan 2021 16:37:35 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 9CB9330377D;
 Tue,  5 Jan 2021 17:37:31 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 8408420D9B72E; Tue,  5 Jan 2021 17:37:31 +0100 (CET)
Date: Tue, 5 Jan 2021 17:37:31 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [RFC please help] membarrier: Rewrite sync_core_before_usermode()
Message-ID: <20210105163731.GM3040@hirez.programming.kicks-ass.net>
References: <20210105132623.GB11108@willie-the-truck>
 <7BFAB97C-1949-46A3-A1E2-DFE108DC7D5E@amacapital.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7BFAB97C-1949-46A3-A1E2-DFE108DC7D5E@amacapital.net>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Lutomirski <luto@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Paul Mackerras <paulus@samba.org>, stable <stable@vger.kernel.org>,
 Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 05, 2021 at 08:20:51AM -0800, Andy Lutomirski wrote:
> >     Interestingly, the architecture recently added a control bit to remove
> >     this synchronisation from exception return, so if we set that then we'd
> >     have a problem with SYNC_CORE and adding an ISB would be necessary (and
> >     we could probable then make kernel->kernel returns cheaper, but I
> >     suspect we're relying on this implicit synchronisation in other places
> >     too).
> > 
> 
> Is ISB just a context synchronization event or does it do more?

IIRC it just the instruction sync (like power ISYNC).

> On x86, it’s very hard to tell that MFENCE does any more than LOCK,
> but it’s much slower.  And we have LFENCE, which, as documented,
> doesn’t appear to have any semantics at all.  (Or at least it didn’t
> before Spectre.)

AFAIU MFENCE is a completion barrier, while LOCK prefix is not. A bit
like ARM's DSB vs DMB.

It is for this reason that mb() is still MFENCE, while our smp_mb() is a
LOCK prefixed NO-OP.

And yes, LFENCE used to be poorly defined and it was sometimes
understood to be a completion barrier relative to prior LOADs, while it
is now a completion barrier for any prior instruction, and really should
be renamed to IFENCE.


