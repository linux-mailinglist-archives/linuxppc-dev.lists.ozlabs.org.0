Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C9241FE62
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Oct 2021 00:12:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HMLp05ylDz305W
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Oct 2021 09:12:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=anyfinetworks-com.20210112.gappssmtp.com header.i=@anyfinetworks-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=hw/lGx12;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=anyfinetworks.com (client-ip=2607:f8b0:4864:20::b36;
 helo=mail-yb1-xb36.google.com; envelope-from=johan.almbladh@anyfinetworks.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anyfinetworks-com.20210112.gappssmtp.com
 header.i=@anyfinetworks-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=hw/lGx12; dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HMDdm6Ybnz2xXb
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Oct 2021 04:35:23 +1100 (AEDT)
Received: by mail-yb1-xb36.google.com with SMTP id w10so5157503ybt.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 Oct 2021 10:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anyfinetworks-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ATov8xhwilAPG8hTKDgOhAp4zWtTbfGrQUXX41SgOu4=;
 b=hw/lGx12ivdZeq/gzE74Y7XafmF/SexM1RkeKony+bRGjUzCZISw7+gSvpQI1rLfn2
 W6A2wRWHl5JNLlXPCd7+Sdd+59hq5SuXKF/5Bdb+k+3zC5ONGvj1q+47GLo3Cjcf/HJy
 kfIIQXT1JQuJcsd3I3w3ogkNc5R0HVXHxS/oDig5kfmiVr+w+tZF/t/yn4BDpVqbELi6
 j660ASX+B5sMPzJpp8ZDbzxeslaZkH+FueSRl7h05zOofXIrpB2WDmsSFS/5gxIwx4ZT
 ZAUSh1AceavAYKW+RvwGwAFs/qNCFlBWys6PLXDE9P3JFqXe/lUNdhjLIrQJlDKx0XgC
 V2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ATov8xhwilAPG8hTKDgOhAp4zWtTbfGrQUXX41SgOu4=;
 b=CmNKSvU0wwrOFtUZU+vhCGSp0mSGk3fCHrkR6d9T91LV9nuuXaXyzFRIZkh/s8mpMc
 wCUNfk6mSkIPKKAeGqaOWvyKAeUsxQzm/WrqkvuHvdCN+K8SMUOWYVKJFIIl3LuJPf/X
 HIFWXqRR4BFDxxykmd7noiv3jn7Ccv1XtgGDR6K/fPHCeqfOs8mHo5n+IW3R/ti+L+8y
 8XQDaoxxUHbH6yvM5cTJrE+RP0ltL+YiuCR7PiRNQrX3fvhARcpm6qoJKweiKmNV4201
 i5Cyq3i41SbfQuct6C6LA1Rl4BjMOeX7UuKWkwvTQROHWHDamhg5njrKRO6RfTCDZ6mu
 t1/g==
X-Gm-Message-State: AOAM531QQSKrek5oUYH+Of2zkoWErA8XJMrdBoMvc0GhsCbjCWUT+8fI
 oP8qOWLucE1QmzWdUi7wxg6/wfFTRJcEEykcMiVTxw==
X-Google-Smtp-Source: ABdhPJy0yemJB/H+aY30OeSVSV0WZP0LyDHmfYCiibRS5/+Cy7JlFIGsT2N5EI0GXKOor2S0Rz/aJSnEyQ7l+fu/SEI=
X-Received: by 2002:a25:abc7:: with SMTP id v65mr4760038ybi.194.1633196121609; 
 Sat, 02 Oct 2021 10:35:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
 <b7024b63a5501bbb67699da2345250deeea03d7e.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <b7024b63a5501bbb67699da2345250deeea03d7e.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
From: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Date: Sat, 2 Oct 2021 19:35:10 +0200
Message-ID: <CAM1=_QSA1wzdx0Xxq3HtpHuF8xbO4kqpkCfp1yKEw9dSKzxzww@mail.gmail.com>
Subject: Re: [PATCH 7/9] powerpc/bpf: Limit 'ldbrx' to processors compliant
 with ISA v2.06
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 03 Oct 2021 09:09:12 +1100
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
Cc: Daniel Borkmann <daniel@iogearbox.net>, Nicholas Piggin <npiggin@gmail.com>,
 bpf <bpf@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 1, 2021 at 11:15 PM Naveen N. Rao
<naveen.n.rao@linux.vnet.ibm.com> wrote:
>
> Johan reported the below crash with test_bpf on ppc64 e5500:
>
>   test_bpf: #296 ALU_END_FROM_LE 64: 0x0123456789abcdef -> 0x67452301 jited:1
>   Oops: Exception in kernel mode, sig: 4 [#1]
>   BE PAGE_SIZE=4K SMP NR_CPUS=24 QEMU e500
>   Modules linked in: test_bpf(+)
>   CPU: 0 PID: 76 Comm: insmod Not tainted 5.14.0-03771-g98c2059e008a-dirty #1
>   NIP:  8000000000061c3c LR: 80000000006dea64 CTR: 8000000000061c18
>   REGS: c0000000032d3420 TRAP: 0700   Not tainted (5.14.0-03771-g98c2059e008a-dirty)
>   MSR:  0000000080089000 <EE,ME>  CR: 88002822  XER: 20000000 IRQMASK: 0
>   <...>
>   NIP [8000000000061c3c] 0x8000000000061c3c
>   LR [80000000006dea64] .__run_one+0x104/0x17c [test_bpf]
>   Call Trace:
>    .__run_one+0x60/0x17c [test_bpf] (unreliable)
>    .test_bpf_init+0x6a8/0xdc8 [test_bpf]
>    .do_one_initcall+0x6c/0x28c
>    .do_init_module+0x68/0x28c
>    .load_module+0x2460/0x2abc
>    .__do_sys_init_module+0x120/0x18c
>    .system_call_exception+0x110/0x1b8
>    system_call_common+0xf0/0x210
>   --- interrupt: c00 at 0x101d0acc
>   <...>
>   ---[ end trace 47b2bf19090bb3d0 ]---
>
>   Illegal instruction
>
> The illegal instruction turned out to be 'ldbrx' emitted for
> BPF_FROM_[L|B]E, which was only introduced in ISA v2.06. Guard use of
> the same and implement an alternative approach for older processors.
>
> Fixes: 156d0e290e969c ("powerpc/ebpf/jit: Implement JIT compiler for extended BPF")
> Reported-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

Acked-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Tested-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>

> ---
>  arch/powerpc/include/asm/ppc-opcode.h |  1 +
>  arch/powerpc/net/bpf_jit_comp64.c     | 22 +++++++++++++---------
>  2 files changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
> index baea657bc8687e..bca31a61e57f88 100644
> --- a/arch/powerpc/include/asm/ppc-opcode.h
> +++ b/arch/powerpc/include/asm/ppc-opcode.h
> @@ -498,6 +498,7 @@
>  #define PPC_RAW_LDX(r, base, b)                (0x7c00002a | ___PPC_RT(r) | ___PPC_RA(base) | ___PPC_RB(b))
>  #define PPC_RAW_LHZ(r, base, i)                (0xa0000000 | ___PPC_RT(r) | ___PPC_RA(base) | IMM_L(i))
>  #define PPC_RAW_LHBRX(r, base, b)      (0x7c00062c | ___PPC_RT(r) | ___PPC_RA(base) | ___PPC_RB(b))
> +#define PPC_RAW_LWBRX(r, base, b)      (0x7c00042c | ___PPC_RT(r) | ___PPC_RA(base) | ___PPC_RB(b))
>  #define PPC_RAW_LDBRX(r, base, b)      (0x7c000428 | ___PPC_RT(r) | ___PPC_RA(base) | ___PPC_RB(b))
>  #define PPC_RAW_STWCX(s, a, b)         (0x7c00012d | ___PPC_RS(s) | ___PPC_RA(a) | ___PPC_RB(b))
>  #define PPC_RAW_CMPWI(a, i)            (0x2c000000 | ___PPC_RA(a) | IMM_L(i))
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index 4641a50e82d50d..097d1ecfb9f562 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -601,17 +601,21 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>                                 EMIT(PPC_RAW_MR(dst_reg, b2p[TMP_REG_1]));
>                                 break;
>                         case 64:
> -                               /*
> -                                * Way easier and faster(?) to store the value
> -                                * into stack and then use ldbrx
> -                                *
> -                                * ctx->seen will be reliable in pass2, but
> -                                * the instructions generated will remain the
> -                                * same across all passes
> -                                */
> +                               /* Store the value to stack and then use byte-reverse loads */
>                                 PPC_BPF_STL(dst_reg, 1, bpf_jit_stack_local(ctx));
>                                 EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], 1, bpf_jit_stack_local(ctx)));
> -                               EMIT(PPC_RAW_LDBRX(dst_reg, 0, b2p[TMP_REG_1]));
> +                               if (cpu_has_feature(CPU_FTR_ARCH_206)) {
> +                                       EMIT(PPC_RAW_LDBRX(dst_reg, 0, b2p[TMP_REG_1]));
> +                               } else {
> +                                       EMIT(PPC_RAW_LWBRX(dst_reg, 0, b2p[TMP_REG_1]));
> +                                       if (IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN))
> +                                               EMIT(PPC_RAW_SLDI(dst_reg, dst_reg, 32));
> +                                       EMIT(PPC_RAW_LI(b2p[TMP_REG_2], 4));
> +                                       EMIT(PPC_RAW_LWBRX(b2p[TMP_REG_2], b2p[TMP_REG_2], b2p[TMP_REG_1]));
> +                                       if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
> +                                               EMIT(PPC_RAW_SLDI(b2p[TMP_REG_2], b2p[TMP_REG_2], 32));
> +                                       EMIT(PPC_RAW_OR(dst_reg, dst_reg, b2p[TMP_REG_2]));
> +                               }
>                                 break;
>                         }
>                         break;
> --
> 2.33.0
>
