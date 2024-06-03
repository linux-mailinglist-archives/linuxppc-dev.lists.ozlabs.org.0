Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB8B8D7B08
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2024 07:43:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f8rPtmI4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vt2h90050z3cRB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2024 15:43:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f8rPtmI4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vt2gN3G3Zz30W0
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2024 15:42:38 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1f65a3abd01so10819465ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 Jun 2024 22:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717393351; x=1717998151; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqYAbxXcZiC2cItjTqmcXMDzdjrchjWHaH7w9GA8zDM=;
        b=f8rPtmI42kVj1bl3Sq8X3ljpfCrBe7hRyhfgLCO/q/1V6eqQefFFoxtDZMy5fo8KVK
         T5ifKF3SCZnYzDxGLF2jz/5TV6GbNAGHoBa8JMmBRxaYqOIvApHJfAPNu1RNX4LsPEq+
         lIp7slbDHV9npzZ1684YzMo3xmiPCcc/gNxOsVKhWcBcO3tJNZQhhQtoEp0Xpu4zFNUw
         ahsrei8V9vjXFrJD/+yy+UtlX7+OnxBPA2FOwO3Y6HP5HtQy6oDgPFgtV5hn5yhH8eX9
         zpX+5hudBe8esMEGD3YQ6Jljhlm5XFNJiAEOV+A9wf6zCy1XZ95lL8Nr1K4GQIZlA13I
         FcFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717393351; x=1717998151;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vqYAbxXcZiC2cItjTqmcXMDzdjrchjWHaH7w9GA8zDM=;
        b=G6GCdgsZMVGxSmTWj5eLAL6yWMynn9flZkxI196119/6+nZSawMOXXy8JsfQReasZP
         FSz6ibU6gRr/dH2rg3YC22sG8prLPPMfQDf8VQAPgc7OUcZ82F11Qz0MyPtqrc6XFZjx
         BDGGeO9eg+efUVPfYSLrWoLWG32I4oMwm+PySkmoSHkkCUFalXvKiDY5fKaz6xTw0bnh
         wpGYa4l//XtqvVUiWAl28TcjETgtVqJK4f3bUiW6yKuvMYVZElHADqFrH2K2DIzVhnWF
         FDKleje9maY0QqqK//Hc/qGWy9WM0gZWGRy0UaaHExsmzbFe/Rpi3/X0RNvv1HoXxVQ5
         o3EA==
X-Gm-Message-State: AOJu0Ywinyi6vZQBXXxnR3SjuKmzkQhxTq9c/eDmk/Df2Sbpw2y/A6iW
	Y05MHTEYjPSAYt0K8YrcW0UMXwJwZlZGICOxrfusasZm32OvDsbhbvnxQt34
X-Google-Smtp-Source: AGHT+IFbKOdWWXidloqwMZDBr31ClzFKnCfuvB525mbYLqAvqHSEPBkL0Qe8xxXnrIDsvWatGYYa3A==
X-Received: by 2002:a17:903:2c6:b0:1f4:b18a:3f25 with SMTP id d9443c01a7336-1f6370a3163mr101095265ad.60.1717393351163;
        Sun, 02 Jun 2024 22:42:31 -0700 (PDT)
Received: from localhost ([1.128.202.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63232dcb6sm55868575ad.61.2024.06.02.22.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jun 2024 22:42:30 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Jun 2024 15:42:22 +1000
Message-Id: <D1Q54PY40E3B.22QS5DMQRA58N@gmail.com>
Subject: Re: [PATCH v1 RESEND] arch/powerpc/kvm: Fix doorbell emulation by
 adding DPDES support
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Gautam Menghani" <gautam@linux.ibm.com>, <mpe@ellerman.id.au>,
 <christophe.leroy@csgroup.eu>, <aneesh.kumar@kernel.org>,
 <naveen.n.rao@linux.ibm.com>, <corbet@lwn.net>
X-Mailer: aerc 0.17.0
References: <20240522084949.123148-1-gautam@linux.ibm.com>
In-Reply-To: <20240522084949.123148-1-gautam@linux.ibm.com>
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
Cc: stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed May 22, 2024 at 6:49 PM AEST, Gautam Menghani wrote:
> Doorbell emulation is broken for KVM on PowerVM guests as support for
> DPDES was not added in the initial patch series. Due to this, a KVM on
> PowerVM guest cannot be booted with the XICS interrupt controller as
> doorbells are to be setup in the initial probe path when using XICS
> (pSeries_smp_probe()). Add DPDES support in the host KVM code to fix
> doorbell emulation.

This is broken when the KVM guest has SMT > 1? Or is it broken for SMT=3D1
as well? Can you explain a bit more of what breaks if it's the latter?

> Fixes: 6ccbbc33f06a ("KVM: PPC: Add helper library for Guest State Buffer=
s")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
> ---
> v1 -> v1 resend:
> 1. Add the stable tag
>
>  Documentation/arch/powerpc/kvm-nested.rst     |  4 +++-
>  arch/powerpc/include/asm/guest-state-buffer.h |  3 ++-
>  arch/powerpc/include/asm/kvm_book3s.h         |  1 +
>  arch/powerpc/kvm/book3s_hv.c                  | 14 +++++++++++++-
>  arch/powerpc/kvm/book3s_hv_nestedv2.c         |  7 +++++++
>  arch/powerpc/kvm/test-guest-state-buffer.c    |  2 +-
>  6 files changed, 27 insertions(+), 4 deletions(-)
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
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 35cb014a0c51..cf285e5153ba 100644
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

This probably looks okay... hmm, is the v1 KVM emulating doorbells
correctly for SMT L2 guests? I wonder if doorbell emulation isn't
broken there too because the L1 code looks to be passing in vc->dpdes
but all the POWER9 emulation code uses doorbell_request.

> +
>  	io =3D &vcpu->arch.nestedv2_io;
> =20
>  	msr =3D mfmsr();
> @@ -4278,9 +4283,16 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *v=
cpu, u64 time_limit,
>  	if (kvmhv_on_pseries()) {
>  		if (kvmhv_is_nestedv1())
>  			trap =3D kvmhv_vcpu_entry_p9_nested(vcpu, time_limit, lpcr, tb);
> -		else
> +		else {
>  			trap =3D kvmhv_vcpu_entry_nestedv2(vcpu, time_limit, lpcr, tb);
> =20
> +			/* Remember doorbell if it is pending  */
> +			if (kvmppc_get_dpdes(vcpu)) {
> +				vcpu->arch.doorbell_request =3D 1;
> +				kvmppc_set_dpdes(vcpu, 0);
> +			}

This is adding an extra get state for every entry, not good. I don't
think it's actually needed though. I don't think the L1 cares at this
stage what the L2 DPDES state is. So you sholud be able to drop this
hunk.

> +		}
> +
>  		/* H_CEDE has to be handled now, not later */
>  		if (trap =3D=3D BOOK3S_INTERRUPT_SYSCALL && !nested &&
>  		    kvmppc_get_gpr(vcpu, 3) =3D=3D H_CEDE) {
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

I would split all the wiring up of the DPDES GSID stuff into its own
patch, it obviously looks fine.

> diff --git a/arch/powerpc/kvm/test-guest-state-buffer.c b/arch/powerpc/kv=
m/test-guest-state-buffer.c
> index 4720b8dc8837..91ae660cfe21 100644
> --- a/arch/powerpc/kvm/test-guest-state-buffer.c
> +++ b/arch/powerpc/kvm/test-guest-state-buffer.c
> @@ -151,7 +151,7 @@ static void test_gs_bitmap(struct kunit *test)
>  		i++;
>  	}
> =20
> -	for (u16 iden =3D KVMPPC_GSID_GPR(0); iden <=3D KVMPPC_GSID_CTRL; iden+=
+) {
> +	for (u16 iden =3D KVMPPC_GSID_GPR(0); iden <=3D KVMPPC_GSID_DPDES; iden=
++) {
>  		kvmppc_gsbm_set(&gsbm, iden);
>  		kvmppc_gsbm_set(&gsbm1, iden);
>  		KUNIT_EXPECT_TRUE(test, kvmppc_gsbm_test(&gsbm, iden));

It would be good to have a  _LAST define for such loops. It's very easy
to miss when adding KVMPPC_GSID_DPDES that you need to grep for
KVMPPC_GSID_CTRL. Very easy to see that you need to update _LAST.

You just need to work out a good name for it since there's a few
"namespaces" of numbers with similar prefix. Good luck :)

Thanks,
Nick
