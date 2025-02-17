Return-Path: <linuxppc-dev+bounces-6240-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 371C8A37A61
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 05:16:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yx8Vw50Prz2ypV;
	Mon, 17 Feb 2025 15:16:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1029"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739765816;
	cv=none; b=EMQqypzri2InR3hTSH1yH4t28ThrNxs2MGtSKY9O2rmIJJgMhG9oZHYr2x+bENMSdPnSuQqoqYFc36kNIKAZksXHhPDxD6HWb7dsqE5ha3hBX+aSdTuDyXbQTcth6FE1HC8D6VBta5HcK99Qj3Hvl8hgqyqg+3K7QIt9EHeXB5Rok2HoZa80ycfLEjMpktDowtgJ6hAjFzy2Xj8ckLYDWMiKhFFDOPahE/FV3g1+izKWYwg/MYl2OmBudWxkQthYj/521Xdi/kbBFrA0OZNA8D6bauivfSXk5oU6P3mmXUxZyEshThBGZJ/mUixhxHa3SZeyn6Zv3GAIk7v3Sq4mnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739765816; c=relaxed/relaxed;
	bh=VZVssffNqWNjzTU9TTGkv9mNAMtzHUOrTJpj7IuOEXk=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=jf8MQM0TgHeYRj6SVYt9mm1D5Xj9vH3MVDj95JPdiOiF2MXEtB7lQSork3KiYiiz2x+XVG9zXmqYnhg69s13zA0U3Tpwkx2y83QwnUxeCA55QOU6gptIw5NbPA3395nUzcFO3NZAA/ZO07bCf6oRFS/V8EZcB+mzGmhlvxC3X05WpD3iskTJI/iQQEj6seA6G0ZsLgJqkROYklfPkHVOZX1QqfA61zGpywSban7fNvQxjH6NsiGe/UNkpci45D+TQNmTh88NuHQxccZoPcfRZ3VtDVKpoatsGxqjWjrAraAVann3DdKeCoJYPEVtTEwPrnC4jiJ6q6NHq06H2vHZOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hSEwPwgs; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hSEwPwgs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yx8Vv2PcXz2ykx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 15:16:54 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2fc3fa00323so3454461a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Feb 2025 20:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739765812; x=1740370612; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VZVssffNqWNjzTU9TTGkv9mNAMtzHUOrTJpj7IuOEXk=;
        b=hSEwPwgs5L9WFmThVSQ+NuYNxSljHNS5DLy6qy9ZOLELTXyT3Dd0K0fXHD9It4EWrX
         mnuTPEXiY5g/wVwAjK1dmQV0EHDT6haXZRhUkgVsyiolKndVRDx4rI/sDI2Xr/5iqa+X
         00M6DFodsvvcGbZdWCogOC4U6T60YLQSoEOYTIuJzmljAYnkxgcj8ame+hI9lAm7M6kv
         M34O60kleXlwIPLLzis0xSAYJEhqA/GYLMdQXQbPFXqvk80CNxhWyID1W88p2orB6iUK
         brSoGDNxDleU+qGOnk2CdRV0Q4DXm2OW5Jx/0t85qg9XEVVjgnCI1QzcjB4ZrImvQ9B+
         yinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739765812; x=1740370612;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VZVssffNqWNjzTU9TTGkv9mNAMtzHUOrTJpj7IuOEXk=;
        b=a90nDc5zVFV7FkI/hKYRFHzFqsYeEGoQMRMg6STp8RLLRUbM3eTfCfbKg/jijUBk2J
         +Og2GdUzVnu06M0KYlqIEi/PRilEMtzhny2gZ3ibOTSXFNZCFNctdIqw6/ezoFviFJdT
         LuFIg2W9l9TW9iJ0QMWx/RDVN7qIXndhX0Tdb5c+zrdaarf0Wn44xJ5kPOQheW8m7y51
         y24oLcwALS2QOaKO70yQ89PoqPePpbGa/AKsydkn1OHCTbCu8DK47bUoEFtWFXY2PRYs
         CrRH8afrYQQAUhngjT/VBvs0lzjHi+yqkEIXFiGjFS+xNxhdgDlBpnXpj+l4luR7YdPk
         Ehbg==
X-Forwarded-Encrypted: i=1; AJvYcCWENvGOxTzWBhs6T6EgF1DXOWxlGagrTa9slJbk32XyqKr7TdYHYy5kFMn0ZihHrxLLC99uiRsP0yvbtYE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxqR1smjkEoo8rSPVMjRc3obiFhfNkgUiUSfxiIXTgfwXF8Wk9M
	bqWrIct3TenJGjW3fy0NFZ5cfVLsfJb6N0vAyg+CXOKmqyBsxe8z
X-Gm-Gg: ASbGncvmdS5RMfeKI3Zs5rI7y/iFRk4K1Bl8w0EKplX1oJ+fsphs7BsYmmOSMNNdSco
	QP4VFUTC4X5JKmV/Y3OqqwSAJxOdbNpB3alz6hwgyH+VtJ1fWfqy7v59HCbzMBcVg/eb9BdVUub
	V/8dY8IWAUWnwjO8k3qRxHGoGPMfgpAChThWW6mLY1gXAVz7S4WGBTIHTgc8dxZJtNcQHtHh4sx
	TUWM8ADNVOIYLB4e5SCcE73L6Tn7pq1Z2DfOXTXMp0pEypDfWP0LEbFsALuO+B/4v7fcnySmXgp
	1QsA6aLp
X-Google-Smtp-Source: AGHT+IGB5lOheIDXmi3sWf655bfcf3YqTTKwUkHEUPhH7vLLYB3KzpSLLyEceBcoqQHonVYqV8aYkg==
X-Received: by 2002:a17:90b:384d:b0:2ee:74a1:fba2 with SMTP id 98e67ed59e1d1-2fc40f21e20mr12741959a91.20.1739765811865;
        Sun, 16 Feb 2025 20:16:51 -0800 (PST)
Received: from dw-tp ([171.76.86.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf5b93282sm4910089a91.1.2025.02.16.20.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 20:16:51 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: Amit Machhiwal <amachhiw@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Amit Machhiwal <amachhiw@linux.ibm.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, Shivaprasad G Bhat <sbhat@linux.ibm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] KVM: PPC: Enable CAP_SPAPR_TCE_VFIO on pSeries KVM guests
In-Reply-To: <20250129094033.2265211-1-amachhiw@linux.ibm.com>
Date: Mon, 17 Feb 2025 09:30:51 +0530
Message-ID: <8734gdqky4.fsf@gmail.com>
References: <20250129094033.2265211-1-amachhiw@linux.ibm.com>
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

> Currently on book3s-hv, the capability KVM_CAP_SPAPR_TCE_VFIO is only
> available for KVM Guests running on PowerNV and not for the KVM guests
> running on pSeries hypervisors. This prevents a pSeries L2 guest from
> leveraging the in-kernel acceleration for H_PUT_TCE_INDIRECT and
> H_STUFF_TCE hcalls that results in slow startup times for large memory
> guests.
>
> Fix this by enabling the CAP_SPAPR_TCE_VFIO on the pSeries hosts as well
> for the nested PAPR guests. With the patch, booting an L2 guest with
> 128G memory results in an average improvement of 11% in the startup
> times.
>
> Fixes: f431a8cde7f1 ("powerpc/iommu: Reimplement the iommu_table_group_ops for pSeries")
> Cc: stable@vger.kernel.org
> Signed-off-by: Amit Machhiwal <amachhiw@linux.ibm.com>
> ---
> Changes since v1:
>     * Addressed review comments from Ritesh
>     * v1: https://lore.kernel.org/all/20250109132053.158436-1-amachhiw@linux.ibm.com/

Thanks Amit for v2. However we still didn't answer one important
question regarding the context / background of this patch asked here [2]

[2]: https://lore.kernel.org/linuxppc-dev/87r059vpmi.fsf@gmail.com/

<copy paste from v1>
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


Please also update the commit message with the required context of why we can
enable this capability now while it was explicitely marked as disabled
earlier in [1].

But looks good otherwise. With that addressed in the commit message,
please feel free to add - 

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

-ritesh

>
>  arch/powerpc/kvm/powerpc.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index ce1d91eed231..a7138eb18d59 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -543,26 +543,23 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  		r = !hv_enabled;
>  		break;
>  #ifdef CONFIG_KVM_MPIC
>  	case KVM_CAP_IRQ_MPIC:
>  		r = 1;
>  		break;
>  #endif
>
>  #ifdef CONFIG_PPC_BOOK3S_64
>  	case KVM_CAP_SPAPR_TCE:
> +		fallthrough;
>  	case KVM_CAP_SPAPR_TCE_64:
> -		r = 1;
> -		break;
>  	case KVM_CAP_SPAPR_TCE_VFIO:
> -		r = !!cpu_has_feature(CPU_FTR_HVMODE);
> -		break;
>  	case KVM_CAP_PPC_RTAS:
>  	case KVM_CAP_PPC_FIXUP_HCALL:
>  	case KVM_CAP_PPC_ENABLE_HCALL:
>  #ifdef CONFIG_KVM_XICS
>  	case KVM_CAP_IRQ_XICS:
>  #endif
>  	case KVM_CAP_PPC_GET_CPU_CHAR:
>  		r = 1;
>  		break;
>  #ifdef CONFIG_KVM_XIVE
>
> base-commit: 6d61a53dd6f55405ebcaea6ee38d1ab5a8856c2c
> -- 
> 2.48.1

