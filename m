Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAB63A7557
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 05:43:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3vLG4R2Sz3c0L
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 13:43:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=m0x9I947;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2c;
 helo=mail-yb1-xb2c.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=m0x9I947; dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3vKq66XQz2yXS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 13:43:11 +1000 (AEST)
Received: by mail-yb1-xb2c.google.com with SMTP id e10so18467044ybb.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 20:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HWe2X0y0YUq0l4++qPnBz+nFUQIa1PU/QJq3rGd+Lnw=;
 b=m0x9I947UdRTN7gNTRJs0p0OmI0GR2AxRLR8J5RUVvjDtCzhqjsT9QpJIzvbRLH7Rl
 hG7XtWL2iyGBG/Ichpqx/05zZE4WmzNsh3iciij+L4w/w3j0yzqBmHmFhzOIoPmmDD7l
 ObgTfU/Q5MUP5woqy8TA47hpVNdNkY5eb7efUOjUIpQq/4g9tk7i69kiCDW3B3e7rdL8
 jhRYGy9zFuw7EzyLuxrNsAoW0FMIe7cT4anWCn+sa08tKYZe+J0XtlI94VefbyqXeG72
 PZF5Wi4Jw6DoMemUTKF96zyeXDoPnBpBkvpfyif/aLO8r3JBz7PQ6ES4qT/wk2ClQMsz
 NWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HWe2X0y0YUq0l4++qPnBz+nFUQIa1PU/QJq3rGd+Lnw=;
 b=K8O0u7SADh6ehYBfrx5ZfP2Y+EnAQFxo8j0/a/IGgppys0/0a44Kpsc4sUBxfbq7rW
 7KBWEPRt5bqr4Fpshn2dNi7BNb07Wc5nQp7DKdcNbbJJNK3NHAiHvbMlajgT2V/+aAGf
 6juLKmfChHOThhuoHjILtwoQulqFGXbbHJSQtt3f3gM4wqK74GhmO+V76W6TIvYCp+IO
 R3DL0toKzwN9LfUq0nZooSLlMQRqh2XBmo/4sy4QtmtXnTkagtmc35e+BIAT+HZC2p0C
 yQOkiFVwgencwYnGDdAK88ogiWjCLZFgp9QtaxEhddDdJYK58XMiPwC2BmZt0FP7AQcs
 ObdQ==
X-Gm-Message-State: AOAM530A5CUbjsoWGCKSX8d18EgS7LjNNaVFn3+8reZ4Sqarp88hnaEt
 PgKqiIOjjUHZLkjY9/rNFaU5fZTz3nMx3fS6hXQ=
X-Google-Smtp-Source: ABdhPJwbiq2FXxTUWAG8SH9UwxNtbpDSaUW3COawwr08aIRDEk92doET3EMlRoDB5iXodagSIEz3tO5jWpNPZZQdiDw=
X-Received: by 2002:a25:3103:: with SMTP id x3mr29191194ybx.8.1623728587324;
 Mon, 14 Jun 2021 20:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621516826.git.christophe.leroy@csgroup.eu>
 <d8425fb42a4adebc35b7509f121817eeb02fac31.1621516826.git.christophe.leroy@csgroup.eu>
In-Reply-To: <d8425fb42a4adebc35b7509f121817eeb02fac31.1621516826.git.christophe.leroy@csgroup.eu>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Tue, 15 Jun 2021 13:42:56 +1000
Message-ID: <CACzsE9pBMPnZsDwUZ9MWWMSgn5q2m9x_W9D3+d+Q3-s=-6DJjw@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] powerpc/lib/code-patching: Don't use struct
 'ppc_inst' for runnable code in tests.
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 20, 2021 at 11:50 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> 'struct ppc_inst' is meant to represent an instruction internally, it
> is not meant to dereference code in memory.
>
> For testing code patching, use patch_instruction() to properly
> write into memory the code to be tested.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/lib/code-patching.c | 95 ++++++++++++++++++--------------
>  1 file changed, 53 insertions(+), 42 deletions(-)
>
> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
> index 82f2c1edb498..508e9511ca96 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -422,9 +422,9 @@ static void __init test_branch_iform(void)
>  {
>         int err;
>         struct ppc_inst instr;
> -       unsigned long addr;
> -
> -       addr = (unsigned long)&instr;
> +       unsigned int tmp[2];
> +       struct ppc_inst *iptr = (struct ppc_inst *)tmp;
> +       unsigned long addr = (unsigned long)tmp;
>
>         /* The simplest case, branch to self, no flags */
>         check(instr_is_branch_iform(ppc_inst(0x48000000)));
> @@ -445,52 +445,57 @@ static void __init test_branch_iform(void)
>         check(!instr_is_branch_iform(ppc_inst(0x7bfffffd)));
>
>         /* Absolute branch to 0x100 */
> -       instr = ppc_inst(0x48000103);
> -       check(instr_is_branch_to_addr(&instr, 0x100));
> +       patch_instruction(iptr, ppc_inst(0x48000103));
> +       check(instr_is_branch_to_addr(iptr, 0x100));
>         /* Absolute branch to 0x420fc */
> -       instr = ppc_inst(0x480420ff);
> -       check(instr_is_branch_to_addr(&instr, 0x420fc));
> +       patch_instruction(iptr, ppc_inst(0x480420ff));
> +       check(instr_is_branch_to_addr(iptr, 0x420fc));
>         /* Maximum positive relative branch, + 20MB - 4B */
> -       instr = ppc_inst(0x49fffffc);
> -       check(instr_is_branch_to_addr(&instr, addr + 0x1FFFFFC));
> +       patch_instruction(iptr, ppc_inst(0x49fffffc));
> +       check(instr_is_branch_to_addr(iptr, addr + 0x1FFFFFC));
>         /* Smallest negative relative branch, - 4B */
> -       instr = ppc_inst(0x4bfffffc);
> -       check(instr_is_branch_to_addr(&instr, addr - 4));
> +       patch_instruction(iptr, ppc_inst(0x4bfffffc));
> +       check(instr_is_branch_to_addr(iptr, addr - 4));
>         /* Largest negative relative branch, - 32 MB */
> -       instr = ppc_inst(0x4a000000);
> -       check(instr_is_branch_to_addr(&instr, addr - 0x2000000));
> +       patch_instruction(iptr, ppc_inst(0x4a000000));
> +       check(instr_is_branch_to_addr(iptr, addr - 0x2000000));
>
>         /* Branch to self, with link */
> -       err = create_branch(&instr, &instr, addr, BRANCH_SET_LINK);
> -       check(instr_is_branch_to_addr(&instr, addr));
> +       err = create_branch(&instr, iptr, addr, BRANCH_SET_LINK);
> +       patch_instruction(iptr, instr);
> +       check(instr_is_branch_to_addr(iptr, addr));
>
>         /* Branch to self - 0x100, with link */
> -       err = create_branch(&instr, &instr, addr - 0x100, BRANCH_SET_LINK);
> -       check(instr_is_branch_to_addr(&instr, addr - 0x100));
> +       err = create_branch(&instr, iptr, addr - 0x100, BRANCH_SET_LINK);
> +       patch_instruction(iptr, instr);
> +       check(instr_is_branch_to_addr(iptr, addr - 0x100));
>
>         /* Branch to self + 0x100, no link */
> -       err = create_branch(&instr, &instr, addr + 0x100, 0);
> -       check(instr_is_branch_to_addr(&instr, addr + 0x100));
> +       err = create_branch(&instr, iptr, addr + 0x100, 0);
> +       patch_instruction(iptr, instr);
> +       check(instr_is_branch_to_addr(iptr, addr + 0x100));
>
>         /* Maximum relative negative offset, - 32 MB */
> -       err = create_branch(&instr, &instr, addr - 0x2000000, BRANCH_SET_LINK);
> -       check(instr_is_branch_to_addr(&instr, addr - 0x2000000));
> +       err = create_branch(&instr, iptr, addr - 0x2000000, BRANCH_SET_LINK);
> +       patch_instruction(iptr, instr);
> +       check(instr_is_branch_to_addr(iptr, addr - 0x2000000));
>
>         /* Out of range relative negative offset, - 32 MB + 4*/
> -       err = create_branch(&instr, &instr, addr - 0x2000004, BRANCH_SET_LINK);
> +       err = create_branch(&instr, iptr, addr - 0x2000004, BRANCH_SET_LINK);
>         check(err);
>
>         /* Out of range relative positive offset, + 32 MB */
> -       err = create_branch(&instr, &instr, addr + 0x2000000, BRANCH_SET_LINK);
> +       err = create_branch(&instr, iptr, addr + 0x2000000, BRANCH_SET_LINK);
>         check(err);
>
>         /* Unaligned target */
> -       err = create_branch(&instr, &instr, addr + 3, BRANCH_SET_LINK);
> +       err = create_branch(&instr, iptr, addr + 3, BRANCH_SET_LINK);
>         check(err);
>
>         /* Check flags are masked correctly */
> -       err = create_branch(&instr, &instr, addr, 0xFFFFFFFC);
> -       check(instr_is_branch_to_addr(&instr, addr));
> +       err = create_branch(&instr, iptr, addr, 0xFFFFFFFC);
> +       patch_instruction(iptr, instr);
> +       check(instr_is_branch_to_addr(iptr, addr));
>         check(ppc_inst_equal(instr, ppc_inst(0x48000000)));
>  }
>
> @@ -513,9 +518,10 @@ static void __init test_branch_bform(void)
>         int err;
>         unsigned long addr;
>         struct ppc_inst *iptr, instr;
> +       unsigned int tmp[2];
>         unsigned int flags;
>
> -       iptr = &instr;
> +       iptr = (struct ppc_inst *)tmp;
>         addr = (unsigned long)iptr;
>
>         /* The simplest case, branch to self, no flags */
> @@ -528,39 +534,43 @@ static void __init test_branch_bform(void)
>         check(!instr_is_branch_bform(ppc_inst(0x7bffffff)));
>
>         /* Absolute conditional branch to 0x100 */
> -       instr = ppc_inst(0x43ff0103);
> -       check(instr_is_branch_to_addr(&instr, 0x100));
> +       patch_instruction(iptr, ppc_inst(0x43ff0103));
> +       check(instr_is_branch_to_addr(iptr, 0x100));
>         /* Absolute conditional branch to 0x20fc */
> -       instr = ppc_inst(0x43ff20ff);
> -       check(instr_is_branch_to_addr(&instr, 0x20fc));
> +       patch_instruction(iptr, ppc_inst(0x43ff20ff));
> +       check(instr_is_branch_to_addr(iptr, 0x20fc));
>         /* Maximum positive relative conditional branch, + 32 KB - 4B */
> -       instr = ppc_inst(0x43ff7ffc);
> -       check(instr_is_branch_to_addr(&instr, addr + 0x7FFC));
> +       patch_instruction(iptr, ppc_inst(0x43ff7ffc));
> +       check(instr_is_branch_to_addr(iptr, addr + 0x7FFC));
>         /* Smallest negative relative conditional branch, - 4B */
> -       instr = ppc_inst(0x43fffffc);
> -       check(instr_is_branch_to_addr(&instr, addr - 4));
> +       patch_instruction(iptr, ppc_inst(0x43fffffc));
> +       check(instr_is_branch_to_addr(iptr, addr - 4));
>         /* Largest negative relative conditional branch, - 32 KB */
> -       instr = ppc_inst(0x43ff8000);
> -       check(instr_is_branch_to_addr(&instr, addr - 0x8000));
> +       patch_instruction(iptr, ppc_inst(0x43ff8000));
> +       check(instr_is_branch_to_addr(iptr, addr - 0x8000));
>
>         /* All condition code bits set & link */
>         flags = 0x3ff000 | BRANCH_SET_LINK;
>
>         /* Branch to self */
>         err = create_cond_branch(&instr, iptr, addr, flags);
> -       check(instr_is_branch_to_addr(&instr, addr));
> +       patch_instruction(iptr, instr);
> +       check(instr_is_branch_to_addr(iptr, addr));
>
>         /* Branch to self - 0x100 */
>         err = create_cond_branch(&instr, iptr, addr - 0x100, flags);
> -       check(instr_is_branch_to_addr(&instr, addr - 0x100));
> +       patch_instruction(iptr, instr);
> +       check(instr_is_branch_to_addr(iptr, addr - 0x100));
>
>         /* Branch to self + 0x100 */
>         err = create_cond_branch(&instr, iptr, addr + 0x100, flags);
> -       check(instr_is_branch_to_addr(&instr, addr + 0x100));
> +       patch_instruction(iptr, instr);
> +       check(instr_is_branch_to_addr(iptr, addr + 0x100));
>
>         /* Maximum relative negative offset, - 32 KB */
>         err = create_cond_branch(&instr, iptr, addr - 0x8000, flags);
> -       check(instr_is_branch_to_addr(&instr, addr - 0x8000));
> +       patch_instruction(iptr, instr);
> +       check(instr_is_branch_to_addr(iptr, addr - 0x8000));
>
>         /* Out of range relative negative offset, - 32 KB + 4*/
>         err = create_cond_branch(&instr, iptr, addr - 0x8004, flags);
> @@ -576,7 +586,8 @@ static void __init test_branch_bform(void)
>
>         /* Check flags are masked correctly */
>         err = create_cond_branch(&instr, iptr, addr, 0xFFFFFFFC);
> -       check(instr_is_branch_to_addr(&instr, addr));
> +       patch_instruction(iptr, instr);
> +       check(instr_is_branch_to_addr(iptr, addr));
>         check(ppc_inst_equal(instr, ppc_inst(0x43FF0000)));
>  }
>
> --
> 2.25.0
>
Reviewed by: Jordan Niethe <jniethe5@gmail.com>
