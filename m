Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EAA3228F3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Feb 2021 11:43:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DlFyc2gVKz3cTb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Feb 2021 21:43:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JxXlKCmf;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T9ebaDXl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=omosnace@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=JxXlKCmf; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=T9ebaDXl; 
 dkim-atps=neutral
X-Greylist: delayed 307 seconds by postgrey-1.36 at boromir;
 Tue, 23 Feb 2021 21:43:11 AEDT
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DlFy73LYXz30HR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Feb 2021 21:43:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614076987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6X1ACmNbpWqJLBUgdtdwP6Lo/QJ31ZdADxN8dQjYdPE=;
 b=JxXlKCmfivZuTL6CgdCdWELUZLlgWE5gY2b9UjZvSs0j15AaCWCSSW35na8iTEvWSks4uk
 kcSdgfLx7e9tiIFY4Ju0PR+o9Gn1ZUYPL7kUPpkapkcgpn5ga0lIFsFSi9uLRluzft10EP
 g76/eScWINEzlZjLtk/cgA+ZU4Dk6SQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614076988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6X1ACmNbpWqJLBUgdtdwP6Lo/QJ31ZdADxN8dQjYdPE=;
 b=T9ebaDXl6KTSDemj9Ai0DNdDG72L2i3XVaOuhdsDzDBzs2TIFogkpJMMRO3RKRTlGOtR2C
 lUR4iFxpPoBYiFYioWVWmz3SQHDfSERvUO55Mtxx/JUVsNn8kvTIB/zPDf97adG4Vk68Pk
 dr0Zenm8FSrV/nG7/pJuTh06/dUNYjE=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-DxA2HyfHMCe6d2XpLw9u_g-1; Tue, 23 Feb 2021 05:36:30 -0500
X-MC-Unique: DxA2HyfHMCe6d2XpLw9u_g-1
Received: by mail-yb1-f197.google.com with SMTP id l3so20080682ybf.17
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Feb 2021 02:36:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6X1ACmNbpWqJLBUgdtdwP6Lo/QJ31ZdADxN8dQjYdPE=;
 b=Z1La9jMphMz86YRxqGELw7U6mwpM4barFVnFK+d3eN1fmC3CiicC/2QJq+z2iI1ko9
 utXRM5L6OCpopxwRbbVhRqq9oM10NPoXS6lq2pqo/st8D/Bo3QF60e7Yavr4D0ZlKEAs
 FEdMSAjLF6Krp1dFo/6KTGz7IXr4Q2cdKb4iA+0ffuajSwQkv4IE1fEBHSvrWocp8hY+
 Vw1x3kOpN81IeFa0kHLcFlbhgiXIzK3N5elItgQYhxRTCKWEoRgo8Q2aO08eJBiH6p+J
 WUhY1oe7uwE6CWX3oXo26QrXbNIWlynu+TzbgzG5wmML6KV2JfxMi+SVW6NpByiIl1FF
 5YwQ==
X-Gm-Message-State: AOAM5339FWEIabmaWSj43wRZSPak0ScsVJaVGG9cuuvWhvHSAmPqWilD
 B64Z31wXxz5ov2Ol0lj5sCFoJTL2/XExISGeXMonzL5ictcHD+Kzn/GPx1i/QbKt1UO2zZhc3fK
 Uy20ml2aLpl+K34SOPOW2Jmm5jX0IDtmMfciUjTIvQQ==
X-Received: by 2002:a25:3385:: with SMTP id
 z127mr32702984ybz.340.1614076589488; 
 Tue, 23 Feb 2021 02:36:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfWHpKt6hHYYDxN6TCGtOsoh2GFmH97PgpL79orUuLx8x8uutsBuWqNtJYKvS3ToTbk+LRawV65pcuG2NFD/w=
X-Received: by 2002:a25:3385:: with SMTP id
 z127mr32702953ybz.340.1614076589206; 
 Tue, 23 Feb 2021 02:36:29 -0800 (PST)
MIME-Version: 1.0
References: <1614061909-1734-1-git-send-email-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <1614061909-1734-1-git-send-email-atrajeev@linux.vnet.ibm.com>
From: Ondrej Mosnacek <omosnace@redhat.com>
Date: Tue, 23 Feb 2021 11:36:18 +0100
Message-ID: <CAFqZXNuRSC1fnMduNC=mt2-H8gJsoXbm-fgQtNHg2kHvD__-xg@mail.gmail.com>
Subject: Re: [PATCH] powerpc/perf: Fix handling of privilege level checks in
 perf interrupt context
To: atrajeev@linux.vnet.ibm.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=omosnace@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: maddy@linux.ibm.com, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 SElinux list <selinux@vger.kernel.org>,
 Linux Security Module list <linux-security-module@vger.kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

(CC'ing LSM and SELinux lists; the initial message can be found here:
https://lore.kernel.org/linuxppc-dev/1614061909-1734-1-git-send-email-atrajeev@linux.vnet.ibm.com/T/)

On Tue, Feb 23, 2021 at 7:32 AM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
> Running "perf mem record" in powerpc platforms with selinux enabled
> resulted in soft lockup's. Below call-trace was seen in the logs:
>
> CPU: 58 PID: 3751 Comm: sssd_nss Not tainted 5.11.0-rc7+ #2
> NIP:  c000000000dff3d4 LR: c000000000dff3d0 CTR: 0000000000000000
> REGS: c000007fffab7d60 TRAP: 0100   Not tainted  (5.11.0-rc7+)
> <<>>
> NIP [c000000000dff3d4] _raw_spin_lock_irqsave+0x94/0x120
> LR [c000000000dff3d0] _raw_spin_lock_irqsave+0x90/0x120
> Call Trace:
> [c00000000fd471a0] [c00000000fd47260] 0xc00000000fd47260 (unreliable)
> [c00000000fd471e0] [c000000000b5fbbc] skb_queue_tail+0x3c/0x90
> [c00000000fd47220] [c000000000296edc] audit_log_end+0x6c/0x180
> [c00000000fd47260] [c0000000006a3f20] common_lsm_audit+0xb0/0xe0
> [c00000000fd472a0] [c00000000066c664] slow_avc_audit+0xa4/0x110
> [c00000000fd47320] [c00000000066cff4] avc_has_perm+0x1c4/0x260
> [c00000000fd47430] [c00000000066e064] selinux_perf_event_open+0x74/0xd0
> [c00000000fd47450] [c000000000669888] security_perf_event_open+0x68/0xc0
> [c00000000fd47490] [c00000000013d788] record_and_restart+0x6e8/0x7f0
> [c00000000fd476c0] [c00000000013dabc] perf_event_interrupt+0x22c/0x560
> [c00000000fd477d0] [c00000000002d0fc] performance_monitor_exception+0x4c/0x60
> [c00000000fd477f0] [c00000000000b378] performance_monitor_common_virt+0x1c8/0x1d0
> interrupt: f00 at _raw_spin_lock_irqsave+0x38/0x120
> NIP:  c000000000dff378 LR: c000000000b5fbbc CTR: c0000000007d47f0
> REGS: c00000000fd47860 TRAP: 0f00   Not tainted  (5.11.0-rc7+)
> <<>>
> NIP [c000000000dff378] _raw_spin_lock_irqsave+0x38/0x120
> LR [c000000000b5fbbc] skb_queue_tail+0x3c/0x90
> interrupt: f00
> [c00000000fd47b00] [0000000000000038] 0x38 (unreliable)
> [c00000000fd47b40] [c00000000aae6200] 0xc00000000aae6200
> [c00000000fd47b80] [c000000000296edc] audit_log_end+0x6c/0x180
> [c00000000fd47bc0] [c00000000029f494] audit_log_exit+0x344/0xf80
> [c00000000fd47d10] [c0000000002a2b00] __audit_syscall_exit+0x2c0/0x320
> [c00000000fd47d60] [c000000000032878] do_syscall_trace_leave+0x148/0x200
> [c00000000fd47da0] [c00000000003d5b4] syscall_exit_prepare+0x324/0x390
> [c00000000fd47e10] [c00000000000d76c] system_call_common+0xfc/0x27c
>
> The above trace shows that while the CPU was handling a performance
> monitor exception, there was a call to "security_perf_event_open"
> function. In powerpc core-book3s, this function is called from
> 'perf_allow_kernel' check during recording of data address in the sample
> via perf_get_data_addr().
>
> Commit da97e18458fb ("perf_event: Add support for LSM and SELinux checks")
> introduced security enhancements to perf. As part of this commit, the new
> security hook for perf_event_open was added in all places where perf
> paranoid check was previously used. In powerpc core-book3s code, originally
> had paranoid checks in 'perf_get_data_addr' and 'power_pmu_bhrb_read'. So
> 'perf_paranoid_kernel' checks were replaced with 'perf_allow_kernel' in
> these pmu helper functions as well.
>
> The intention of paranoid checks in core-book3s is to verify privilege
> access before capturing some of the sample data. Along with paranoid
> checks, 'perf_allow_kernel' also does a 'security_perf_event_open'. Since
> these functions are accessed while recording sample, we end up in calling
> selinux_perf_event_open in PMI context. Some of the security functions
> use spinlock like sidtab_sid2str_put(). If a perf interrupt hits under
> a spin lock and if we end up in calling selinux hook functions in PMI
> handler, this could cause a dead lock.
>
> Since the purpose of this security hook is to control access to
> perf_event_open, it is not right to call this in interrupt context.
> But in case of powerpc PMU, we need the privilege checks for specific
> samples from branch history ring buffer and sampling register values.
> Reference commits:
> Commit cd1231d7035f ("powerpc/perf: Prevent kernel address leak via
> perf_get_data_addr()")
> Commit bb19af816025 ("powerpc/perf: Prevent kernel address leak to
> userspace via BHRB buffer")
>
> As a fix, patch caches 'perf_allow_kernel' value in event_init in
> 'pmu_private' field of perf_event. The cached value is used in the
> PMI code path.
>
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  arch/powerpc/perf/core-book3s.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index 4b4319d8..9e9f67f 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -189,6 +189,11 @@ static inline unsigned long perf_ip_adjust(struct pt_regs *regs)
>         return 0;
>  }
>
> +static bool event_allow_kernel(struct perf_event *event)
> +{
> +       return (bool)event->pmu_private;
> +}
> +
>  /*
>   * The user wants a data address recorded.
>   * If we're not doing instruction sampling, give them the SDAR
> @@ -222,7 +227,7 @@ static inline void perf_get_data_addr(struct perf_event *event, struct pt_regs *
>         if (!(mmcra & MMCRA_SAMPLE_ENABLE) || sdar_valid)
>                 *addrp = mfspr(SPRN_SDAR);
>
> -       if (is_kernel_addr(mfspr(SPRN_SDAR)) && perf_allow_kernel(&event->attr) != 0)
> +       if (is_kernel_addr(mfspr(SPRN_SDAR)) && !event_allow_kernel(event))
>                 *addrp = 0;
>  }
>
> @@ -507,7 +512,7 @@ static void power_pmu_bhrb_read(struct perf_event *event, struct cpu_hw_events *
>                          * addresses, hence include a check before filtering code
>                          */
>                         if (!(ppmu->flags & PPMU_ARCH_31) &&
> -                               is_kernel_addr(addr) && perf_allow_kernel(&event->attr) != 0)
> +                           is_kernel_addr(addr) && !event_allow_kernel(event))
>                                 continue;
>
>                         /* Branches are read most recent first (ie. mfbhrb 0 is
> @@ -2049,6 +2054,13 @@ static int power_pmu_event_init(struct perf_event *event)
>         if (err)
>                 return -EINVAL;
>
> +       /*
> +        * We (ab)use pmu_private to cache the result of perf_allow_kernel(). We
> +        * need access to that result at interrupt time, but can't call
> +        * perf_allow_kernel() directly from interrupt context.
> +        */
> +       event->pmu_private = (void *)(long)(perf_allow_kernel(&event->attr) == 0);

I don't think you need this. Unless I'm missing something, you can
simply use "event->attr.exclude_kernel" in place of
"!event_allow_kernel(event)". If it is set, then there must have been
a successful perf_allow_kernel() check in perf_event_open(2) before
the event was created. power_pmu_event_init() would be called shortly
after via perf_event_alloc() -> perf_init_event(), so I don't think
this additional check would add much value.

> +
>         event->hw.config = events[n];
>         event->hw.event_base = cflags[n];
>         event->hw.last_period = event->hw.sample_period;
> --
> 1.8.3.1
>

-- 
Ondrej Mosnacek
Software Engineer, Linux Security - SELinux kernel
Red Hat, Inc.

