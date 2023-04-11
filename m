Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6F06DD981
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 13:36:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PwkMW3ZCsz3f5q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 21:36:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PwkM265ltz3bjj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Apr 2023 21:36:29 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96259D75;
	Tue, 11 Apr 2023 04:36:42 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.20.166])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DAD93F6C4;
	Tue, 11 Apr 2023 04:35:53 -0700 (PDT)
Date: Tue, 11 Apr 2023 12:35:50 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v2 0/5] locking: Introduce local{,64}_try_cmpxchg
Message-ID: <ZDVGFhMwOtpxJtnQ@FVFF77S0Q05N>
References: <20230405141710.3551-1-ubizjak@gmail.com>
 <7360ffd2-a5aa-1373-8309-93e71ff36cbb@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7360ffd2-a5aa-1373-8309-93e71ff36cbb@intel.com>
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
Cc: Ian Rogers <irogers@google.com>, x86@kernel.org, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, Jun Yi <yijun@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Uros Bizjak <ubizjak@gmail.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Arnaldo Carvalho de Melo <acme@kernel.org>, loongarch@lists.linux.dev, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, linux-perf-users@vger.kernel
 .org, Jiri Olsa <jolsa@kernel.org>, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 05, 2023 at 09:37:04AM -0700, Dave Hansen wrote:
> On 4/5/23 07:17, Uros Bizjak wrote:
> > Add generic and target specific support for local{,64}_try_cmpxchg
> > and wire up support for all targets that use local_t infrastructure.
> 
> I feel like I'm missing some context.
> 
> What are the actual end user visible effects of this series?  Is there a
> measurable decrease in perf overhead?  Why go to all this trouble for
> perf?  Who else will use local_try_cmpxchg()?

Overall, the theory is that it can generate slightly better code (e.g. by
reusing the flags on x86). In practice, that might be in the noise, but as
demonstrated in prior postings the code generation is no worse than before.

From my perspective, the more important part is that this aligns local_t with
the other atomic*_t APIs, which all have ${atomictype}_try_cmpxchg(), and for
consistency/legibility/maintainability it's nice to be able to use the same
code patterns, e.g.

	${inttype} new, old = ${atomictype}_read(ptr);
	do {
		...
		new = do_something_with(old);
	} while (${atomictype}_try_cmpxvhg(ptr, &oldval, newval);

> I'm all for improving things, and perf is an important user.  But, if
> the goal here is improving performance, it would be nice to see at least
> a stab at quantifying the performance delta.

IIUC, Steve's original request for local_try_cmpxchg() was a combination of a
theoretical performance benefit and a more general preference to use
try_cmpxchg() for consistency / better structure of the source code:

  https://lore.kernel.org/lkml/20230301131831.6c8d4ff5@gandalf.local.home/

I agree it'd be nice to have performance figures, but I think those would only
need to demonstrate a lack of a regression rather than a performance
improvement, and I think it's fairly clear from eyeballing the generated
instructions that a regression isn't likely.

Thanks,
Mark.
