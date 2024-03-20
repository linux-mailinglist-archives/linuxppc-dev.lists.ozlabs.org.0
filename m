Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E2E881326
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Mar 2024 15:15:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FQykwYmb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V09c81ZzXz3dlY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 01:15:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FQykwYmb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V09bM4Tx2z3brm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 01:15:10 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6e703e0e5deso3542125b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Mar 2024 07:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710944107; x=1711548907; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyMQ+8dkMkvcjrYhj/YbvYKdLMOP0zpLYG0B4M+Jlis=;
        b=FQykwYmb0/6mS2A6uNIu00d5JMFMuiXOU7BAx5SvmzB9AmJE6HOw5eFWA1B1wyYlcL
         Hw1YdQ4F0s7aZdDD2DIs3xrBXRGFR8PaOGQGpHq5TLANVL0qqHp0GAb9zeqj7t4hiRtv
         Q913C9GJqCiEOZCVSjh4tDqg78OxZ0OdmkAlFb9R8leB7aLYTKU7pCNcuWosEZ9V246H
         F03G8U5B1HuWAuX5ViC+IIxTb4PjafkedIeTQb7e/3hz1TzLYk6CKPIWjAmY7PXWLtYu
         fRZgx8u0MVh1nsEi172MBJfmwylrYC4Vti5aFboI08fwBOKXxaZC3sWClfcXFnwnhPpC
         ddAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710944107; x=1711548907;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cyMQ+8dkMkvcjrYhj/YbvYKdLMOP0zpLYG0B4M+Jlis=;
        b=uvnNP86gcAKiucTDHWyK9eREEzU01FYuUWuFJMhKycQ70W+AgxvTXmbGzoeNBS1Tqg
         YX0QubCoiqiiZZDwszTSFi3indB8BSTIRgSRTaOIqio7txaBitmWDn2/FpRYBu3n/UHC
         e0ZLX73JhUhgbumxmRANAImsyrys8/7p4lYA3IvaJk80h3O9gltiYvTMvcJSjmo+SkYL
         B6w0jlorIC1kufo+SFOPqtdk8bFt3OVgYsJIeqdfG9oyFTE5RR1JmP7xyMKxE66diHFY
         90qaLU0TBmngW+hwmVqRYJdr6eoxctbDCN0/vvrGQgl6IrQb75SLALPNS7iTC5mKztAJ
         ZXhQ==
X-Gm-Message-State: AOJu0YzZzG3aRvB1AFOx4g5jt8Jhx2Yks5dvQzTV1wtwguDDXCQsKp4u
	pdO3UcC5eFSDbi2Ya5NxWN20EMIFcjCvCms6XbexyP173oawjkQ+
X-Google-Smtp-Source: AGHT+IEBoSbM9cPtFd7ZC+s4hE1kj4RJvDY5Pf8+BlYELGhMMMflFhnxv7spDETq1/cWJeznnbL6PQ==
X-Received: by 2002:a05:6a00:2d8f:b0:6e7:8218:e75 with SMTP id fb15-20020a056a002d8f00b006e782180e75mr2504299pfb.7.1710944107582;
        Wed, 20 Mar 2024 07:15:07 -0700 (PDT)
Received: from localhost (193-116-208-39.tpgi.com.au. [193.116.208.39])
        by smtp.gmail.com with ESMTPSA id gu25-20020a056a004e5900b006e7040519a1sm8260357pfb.216.2024.03.20.07.15.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 07:15:07 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 21 Mar 2024 00:15:01 +1000
Message-Id: <CZYN2DBLH8Q2.U5H1A6VDAUY7@wheely>
Subject: Re: [PATCH] arch/powerpc/kvm: Add support for reading VPA counters
 for pseries guests
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Gautam Menghani" <gautam@linux.ibm.com>, <mpe@ellerman.id.au>,
 <christophe.leroy@csgroup.eu>, <aneesh.kumar@kernel.org>,
 <naveen.n.rao@linux.ibm.com>
X-Mailer: aerc 0.15.2
References: <20240319142807.95547-1-gautam@linux.ibm.com>
In-Reply-To: <20240319142807.95547-1-gautam@linux.ibm.com>
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

On Wed Mar 20, 2024 at 12:28 AM AEST, Gautam Menghani wrote:
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
>  arch/powerpc/include/asm/kvm_host.h |  5 +++++
>  arch/powerpc/include/asm/lppaca.h   | 11 ++++++++---
>  arch/powerpc/kvm/book3s_hv.c        | 20 ++++++++++++++++++++
>  arch/powerpc/kvm/trace_hv.h         | 24 ++++++++++++++++++++++++
>  4 files changed, 57 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/a=
sm/kvm_host.h
> index 8abac5321..26d7bb4b9 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -847,6 +847,11 @@ struct kvm_vcpu_arch {
>  	gpa_t nested_io_gpr;
>  	/* For nested APIv2 guests*/
>  	struct kvmhv_nestedv2_io nestedv2_io;
> +
> +	/* For VPA counters having context switch and guest run time info (in n=
s) */
> +	u64 l1_to_l2_cs;
> +	u64 l2_to_l1_cs;
> +	u64 l2_runtime;
>  #endif
> =20
>  #ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING

These aren't required here if it's just used for tracing over
a single run vcpu call are they?

> diff --git a/arch/powerpc/include/asm/lppaca.h b/arch/powerpc/include/asm=
/lppaca.h
> index 61ec2447d..bda6b86b9 100644
> --- a/arch/powerpc/include/asm/lppaca.h
> +++ b/arch/powerpc/include/asm/lppaca.h
> @@ -62,7 +62,8 @@ struct lppaca {
>  	u8	donate_dedicated_cpu;	/* Donate dedicated CPU cycles */
>  	u8	fpregs_in_use;
>  	u8	pmcregs_in_use;
> -	u8	reserved8[28];
> +	u8	l2_accumul_cntrs_enable;  /* Enable usage of counters for KVM guest =
*/
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
> +	u8 reserved13[96];
>  	volatile __be64 dtl_idx;	/* Dispatch Trace Log head index */
> -	u8	reserved13[96];
> +	u8	reserved14[96];
>  } ____cacheline_aligned;
> =20
>  #define lppaca_of(cpu)	(*paca_ptrs[cpu]->lppaca_ptr)
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 2b04eba90..b94461b5f 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -4092,6 +4092,7 @@ static int kvmhv_vcpu_entry_nestedv2(struct kvm_vcp=
u *vcpu, u64 time_limit,
>  	unsigned long msr, i;
>  	int trap;
>  	long rc;
> +	struct lppaca *lp =3D get_lppaca();

Does get_lppaca() emit some inline asm that can't be optimised?
Could move it under the unlikely branches if so.

> =20
>  	io =3D &vcpu->arch.nestedv2_io;
> =20

KVM L0 could in theory provide this for v1 L1s too, so could this
be done at a higher level to cover both?

> @@ -4107,6 +4108,17 @@ static int kvmhv_vcpu_entry_nestedv2(struct kvm_vc=
pu *vcpu, u64 time_limit,
>  	kvmppc_gse_put_u64(io->vcpu_run_input, KVMPPC_GSID_LPCR, lpcr);
> =20
>  	accumulate_time(vcpu, &vcpu->arch.in_guest);
> +
> +	/* Reset the guest host context switch timing */
> +	if (unlikely(trace_kvmppc_vcpu_exit_cs_time_enabled())) {
> +		lp->l2_accumul_cntrs_enable =3D 1;
> +		lp->l1_to_l2_cs_tb =3D 0;
> +		lp->l2_to_l1_cs_tb =3D 0;
> +		lp->l2_runtime_tb =3D 0;
> +	} else {
> +		lp->l2_accumul_cntrs_enable =3D 0;
> +	}

Instead of zeroing here zero after the exit, which avoids the
else branch and possibly avoids an obscure race with the counters.
What if trace_kvmppc_vcpu_exit_cs_time_enabled() is false here...

> +
>  	rc =3D plpar_guest_run_vcpu(0, vcpu->kvm->arch.lpid, vcpu->vcpu_id,
>  				  &trap, &i);
> =20
> @@ -4133,6 +4145,14 @@ static int kvmhv_vcpu_entry_nestedv2(struct kvm_vc=
pu *vcpu, u64 time_limit,
> =20
>  	timer_rearm_host_dec(*tb);
> =20
> +	/* Record context switch and guest_run_time data */
> +	if (unlikely(trace_kvmppc_vcpu_exit_cs_time_enabled())) {
> +		vcpu->arch.l1_to_l2_cs =3D tb_to_ns(be64_to_cpu(lp->l1_to_l2_cs_tb));
> +		vcpu->arch.l2_to_l1_cs =3D tb_to_ns(be64_to_cpu(lp->l2_to_l1_cs_tb));
> +		vcpu->arch.l2_runtime =3D tb_to_ns(be64_to_cpu(lp->l2_runtime_tb));
> +		trace_kvmppc_vcpu_exit_cs_time(vcpu);
> +	}

... and true here. If it had been previously true then it would trace
stale values I think?

Would something like this work?

  if (unlikely(trace_kvmppc_vcpu_exit_cs_time_enabled()))
    get_lppaca()->l2_accumul_cntrs_enable =3D 1;

  [run vcpu ; ...]

  if (unlikely(trace_kvmppc_vcpu_exit_cs_time_enabled()))
    do_trace_nested_cs_time(vcpu);=20

 ...

static void do_trace_nested_cs_time(struct vcpu *vcpu)
{
    struct lppaca *lp =3D get_lppaca();
    u64 l1_to_l2, l2_to_l1, l2_runtime;

    if (!lp->l2_accumul_cntrs_enable)
      return;

    l1_to_l2 =3D tb_to_ns(be64_to_cpu(lp->l1_to_l2_cs_tb));
    l2_to_l1 =3D tb_to_ns(be64_to_cpu(lp->l2_to_l1_cs_tb));
    l2_runtime =3D tb_to_ns(be64_to_cpu(lp->l2_runtime_tb));
    trace_kvmppc_vcpu_exit_cs_time(vcpu->cpu_id, l1_to_l2,
                                   l2_to_l1, l2_runtime);
    lp->l1_to_l2_cs_tb =3D 0;
    lp->l2_to_l1_cs_tb =3D 0;
    lp->l2_runtime_tb =3D 0;
    lp->l2_accumul_cntrs_enable =3D 0;
}

