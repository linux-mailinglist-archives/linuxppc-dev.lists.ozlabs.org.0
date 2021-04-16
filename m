Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DE6361AC1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 09:45:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM7Y246xGz3c1v
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 17:45:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=evsmI4HO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=evsmI4HO; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM7XX5ZwXz2yhf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 17:44:58 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id u7so11711327plr.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 00:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=t/id0wyOsCydqGS0W0OkKvZDNtBCnbXewdap74KCFaI=;
 b=evsmI4HOr1qq2ei5rTm0AzM9kMGdLwNrZVOzqVMe9YJNqdV4KE6n1OgxENyX6ROqRg
 0LPfWPCLj1rqirHVcLEKQt98R/otnIOOObLnLoHzMWV2Qglv1XoS7tGwYMO3XPrTUKlf
 3mvNYOwVybmowto3dok07kwWkVKUgGe9xxJo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=t/id0wyOsCydqGS0W0OkKvZDNtBCnbXewdap74KCFaI=;
 b=tVS1Dtnaw8oEsVB4XU7CJcZOvYxfhnjncxInBU7vzBJvB0eleJtn4SpTcms+T2ykT8
 7a+pm4X5JccezOuUxqnL2A00pQbbHNmGT1U+1W+SnjfOU3002+wOCKOSGkaeV/6oSHjq
 QUzquHH8tLZOqIb5alm8q/+0tHkKEH2WwkL+fzQTeWGnzT/LrQEly7waBp88BcO2jiqM
 pkIfFc8ePkAsr7ZQF53z0nN1qPzuPqJD9RBcEaOi3HjOwFn8qNIFLLzF8lUhQX0NxxYB
 1hEtLcv+VYGQ9VvqThPeMAfXHxPQPfYCX0yz1Fz6wgN9uf71CpPz6x+CWPyAiCOO200j
 4ZKg==
X-Gm-Message-State: AOAM531WCRhQdCctnQLg2mUOlSYLE1kGW4zHdlpACFXbWxr1ZQ3S2a4c
 CQh/kDULNwKp+V/w/lxBJKpRNQ==
X-Google-Smtp-Source: ABdhPJyO9GO4ANwRxneweRN1cyRwlum6KdXM9yjCH0cCY55PVeUsYcxZPRKvCOKYw/K3BaMxxNTMnw==
X-Received: by 2002:a17:90a:fa84:: with SMTP id
 cu4mr8452063pjb.2.1618559096458; 
 Fri, 16 Apr 2021 00:44:56 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-09c3-a49e-2955-78c6.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:9c3:a49e:2955:78c6])
 by smtp.gmail.com with ESMTPSA id k20sm4001348pfa.34.2021.04.16.00.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 00:44:55 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Sathvika Vasireddy <sathvika@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/2] powerpc/sstep: Add emulation support for
 =?utf-8?B?4oCYc2V0YuKAmQ==?= instruction
In-Reply-To: <767e53c4c27da024ca277e21ffcd0cff131f5c73.1618469454.git.sathvika@linux.vnet.ibm.com>
References: <cover.1618469454.git.sathvika@linux.vnet.ibm.com>
 <767e53c4c27da024ca277e21ffcd0cff131f5c73.1618469454.git.sathvika@linux.vnet.ibm.com>
Date: Fri, 16 Apr 2021 17:44:52 +1000
Message-ID: <875z0mfzbf.fsf@linkitivity.dja.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: naveen.n.rao@linux.ibm.com,
 Sathvika Vasireddy <sathvika@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sathvika Vasireddy <sathvika@linux.vnet.ibm.com> writes:

> This adds emulation support for the following instruction:
>    * Set Boolean (setb)
>
> Signed-off-by: Sathvika Vasireddy <sathvika@linux.vnet.ibm.com>
> ---
>  arch/powerpc/lib/sstep.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> index c6aebc149d14..263c613d7490 100644
> --- a/arch/powerpc/lib/sstep.c
> +++ b/arch/powerpc/lib/sstep.c
> @@ -1964,6 +1964,18 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>  			op->val = ~(regs->gpr[rd] | regs->gpr[rb]);
>  			goto logical_done;
>  
> +		case 128:	/* setb */
> +			if (!cpu_has_feature(CPU_FTR_ARCH_300))
> +				goto unknown_opcode;

Ok, if I've understood correctly...

> +			ra = ra & ~0x3;

This masks off the bits of RA that are not part of BTF:

ra is in [0, 31] which is [0b00000, 0b11111]
Then ~0x3 = ~0b00011
ra = ra & 0b11100

This gives us then,
ra = btf << 2; or
btf = ra >> 2;

Let's then check to see if your calculations read the right fields.

> +			if ((regs->ccr) & (1 << (31 - ra)))
> +				op->val = -1;
> +			else if ((regs->ccr) & (1 << (30 - ra)))
> +				op->val = 1;
> +			else
> +				op->val = 0;


CR field:      7    6    5    4    3    2    1    0
bit:          0123 0123 0123 0123 0123 0123 0123 0123
normal bit #: 0.....................................31
ibm bit #:   31.....................................0

If btf = 0, ra = 0, check normal bits 31 and 30, which are both in CR0.
CR field:      7    6    5    4    3    2    1    0
bit:          0123 0123 0123 0123 0123 0123 0123 0123
                                                   ^^

If btf = 7, ra = 0b11100 = 28, so check normal bits 31-28 and 30-28,
which are 3 and 2.

CR field:      7    6    5    4    3    2    1    0
bit:          0123 0123 0123 0123 0123 0123 0123 0123
                ^^

If btf = 3, ra = 0b01100 = 12, for normal bits 19 and 18:

CR field:      7    6    5    4    3    2    1    0
bit:          0123 0123 0123 0123 0123 0123 0123 0123
                                    ^^

So yes, your calculations, while I struggle to follow _how_ they work,
do in fact seem to work.

Checkpatch does have one complaint:

CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'regs->ccr'
#30: FILE: arch/powerpc/lib/sstep.c:1971:
+			if ((regs->ccr) & (1 << (31 - ra)))

I don't really mind the parenteses: I think you are safe to ignore
checkpatch here unless someone else complains :)

If you do end up respinning the patch, I think it would be good to make
the maths a bit clearer. I think it works because a left shift of 2 is
the same as multiplying by 4, but it would be easier to follow if you
used a temporary variable for btf.

However, I do think this is still worth adding to the kernel either way,
so:

Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel

> +			goto compute_done;
> +
>  		case 154:	/* prtyw */
>  			do_prty(regs, op, regs->gpr[rd], 32);
>  			goto logical_done_nocc;
> -- 
> 2.16.4
