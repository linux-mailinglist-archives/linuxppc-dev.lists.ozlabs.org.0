Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A891D4A0292
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 22:12:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jlqsw40v4z3cQY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 08:12:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MsLIaUDi;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FXqpOoCE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=MsLIaUDi; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=FXqpOoCE; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JlqsB19Hlz2yJL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jan 2022 08:11:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643404312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kl8+hZCih6hFrtPcq+y44yJja7mQTiBvhEFz2HD3rIc=;
 b=MsLIaUDi0DNPdKUpyKr9u7naukNocsntNyuR3r5QKgVzN0dQSKTrCzUfb9S208L77mi7Nm
 v1dp1f+9+R2ZL683ac/h9LB6WmhHz0ku4BSFZXpyiH+Rs2Ny0Dk6883njk7HU9bYyq3t8T
 xtN/PGmgcLDhfT01rAgdqpDKvGewZ5A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643404313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kl8+hZCih6hFrtPcq+y44yJja7mQTiBvhEFz2HD3rIc=;
 b=FXqpOoCEr3WusX+yBTROzSh6hU66odPcud09CAEisEMeC9+8BGwXGK2bHadnQtFTPrsmUK
 puZcoP+V9VTODmXlVz22FhXF3buMOaKeaFS/o18/c14xbFRS/ZgpTVcTDyMAMnMCAoRp/2
 3m4bDYchVcBfqBBhBb2l9wPD8FNNKUw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-FC5CJJmQPCSoTVo_UCHjmA-1; Fri, 28 Jan 2022 16:11:46 -0500
X-MC-Unique: FC5CJJmQPCSoTVo_UCHjmA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3973C851A03;
 Fri, 28 Jan 2022 21:11:44 +0000 (UTC)
Received: from redhat.com (unknown [10.22.8.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6D6C519BF;
 Fri, 28 Jan 2022 21:11:41 +0000 (UTC)
Date: Fri, 28 Jan 2022 16:11:39 -0500
From: Joe Lawrence <joe.lawrence@redhat.com>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] ftrace: Have architectures opt-in for mcount build time
 sorting
Message-ID: <YfRcC/ggq90jw7Uc@redhat.com>
References: <20220127114249.03b1b52b@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220127114249.03b1b52b@gandalf.local.home>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>,
 LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Sachin Sant <sachinp@linux.ibm.com>, Russell King <linux@armlinux.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, Yinan Liu <yinan@linux.alibaba.com>,
 linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 27, 2022 at 11:42:49AM -0500, Steven Rostedt wrote:
> From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
>
> First S390 complained that the sorting of the mcount sections at build
> time caused the kernel to crash on their architecture. Now PowerPC is
> complaining about it too. And also ARM64 appears to be having issues.
>
> It may be necessary to also update the relocation table for the values
> in the mcount table. Not only do we have to sort the table, but also
> update the relocations that may be applied to the items in the table.
>
> If the system is not relocatable, then it is fine to sort, but if it is,
> some architectures may have issues (although x86 does not as it shifts all
> addresses the same).
>
> Add a HAVE_BUILDTIME_MCOUNT_SORT that an architecture can set to say it is
> safe to do the sorting at build time.
>
> Also update the config to compile in build time sorting in the sorttable
> code in scripts/ to depend on CONFIG_BUILDTIME_MCOUNT_SORT.
>
> Link: https://lore.kernel.org/all/944D10DA-8200-4BA9-8D0A-3BED9AA99F82@linux.ibm.com/
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Yinan Liu <yinan@linux.alibaba.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Reported-by: Sachin Sant <sachinp@linux.ibm.com>
> Tested-by: Sachin Sant <sachinp@linux.ibm.com>
> Fixes: 72b3942a173c ("scripts: ftrace - move the sort-processing in ftrace_init")
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
>  arch/arm/Kconfig     | 1 +
>  arch/x86/Kconfig     | 1 +
>  kernel/trace/Kconfig | 8 +++++++-
>  scripts/Makefile     | 2 +-
>  4 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index c2724d986fa0..5256ebe57451 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -82,6 +82,7 @@ config ARM
>  	select HAVE_EBPF_JIT if !CPU_ENDIAN_BE32
>  	select HAVE_CONTEXT_TRACKING
>  	select HAVE_C_RECORDMCOUNT
> +	select HAVE_BUILDTIME_MCOUNT_SORT
>  	select HAVE_DEBUG_KMEMLEAK if !XIP_KERNEL
>  	select HAVE_DMA_CONTIGUOUS if MMU
>  	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && !CPU_ENDIAN_BE32 && MMU
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 7399327d1eff..46080dea5dba 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -186,6 +186,7 @@ config X86
>  	select HAVE_CONTEXT_TRACKING_OFFSTACK	if HAVE_CONTEXT_TRACKING
>  	select HAVE_C_RECORDMCOUNT
>  	select HAVE_OBJTOOL_MCOUNT		if STACK_VALIDATION
> +	select HAVE_BUILDTIME_MCOUNT_SORT
>  	select HAVE_DEBUG_KMEMLEAK
>  	select HAVE_DMA_CONTIGUOUS
>  	select HAVE_DYNAMIC_FTRACE
> diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
> index 752ed89a293b..7e5b92090faa 100644
> --- a/kernel/trace/Kconfig
> +++ b/kernel/trace/Kconfig
> @@ -70,10 +70,16 @@ config HAVE_C_RECORDMCOUNT
>  	help
>  	  C version of recordmcount available?
>
> +config HAVE_BUILDTIME_MCOUNT_SORT
> +       bool
> +       help
> +         An architecture selects this if it sorts the mcount_loc section
> +	 at build time.
> +
>  config BUILDTIME_MCOUNT_SORT
>         bool
>         default y
> -       depends on BUILDTIME_TABLE_SORT && !S390
> +       depends on HAVE_BUILDTIME_MCOUNT_SORT
>         help
>           Sort the mcount_loc section at build time.
>
> diff --git a/scripts/Makefile b/scripts/Makefile
> index b082d2f93357..cedc1f0e21d8 100644
> --- a/scripts/Makefile
> +++ b/scripts/Makefile
> @@ -32,7 +32,7 @@ HOSTCFLAGS_sorttable.o += -I$(srctree)/tools/arch/x86/include
>  HOSTCFLAGS_sorttable.o += -DUNWINDER_ORC_ENABLED
>  endif
>
> -ifdef CONFIG_DYNAMIC_FTRACE
> +ifdef CONFIG_BUILDTIME_MCOUNT_SORT
>  HOSTCFLAGS_sorttable.o += -DMCOUNT_SORT_ENABLED
>  endif
>
> --
> 2.33.0
>

Hi Steve,

I just finished bisecting what is probably the same problem... when
running the livepatch selftests for 5.17-rc1, x86_64 passes, but I kept
getting errors like this on ppc64le:

  kernel: livepatch: enabling patch 'test_klp_livepatch'
  kernel: livepatch: failed to find location for function 'cmdline_proc_show'
  kernel: livepatch: failed to patch object 'vmlinux'
  kernel: livepatch: failed to enable patch 'test_klp_livepatch'
  kernel: livepatch: 'test_klp_livepatch': unpatching complete

which means klp_get_ftrace_location() / ftrace_location_range() hit a
problem with that function.

The bisect finally landed on:

  72b3942a173c387b27860ba1069636726e208777 is the first bad commit
  commit 72b3942a173c387b27860ba1069636726e208777
  Author: Yinan Liu <yinan@linux.alibaba.com>
  Date:   Sun Dec 12 19:33:58 2021 +0800

      scripts: ftrace - move the sort-processing in ftrace_init

and I can confirm that your updates today in "[for-linus][PATCH 00/10]
tracing: Fixes for 5.17-rc1" fix or avoid the issue.  I just wanted to
add my report in case this adds any future complications for mcount
build time sorting.  Let me know if any additional tests would be
helpful.

Regards,

-- Joe

