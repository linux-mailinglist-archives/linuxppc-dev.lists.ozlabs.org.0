Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA58228D9D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 03:29:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBHtV2VJTzDqXZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 11:29:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c41;
 helo=mail-oo1-xc41.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PcltSdbG; dkim-atps=neutral
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBHrg3PWVzDqbC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 11:27:31 +1000 (AEST)
Received: by mail-oo1-xc41.google.com with SMTP id p26so104417oos.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 18:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HVECw+hrRyhlmc2Fuz5PodU1qKpA7TniMHv6ZEyCYL8=;
 b=PcltSdbGhlP+dB6jpCf/sR6lVDygFg4b6T1X8ycCM10NKUDsuS5hLRtmKsiBQlZEIs
 r3TQIEUuvegcg3tyYTwlI9ibx9rBuB2syET0H/rj+pMRw2cOC7qADwXQafQMe48nvdDl
 e4CyprtHmljGjcFE76muX+2bWopA3R6zElrS9m4Ui+SvsJhKViQ2lWSIs8E/Cw5JxWNW
 WBWOtHVyUWHldtfdGg6NJjZET7rL6LQhkFnB9PJmit/QAe6skQ0vp+OlwnIPO44AO2gr
 6PG9LHt35Eyld18TH06ohJVcE1ZZ9icNvPcPrLy+FqnmQlY3abRyiKTW9anUubTwLHM6
 Hwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HVECw+hrRyhlmc2Fuz5PodU1qKpA7TniMHv6ZEyCYL8=;
 b=aRcnVWtrtpn35+/yHyz1B72ZK+LSEcbw74xNdagkRGnVStV0HldqDtp0ZANsqacWo+
 rJP6syJBk6IhvMXG8JNTG83XMLIdFmKfyq2OSxXtB3Z2WTHFJad7WEYuav5PSTj6dZoK
 Fc6bfJ4WvxHj4Ifa0gdaSrSZkCaoa7UdMc2PnEnPz/kyeeJCX2SHbTuhND5q/edsWzhz
 IOkBt5dCMtHrM6MAHWTeIEnsLTN0WgavLdAnjIshQU4+yYym0TYW7ecEVa4JbWs6Yewo
 HV9i//5yf+XEyVww5H+E3GyvZfFxHpTApFQo6E8nbwi7ZrZFcYduqbwpWh8vNRfeXCdL
 8U7w==
X-Gm-Message-State: AOAM531dyqhelgC641W3HSLa+sT1H7X3VZO694jPh5sMCWj+gP196TQ/
 Jdr3W5o7emruTPC+gfxDpvvvLXuW4ano4YXZ5Nt5Cp7Yl30=
X-Google-Smtp-Source: ABdhPJxQ3P6dU6LR5zdzV7/+cjjRV8mLvN0JXNm00LF9yEkmR5+gd/EFUsUem28xl8mldIxVBxetC6Mk9+MAXuMkjbs=
X-Received: by 2002:a4a:3e48:: with SMTP id t69mr26470474oot.38.1595381247941; 
 Tue, 21 Jul 2020 18:27:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200525025923.19843-1-jniethe5@gmail.com>
 <20200525025923.19843-5-jniethe5@gmail.com>
In-Reply-To: <20200525025923.19843-5-jniethe5@gmail.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 22 Jul 2020 11:26:48 +1000
Message-ID: <CACzsE9pB_zOydiJOOyxwZhCSnAU6Hj-YD45P6uGTjmZLZmqzLA@mail.gmail.com>
Subject: Re: [PATCH 5/5] powerpc sstep: Add tests for Prefixed Add Immediate
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Alistair Popple <alistair@popple.id.au>,
 Balamuruhan S <bala24@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 25, 2020 at 1:00 PM Jordan Niethe <jniethe5@gmail.com> wrote:
>
> Use the existing support for testing compute type instructions to test
> Prefixed Add Immediate (paddi).  The R bit of the paddi instruction
> controls whether current instruction address is used. Add test cases for
> when R=1 and for R=0. paddi has a 34 bit immediate field formed by
> concatenating si0 and si1. Add tests for the extreme values of this
> field.
>
> Skip the paddi tests if ISA v3.1 is unsupported.
>
> Some of these test cases were added by Balamuruhan S.
>
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
>  arch/powerpc/lib/test_emulate_step.c          | 127 ++++++++++++++++++
>  .../lib/test_emulate_step_exec_instr.S        |   1 +
>  2 files changed, 128 insertions(+)
>
> diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
> index 579b5db80674..33a72b7d2764 100644
> --- a/arch/powerpc/lib/test_emulate_step.c
> +++ b/arch/powerpc/lib/test_emulate_step.c
> @@ -105,6 +105,13 @@
>                                         ___PPC_RA(a) | ___PPC_RB(b))
>  #define TEST_ADDC_DOT(t, a, b) ppc_inst(PPC_INST_ADDC | ___PPC_RT(t) |         \
>                                         ___PPC_RA(a) | ___PPC_RB(b) | 0x1)
> +#define TEST_PADDI(t, a, i, pr)        ppc_inst_prefix(PPC_PREFIX_MLS | __PPC_PRFX_R(pr) |     \
> +                                       IMM_H(i),                       \
> +                                       PPC_INST_ADDI |                 \
> +                                       ___PPC_RT(t) | ___PPC_RA(a) |   \
> +                                       IMM_L(i))
> +
> +
>
>  #define MAX_SUBTESTS   16
>
> @@ -699,6 +706,11 @@ struct compute_test {
>         } subtests[MAX_SUBTESTS + 1];
>  };
>
> +/* Extreme values for si0||si1 (the MLS:D-form 34 bit immediate field) */
> +#define SI_MIN BIT(33)
> +#define SI_MAX (BIT(33) - 1)
> +#define SI_UMAX (BIT(34) - 1)
> +
>  static struct compute_test compute_tests[] = {
>         {
>                 .mnemonic = "nop",
> @@ -1071,6 +1083,121 @@ static struct compute_test compute_tests[] = {
>                                 }
>                         }
>                 }
> +       },
> +       {
> +               .mnemonic = "paddi",
> +               .cpu_feature = CPU_FTR_ARCH_31,
> +               .subtests = {
> +                       {
> +                               .descr = "RA = LONG_MIN, SI = SI_MIN, R = 0",
> +                               .instr = TEST_PADDI(21, 22, SI_MIN, 0),
> +                               .regs = {
> +                                       .gpr[21] = 0,
> +                                       .gpr[22] = LONG_MIN,
> +                               }
> +                       },
> +                       {
> +                               .descr = "RA = LONG_MIN, SI = SI_MAX, R = 0",
> +                               .instr = TEST_PADDI(21, 22, SI_MAX, 0),
> +                               .regs = {
> +                                       .gpr[21] = 0,
> +                                       .gpr[22] = LONG_MIN,
> +                               }
> +                       },
> +                       {
> +                               .descr = "RA = LONG_MAX, SI = SI_MAX, R = 0",
> +                               .instr = TEST_PADDI(21, 22, SI_MAX, 0),
> +                               .regs = {
> +                                       .gpr[21] = 0,
> +                                       .gpr[22] = LONG_MAX,
> +                               }
> +                       },
> +                       {
> +                               .descr = "RA = ULONG_MAX, SI = SI_UMAX, R = 0",
> +                               .instr = TEST_PADDI(21, 22, SI_UMAX, 0),
> +                               .regs = {
> +                                       .gpr[21] = 0,
> +                                       .gpr[22] = ULONG_MAX,
> +                               }
> +                       },
> +                       {
> +                               .descr = "RA = ULONG_MAX, SI = 0x1, R = 0",
> +                               .instr = TEST_PADDI(21, 22, 0x1, 0),
> +                               .regs = {
> +                                       .gpr[21] = 0,
> +                                       .gpr[22] = ULONG_MAX,
> +                               }
> +                       },
> +                       {
> +                               .descr = "RA = INT_MIN, SI = SI_MIN, R = 0",
> +                               .instr = TEST_PADDI(21, 22, SI_MIN, 0),
> +                               .regs = {
> +                                       .gpr[21] = 0,
> +                                       .gpr[22] = INT_MIN,
> +                               }
> +                       },
> +                       {
> +                               .descr = "RA = INT_MIN, SI = SI_MAX, R = 0",
> +                               .instr = TEST_PADDI(21, 22, SI_MAX, 0),
> +                               .regs = {
> +                                       .gpr[21] = 0,
> +                                       .gpr[22] = INT_MIN,
> +                               }
> +                       },
> +                       {
> +                               .descr = "RA = INT_MAX, SI = SI_MAX, R = 0",
> +                               .instr = TEST_PADDI(21, 22, SI_MAX, 0),
> +                               .regs = {
> +                                       .gpr[21] = 0,
> +                                       .gpr[22] = INT_MAX,
> +                               }
> +                       },
> +                       {
> +                               .descr = "RA = UINT_MAX, SI = 0x1, R = 0",
> +                               .instr = TEST_PADDI(21, 22, 0x1, 0),
> +                               .regs = {
> +                                       .gpr[21] = 0,
> +                                       .gpr[22] = UINT_MAX,
> +                               }
> +                       },
> +                       {
> +                               .descr = "RA = UINT_MAX, SI = SI_MAX, R = 0",
> +                               .instr = TEST_PADDI(21, 22, SI_MAX, 0),
> +                               .regs = {
> +                                       .gpr[21] = 0,
> +                                       .gpr[22] = UINT_MAX,
> +                               }
> +                       },
> +                       {
> +                               .descr = "RA is r0, SI = SI_MIN, R = 0",
> +                               .instr = TEST_PADDI(21, 0, SI_MIN, 0),
> +                               .regs = {
> +                                       .gpr[21] = 0x0,
> +                               }
> +                       },
> +                       {
> +                               .descr = "RA = 0, SI = SI_MIN, R = 0",
> +                               .instr = TEST_PADDI(21, 22, SI_MIN, 0),
> +                               .regs = {
> +                                       .gpr[21] = 0x0,
> +                                       .gpr[22] = 0x0,
> +                               }
> +                       },
> +                       {
> +                               .descr = "RA is r0, SI = 0, R = 1",
> +                               .instr = TEST_PADDI(21, 0, 0, 1),
> +                               .regs = {
> +                                       .gpr[21] = 0,
> +                               }
> +                       },
> +                       {
> +                               .descr = "RA is r0, SI = SI_MIN, R = 1",
> +                               .instr = TEST_PADDI(21, 0, SI_MIN, 1),
> +                               .regs = {
> +                                       .gpr[21] = 0,
> +                               }
> +                       }
> +               }
>         }
>  };
>
> diff --git a/arch/powerpc/lib/test_emulate_step_exec_instr.S b/arch/powerpc/lib/test_emulate_step_exec_instr.S
> index 1580f34f4f4f..aef53ee77a43 100644
> --- a/arch/powerpc/lib/test_emulate_step_exec_instr.S
> +++ b/arch/powerpc/lib/test_emulate_step_exec_instr.S
> @@ -81,6 +81,7 @@ _GLOBAL(exec_instr)
>
>         /* Placeholder for the test instruction */
>  1:     nop
> +       nop
>         patch_site 1b patch__exec_instr
>
>         /*
> --
> 2.17.1
>

Because of the alignment requirements of prefixed instructions, the
noops to be patched need to be aligned.
mpe, want me to send a new version?
--- a/arch/powerpc/lib/test_emulate_step_exec_instr.S
+++ b/arch/powerpc/lib/test_emulate_step_exec_instr.S
@@ -80,6 +80,7 @@ _GLOBAL(exec_instr)
        REST_NVGPRS(r31)

        /* Placeholder for the test instruction */
+.align 6
 1:     nop
        nop
        patch_site 1b patch__exec_instr
