Return-Path: <linuxppc-dev+bounces-5075-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE0DA0A1D4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 08:24:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVVQ638f9z3chZ;
	Sat, 11 Jan 2025 18:24:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736580254;
	cv=none; b=Ybpk263P7GDKT9yqk/MzKUsgCYCLgK2QYjlU8ROkMO83JOB+6YzWym9d/CExzNkYQ0ZFd6VzaZuswcPkmgb7n/GVQviYlvO5aB0n1J+VJ/Cux5p8Tk4olrxfNXlb59n75hcW/Tcq3PfRhOs3gChZlC0U/GhcvCe0lCAQA9xx97wYAsk/uO7DjbLrQ6xBJG79dXXKRpxBdfpaPouqc7LKO522zhXwwTeDBT0Ei/fTqCPUboc23juB+CZAKYeVPb1lZnvJXniUOe93on4i7bg074zxFDPelIskOp3+kzI9e+CPlChEKYsKPrP/aKJfXgA16jVcueRAGFn4XjX5lAZf3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736580254; c=relaxed/relaxed;
	bh=NH2/R/mmwYipmvjxTmPJfojr+0VZHua5pp0k9YchVg4=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=jlH+MYqroZbMQJPfrWGJOem2KzIQ9lIy4hsLeOrHbv0pjBbOopETJkVYYZ2j1iYVOiw1wU/+1XPLI8pHUKvTgHWme6SfuuOuxbc9yQuXLDDDb1fspVS3dyqJUyeaKasYWukmAE7UpKLFw8vQSwp23Ks8jIdq5DXAciGYWba5IutYXnh4RXiVYJuz5mkP+jDzGGu3pEn2qbdCdjuAiMvj4sbtgWg7gatv9zf00Hrf7wJi3L29RDq7mFqKZrM6aF1LOTvEjXn3ovhwf/1dLSNgGV2ExQ5T44MjXJuzjU1EQr8uIcARwO98pvfvkr3e31ks/8Hq/3PMqxdM7K59LswWDQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VCtQWYiy; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VCtQWYiy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YVVQ45fC2z3cgN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 18:24:12 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2166f1e589cso57128055ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 23:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736580250; x=1737185050; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NH2/R/mmwYipmvjxTmPJfojr+0VZHua5pp0k9YchVg4=;
        b=VCtQWYiyRCgp1M6mVUgglbO7E4TeYvl74/JfNjGZucp7ur0VQ3AMgAnlM10/B9COPp
         4h5SWtey2e74MPCnVNGv8ajjb6BNWo8Ta/5w8QIcBPUay0Vw1h7CSwE/NCiIDR/zJmfp
         EotnGcHtRo5tSDy7fNwVTHqcgN1Ilge8jZNyrzWeSWlTrOatQTtXPOpkO6ZlFJbnthQF
         3y40qVW38Owcl/3S2rfGmpnF4FAsIBBdnM4pJtgCBaNnehuWVMv8NaWUrnjjy/1cxFyV
         bzxJyAb+xnrwshuYkQrBGA5sdp89EW//TP8tMIFcQrNpRxCu00FWnXLhvtEVcGt/9/a8
         6VMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736580250; x=1737185050;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NH2/R/mmwYipmvjxTmPJfojr+0VZHua5pp0k9YchVg4=;
        b=KMv1LlDaLLYKXaECdSpSsaKuuGDaD8b5ZvPgn8621alxPb4tP5D5vpuOqhYNjS10WI
         svvKLwkKTG5l0iKfWSp4ZZPsWdQNrDtZJZ5rXGhGFh6KYsvyhNdHJkLCEiIkVi7K4HT7
         xkJ5503QHQBvmga8GOlhjXFsckR0LKzZD0vAVVFaYEaaYcmkUGHaop0aZEAbEUYPfFRj
         SiEbfnIZI0HmsjZNZRhi6cqztsYUG6pXhp0g7G/10sfPKNi8hMuUv/qYZkgThVbks22v
         /dnO8jPr6taPEp12bURc3e31ft5NHzwRLZcyGNmVegwEx8O48LtgmHH0SfrjJrbQdZFv
         UEiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGp4nJGMwF6vvqnrBuWhUm90VFNeB0iHcTx7cH2PdA/3hGjjCuLWsL6yCqgDG69padWrtGDJYPle2zPVA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzqflul5AwT3AGkKRBlKepUXOF0DhdwXkJ5RjLBiUeQC+UjGYIn
	0wEFFm8FyuPJb3W+UfcGYIY+gS9vta+12LxJ76OQDeNWo4J/bw9J
X-Gm-Gg: ASbGncvx899cvJqWkqVWRhI9J2NsLh3vFNw641hgL7bzh7bBfPuJEruCwjePABfo8ki
	zuKFDWPd+ye8h/P+Ok0ogkScUcOzOkehfANV1MSKXymQhwOUJVQzqIZyikoAMmo1LjyPBomYf3X
	ZuY88hOh7aFD3yjCPkbhjCPL1UepQKamWCTuxmJ3LOYtuouJobW3eMdnPzPecCEcOK0Kt36pbpj
	aBZ3AC3sGzW6VDi1AxcxMoqnp+63Q6gsscWqxWTB9KnI82fKg==
X-Google-Smtp-Source: AGHT+IEgeQ0GUy0bLna4m1uiMu79PJdAeK7ijLAotzT9V4CjzfxBB6JltsCSAZHszPCb+4sri3ib1w==
X-Received: by 2002:a05:6a00:340c:b0:72a:9ddf:55ab with SMTP id d2e1a72fcca58-72d21f3ececmr18299223b3a.10.1736580250208;
        Fri, 10 Jan 2025 23:24:10 -0800 (PST)
Received: from dw-tp ([49.205.218.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40658c56sm2637590b3a.93.2025.01.10.23.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 23:24:09 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: Amit Machhiwal <amachhiw@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Amit Machhiwal <amachhiw@linux.ibm.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, Shivaprasad G Bhat <sbhat@linux.ibm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] KVM: PPC: Enable CAP_SPAPR_TCE_VFIO on pSeries KVM guests
In-Reply-To: <20250109132053.158436-1-amachhiw@linux.ibm.com>
Date: Sat, 11 Jan 2025 11:49:49 +0530
Message-ID: <87r059vpmi.fsf@gmail.com>
References: <20250109132053.158436-1-amachhiw@linux.ibm.com>
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

Amit Machhiwal <amachhiw@linux.ibm.com> writes:

> Currently, on book3s-hv, the capability KVM_CAP_SPAPR_TCE_VFIO is only
> available for KVM Guests running on PowerNV and not for the KVM guests
> running on pSeries hypervisors. 

IIUC it was said here [1] that this capability is not available on
pSeries, hence it got removed. Could you please give a background on
why this can be enabled now for pSeries? Was there any additional
support added for this? 
[1]:
https://lore.kernel.org/linuxppc-dev/20181214052910.23639-2-sjitindarsingh@gmail.com/

... Ohh thinking back a little, are you saying that after the patch...
f431a8cde7f1 ("powerpc/iommu: Reimplement the iommu_table_group_ops for pSeries")
 ...we can bring back this capability for kvm guest running on pseries
as well. Because all underlying issues in using VFIO on pseries were
fixed. Is this understanding correct? 


> This prevents a pSeries hypervisor from
> leveraging the in-kernel acceleration for H_PUT_TCE_INDIRECT and
> H_STUFF_TCE hcalls that results in slow startup times for large memory
> guests.

By any chance could you share the startup time improvements for above?
IIUC, other than the boot up time, we should also see the performance
improvements while using VFIO device in nested pSeries kvm guest too right?

>
> Fix this by enabling the CAP_SPAPR_TCE_VFIO on the pSeries hosts for the
> nested PAPR guests.
>
> Fixes: f431a8cde7f1 ("powerpc/iommu: Reimplement the iommu_table_group_ops for pSeries")
> Cc: stable@vger.kernel.org
> Signed-off-by: Amit Machhiwal <amachhiw@linux.ibm.com>
> ---
>  arch/powerpc/kvm/powerpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index ce1d91eed231..9c479c7381e4 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -554,7 +554,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  		r = 1;
>  		break;
>  	case KVM_CAP_SPAPR_TCE_VFIO:
> -		r = !!cpu_has_feature(CPU_FTR_HVMODE);
> +		r = !!cpu_has_feature(CPU_FTR_HVMODE) || is_kvmppc_hv_enabled(kvm);
>  		break;

In above you said - "Fix this by enabling the CAP_SPAPR_TCE_VFIO on the pSeries hosts for the nested PAPR guests."
So why can't this simply be r = 1? Or maybe you meant only for HV KVM module is it?

-ritesh

>  	case KVM_CAP_PPC_RTAS:
>  	case KVM_CAP_PPC_FIXUP_HCALL:
>
> base-commit: eea6e4b4dfb8859446177c32961c96726d0117be
> -- 
> 2.47.1

