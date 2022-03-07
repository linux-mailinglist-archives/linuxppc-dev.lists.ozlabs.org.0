Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31ACC4CEFCD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 03:53:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBjgl0y3gz3bZ2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 13:53:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ehd1auyN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=hbh25y@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ehd1auyN; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KBjg55HDtz2xDY
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Mar 2022 13:52:31 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id bc27so12418800pgb.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 06 Mar 2022 18:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Ke3d+rcxPqYaHipRSyN8yz8qMw+s7G4gf9p9GSWU0jA=;
 b=ehd1auyNauHQc0rQhmzW8q7qh6pZOJsbjKfg3IPqyyjqx8C9vZnGUmBhM/DQ2q+tcU
 DldtGmTqhNJ5fPdK2zz80IHgowfZxrPU8a6t3VK6dmZoGisoa7yegGLPb2PArx9DpIJS
 tL0BMaR8McbckQ2izeZ3q8a9S151TPGcAKZr6d8VxdwKhK7zd4oIriuug9Yzqo8vGz2L
 80XfS0UxIpOdqEEI/Se1dPjUMAnGKViT56g/qGAyUFgl2m5Q9Sv4s1d7/6ByQskaKxN+
 Jguex9GpdWNls6Pu0W2EfrNERq4h5iTUNGzfUmyj3/CPsDHXJ8rBVc8ERe2BlAY6iJk9
 ANfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ke3d+rcxPqYaHipRSyN8yz8qMw+s7G4gf9p9GSWU0jA=;
 b=1ufpjzlZG788nlrImAzEszooWzpgyzRoD2Z9C8ulKcNFLlARYvORKibL6PNsTL/dUC
 bMYP28jCIMB/tKlYVbIiCK4Q2+9boAo4hbsKx13G1Gsh0z/rQ8ydg0bwQ1SwhXV+n9aW
 PrcbLMiu53YSDynTMmA9tHOKzH0fJayXNa9WaTnzUj/nuQY49lwDkEci3l825kvvTCPp
 41alJL1VaHiRfaJmeJ3q6LcwnncWP1rN7EN+Msa/P3aTfltQMTDDpsk8EBgFbwr2x9c0
 6Svc0LwBsgaoOynJM60sT5IOUxfYN9IP7D6pua+XyCav0A3zBDDBYjngpgefX8Qi90Mz
 yVUg==
X-Gm-Message-State: AOAM530cliTjXOQpcLgkmOPP1Rfxtic1I2TNkQe+z7ELf/xhv343dmP8
 kjZNMm5vj9D0dDVc4yvjqWk=
X-Google-Smtp-Source: ABdhPJw3sxr6LJUr9bSYxUY5oJICYTMxsi1JzMcM6eYWmFK1guMpEsTSDqHwJJ9OX7nMKYoyzwNpvg==
X-Received: by 2002:a63:5124:0:b0:375:9f87:f881 with SMTP id
 f36-20020a635124000000b003759f87f881mr7871229pgb.578.1646621549707; 
 Sun, 06 Mar 2022 18:52:29 -0800 (PST)
Received: from [10.11.37.162] ([103.84.139.53])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm14109144pfc.111.2022.03.06.18.52.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 18:52:29 -0800 (PST)
Message-ID: <a044e19d-4996-ab16-785f-e8e87e6c05a8@gmail.com>
Date: Mon, 7 Mar 2022 10:52:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] powerpc: kernel: fix refcount leak in format_show()
Content-Language: en-US
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 tyreld@linux.ibm.com
References: <20220302021959.10959-1-hbh25y@gmail.com>
From: Hangyu Hua <hbh25y@gmail.com>
In-Reply-To: <20220302021959.10959-1-hbh25y@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Any further suggestions for this patch? guys.

Thanks.

On 2022/3/2 10:19, Hangyu Hua wrote:
> Refcount leak will happen when format_show returns failure in multiple
> cases. Unified management of of_node_put can fix this problem.
> 
> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
> ---
> 
> v2:
> 1. change the title and description information.
> 2. fix all possible refcount leak.
> 
>   arch/powerpc/kernel/secvar-sysfs.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/secvar-sysfs.c
> index a0a78aba2083..1ee4640a2641 100644
> --- a/arch/powerpc/kernel/secvar-sysfs.c
> +++ b/arch/powerpc/kernel/secvar-sysfs.c
> @@ -26,15 +26,18 @@ static ssize_t format_show(struct kobject *kobj, struct kobj_attribute *attr,
>   	const char *format;
>   
>   	node = of_find_compatible_node(NULL, NULL, "ibm,secvar-backend");
> -	if (!of_device_is_available(node))
> -		return -ENODEV;
> +	if (!of_device_is_available(node)) {
> +		rc = -ENODEV;
> +		goto out;
> +	}
>   
>   	rc = of_property_read_string(node, "format", &format);
>   	if (rc)
> -		return rc;
> +		goto out;
>   
>   	rc = sprintf(buf, "%s\n", format);
>   
> +out:
>   	of_node_put(node);
>   
>   	return rc;
