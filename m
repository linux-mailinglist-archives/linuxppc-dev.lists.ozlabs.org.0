Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4E54E4564
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 18:42:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNJhT1dLbz30KL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 04:42:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.219.182;
 helo=mail-yb1-f182.google.com; envelope-from=rjwysocki@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNJh02WZLz2xWc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Mar 2022 04:41:34 +1100 (AEDT)
Received: by mail-yb1-f182.google.com with SMTP id y142so34916787ybe.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Mar 2022 10:41:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uBwvYMbRVWzNNTUELOPjunMscPYO6cMzGqNzPKWdzP4=;
 b=OxYOfh48NpnmNyjY+GGjdMq149JcafzdcX00Vn2RuQMHzXIt1YQrs1Og/irFnhU0mI
 n0erKGVgjmxT6ddpOruo/anZb1B8xKsDWHBGSddegWFanOjPuIBST2XUziebDrzl6T1v
 Onr7niXsGN1R/HXGpcs703imLxrDpmwSkGuoM7abvRZynbDrcsX07/YSSki4B3EfXdTo
 zqy+4pj/Ai2H5ecOD4HTpv6qDMPInbifxwNaTa2VAf6U35NvkVwE7rXoEdBESSZymx3V
 cdmQlc1YpWbxybkAqvEnBQyXkvxudXDXjnLu7rWTA0kuBNREZwvhDPs83WWDLDsJqQV/
 UaQg==
X-Gm-Message-State: AOAM530EaCQJ4Ebss6GKUykltLlc34WFWtdx6D3StNxFAs8bKrji4asL
 pCFC59uF9KD09v0/d7HplrcAKUr/7C8bJKahoa0=
X-Google-Smtp-Source: ABdhPJxQ4E8QnsbmqO3EZO6txiQD37jFX04p93gcdE/1YLnV3YAWltpIKi/mcrTNopQ2Ayq1ac6N0Ls0Fa9Cpq5Tvyg=
X-Received: by 2002:a25:508:0:b0:633:bcf2:d29a with SMTP id
 8-20020a250508000000b00633bcf2d29amr19967378ybf.81.1647970891362; Tue, 22 Mar
 2022 10:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220321012216.23724-1-rdunlap@infradead.org>
In-Reply-To: <20220321012216.23724-1-rdunlap@infradead.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 22 Mar 2022 18:41:20 +0100
Message-ID: <CAJZ5v0jBFOWZZrGuBb0GyJa3rKRwSYXrMFOtGu8jLnQ+OPtXHw@mail.gmail.com>
Subject: Re: [PATCH] Docs: admin/kernel-parameters: edit a few boot options
To: Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-ia64@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 linux-s390@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Len Brown <lenb@kernel.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Linux PM <linux-pm@vger.kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sven Schnelle <svens@linux.ibm.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 21, 2022 at 2:22 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Clean up some of admin-guide/kernel-parameters.txt:
>
> a. "smt" should be "smt=" (S390)
> b. add "smt-enabled" for POWERPC
> c. Sparc supports the vdso= boot option
> d. make the tp_printk options (2) formatting similar to other options
>    by adding spacing
> e. add "trace_clock=" with a reference to Documentation/trace/ftrace.rst
> f. use [IA-64] as documented instead of [ia64]
> g. fix formatting and text for test_suspend=

This ->

> h. fix formatting for swapaccount=
> i. fix formatting and grammar for video.brightness_switch_enabled=

-> and the last one are fine with me, but I suppose that there will be a v2?

> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Alexander Gordeev <agordeev@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
> Cc: Sven Schnelle <svens@linux.ibm.com>
> Cc: linux-s390@vger.kernel.org
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: sparclinux@vger.kernel.org
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-ia64@vger.kernel.org
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Len Brown <lenb@kernel.org>
> Cc: linux-pm@vger.kernel.org
> Cc: linux-acpi@vger.kernel.org
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> ---
>  Documentation/admin-guide/kernel-parameters.txt |   33 +++++++++-----
>  1 file changed, 22 insertions(+), 11 deletions(-)
>
> --- linux-next-20220318.orig/Documentation/admin-guide/kernel-parameters.txt
> +++ linux-next-20220318/Documentation/admin-guide/kernel-parameters.txt
> @@ -2814,7 +2814,7 @@
>                         different yeeloong laptops.
>                         Example: machtype=lemote-yeeloong-2f-7inch
>
> -       max_addr=nn[KMG]        [KNL,BOOT,ia64] All physical memory greater
> +       max_addr=nn[KMG]        [KNL,BOOT,IA-64] All physical memory greater
>                         than or equal to this physical address is ignored.
>
>         maxcpus=        [SMP] Maximum number of processors that an SMP kernel
> @@ -3057,7 +3057,7 @@
>
>         mga=            [HW,DRM]
>
> -       min_addr=nn[KMG]        [KNL,BOOT,ia64] All physical memory below this
> +       min_addr=nn[KMG]        [KNL,BOOT,IA-64] All physical memory below this
>                         physical address is ignored.
>
>         mini2440=       [ARM,HW,KNL]
> @@ -5382,13 +5382,19 @@
>                                 1: Fast pin select (default)
>                                 2: ATC IRMode
>
> -       smt             [KNL,S390] Set the maximum number of threads (logical
> +       smt=            [KNL,S390] Set the maximum number of threads (logical
>                         CPUs) to use per physical CPU on systems capable of
>                         symmetric multithreading (SMT). Will be capped to the
>                         actual hardware limit.
>                         Format: <integer>
>                         Default: -1 (no limit)
>
> +       smt-enabled=    [PPC 64-bit] Enable SMT, disable SMT, or set the
> +                       maximum number of threads. This can be used to override
> +                       the Open Firmware (OF) option.
> +                       Format: on | off | <integer>
> +                       Default: all threads enabled
> +
>         softlockup_panic=
>                         [KNL] Should the soft-lockup detector generate panics.
>                         Format: 0 | 1
> @@ -5768,8 +5774,9 @@
>                         This parameter controls use of the Protected
>                         Execution Facility on pSeries.
>
> -       swapaccount=[0|1]
> -                       [KNL] Enable accounting of swap in memory resource
> +       swapaccount=    [KNL]
> +                       Format: [0|1]
> +                       Enable accounting of swap in memory resource
>                         controller if no parameter or 1 is given or disable
>                         it if 0 is given (See Documentation/admin-guide/cgroup-v1/memory.rst)
>
> @@ -5815,7 +5822,8 @@
>
>         tdfx=           [HW,DRM]
>
> -       test_suspend=   [SUSPEND][,N]
> +       test_suspend=   [SUSPEND]
> +                       Format: { "mem" | "standby" | "freeze" }[,N]
>                         Specify "mem" (for Suspend-to-RAM) or "standby" (for
>                         standby suspend) or "freeze" (for suspend type freeze)
>                         as the system sleep state during system startup with
> @@ -5902,6 +5910,8 @@
>         trace_buf_size=nn[KMG]
>                         [FTRACE] will set tracing buffer size on each cpu.
>
> +       trace_clock=    [FTRACE] See Documentation/trace/ftrace.rst
> +
>         trace_event=[event-list]
>                         [FTRACE] Set and start specified trace events in order
>                         to facilitate early boot debugging. The event-list is a
> @@ -5924,7 +5934,7 @@
>                         See also Documentation/trace/ftrace.rst "trace options"
>                         section.
>
> -       tp_printk[FTRACE]
> +       tp_printk       [FTRACE]
>                         Have the tracepoints sent to printk as well as the
>                         tracing ring buffer. This is useful for early boot up
>                         where the system hangs or reboots and does not give the
> @@ -5946,7 +5956,7 @@
>                         frequency tracepoints such as irq or sched, can cause
>                         the system to live lock.
>
> -       tp_printk_stop_on_boot[FTRACE]
> +       tp_printk_stop_on_boot [FTRACE]
>                         When tp_printk (above) is set, it can cause a lot of noise
>                         on the console. It may be useful to only include the
>                         printing of events during boot up, as user space may
> @@ -6295,7 +6305,7 @@
>                                         HIGHMEM regardless of setting
>                                         of CONFIG_HIGHPTE.
>
> -       vdso=           [X86,SH]
> +       vdso=           [X86,SH,SPARC]
>                         On X86_32, this is an alias for vdso32=.  Otherwise:
>
>                         vdso=1: enable VDSO (the default)
> @@ -6321,11 +6331,12 @@
>         video=          [FB] Frame buffer configuration
>                         See Documentation/fb/modedb.rst.
>
> -       video.brightness_switch_enabled= [0,1]
> +       video.brightness_switch_enabled= [ACPI]
> +                       Format: [0|1]
>                         If set to 1, on receiving an ACPI notify event
>                         generated by hotkey, video driver will adjust brightness
>                         level and then send out the event to user space through
> -                       the allocated input device; If set to 0, video driver
> +                       the allocated input device. If set to 0, video driver
>                         will only send out the event without touching backlight
>                         brightness level.
>                         default: 1
