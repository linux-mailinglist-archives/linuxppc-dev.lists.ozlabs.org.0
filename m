Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB158FAA2D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 07:47:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EV8io6yy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vtfkc3GbQz3cY1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 15:47:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EV8io6yy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtfjR0mVSz3cVm
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 15:46:34 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1f62217f806so44145275ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2024 22:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717479992; x=1718084792; darn=lists.ozlabs.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LeU4vs9qcvhQs2pgjN02cESWYhtrhJkRZ0uDe9+oP04=;
        b=EV8io6yySx1fh6Mz7HvVIf1jfVgLEmRv8S4mw2V1kqAxAZKC9WjRwGfHhFhGY7RhZ3
         hkwmLdTeZClpKCMPsOpVFc/y0t/JgBLoZlIeQlqobuZbyFbNs4lki8JQErmHVrHv2USQ
         FsRRxI9wHF238SiJRnlEz34quIuQ7aroOtIWUboaRnG3pDDrGO5JmrXSGgcVd9xRpkc1
         nqjPTy0xwiy5J1vCVAhxPdWnAPZ2B7RZDmkE7pAlzGrYE4g+TcdFI1sm/iHaIGqzTg9c
         B3nc//6ur794/rQVRvzHBPig5Y1Jk7/cu8huO51xOEE27Kj3zHi6LdOFnqLQANzVz2LA
         cnFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717479992; x=1718084792;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LeU4vs9qcvhQs2pgjN02cESWYhtrhJkRZ0uDe9+oP04=;
        b=mBTBgoZwp+HAyz7d9sUhSsvUHJ1zdulBzQTYHSaUgPRx6qznEuqfdgyQVow9VPKcFN
         LQIpvJz39wUUSI2pKW4k8AiaQY6SEd7Rd1VxxBj+kh+salhDr1KGyTmIwbx8OAyk+JZH
         NPkGRoWExNDhz3Ug/I7MNC7T493FH/Q//HMtZQ3kYUZdVlOZudbkjod/eOxBAQK/dfVA
         l+oGYaKiXIJDO/vO2ieJS7LMikAVmfcFrfEtCEcDhvN9fbBndRrZmBiRRZI5bBjWgBvs
         LAciezut8OdX35SJB1dH9p2NaaxC6vxmVyPCV58GXRcjVErsbz+MMV/ZWVmYDjZxnJK8
         f7eg==
X-Forwarded-Encrypted: i=1; AJvYcCV/rCw4uVH/VraWEAwvEDIHp/ilF5Kj1D7UIwzHUZFsJcnwIvcrk2dtZnVuRryeAz0WbFNKGL1eXJUGp+9GI5Mktx57X95/HJx/1OK87Q==
X-Gm-Message-State: AOJu0Yx8ch3xwTgqcRhmDq79aRilv78MJoB4p1U4874XlpurcY0ioSvb
	QYUEBjKKJqAVldxkRDkXcriOinPw8zcSyowaI3fI0TeXjkRMDolJ
X-Google-Smtp-Source: AGHT+IFcTDvyrQflTU74FbFM840eY3KntUMbq2Bo1DKCHEzkJ0awM+YeaTrnABc3dgcJ96EjCJacoA==
X-Received: by 2002:a17:902:d50f:b0:1f6:838f:c70b with SMTP id d9443c01a7336-1f6838fc914mr42020405ad.51.1717479992495;
        Mon, 03 Jun 2024 22:46:32 -0700 (PDT)
Received: from localhost ([1.146.11.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63241d378sm74388155ad.301.2024.06.03.22.46.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 22:46:32 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Jun 2024 15:46:24 +1000
Message-Id: <D1QZUCKP1YIR.3FYPGS64LOMAT@gmail.com>
To: "Shivaprasad G Bhat" <sbhat@linux.ibm.com>, <kvm@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 5/6] KVM: PPC: Book3S HV nestedv2: Keep nested guest
 HASHKEYR in sync
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.17.0
References: <171741323521.6631.11242552089199677395.stgit@linux.ibm.com>
 <171741329242.6631.7779344904083076707.stgit@linux.ibm.com>
In-Reply-To: <171741329242.6631.7779344904083076707.stgit@linux.ibm.com>
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
> The nestedv2 APIs has the guest state element defined for HASHKEYR for
> the save-restore with L0. However, its ignored in the code.
>
> The patch takes care of this for the HASHKEYR GSID.
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
> index 1e2fdcbecffd..a0cd9dbf534f 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -600,6 +600,7 @@ struct kvm_vcpu_arch {
>  	ulong dawr1;
>  	ulong dawrx1;
>  	ulong dexcr;
> +	ulong hashkeyr;
>  	ulong ciabr;
>  	ulong cfar;
>  	ulong ppr;

Same comment applies

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick

> diff --git a/arch/powerpc/kvm/book3s_hv.h b/arch/powerpc/kvm/book3s_hv.h
> index 7b0fd282fe95..c073fdfa7dc4 100644
> --- a/arch/powerpc/kvm/book3s_hv.h
> +++ b/arch/powerpc/kvm/book3s_hv.h
> @@ -117,6 +117,7 @@ KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(dawr1, 64, KVMPPC_GSID=
_DAWR1)
>  KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(dawrx0, 64, KVMPPC_GSID_DAWRX0)
>  KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(dawrx1, 64, KVMPPC_GSID_DAWRX1)
>  KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(dexcr, 64, KVMPPC_GSID_DEXCR)
> +KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(hashkeyr, 64, KVMPPC_GSID_HASHKEYR)
>  KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(ciabr, 64, KVMPPC_GSID_CIABR)
>  KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(wort, 64, KVMPPC_GSID_WORT)
>  KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(ppr, 64, KVMPPC_GSID_PPR)
> diff --git a/arch/powerpc/kvm/book3s_hv_nestedv2.c b/arch/powerpc/kvm/boo=
k3s_hv_nestedv2.c
> index d207a6d936ff..bbff933f2ccc 100644
> --- a/arch/powerpc/kvm/book3s_hv_nestedv2.c
> +++ b/arch/powerpc/kvm/book3s_hv_nestedv2.c
> @@ -196,6 +196,9 @@ static int gs_msg_ops_vcpu_fill_info(struct kvmppc_gs=
_buff *gsb,
>  		case KVMPPC_GSID_DEXCR:
>  			rc =3D kvmppc_gse_put_u64(gsb, iden, vcpu->arch.dexcr);
>  			break;
> +		case KVMPPC_GSID_HASHKEYR:
> +			rc =3D kvmppc_gse_put_u64(gsb, iden, vcpu->arch.hashkeyr);
> +			break;
>  		case KVMPPC_GSID_CIABR:
>  			rc =3D kvmppc_gse_put_u64(gsb, iden, vcpu->arch.ciabr);
>  			break;
> @@ -447,6 +450,9 @@ static int gs_msg_ops_vcpu_refresh_info(struct kvmppc=
_gs_msg *gsm,
>  		case KVMPPC_GSID_DEXCR:
>  			vcpu->arch.dexcr =3D kvmppc_gse_get_u64(gse);
>  			break;
> +		case KVMPPC_GSID_HASHKEYR:
> +			vcpu->arch.hashkeyr =3D kvmppc_gse_get_u64(gse);
> +			break;
>  		case KVMPPC_GSID_CIABR:
>  			vcpu->arch.ciabr =3D kvmppc_gse_get_u64(gse);
>  			break;

