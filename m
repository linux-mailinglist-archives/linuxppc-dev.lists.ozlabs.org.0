Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F8643E140
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 14:49:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg53k5bthz3c4c
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 23:49:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EP5WEdOq;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EP5WEdOq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=lvivier@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=EP5WEdOq; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=EP5WEdOq; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg53133Hbz2xDf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 23:48:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635425320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c6G/II7fL4gELJ4h9W5hS038cvePCeWjBA3QvVbg4gs=;
 b=EP5WEdOqMzdD/IC7MJCdHtDGS2+7ZuQtE8o+3NYYsPfvYIYI+FV9GBH4muxkm1v1HE7qJV
 tq34T4mK6Iww/XclmaERkUjBSfxjo922JputyFEe42xxoFc9GlImSyG9HtCLOByD2Xexw/
 Vwo/YbiD7V43xqvros1h5pEZ5fXGm8g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635425320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c6G/II7fL4gELJ4h9W5hS038cvePCeWjBA3QvVbg4gs=;
 b=EP5WEdOqMzdD/IC7MJCdHtDGS2+7ZuQtE8o+3NYYsPfvYIYI+FV9GBH4muxkm1v1HE7qJV
 tq34T4mK6Iww/XclmaERkUjBSfxjo922JputyFEe42xxoFc9GlImSyG9HtCLOByD2Xexw/
 Vwo/YbiD7V43xqvros1h5pEZ5fXGm8g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-QiZ3Mr6BPZiEyRhY5Ru2TQ-1; Thu, 28 Oct 2021 08:48:38 -0400
X-MC-Unique: QiZ3Mr6BPZiEyRhY5Ru2TQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 c6-20020adfe706000000b00168acf1bcd5so2099161wrm.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 05:48:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=c6G/II7fL4gELJ4h9W5hS038cvePCeWjBA3QvVbg4gs=;
 b=5eo8+dTV++SyAuNbA3VSiRkaRwt+Fdqd+Oms9yd+fk4IKzvqYs36mnuwYsitieiYF4
 38SE9t2hagBu77FiuAT2K7eEcZUr55uQaWHNgxB2MEz5dZwnID5zMXBJNszAMumBMIZX
 y0piGbE4GysYsFWBxnPPzCvoJ0FXOGQeSGlHi/U0skVqIzUYyoAEcj4wfq106ihupr3b
 MwtbOEkkIJLtF0B6G66C3/s6/XCAopQjCkG9gis7kev8zLRKFwNwHyIkpacx+htVKOYm
 UK6v6sxp8uv54aHgQxqmRL7jBE5LSrJsu/umXw3lEmZD0nZIBAP4olx3LKCLCVoLj4Ds
 5W6A==
X-Gm-Message-State: AOAM533wkQwirU3qKZOI5aZ8yYT+6O+su1or+X6FCeb5FJqlD7R0j8Lo
 O7jUrqAebVSuTkd8r4/ZTIXntBuh05gELD2n6Kb8oVmnflOx1flzOe/O+2hRwq0r/eFT/wM8fcG
 siduNqKRJesfzEpn4fxlQfsLeHA==
X-Received: by 2002:a5d:494d:: with SMTP id r13mr5398474wrs.222.1635425316779; 
 Thu, 28 Oct 2021 05:48:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyphiwbppA55lbN7UG/B24xFETMuoF0a3jMrnz/JMYxTCVZ3HDSz8H33Rx9vifqKN9gv1eqlg==
X-Received: by 2002:a5d:494d:: with SMTP id r13mr5398447wrs.222.1635425316564; 
 Thu, 28 Oct 2021 05:48:36 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.14.190])
 by smtp.gmail.com with ESMTPSA id p188sm2565459wmp.30.2021.10.28.05.48.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 05:48:36 -0700 (PDT)
Message-ID: <3d621619-e6b2-9388-06dd-0ea4cc805ed7@redhat.com>
Date: Thu, 28 Oct 2021 14:48:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3] KVM: PPC: Tick accounting should defer vtime
 accounting 'til after IRQ handling
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20211027142150.3711582-1-npiggin@gmail.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20211027142150.3711582-1-npiggin@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 27/10/2021 16:21, Nicholas Piggin wrote:
> From: Laurent Vivier <lvivier@redhat.com>
> 
> Commit 112665286d08 ("KVM: PPC: Book3S HV: Context tracking exit guest
> context before enabling irqs") moved guest_exit() into the interrupt
> protected area to avoid wrong context warning (or worse). The problem is
> that tick-based time accounting has not yet been updated at this point
> (because it depends on the timer interrupt firing), so the guest time
> gets incorrectly accounted to system time.
> 
> To fix the problem, follow the x86 fix in commit 160457140187 ("Defer
> vtime accounting 'til after IRQ handling"), and allow host IRQs to run
> before accounting the guest exit time.
> 
> In the case vtime accounting is enabled, this is not required because TB
> is used directly for accounting.
> 
> Before this patch, with CONFIG_TICK_CPU_ACCOUNTING=y in the host and a
> guest running a kernel compile, the 'guest' fields of /proc/stat are
> stuck at zero. With the patch they can be observed increasing roughly as
> expected.
> 
> Fixes: e233d54d4d97 ("KVM: booke: use __kvm_guest_exit")
> Fixes: 112665286d08 ("KVM: PPC: Book3S HV: Context tracking exit guest context before enabling irqs")
> Cc: <stable@vger.kernel.org> # 5.12
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> [np: only required for tick accounting, add Book3E fix, tweak changelog]
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> Since v2:
> - I took over the patch with Laurent's blessing.
> - Changed to avoid processing IRQs if we do have vtime accounting
>    enabled.
> - Changed so in either case the accounting is called with irqs disabled.
> - Added similar Book3E fix.
> - Rebased on upstream, tested, observed bug and confirmed fix.
> 
>   arch/powerpc/kvm/book3s_hv.c | 30 ++++++++++++++++++++++++++++--
>   arch/powerpc/kvm/booke.c     | 16 +++++++++++++++-
>   2 files changed, 43 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 2acb1c96cfaf..7b74fc0a986b 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -3726,7 +3726,20 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
>   
>   	kvmppc_set_host_core(pcpu);
>   
> -	guest_exit_irqoff();
> +	context_tracking_guest_exit();
> +	if (!vtime_accounting_enabled_this_cpu()) {
> +		local_irq_enable();
> +		/*
> +		 * Service IRQs here before vtime_account_guest_exit() so any
> +		 * ticks that occurred while running the guest are accounted to
> +		 * the guest. If vtime accounting is enabled, accounting uses
> +		 * TB rather than ticks, so it can be done without enabling
> +		 * interrupts here, which has the problem that it accounts
> +		 * interrupt processing overhead to the host.
> +		 */
> +		local_irq_disable();
> +	}
> +	vtime_account_guest_exit();
>   
>   	local_irq_enable();
>   
> @@ -4510,7 +4523,20 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
>   
>   	kvmppc_set_host_core(pcpu);
>   
> -	guest_exit_irqoff();
> +	context_tracking_guest_exit();
> +	if (!vtime_accounting_enabled_this_cpu()) {
> +		local_irq_enable();
> +		/*
> +		 * Service IRQs here before vtime_account_guest_exit() so any
> +		 * ticks that occurred while running the guest are accounted to
> +		 * the guest. If vtime accounting is enabled, accounting uses
> +		 * TB rather than ticks, so it can be done without enabling
> +		 * interrupts here, which has the problem that it accounts
> +		 * interrupt processing overhead to the host.
> +		 */
> +		local_irq_disable();
> +	}
> +	vtime_account_guest_exit();
>   
>   	local_irq_enable();
>   
> diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
> index 977801c83aff..8c15c90dd3a9 100644
> --- a/arch/powerpc/kvm/booke.c
> +++ b/arch/powerpc/kvm/booke.c
> @@ -1042,7 +1042,21 @@ int kvmppc_handle_exit(struct kvm_vcpu *vcpu, unsigned int exit_nr)
>   	}
>   
>   	trace_kvm_exit(exit_nr, vcpu);
> -	guest_exit_irqoff();
> +
> +	context_tracking_guest_exit();
> +	if (!vtime_accounting_enabled_this_cpu()) {
> +		local_irq_enable();
> +		/*
> +		 * Service IRQs here before vtime_account_guest_exit() so any
> +		 * ticks that occurred while running the guest are accounted to
> +		 * the guest. If vtime accounting is enabled, accounting uses
> +		 * TB rather than ticks, so it can be done without enabling
> +		 * interrupts here, which has the problem that it accounts
> +		 * interrupt processing overhead to the host.
> +		 */
> +		local_irq_disable();
> +	}
> +	vtime_account_guest_exit();
>   
>   	local_irq_enable();
>   
> 

I'm wondering if we should put the context_tracking_guest_exit() just after the 
"srcu_read_unlock(&vc->kvm->srcu, srcu_idx);" as it was before 61bd0f66ff92 ("KVM: PPC: 
Book3S HV: Fix guest time accounting with VIRT_CPU_ACCOUNTING_GEN")?

Thanks,
Laurent

