Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB8734A0C4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 06:02:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F68wc0y0Nz3byp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 16:02:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=RgHOBF+k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=RgHOBF+k; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F68wC5cCvz30GW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 16:02:01 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id
 k23-20020a17090a5917b02901043e35ad4aso3675040pji.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 22:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=84A8v+XeV5JjctAqo2hL1ne0vjBbAMn02SlN4sIUtTI=;
 b=RgHOBF+khBCvUpDv9fwxSzb9KhH8POkjfc/UCYrp4IQf49XQ9hK92rGBNl5Fco8QuH
 Gw4HE4kDRGbE9czDNQUCOZDCJrPs3Xz2qcWoCVjqmWA3OAElRqxwgbvlaO/OQ214Y0m8
 wICOPF9sFTDw+gVYYR7iays4Y2eRKsZZIAIH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=84A8v+XeV5JjctAqo2hL1ne0vjBbAMn02SlN4sIUtTI=;
 b=O8XwkjBd1fBn9imc3WCKJcF+7+NqwwTpCxOFKMghmfBrzwt/h8CayeQuep4keNxmXG
 qtnAdy59aQVVYX+obod9c7/tQp4DlD9K8S3QoY52XX2SdjizvuShz9wTWxby6lSakKe0
 TgNAAhrN6s52823rv3XkOBu7/URNdAEmJcGJFqrIn6LSSkL5JHJOkUWzLZwh7UvovFAG
 fhN/YA/6Oclwhxxwk7veN2r80nU1w0/k1g4z33hWa3ZKPyWbfSGv65XUiIciZZM4o7dQ
 p6aj+FxOIgYdQcEIB7Bm8+flrR0cySYUpAqy7QGUgaBKlQc1Kn2d1J8UH9hjO4wX2BBe
 4CCg==
X-Gm-Message-State: AOAM532ZDxUn9Q/dxUwGURHFKJBxQ44P4FE8uE38GBjBix+7PUefncEP
 IqggLvb+GA79keRAqnFPBrbvDg==
X-Google-Smtp-Source: ABdhPJxIVQm36PfYBh29vXueHwbAY8gonhNwJLySxx9EckNwgFwv0t1rXFzDGRxhnNmQXO0nxP5YkQ==
X-Received: by 2002:a17:902:8b86:b029:e5:bef6:56b0 with SMTP id
 ay6-20020a1709028b86b02900e5bef656b0mr13263219plb.76.1616734918120; 
 Thu, 25 Mar 2021 22:01:58 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-39c5-e677-fdb8-5d64.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:39c5:e677:fdb8:5d64])
 by smtp.gmail.com with ESMTPSA id mm12sm6933345pjb.49.2021.03.25.22.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 22:01:57 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: YueHaibing <yuehaibing@huawei.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org
Subject: Re: [PATCH -next] powerpc/smp: Remove unused inline functions
In-Reply-To: <20210324140752.11320-1-yuehaibing@huawei.com>
References: <20210324140752.11320-1-yuehaibing@huawei.com>
Date: Fri, 26 Mar 2021 16:01:53 +1100
Message-ID: <877dlu8q4e.fsf@linkitivity.dja.id.au>
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
Cc: YueHaibing <yuehaibing@huawei.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

> commit 441c19c8a290 ("powerpc/kvm/book3s_hv: Rework the secondary inhibit code")
> left behind this, so can remove it.
>

Interesting: that commit removed some instances of
(un)inhibit_secondary_onlining, but it seems to have missed the ones for
the uni-processor case, which your patch removes. This seems like a good
change.

Checkpatch does have one small complaint about your commit message:

| WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
| #6: 
| commit 441c19c8a290 ("powerpc/kvm/book3s_hv: Rework the secondary inhibit code")

I don't think this warrants another revision, I think leaving the commit
name on one line makes sense.

Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel

> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  arch/powerpc/include/asm/smp.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
> index 7a13bc20f0a0..ad7129a19e8f 100644
> --- a/arch/powerpc/include/asm/smp.h
> +++ b/arch/powerpc/include/asm/smp.h
> @@ -189,8 +189,6 @@ extern void __cpu_die(unsigned int cpu);
>  #define hard_smp_processor_id()		get_hard_smp_processor_id(0)
>  #define smp_setup_cpu_maps()
>  #define thread_group_shares_l2  0
> -static inline void inhibit_secondary_onlining(void) {}
> -static inline void uninhibit_secondary_onlining(void) {}
>  static inline const struct cpumask *cpu_sibling_mask(int cpu)
>  {
>  	return cpumask_of(cpu);
> -- 
> 2.17.1
