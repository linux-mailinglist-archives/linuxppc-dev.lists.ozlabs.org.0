Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A171498521
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 17:46:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjG8n1KsGz3cQJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 03:46:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org;
 envelope-from=srs0=jwif=si=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjG8G6gx2z30Lc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jan 2022 03:46:06 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 65E1EB810D6;
 Mon, 24 Jan 2022 16:46:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D612DC340E5;
 Mon, 24 Jan 2022 16:45:59 +0000 (UTC)
Date: Mon, 24 Jan 2022 11:45:48 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Yinan Liu <yinan@linux.alibaba.com>
Subject: Re: [powerpc] ftrace warning kernel/trace/ftrace.c:2068 with
 code-patching selftests
Message-ID: <20220124114548.30241947@gandalf.local.home>
In-Reply-To: <e9422643-a210-b77f-a037-da63a9d2e925@linux.alibaba.com>
References: <944D10DA-8200-4BA9-8D0A-3BED9AA99F82@linux.ibm.com>
 <e9422643-a210-b77f-a037-da63a9d2e925@linux.alibaba.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org, Sachin Sant <sachinp@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 24 Jan 2022 20:15:06 +0800
Yinan Liu <yinan@linux.alibaba.com> wrote:

> Hi, Steven and Sachin
> 
> I don't have a powerpc machine for testing, I guess the ppc has a 
> similar problem with the s390. It's not clear to me why the compiler 
> does this. Maybe we can handle ppc like you did with the s390 before, 
> but I'm not sure if other architectures have similar issues. Or limit 
> BUILDTIME_MCOUNT_SORT to a smaller scope and make it only available for 
> x86 and arm?
> 
> steven, what's your opinion?

Yeah, I think it's time to opt in, instead of opting out.

Something like this:

-- Steve

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index c2724d986fa0..5256ebe57451 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -82,6 +82,7 @@ config ARM
 	select HAVE_EBPF_JIT if !CPU_ENDIAN_BE32
 	select HAVE_CONTEXT_TRACKING
 	select HAVE_C_RECORDMCOUNT
+	select HAVE_BUILDTIME_MCOUNT_SORT
 	select HAVE_DEBUG_KMEMLEAK if !XIP_KERNEL
 	select HAVE_DMA_CONTIGUOUS if MMU
 	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && !CPU_ENDIAN_BE32 && MMU
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index c4207cf9bb17..7996548b2b27 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -166,6 +166,7 @@ config ARM64
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_EBPF_JIT
 	select HAVE_C_RECORDMCOUNT
+	select HAVE_BUILDTIME_MCOUNT_SORT
 	select HAVE_CMPXCHG_DOUBLE
 	select HAVE_CMPXCHG_LOCAL
 	select HAVE_CONTEXT_TRACKING
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 7399327d1eff..46080dea5dba 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -186,6 +186,7 @@ config X86
 	select HAVE_CONTEXT_TRACKING_OFFSTACK	if HAVE_CONTEXT_TRACKING
 	select HAVE_C_RECORDMCOUNT
 	select HAVE_OBJTOOL_MCOUNT		if STACK_VALIDATION
+	select HAVE_BUILDTIME_MCOUNT_SORT
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS
 	select HAVE_DYNAMIC_FTRACE
diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index 752ed89a293b..7e5b92090faa 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -70,10 +70,16 @@ config HAVE_C_RECORDMCOUNT
 	help
 	  C version of recordmcount available?
 
+config HAVE_BUILDTIME_MCOUNT_SORT
+       bool
+       help
+         An architecture selects this if it sorts the mcount_loc section
+	 at build time.
+
 config BUILDTIME_MCOUNT_SORT
        bool
        default y
-       depends on BUILDTIME_TABLE_SORT && !S390
+       depends on HAVE_BUILDTIME_MCOUNT_SORT
        help
          Sort the mcount_loc section at build time.
 
