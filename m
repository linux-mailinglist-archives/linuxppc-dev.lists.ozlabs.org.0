Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 318C61A3320
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 13:24:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yf0s0bl3zDrGx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 21:23:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ydzD6RcpzDr8D
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 21:22:32 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9634EAE24;
 Thu,  9 Apr 2020 11:22:27 +0000 (UTC)
Date: Thu, 9 Apr 2020 13:22:26 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpcs: perf: consolidate perf_callchain_user_64 and
 perf_callchain_user_32
Message-ID: <20200409112226.GT25468@kitsune.suse.cz>
References: <1585896170.ohti800w9v.astroid@bobo.none>
 <20200406210022.32265-1-msuchanek@suse.de>
 <8786906b-edd5-e4a3-8286-33a05f39668c@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8786906b-edd5-e4a3-8286-33a05f39668c@c-s.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Jiri Olsa <jolsa@redhat.com>, linux-kernel@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Nicholas Piggin <npiggin@gmail.com>, Namhyung Kim <namhyung@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 07, 2020 at 07:21:06AM +0200, Christophe Leroy wrote:
> 
> 
> Le 06/04/2020 à 23:00, Michal Suchanek a écrit :
> > perf_callchain_user_64 and perf_callchain_user_32 are nearly identical.
> > Consolidate into one function with thin wrappers.
> > 
> > Suggested-by: Nicholas Piggin <npiggin@gmail.com>
> > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > ---
> >   arch/powerpc/perf/callchain.h    | 24 +++++++++++++++++++++++-
> >   arch/powerpc/perf/callchain_32.c | 21 ++-------------------
> >   arch/powerpc/perf/callchain_64.c | 14 ++++----------
> >   3 files changed, 29 insertions(+), 30 deletions(-)
> > 
> > diff --git a/arch/powerpc/perf/callchain.h b/arch/powerpc/perf/callchain.h
> > index 7a2cb9e1181a..7540bb71cb60 100644
> > --- a/arch/powerpc/perf/callchain.h
> > +++ b/arch/powerpc/perf/callchain.h
> > @@ -2,7 +2,7 @@
> >   #ifndef _POWERPC_PERF_CALLCHAIN_H
> >   #define _POWERPC_PERF_CALLCHAIN_H
> > -int read_user_stack_slow(void __user *ptr, void *buf, int nb);
> > +int read_user_stack_slow(const void __user *ptr, void *buf, int nb);
> 
> Does the constification of ptr has to be in this patch ?
It was in the original patch. The code is touched anyway.
> Wouldn't it be better to have it as a separate patch ?
Don't care much either way. Can resend it as separate patches.
> 
> >   void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
> >   			    struct pt_regs *regs);
> >   void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
> > @@ -16,4 +16,26 @@ static inline bool invalid_user_sp(unsigned long sp)
> >   	return (!sp || (sp & mask) || (sp > top));
> >   }
> > +/*
> > + * On 32-bit we just access the address and let hash_page create a
> > + * HPTE if necessary, so there is no need to fall back to reading
> > + * the page tables.  Since this is called at interrupt level,
> > + * do_page_fault() won't treat a DSI as a page fault.
> > + */
> > +static inline int __read_user_stack(const void __user *ptr, void *ret,
> > +				    size_t size)
> > +{
> > +	int rc;
> > +
> > +	if ((unsigned long)ptr > TASK_SIZE - size ||
> > +			((unsigned long)ptr & (size - 1)))
> > +		return -EFAULT;
> > +	rc = probe_user_read(ret, ptr, size);
> > +
> > +	if (rc && IS_ENABLED(CONFIG_PPC64))
> 
> gcc is probably smart enough to deal with it efficiently, but it would
> be more correct to test rc after checking CONFIG_PPC64.
IS_ENABLED(CONFIG_PPC64) is constant so that part of the check should be
compiled out in any case.

Thanks

Michal
