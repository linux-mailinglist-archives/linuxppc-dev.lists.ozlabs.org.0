Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A55BA37130F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 11:34:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYd9P3yqTz301k
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 19:34:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYd922C25z2y86
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 19:34:29 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DA031B132;
 Mon,  3 May 2021 09:34:26 +0000 (UTC)
Date: Mon, 3 May 2021 11:34:25 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc/64: BE option to use ELFv2 ABI for big endian
 kernels
Message-ID: <20210503093425.GK6564@kitsune.suse.cz>
References: <20200428112517.1402927-1-npiggin@gmail.com>
 <20210502165757.GH6564@kitsune.suse.cz>
 <1620003110.kzo64haq0d.astroid@bobo.none>
 <20210503071116.GI6564@kitsune.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210503071116.GI6564@kitsune.suse.cz>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 03, 2021 at 09:11:16AM +0200, Michal Suchánek wrote:
> On Mon, May 03, 2021 at 10:58:33AM +1000, Nicholas Piggin wrote:
> > Excerpts from Michal Suchánek's message of May 3, 2021 2:57 am:
> > > On Tue, Apr 28, 2020 at 09:25:17PM +1000, Nicholas Piggin wrote:
> > >> Provide an option to use ELFv2 ABI for big endian builds. This works on
> > >> GCC and clang (since 2014). It is less well tested and supported by the
> > >> GNU toolchain, but it can give some useful advantages of the ELFv2 ABI
> > >> for BE (e.g., less stack usage). Some distros even build BE ELFv2
> > >> userspace.
> > > 
> > > Fixes BTFID failure on BE for me and the ELF ABIv2 kernel boots.
> > 
> > What's the BTFID failure? Anything we can do to fix it on the v1 ABI or 
> > at least make it depend on BUILD_ELF_V2?
> 
> Looks like symbols are prefixed with a dot in ABIv1 and BTFID tool is
> not aware of that. It can be disabled on ABIv1 easily.
> 
> Thanks
> 
> Michal
> 
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 678c13967580..e703c26e9b80 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -305,6 +305,7 @@ config DEBUG_INFO_BTF
>  	bool "Generate BTF typeinfo"
>  	depends on !DEBUG_INFO_SPLIT && !DEBUG_INFO_REDUCED
>  	depends on !GCC_PLUGIN_RANDSTRUCT || COMPILE_TEST
> +	depends on !PPC64 || BUILD_ELF_V2
>  	help
>  	  Generate deduplicated BTF type information from DWARF debug info.
>  	  Turning this on expects presence of pahole tool, which will convert
> 
> > 
> > > 
> > > Tested-by: Michal Suchánek <msuchanek@suse.de>
> > > 
> > > Also can we enable mprofile on BE now?
> > > 
> > > I don't see anything endian-specific in the mprofile code at a glance
> > > but don't have any idea how to test it.
> > 
> > AFAIK it's just a different ABI for the _mcount call so just running
> > some ftrace and ftrace with call graph should test it reasonably well.

It does not crash and burn but there are some regressions from LE to BE
on the ftrace kernel selftest:

--- ftraceLE.txt	2021-05-03 11:19:14.830000000 +0200
+++ ftraceBE.txt	2021-05-03 11:27:24.770000000 +0200
@@ -7,8 +7,8 @@
 [n] Change the ringbuffer size	[PASS]
 [n] Snapshot and tracing setting	[PASS]
 [n] trace_pipe and trace_marker	[PASS]
-[n] Test ftrace direct functions against tracers	[UNRESOLVED]
-[n] Test ftrace direct functions against kprobes	[UNRESOLVED]
+[n] Test ftrace direct functions against tracers	[FAIL]
+[n] Test ftrace direct functions against kprobes	[FAIL]
 [n] Generic dynamic event - add/remove kprobe events	[PASS]
 [n] Generic dynamic event - add/remove synthetic events	[PASS]
 [n] Generic dynamic event - selective clear (compatibility)	[PASS]
@@ -16,10 +16,10 @@
 [n] event tracing - enable/disable with event level files	[PASS]
 [n] event tracing - restricts events based on pid notrace filtering	[PASS]
 [n] event tracing - restricts events based on pid	[PASS]
-[n] event tracing - enable/disable with subsystem level files	[PASS]
+[n] event tracing - enable/disable with subsystem level files	[FAIL]
 [n] event tracing - enable/disable with top level files	[PASS]
-[n] Test trace_printk from module	[UNRESOLVED]
-[n] ftrace - function graph filters with stack tracer	[PASS]
+[n] Test trace_printk from module	[FAIL]
+[n] ftrace - function graph filters with stack tracer	[FAIL]
 [n] ftrace - function graph filters	[PASS]
 [n] ftrace - function trace with cpumask	[PASS]
 [n] ftrace - test for function event triggers	[PASS]
@@ -27,7 +27,7 @@
 [n] ftrace - function pid notrace filters	[PASS]
 [n] ftrace - function pid filters	[PASS]
 [n] ftrace - stacktrace filter command	[PASS]
-[n] ftrace - function trace on module	[UNRESOLVED]
+[n] ftrace - function trace on module	[FAIL]
 [n] ftrace - function profiler with function tracing	[PASS]
 [n] ftrace - function profiling	[PASS]
 [n] ftrace - test reading of set_ftrace_filter	[PASS]
@@ -44,10 +44,10 @@
 [n] Kprobe event argument syntax	[PASS]
 [n] Kprobe dynamic event with arguments	[PASS]
 [n] Kprobes event arguments with types	[PASS]
-[n] Kprobe event user-memory access	[UNSUPPORTED]
+[n] Kprobe event user-memory access	[FAIL]
 [n] Kprobe event auto/manual naming	[PASS]
 [n] Kprobe dynamic event with function tracer	[PASS]
-[n] Kprobe dynamic event - probing module	[UNRESOLVED]
+[n] Kprobe dynamic event - probing module	[FAIL]
 [n] Create/delete multiprobe on kprobe event	[PASS]
 [n] Kprobe event parser error log check	[PASS]
 [n] Kretprobe dynamic event with arguments	[PASS]
@@ -57,11 +57,11 @@
 [n] Kprobe events - probe points	[PASS]
 [n] Kprobe dynamic event - adding and removing	[PASS]
 [n] Uprobe event parser error log check	[PASS]
-[n] test for the preemptirqsoff tracer	[UNSUPPORTED]
-[n] Meta-selftest: Checkbashisms	[UNRESOLVED]
+[n] test for the preemptirqsoff tracer	[FAIL]
+[n] Meta-selftest: Checkbashisms	[FAIL]
 [n] Test wakeup RT tracer	[PASS]
 [n] Test wakeup tracer	[PASS]
-[n] event trigger - test inter-event histogram trigger expected fail actions	[XFAIL]
+[n] event trigger - test inter-event histogram trigger expected fail actions	[FAIL]
 [n] event trigger - test field variable support	[PASS]
 [n] event trigger - test inter-event combined histogram trigger	[PASS]
 [n] event trigger - test multiple actions on hist trigger	[PASS]
@@ -96,7 +96,8 @@
 [n] (instance)  event tracing - enable/disable with event level files	[PASS]
 [n] (instance)  event tracing - restricts events based on pid notrace filtering	[PASS]
 [n] (instance)  event tracing - restricts events based on pid	[PASS]
-[n] (instance)  event tracing - enable/disable with subsystem level files	[PASS]
+[n] (instance)  event tracing - enable/disable with subsystem level files	[FAIL]
+rmdir: failed to remove '/sys/kernel/tracing/instances/ftracetest.mceByV': Device or resource busy
 [n] (instance)  ftrace - test for function event triggers	[PASS]
 [n] (instance)  ftrace - function pid notrace filters	[PASS]
 [n] (instance)  ftrace - function pid filters	[PASS]

I needed to add a test timeout to get this far because
"event tracing - enable/disable with subsystem level files" gets stuck.

Thanks

Michal
