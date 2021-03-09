Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF23F332D44
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 18:30:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dw2Kz5Bwzz3cS0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 04:30:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dw2Kf6Szrz3cGq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 04:30:30 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A3684ACC6;
 Tue,  9 Mar 2021 17:30:27 +0000 (UTC)
Date: Tue, 9 Mar 2021 18:30:26 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: [PATCH 3/3] powerpc/qspinlock: Use generic smp_cond_load_relaxed
Message-ID: <20210309173026.GB6564@kitsune.suse.cz>
References: <20210309015950.27688-1-dave@stgolabs.net>
 <20210309015950.27688-4-dave@stgolabs.net>
 <20210309093912.GW6564@kitsune.suse.cz>
 <20210309154611.kbxzx65auzvmfqnt@offworld>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210309154611.kbxzx65auzvmfqnt@offworld>
User-Agent: Mutt/1.11.3 (2019-02-01)
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
Cc: Davidlohr Bueso <dbueso@suse.de>, peterz@infradead.org, will@kernel.org,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, mingo@redhat.com,
 paulus@samba.org, longman@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 09, 2021 at 07:46:11AM -0800, Davidlohr Bueso wrote:
> On Tue, 09 Mar 2021, Michal Such�nek wrote:
> 
> > On Mon, Mar 08, 2021 at 05:59:50PM -0800, Davidlohr Bueso wrote:
> > > 49a7d46a06c3 (powerpc: Implement smp_cond_load_relaxed()) added
> > > busy-waiting pausing with a preferred SMT priority pattern, lowering
> > > the priority (reducing decode cycles) during the whole loop slowpath.
> > > 
> > > However, data shows that while this pattern works well with simple
> >                                              ^^^^^^^^^^^^^^^^^^^^^^
> > > spinlocks, queued spinlocks benefit more being kept in medium priority,
> > > with a cpu_relax() instead, being a low+medium combo on powerpc.
> > ...
> > > 
> > > diff --git a/arch/powerpc/include/asm/barrier.h b/arch/powerpc/include/asm/barrier.h
> > > index aecfde829d5d..7ae29cfb06c0 100644
> > > --- a/arch/powerpc/include/asm/barrier.h
> > > +++ b/arch/powerpc/include/asm/barrier.h
> > > @@ -80,22 +80,6 @@ do {									\
> > > 	___p1;								\
> > >  })
> > > 
> > > -#ifdef CONFIG_PPC64
> > Maybe it should be kept for the simple spinlock case then?
> 
> It is kept, note that simple spinlocks don't use smp_cond_load_relaxed,
> but instead deal with the priorities in arch_spin_lock(), so it will
> spin in low priority until it sees a chance to take the lock, where
> it switches back to medium.

Indeed, thanks for the clarification.

Michal
