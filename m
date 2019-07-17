Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DDD6B58F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 06:28:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pPQl5m8BzDqTy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 14:28:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=viresh.kumar@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="IiereG+0"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pPP46g0XzDqGT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2019 14:27:03 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id k8so11259635plt.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 21:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WCoUs4Hb3/orTt0/DRrzcBNTaD0Ae5/zpkSi1tZIxVE=;
 b=IiereG+0BCAa0XdwaQHy24zNuCtVxyNA8YYg1B/rOL7rToEYoFyLQ6dmh7K8T5iP65
 KM2xMoG+2xMnWcf9Pjz19BorYKLoMK3P3X7Mudx5mDh1p2XVN0WvSl2r9sjpF2jMox6e
 iSCKvrYrDQ1hxiYdXRJwOg7j883Kq0s2OwoT0QbBOL0j+lMEHlPqV6R3BebAqoPQy+Ch
 MJdr5XaxXbNwzpX0AfyWf8OCAS2qK+kyrVZHdEMu9QJV0MXwfB6BIJ4VGA/04sGGt7Cf
 1NNXOmO12/XdJoYR7mIFBlDVaqN8oAZ7wKwOdQ5qHijwffZYkLpJ+ysqq54Bft2WMwfQ
 9OqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WCoUs4Hb3/orTt0/DRrzcBNTaD0Ae5/zpkSi1tZIxVE=;
 b=SmU4owvvBMlfJ0dNQbGHfCCwE23G+1aS/CTaNUW1WFaF97RMLKv9cqvL44Jd69qLME
 SPCoLIAWpfNqXhlpTLXcf+NNAILtoS5J3IoSfHgz3YTOWwMBxwkli3f+qxDi0gOavf2K
 r5Q8E2zsEZDrrCFC5+wZMijgbqo6cMyjtfR2jeuxxhiwV+vfzI2OQfbNfTjwnZxqDTCU
 jGINij5M5eMGL8gA0F2yiPFmPE5U2EbackBcbsBcpnqw0mUY2UNR3nKa82ZtT8ZiyIqy
 bkqIKJiVz0QZT8yi82OX1t7vjibibdYIKdE/c3gfMHBQI/fkz/YIoEPunttP+xrNrnvT
 rIkg==
X-Gm-Message-State: APjAAAVy4TmeNlpRlpFzyTC4X0cpxY3SlGxMlwIjQXqw3wg0anhkiiSf
 ZQ0uLIBB9LR0Pib2ehUgIgWOow==
X-Google-Smtp-Source: APXvYqzn00yoFOY6V0VVSZoXn809wajh7dZLsAzML9/Buf6OjvFE8aIcmdRSdethJ0XKQGYosUCTQg==
X-Received: by 2002:a17:902:2de4:: with SMTP id
 p91mr9764548plb.28.1563337620108; 
 Tue, 16 Jul 2019 21:27:00 -0700 (PDT)
Received: from localhost ([122.172.28.117])
 by smtp.gmail.com with ESMTPSA id c26sm21187405pfr.172.2019.07.16.21.26.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jul 2019 21:26:58 -0700 (PDT)
Date: Wed, 17 Jul 2019 09:56:55 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Wen Yang <wen.yang99@zte.com.cn>
Subject: Re: [PATCH v7] cpufreq/pasemi: fix an use-after-free in
 pas_cpufreq_cpu_init()
Message-ID: <20190717042655.jmiblv5mhg55s7la@vireshk-i7>
References: <1563335704-25562-1-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1563335704-25562-1-git-send-email-wen.yang99@zte.com.cn>
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
Cc: wang.yi59@zte.com.cn, linux-pm@vger.kernel.org, rjw@rjwysocki.net,
 linux-kernel@vger.kernel.org, xue.zhihong@zte.com.cn, cheng.shengyu@zte.com.cn,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 17-07-19, 11:55, Wen Yang wrote:
> The cpu variable is still being used in the of_get_property() call
> after the of_node_put() call, which may result in use-after-free.
> 
> Fixes: a9acc26b75f6 ("cpufreq/pasemi: fix possible object reference leak")
> Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
> Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-pm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
> v7: adapt to commit ("cpufreq: Make cpufreq_generic_init() return void")
> v6: keep the blank line and fix warning: label 'out_unmap_sdcpwr' defined but not used.
> v5: put together the code to get, use, and release cpu device_node.
> v4: restore the blank line.
> v3: fix a leaked reference.
> v2: clean up the code according to the advice of viresh.
> 
>  drivers/cpufreq/pasemi-cpufreq.c | 23 +++++++++--------------
>  1 file changed, 9 insertions(+), 14 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
