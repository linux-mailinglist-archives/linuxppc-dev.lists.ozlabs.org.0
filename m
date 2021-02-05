Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A07853104EF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 07:30:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DX5Bp0KjnzDvYx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 17:30:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rwAZrEHX; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DX58s2QqYzDvWL
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 17:28:44 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id e9so3236972pjj.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Feb 2021 22:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=n7CaGiXn3IclWpaI9yXVgNXyljc6Uf/i5e6pCdoBf3U=;
 b=rwAZrEHXeSHsEhQqlWJWMhS+QhnKGA9Iw7FLGGoJKoOeBD7vZibcpQ9NObjulqTHTe
 7GkjCmyb54Y7Z4prVF67Wk4/Sr6XWceCuls0wmHJ3qMB5hWV5UROmPQNd7iSsETxqXYu
 ABIGme3BAikEa6nXXQtAUAcAbsfuvblhEDgWl1R8+L50d85TpF8DCSLsglMQAVBwmefL
 dyzWInNwK3Onqpvn+ZtvCTQG28m3QOAuai43BoFdsBbCSQTBG0fjYiK6jNPr1YqCyHXp
 mqcortFcQTAZkk7IhsdhE27f20UnUtR1rUbEeQxnF49HeIH2D2J5KjPZvWaQ9C7yRpYc
 P4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=n7CaGiXn3IclWpaI9yXVgNXyljc6Uf/i5e6pCdoBf3U=;
 b=nMq+6hWvP5vcZu+0rsdE7ZjkBTM8I/al6KOQ1KVSXKmV980VPnH2NMMuIIVJqS9WnZ
 DdAxjUAzDgWq7KQLA939vBa+NRPPFGpj3mF7jvV3dpyW0ynQpJ7aEpCy+sTd+J1OPHIi
 sv6tLpfgy0skr7uqOHaaB0VAzgeA8G/KEiFL1CM2Uv7PQnUgVUS95ZlYNIjIKQsPqOSV
 1AfBhdVaFr7ROXNO1FvKX53SRLLScWt66cTFGCP4OQ5uQ7RjgEPaHhZtx292fNRMsjmw
 6LG1HaDKY4iXbfik5Mn8/LTszZaox7DsJCiDUPERerejcnFT+fX7Jw0ucfsdseKuJk7G
 384A==
X-Gm-Message-State: AOAM530KdKS6+sYFIfKUM+JORyu6glykWslXPmKiLejbsANTn2lePVdc
 2+Q00bzKr0zZMMEcbWopWao=
X-Google-Smtp-Source: ABdhPJyzYhRchCo7znC5uY06AcfhaOZlnYfVNeQoFViOz4lQHuEATDmNG7js6j4hIHTcx7QpjQxRyA==
X-Received: by 2002:a17:903:248e:b029:df:e75a:68f7 with SMTP id
 p14-20020a170903248eb02900dfe75a68f7mr2657814plw.9.1612506522323; 
 Thu, 04 Feb 2021 22:28:42 -0800 (PST)
Received: from localhost (60-242-11-44.static.tpgi.com.au. [60.242.11.44])
 by smtp.gmail.com with ESMTPSA id c9sm7233627pjr.44.2021.02.04.22.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 22:28:41 -0800 (PST)
Date: Fri, 05 Feb 2021 16:28:35 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 1/1] powerpc/kvm: Save Timebase Offset to fix
 sched_clock() while running guest code.
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Athira Rajeev
 <atrajeev@linux.vnet.ibm.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Frederic Weisbecker <frederic@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Jordan Niethe <jniethe5@gmail.com>, Leonardo Bras
 <leobras.c@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras
 <paulus@ozlabs.org>, Thomas Gleixner <tglx@linutronix.de>
References: <20210205060643.233481-1-leobras.c@gmail.com>
In-Reply-To: <20210205060643.233481-1-leobras.c@gmail.com>
MIME-Version: 1.0
Message-Id: <1612506268.6rrvx34gzu.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Leonardo Bras's message of February 5, 2021 4:06 pm:
> Before guest entry, TBU40 register is changed to reflect guest timebase.
> After exitting guest, the register is reverted to it's original value.
>=20
> If one tries to get the timestamp from host between those changes, it
> will present an incorrect value.
>=20
> An example would be trying to add a tracepoint in
> kvmppc_guest_entry_inject_int(), which depending on last tracepoint
> acquired could actually cause the host to crash.
>=20
> Save the Timebase Offset to PACA and use it on sched_clock() to always
> get the correct timestamp.

Ouch. Not sure how reasonable it is to half switch into guest registers=20
and expect to call into the wider kernel, fixing things up as we go.=20
What if mftb is used in other places?

Especially as it doesn't seem like there is a reason that function _has_
to be called after the timebase is switched to guest, that's just how=20
the code is structured.

As a local hack to work out a bug okay. If you really need it upstream=20
could you put it under a debug config option?

Thanks,
Nick

> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> Suggested-by: Paul Mackerras <paulus@ozlabs.org>
> ---
> Changes since v1:
> - Subtracts offset only when CONFIG_KVM_BOOK3S_HANDLER and
>   CONFIG_PPC_BOOK3S_64 are defined.
> ---
>  arch/powerpc/include/asm/kvm_book3s_asm.h | 1 +
>  arch/powerpc/kernel/asm-offsets.c         | 1 +
>  arch/powerpc/kernel/time.c                | 8 +++++++-
>  arch/powerpc/kvm/book3s_hv.c              | 2 ++
>  arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 2 ++
>  5 files changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/include/asm/kvm_book3s_asm.h b/arch/powerpc/inc=
lude/asm/kvm_book3s_asm.h
> index 078f4648ea27..e2c12a10eed2 100644
> --- a/arch/powerpc/include/asm/kvm_book3s_asm.h
> +++ b/arch/powerpc/include/asm/kvm_book3s_asm.h
> @@ -131,6 +131,7 @@ struct kvmppc_host_state {
>  	u64 cfar;
>  	u64 ppr;
>  	u64 host_fscr;
> +	u64 tb_offset;		/* Timebase offset: keeps correct timebase while on gue=
st */
>  #endif
>  };
> =20
> diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-=
offsets.c
> index b12d7c049bfe..0beb8fdc6352 100644
> --- a/arch/powerpc/kernel/asm-offsets.c
> +++ b/arch/powerpc/kernel/asm-offsets.c
> @@ -706,6 +706,7 @@ int main(void)
>  	HSTATE_FIELD(HSTATE_CFAR, cfar);
>  	HSTATE_FIELD(HSTATE_PPR, ppr);
>  	HSTATE_FIELD(HSTATE_HOST_FSCR, host_fscr);
> +	HSTATE_FIELD(HSTATE_TB_OFFSET, tb_offset);
>  #endif /* CONFIG_PPC_BOOK3S_64 */
> =20
>  #else /* CONFIG_PPC_BOOK3S */
> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
> index 67feb3524460..f27f0163792b 100644
> --- a/arch/powerpc/kernel/time.c
> +++ b/arch/powerpc/kernel/time.c
> @@ -699,7 +699,13 @@ EXPORT_SYMBOL_GPL(tb_to_ns);
>   */
>  notrace unsigned long long sched_clock(void)
>  {
> -	return mulhdu(get_tb() - boot_tb, tb_to_ns_scale) << tb_to_ns_shift;
> +	u64 tb =3D get_tb() - boot_tb;
> +
> +#if defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_KVM_BOOK3S_HANDLER)
> +	tb -=3D local_paca->kvm_hstate.tb_offset;
> +#endif
> +
> +	return mulhdu(tb, tb_to_ns_scale) << tb_to_ns_shift;
>  }
> =20
> =20
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index b3731572295e..c08593c63353 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -3491,6 +3491,7 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcp=
u *vcpu, u64 time_limit,
>  		if ((tb & 0xffffff) < (new_tb & 0xffffff))
>  			mtspr(SPRN_TBU40, new_tb + 0x1000000);
>  		vc->tb_offset_applied =3D vc->tb_offset;
> +		local_paca->kvm_hstate.tb_offset =3D vc->tb_offset;
>  	}
> =20
>  	if (vc->pcr)
> @@ -3594,6 +3595,7 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcp=
u *vcpu, u64 time_limit,
>  		if ((tb & 0xffffff) < (new_tb & 0xffffff))
>  			mtspr(SPRN_TBU40, new_tb + 0x1000000);
>  		vc->tb_offset_applied =3D 0;
> +		local_paca->kvm_hstate.tb_offset =3D 0;
>  	}
> =20
>  	mtspr(SPRN_HDEC, 0x7fffffff);
> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/b=
ook3s_hv_rmhandlers.S
> index b73140607875..8f7a9f7f4ee6 100644
> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> @@ -632,6 +632,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_300)
>  	cmpdi	r8,0
>  	beq	37f
>  	std	r8, VCORE_TB_OFFSET_APPL(r5)
> +	std	r8, HSTATE_TB_OFFSET(r13)
>  	mftb	r6		/* current host timebase */
>  	add	r8,r8,r6
>  	mtspr	SPRN_TBU40,r8	/* update upper 40 bits */
> @@ -1907,6 +1908,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
>  	beq	17f
>  	li	r0, 0
>  	std	r0, VCORE_TB_OFFSET_APPL(r5)
> +	std	r0, HSTATE_TB_OFFSET(r13)
>  	mftb	r6			/* current guest timebase */
>  	subf	r8,r8,r6
>  	mtspr	SPRN_TBU40,r8		/* update upper 40 bits */
> --=20
> 2.29.2
>=20
>=20
