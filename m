Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F290D138472
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Jan 2020 02:46:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47wKML2n0MzDqcy
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Jan 2020 12:46:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=mhiramat@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=f0hoRGlu; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47wKKQ6HmWzDqW3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jan 2020 12:44:58 +1100 (AEDT)
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8B06520848;
 Sun, 12 Jan 2020 01:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578793495;
 bh=be5/qvDI0xWmWfszMbPxV2+iE40FAvtbAVatuYqBdFU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=f0hoRGlul2fyhkOOcYf1vS5xKaAldIjyYI8U8Uba9sbzBzlr3WwBUMp4wsLy5lJdJ
 XmmdHCMtMDQduupcXI0Mw4zH29CkC4uugIayLSeHFJMxGogQNV1b79k9XvjtJOogU9
 4tM2vpzf/obL6Rvpm4tCnfNHWY7gk7jjptMstCSE=
Date: Sun, 12 Jan 2020 10:44:46 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: arnaldo.melo@gmail.com
Subject: Re: [PATCH v4 2/9] perf/core: open access for CAP_SYS_PERFMON
 privileged process
Message-Id: <20200112104446.f667df82b061dfb9c7a6bdce@kernel.org>
In-Reply-To: <5e191833.1c69fb81.8bc25.a88c@mx.google.com>
References: <c0460c78-b1a6-b5f7-7119-d97e5998f308@linux.intel.com>
 <c93309dc-b920-f5fa-f997-e8b2faf47b88@linux.intel.com>
 <20200108160713.GI2844@hirez.programming.kicks-ass.net>
 <cc239899-5c52-2fd0-286d-4bff18877937@linux.intel.com>
 <20200110140234.GO2844@hirez.programming.kicks-ass.net>
 <20200111005213.6dfd98fb36ace098004bde0e@kernel.org>
 <20200110164531.GA2598@kernel.org>
 <20200111084735.0ff01c758bfbfd0ae2e1f24e@kernel.org>
 <2B79131A-3F76-47F5-AAB4-08BCA820473F@fb.com>
 <5e191833.1c69fb81.8bc25.a88c@mx.google.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: , Mark Rutland <mark.rutland@arm.com>, Song Liu <songliubraving@fb.com>,
 Peter Zijlstra <peterz@infradead.org>, joonas.lahtinen@linux.intel.com,
 Will Deacon <will.deacon@arm.com>, Alexei Starovoitov <ast@kernel.org>,
 Stephane Eranian <eranian@google.com>, james.bottomley@hansenpartnership.com,
 Paul Mackerras <paulus@samba.org>, Jiri Olsa <jolsa@redhat.com>,
 Andi Kleen <ak@linux.intel.com>,
 Alexey Budankov <alexey.budankov@linux.intel.com>,
 Igor Lubashev <ilubashe@akamai.com>, James Morris <jmorris@namei.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>,
 "oprofile-list@lists.sf.net" <oprofile-list@lists.sf.net>,
 Serge Hallyn <serge@hallyn.com>, Robert Richter <rric@kernel.org>,
 Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 jani.nikula@linux.intel.com, Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 rodrigo.vivi@intel.com, Namhyung Kim <namhyung@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 Casey Schaufler <casey@schaufler-ca.com>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 10 Jan 2020 21:35:12 -0300
arnaldo.melo@gmail.com wrote:

> <keescook@chromium.org>,Jann Horn <jannh@google.com>,Thomas Gleixner <tglx@linutronix.de>,Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,Lionel Landwerlin <lionel.g.landwerlin@intel.com>,linux-kernel <linux-kernel@vger.kernel.org>,"linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>,"selinux@vger.kernel.org" <selinux@vger.kernel.org>,"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,"bpf@vger.kernel.org" <bpf@vger.kernel.org>,"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,"linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,"oprofile-list@lists.sf.net" <oprofile-list@lists.sf.net>
> From: Arnaldo Carvalho de Melo <acme@kernel.org>
> Message-ID: <A7F0BF73-9189-44BA-9264-C88F2F51CBF3@kernel.org>
> 
> On January 10, 2020 9:23:27 PM GMT-03:00, Song Liu <songliubraving@fb.com> wrote:
> >
> >
> >> On Jan 10, 2020, at 3:47 PM, Masami Hiramatsu <mhiramat@kernel.org>
> >wrote:
> >> 
> >> On Fri, 10 Jan 2020 13:45:31 -0300
> >> Arnaldo Carvalho de Melo <acme@kernel.org> wrote:
> >> 
> >>> Em Sat, Jan 11, 2020 at 12:52:13AM +0900, Masami Hiramatsu escreveu:
> >>>> On Fri, 10 Jan 2020 15:02:34 +0100 Peter Zijlstra
> ><peterz@infradead.org> wrote:
> >>>>> Again, this only allows attaching to previously created kprobes,
> >it does
> >>>>> not allow creating kprobes, right?
> >>> 
> >>>>> That is; I don't think CAP_SYS_PERFMON should be allowed to create
> >>>>> kprobes.
> >>> 
> >>>>> As might be clear; I don't actually know what the user-ABI is for
> >>>>> creating kprobes.
> >>> 
> >>>> There are 2 ABIs nowadays, ftrace and ebpf. perf-probe uses ftrace
> >interface to
> >>>> define new kprobe events, and those events are treated as
> >completely same as
> >>>> tracepoint events. On the other hand, ebpf tries to define new
> >probe event
> >>>> via perf_event interface. Above one is that interface. IOW, it
> >creates new kprobe.
> >>> 
> >>> Masami, any plans to make 'perf probe' use the perf_event_open()
> >>> interface for creating kprobes/uprobes?
> >> 
> >> Would you mean perf probe to switch to perf_event_open()?
> >> No, perf probe is for setting up the ftrace probe events. I think we
> >can add an
> >> option to use perf_event_open(). But current kprobe creation from
> >perf_event_open()
> >> is separated from ftrace by design.
> >
> >I guess we can extend event parser to understand kprobe directly.
> >Instead of
> >
> >	perf probe kernel_func
> >	perf stat/record -e probe:kernel_func ...
> >
> >We can just do 
> >
> >	perf stat/record -e kprobe:kernel_func ...
> 
> 
> You took the words from my mouth, exactly, that is a perfect use case, an alternative to the 'perf probe' one of making a disabled event that then gets activated via record/stat/trace, in many cases it's better, removes the explicit probe setup case.

Ah, I got it. If the perf event parser just kicks perf's kprobe creation
interface, it will be easy. In that case, there should be following differences.

- perf * -e "kprobe":kernel_func will put a local (hidden) kprobe
  events. So ftrace user can not access it.
- perf * -e "kprobe":kernel_func may not support inline/function-body
  nor trace local variables etc.

Hm, if we support inline function via -e "kprobe" interface, we have to
expand perf_event_open() to support multi-probe event.

Thanks,

> 
> Regards, 
> 
> - Arnaldo
> 
> >
> >Thanks,
> >Song
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>
