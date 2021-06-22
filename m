Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E033AFFBA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 10:58:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8L073y5hz3c2s
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 18:58:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=mVukyLLV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mVukyLLV; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8Kzd0J5tz3bvg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 18:57:48 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id v12so10097418plo.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 01:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=HNevKIrxlPVGEQdCRLTX5YK2dWZlzRumxTolSmIBotY=;
 b=mVukyLLVXguaQPXelB9Gk8SACercFpcp6X9VdvmRFsB32rSR6ApbqtXRHKw67UuObq
 ioIs8Kej4wuAl4ChIcCr08wMnYMsMBcVRdetOlVT1b8afKF4MckZiU1pQpoZd4YRzedX
 3NcvmaMn92eCbz8tV+0mnCHw3pdy6g3dZx4piWH9PBvdghL3yE+KoMfKqyfqLyWTDs8O
 otzEL4rAxky05RpEd5fGDLutCnrpY++kvN5Pf01mSA3FV3YpuCsUmXKGlA5AqAFKqdt1
 vg9QIbEaAWoM8Wu7KdEUPmPqZ36bWjeeiOdr0gVcvYGcNgnz7SADAdmCKf8qlzNGFdP4
 GrLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=HNevKIrxlPVGEQdCRLTX5YK2dWZlzRumxTolSmIBotY=;
 b=U2bmtH8VU1402BfvqJwchYD9IeQu2+oiNs72FmwYxQZJohKU2mlxX3HRhysnYUDgIs
 ndn5OW2S5zqEN/RdKLEE3hFwb1SyKyHxv4tCtNHUtpF3/y9ad7Q7yigucXyUmZuC1Qa0
 vYJaBoH+40DD511SqC7lzbd+eqJ/gmrvDDHIaK7D237oAe4hq/FiYbZRmzaIbfBpMIYI
 /HaALXR6+FDxjFtL7guHebAArbUNdbSHm/G31atq7cPYnz0mmjYLMbycso83dSVB4teB
 lsAdWG7pWb+u+u660l4ey8bhi6lO8HSLxQFRN+hJ1RzvLlz0dkcXd/52WqmUu6crjSe/
 yRrw==
X-Gm-Message-State: AOAM5328lwtXt9vzf8rhtAZJzNyLEirsDRRqW3aiE0Wk8DtRDSJIUTOY
 mpY9pv5jvV7k9+yTxxv/BseLQ8P4Cgw=
X-Google-Smtp-Source: ABdhPJyJwExst2s08JaWvoFk8cDPoMa9LLjDx3IKUeSrohb2NQpnydI+1m+kxqw3yA64dmOaKml5Kg==
X-Received: by 2002:a17:90b:2282:: with SMTP id
 kx2mr2673071pjb.60.1624352265702; 
 Tue, 22 Jun 2021 01:57:45 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id n5sm15609389pgf.35.2021.06.22.01.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 01:57:45 -0700 (PDT)
Date: Tue, 22 Jun 2021 18:57:39 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Workaround high stack usage with
 clang
To: Michael Ellerman <mpe@ellerman.id.au>, Nathan Chancellor
 <nathan@kernel.org>, Paul Mackerras <paulus@ozlabs.org>
References: <YNDUEoanTqvayZ5P@archlinux-ax161>
 <20210621182440.990242-1-nathan@kernel.org>
In-Reply-To: <20210621182440.990242-1-nathan@kernel.org>
MIME-Version: 1.0
Message-Id: <1624352117.tss3fnkwt4.astroid@bobo.none>
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
Cc: kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, clang-built-linux@googlegroups.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nathan Chancellor's message of June 22, 2021 4:24 am:
> LLVM does not emit optimal byteswap assembly, which results in high
> stack usage in kvmhv_enter_nested_guest() due to the inlining of
> byteswap_pt_regs(). With LLVM 12.0.0:
>=20
> arch/powerpc/kvm/book3s_hv_nested.c:289:6: error: stack frame size of
> 2512 bytes in function 'kvmhv_enter_nested_guest' [-Werror,-Wframe-larger=
-than=3D]
> long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
>      ^
> 1 error generated.
>=20
> While this gets fixed in LLVM, mark byteswap_pt_regs() as
> noinline_for_stack so that it does not get inlined and break the build
> due to -Werror by default in arch/powerpc/. Not inlining saves
> approximately 800 bytes with LLVM 12.0.0:
>=20
> arch/powerpc/kvm/book3s_hv_nested.c:290:6: warning: stack frame size of
> 1728 bytes in function 'kvmhv_enter_nested_guest' [-Wframe-larger-than=3D=
]
> long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
>      ^
> 1 warning generated.
>=20
> Link: https://github.com/ClangBuiltLinux/linux/issues/1292
> Link: https://bugs.llvm.org/show_bug.cgi?id=3D49610
> Link: https://lore.kernel.org/r/202104031853.vDT0Qjqj-lkp@intel.com/
> Link: https://gist.github.com/ba710e3703bf45043a31e2806c843ffd
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Seems okay to me. If it was something where performance might be=20
signficiant I guess you could ifdef on CC_IS_CLANG, but for this
it shouldn't matter.

Acked-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick

> ---
>  arch/powerpc/kvm/book3s_hv_nested.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3=
s_hv_nested.c
> index 60724f674421..1b3ff0af1264 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -53,7 +53,8 @@ void kvmhv_save_hv_regs(struct kvm_vcpu *vcpu, struct h=
v_guest_state *hr)
>  	hr->dawrx1 =3D vcpu->arch.dawrx1;
>  }
> =20
> -static void byteswap_pt_regs(struct pt_regs *regs)
> +/* Use noinline_for_stack due to https://bugs.llvm.org/show_bug.cgi?id=
=3D49610 */
> +static noinline_for_stack void byteswap_pt_regs(struct pt_regs *regs)
>  {
>  	unsigned long *addr =3D (unsigned long *) regs;
> =20
>=20
> base-commit: 4a21192e2796c3338c4b0083b494a84a61311aaf
> --=20
> 2.32.0.93.g670b81a890
>=20
>=20
