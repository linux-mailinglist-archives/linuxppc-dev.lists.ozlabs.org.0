Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3E628B929
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 15:58:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C90d06F2hzDqZG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 00:58:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=i6WKsPqg; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C90KG0N16zDqFh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Oct 2020 00:44:33 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id n14so13547056pff.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Oct 2020 06:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=JVO7BM4liPODbMvZybShk9kUG4Gu+5T3+lghusytKic=;
 b=i6WKsPqgXmFIgN/wf/I5/sU3rUCFxp4PnlH5lV5oIaARcKa5Qo26uOUNHzR+uwpF8L
 0hDgOrjH2JQ+Xu+YssrUvSA3qmK8HD/DOkwzEyI+fccqOHkPmIa+nlIht9LUGXu1ihLA
 4W6ob9nHXqX0SNOfQqQdYxkvbg49csqR/lHa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=JVO7BM4liPODbMvZybShk9kUG4Gu+5T3+lghusytKic=;
 b=lnjQiRN+PSvpZlKfnRyN+zqN9cycEGDZF7mKgmarqOyFqnZnfK83HqGOub4u1k8f2+
 TkhMIxEPxOa2+ov/sGpavZgVawV/Sc7wn3/kz8/xs7y1MQ3mlenTixudq1Zg2aU0SA3k
 fanC6F5DmMqbFlhJK3+i/1Q5wjG+XJt49Kb6otGZjJ57p9OaFRvCtadSNaWKw0eriASz
 /jyOTcQWt71tb1rloCUl8I4g6Ia/HyKccEEWLeJBjq0uHaDdipi60aOpdsEI2aveZMCQ
 tqqte9cIERZRBctkcWZ8T0WjRuCy/d3tQOvOC2oFW4QjK4BsZk9aC2iNML414Fhxt07d
 yX7w==
X-Gm-Message-State: AOAM5328C51wf+BuWJNgIGZf8uEQHAnGHxAybu32+mhlFQxf5Ztc/UZi
 DG8FxUYV+YxPWMqfUhnWgNOyXw==
X-Google-Smtp-Source: ABdhPJzttQpQfEQykQ/3IKzWpnneq1hHE0v90amxbj6PjGQgy6a0aKrMQUXpCGBT6zVLSKR+k1ETrA==
X-Received: by 2002:a17:90a:c58f:: with SMTP id
 l15mr12618238pjt.93.1602510258667; 
 Mon, 12 Oct 2020 06:44:18 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-0872-db87-61b3-e44b.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:872:db87:61b3:e44b])
 by smtp.gmail.com with ESMTPSA id c3sm20068219pfn.23.2020.10.12.06.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 06:44:18 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au
Subject: Re: [PATCH v5 1/5] powerpc/sstep: Emulate prefixed instructions only
 when CPU_FTR_ARCH_31 is set
In-Reply-To: <20201011050908.72173-2-ravi.bangoria@linux.ibm.com>
References: <20201011050908.72173-1-ravi.bangoria@linux.ibm.com>
 <20201011050908.72173-2-ravi.bangoria@linux.ibm.com>
Date: Tue, 13 Oct 2020 00:44:14 +1100
Message-ID: <877drvwocx.fsf@dja-thinkpad.axtens.net>
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
Cc: ravi.bangoria@linux.ibm.com, jniethe5@gmail.com, bala24@linux.ibm.com,
 paulus@samba.org, sandipan@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

To review this, I looked through the supported instructions to see if
there were any that I thought might have been missed.

I didn't find any other v3.1 ones, although I don't have a v3.1 ISA to
hand so I was basically looking for instructions I didn't recognise.

I did, however, find a number of instructions that are new in ISA 3.0
that aren't guarded:

 - addpcis
 - lxvl/stxvl
 - lxvll/stxvll
 - lxvwsx
 - stxvx
 - lxsipzx
 - lxvh8x
 - lxsihzx
 - lxvb16x/stxvb16x
 - stxsibx
 - stxsihx
 - lxvb16x
 - lxsd/stxsd
 - lxssp/stxssp
 - lxv/stxv
 
Also, I don't know how bothered we are about P7, but if I'm reading the
ISA correctly, lqarx/stqcx. are not supported before ISA 2.07. Likewise
a number of the vector instructions like lxsiwzx and lxsiwax (and the
companion stores).

I realise it's not really the point of this particular patch, so I don't
think this should block acceptance. What I would like to know - and
maybe this is something where we need mpe to weigh in - is whether we
need consistent guards for 2.07 and 3.0. We have some 3.0 guards already
but clearly not everywhere.

With all that said - the patch does what it says it does, and looks good
to me:

Reviewed-by: Daniel Axtens <dja@axtens.net>


Kind regards,
Daniel

> From: Balamuruhan S <bala24@linux.ibm.com>
>
> Unconditional emulation of prefixed instructions will allow
> emulation of them on Power10 predecessors which might cause
> issues. Restrict that.
>
> Fixes: 3920742b92f5 ("powerpc sstep: Add support for prefixed fixed-point arithmetic")
> Fixes: 50b80a12e4cc ("powerpc sstep: Add support for prefixed load/stores")
> Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
>  arch/powerpc/lib/sstep.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> index e9dcaba9a4f8..e6242744c71b 100644
> --- a/arch/powerpc/lib/sstep.c
> +++ b/arch/powerpc/lib/sstep.c
> @@ -1346,6 +1346,9 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>  	switch (opcode) {
>  #ifdef __powerpc64__
>  	case 1:
> +		if (!cpu_has_feature(CPU_FTR_ARCH_31))
> +			return -1;
> +
>  		prefix_r = GET_PREFIX_R(word);
>  		ra = GET_PREFIX_RA(suffix);
>  		rd = (suffix >> 21) & 0x1f;
> @@ -2733,6 +2736,9 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>  		}
>  		break;
>  	case 1: /* Prefixed instructions */
> +		if (!cpu_has_feature(CPU_FTR_ARCH_31))
> +			return -1;
> +
>  		prefix_r = GET_PREFIX_R(word);
>  		ra = GET_PREFIX_RA(suffix);
>  		op->update_reg = ra;
> -- 
> 2.26.2
