Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 141431B5465
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 07:49:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4975wW1HDvzDr0v
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 15:49:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=rashmica.g@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hwmGu1bA; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4975tK6l6CzDqxf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Apr 2020 15:47:37 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id a5so1989221pjh.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 22:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=18vmrg2mKejteSFfyw9ZypC+PkZC+D+Fqw9VaHwtAfg=;
 b=hwmGu1bArZyLGkaVN/CaRoPEa9Gd/qBuayRO7O6nsr2ICbyHFncgSK9acbIGfpKWai
 DuFuJCfDTfJVybU1lLs/usWcoNFNLaMtFoZa5nTxGfz6JNaGY3txKqLZfvs57yAxAirX
 gA04hfSJRMAzV+G1Bo53QMBIMCKIzSuSvgujNxyVZnm/hXAmh75zoIY4Ai0WNnVqThZw
 wQf94ypmwlDsRFBGgIRcaCmkZJCwAodase+YZqTaqLaGmHNtxXzm0woEfYqv56BaEHpd
 NHnHtf9opkWQyAeYCrKLVSj4/SaK4PU835NLuQIlGwEGnpVdmmgkHZ+ZDBXHlRAXhnRD
 N+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=18vmrg2mKejteSFfyw9ZypC+PkZC+D+Fqw9VaHwtAfg=;
 b=PIx2098Zp8o8BuS/YHEAXwIXqrNk+zOqXqmRIf9AUVy0FzQ0HH6/rwNzSophHuxhM3
 21Zg74Uml2z7ss45gOfrXal+r0eiAEFhdRJNN5qEf2udVWoptIHdn/fNY8fK7kBqMNdj
 hman8qC2Ras1M0AKPmuWPDtvUACFt5GkJ2m5WpmAAI/hS6LcAGdJZob+HTK49Q6MdJB4
 cUuwpfKd69ukqF8hTmwOnyAU/p+wpiJmVW183B050k80XdyizsyBZ5DFHilmU5Ko8C0T
 Cr1Gctn1r122s1iFj26KP3TKm9A/EJgxJqI76QD+pzfkAcrl5LSTBCU2x/Goxx7HSUVv
 WHww==
X-Gm-Message-State: AGi0PuZ/pgOxeTOF3b21CTBimJKoN/P/qCRUW6S8LMBTz5tdZ7qdqe/F
 JbYa2IGXgFD4p1N6QAPIu7s=
X-Google-Smtp-Source: APiQypLWxMWRvTfsjTb4Vjo3G3/lt4Q/CqxqndzwbZ+CrtbxTQbGb3HZ6V5jTW20y8TeKaJHSkcrXA==
X-Received: by 2002:a17:90a:aa84:: with SMTP id
 l4mr2486270pjq.177.1587620853986; 
 Wed, 22 Apr 2020 22:47:33 -0700 (PDT)
Received: from rashmica (150.24.220.111.sta.wbroadband.net.au.
 [111.220.24.150])
 by smtp.googlemail.com with ESMTPSA id o1sm1051763pjs.35.2020.04.22.22.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 22:47:33 -0700 (PDT)
Message-ID: <c09a79e930c6ef1b5a2c8464614c619d2df07323.camel@gmail.com>
Subject: Re: [PATCH, RESEND, 2/3] selftests/powerpc: enable performance
 alerts when freezing counters on cycles_with_freeze_test selftest
From: Rashmica Gupta <rashmica.g@gmail.com>
To: "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>, 
 linuxppc-dev@lists.ozlabs.org
Date: Thu, 23 Apr 2020 15:47:28 +1000
In-Reply-To: <20200408223543.21168-3-desnesn@linux.ibm.com>
References: <20200408223543.21168-1-desnesn@linux.ibm.com>
 <20200408223543.21168-3-desnesn@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: shuah@kernel.org, gromero@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-04-08 at 19:35 -0300, Desnes A. Nunes do Rosario wrote:
> From: Gustavo Romero <gromero@linux.ibm.com>
> 
> When disabling freezing counters by setting MMCR0 FC bit to 0, the
> MMCR0
> PMAE bit must also be enabled if a Performance Monitor Alert (and the
> cor-
> responding Performance Monitor Interrupt) is still desired to be
> received
> when an enabled condition or event occurs.
> 
> This is the case of the cycles_with_freeze_test selftest, since the
> test
> disables the MMCR0 PMAE due to the usage of PMU to trigger EBBs. This
> can
> make the test loop up to the point of being killed by the test
> harness
> timeout (2500 ms), since no other ebb event will happen because the
> MMCR0
> PMAE bit is disabled, and thus, no more increments to ebb_count
> occur.
> 
> Fixes: 3752e453f6bafd7 ("selftests/powerpc: Add tests of PMU EBBs")
> Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
> [desnesn: Only set MMCR0_PMAE when disabling MMCR0_FC, reflow
> comment]
> Signed-off-by: Desnes A. Nunes do Rosario <desnesn@linux.ibm.com>

Reviewed and Tested-by: Rashmica Gupta <rashmica.g@gmail.com>

> ---
>  .../testing/selftests/powerpc/pmu/ebb/cycles_with_freeze_test.c | 2
> +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git
> a/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_freeze_test.c
> b/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_freeze_test.c
> index 0f2089f6f82c..d368199144fb 100644
> ---
> a/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_freeze_test.c
> +++
> b/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_freeze_test.c
> @@ -81,7 +81,7 @@ int cycles_with_freeze(void)
>  	{
>  		counters_frozen = false;
>  		mb();
> -		mtspr(SPRN_MMCR0, mfspr(SPRN_MMCR0) & ~MMCR0_FC);
> +		mtspr(SPRN_MMCR0, (mfspr(SPRN_MMCR0) & ~MMCR0_FC) |
> MMCR0_PMAE);
>  
>  		FAIL_IF(core_busy_loop());
>  

