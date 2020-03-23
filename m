Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5E618F022
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 08:09:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m59W4lM2zDqcj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 18:09:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qEPlEuF2; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m5601mKxzDqx2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 18:06:47 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id u12so6719209pgb.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 00:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=jagWdCcnBiybSakfw5PN8Wa6sa3Cmn52hk0EpHATB/I=;
 b=qEPlEuF2JvsL2RsQf7olFsNe6R+IH2TQvW6iNSV3sxovf1phrsCGITGyS5TbZfJ3wk
 We6lbMj6KqQpkM+umo7Awvbi8JSkkJJIojRokdqmmlUxKnSp6e42LcRSlnZRMh8yB/Yi
 ysVEB1+4C/Iiwt6oxXJWdHJPs0d3nNjPmpBKeJib8s97ozJPdzeNRjpXK+mybgpHw6EM
 0lFWQYeFlB19KjlV7BD2+6UIglFI/R3jSh+3S1AI8lRjbyTt5fvWSRquJ0n3AnyZ/7ac
 9CexaOrpQ71MikQ18ESIv0IvEqxesvEilctLAJ5zatMqfQCZ9w/1XHH9+hcvswOE1hly
 dXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=jagWdCcnBiybSakfw5PN8Wa6sa3Cmn52hk0EpHATB/I=;
 b=kj4k00PUIKj2HBzBQI911uRbShoZtLZuFePqwXiGeuAzUFFLlKBly6pbO9qGKB0gLL
 CoCgVDTnKIqcimhsYOgIl1+8MtdCbFKNQ4onGudXDmvujzkj2QSZ1wln8NdOZL0ov1sY
 r1oWxkWti7dCl9d5kMN16ReXtUaUGaT+wde2tnW+/JBuHVQ/AlSoA32KRPX3njf8t8qo
 QldqrpcidUp4xZw/UnaaTOBh6rOd500QDrgHY66c5qzDkAlGp/A2DItV6f8XwcVWEyGI
 Q/3LAJcpml2s7Rft0d0ZPQ0APbn5QVkg5IJYFXgIh2em+0ajffOhGimsJeZYnzmTLgHu
 o/5A==
X-Gm-Message-State: ANhLgQ3pp74zSADHz15k2EMKB9nuS31/e/qu02oGeBj7Y5UEa+94jL4U
 E7JHyxuXOZ+q7pwtsCUdEZ0=
X-Google-Smtp-Source: ADFU+vtXcRAzMqHWjUwFZY0cuFIczi/iITTe1SbqXVRCE/wWsvBTZmN5PMlSGUo2Fg3Lpt22AfgplA==
X-Received: by 2002:a63:7e1a:: with SMTP id z26mr20184546pgc.226.1584947204830; 
 Mon, 23 Mar 2020 00:06:44 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id t186sm685023pgd.43.2020.03.23.00.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 00:06:44 -0700 (PDT)
Date: Mon, 23 Mar 2020 17:03:00 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 12/16] powerpc: Define new SRR1 bits for a future ISA
 version
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <20200320051809.24332-13-jniethe5@gmail.com>
In-Reply-To: <20200320051809.24332-13-jniethe5@gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584946962.88rdfk4474.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: alistair@popple.id.au, dja@axtens.net, bala24@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe's on March 20, 2020 3:18 pm:
> Add the BOUNDARY SRR1 bit definition for when the cause of an alignment
> exception is a prefixed instruction that crosses a 64-byte boundary.
> Add the PREFIXED SRR1 bit definition for exceptions caused by prefixed
> instructions.
>=20
> Bit 35 of SRR1 is called SRR1_ISI_N_OR_G. This name comes from it being
> used to indicate that an ISI was due to the access being no-exec or
> guarded. A future ISA version adds another purpose. It is also set if
> there is an access in a cache-inhibited location for prefixed
> instruction.  Rename from SRR1_ISI_N_OR_G to SRR1_ISI_N_G_OR_CIP.

Seems okay.

>=20
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v2: Combined all the commits concerning SRR1 bits.
> ---
>  arch/powerpc/include/asm/reg.h      | 4 +++-
>  arch/powerpc/kvm/book3s_hv_nested.c | 2 +-
>  arch/powerpc/kvm/book3s_hv_rm_mmu.c | 2 +-
>  3 files changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/re=
g.h
> index c7758c2ccc5f..173f33df4fab 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -762,7 +762,7 @@
>  #endif
> =20
>  #define   SRR1_ISI_NOPT		0x40000000 /* ISI: Not found in hash */
> -#define   SRR1_ISI_N_OR_G	0x10000000 /* ISI: Access is no-exec or G */
> +#define   SRR1_ISI_N_G_OR_CIP	0x10000000 /* ISI: Access is no-exec or G =
or CI for a prefixed instruction */
>  #define   SRR1_ISI_PROT		0x08000000 /* ISI: Other protection fault */
>  #define   SRR1_WAKEMASK		0x00380000 /* reason for wakeup */
>  #define   SRR1_WAKEMASK_P8	0x003c0000 /* reason for wakeup on POWER8 and=
 9 */
> @@ -789,6 +789,8 @@
>  #define   SRR1_PROGADDR		0x00010000 /* SRR0 contains subsequent addr */
> =20
>  #define   SRR1_MCE_MCP		0x00080000 /* Machine check signal caused interr=
upt */
> +#define   SRR1_BOUNDARY		0x10000000 /* Prefixed instruction crosses 64-b=
yte boundary */
> +#define   SRR1_PREFIXED		0x20000000 /* Exception caused by prefixed inst=
ruction */
> =20
>  #define SPRN_HSRR0	0x13A	/* Save/Restore Register 0 */
>  #define SPRN_HSRR1	0x13B	/* Save/Restore Register 1 */
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3=
s_hv_nested.c
> index dc97e5be76f6..6ab685227574 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -1169,7 +1169,7 @@ static int kvmhv_translate_addr_nested(struct kvm_v=
cpu *vcpu,
>  		} else if (vcpu->arch.trap =3D=3D BOOK3S_INTERRUPT_H_INST_STORAGE) {
>  			/* Can we execute? */
>  			if (!gpte_p->may_execute) {
> -				flags |=3D SRR1_ISI_N_OR_G;
> +				flags |=3D SRR1_ISI_N_G_OR_CIP;
>  				goto forward_to_l1;
>  			}
>  		} else {
> diff --git a/arch/powerpc/kvm/book3s_hv_rm_mmu.c b/arch/powerpc/kvm/book3=
s_hv_rm_mmu.c
> index 220305454c23..b53a9f1c1a46 100644
> --- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
> +++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
> @@ -1260,7 +1260,7 @@ long kvmppc_hpte_hv_fault(struct kvm_vcpu *vcpu, un=
signed long addr,
>  	status &=3D ~DSISR_NOHPTE;	/* DSISR_NOHPTE =3D=3D SRR1_ISI_NOPT */
>  	if (!data) {
>  		if (gr & (HPTE_R_N | HPTE_R_G))
> -			return status | SRR1_ISI_N_OR_G;
> +			return status | SRR1_ISI_N_G_OR_CIP;
>  		if (!hpte_read_permission(pp, slb_v & key))
>  			return status | SRR1_ISI_PROT;
>  	} else if (status & DSISR_ISSTORE) {
> --=20
> 2.17.1
>=20
>=20
=
