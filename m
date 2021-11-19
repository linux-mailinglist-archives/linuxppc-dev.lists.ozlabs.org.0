Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D17456DF3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 12:06:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwYkM68VWz3bjB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 22:06:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UPqdeme+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c;
 helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=UPqdeme+; dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwYjd4j6Bz2yw7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 22:05:23 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id o4so9070534pfp.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 03:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Tnz5m4M5XLqQY0u8jmzE/+M2RkxS8e9PEYzr1XVEzp4=;
 b=UPqdeme+SHhCzwWmOU5O+coPC46MYQj3FpnHnOiZn+7qIW5yWj22t1x3SCEVcp5/IP
 elDrY7q4N/iCV185zSTlJ1o0a+NXtBohi90B/aA6RGnt0YXmZSEfg77C1U9R0LxV4vy9
 hVYZm874Gd1O66rs13UTA+V64XjPuYPzxLZgiNV/r/ugjMQAes+fAzE9hA+BkMJAxcSf
 FF8fKZ0/U3Eh+8qIBQt0kXc7I5/sItBxO8S13DpoJ2bL8F/vZwp9kFqqahszGkY8yS0I
 f1rVD4Rg4+Ods0+4NCOUA4yWRzclQDbx2OZZmEhBKOoNeMFlCjj2lUUNTpOwaCkTAkRj
 Kaew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Tnz5m4M5XLqQY0u8jmzE/+M2RkxS8e9PEYzr1XVEzp4=;
 b=Xbx15wM23JZxBm8LQqxMJ0y5PKtcxSbs3MWqPTRrqWndVxT0sEawHCY49rMMZiRc8m
 BR+n9GbtcndYnnJFXxSTRhHcr3CDr5Sc4eWVqihVaUG3fhln6MWI1Svl9e7UYdS7rIoK
 XM/2gXPrHpnkfCYQBYnKE5KNepvR6aE+MYV36SKBItddTGF/44dvsmdT+OCj0q3xrJKq
 W7Q485VJOfJ2G79Ya9/uLx0zSkuznUoJRlFe7iBAYB+9+CttnmiXf0rzMujMd2xnT8Bp
 IbvSk722EyTkWiD76bNHfub0lQ67lw1o8W7H5XSSDxYI1sJuGDVwj3RXdMf5qy6DMf8W
 /hvQ==
X-Gm-Message-State: AOAM532DEdMKVI/2I0XSKBZ2t0a/ecN3R3YQa0vlbNiW+urZjMsT0Ynx
 dW/uuo8UoY/5fPI/zbmNuBWoOXQCimE=
X-Google-Smtp-Source: ABdhPJxxnsId111tih2eyQpexLFG4sh0uTCdciEkcHudOcg443IICPP0h40ga/bf9e6BLwuCsan9cg==
X-Received: by 2002:a05:6a00:2351:b0:47b:d092:d2e4 with SMTP id
 j17-20020a056a00235100b0047bd092d2e4mr61746584pfj.76.1637319920294; 
 Fri, 19 Nov 2021 03:05:20 -0800 (PST)
Received: from localhost (60-240-2-228.tpgi.com.au. [60.240.2.228])
 by smtp.gmail.com with ESMTPSA id b10sm2762715pfl.200.2021.11.19.03.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 03:05:19 -0800 (PST)
Date: Fri, 19 Nov 2021 21:05:13 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 3/4] powerpc/watchdog: Avoid holding wd_smp_lock over
 printk and smp_send_nmi_ipi
To: linuxppc-dev@lists.ozlabs.org
References: <20211110025056.2084347-1-npiggin@gmail.com>
 <20211110025056.2084347-4-npiggin@gmail.com>
In-Reply-To: <20211110025056.2084347-4-npiggin@gmail.com>
MIME-Version: 1.0
Message-Id: <1637318182.rnr0egthi4.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: Laurent Dufour <ldufour@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of November 10, 2021 12:50 pm:
> @@ -160,11 +187,26 @@ static void watchdog_smp_panic(int cpu, u64 tb)
>  		goto out;
>  	if (cpumask_test_cpu(cpu, &wd_smp_cpus_pending))
>  		goto out;
> -	if (cpumask_weight(&wd_smp_cpus_pending) =3D=3D 0)
> +	if (!wd_try_report())
>  		goto out;
> +	for_each_online_cpu(c) {
> +		if (!cpumask_test_cpu(c, &wd_smp_cpus_pending))
> +			continue;
> +		if (c =3D=3D cpu)
> +			continue; // should not happen
> +
> +		__cpumask_set_cpu(c, &wd_smp_cpus_ipi);
> +		if (set_cpu_stuck(c, tb))
> +			break;
> +	}
> +	if (cpumask_empty(&wd_smp_cpus_ipi)) {
> +		wd_end_reporting();
> +		goto out;
> +	}
> +	wd_smp_unlock(&flags);
> =20
>  	pr_emerg("CPU %d detected hard LOCKUP on other CPUs %*pbl\n",
> -		 cpu, cpumask_pr_args(&wd_smp_cpus_pending));
> +		 cpu, cpumask_pr_args(&wd_smp_cpus_ipi));
>  	pr_emerg("CPU %d TB:%lld, last SMP heartbeat TB:%lld (%lldms ago)\n",
>  		 cpu, tb, wd_smp_last_reset_tb,
>  		 tb_to_ns(tb - wd_smp_last_reset_tb) / 1000000);

Oops, this has a bug: wd_smp_last_reset_tb gets reset above by
set_cpu_stuck when all the stuck CPUs are taken out of the pending
mask, so this prints nonsense last-reset times.

I might just send out an updated series, because the fix has a slight
clash with the next patch. All I do is take a local copy of
wd_smp_last_reset_tb near the start of the function.

Thanks,
Nick
