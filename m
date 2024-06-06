Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B36CB8FDD13
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 05:00:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IvARzPbJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vvpwr60cMz3cWy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 13:00:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IvARzPbJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vvpw513tDz30Vl
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 12:59:47 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7025b253f64so401736b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jun 2024 19:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717642782; x=1718247582; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vz1XSlT9oUSSTzN4cS11/Lx6KgX+Uz7+KxDJeBD1O6M=;
        b=IvARzPbJtvkZvRCo3Fl3hS0LkBGFs9SA130VLveVHUohgpqHSuErfnrxVxMI5wHMwY
         rs68KUtRk7rWUCqkE0FaQzYCMZJXt+6CqoRkrmDStq9QdlUuN5jrd9UL3DSbYzEz2Ode
         rMsbP5sV6+p1qohl/co+OMoHdg19RypGQAM6TKLD3ZoVQJTicTQ44c26csNJg1okqqXD
         z2AvBH5te9XMHx+pu5sEPbhVN19rVBTZgId2WRkWLc775HXPHMBaBNtiUQOg9JEo3BXw
         jt5xracVYTdjrR14E7NYUgJ0VBJYclh38SKEPUHUvSsN+Bw/dE+/4F3+LbYzfvIzW2cN
         igTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717642782; x=1718247582;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vz1XSlT9oUSSTzN4cS11/Lx6KgX+Uz7+KxDJeBD1O6M=;
        b=ThYApPGhPjCCcNa1oTUNGLUw+JnMayr4v1iT1f7EaYUn18G3l9GfSHE4G95Vx4O0/c
         88V1w+rOVS3BxT45xEFKo3yBgX4/N+rtUfcuOMbHyWmiIONzx1GE0AnyJUknVULyGMmo
         NATH6mSmG3OwALwgJQJebkwQ6tfumZrfRui0QC+DZOFxbzvEwDD5i3Doo032ZnydDXBD
         IXbbdjevvocfiDdvNovZxzOeqZYxQA5lnl5Th/Nic5nrIfk2wFS9qs+W3nonQR7FbrxC
         1+Yx7vOHFDCYPbZJIL3VM7lf65AjdiRXKWHNTwTK8iss5KrT0UNYx6xJcz7F9mlRRpeu
         jinw==
X-Gm-Message-State: AOJu0YwiSS6ec4NZI71SFRqFBhcTF3r6/19vb0rp/T0W47U6j1Qjf0zl
	HkeLuXre5WCpf4Lgyhho8jSiCx3KG+C1/9wSaa+5V6akN9LcVq2e
X-Google-Smtp-Source: AGHT+IEqs9EFID6KLRdH9JJgQcWIVOz6IZJBIwvKeto3Qx5Yrb/TMfE+Sb8RlX8Xf8sRjAx27+M+Ig==
X-Received: by 2002:a05:6a00:a27:b0:6ea:afdb:6d03 with SMTP id d2e1a72fcca58-703e59824efmr4635464b3a.19.1717642782042;
        Wed, 05 Jun 2024 19:59:42 -0700 (PDT)
Received: from localhost (110-175-65-7.tpgi.com.au. [110.175.65.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703fd39a806sm205312b3a.80.2024.06.05.19.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 19:59:41 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Jun 2024 12:59:34 +1000
Message-Id: <D1SLJP7L3EAY.2RKINBPUUGM5A@gmail.com>
Subject: Re: [PATCH v2 1/2] arch/powerpc/kvm: Add DPDES support in helper
 library for Guest state buffer
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Gautam Menghani" <gautam@linux.ibm.com>, <mpe@ellerman.id.au>,
 <christophe.leroy@csgroup.eu>, <aneesh.kumar@kernel.org>,
 <naveen.n.rao@linux.ibm.com>, <corbet@lwn.net>
X-Mailer: aerc 0.17.0
References: <20240605113913.83715-1-gautam@linux.ibm.com>
 <20240605113913.83715-2-gautam@linux.ibm.com>
In-Reply-To: <20240605113913.83715-2-gautam@linux.ibm.com>
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
> Add support for using DPDES in the library for using guest state
> buffers. DPDES support is needed for enabling usage of doorbells in a=20
> L2 KVM on PAPR guest.
>

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> Fixes: 6ccbbc33f06a ("KVM: PPC: Add helper library for Guest State Buffer=
s")
> Cc: stable@vger.kernel.org # v6.7
> Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
> ---
>  Documentation/arch/powerpc/kvm-nested.rst     | 4 +++-
>  arch/powerpc/include/asm/guest-state-buffer.h | 3 ++-
>  arch/powerpc/include/asm/kvm_book3s.h         | 1 +
>  arch/powerpc/kvm/book3s_hv_nestedv2.c         | 7 +++++++
>  arch/powerpc/kvm/test-guest-state-buffer.c    | 2 +-
>  5 files changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/arch/powerpc/kvm-nested.rst b/Documentation/ar=
ch/powerpc/kvm-nested.rst
> index 630602a8aa00..5defd13cc6c1 100644
> --- a/Documentation/arch/powerpc/kvm-nested.rst
> +++ b/Documentation/arch/powerpc/kvm-nested.rst
> @@ -546,7 +546,9 @@ table information.
>  +--------+-------+----+--------+----------------------------------+
>  | 0x1052 | 0x08  | RW |   T    | CTRL                             |
>  +--------+-------+----+--------+----------------------------------+
> -| 0x1053-|       |    |        | Reserved                         |
> +| 0x1053 | 0x08  | RW |   T    | DPDES                            |
> ++--------+-------+----+--------+----------------------------------+
> +| 0x1054-|       |    |        | Reserved                         |
>  | 0x1FFF |       |    |        |                                  |
>  +--------+-------+----+--------+----------------------------------+
>  | 0x2000 | 0x04  | RW |   T    | CR                               |
> diff --git a/arch/powerpc/include/asm/guest-state-buffer.h b/arch/powerpc=
/include/asm/guest-state-buffer.h
> index 808149f31576..d107abe1468f 100644
> --- a/arch/powerpc/include/asm/guest-state-buffer.h
> +++ b/arch/powerpc/include/asm/guest-state-buffer.h
> @@ -81,6 +81,7 @@
>  #define KVMPPC_GSID_HASHKEYR			0x1050
>  #define KVMPPC_GSID_HASHPKEYR			0x1051
>  #define KVMPPC_GSID_CTRL			0x1052
> +#define KVMPPC_GSID_DPDES			0x1053
> =20
>  #define KVMPPC_GSID_CR				0x2000
>  #define KVMPPC_GSID_PIDR			0x2001
> @@ -110,7 +111,7 @@
>  #define KVMPPC_GSE_META_COUNT (KVMPPC_GSE_META_END - KVMPPC_GSE_META_STA=
RT + 1)
> =20
>  #define KVMPPC_GSE_DW_REGS_START KVMPPC_GSID_GPR(0)
> -#define KVMPPC_GSE_DW_REGS_END KVMPPC_GSID_CTRL
> +#define KVMPPC_GSE_DW_REGS_END KVMPPC_GSID_DPDES
>  #define KVMPPC_GSE_DW_REGS_COUNT \
>  	(KVMPPC_GSE_DW_REGS_END - KVMPPC_GSE_DW_REGS_START + 1)
> =20
> diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include=
/asm/kvm_book3s.h
> index 3e1e2a698c9e..10618622d7ef 100644
> --- a/arch/powerpc/include/asm/kvm_book3s.h
> +++ b/arch/powerpc/include/asm/kvm_book3s.h
> @@ -594,6 +594,7 @@ static inline u##size kvmppc_get_##reg(struct kvm_vcp=
u *vcpu)		\
> =20
> =20
>  KVMPPC_BOOK3S_VCORE_ACCESSOR(vtb, 64, KVMPPC_GSID_VTB)
> +KVMPPC_BOOK3S_VCORE_ACCESSOR(dpdes, 64, KVMPPC_GSID_DPDES)
>  KVMPPC_BOOK3S_VCORE_ACCESSOR_GET(arch_compat, 32, KVMPPC_GSID_LOGICAL_PV=
R)
>  KVMPPC_BOOK3S_VCORE_ACCESSOR_GET(lpcr, 64, KVMPPC_GSID_LPCR)
>  KVMPPC_BOOK3S_VCORE_ACCESSOR_SET(tb_offset, 64, KVMPPC_GSID_TB_OFFSET)
> diff --git a/arch/powerpc/kvm/book3s_hv_nestedv2.c b/arch/powerpc/kvm/boo=
k3s_hv_nestedv2.c
> index 8e6f5355f08b..36863fff2a99 100644
> --- a/arch/powerpc/kvm/book3s_hv_nestedv2.c
> +++ b/arch/powerpc/kvm/book3s_hv_nestedv2.c
> @@ -311,6 +311,10 @@ static int gs_msg_ops_vcpu_fill_info(struct kvmppc_g=
s_buff *gsb,
>  			rc =3D kvmppc_gse_put_u64(gsb, iden,
>  						vcpu->arch.vcore->vtb);
>  			break;
> +		case KVMPPC_GSID_DPDES:
> +			rc =3D kvmppc_gse_put_u64(gsb, iden,
> +						vcpu->arch.vcore->dpdes);
> +			break;
>  		case KVMPPC_GSID_LPCR:
>  			rc =3D kvmppc_gse_put_u64(gsb, iden,
>  						vcpu->arch.vcore->lpcr);
> @@ -543,6 +547,9 @@ static int gs_msg_ops_vcpu_refresh_info(struct kvmppc=
_gs_msg *gsm,
>  		case KVMPPC_GSID_VTB:
>  			vcpu->arch.vcore->vtb =3D kvmppc_gse_get_u64(gse);
>  			break;
> +		case KVMPPC_GSID_DPDES:
> +			vcpu->arch.vcore->dpdes =3D kvmppc_gse_get_u64(gse);
> +			break;
>  		case KVMPPC_GSID_LPCR:
>  			vcpu->arch.vcore->lpcr =3D kvmppc_gse_get_u64(gse);
>  			break;
> diff --git a/arch/powerpc/kvm/test-guest-state-buffer.c b/arch/powerpc/kv=
m/test-guest-state-buffer.c
> index 4720b8dc8837..2571ccc618c9 100644
> --- a/arch/powerpc/kvm/test-guest-state-buffer.c
> +++ b/arch/powerpc/kvm/test-guest-state-buffer.c
> @@ -151,7 +151,7 @@ static void test_gs_bitmap(struct kunit *test)
>  		i++;
>  	}
> =20
> -	for (u16 iden =3D KVMPPC_GSID_GPR(0); iden <=3D KVMPPC_GSID_CTRL; iden+=
+) {
> +	for (u16 iden =3D KVMPPC_GSID_GPR(0); iden <=3D KVMPPC_GSE_DW_REGS_END;=
 iden++) {
>  		kvmppc_gsbm_set(&gsbm, iden);
>  		kvmppc_gsbm_set(&gsbm1, iden);
>  		KUNIT_EXPECT_TRUE(test, kvmppc_gsbm_test(&gsbm, iden));

