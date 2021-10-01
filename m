Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E85B741E7AF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 08:41:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HLL9J5fZ5z3c5C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 16:41:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=duU1IJEN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=duU1IJEN; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HLL8d4c1wz2yHD
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Oct 2021 16:40:32 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id r2so8524574pgl.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Sep 2021 23:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=OhsbJgF5TzKiksMp3FofwHf6Nv7asvd5Rtw1kmMO2H8=;
 b=duU1IJENG/K7bezFSEKU0qwuCdIrmE6lHA1ksgy0KCmefV0mjXiXQlf13079FySS0k
 AiarWaN0yyT+gVOYWZX0W17PipgsiedBzv+CJDDOhvM6G2t5YWdQbUCFjyWQhxQ4D9OX
 YXWlZhqWxdcZ644ogOcm6Ntc1vrYiW72K5L8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=OhsbJgF5TzKiksMp3FofwHf6Nv7asvd5Rtw1kmMO2H8=;
 b=0MciU5ULcjmNAIAbjruuRTLOu0URjAEjtOwlDG2S5s5+rDPuMufFnHLm3FRBCa5v1R
 XnTgsXhz3CETkdwwkXz7hO2P9GfFlR3mSLVM5hsVD/RMOohbIcH/RcO67xsfek/SaJXv
 0ZSDiGDrNtvLO2PGD5gNpMVuQaSY92WlBgOB1BwzNZb4DvLAcUEuQe5fn3jFYWkJF5Gy
 UQ+SH7CdYI/H6BRlQ3UjeipKWjXrcSOEc2+OSb7KQSiZtxQ5sO7VqzNgm9nEiKn398Eh
 LXY/AZ+bTda75oe0VeWmojyb588ohIED/6dqtS0YEtCoScL6xowbPubGA+DOKjtBATSp
 fj0w==
X-Gm-Message-State: AOAM5301MLAFA+CorcTm4seF8fclqRyxku+/uLewmY/bhRBnoC5FUQEG
 bC/8GMkIa+t1IjVlHkKl8Tonjg==
X-Google-Smtp-Source: ABdhPJysgqA0xGhDIA4eCZjDojkALbjtX7+WvBkl3KXo/0qK8xId5WSXmS+uY0QYNHIyePrzRYeohg==
X-Received: by 2002:a63:5011:: with SMTP id e17mr8275110pgb.391.1633070429850; 
 Thu, 30 Sep 2021 23:40:29 -0700 (PDT)
Received: from localhost ([2001:4479:e200:df00:c98c:9868:6328:c144])
 by smtp.gmail.com with ESMTPSA id r5sm4354950pjd.13.2021.09.30.23.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 23:40:29 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au,
 acme@kernel.org, jolsa@kernel.org
Subject: Re: [V2 3/4] powerpc/perf: Expose instruction and data address
 registers as part of extended regs
In-Reply-To: <20210930122055.1390-4-atrajeev@linux.vnet.ibm.com>
References: <20210930122055.1390-1-atrajeev@linux.vnet.ibm.com>
 <20210930122055.1390-4-atrajeev@linux.vnet.ibm.com>
Date: Fri, 01 Oct 2021 16:40:26 +1000
Message-ID: <87lf3dmen9.fsf@linkitivity.dja.id.au>
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
Cc: kjain@linux.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:

> Patch adds support to include Sampled Instruction Address Register

This is a nit and doesn't require a new revision, but I think this
should read "Include Sampled Instruction Address ...", not "Patch adds
support to include Sampled Instruction ..." - see
https://www.kernel.org/doc/html/v5.11/process/submitting-patches.html#describe-your-changes

> (SIAR) and Sampled Data Address Register (SDAR) SPRs as part of extended
> registers. Update the definition of PERF_REG_PMU_MASK_300/31 and
> PERF_REG_EXTENDED_MAX to include these SPR's.

> diff --git a/arch/powerpc/perf/perf_regs.c b/arch/powerpc/perf/perf_regs.c
> index b931eed482c9..51d31b65e423 100644
> --- a/arch/powerpc/perf/perf_regs.c
> +++ b/arch/powerpc/perf/perf_regs.c
> @@ -90,7 +90,11 @@ static u64 get_ext_regs_value(int idx)
>  		return mfspr(SPRN_SIER2);
>  	case PERF_REG_POWERPC_SIER3:
>  		return mfspr(SPRN_SIER3);
> +	case PERF_REG_POWERPC_SDAR:
> +		return mfspr(SPRN_SDAR);
>  #endif
> +	case PERF_REG_POWERPC_SIAR:
> +		return mfspr(SPRN_SIAR);

I was initially confused about why SIAR was outside the CONFIG_PPC64
block and SDAR was inside. But it turns out that SIAR is also defined
for a 32 bit platform, so that makes sense.

I'm not an expert on how the perf subsystem works, but this all seems
consistent with the surrounding code and it seems to do what the commit
message says, so on that limited basis:

Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel
