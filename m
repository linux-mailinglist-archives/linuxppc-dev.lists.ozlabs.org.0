Return-Path: <linuxppc-dev+bounces-2949-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6409B9BFD58
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 05:21:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkTQj0kBfz3bhg;
	Thu,  7 Nov 2024 15:21:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730953260;
	cv=none; b=UFIdiO0p5SXlhb7KFndzN9o95ZWfIJbVMUrI5SNtOQXzQ/eMMqjP5srm6Uxx7K4zfdK2I/3G+3kAwTsKuET8qBY++/GwOcYE788Ewbr98Q8opCQ8bclM40XaRSbrc2qRlW7a1KOPLSNyMyP3o8pT2fIqXFsIX/xGNpkrKbydqPi8F58UtNo3wArnoZbs5c65+KmUQ3r6g1Z58uJKqNWivzSdUl7e+gNMco1WolbE0RG3nUI7B03VPw+0iKgPUH1qg0m+Qp32r/wTMafM8WbKRZkcNnIA9/u2XirbXu/KgHIg8hRSjhwaAqJaq2mUG4jB43Jxn+LcBzFV5wm6T7g1yg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730953260; c=relaxed/relaxed;
	bh=P+IQhpL4e5Uo9lQJ0o9uzJmHF+9L3o1PKgI9OcfzQkk=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=Ou997WOJXsLQr0KTfbIArkC62toIkBPHTxJUno9StwNh3nAMSoRVDixAebBp/jnfjo2ekONQ4Bq2x7ZzelrIOoVHW7c7w1eD3FupKi1J6pgQhqNobiA2a1nVfTRpZ/yAuTaGDbJ+9/myp3+jChju4w403vpzjdWnk/wVkNAWmSkF7mx9jFfqgyeBd8qMLDKMlzSsv5f8o1C1RKGoo1ShmwY49gnawDx+FT4NFRcGqdrZD6NWKPqrWY1wcoqRoVivhLHD3GTyKHKLfj+H5YcPuC77cRJc0geo5lVC20RNnSunOlG3VHSp1d9HqBy2uvC8aenbFZTGYbGAY3uU0s74xA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jEjpFc1I; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jEjpFc1I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkTQf4M31z3bby
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 15:20:56 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-20c805a0753so5828485ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Nov 2024 20:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730953248; x=1731558048; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P+IQhpL4e5Uo9lQJ0o9uzJmHF+9L3o1PKgI9OcfzQkk=;
        b=jEjpFc1Izy1u3kCH+0EbpIuHJ3vAvTEVAv5NeE94L4p71wno7gB8lKO6mQU3/p6r1V
         6H2wVvzBcmP12JPusEFKsQZsusYJuHHzmkL31NN1BYOE4ZfXK5YdvTS7xX9tqigb3ROj
         QLvd6lekfpo+x+T5J7SBxE/ORhDGuzXSO/W28hGbPuj0VVTyu8x7p4oZJBqSASQ1O1UM
         HkyGa+oi7qhkBZiXoPfhxsaStPjiFRcqv5GbiG9KcWMTwLA433XpI2LMhm1ccm8GvCZ8
         NVcdv/KmYB+BZP/aB2sfY2TEW8wFiUJK4QdU5oKeADUDqKun7TpZfuvjurSjXO5W3T1P
         lLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730953248; x=1731558048;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P+IQhpL4e5Uo9lQJ0o9uzJmHF+9L3o1PKgI9OcfzQkk=;
        b=I1iNJXBlr9nv5wkdTRTr2ZldDQ+GXRLSDnVOCqYNot76nW0CqFZGgB8+1JMjWhR4J5
         vhb/hf3Y3Tm7Mf0blSQMYaCyPONC2pa2kILLMq/yzHk37nNGiLrGg0TZaeBnZimvjScQ
         sZPzyxnGKpfbTJPaYffjewJGfGLZ3om8X80PKlOZKPE4wEiT5nGQEDH8ALVGkCOrqoNa
         GYcsYbLjIZGAx0m7XG70A/Hkt4/GZSqAgbW2U6rFcseKUWXz4El3AQ+q5FnbDV/rgVQi
         29YPk9aLsF8bAtM5oOe3O9KVbQYKHsYgQAPv6ECSmusljSFRTsuDk0Pvvbx7bx4qCemr
         FSrw==
X-Forwarded-Encrypted: i=1; AJvYcCW2GHQxglxLXQoyC4OVviCWSU251LHkR+4oRpOEfLSghXYqJE3jVFNVuwljEzEXbObNucR17Zws619ZLVw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwhtfO1OXifTQDA3m2TSRie8Mcat7WZnBjzoQ1yDgNbaG2F3QSl
	HOPkI/c4RF6NK85EDM/O0DX8PDgoWP+OKHW6CrajfY9GJmP946L1
X-Google-Smtp-Source: AGHT+IG79uYcUwF9lFYUeqaifpaRzERnIc8rQuJ5hk5cLFMMa1tPt4Z2qXs9P2uWg0OS8aU5m7Ue1w==
X-Received: by 2002:a17:902:ea0d:b0:210:f69c:bebe with SMTP id d9443c01a7336-210f69cc47cmr459585375ad.38.1730953247999;
        Wed, 06 Nov 2024 20:20:47 -0800 (PST)
Received: from dw-tp ([129.41.58.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dc826fsm2926855ad.11.2024.11.06.20.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 20:20:47 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: Gautam Menghani <gautam@linux.ibm.com>, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com
Cc: Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] KVM: PPC: Book3S HV: Mask off LPCR_MER for a vCPU before running it to avoid spurious interrupts
In-Reply-To: <20241028090411.34625-1-gautam@linux.ibm.com>
Date: Thu, 07 Nov 2024 09:46:40 +0530
Message-ID: <87ttcjwudz.fsf@gmail.com>
References: <20241028090411.34625-1-gautam@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
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

> Running a L2 vCPU (see [1] for terminology) with LPCR_MER bit set and no
> pending interrupts results in that L2 vCPU getting an infinite flood of
> spurious interrupts. The 'if check' in kvmhv_run_single_vcpu() sets the
> LPCR_MER bit if there are pending interrupts.
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
> 3. When H_GUEST_GET_STATE is called for LPCR, the vcpu->arch.vcore->lpcr
>    of that vCPU at L1 level gets updated with LPCR_MER set to 1, and this
>    new value is always used whenever that vCPU runs, regardless of whether
>    there was a pending interrupt.
> 4. Since LPCR_MER is set, the vCPU in L2 always jumps to the external
>    interrupt handler, and this cycle never ends.
>
> Fix the spurious flood by masking off the LPCR_MER bit before running a
> L2 vCPU to ensure that it is not set if there are no pending interrupts.
>
> [1] Terminology:
> 1. L0 : PAPR hypervisor running in HV mode
> 2. L1 : Linux guest (logical partition) running on top of L0
> 3. L2 : KVM guest running on top of L1
>
> Fixes: ec0f6639fa88 ("KVM: PPC: Book3S HV nestedv2: Ensure LPCR_MER bit is passed to the L0")
> Cc: stable@vger.kernel.org # v6.8+
> Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
> ---
> v1 -> v2:
> 1. Removed the macro which was silently clearing LPCR_MER bit from vcore->lpcr
> and instead just masked it off while sending it to kvmhv_run_single_vcpu().
> Added an inline comment describing the reason to avoid anyone tipping
> it over. (Suggested by Ritesh in an internal review)
>
> v2 -> v3:
> 1. Moved the masking of LPCR_MER from kvmppc_vcpu_run_hv() to
> kvmhv_run_single_vcpu() (Suggested by Michael Ellerman)
>
>  arch/powerpc/kvm/book3s_hv.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 8f7d7e37bc8c..0ed5c5c7a350 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -4892,6 +4892,18 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
>  							   BOOK3S_INTERRUPT_EXTERNAL, 0);
>  			else
>  				lpcr |= LPCR_MER;
> +		} else {
> +			/*
> +			 * L1's copy of L2's LPCR (vcpu->arch.vcore->lpcr) can get its MER bit
> +			 * unexpectedly set - for e.g. during NMI handling when all register
> +			 * states are synchronized from L0 to L1. L1 needs to inform L0 about
> +			 * MER=1 only when there are pending external interrupts.
> +			 * In the above if check, MER bit is set if there are pending
> +			 * external interrupts. Hence, explicity mask off MER bit
> +			 * here as otherwise it may generate spurious interrupts in L2 KVM
> +			 * causing an endless loop, which results in L2 guest getting hung.
> +			 */
> +			lpcr &= ~LPCR_MER;
>  		}

I think we had enough discussions on v1 internally and v2 on mailing
list. So I am comfortable giving... 

LGTM. Please feel free to add - 

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

>  	} else if (vcpu->arch.pending_exceptions ||
>  		   vcpu->arch.doorbell_request ||
> -- 
> 2.47.0

