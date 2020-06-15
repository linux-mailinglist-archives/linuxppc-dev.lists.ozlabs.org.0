Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FDF1FA3AB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 00:45:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49m5y15wNyzDqRX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 08:45:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::341;
 helo=mail-wm1-x341.google.com; envelope-from=qperret@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=R3LMWQII; dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lzD46hjTzDqbg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 03:41:50 +1000 (AEST)
Received: by mail-wm1-x341.google.com with SMTP id b82so401072wmb.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 10:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oY7ZuVvlWCgY01/3kLGR+1QSYIg+ZjHtQqquGW90g1U=;
 b=R3LMWQIId1cQohqf0X5bTssX/ck9Tat9HT9OWIJtTHwUY6SJ0BH8CtiQge02sxzDUq
 D/468yONxMF7MsAlOugNzzC2YJRB8zxxor77YujZujBHqBzigCQA3qHyqsBqBv0L4hSO
 heY6DqIyS4VDmZpZ/dfwO4K6juqvUhQdCcCRjn2P8EmeeiRY68CMIc1mplZLpSV32+Up
 qnKCwRpwuXmELRT8UbaTONcw2qLfz5xjasSz/YKLBfBn26ttGQqeH2+xuaeqngeV8Kj5
 7r1s7iTqSl7egrjPqVKAxy73xUc5TkC0MrMLtFUOCRvhujErEotYGvevMF+1/hS5ISAV
 SOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oY7ZuVvlWCgY01/3kLGR+1QSYIg+ZjHtQqquGW90g1U=;
 b=eLygP5uvpCxqTyxJ7W5Rbp7OatpvMV6hxvHkWSTnkVGYn40lQDVOmiifoZ0zUq4Lmr
 JX8vxafP/7Bgs0sA3HxlVYmCPQHQvHUsHy4VmGDSnoz6JHgMIAer/B/W4gXoM7lUxc1i
 247dh7HHRkvnG0uJDdc427LhwOKkDKsyJzGbyYU27G2yNBGEla2TqMn6aVsjKl7iLvQs
 BLdCDrnDECF3t3Whs3buCtULoLm9IQC6pnTdR3+Y2JDjO7dt+9zL6ZNEkMV85riJ1gJR
 3sUHMOAk7Y6+56GX67vXM/evyQ7Wf3BU7ciibnf45yLtVgK+6bxs2YdlNVeSgxCdW/u4
 GPYA==
X-Gm-Message-State: AOAM530mKC2WFqZKiLKgODslLFwAab0+c3VX0OiP8wpbRsH2h7Wi8KfQ
 NRgfmTS9EBag66t5wAozx0lo+Q==
X-Google-Smtp-Source: ABdhPJxZIkU/7mhMBRsRT52yrMQRtnq6d09FQMcwSh1k29JPx1ndKo/Cpw28q7Mi57mkncpvcG63yA==
X-Received: by 2002:a1c:4857:: with SMTP id v84mr459057wma.96.1592242906131;
 Mon, 15 Jun 2020 10:41:46 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
 by smtp.gmail.com with ESMTPSA id a16sm25199304wrx.8.2020.06.15.10.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 10:41:45 -0700 (PDT)
Date: Mon, 15 Jun 2020 18:41:41 +0100
From: Quentin Perret <qperret@google.com>
To: rjw@rjwysocki.net, rafael@kernel.org, viresh.kumar@linaro.org
Subject: Re: [PATCH 2/2] cpufreq: Specify default governor on command line
Message-ID: <20200615174141.GA235811@google.com>
References: <20200615165554.228063-1-qperret@google.com>
 <20200615165554.228063-3-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615165554.228063-3-qperret@google.com>
X-Mailman-Approved-At: Tue, 16 Jun 2020 08:37:35 +1000
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
Cc: juri.lelli@redhat.com, kernel-team@android.com, vincent.guittot@linaro.org,
 arnd@arndb.de, linux-pm@vger.kernel.org, peterz@infradead.org,
 adharmap@codeaurora.org, linux-kernel@vger.kernel.org, mingo@redhat.com,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org, tkjos@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Monday 15 Jun 2020 at 17:55:54 (+0100), Quentin Perret wrote:
>  static int cpufreq_init_governor(struct cpufreq_policy *policy)
>  {
>  	int ret;
> @@ -2701,6 +2721,8 @@ int cpufreq_register_driver(struct cpufreq_driver *driver_data)
>  
>  	if (driver_data->setpolicy)
>  		driver_data->flags |= CPUFREQ_CONST_LOOPS;
> +	else
> +		cpufreq_get_default_governor();

Looking at this again, it appears that the comment above
cpufreq_parse_governor() confused me a bit -- this needs doing
unconditionally I think.

I'll fix it in v2.

Thanks,
Quentin
