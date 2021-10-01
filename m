Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA1141E772
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 08:20:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HLKjr6h1Mz2ywk
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 16:20:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=n+4Yv8WW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=n+4Yv8WW; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HLKjF1DbVz2ynG
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Oct 2021 16:20:15 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id 133so8533509pgb.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Sep 2021 23:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=t83ANQO/YI3Pa4t/bTD6U/Wf/KJXMhipCoO+zkK6Eh8=;
 b=n+4Yv8WWhCcs5C6z7B7zHUBND+hDTBNShZg8hO7kMz9N+jprBs3TUw7xJBtf7fCBYg
 C5+vcWdhEeO3gxEoZfzGDOF9KFv139Weex0vY05OBXRk30e63ZxXw3RcIwVJYHol03I6
 HeTU+eh4KNAeCF63579GvY0ZHe9AY0aWJ2kp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=t83ANQO/YI3Pa4t/bTD6U/Wf/KJXMhipCoO+zkK6Eh8=;
 b=F+aw3XgWYr07CzIgInGmoV0yoUzRrUn8P/PmPXfLOIH5mASQG83pxYT++LY0oVojYn
 anpVaF8Gu0uVW6Ic4oSsp0vjZgZ9SmKwsW+6nb93MttEC9dDjakL2rhD3x1+LK4qfWJV
 hxvzn/x77zQTmIoDBRttQnFt++xwYMyuQp+stTQAfE2gDHkNuDkaqQGUJ0UKmmFeDJk4
 ew5pesCceaqh0pUh8FIaaPYG8Xvvm2IELNouwGTXQ+wp9U7gLCkN/bRmcCNhL/sTijrH
 RlGRd8SPD5SxtlqrDEw+JFBDTAJdVIxiDlBQRbxOgjaSisKS0XqPFtJGy0g/UJMz8zEv
 hGaw==
X-Gm-Message-State: AOAM532ooGCmu2DCYyFZzvUWFJsXwrGrEWVt97NsvlIBR08FIyy0rvni
 /FLboryNPAOerv642QP7iugR4223pw0phQ==
X-Google-Smtp-Source: ABdhPJzxfMeU9XkGf7l4wrFyRjIDRgXg4AqS1v04eRQBvbTc+5XN6vuZX64ZFxR1k3+VdZwmKEMrmA==
X-Received: by 2002:a63:4c5c:: with SMTP id m28mr8210615pgl.67.1633069211993; 
 Thu, 30 Sep 2021 23:20:11 -0700 (PDT)
Received: from localhost ([2001:4479:e200:df00:c98c:9868:6328:c144])
 by smtp.gmail.com with ESMTPSA id k9sm4804170pfi.86.2021.09.30.23.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 23:20:11 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au,
 acme@kernel.org, jolsa@kernel.org
Subject: Re: [V2 2/4] tools/perf: Refactor the code definition of perf reg
 extended mask in tools side header file
In-Reply-To: <20210930122055.1390-3-atrajeev@linux.vnet.ibm.com>
References: <20210930122055.1390-1-atrajeev@linux.vnet.ibm.com>
 <20210930122055.1390-3-atrajeev@linux.vnet.ibm.com>
Date: Fri, 01 Oct 2021 16:20:08 +1000
Message-ID: <87o889mfl3.fsf@linkitivity.dja.id.au>
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

Hi Athira,

> PERF_REG_PMU_MASK_300 and PERF_REG_PMU_MASK_31 defines the mask
> value for extended registers. Current definition of these mask values
> uses hex constant and does not use registers by name, making it less
> readable. Patch refactor the macro values in perf tools side header file
> by or'ing together the actual register value constants.
>
This looks like a good simplification.

> -/* Exclude MMCR3, SIER2, SIER3 for CPU_FTR_ARCH_300 */
> -#define	PERF_EXCLUDE_REG_EXT_300	(7ULL << PERF_REG_POWERPC_MMCR3)

This file is uAPI - are we allowed to remove a define? Could a program
built against these headers now fail to compile because we've removed it?

> -
>  /*
>   * PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_300
>   * includes 9 SPRS from MMCR0 to PMC6 excluding the
> - * unsupported SPRS in PERF_EXCLUDE_REG_EXT_300.
> + * unsupported SPRS MMCR3, SIER2 and SIER3.
>   */
> -#define PERF_REG_PMU_MASK_300   ((0xfffULL << PERF_REG_POWERPC_MMCR0) - PERF_EXCLUDE_REG_EXT_300)
> +#define PERF_REG_PMU_MASK_300	\
> +	((1ul << PERF_REG_POWERPC_MMCR0) | (1ul << PERF_REG_POWERPC_MMCR1) | \
> +	(1ul << PERF_REG_POWERPC_MMCR2) | (1ul << PERF_REG_POWERPC_PMC1) | \
> +	(1ul << PERF_REG_POWERPC_PMC2) | (1ul << PERF_REG_POWERPC_PMC3) | \
> +	(1ul << PERF_REG_POWERPC_PMC4) | (1ul << PERF_REG_POWERPC_PMC5) | \
> +	(1ul << PERF_REG_POWERPC_PMC6))
>  
>  /*
>   * PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_31
>   * includes 12 SPRs from MMCR0 to PMC6.
>   */
> -#define PERF_REG_PMU_MASK_31   (0xfffULL << PERF_REG_POWERPC_MMCR0)
> +#define PERF_REG_PMU_MASK_31	\
> +	(PERF_REG_PMU_MASK_300 | (1ul << PERF_REG_POWERPC_MMCR3) | \
> +	(1ul << PERF_REG_POWERPC_SIER2) | (1ul << PERF_REG_POWERPC_SIER3))
>  
> -#define PERF_REG_EXTENDED_MAX  (PERF_REG_POWERPC_PMC6 + 1)

Likewise for this define?

I think this might also be an issue for some of your other patches which
change an include/uapi/ file.

Kind regards,
Daniel

> -- 
> 2.30.1 (Apple Git-130)
