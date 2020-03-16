Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD5F186EFA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 16:47:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48h1032y1TzDqS9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 02:47:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=HC5iw9ns; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gxPN3bNHzDqLR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 00:05:43 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id u68so9903078pfb.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 06:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
 bh=S3ylSoSVkSVtheK/F1qvWvf0XZ/cN1+4cUsuDfSQPrg=;
 b=HC5iw9nsPFCCHJIQ4FigojhiQRRfcdyb6Qpgcbl9eWbw97vM6ByH1GNo0POUcLpnq8
 W2526eX+MuNa5a/YiPRQpKhHy989nZbvMYd0iQ068YzwHi/XfEMOAHswjNqJkdwQO/xa
 W0/LGixqd91m0pYY9vhfsXQG0Fssoiruwz8xI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=S3ylSoSVkSVtheK/F1qvWvf0XZ/cN1+4cUsuDfSQPrg=;
 b=MtYvpnAO6nPjm3jvRWx/2HI68h8GTfLRMQmUMCEvbU35BiieVHUaXW4G+41Z2QjNha
 zpy/MgD/1ELVq9r+e64ze3RjpomOYJBhQ5sqCMf5gROBiTHsavbj77JFth/4yUDGDNO+
 kTmb5L8Ux7z4CnsOsZpRS33vlrVjlzvEhkdEgQ42JQrIjR6j5Ji7anONVNSwnJ6so9BD
 nVE8WcNAPB20yqfo+0oyuFDMnJ/7Pppx8vkuz3ueQNxiif0KybGfoIxcM4sSraeBOXYw
 8qkg6a1SQfldH67EP1HsY5Qv2its+upyIIw/q/haioeHt8SzxB77s5LPfIDCmYZzC+sF
 82gw==
X-Gm-Message-State: ANhLgQ1dcnayiTcLDHy1yc4Wpdvybe77xr+M22dNzg4pw5yt/zoTYX+l
 tCY97+UcW6bfx/KDidlPFPRthg==
X-Google-Smtp-Source: ADFU+vte8YprRXpiosPh6oK8UzgBCXexYDX8dInWwsIZfEzpUDJTBrqtjf9QP5Ukzx4PTdYLK6yJpw==
X-Received: by 2002:a63:5506:: with SMTP id j6mr26894163pgb.43.1584363939827; 
 Mon, 16 Mar 2020 06:05:39 -0700 (PDT)
Received: from localhost
 (2001-44b8-1113-6700-789d-cd2c-42e1-23af.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:789d:cd2c:42e1:23af])
 by smtp.gmail.com with ESMTPSA id z15sm32281786pfg.152.2020.03.16.06.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 06:05:38 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Pratik Rajesh Sampat <psampat@linux.ibm.com>, linux-pm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 psampat@linux.ibm.com, pratik.r.sampat@gmail.com, ego@linux.vnet.ibm.com
Subject: Re: [PATCH] Fixes: 227942809b52 ("cpufreq: powernv: Restore cpu
 frequency to policy->cur on unthrottling")
In-Reply-To: <20200306110549.25517-1-psampat@linux.ibm.com>
References: <20200306110549.25517-1-psampat@linux.ibm.com>
Date: Tue, 17 Mar 2020 00:05:35 +1100
Message-ID: <87v9n4o3fk.fsf@dja-thinkpad.axtens.net>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Pratik,

Please could you resend this with a more meaningful subject line and
move the Fixes: line to immediately above your signed-off-by?

Thanks!

Regards,
Daniel

> The patch avoids allocating cpufreq_policy on stack hence fixing frame
> size overflow in 'powernv_cpufreq_work_fn'
>
> Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
> ---
>  drivers/cpufreq/powernv-cpufreq.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
> index 56f4bc0d209e..20ee0661555a 100644
> --- a/drivers/cpufreq/powernv-cpufreq.c
> +++ b/drivers/cpufreq/powernv-cpufreq.c
> @@ -902,6 +902,7 @@ static struct notifier_block powernv_cpufreq_reboot_nb = {
>  void powernv_cpufreq_work_fn(struct work_struct *work)
>  {
>  	struct chip *chip = container_of(work, struct chip, throttle);
> +	struct cpufreq_policy *policy;
>  	unsigned int cpu;
>  	cpumask_t mask;
>  
> @@ -916,12 +917,14 @@ void powernv_cpufreq_work_fn(struct work_struct *work)
>  	chip->restore = false;
>  	for_each_cpu(cpu, &mask) {
>  		int index;
> -		struct cpufreq_policy policy;
>  
> -		cpufreq_get_policy(&policy, cpu);
> -		index = cpufreq_table_find_index_c(&policy, policy.cur);
> -		powernv_cpufreq_target_index(&policy, index);
> -		cpumask_andnot(&mask, &mask, policy.cpus);
> +		policy = cpufreq_cpu_get(cpu);
> +		if (!policy)
> +			continue;
> +		index = cpufreq_table_find_index_c(policy, policy->cur);
> +		powernv_cpufreq_target_index(policy, index);
> +		cpumask_andnot(&mask, &mask, policy->cpus);
> +		cpufreq_cpu_put(policy);
>  	}
>  out:
>  	put_online_cpus();
> -- 
> 2.17.1
