Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CC616F85E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 08:12:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S6Sf5yYrzDqN3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 18:12:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tepxN7HD; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S6Qq0rJvzDqGJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 18:10:57 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id i19so989652pfa.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 23:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=E0aDjSE2BGtXC8YCZ7oyFu3g1pmL14o1MCGs4c8gip4=;
 b=tepxN7HDloy39atap7fBycJwe6uX/1aKu+i47ujuk6tvCpA8Ac9r0UlV8jlsqzx/Bk
 33IL337E5RZb9avYU+vjEY/+nesR0ZJF49LMnNumZ91sqP2Nx0DC3Cqq+jQhmTGNBFhM
 96CWnZABnyATKn0NKoy04mCzXCSmjLmngeeX52Uf14IDa4b8L4p7IxtOkufW2SQ9VkYC
 6e5rTYCkyocoKym9YC1VHTuXA7K8JkG5U9sMDtrZA8iAtrpciPpDs6a6EC6UvdiVN5yo
 497aRoAoOAwvq+1gR1MQUQjFOuxiPnTARf4tYUN2aau5SfOmSiV9JCZRzvHPvwjaZhCA
 98rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=E0aDjSE2BGtXC8YCZ7oyFu3g1pmL14o1MCGs4c8gip4=;
 b=tcm1c0vFnfFMRh82Cn+/J1iziK/834hpFIMiHv8IlkHULoILEWiK+6Sq5aonrcpVZj
 wXEHagA7GrYXf64O84iR2oomya8VGEeAH/jZKAhwgshQwBgOcPSNKMcz1n4yp5dzI6st
 33TR/MlQdrXQ6443ygfQ4R0E6KyPyEhCOVXPJ34O5shwVoN9vVOBd30aVZewX+JgPumN
 AKzcMTseoK10MsX44u2JgDyBYyv8s5leBhaDqAV01Ss34kri7xI6gvtcITEEtGbfiTky
 FT9OL922hcg/PD80g54O3ALlh5SASdCccNGh0fDN3E6/vrSeX0Qf8oI9Dv2+ccp9sw+2
 4chw==
X-Gm-Message-State: APjAAAV1eDlRaxpbkoJt6UXBP2+K0tkRp+vHpRolhAW2ZAtppV9lipz6
 9QcRBNNAhe4rKExrUziVLok=
X-Google-Smtp-Source: APXvYqxU6ehv1X649r3mjEu+J/UUah0De1vd9gNKNmfxEBq7qqwvM8Q5zNEdwOOTaHt/zUQAvbcVZQ==
X-Received: by 2002:a62:e708:: with SMTP id s8mr2934657pfh.122.1582701055277; 
 Tue, 25 Feb 2020 23:10:55 -0800 (PST)
Received: from localhost ([61.68.187.74])
 by smtp.gmail.com with ESMTPSA id i2sm1330307pjs.21.2020.02.25.23.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 23:10:54 -0800 (PST)
Date: Wed, 26 Feb 2020 17:06:43 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 09/14] powerpc/xmon: Add initial support for prefixed
 instructions
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200226040716.32395-1-jniethe5@gmail.com>
 <20200226040716.32395-10-jniethe5@gmail.com>
In-Reply-To: <20200226040716.32395-10-jniethe5@gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1582700457.bqyiezlzr9.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: alistair@popple.id.au, dja@axtens.net, bala24@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe's on February 26, 2020 2:07 pm:
> A prefixed instruction is composed of a word prefix and a word suffix.
> It does not make sense to be able to have a breakpoint on the suffix of
> a prefixed instruction, so make this impossible.
>=20
> When leaving xmon_core() we check to see if we are currently at a
> breakpoint. If this is the case, the breakpoint needs to be proceeded
> from. Initially emulate_step() is tried, but if this fails then we need
> to execute the saved instruction out of line. The NIP is set to the
> address of bpt::instr[] for the current breakpoint.  bpt::instr[]
> contains the instruction replaced by the breakpoint, followed by a trap
> instruction.  After bpt::instr[0] is executed and we hit the trap we
> enter back into xmon_bpt(). We know that if we got here and the offset
> indicates we are at bpt::instr[1] then we have just executed out of line
> so we can put the NIP back to the instruction after the breakpoint
> location and continue on.
>=20
> Adding prefixed instructions complicates this as the bpt::instr[1] needs
> to be used to hold the suffix. To deal with this make bpt::instr[] big
> enough for three word instructions.  bpt::instr[2] contains the trap,
> and in the case of word instructions pad bpt::instr[1] with a noop.
>=20
> No support for disassembling prefixed instructions.
>=20
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v2: Rename sufx to suffix
> v3: - Just directly use PPC_INST_NOP
>     - Typo: plac -> place
>     - Rename read_inst() to mread_inst(). Do not have it call mread().
> ---
>  arch/powerpc/xmon/xmon.c | 90 ++++++++++++++++++++++++++++++++++------
>  1 file changed, 78 insertions(+), 12 deletions(-)
>=20
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index a673cf55641c..a73a35aa4a75 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -97,7 +97,8 @@ static long *xmon_fault_jmp[NR_CPUS];
>  /* Breakpoint stuff */
>  struct bpt {
>  	unsigned long	address;
> -	unsigned int	instr[2];
> +	/* Prefixed instructions can not cross 64-byte boundaries */
> +	unsigned int	instr[3] __aligned(64);

This is pretty wild, I didn't realize xmon executes breakpoints out
of line like this.

IMO the break point entries here should correspond with a range of
reserved bytes in .text so we patch instructions into normal executable
pages rather than .data.

Anyway that's for patch.

Thanks,
Nick
=
