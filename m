Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BF561C02
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 10:57:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45hzqC2ZlSzDqVq
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 18:57:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=viresh.kumar@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="myXVVq/D"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45hznm6KhBzDq7k
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jul 2019 18:56:12 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id c14so7890428plo.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Jul 2019 01:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=caOy47iObIWpUBNz9YBs1LqOSsSKOy2UuatZJ0Q43mo=;
 b=myXVVq/De7PJ2z5d05SOEeW9WqlEyQ4+XK7XGpMu9Odl2pSEwuPPfvChi0jyw5HI/Y
 xuQngalAkxwy/I+4pwJIpROTjgVrNECyKTo9JpQzuE+Fi5P2WKsW6/eGA9Awbr9WV1sl
 SKYnJujSLhGvFnD+06SsWwRFcixnQ2wEL6xOWYiF6VyBQWrX3Hk5M/JtZia6vnYoX9/k
 oX0O2CP1TL3Ma6mtYxuqAfS71NpdKPw3hWVN5yu0Hj+vXYAuiPwGBIn9Im3CBb26cB1d
 eD35TTwwNZk5Sk5K0oVnz7hZCILs288rCBrPEDFZ1vQx2PDAlff0BHg5q48D66F9TkjT
 T6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=caOy47iObIWpUBNz9YBs1LqOSsSKOy2UuatZJ0Q43mo=;
 b=UuA+W6zElADulOquxNaysD+qt8xhP0VNUOqf+9M7yfTIEXMwSvWKbfkj8+uiYIWlpC
 AqppGcf1qdau9aNrmJzKgKOQm2WhVYkdPNFDPT2yiQnZbIV/n6DtF1tqcQv2dv8DwPEU
 kH5fv4WLgDgHf9qS/NTWRIpF6gbaOi0VVuRg6JnUCSa2kGAozjP56BVZeYAQ65B1/9nX
 GYR3I1Pj9I2EQIuhpmzc/7xbqvCxUFIIbuHTeN/C4Wi1PKIcBBJC6rwoxgdgEZCB2Cdw
 FQe6hA7DNWJ+kWJwzmt8PmJ15a05tPszuinohKsraq/Cz76jk67R2jbcZ9hHMCJZchyZ
 qiuw==
X-Gm-Message-State: APjAAAUfzn14VMjtP64Y8zW+zjVFe+EWus/89jGUiZpCo3t4NkRvmf5H
 n9NJZD20Np7HJGC0TA5+kg+n0w==
X-Google-Smtp-Source: APXvYqx9dBbfaCeSrlWG9YwA8C4t0s8GIS3+7DlJ/SNiwhtLdjCXdF/a0g0X0AN2yjaZsVJ4/G87lg==
X-Received: by 2002:a17:902:8f81:: with SMTP id
 z1mr22483969plo.290.1562576169340; 
 Mon, 08 Jul 2019 01:56:09 -0700 (PDT)
Received: from localhost ([122.172.28.117])
 by smtp.gmail.com with ESMTPSA id p68sm26882425pfb.80.2019.07.08.01.56.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jul 2019 01:56:08 -0700 (PDT)
Date: Mon, 8 Jul 2019 14:26:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Wen Yang <wen.yang99@zte.com.cn>
Subject: Re: [PATCH v3] cpufreq/pasemi: fix an use-after-free in
 pas_cpufreq_cpu_init()
Message-ID: <20190708085606.tqhb3dgotj7sztyj@vireshk-i7>
References: <1562575726-17438-1-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1562575726-17438-1-git-send-email-wen.yang99@zte.com.cn>
User-Agent: NeoMutt/20180716-391-311a52
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
Cc: wang.yi59@zte.com.cn, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 xue.zhihong@zte.com.cn, cheng.shengyu@zte.com.cn,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08-07-19, 16:48, Wen Yang wrote:
> The cpu variable is still being used in the of_get_property() call
> after the of_node_put() call, which may result in use-after-free.
> 
> Fixes: a9acc26b75f ("cpufreq/pasemi: fix possible object reference leak")
> Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
> Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-pm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
> v3: fix a leaked reference.
> v2: clean up the code according to the advice of viresh.
> 
>  drivers/cpufreq/pasemi-cpufreq.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/cpufreq/pasemi-cpufreq.c b/drivers/cpufreq/pasemi-cpufreq.c
> index 6b1e4ab..9dc5163 100644
> --- a/drivers/cpufreq/pasemi-cpufreq.c
> +++ b/drivers/cpufreq/pasemi-cpufreq.c
> @@ -128,20 +128,20 @@ static int pas_cpufreq_cpu_init(struct cpufreq_policy *policy)
>  	int cur_astate, idx;
>  	struct resource res;
>  	struct device_node *cpu, *dn;
> -	int err = -ENODEV;
> +	int err;
>  
>  	cpu = of_get_cpu_node(policy->cpu, NULL);
> -
> -	of_node_put(cpu);
>  	if (!cpu)
> -		goto out;
> +		return -ENODEV;
>  
>  	dn = of_find_compatible_node(NULL, NULL, "1682m-sdc");
>  	if (!dn)
>  		dn = of_find_compatible_node(NULL, NULL,
>  					     "pasemi,pwrficient-sdc");
> -	if (!dn)
> +	if (!dn) {
> +		err = -ENODEV;
>  		goto out;
> +	}

Please restore the blank line here.

>  	err = of_address_to_resource(dn, 0, &res);
>  	of_node_put(dn);
>  	if (err)
> @@ -196,6 +196,7 @@ static int pas_cpufreq_cpu_init(struct cpufreq_policy *policy)
>  	policy->cur = pas_freqs[cur_astate].frequency;
>  	ppc_proc_freq = policy->cur * 1000ul;
>  
> +	of_node_put(cpu);
>  	return cpufreq_generic_init(policy, pas_freqs, get_gizmo_latency());
>  
>  out_unmap_sdcpwr:
> @@ -204,6 +205,7 @@ static int pas_cpufreq_cpu_init(struct cpufreq_policy *policy)
>  out_unmap_sdcasr:
>  	iounmap(sdcasr_mapbase);
>  out:
> +	of_node_put(cpu);
>  	return err;
>  }
>  
> -- 
> 2.9.5

-- 
viresh
