Return-Path: <linuxppc-dev+bounces-2573-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0179AFA35
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2024 08:43:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZYBp1CPHz2xk1;
	Fri, 25 Oct 2024 17:43:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729838594;
	cv=none; b=CKt807X8jqc0uPMsldhR1cUUguZBL2Heh1Z8t6RDGfpLAb0jrwMfHNePjVnntjSgAoGiBtaRpZwZ1WVg32W00pJpeztdiuBcAKilhOZhqhy8FxrCpumXPjrlZ6OFNJpIg7B5k1CZ4hSPqqaTfkIlO6w2icGgQKcagriAgaERwHlD8j1CGFzpuiX4TmDWax/cvRaAhyVtDIo8Dpf/gdVkknY3tTpY/XW2EecogJ64yEwe6iURyuNsvKAcl0DL0We7gJIqzlSUMyyzOhKDzBKVh7l+oV8w+lBWjlkWgtxW6Om3hImBys15Ek0bAnyKgs2XEX9o2CLOk5sZH0ZqUVbIrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729838594; c=relaxed/relaxed;
	bh=P47I0gdiUlkn3LmA4ci0Px6PUVaCXe2wtW4m1OPAR8s=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=oh0dyrrt5ZLZ+2a9DrT9jsoBe95OGeIZ28UBkWqJrlUbUwi47CWaMLI82ACLGCXMThI3QwSKRj3hsTz7zTncEPbr0caRfJgNVHtRmVEHv85/lg3mJdrLCKzvSpFMiCuezJGek6mFNT7P8uE9/bILBN41vXYh99K9qgXkUCsNNueLTLNTdgU4EHbid2qk4Gftb37oIEMZSP3yKdqlwhJizDjdBS41LsZweX0NalbmO9atVMrliUZKFjvWZtGxk7Q891Sio+trBiyb3RV8eWk/PbAANHq7MwkO3Igvt4Tq9Lshjco60tWwvme1ONHTIUamx3o1+LJmUm0DZU4Cnj6dPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FicK357n; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FicK357n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZYBm5CQMz2xWS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 17:43:11 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-7eab7622b61so1075799a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 23:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729838589; x=1730443389; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P47I0gdiUlkn3LmA4ci0Px6PUVaCXe2wtW4m1OPAR8s=;
        b=FicK357nW9fcLF/EQ+3/L5p9vDOx0MSRPQ3LUFLNTMS0Q9ARFUX3EPh+ZF8gUd+BTr
         6jHOxZOlB/bv6yli8sNT/lzkxh5MFEk8gYu5EfZWDB20F31dFtpPtoQwpT1BmNX4++r5
         1O1pmlt2zL4CxvX/4V09VD1MODRhLVtOl+pPF3JHwEMCG1XRHfuMGjfwGQ/VHA+urRWw
         xOqF/7z1F6H3BwlxpcAzOWSr6dKgSvPvrCiNCzZ3XIlagAx67xF0LxaFi7HZpJaZ/WoC
         b6m+bsJOZL1fWklsW6roIE76dXch0uRYca0LWlTVvfA1Gb68i9qzrhAMqaHh0sREsSo4
         FZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729838589; x=1730443389;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P47I0gdiUlkn3LmA4ci0Px6PUVaCXe2wtW4m1OPAR8s=;
        b=PHRhlnmscaXjTEHZ95Be0coFjQZrwvsqQC9tUmJvIwVjTAFqiietfHjeEM1E4ATxQn
         CAeK+dLsV1QTedGppVe5Jl4V7vHqG6CWeP31FCNUTn3QQusHqrhuQ8RwOceN8XuVqsV0
         1u1IjMeHA+zvcRNApKCJfjvzfqr0xckbHAvHOe0mEPHFIw1yJ43CUsGIB5tAgGvzYkHj
         vQjMJiQps74I5YjeV1H/jLPBmWDINAFrWU/3eAIRS63tXnw9JRAFJYZDrxPiALL5AyJ7
         37uAnyohG4rVc8qF/vmaXA75qX8n4cKMxdkhnAb37odhfN5sP1vQsCKNs3Kxyx0gq1mq
         BXxA==
X-Forwarded-Encrypted: i=1; AJvYcCVaOQViB6/AkmOUDnbWyXhWDPIvZ25geRdEpzM2Wn702PkvIddMikU/TGoJxHgQ19j056NjQnk0uEtDuxg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwT6w40x+3OF8GnTymmEYBlE9sA4GKeMYy4m4xsDcYLVx6IN2pX
	PBvzt/TYc21FNvQqInkGpNh8XeGsbYRRngKrzEAGPVsqNEsM7MDhgM6fCw==
X-Google-Smtp-Source: AGHT+IFxdZwIFKOQNiOIOKlXyUTiHQUYTmMXDxrzgTed1lrPb/WrWs4hS/ZL7SNSfx+CwmEz3d4d5g==
X-Received: by 2002:a05:6a21:3a82:b0:1d6:5f3d:4ab7 with SMTP id adf61e73a8af0-1d989b3c990mr5577835637.22.1729838588742;
        Thu, 24 Oct 2024 23:43:08 -0700 (PDT)
Received: from dw-tp ([171.76.85.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a1f18esm446345b3a.146.2024.10.24.23.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 23:43:07 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: Gautam Menghani <gautam@linux.ibm.com>, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org
Cc: Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] KVM: PPC: Book3S HV: Mask off LPCR_MER for a vCPU before running it to avoid spurious interrupts
In-Reply-To: <20241024173417.95395-1-gautam@linux.ibm.com>
Date: Fri, 25 Oct 2024 11:37:52 +0530
Message-ID: <871q04oguf.fsf@gmail.com>
References: <20241024173417.95395-1-gautam@linux.ibm.com>
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

Gautam Menghani <gautam@linux.ibm.com> writes:

> Mask off the LPCR_MER bit before running a vCPU to ensure that it is not
> set if there are no pending interrupts. Running a vCPU with LPCR_MER bit
> set and no pending interrupts results in L2 vCPU getting an infinite flood
> of spurious interrupts. The 'if check' in kvmhv_run_single_vcpu() sets
> the LPCR_MER bit if there are pending interrupts.
>
> The spurious flood problem can be observed in 2 cases:
> 1. Crashing the guest while interrupt heavy workload is running
>   a. Start a L2 guest and run an interrupt heavy workload (eg: ipistorm)
>   b. While the workload is running, crash the guest (make sure kdump
>      is configured)
>   c. Any one of the vCPUs of the guest will start getting an infinite
>      flood of spurious interrupts.
>
> 2. Running LTP stress tests in multiple guests at the same time
>    a. Start 4 L2 guests.
>    b. Start running LTP stress tests on all 4 guests at same time.
>    c. In some time, any one/more of the vCPUs of any of the guests will
>       start getting an infinite flood of spurious interrupts.
>
> The root cause of both the above issues is the same:
> 1. A NMI is sent to a running vCPU that has LPCR_MER bit set.
> 2. In the NMI path, all registers are refreshed, i.e, H_GUEST_GET_STATE
>    is called for all the registers.
> 3. When H_GUEST_GET_STATE is called for lpcr, the vcpu->arch.vcore->lpcr
>    of that vCPU at L1 level gets updated with LPCR_MER set to 1, and this
>    new value is always used whenever that vCPU runs, regardless of whether
>    there was a pending interrupt.
> 4. Since LPCR_MER is set, the vCPU in L2 always jumps to the external
>    interrupt handler, and this cycle never ends.
>
> Fix the spurious flood by making sure a vCPU's LPCR_MER is always masked
> before running a vCPU.
>
> Fixes: ec0f6639fa88 ("KVM: PPC: Book3S HV nestedv2: Ensure LPCR_MER bit is passed to the L0")
> Cc: stable@vger.kernel.org # v6.8+
> Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
> ---
> V1 -> V2:
> 1. Mask off the LPCR_MER in vcpu->arch.vcore->lpcr instead of resetting
> it so that we avoid grabbing vcpu->arch.vcore->lock. (Suggested by
> Ritesh in an internal review)

Thanks Gautam for addressing the review comment. But let me improve the
changelog a little to make it more accurate for others too.

Removed the macro which was silently clearing LPCR_MER bit from vcore->lpcr
and instead just mask it off while sending it to kvmhv_run_single_vcpu().
Added an inline comment describing the reason to avoid anyone tipping
it over. - (suggested ...)


Yes, that would also mean that no need of taking any vcore lock since we
are not modifying any of the vcore state variables which came up in the
internal review discussion.
Having said that it will be good to document the usage of vcore->lock
above the struct kvmppc_vcore definition. Because it isn't obvious of
when all it should be taken and/or what all it protects?

>
>  arch/powerpc/kvm/book3s_hv.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 8f7d7e37bc8c..b8701b5dde50 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -5089,9 +5089,19 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
>  
>  	do {
>  		accumulate_time(vcpu, &vcpu->arch.guest_entry);
> +		/*
> +		 * L1's copy of L2's lpcr (vcpu->arch.vcore->lpcr) can get its MER bit
> +		 * unexpectedly set - for e.g. during NMI handling when all register
> +		 * states are synchronized from L0 to L1. L1 needs to inform L0 about
> +		 * MER=1 only when there are pending external interrupts.
> +		 * kvmhv_run_single_vcpu() anyway sets MER bit if there are pending
> +		 * external interrupts. Hence, mask off MER bit when passing vcore->lpcr
> +		 * here as otherwise it may generate spurious interrupts in L2 KVM
> +		 * causing an endless loop, which results in L2 guest getting hung.
> +		 */

Thanks for describing this inline.

>  		if (cpu_has_feature(CPU_FTR_ARCH_300))
>  			r = kvmhv_run_single_vcpu(vcpu, ~(u64)0,
> -						  vcpu->arch.vcore->lpcr);
> +						  vcpu->arch.vcore->lpcr & ~LPCR_MER);

While still at it - 
I too like mpe suggestion to clear the LPCR_MER bit at one place
itself within kvmhv_run_single_vcpu(). 

>  		else
>  			r = kvmppc_run_vcpu(vcpu);
>  
> -- 
> 2.47.0

-ritesh

