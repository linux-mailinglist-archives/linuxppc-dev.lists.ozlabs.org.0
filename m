Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DA9204494
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 01:43:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rQvy0cHqzDqWT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 09:43:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dfGXd5Rn; dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rQtY30ypzDqVL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 09:42:13 +1000 (AEST)
Received: by mail-ot1-x344.google.com with SMTP id u23so14722398otq.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 16:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zKedU2InA2bYpJGCjaPN37wqKYHS1NDNKZTxidwVtYY=;
 b=dfGXd5RnEtgj0IGXR33XFgiGKa+DkH+VW2JP5AyywhHL1qnlBdlsgvoVa2Jod4JHA8
 jFkJzulffCyBQ5AadZFGFdvZfX6H2BMnD/27e50hj8yRZWtmw14nqmoVJIrDmGCdblu7
 HZEdxm5iYWs9Y963jQN3qFz0nwNR33SYPXSg7zcY6zb8wYam2RJs9e/VOHslH8UF3aSM
 j59oJKzKXWQYrP47tpoK9s2BjBLd5b2UrXIt2MEReJZ7MJWy3WnnSIW2gGORnvIUYJ7r
 60bOi/qgy4YF0Apt3Kj9ru/yifSb+HYhiUbFLFVdu7c5NloQkYUE4JyM+qCmfPCaerGe
 KYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zKedU2InA2bYpJGCjaPN37wqKYHS1NDNKZTxidwVtYY=;
 b=TpuzkCRPpnADB4gFjnsJZ08FWCoKXOkhk5vUMVVYfb6UpM+VOKO2ylrsfsf7Pwn+2C
 O7/gH9lMay+AcNENdhhQmEjjecwI/NOiFFlHytW5ygVkegkXwgANIABFHor6+fEel88u
 LZ4pkyKry/75r5EF3gS2XrKYsLQdz4N1hKbKimZTZT1GWLsAh1sQZ7NUZ9ycuU/2jYqn
 2kJSw/Aa+VZDixwP7lkmdzIg7rDqkAXHOkssZP+DwdNgW6PoTIg9TBaVuze8YXEUu1LA
 V+0mLZWxTrTYHvNNwsY8EjKvrhnDKVRydUnAQ41Z5lfFcvleY6Ok2v/ScwPSuQsolox8
 gaAA==
X-Gm-Message-State: AOAM531Tvc2ZjMhbn1o/mjNwQGiWwCE+gdXMUXDl2RG5Bz1cSw/ri8wX
 OKvFKe66B0r6NQFD7rETGAkP0rHN3kGH9UCNr5M=
X-Google-Smtp-Source: ABdhPJxo+eNMU+GExwCaychRIwMtEWi14GvJPCbft+Ag57zS1GAynRC1VhFuQFkZhqEc02i7l1FDS3tFRN2Dq960LPE=
X-Received: by 2002:a05:6830:18f1:: with SMTP id
 d17mr15812764otf.51.1592869330068; 
 Mon, 22 Jun 2020 16:42:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200622070941.759307-1-bala24@linux.ibm.com>
 <20200622070941.759307-2-bala24@linux.ibm.com>
In-Reply-To: <20200622070941.759307-2-bala24@linux.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Tue, 23 Jun 2020 09:41:58 +1000
Message-ID: <CACzsE9ojAOLqbma3T-tBdsGKA8v1+vmz8zByOg3nkEmfa_WkjQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] powerpc test_emulate_step: update nip with patched
 instruction address
To: Balamuruhan S <bala24@linux.ibm.com>
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
Cc: ravi.bangoria@linux.ibm.com, Paul Mackerras <paulus@samba.org>,
 sandipan@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 22, 2020 at 5:10 PM Balamuruhan S <bala24@linux.ibm.com> wrote:
>
> pt_regs are initialized to zero in the test infrastructure, R bit
> in prefixed instruction form is used to specify whether the effective
> address of the storage operand is computed relative to the address
> of the instruction.
>
> If R = 1 and RA = R0|0, the sum of the address of the instruction
> and the value SI is placed into register RT. So to assert the emulated
> instruction with executed instruction, update nip of emulated pt_regs.
>
> Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
> ---
>  arch/powerpc/lib/test_emulate_step.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
> index 33a72b7d2764..d5902b7b4e5c 100644
> --- a/arch/powerpc/lib/test_emulate_step.c
> +++ b/arch/powerpc/lib/test_emulate_step.c
> @@ -1204,13 +1204,24 @@ static struct compute_test compute_tests[] = {
>  static int __init emulate_compute_instr(struct pt_regs *regs,
>                                         struct ppc_inst instr)
>  {
> +       int prefix_r, ra;
>         extern s32 patch__exec_instr;
>         struct instruction_op op;
>
>         if (!regs || !ppc_inst_val(instr))
>                 return -EINVAL;
>
> -       regs->nip = patch_site_addr(&patch__exec_instr);
Is there any harm in just always setting the NIP like this instead of
only setting it for relative prefixed instructions?
> +       /*
> +        * If R=1 and RA=0 in Prefixed instruction form, calculate the address
> +        * of the instruction and update nip to assert with executed
> +        * instruction
> +        */
> +       if (ppc_inst_prefixed(instr)) {
> +               prefix_r = ppc_inst_val(instr) & (1UL << 20);
> +               ra = (ppc_inst_suffix(instr) >> 16) & 0x1f;
> +               if (prefix_r && !ra)
> +                       regs->nip = patch_site_addr(&patch__exec_instr);
> +       }
>
>         if (analyse_instr(&op, regs, instr) != 1 ||
>             GETTYPE(op.type) != COMPUTE) {
> --
> 2.24.1
>
