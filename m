Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 577D3488FCD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 06:30:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXMq61Lmtz30hh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 16:30:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YEoNUb6Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YEoNUb6Q; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXMpV58Bmz2x9K
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 16:29:52 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id p44so1690310pfw.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Jan 2022 21:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=T63j2oXophFqNBBjU9MLKfxqlttgIeTwiU8z9Cj214g=;
 b=YEoNUb6QHF+pu0VTfmVF33nQwcZ7Gd2miJ1ufC1wGf337foRXS4Ryh/HYkfvvRVYuu
 yWHgGQHlUn1wDZx5M+upSYsyf9H+0+jPAw8KmMwl8vd/vHoFIsi2RUO3U7hyO3fFLZec
 eAsRAqJRViIIpY/SKBJef9ArAtpPmGXkHL2LlspXkQ+Vy4eyvyFmfgfVpyZiPkkApr1t
 17PR9kTI6J7zN/PFmWZ6GWaRSbbQ9oBWg8cq6yB13kPGy4wIpfeAMUOR4lnDlJJRqsAP
 /Bn5S70UqRCvOsPSLCmPhuLaVBe0Mv4KXGBMXRE4zmIchl4iEkc6JmuvS5IKkImSRbxl
 hnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=T63j2oXophFqNBBjU9MLKfxqlttgIeTwiU8z9Cj214g=;
 b=gwrcXKDFRLQUhCE261ORK/IDTPElF26hkfKM9ina9gQuCELWw2o2ZhkJyvNeNHBcjp
 URoXIidRBcBBuXJkZMFunVCMAtXYM6vWb32v5XMKma/gBz2XPVCGzMRBCwyp/1rrHDjL
 FbcbbH1lqc07RKOfR2PXjCiUp4ouQ4EyC0iPqUZH5CVzg4qrEu1yXFh0PQBBtJ0XZFIk
 ThRylKFHpbw1zHbGGacYdc5vV93BHHUx90Q1RwvEvf/NZtiJgFodfR8BQjEt0H2OdPVG
 fr0tlrzTKPxS6+MMUmMmZ3pmapF/xJ0pEJA+hqMCXdOtBl+rRVp2rrwtG/PBoXA50Zun
 Gu/g==
X-Gm-Message-State: AOAM532Q5Sj91j7Cxxi2zzdyoShf/7iwbSWUpeAhx9hHrtrjX18WV449
 HP+EZSRH8FkNuzRMZYQ9BoQ=
X-Google-Smtp-Source: ABdhPJyZJmtV6L00QPqpSwBJr/VlJx4xkSwOU80cXDSPMr/EwmA5FPqnJyxnm9v72ZFh8Z4RJos9mg==
X-Received: by 2002:aa7:8592:0:b0:4be:2691:bb88 with SMTP id
 w18-20020aa78592000000b004be2691bb88mr5055939pfn.20.1641792590003; 
 Sun, 09 Jan 2022 21:29:50 -0800 (PST)
Received: from localhost (124-171-74-95.tpgi.com.au. [124.171.74.95])
 by smtp.gmail.com with ESMTPSA id oa9sm7632398pjb.31.2022.01.09.21.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 21:29:49 -0800 (PST)
Date: Mon, 10 Jan 2022 15:29:44 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 4/6] KVM: PPC: mmio: Queue interrupt at
 kvmppc_emulate_mmio
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20220107210012.4091153-1-farosas@linux.ibm.com>
 <20220107210012.4091153-5-farosas@linux.ibm.com>
In-Reply-To: <20220107210012.4091153-5-farosas@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1641792561.xpvi87mg71.astroid@bobo.none>
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
Cc: aik@ozlabs.ru, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Fabiano Rosas's message of January 8, 2022 7:00 am:
> If MMIO emulation fails, we queue a Program interrupt to the
> guest. Move that line up into kvmppc_emulate_mmio, which is where we
> set RESUME_GUEST/HOST. This allows the removal of the 'advance'
> variable.
>=20
> No functional change, just separation of responsibilities.

Looks cleaner.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  arch/powerpc/kvm/emulate_loadstore.c | 8 +-------
>  arch/powerpc/kvm/powerpc.c           | 2 +-
>  2 files changed, 2 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/powerpc/kvm/emulate_loadstore.c b/arch/powerpc/kvm/emul=
ate_loadstore.c
> index 48272a9b9c30..4dec920fe4c9 100644
> --- a/arch/powerpc/kvm/emulate_loadstore.c
> +++ b/arch/powerpc/kvm/emulate_loadstore.c
> @@ -73,7 +73,6 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
>  {
>  	u32 inst;
>  	enum emulation_result emulated =3D EMULATE_FAIL;
> -	int advance =3D 1;
>  	struct instruction_op op;
> =20
>  	/* this default type might be overwritten by subcategories */
> @@ -355,15 +354,10 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
>  		}
>  	}
> =20
> -	if (emulated =3D=3D EMULATE_FAIL) {
> -		advance =3D 0;
> -		kvmppc_core_queue_program(vcpu, 0);
> -	}
> -
>  	trace_kvm_ppc_instr(inst, kvmppc_get_pc(vcpu), emulated);
> =20
>  	/* Advance past emulated instruction. */
> -	if (advance)
> +	if (emulated !=3D EMULATE_FAIL)
>  		kvmppc_set_pc(vcpu, kvmppc_get_pc(vcpu) + 4);
> =20
>  	return emulated;
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 4d7d0d080232..6daeea4a7de1 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -307,7 +307,7 @@ int kvmppc_emulate_mmio(struct kvm_vcpu *vcpu)
>  		u32 last_inst;
> =20
>  		kvmppc_get_last_inst(vcpu, INST_GENERIC, &last_inst);
> -		/* XXX Deliver Program interrupt to guest. */
> +		kvmppc_core_queue_program(vcpu, 0);
>  		pr_info("%s: emulation failed (%08x)\n", __func__, last_inst);
>  		r =3D RESUME_HOST;
>  		break;
> --=20
> 2.33.1
>=20
>=20
