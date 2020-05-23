Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC8B1DFC07
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 May 2020 01:58:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49V0fX4XZDzDqtY
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 May 2020 09:57:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49V0cy5HwbzDqMd
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 May 2020 09:56:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kCDaMcMp; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49V0cx6Rjvz8syj
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 May 2020 09:56:33 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49V0cx63Sgz9sSf; Sun, 24 May 2020 09:56:33 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kCDaMcMp; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49V0cx2fSCz9sSW
 for <linuxppc-dev@ozlabs.org>; Sun, 24 May 2020 09:56:33 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id 5so6673551pjd.0
 for <linuxppc-dev@ozlabs.org>; Sat, 23 May 2020 16:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=O+LF2unaIW1XM6p7bY7WANwIWpuLNM/kjFQOYjffsxY=;
 b=kCDaMcMpRp2iGtu4ZapXdcAdjKSenFzHldEtwTelQkzOfrMQr9s2QCyonkCttCM0k0
 ee7ZTxmC3l7CYjFOlnisSqQZ2hVuxAEa02Kd/OYBfbUWRDNKt4E11Flji9EjudGmBQht
 AVF/heDvm9vUFLl4MliSJmfRFZJRXIguY92jlv36Tfsv5voTuKHG4FCndUzjLFUO+uyy
 tv1UBiWUsPyDv5U0DpIZTW3jP1pm4UG4NXMs41ADVGBhqxhR61LtRLohV+FkBVtyyFmV
 qPECfgF9Zb47aDFBwGXfi06aE3eA6sNa8bWbwTV1XT42yr7NNST3CJWJLgle1DuFz1II
 aHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=O+LF2unaIW1XM6p7bY7WANwIWpuLNM/kjFQOYjffsxY=;
 b=Mkg960yeAWKNT7eh6zgfu3RJOLugfUK3E76E1Qz/WsAuUmgYJvdjgdojRtzDv26q0s
 G6GKbCdxlE8uv7LiWU9Nn3g/QbLvZ1QLgszbC+7KYgDAsRePj1GYgixXWY28Ay9EOOlx
 XamTpycOijcR6RDXcaHSJw7tphzNC0VFPuRce1LlMrmQ/MonNbwvBhqBGdl+VaLXphTP
 rqs4MVj7wG7MEZg/qMQ+TC0XwHRwL38H9ftK8k31NHU0u3JHwSfkFGCeg4+Ra0iUaVKx
 JgqUUL+LjjmAZEdPd4RCc7E5XATrXb8Kq/0qY1OPEx2INDusGF0knwww5JZSYtiprkDj
 ucww==
X-Gm-Message-State: AOAM531h95RkhWj7+WyyhAdyK1nL1tjTh3b/UhBujQ8ANDf8GSaeFA2V
 cYXXELz+U4M9+XOpyzPWIP5ojJlF
X-Google-Smtp-Source: ABdhPJxQ15V/JdpZjdbVQQ63i6tMGTfwCwOZJzcO1prDsh8wtzvUIuQRWuTx4sXQ2QXUrkjQpyh0xg==
X-Received: by 2002:a17:902:9044:: with SMTP id
 w4mr22143203plz.83.1590278189469; 
 Sat, 23 May 2020 16:56:29 -0700 (PDT)
Received: from localhost (115-64-212-199.static.tpgi.com.au. [115.64.212.199])
 by smtp.gmail.com with ESMTPSA id
 62sm9913447pfc.204.2020.05.23.16.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 May 2020 16:56:28 -0700 (PDT)
Date: Sun, 24 May 2020 09:56:22 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc: Add ppc_inst_next()
To: linuxppc-dev@ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20200522133318.1681406-1-mpe@ellerman.id.au>
In-Reply-To: <20200522133318.1681406-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1590277817.8ax5p94lur.astroid@bobo.none>
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
Cc: christophe.leroy@c-s.fr, jniethe5@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michael Ellerman's message of May 22, 2020 11:33 pm:
> In a few places we want to calculate the address of the next
> instruction. Previously that was simple, we just added 4 bytes, or if
> using a u32 * we incremented that pointer by 1.
>=20
> But prefixed instructions make it more complicated, we need to advance
> by either 4 or 8 bytes depending on the actual instruction. We also
> can't do pointer arithmetic using struct ppc_inst, because it is
> always 8 bytes in size on 64-bit, even though we might only need to
> advance by 4 bytes.
>=20
> So add a ppc_inst_next() helper which calculates the location of the
> next instruction, if the given instruction was located at the given
> address. Note the instruction doesn't need to actually be at the
> address in memory.
>=20
> Although it would seem natural for the value to be passed by value,
> that makes it too easy to write a loop that will read off the end of a
> page, eg:
>=20
> 	for (; src < end; src =3D ppc_inst_next(src, *src),
> 			  dest =3D ppc_inst_next(dest, *dest))
>=20
> As noticed by Christophe and Jordan, if end is the exact end of a
> page, and the next page is not mapped, this will fault, because *dest
> will read 8 bytes, 4 bytes into the next page.
>=20
> So value is passed by reference, so the helper can be careful to use
> ppc_inst_read() on it.
>=20
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/include/asm/inst.h   | 13 +++++++++++++
>  arch/powerpc/kernel/uprobes.c     |  2 +-
>  arch/powerpc/lib/feature-fixups.c | 15 ++++++++-------
>  arch/powerpc/xmon/xmon.c          |  2 +-
>  4 files changed, 23 insertions(+), 9 deletions(-)
>=20
> v2: Pass the value as a pointer and use ppc_inst_read() on it.
>=20
> diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/i=
nst.h
> index d82e0c99cfa1..5b756ba77ed2 100644
> --- a/arch/powerpc/include/asm/inst.h
> +++ b/arch/powerpc/include/asm/inst.h
> @@ -100,6 +100,19 @@ static inline int ppc_inst_len(struct ppc_inst x)
>  	return ppc_inst_prefixed(x) ? 8 : 4;
>  }
> =20
> +/*
> + * Return the address of the next instruction, if the instruction @value=
 was
> + * located at @location.
> + */
> +static inline struct ppc_inst *ppc_inst_next(void *location, struct ppc_=
inst *value)
> +{
> +	struct ppc_inst tmp;
> +
> +	tmp =3D ppc_inst_read(value);
> +
> +	return location + ppc_inst_len(tmp);
> +}
> +
>  int probe_user_read_inst(struct ppc_inst *inst,
>  			 struct ppc_inst __user *nip);
> =20
> diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.=
c
> index 83e883e1a42d..d200e7df7167 100644
> --- a/arch/powerpc/kernel/uprobes.c
> +++ b/arch/powerpc/kernel/uprobes.c
> @@ -112,7 +112,7 @@ int arch_uprobe_post_xol(struct arch_uprobe *auprobe,=
 struct pt_regs *regs)
>  	 * support doesn't exist and have to fix-up the next instruction
>  	 * to be executed.
>  	 */
> -	regs->nip =3D utask->vaddr + ppc_inst_len(ppc_inst_read(&auprobe->insn)=
);
> +	regs->nip =3D (unsigned long)ppc_inst_next((void *)utask->vaddr, &aupro=
be->insn);
> =20
>  	user_disable_single_step(current);
>  	return 0;

AFAIKS except for here, there is no need for the void *location arg.

I would prefer to drop that and keep this unchanged (it's a slightly=20
special case anyway).

Thanks,
Nick

> diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature=
-fixups.c
> index 80f320c2e189..4c0a7ee9fa00 100644
> --- a/arch/powerpc/lib/feature-fixups.c
> +++ b/arch/powerpc/lib/feature-fixups.c
> @@ -68,7 +68,7 @@ static int patch_alt_instruction(struct ppc_inst *src, =
struct ppc_inst *dest,
> =20
>  static int patch_feature_section(unsigned long value, struct fixup_entry=
 *fcur)
>  {
> -	struct ppc_inst *start, *end, *alt_start, *alt_end, *src, *dest;
> +	struct ppc_inst *start, *end, *alt_start, *alt_end, *src, *dest, nop;
> =20
>  	start =3D calc_addr(fcur, fcur->start_off);
>  	end =3D calc_addr(fcur, fcur->end_off);
> @@ -84,14 +84,15 @@ static int patch_feature_section(unsigned long value,=
 struct fixup_entry *fcur)
>  	src =3D alt_start;
>  	dest =3D start;
> =20
> -	for (; src < alt_end; src =3D (void *)src + ppc_inst_len(ppc_inst_read(=
src)),
> -	     (dest =3D (void *)dest + ppc_inst_len(ppc_inst_read(dest)))) {
> +	for (; src < alt_end; src =3D ppc_inst_next(src, src),
> +			      dest =3D ppc_inst_next(dest, dest)) {
>  		if (patch_alt_instruction(src, dest, alt_start, alt_end))
>  			return 1;
>  	}
> =20
> -	for (; dest < end; dest =3D (void *)dest + ppc_inst_len(ppc_inst(PPC_IN=
ST_NOP)))
> -		raw_patch_instruction(dest, ppc_inst(PPC_INST_NOP));
> +	nop =3D ppc_inst(PPC_INST_NOP);
> +	for (; dest < end; dest =3D ppc_inst_next(dest, &nop))
> +		raw_patch_instruction(dest, nop);
> =20
>  	return 0;
>  }
> @@ -405,8 +406,8 @@ static void do_final_fixups(void)
>  	while (src < end) {
>  		inst =3D ppc_inst_read(src);
>  		raw_patch_instruction(dest, inst);
> -		src =3D (void *)src + ppc_inst_len(inst);
> -		dest =3D (void *)dest + ppc_inst_len(inst);
> +		src =3D ppc_inst_next(src, src);
> +		dest =3D ppc_inst_next(dest, dest);
>  	}
>  #endif
>  }
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index fb135f2cd6b0..65cf853a4d26 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -939,7 +939,7 @@ static void insert_bpts(void)
>  		}
> =20
>  		patch_instruction(bp->instr, instr);
> -		patch_instruction((void *)bp->instr + ppc_inst_len(instr),
> +		patch_instruction(ppc_inst_next(bp->instr, &instr),
>  				  ppc_inst(bpinstr));
>  		if (bp->enabled & BP_CIABR)
>  			continue;
> --=20
> 2.25.1
>=20
>=20
