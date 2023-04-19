Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A04B6E78C9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 13:42:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1f6J265vz3fcR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 21:42:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hgKaBFSE;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hgKaBFSE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mtosatti@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hgKaBFSE;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hgKaBFSE;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1f5S6Yl8z30QQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Apr 2023 21:41:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681904505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i+ljsW3KAuErNDeeE9uh+f3S5vccVtwLnf4UBEcIcgs=;
	b=hgKaBFSEEnkMhjmV1EbTNpOg1FwABk30xMLz8VMHZ6oRDSV3OUdKJB3V4FlpLUMxLsVnM0
	OQVa/eRP+sZwvN5Fbt+xQTbe7HDPTrO7km1IGzMRH9hmk/Hdb2Z0mBjY6QAE/DerTGmreL
	7dZlqpHxapyNBo72lhtXMcbwIL8C7JE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681904505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i+ljsW3KAuErNDeeE9uh+f3S5vccVtwLnf4UBEcIcgs=;
	b=hgKaBFSEEnkMhjmV1EbTNpOg1FwABk30xMLz8VMHZ6oRDSV3OUdKJB3V4FlpLUMxLsVnM0
	OQVa/eRP+sZwvN5Fbt+xQTbe7HDPTrO7km1IGzMRH9hmk/Hdb2Z0mBjY6QAE/DerTGmreL
	7dZlqpHxapyNBo72lhtXMcbwIL8C7JE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-WCYnVo6lNP6ZqvgcTniNgw-1; Wed, 19 Apr 2023 07:41:43 -0400
X-MC-Unique: WCYnVo6lNP6ZqvgcTniNgw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9F1A810BD4;
	Wed, 19 Apr 2023 11:41:40 +0000 (UTC)
Received: from tpad.localdomain (ovpn-112-2.gru2.redhat.com [10.97.112.2])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48B721121315;
	Wed, 19 Apr 2023 11:41:40 +0000 (UTC)
Received: by tpad.localdomain (Postfix, from userid 1000)
	id 7E64240512CCB; Wed, 19 Apr 2023 08:39:48 -0300 (-03)
Date: Wed, 19 Apr 2023 08:39:48 -0300
From: Marcelo Tosatti <mtosatti@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 3/3] mm/mmu_gather: send tlb_remove_table_smp_sync IPI
 only to CPUs in kernel mode
Message-ID: <ZD/TBN5doEex3iag@tpad>
References: <ZC1XD/sEJY+zRujE@lothringen>
 <ZC3P3Ds/BIcpRNGr@tpad>
 <20230405195226.GB365912@hirez.programming.kicks-ass.net>
 <ZC69Wmqjdwk+I8kn@tpad>
 <20230406132928.GM386572@hirez.programming.kicks-ass.net>
 <20230406140423.GA386634@hirez.programming.kicks-ass.net>
 <20230406150213.GQ386572@hirez.programming.kicks-ass.net>
 <248392c0-52d1-d09d-75ec-9e930435c053@redhat.com>
 <20230406182749.GA405948@hirez.programming.kicks-ass.net>
 <914e826e-3fab-4540-d3a1-24ca39b1cf0a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <914e826e-3fab-4540-d3a1-24ca39b1cf0a@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
Cc: geert+renesas@glider.be, Peter Zijlstra <peterz@infradead.org>, linus.walleij@linaro.org, dave.hansen@linux.intel.com, Yair Podemsky <ypodemsk@redhat.com>, sebastian.reichel@collabora.com, linux-mm@kvack.org, hpa@zytor.com, sparclinux@vger.kernel.org, agordeev@linux.ibm.com, will@kernel.org, ardb@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, vschneid@redhat.com, arnd@arndb.de, paulmck@kernel.org, aneesh.kumar@linux.ibm.com, x86@kernel.org, linux@armlinux.org.uk, tony@atomide.com, mingo@redhat.com, samitolvanen@google.com, borntraeger@linux.ibm.com, hca@linux.ibm.com, keescook@chromium.org, gor@linux.ibm.com, jannh@google.com, Frederic Weisbecker <frederic@kernel.org>, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, Yang Shi <shy828301@gmail.com>, bp@alien8.de, nick.hawkins@hpe.com, tglx@linutronix.de, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, alougovs@redhat.com, linux-kernel@vger.kernel.org, juerg.haefliger@canonical.com, svens@linux.ibm.com
 , dhildenb@redhat.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 19, 2023 at 01:30:57PM +0200, David Hildenbrand wrote:
> On 06.04.23 20:27, Peter Zijlstra wrote:
> > On Thu, Apr 06, 2023 at 05:51:52PM +0200, David Hildenbrand wrote:
> > > On 06.04.23 17:02, Peter Zijlstra wrote:
> > 
> > > > DavidH, what do you thikn about reviving Jann's patches here:
> > > > 
> > > >     https://bugs.chromium.org/p/project-zero/issues/detail?id=2365#c1
> > > > 
> > > > Those are far more invasive, but afaict they seem to do the right thing.
> > > > 
> > > 
> > > I recall seeing those while discussed on security@kernel.org. What we
> > > currently have was (IMHO for good reasons) deemed better to fix the issue,
> > > especially when caring about backports and getting it right.
> > 
> > Yes, and I think that was the right call. However, we can now revisit
> > without having the pressure of a known defect and backport
> > considerations.
> > 
> > > The alternative that was discussed in that context IIRC was to simply
> > > allocate a fresh page table, place the fresh page table into the list
> > > instead, and simply free the old page table (then using common machinery).
> > > 
> > > TBH, I'd wish (and recently raised) that we could just stop wasting memory
> > > on page tables for THPs that are maybe never going to get PTE-mapped ... and
> > > eventually just allocate on demand (with some caching?) and handle the
> > > places where we're OOM and cannot PTE-map a THP in some descend way.
> > > 
> > > ... instead of trying to figure out how to deal with these page tables we
> > > cannot free but have to special-case simply because of GUP-fast.
> > 
> > Not keeping them around sounds good to me, but I'm not *that* familiar
> > with the THP code, most of that happened after I stopped tracking mm. So
> > I'm not sure how feasible is it.
> > 
> > But it does look entirely feasible to rework this page-table freeing
> > along the lines Jann did.
> 
> It's most probably more feasible, although the easiest would be to just
> allocate a fresh page table to deposit and free the old one using the mmu
> gatherer.
> 
> This way we can avoid the khugepaged of tlb_remove_table_smp_sync(), but not
> the tlb_remove_table_one() usage. I suspect khugepaged isn't really relevant
> in RT kernels (IIRC, most of RT setups disable THP completely).

People will disable khugepaged because it causes IPIs (and the fact one
has to disable khugepaged is a configuration overhead, and a source of
headache for configuring the realtime system, since one can forget of
doing that, etc).

But people do want to run non-RT applications along with RT applications
(in case you have a single box on a priviledged location, for example).

> 
> tlb_remove_table_one() only triggers if __get_free_page(GFP_NOWAIT |
> __GFP_NOWARN); fails. IIUC, that can happen easily under memory pressure
> because it doesn't wait for direct reclaim.
> 
> I don't know much about RT workloads (so I'd appreciate some feedback), but
> I guess we can run int memory pressure as well due to some !rt housekeeping
> task on the system?

Yes, exactly (memory for -RT app will be mlocked).

