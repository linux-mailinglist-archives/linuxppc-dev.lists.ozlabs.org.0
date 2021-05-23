Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BA738DB5B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 May 2021 16:02:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fp29M650Xz3bnq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 00:02:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Nqe1Si+8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Nqe1Si+8; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fp28s4X3Dz2yRS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 May 2021 00:02:20 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id q6so13367776pjj.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 May 2021 07:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:cc:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=1/FeozxHRfVpleVaZSH9JCIqWkiRJTS5gM5GLQ+G1WY=;
 b=Nqe1Si+8L6X4kAdBMNtvSUWX2K9vuEAtbhGHaCgOFgiWFVkgWq6/uWmEZ5NICuopRM
 SFLy9Jtltmgcwnt483yP0XyqSlEHLfky1aU6vL+2yXGi7kkZvG9cZ7NpU6hSxI31bfxm
 ZU0XZtLnKljXUDYq9/DaKOAfyoFMkyLGf3qFohwQnzYX+T1LbpqPo693BZtT9CMy5Fla
 YfBvroAv4vKPEgE0D0xr28yOD+VJnDg/A8xoeGD0CuGMfUagTW7ubcKROgAqobnDZVzq
 cvgY3a7sYUzG+kGe9L0LYDWylH0A6W1Cng2fMyJJmnWUSt6pcRYschJjSgfN/DlHOBfa
 4j3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=1/FeozxHRfVpleVaZSH9JCIqWkiRJTS5gM5GLQ+G1WY=;
 b=VudwpYs/BGsHDZ4B755T7sBU+fshDKx3jFQz5ahw4AuRjGP9uxbnYZcCXMtgZ6P3Sf
 a4aRtAHff0xE0ta3FbrNBi9diFWiiQ9LMMdz9X8l1/NlEL6TOc4ar4lZ4wdDwRvrMtl2
 tG8IT5oPbQc+Nt6DhhgnI4MANdtFyN8WusxAi2kiAv2ebmBeqxvN/SirUE1+lsmCHrf8
 ZTslw7cj6YTkxgSy6oL2CQ72iGPGNh+4deV+JLW0Jh09Ps23kN0bLQhhwwFqFFZNLBIs
 BPcvFXC59/xzg4DbkMdYsQ8huiNp9m5T0NJqmdwh2/dS+yv/4jMUI11sHNrQRDiOAZzH
 y70g==
X-Gm-Message-State: AOAM5317cX6J6l6HflXKd4sposvwyJwNjAq2ug5mD9ylqGcXyitgnJ7f
 HI+4clLn8GdVuuMIfgajD8Y=
X-Google-Smtp-Source: ABdhPJyQ1myZY8wmPQTpUqCXjc7D31Sm72H5tntQMZ8fQ5yAIkd0hxgaM1iN6+dMqk24BmU0EgYrIg==
X-Received: by 2002:a17:902:9685:b029:ef:70fd:a5a2 with SMTP id
 n5-20020a1709029685b02900ef70fda5a2mr21004700plp.20.1621778536859; 
 Sun, 23 May 2021 07:02:16 -0700 (PDT)
Received: from localhost ([210.185.78.224])
 by smtp.gmail.com with ESMTPSA id 136sm8698589pfu.195.2021.05.23.07.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 May 2021 07:02:16 -0700 (PDT)
Date: Mon, 24 May 2021 00:02:10 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Save host FSCR in the P7/8 path
References: <20210523122101.3247232-1-npiggin@gmail.com>
In-Reply-To: <20210523122101.3247232-1-npiggin@gmail.com>
MIME-Version: 1.0
Message-Id: <1621778273.kjvbvpehfw.astroid@bobo.none>
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
Cc: Michael Neuling <mikey@neuling.org>, linuxppc-dev@lists.ozlabs.org,
 kvm-ppc@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of May 23, 2021 10:21 pm:
> Similar to commit 25edcc50d76c ("KVM: PPC: Book3S HV: Save and restore
> FSCR in the P9 path"), ensure the P7/8 path saves and restores the host
> FSCR. The logic explained in that patch actually applies there to the
> old path well: a context switch can be made before kvmppc_vcpu_run_hv
> restores the host FSCR and returns.
>=20
> Fixes: b005255e12a3 ("KVM: PPC: Book3S HV: Context-switch new POWER8 SPRs=
")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/b=
ook3s_hv_rmhandlers.S
> index 5e634db4809b..2b98e710c7a1 100644
> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> @@ -44,7 +44,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_300)
>  #define NAPPING_UNSPLIT	3
> =20
>  /* Stack frame offsets for kvmppc_hv_entry */
> -#define SFS			208
> +#define SFS			216
>  #define STACK_SLOT_TRAP		(SFS-4)
>  #define STACK_SLOT_SHORT_PATH	(SFS-8)
>  #define STACK_SLOT_TID		(SFS-16)
> @@ -59,8 +59,9 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_300)
>  #define STACK_SLOT_UAMOR	(SFS-88)
>  #define STACK_SLOT_DAWR1	(SFS-96)
>  #define STACK_SLOT_DAWRX1	(SFS-104)
> +#define STACK_SLOT_FSCR		(SFS-112)
>  /* the following is used by the P9 short path */
> -#define STACK_SLOT_NVGPRS	(SFS-152)	/* 18 gprs */
> +#define STACK_SLOT_NVGPRS	(SFS-160)	/* 18 gprs */

Actually, hmm.. this is wrong because nvgprs are subtracted from
this offset. But then I can't work out why 95a6432ce9038 raised
SFS from 160 to 208.

Thanks,
Nick
