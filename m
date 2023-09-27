Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F167AFF62
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 11:04:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=G/V0fgFD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwVz41mwCz3cP5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 19:04:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=G/V0fgFD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwVy86Jjmz2yVR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 19:03:11 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-692ada71d79so6994754b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 02:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695805387; x=1696410187; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bj8V1LOsiyIBiVIbCC3M9pEntNFhPwnOX9TJ48ByRxU=;
        b=G/V0fgFDWvdHolQf8h5LhzhN4MHttlx2Qh7/R5CUzjTHaWfXvP4s/JytWzPISzRdlY
         V9OtPtaY1YyVGHLqKSoAYG2/zRKcwgbd3OK8YsKSlhS1bj8HxorDHjqpbYn5Q2sz1uFm
         +zxR8uRMMVSvrKkg7dDj8U+xnwJwfUC0OpmY1WnDoWzZhbC/oYoN9QjJ3rjQOi4CyxuJ
         ab4r7KkbFR/9/4jZ6recq3+jfdSA680IebpoHR3EWOHS/beEJAc5mHWr6S6e/vpWSTdQ
         A/lqfzVlZZ9NvwFf7UaWezt9j7c62YiIucgcz+WarPT7RM7+bHh0JlQoo+KK2p5DaSwT
         Ig6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695805387; x=1696410187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bj8V1LOsiyIBiVIbCC3M9pEntNFhPwnOX9TJ48ByRxU=;
        b=quyHALSPylACD5pBmDsDN7SHe3M1fX0fsbzQYRt/hJ2Z42M7IFyIblMzdssO+ZNbFn
         tH+52eUGXtlNqQM38uyAbv18n2ephzgVM//1dP5Db5rw2eTTae8NdvswKHZKUmj6y6qi
         RuKFzEik5d34JZILaEABY18pMTkW5n5stiwGdLUosb83JBfWMUVn/AlJEFOuJpM/IV5B
         VWFInGI6HnvjTrlSH9w/laq/kSnkLPaVa6g2wUTJ5B0WtiocPmh+VsvN6LMnIDiy3Gc/
         P7KBlRrMPM+umx4sNF9CMUWp4EC9d7maVyNQVXiqWDutn0S8Ptiz61uv2cRFDTXwVQf7
         p//g==
X-Gm-Message-State: AOJu0YweCcAOCLOpSQilODw4M7TvXZik2xlQ/B0EMtT3Kml87SnDX/4J
	nATxNQ0Bn6i655gOymSAlnTpRA==
X-Google-Smtp-Source: AGHT+IH34fm0MLU1qMf9l4MpWQP5vVLDgZuarSDcwS9vgr6ozY5QUXvIbDZ4b7rjEYsPSHrQV0Z0/g==
X-Received: by 2002:a05:6a00:2d9d:b0:68f:c9df:2ccb with SMTP id fb29-20020a056a002d9d00b0068fc9df2ccbmr1399270pfb.1.1695805386908;
        Wed, 27 Sep 2023 02:03:06 -0700 (PDT)
Received: from localhost ([122.172.81.92])
        by smtp.gmail.com with ESMTPSA id e17-20020aa78251000000b0068feb378b89sm11677825pfn.171.2023.09.27.02.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 02:03:06 -0700 (PDT)
Date: Wed, 27 Sep 2023 14:33:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] cpufreq: pmac32: Use of_property_read_reg() to parse
 "reg"
Message-ID: <20230927090304.vddwsgdzblurwage@vireshk-i7>
References: <20230925190242.1712212-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925190242.1712212-1-robh@kernel.org>
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
Cc: linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 25-09-23, 14:02, Rob Herring wrote:
> Use the recently added of_property_read_reg() helper to get the
> untranslated "reg" address value.
> 
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
>  - Add missing include
> ---
>  drivers/cpufreq/pmac32-cpufreq.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Applied. Thanks.

-- 
viresh
