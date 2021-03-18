Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE21934029D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 11:00:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1Mvt52psz3c4n
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 21:00:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=YC1aUkGo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f30;
 helo=mail-qv1-xf30.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YC1aUkGo; dkim-atps=neutral
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1MvM6lLHz2yYj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 20:59:43 +1100 (AEDT)
Received: by mail-qv1-xf30.google.com with SMTP id t16so2854146qvr.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 02:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=C5R1KruOsAZrxK3FVsjPPmorNYvhqEReCXUX94+e6Dg=;
 b=YC1aUkGoXzwlIxqkR0DRiTbbHtXbBXMnJHxTFZf0UoIuf1gcb/jaXfZrbS0LKbvZoN
 g1rDiRawfX99MGjGtEno+GwP25/UEcpZmal5fVf973N3KUCsGLzLn2/LzbaXXejfr5Xr
 yC/kttEvRGmbdQa8EVRuS5ieHksN7TQ+PsBjlVJyDyfkoZn2atIfKMJct7hGmeu2y2a4
 1YIM23RnKb7MXq33oy5AM+ITB4/GtNsZbISo2K9yt45MG2TOjjT/BplQDOwPQXDa8m3m
 lq1v9ODgJmXVYoioNnuRzEK8OkCDVaYrkgjLvN9ng3vc7xyl4cfumZ3Nq2afsEIWrhn5
 XQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C5R1KruOsAZrxK3FVsjPPmorNYvhqEReCXUX94+e6Dg=;
 b=I+RT81lmVrHdjiaHfHCndZ8NLQu/8kX60HKS/Yu55asy5oppwt+4rsbiO+igkJHj6b
 l14itM4u5T6yPjNuBdTZkRyAlw31XWVxnABfJrBx6OZmD/y64mAfPOOrBqKV75CMF718
 Nh/JU1bfzQnEc+KxJqKmrxFjwVpoNGknJePuSnhruowfmIE9wH6Slcz+1Z6dnyAMbq7m
 blp2S+cszuGK7m6kM3bSyrAR+WseAZM1gf9ORHLx9wzLmRAX65jU62FyQB052u9FY8Qx
 EKP5Gw27/TgYw13rN+VVJx6yl80cFRt4GeLA9R4/uELuEm0V0Qz+wLvPNEqp3yGV0jgs
 CaLQ==
X-Gm-Message-State: AOAM531ST+i3DlfbtmBVbyLdz/z7Japmd355Q5KZrzdsnnPy+ESspiLi
 98cwNvpOi7D+TliZC+5M54Frzmd01wc=
X-Google-Smtp-Source: ABdhPJz63cDC/OS47Q6PhtOLQqwGRWfA+yJUpr1xI/ZQ2QN4Bjh42ngnSyqMvM1AcFi8S1eB5ZysJQ==
X-Received: by 2002:ad4:4ae9:: with SMTP id cp9mr3484455qvb.20.1616061581329; 
 Thu, 18 Mar 2021 02:59:41 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c7:cc80:21a:fa87:b9b8:5376?
 ([2804:431:c7c7:cc80:21a:fa87:b9b8:5376])
 by smtp.gmail.com with ESMTPSA id p66sm1394706qka.108.2021.03.18.02.59.40
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 02:59:41 -0700 (PDT)
Subject: Re: [PATCH 1/1] hotplug-cpu.c: show 'last online CPU' error in
 dlpar_cpu_remove()
To: linuxppc-dev@lists.ozlabs.org
References: <20210305173845.451158-1-danielhb413@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <c2fdbf4e-995b-fec8-7dc3-41beb7d66daa@gmail.com>
Date: Thu, 18 Mar 2021 06:59:39 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210305173845.451158-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ping

On 3/5/21 2:38 PM, Daniel Henrique Barboza wrote:
> Of all the reasons that dlpar_cpu_remove() can fail, the 'last online
> CPU' is one that can be caused directly by the user offlining CPUs
> in a partition/virtual machine that has hotplugged CPUs. Trying to
> reclaim a hotplugged CPU can fail if the CPU is now the last online in
> the system. This is easily reproduced using QEMU [1].
> 
> Throwing a more specific error message for this case, instead of just
> "Failed to offline CPU", makes it clearer that the error is in fact a
> known error situation instead of other generic/unknown cause.
> 
> [1] https://bugzilla.redhat.com/1911414
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   arch/powerpc/platforms/pseries/hotplug-cpu.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> index 12cbffd3c2e3..134f393f09e1 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> @@ -514,7 +514,17 @@ static ssize_t dlpar_cpu_remove(struct device_node *dn, u32 drc_index)
>   
>   	rc = dlpar_offline_cpu(dn);
>   	if (rc) {
> -		pr_warn("Failed to offline CPU %pOFn, rc: %d\n", dn, rc);
> +		/* dlpar_offline_cpu will return -EBUSY from cpu_down() (via
> +		 * device_offline()) in 2 cases: cpu_hotplug_disable is true or
> +		 * there is only one CPU left. Warn the user about the second
> +		 * since this can happen with user offlining CPUs and then
> +		 * attempting hotunplugs.
> +		 */
> +		if (rc == -EBUSY && num_online_cpus() == 1)
> +			pr_warn("Unable to remove last online CPU %pOFn\n", dn);
> +		else
> +			pr_warn("Failed to offline CPU %pOFn, rc: %d\n", dn, rc);
> +
>   		return -EINVAL;
>   	}
>   
> 
