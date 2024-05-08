Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C437E8BFD0D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 14:22:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Jpm56lzA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZDmB2fHRz3cWX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 22:22:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Jpm56lzA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZDlP2h2Lz2xQ7
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 22:21:20 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1edc696df2bso33281915ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 May 2024 05:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715170878; x=1715775678; darn=lists.ozlabs.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Wq2cbWqEeEEeVBqHczsjobIDxQ5lhzHyo4DV/Jjbdk=;
        b=Jpm56lzAMP590bt2VY845WfyvYAHLfWnpRWQCjUGgW6k2yqItw5lEwDsK3KNrW1rai
         nPrPdb6YYyNxI9RrjflKa12y5mSlU7MXxMUP605i1wlO2aVOh36HUgnXvdOq3EA9fcER
         1rkKccFuleAyWRGMQ/k1XzAA8ef4g754yQYKD6gE7FUSXgyybMMczYeoNelAeA9ST4qK
         nulybd23H2bxDHbwFStymaGIRH+Do153z17/bIze1a1x4zpT9TyB44n2UPCpBmq+m+Q+
         Fe8y79Ih/3cHpD1nIyr5xHjZgJmWCIur7ohf2Ss7ytkd7/Fk4bXK83LdKDwxiEuhj881
         fCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715170878; x=1715775678;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8Wq2cbWqEeEEeVBqHczsjobIDxQ5lhzHyo4DV/Jjbdk=;
        b=NyEHjNzFWG3meMXTsoK3pwU++gJvwhI5G+MQukXfWhWiA/MKqYOu3JjFEXWwB5mTVV
         WDQjpqGf8tua3/VJUpR3EfWQCWOoH59BrlnTkg1LSY7bBJW3ESZgNn53RkhE+maklLPU
         CSTlnXUO/7AdvyvN9f5IEFaMmXMYSuKhSSKj7gFeGE6jW5MQGpdCGabp4n+BKt5I5R/i
         AiQfC0txoqcvzCWZjtek8qElHzb5bG1m0JR5l47OJ0N66puifzdwdNG1zyyrKTesj645
         QftDLZzVQD4kmmxyEhTWhZAq9QaPhssiG1ZwD8vA43IFliS7Ss3OBJAQTixNzmVI1m9H
         rgkQ==
X-Gm-Message-State: AOJu0YzAnozDr/UdqJrjDCNQUApFOCcTNKft9nONWLA+9moA8eSbCsBR
	8Kn4H8scUT8zZ131s6EsRL/iNXemWwgK00qwgSJ+dXux9lJt7kQqWHXKuQ==
X-Google-Smtp-Source: AGHT+IGeTD7aFAYoEaI35ZIuWXFJrDZoSQ6AWKyZfB4Eviw4O375tGDyvXRsVtARY4tpMm2+BXL1cg==
X-Received: by 2002:a17:902:d588:b0:1e4:24cc:e020 with SMTP id d9443c01a7336-1eeb089c231mr34982305ad.67.1715170878308;
        Wed, 08 May 2024 05:21:18 -0700 (PDT)
Received: from localhost ([1.146.8.34])
        by smtp.gmail.com with ESMTPSA id n2-20020a170902d2c200b001eb2e6b14e0sm11694253plc.126.2024.05.08.05.21.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 05:21:17 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 May 2024 22:21:10 +1000
Message-Id: <D149BWFCJHTP.J7WBZZZHJEGT@gmail.com>
Subject: Re: [PATCH v6] arch/powerpc/kvm: Add support for reading VPA
 counters for pseries guests
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Gautam Menghani" <gautam@linux.ibm.com>, <mpe@ellerman.id.au>,
 <christophe.leroy@csgroup.eu>, <naveen.n.rao@linux.ibm.com>
X-Mailer: aerc 0.17.0
References: <20240506145605.73794-1-gautam@linux.ibm.com>
In-Reply-To: <20240506145605.73794-1-gautam@linux.ibm.com>
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue May 7, 2024 at 12:56 AM AEST, Gautam Menghani wrote:
> PAPR hypervisor has introduced three new counters in the VPA area of
> LPAR CPUs for KVM L2 guest (see [1] for terminology) observability - 2
> for context switches from host to guest and vice versa, and 1 counter
> for getting the total time spent inside the KVM guest. Add a tracepoint
> that enables reading the counters for use by ftrace/perf. Note that this
> tracepoint is only available for nestedv2 API (i.e, KVM on PowerVM).
>
> [1] Terminology:
> a. L1 refers to the VM (LPAR) booted on top of PAPR hypervisor
> b. L2 refers to the KVM guest booted on top of L1.
>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
> ---
> v5 -> v6:
> 1. Use TRACE_EVENT_FN to enable/disable counters only once.
> 2. Remove the agg. counters from vcpu->arch.
> 3. Use PACA to maintain old counter values instead of zeroing on every
> entry.
> 4. Simplify variable names
>
> v4 -> v5:
> 1. Define helper functions for getting/setting the accumulation counter
> in L2's VPA
>
> v3 -> v4:
> 1. After vcpu_run, check the VPA flag instead of checking for tracepoint
> being enabled for disabling the cs time accumulation.
>
> v2 -> v3:
> 1. Move the counter disabling and zeroing code to a different function.
> 2. Move the get_lppaca() inside the tracepoint_enabled() branch.
> 3. Add the aggregation logic to maintain total context switch time.
>
> v1 -> v2:
> 1. Fix the build error due to invalid struct member reference.
>
>  arch/powerpc/include/asm/lppaca.h | 11 +++++--
>  arch/powerpc/include/asm/paca.h   |  5 +++
>  arch/powerpc/kvm/book3s_hv.c      | 52 +++++++++++++++++++++++++++++++
>  arch/powerpc/kvm/trace_hv.h       | 27 ++++++++++++++++
>  4 files changed, 92 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/lppaca.h b/arch/powerpc/include/asm=
/lppaca.h
> index 61ec2447dabf..f40a646bee3c 100644
> --- a/arch/powerpc/include/asm/lppaca.h
> +++ b/arch/powerpc/include/asm/lppaca.h
> @@ -62,7 +62,8 @@ struct lppaca {
>  	u8	donate_dedicated_cpu;	/* Donate dedicated CPU cycles */
>  	u8	fpregs_in_use;
>  	u8	pmcregs_in_use;
> -	u8	reserved8[28];
> +	u8	l2_counters_enable;  /* Enable usage of counters for KVM guest */
> +	u8	reserved8[27];
>  	__be64	wait_state_cycles;	/* Wait cycles for this proc */
>  	u8	reserved9[28];
>  	__be16	slb_count;		/* # of SLBs to maintain */
> @@ -92,9 +93,13 @@ struct lppaca {
>  	/* cacheline 4-5 */
> =20
>  	__be32	page_ins;		/* CMO Hint - # page ins by OS */
> -	u8	reserved12[148];
> +	u8	reserved12[28];
> +	volatile __be64 l1_to_l2_cs_tb;
> +	volatile __be64 l2_to_l1_cs_tb;
> +	volatile __be64 l2_runtime_tb;

I wonder if we shouldn't be moving over to use READ_ONCE for these
instead of volatile.

Probably doesn't really matter here. Maybe general audit of volatiles
in arch/powerpc could be something to put in linuxppc issues.

> +	u8 reserved13[96];
>  	volatile __be64 dtl_idx;	/* Dispatch Trace Log head index */
> -	u8	reserved13[96];
> +	u8	reserved14[96];
>  } ____cacheline_aligned;
> =20
>  #define lppaca_of(cpu)	(*paca_ptrs[cpu]->lppaca_ptr)
> diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/p=
aca.h
> index 1d58da946739..f20ac7a6efa4 100644
> --- a/arch/powerpc/include/asm/paca.h
> +++ b/arch/powerpc/include/asm/paca.h
> @@ -278,6 +278,11 @@ struct paca_struct {
>  	struct mce_info *mce_info;
>  	u8 mce_pending_irq_work;
>  #endif /* CONFIG_PPC_BOOK3S_64 */
> +#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
> +	u64 l1_to_l2_cs;
> +	u64 l2_to_l1_cs;
> +	u64 l2_runtime_agg;
> +#endif
>  } ____cacheline_aligned;

I don't think these really need to be in the paca.

paca is for per-cpu stuff that is accessed in real mode, early interrupt
entry, etc.

> =20
>  extern void copy_mm_to_paca(struct mm_struct *mm);
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 8e86eb577eb8..ed69ad58bd02 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -4108,6 +4108,54 @@ static void vcpu_vpa_increment_dispatch(struct kvm=
_vcpu *vcpu)
>  	}
>  }
> =20
> +static inline int kvmhv_get_l2_counters_status(void)
> +{
> +	return get_lppaca()->l2_counters_enable;
> +}
> +
> +static inline void kvmhv_set_l2_counters_status(int cpu, bool status)
> +{
> +	if (status)
> +		lppaca_of(cpu).l2_counters_enable =3D 1;
> +	else
> +		lppaca_of(cpu).l2_counters_enable =3D 0;
> +}
> +
> +int kmvhv_counters_tracepoint_regfunc(void)
> +{
> +	int cpu;
> +
> +	for_each_possible_cpu(cpu) {
> +		kvmhv_set_l2_counters_status(cpu, true);
> +	}
> +	return 0;
> +}
> +
> +void kmvhv_counters_tracepoint_unregfunc(void)
> +{
> +	int cpu;
> +
> +	for_each_possible_cpu(cpu) {
> +		kvmhv_set_l2_counters_status(cpu, false);
> +	}
> +}
> +
> +static void do_trace_nested_cs_time(struct kvm_vcpu *vcpu)
> +{
> +	struct lppaca *lp =3D get_lppaca();
> +	u64 l1_to_l2_ns, l2_to_l1_ns, l2_runtime_ns;
> +
> +	l1_to_l2_ns =3D tb_to_ns(be64_to_cpu(lp->l1_to_l2_cs_tb));
> +	l2_to_l1_ns =3D tb_to_ns(be64_to_cpu(lp->l2_to_l1_cs_tb));
> +	l2_runtime_ns =3D tb_to_ns(be64_to_cpu(lp->l2_runtime_tb));
> +	trace_kvmppc_vcpu_stats(vcpu, l1_to_l2_ns - local_paca->l1_to_l2_cs,
> +					l2_to_l1_ns - local_paca->l2_to_l1_cs,
> +					l2_runtime_ns - local_paca->l2_runtime_agg);
> +	local_paca->l1_to_l2_cs =3D l1_to_l2_ns;
> +	local_paca->l2_to_l1_cs =3D l2_to_l1_ns;
> +	local_paca->l2_runtime_agg =3D l2_runtime_ns;
> +}

So you're just using the per-cpu values to cache the last value
read so next time you can take a delta.

Could you zero the counters before entry? Or just use local
variables to read the before values.

If you want to keep the same scheme, I think per-cpu variables
should work.

Otherwise,

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> +
>  static int kvmhv_vcpu_entry_nestedv2(struct kvm_vcpu *vcpu, u64 time_lim=
it,
>  				     unsigned long lpcr, u64 *tb)
>  {
> @@ -4156,6 +4204,10 @@ static int kvmhv_vcpu_entry_nestedv2(struct kvm_vc=
pu *vcpu, u64 time_limit,
> =20
>  	timer_rearm_host_dec(*tb);
> =20
> +	/* Record context switch and guest_run_time data */
> +	if (kvmhv_get_l2_counters_status())
> +		do_trace_nested_cs_time(vcpu);
> +
>  	return trap;
>  }
> =20
> diff --git a/arch/powerpc/kvm/trace_hv.h b/arch/powerpc/kvm/trace_hv.h
> index 8d57c8428531..dc118ab88f23 100644
> --- a/arch/powerpc/kvm/trace_hv.h
> +++ b/arch/powerpc/kvm/trace_hv.h
> @@ -238,6 +238,9 @@
>  	{H_MULTI_THREADS_ACTIVE,	"H_MULTI_THREADS_ACTIVE"}, \
>  	{H_OUTSTANDING_COP_OPS,		"H_OUTSTANDING_COP_OPS"}
> =20
> +int kmvhv_counters_tracepoint_regfunc(void);
> +void kmvhv_counters_tracepoint_unregfunc(void);
> +
>  TRACE_EVENT(kvm_guest_enter,
>  	TP_PROTO(struct kvm_vcpu *vcpu),
>  	TP_ARGS(vcpu),
> @@ -512,6 +515,30 @@ TRACE_EVENT(kvmppc_run_vcpu_exit,
>  			__entry->vcpu_id, __entry->exit, __entry->ret)
>  );
> =20
> +TRACE_EVENT_FN(kvmppc_vcpu_stats,
> +	TP_PROTO(struct kvm_vcpu *vcpu, u64 l1_to_l2_cs, u64 l2_to_l1_cs, u64 l=
2_runtime),
> +
> +	TP_ARGS(vcpu, l1_to_l2_cs, l2_to_l1_cs, l2_runtime),
> +
> +	TP_STRUCT__entry(
> +		__field(int,		vcpu_id)
> +		__field(u64,		l1_to_l2_cs)
> +		__field(u64,		l2_to_l1_cs)
> +		__field(u64,		l2_runtime)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->vcpu_id  =3D vcpu->vcpu_id;
> +		__entry->l1_to_l2_cs =3D l1_to_l2_cs;
> +		__entry->l2_to_l1_cs =3D l2_to_l1_cs;
> +		__entry->l2_runtime =3D l2_runtime;
> +	),
> +
> +	TP_printk("VCPU %d: l1_to_l2_cs_time=3D%llu ns l2_to_l1_cs_time=3D%llu =
ns l2_runtime=3D%llu ns",
> +		__entry->vcpu_id,  __entry->l1_to_l2_cs,
> +		__entry->l2_to_l1_cs, __entry->l2_runtime),
> +	kmvhv_counters_tracepoint_regfunc, kmvhv_counters_tracepoint_unregfunc
> +);
>  #endif /* _TRACE_KVM_HV_H */
> =20
>  /* This part must be outside protection */

