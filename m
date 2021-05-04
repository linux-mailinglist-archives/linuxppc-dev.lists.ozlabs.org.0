Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 970913727E6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 11:14:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZDgB4h6Fz30CT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 19:14:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Rvix9dyy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Rvix9dyy; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZDfk0bBBz2y0J
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 19:13:48 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id y32so6227834pga.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 May 2021 02:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=GgMir8Jv2IHmzlSxbRjhXEC3V0/vg3qVNBAw/xVaaF0=;
 b=Rvix9dyyROOFuRLcUdgifDRYA0PRcB0zrsq9dC7AmbNzS2iag1d1c1a6QVs0NsvaXz
 GkFn3DNylqfOdQssZ7aQ8kLfugsL+pdAPbbg2PPrU6nH7QE27MyOoQtFmfz4Asp+YGVq
 PKgx4Z8/nwV5gI1Ac6ul6ToGBsz0Tjh6QCNpFgO55BRmcTDHD0hXCeOdSpR0VTyT1eBq
 M3BQ/velqNcu4LQAUA1Wt3U8GCCYPMHmb8OUUpstjuOpsvc9xLk5sutT831OA2fGNvHX
 aTP09kUv/3IxX+bmuc8QFIvWhJw7XvGwIedG/L4B6dYLxIQ54rBjFHT1EKDXM4pD8D0X
 o5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=GgMir8Jv2IHmzlSxbRjhXEC3V0/vg3qVNBAw/xVaaF0=;
 b=m88CiZlgpbcw/XU/TRMBPQ4xIjDdvbdk+IeOe1IUXrsqmHAlg6rxz+qkSsulCJdfbJ
 nsL0HHOOu5ni7mwjg9aXVMUY1RpFsqdZKOLeHeSePJWXHMam6B+Mpe9jDTpROgpO0Tw9
 kbetHufb7UvvVGMCKQRSVaUdO3Xz1RHzn6g0XfIicRmoGb0kVmsUomUoPOKvw3D5HyBj
 21UZyVCqLQ8KulRr111EnrRIdS7RDxKObFnn1UhgJZL9ao6SC1u869Zx570nQBWTuWxv
 LDIEyRxxIqkIOI1/fBF8jJMQA559kw5xtzimCNF+oSkBWq9VIdgA8nDzYL1ZZGOLYNvL
 jb3A==
X-Gm-Message-State: AOAM530eHmc1Uild/jRJ8YDSLoMxzFlI2C1yKKIbIEPHYudgUSoC9BZB
 3SOO52s1v7xlbptfjFyRDaqxvo0vSHM=
X-Google-Smtp-Source: ABdhPJwBvWqKFv/KO40yYDd1VMA6Q9zV8g2x+jyrG0Uo1b6s+z/waueYxtOdPDngYdlA+ul1PEp6Kw==
X-Received: by 2002:a17:90a:f491:: with SMTP id
 bx17mr3919605pjb.176.1620119625628; 
 Tue, 04 May 2021 02:13:45 -0700 (PDT)
Received: from localhost ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id h20sm11144848pfv.6.2021.05.04.02.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 02:13:45 -0700 (PDT)
Date: Tue, 04 May 2021 19:13:39 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc/64: BE option to use ELFv2 ABI for big endian
 kernels
To: Michal =?iso-8859-1?q?Such=E1nek?= <msuchanek@suse.de>
References: <20200428112517.1402927-1-npiggin@gmail.com>
 <20210502165757.GH6564@kitsune.suse.cz>
 <1620003110.kzo64haq0d.astroid@bobo.none>
 <20210503071116.GI6564@kitsune.suse.cz>
 <20210503093425.GK6564@kitsune.suse.cz>
 <20210503201752.GP6564@kitsune.suse.cz>
In-Reply-To: <20210503201752.GP6564@kitsune.suse.cz>
MIME-Version: 1.0
Message-Id: <1620118312.ynbufjzv5a.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michal Such=C3=A1nek's message of May 4, 2021 6:17 am:
> On Mon, May 03, 2021 at 11:34:25AM +0200, Michal Such=C3=A1nek wrote:
>> On Mon, May 03, 2021 at 09:11:16AM +0200, Michal Such=C3=A1nek wrote:
>> > On Mon, May 03, 2021 at 10:58:33AM +1000, Nicholas Piggin wrote:
>> > > Excerpts from Michal Such=C3=A1nek's message of May 3, 2021 2:57 am:
>> > > > On Tue, Apr 28, 2020 at 09:25:17PM +1000, Nicholas Piggin wrote:
>> > > >> Provide an option to use ELFv2 ABI for big endian builds. This wo=
rks on
>> > > >> GCC and clang (since 2014). It is less well tested and supported =
by the
>> > > >> GNU toolchain, but it can give some useful advantages of the ELFv=
2 ABI
>> > > >> for BE (e.g., less stack usage). Some distros even build BE ELFv2
>> > > >> userspace.
>> > > >=20
>> > > > Fixes BTFID failure on BE for me and the ELF ABIv2 kernel boots.
>> > >=20
>> > > What's the BTFID failure? Anything we can do to fix it on the v1 ABI=
 or=20
>> > > at least make it depend on BUILD_ELF_V2?
>> >=20
>> > Looks like symbols are prefixed with a dot in ABIv1 and BTFID tool is
>> > not aware of that. It can be disabled on ABIv1 easily.
>> >=20
>> > Thanks
>> >=20
>> > Michal
>> >=20
>> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
>> > index 678c13967580..e703c26e9b80 100644
>> > --- a/lib/Kconfig.debug
>> > +++ b/lib/Kconfig.debug
>> > @@ -305,6 +305,7 @@ config DEBUG_INFO_BTF
>> >  	bool "Generate BTF typeinfo"
>> >  	depends on !DEBUG_INFO_SPLIT && !DEBUG_INFO_REDUCED
>> >  	depends on !GCC_PLUGIN_RANDSTRUCT || COMPILE_TEST
>> > +	depends on !PPC64 || BUILD_ELF_V2
>> >  	help
>> >  	  Generate deduplicated BTF type information from DWARF debug info.
>> >  	  Turning this on expects presence of pahole tool, which will conver=
t
>> >=20
>> > >=20
>> > > >=20
>> > > > Tested-by: Michal Such=C3=A1nek <msuchanek@suse.de>
>> > > >=20
>> > > > Also can we enable mprofile on BE now?
>> > > >=20
>> > > > I don't see anything endian-specific in the mprofile code at a gla=
nce
>> > > > but don't have any idea how to test it.
>> > >=20
>> > > AFAIK it's just a different ABI for the _mcount call so just running
>> > > some ftrace and ftrace with call graph should test it reasonably wel=
l.
>>=20
>> It does not crash and burn but there are some regressions from LE to BE
>> on the ftrace kernel selftest:
>>=20
>> --- ftraceLE.txt	2021-05-03 11:19:14.830000000 +0200
>> +++ ftraceBE.txt	2021-05-03 11:27:24.770000000 +0200
>> @@ -7,8 +7,8 @@
>>  [n] Change the ringbuffer size	[PASS]
>>  [n] Snapshot and tracing setting	[PASS]
>>  [n] trace_pipe and trace_marker	[PASS]
>> -[n] Test ftrace direct functions against tracers	[UNRESOLVED]
>> -[n] Test ftrace direct functions against kprobes	[UNRESOLVED]
>> +[n] Test ftrace direct functions against tracers	[FAIL]
>> +[n] Test ftrace direct functions against kprobes	[FAIL]
>>  [n] Generic dynamic event - add/remove kprobe events	[PASS]
>>  [n] Generic dynamic event - add/remove synthetic events	[PASS]
>>  [n] Generic dynamic event - selective clear (compatibility)	[PASS]
>> @@ -16,10 +16,10 @@
>>  [n] event tracing - enable/disable with event level files	[PASS]
>>  [n] event tracing - restricts events based on pid notrace filtering	[PA=
SS]
>>  [n] event tracing - restricts events based on pid	[PASS]
>> -[n] event tracing - enable/disable with subsystem level files	[PASS]
>> +[n] event tracing - enable/disable with subsystem level files	[FAIL]
>>  [n] event tracing - enable/disable with top level files	[PASS]
>> -[n] Test trace_printk from module	[UNRESOLVED]
>> -[n] ftrace - function graph filters with stack tracer	[PASS]
>> +[n] Test trace_printk from module	[FAIL]
>> +[n] ftrace - function graph filters with stack tracer	[FAIL]
>>  [n] ftrace - function graph filters	[PASS]
>>  [n] ftrace - function trace with cpumask	[PASS]
>>  [n] ftrace - test for function event triggers	[PASS]
>> @@ -27,7 +27,7 @@
>>  [n] ftrace - function pid notrace filters	[PASS]
>>  [n] ftrace - function pid filters	[PASS]
>>  [n] ftrace - stacktrace filter command	[PASS]
>> -[n] ftrace - function trace on module	[UNRESOLVED]
>> +[n] ftrace - function trace on module	[FAIL]
>>  [n] ftrace - function profiler with function tracing	[PASS]
>>  [n] ftrace - function profiling	[PASS]
>>  [n] ftrace - test reading of set_ftrace_filter	[PASS]
>> @@ -44,10 +44,10 @@
>>  [n] Kprobe event argument syntax	[PASS]
>>  [n] Kprobe dynamic event with arguments	[PASS]
>>  [n] Kprobes event arguments with types	[PASS]
>> -[n] Kprobe event user-memory access	[UNSUPPORTED]
>> +[n] Kprobe event user-memory access	[FAIL]
>>  [n] Kprobe event auto/manual naming	[PASS]
>>  [n] Kprobe dynamic event with function tracer	[PASS]
>> -[n] Kprobe dynamic event - probing module	[UNRESOLVED]
>> +[n] Kprobe dynamic event - probing module	[FAIL]
>>  [n] Create/delete multiprobe on kprobe event	[PASS]
>>  [n] Kprobe event parser error log check	[PASS]
>>  [n] Kretprobe dynamic event with arguments	[PASS]
>> @@ -57,11 +57,11 @@
>>  [n] Kprobe events - probe points	[PASS]
>>  [n] Kprobe dynamic event - adding and removing	[PASS]
>>  [n] Uprobe event parser error log check	[PASS]
>> -[n] test for the preemptirqsoff tracer	[UNSUPPORTED]
>> -[n] Meta-selftest: Checkbashisms	[UNRESOLVED]
>> +[n] test for the preemptirqsoff tracer	[FAIL]
>> +[n] Meta-selftest: Checkbashisms	[FAIL]
>>  [n] Test wakeup RT tracer	[PASS]
>>  [n] Test wakeup tracer	[PASS]
>> -[n] event trigger - test inter-event histogram trigger expected fail ac=
tions	[XFAIL]
>> +[n] event trigger - test inter-event histogram trigger expected fail ac=
tions	[FAIL]
>>  [n] event trigger - test field variable support	[PASS]
>>  [n] event trigger - test inter-event combined histogram trigger	[PASS]
>>  [n] event trigger - test multiple actions on hist trigger	[PASS]
>> @@ -96,7 +96,8 @@
>>  [n] (instance)  event tracing - enable/disable with event level files	[=
PASS]
>>  [n] (instance)  event tracing - restricts events based on pid notrace f=
iltering	[PASS]
>>  [n] (instance)  event tracing - restricts events based on pid	[PASS]
>> -[n] (instance)  event tracing - enable/disable with subsystem level fil=
es	[PASS]
>> +[n] (instance)  event tracing - enable/disable with subsystem level fil=
es	[FAIL]
>> +rmdir: failed to remove '/sys/kernel/tracing/instances/ftracetest.mceBy=
V': Device or resource busy
>>  [n] (instance)  ftrace - test for function event triggers	[PASS]
>>  [n] (instance)  ftrace - function pid notrace filters	[PASS]
>>  [n] (instance)  ftrace - function pid filters	[PASS]
>>=20
>> I needed to add a test timeout to get this far because
>> "event tracing - enable/disable with subsystem level files" gets stuck.
>=20
> There is some regression from mprofile on BE ABIv2
>=20
> --- ftraceBEv2.txt	2021-05-03 18:11:01.100000000 +0200
> +++ ftraceBE.mprofile.txt	2021-05-03 11:27:24.770000000 +0200
> @@ -19,7 +19,7 @@
>  [n] event tracing - enable/disable with subsystem level files	[FAIL]
>  [n] event tracing - enable/disable with top level files	[PASS]
>  [n] Test trace_printk from module	[FAIL]
> -[n] ftrace - function graph filters with stack tracer	[PASS]
> +[n] ftrace - function graph filters with stack tracer	[FAIL]
>  [n] ftrace - function graph filters	[PASS]
>  [n] ftrace - function trace with cpumask	[PASS]
>  [n] ftrace - test for function event triggers	[PASS]
> @@ -31,7 +31,7 @@
>  [n] ftrace - function profiler with function tracing	[PASS]
>  [n] ftrace - function profiling	[PASS]
>  [n] ftrace - test reading of set_ftrace_filter	[PASS]
> -[n] ftrace - Max stack tracer	[PASS]
> +[n] ftrace - Max stack tracer	[FAIL]
>  [n] ftrace - test for function traceon/off triggers	[PASS]
>  [n] ftrace - test tracing error log support	[PASS]
>  [n] Test creation and deletion of trace instances while setting an event=
	[PASS]

Hmm, I don't see an obvious case where the stack layout is based on
BE when it should be using ELF ABI version, or ftrace_64_mprofile.S
depends on LE. +Naveen

>=20
> but generally the ftrace on BE is broken overall. The test
> "event tracing - enable/disable with subsystem level files" gets stuck
> and has to be killed by timeout. Running the testsuite twice the test
> "Basic test for tracers" locks up the machine regardless of using
> mprofile. The ABIV1 is even much worse with the exception of
> "(instance)  event tracing - enable/disable with subsystem level files"
> which regresses on BE ABIv2 in general.

Wow it has fixed quite a few! That event tracing one hardly looks like
a difficult test, hopefully should be something trivial.

Thanks for testing.

Thanks,
Nick

>=20
> --- ftraceBEv1.txt	2021-05-03 22:09:10.690000000 +0200
> +++ ftraceBEv2.txt	2021-05-03 18:11:01.100000000 +0200
> @@ -9,10 +9,10 @@
>  [n] trace_pipe and trace_marker	[PASS]
>  [n] Test ftrace direct functions against tracers	[FAIL]
>  [n] Test ftrace direct functions against kprobes	[FAIL]
> -[n] Generic dynamic event - add/remove kprobe events	[FAIL]
> +[n] Generic dynamic event - add/remove kprobe events	[PASS]
>  [n] Generic dynamic event - add/remove synthetic events	[PASS]
> -[n] Generic dynamic event - selective clear (compatibility)	[FAIL]
> -[n] Generic dynamic event - generic clear event	[FAIL]
> +[n] Generic dynamic event - selective clear (compatibility)	[PASS]
> +[n] Generic dynamic event - generic clear event	[PASS]
>  [n] event tracing - enable/disable with event level files	[PASS]
>  [n] event tracing - restricts events based on pid notrace filtering	[PAS=
S]
>  [n] event tracing - restricts events based on pid	[PASS]
> @@ -23,39 +23,39 @@
>  [n] ftrace - function graph filters	[PASS]
>  [n] ftrace - function trace with cpumask	[PASS]
>  [n] ftrace - test for function event triggers	[PASS]
> -[n] ftrace - function glob filters	[FAIL]
> +[n] ftrace - function glob filters	[PASS]
>  [n] ftrace - function pid notrace filters	[PASS]
>  [n] ftrace - function pid filters	[PASS]
>  [n] ftrace - stacktrace filter command	[PASS]
>  [n] ftrace - function trace on module	[FAIL]
>  [n] ftrace - function profiler with function tracing	[PASS]
>  [n] ftrace - function profiling	[PASS]
> -[n] ftrace - test reading of set_ftrace_filter	[FAIL]
> +[n] ftrace - test reading of set_ftrace_filter	[PASS]
>  [n] ftrace - Max stack tracer	[PASS]
>  [n] ftrace - test for function traceon/off triggers	[PASS]
>  [n] ftrace - test tracing error log support	[PASS]
>  [n] Test creation and deletion of trace instances while setting an event=
	[PASS]
>  [n] Test creation and deletion of trace instances	[PASS]
> -[n] Kprobe dynamic event - adding and removing	[FAIL]
> -[n] Kprobe dynamic event - busy event check	[FAIL]
> -[n] Kprobe dynamic event with arguments	[FAIL]
> -[n] Kprobe event with comm arguments	[FAIL]
> -[n] Kprobe event string type argument	[FAIL]
> -[n] Kprobe event symbol argument	[FAIL]
> -[n] Kprobe event argument syntax	[FAIL]
> -[n] Kprobes event arguments with types	[FAIL]
> +[n] Kprobe dynamic event - adding and removing	[PASS]
> +[n] Kprobe dynamic event - busy event check	[PASS]
> +[n] Kprobe event with comm arguments	[PASS]
> +[n] Kprobe event string type argument	[PASS]
> +[n] Kprobe event symbol argument	[PASS]
> +[n] Kprobe event argument syntax	[PASS]
> +[n] Kprobe dynamic event with arguments	[PASS]
> +[n] Kprobes event arguments with types	[PASS]
>  [n] Kprobe event user-memory access	[FAIL]
>  [n] Kprobe event auto/manual naming	[PASS]
> -[n] Kprobe dynamic event with function tracer	[FAIL]
> +[n] Kprobe dynamic event with function tracer	[PASS]
>  [n] Kprobe dynamic event - probing module	[FAIL]
> -[n] Create/delete multiprobe on kprobe event	[FAIL]
> -[n] Kprobe event parser error log check	[FAIL]
> -[n] Kretprobe dynamic event with arguments	[FAIL]
> -[n] Kretprobe dynamic event with maxactive	[FAIL]
> -[n] Kretprobe %return suffix test	[FAIL]
> -[n] Register/unregister many kprobe events	[FAIL]
> -[n] Kprobe events - probe points	[FAIL]
> -[n] Kprobe dynamic event - adding and removing	[FAIL]
> +[n] Create/delete multiprobe on kprobe event	[PASS]
> +[n] Kprobe event parser error log check	[PASS]
> +[n] Kretprobe dynamic event with arguments	[PASS]
> +[n] Kretprobe dynamic event with maxactive	[PASS]
> +[n] Kretprobe %return suffix test	[PASS]
> +[n] Register/unregister many kprobe events	[PASS]
> +[n] Kprobe events - probe points	[PASS]
> +[n] Kprobe dynamic event - adding and removing	[PASS]
>  [n] Uprobe event parser error log check	[PASS]
>  [n] test for the preemptirqsoff tracer	[FAIL]
>  [n] Meta-selftest: Checkbashisms	[FAIL]
> @@ -96,7 +96,8 @@
>  [n] (instance)  event tracing - enable/disable with event level files	[P=
ASS]
>  [n] (instance)  event tracing - restricts events based on pid notrace fi=
ltering	[PASS]
>  [n] (instance)  event tracing - restricts events based on pid	[PASS]
> -[n] (instance)  event tracing - enable/disable with subsystem level file=
s	[PASS]
> +[n] (instance)  event tracing - enable/disable with subsystem level file=
s	[FAIL]
> +rmdir: failed to remove '/sys/kernel/tracing/instances/ftracetest.lxCI5k=
': Device or resource busy
>  [n] (instance)  ftrace - test for function event triggers	[PASS]
>  [n] (instance)  ftrace - function pid notrace filters	[PASS]
>  [n] (instance)  ftrace - function pid filters	[PASS]
>=20
>=20
> Thanks
>=20
> Michal
>=20
