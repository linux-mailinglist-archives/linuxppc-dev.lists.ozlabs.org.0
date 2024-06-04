Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1438FAA2A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 07:47:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JcQD2811;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vtfjr0yh9z3cYf
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 15:46:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JcQD2811;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c34; helo=mail-oo1-xc34.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vtfj60Yyzz3cDT
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 15:46:17 +1000 (AEST)
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-5b9735d7ab4so2979948eaf.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2024 22:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717479974; x=1718084774; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uPLpxATmddmokVXF3C8IrkY43EERs2VVStOX1Q1SJ+I=;
        b=JcQD2811KzE0uvqC048deqztSRRAcJ5EePiPFFjT7k4/sCQpPDyzQ2BoJXE3sx+A6M
         pgOyoETCkoq7ASBfZOBkq6gJ+4YwwzKHwfzz+bWJmmvWwRiSoZiEN5w965w22Cc6rffh
         uMJj7WZQsXiGOh1JuuJXoKsLmlYNcBLHB6jiwPIK15/AsCLX/plWqMKyFMFJaKTLv0bo
         4qkC4xb2csYx3t7tmnPjV6kEG+IBNNKxdfntktPdZmJ0xoZs14ix2PdCF4whV1JqwQNo
         YJGWit5x2EqjVT4T/WP4FDrggxc70vLzUKcXxgnjoRC6HnoeNNGnBy29lrVT1r6Y3irB
         idCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717479974; x=1718084774;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uPLpxATmddmokVXF3C8IrkY43EERs2VVStOX1Q1SJ+I=;
        b=gIcu2YaNlvxXiwJTT7/rCKqf7W88TL6GWjqeoH3NxvV5zagdgnbJeZb+nHzp3WfE9w
         rPLtGbec4JSn9W8tBaD37BrlFkcUyfjxXZzN+moFc6mn0jjWBsVNTUbHKGhotgwoA8o5
         m3z5/J3bFBwVSWCGMLj3Y3MDBdQeHxjo4MfD6bvflOVgG/VDpX6oj5UcE50bG6eTgkbF
         tnUayhQ37xfTOh6WRHYJJMTpMaNOCJJV6gTorhuDuRlpZZ7oMKBp5J8h+roInG/cfwE9
         NiwrqptMc5KUY27O0JKbfEcaIqsJB9YLYgUnQRaPlMuAUm0joGEh9eQsl1HV7F0toBVj
         DlMA==
X-Forwarded-Encrypted: i=1; AJvYcCX8eNv61fczatTdqWFhQoXi2dEjQOr+2ldcBwuwI7PyeqYlcmy+xKvwXVPXG9+wtIVQMAiPbLIyZgA+2ZvukNAGRYkmxod1Mc/WD+DtnA==
X-Gm-Message-State: AOJu0Ywt/Isq3z+00r5dLUiid/Ji/cHMFyeAu0sB7Sqmwzvl/TcjkSMB
	grob6XHXBGpBQO2+pMrX74UUzedYAvP0gjoIOzQlmnis36WAbl9U
X-Google-Smtp-Source: AGHT+IEOLE4f64WHbpwwp9WVIXILo2lZZTZnZw9eBIwpn5RGDA714gckoGK8yqM2bo18SDDzsz1CNg==
X-Received: by 2002:a05:6871:5d3:b0:250:8248:7ea7 with SMTP id 586e51a60fabf-2508ba8e2e8mr11644460fac.27.1717479974273;
        Mon, 03 Jun 2024 22:46:14 -0700 (PDT)
Received: from localhost ([1.146.11.115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6c35a2d0ffasm6290700a12.77.2024.06.03.22.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 22:46:13 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Jun 2024 15:46:06 +1000
Message-Id: <D1QZU4EE41OU.2OWQD6HHQDTPR@gmail.com>
Subject: Re: [PATCH 3/6] KVM: PPC: Book3S HV nestedv2: Keep nested guest
 DEXCR in sync
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Shivaprasad G Bhat" <sbhat@linux.ibm.com>, <kvm@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.17.0
References: <171741323521.6631.11242552089199677395.stgit@linux.ibm.com>
 <171741326679.6631.5332298610543769487.stgit@linux.ibm.com>
In-Reply-To: <171741326679.6631.5332298610543769487.stgit@linux.ibm.com>
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
Cc: atrajeev@linux.vnet.ibm.com, corbet@lwn.net, linux-kernel@vger.kernel.org, namhyung@kernel.org, naveen.n.rao@linux.ibm.com, pbonzini@redhat.com, jniethe5@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Jun 3, 2024 at 9:14 PM AEST, Shivaprasad G Bhat wrote:
> The nestedv2 APIs has the guest state element defined for DEXCR
> for the save-restore with L0. However, its ignored in the code.
>
> The patch takes care of this for the DEXCR GSID.
>
> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/kvm_host.h   |    1 +
>  arch/powerpc/kvm/book3s_hv.h          |    1 +
>  arch/powerpc/kvm/book3s_hv_nestedv2.c |    6 ++++++
>  3 files changed, 8 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/a=
sm/kvm_host.h
> index 8abac532146e..1e2fdcbecffd 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -599,6 +599,7 @@ struct kvm_vcpu_arch {
>  	ulong dawrx0;
>  	ulong dawr1;
>  	ulong dawrx1;
> +	ulong dexcr;
>  	ulong ciabr;
>  	ulong cfar;
>  	ulong ppr;

Actually I would reorder the patches so you introduce the KVM reg
first, and put this hunk there.

The nested v2 bits look okay. For them,

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> diff --git a/arch/powerpc/kvm/book3s_hv.h b/arch/powerpc/kvm/book3s_hv.h
> index 47b2c815641e..7b0fd282fe95 100644
> --- a/arch/powerpc/kvm/book3s_hv.h
> +++ b/arch/powerpc/kvm/book3s_hv.h
> @@ -116,6 +116,7 @@ KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(dawr0, 64, KVMPPC_GSID=
_DAWR0)
>  KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(dawr1, 64, KVMPPC_GSID_DAWR1)
>  KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(dawrx0, 64, KVMPPC_GSID_DAWRX0)
>  KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(dawrx1, 64, KVMPPC_GSID_DAWRX1)
> +KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(dexcr, 64, KVMPPC_GSID_DEXCR)
>  KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(ciabr, 64, KVMPPC_GSID_CIABR)
>  KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(wort, 64, KVMPPC_GSID_WORT)
>  KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(ppr, 64, KVMPPC_GSID_PPR)
> diff --git a/arch/powerpc/kvm/book3s_hv_nestedv2.c b/arch/powerpc/kvm/boo=
k3s_hv_nestedv2.c
> index 1091f7a83b25..d207a6d936ff 100644
> --- a/arch/powerpc/kvm/book3s_hv_nestedv2.c
> +++ b/arch/powerpc/kvm/book3s_hv_nestedv2.c
> @@ -193,6 +193,9 @@ static int gs_msg_ops_vcpu_fill_info(struct kvmppc_gs=
_buff *gsb,
>  		case KVMPPC_GSID_DAWRX1:
>  			rc =3D kvmppc_gse_put_u32(gsb, iden, vcpu->arch.dawrx1);
>  			break;
> +		case KVMPPC_GSID_DEXCR:
> +			rc =3D kvmppc_gse_put_u64(gsb, iden, vcpu->arch.dexcr);
> +			break;
>  		case KVMPPC_GSID_CIABR:
>  			rc =3D kvmppc_gse_put_u64(gsb, iden, vcpu->arch.ciabr);
>  			break;
> @@ -441,6 +444,9 @@ static int gs_msg_ops_vcpu_refresh_info(struct kvmppc=
_gs_msg *gsm,
>  		case KVMPPC_GSID_DAWRX1:
>  			vcpu->arch.dawrx1 =3D kvmppc_gse_get_u32(gse);
>  			break;
> +		case KVMPPC_GSID_DEXCR:
> +			vcpu->arch.dexcr =3D kvmppc_gse_get_u64(gse);
> +			break;
>  		case KVMPPC_GSID_CIABR:
>  			vcpu->arch.ciabr =3D kvmppc_gse_get_u64(gse);
>  			break;

