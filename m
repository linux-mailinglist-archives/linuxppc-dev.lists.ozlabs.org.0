Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D178FDD19
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 05:01:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TjQ7xAsI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vvpxd1YtZz3cT8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 13:01:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TjQ7xAsI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvpwD6lTdz3cVG
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 12:59:56 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6f4603237e0so289919b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jun 2024 19:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717642795; x=1718247595; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jY8+afNtmmEPFoRIaL0b/lBynaGm0xDlwOzJjMBvuA=;
        b=TjQ7xAsIqFxeo4+QcKT92tB39ZoQ1HBMMf25CSvQwRE/0Mhq/kgv79RbgQGJvyJxeC
         6xj8rhB0ontieV9UbK7//UBIztI4OyjQPxNKanau0SZqjG+CVJfX+2CTwlSMrcPB69Sx
         wAdLGr27pNeTaurfT5i+3OSOYv7zuDjH2fm+LPtCLwAbqfzZ+pjfTPooO79aI0vvlID1
         WY8WEqbx0/SN66rJH1bbNoTkoYmbn9lGydkEwJed/yqh4+oLYK9SbZibTinuU+fHuzWs
         mIkylpAcdY4rBGJcNZx/uyuSxt3TLtFaqTJaoZSaPyy9HfhiHy03UiaI+3Gkyf+lEvVC
         AzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717642795; x=1718247595;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3jY8+afNtmmEPFoRIaL0b/lBynaGm0xDlwOzJjMBvuA=;
        b=YyiqnyZ85DEpFWAd4UuO/DIEEg7LEFuVQaUNFUCqP1+ig6Y5Z4fHkz5AbNYBTlX+gi
         DXl7iseOeeyA0uLOjxw+IJRVeMgVQdMJbArtjiKvGvURCUPk/h/iRe1kfj0OqNcI+7W8
         RA3OYDj3s1b8ML3wbUpdey019bBwL1JtBqmTSJJv+81gjb+nw7BxeR/p/o4M8EP3Sx4Z
         Hm7O6ogSl/YmC1RwcIHLBOwngYt1BgTuVLTn2yDWLEP2wuZghorcS+MLCNKVE2nBiE15
         PvZGprRYRoIuGXLvWGoexBgY/JW/eyygcsTCfujOL+HR4r7TTM+xrJb3ABhENl4oN4PO
         p7QA==
X-Gm-Message-State: AOJu0YzZG7wFBtuWFy283rcPTclh98HI/yl0/q8jeIi4TXYiqlErbPtB
	P0rQLuOlKgnse2kE023yOGiPhgUpPDMJGXI1Rgpz/Tp0yqSMyykT
X-Google-Smtp-Source: AGHT+IGeGxReLLjv1l3xAEtRa/uUc17W33egwyWHjtx8sqJk8zXcVB18rtTKncsYBiCgii3UKOKbhA==
X-Received: by 2002:a05:6a20:3952:b0:1b2:c995:d1a0 with SMTP id adf61e73a8af0-1b2c995d2bbmr503189637.17.1717642794569;
        Wed, 05 Jun 2024 19:59:54 -0700 (PDT)
Received: from localhost (110-175-65-7.tpgi.com.au. [110.175.65.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703fd3727casm214120b3a.18.2024.06.05.19.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 19:59:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Jun 2024 12:59:47 +1000
Message-Id: <D1SLJVD2W76U.3974CEMY2E585@gmail.com>
Subject: Re: [PATCH v2 2/2] arch/powerpc/kvm: Fix doorbell emulation for v2
 API
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Gautam Menghani" <gautam@linux.ibm.com>, <mpe@ellerman.id.au>,
 <christophe.leroy@csgroup.eu>, <aneesh.kumar@kernel.org>,
 <naveen.n.rao@linux.ibm.com>, <corbet@lwn.net>
X-Mailer: aerc 0.17.0
References: <20240605113913.83715-1-gautam@linux.ibm.com>
 <20240605113913.83715-3-gautam@linux.ibm.com>
In-Reply-To: <20240605113913.83715-3-gautam@linux.ibm.com>
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
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Jun 5, 2024 at 9:39 PM AEST, Gautam Menghani wrote:
> Doorbell emulation is broken for KVM on PAPR guests as support for
> DPDES was not added in the initial patch series. Due to this, a KVM on
> PAPR guest with SMT > 1 cannot be booted with the XICS interrupt
> controller as doorbells are setup in the initial probe path when using XI=
CS
> (pSeries_smp_probe()).
>
> Command to replicate the above bug:
>
> qemu-system-ppc64 \
> 	-drive file=3Drhel.qcow2,format=3Dqcow2 \
> 	-m 20G \
> 	-smp 8,cores=3D1,threads=3D8 \
> 	-cpu  host \
> 	-nographic \
> 	-machine pseries,ic-mode=3Dxics -accel kvm
>
> Add doorbell state handling support in the host
> KVM code to fix doorbell emulation.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>
> Fixes: 19d31c5f1157 ("KVM: PPC: Add support for nestedv2 guests")
> Cc: stable@vger.kernel.org # v6.7
> Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_hv.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 35cb014a0c51..21c69647d27c 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -4116,6 +4116,11 @@ static int kvmhv_vcpu_entry_nestedv2(struct kvm_vc=
pu *vcpu, u64 time_limit,
>  	int trap;
>  	long rc;
> =20
> +	if (vcpu->arch.doorbell_request) {
> +		vcpu->arch.doorbell_request =3D 0;
> +		kvmppc_set_dpdes(vcpu, 1);
> +	}
> +
>  	io =3D &vcpu->arch.nestedv2_io;
> =20
>  	msr =3D mfmsr();

