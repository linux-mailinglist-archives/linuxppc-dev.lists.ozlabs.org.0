Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1701419EF6B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 05:00:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wZz51ql9zDr10
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 13:00:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=viresh.kumar@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=NqPNfIWg; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wZxF30PJzDqwp
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 12:58:36 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id l14so6888543pgb.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Apr 2020 19:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Snmazk82MB0/0cCIeeJxaxYr1fCvgV5xCLT8s21RwAs=;
 b=NqPNfIWgOWaM4sqrQjkJIXbp4kT3YO3B6wIsbdOFmc7pyXoGE+VpXs21oojmhTvtCm
 Y+y1dtXB9zv/cjK4hEKRyVCSiKUqpVhrhbMDH0nxoyKBSwhydSdWpqPFNrMbYEONwqRW
 aPZFVQ+NIt+dsDmxklpi93KoEIHkfhL69mX9exDgI3NQ7tsVfsbL/lQC2vH8WXGmiQ18
 tK1paQ3pARNq8QchfUQ0D4YtTSh6wI92NpK4P6clPK4hPofDCqwBhwYS+iMTL+iVNgCJ
 Eu0wi6WiU9hZSkSnbDcsayaICj10GcZoZ1P4m/kiIeeE+qqGEfWThwuD5BK6c41DsOE8
 33/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Snmazk82MB0/0cCIeeJxaxYr1fCvgV5xCLT8s21RwAs=;
 b=cwmDIb/PCe6+rK1Yc3k4s8l3Gwwf3kd39RmflRWuB6PYVHr1BCPj6xbbdAMjriSLcQ
 +SsnyYfQlj4arJTLzIrMgrBe1FOXZcZ0EwDD8cM8oQD0RF7KQWKUZ4oNvGYBiFHmIHRM
 oI0qVZD1aQKYkJ8LctOgaWWHKGB7xdDAvw/orjecc7CfABhXBBpz7ZIWI4RSC3VeISOf
 6S2Zgma3c0eQcMfrV5ttfj/DQR2oP7+jl4oXSCtUJE3q4rNqiQHRreiJFbLimaH488f6
 APdgP60H39nXmdhFAzaiRw1gIQ0rU4ThfO2HtfEL/SGTWtfQ3zpQ3lV4S4L4U1pn1QmU
 hCjw==
X-Gm-Message-State: AGi0PubFl+hYNh+1eHt4LVSm14os7Sa3zUO3bGR8uPX7+8oySW+XcBVC
 +VURZGPpWZo0Nw875KM0sBMcMA==
X-Google-Smtp-Source: APiQypJFIzF+3oECidi3FpRsgBdzk96yF/DdD8sX4fg1ZTuRL6fKY5vITqktCAnS0MAH0XqQp9KVDg==
X-Received: by 2002:a63:64c2:: with SMTP id
 y185mr19296513pgb.133.1586141914636; 
 Sun, 05 Apr 2020 19:58:34 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id d3sm10450782pfq.126.2020.04.05.19.58.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 05 Apr 2020 19:58:33 -0700 (PDT)
Date: Mon, 6 Apr 2020 08:28:32 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Mian Yousaf Kaukab <ykaukab@suse.de>
Subject: Re: [PATCH 1/2] cpufreq: qoriq: convert to a platform driver
Message-ID: <20200406025832.7bbtfo52k3dz5pkj@vireshk-i7>
References: <20200403212114.15565-1-ykaukab@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403212114.15565-1-ykaukab@suse.de>
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
Cc: andy.tang@nxp.com, linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, leoyang.li@nxp.com, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 03-04-20, 23:21, Mian Yousaf Kaukab wrote:
> The driver has to be manually loaded if it is built as a module. It
> is neither exporting MODULE_DEVICE_TABLE nor MODULE_ALIAS. Moreover,
> no platform-device is created (and thus no uevent is sent) for the
> clockgen nodes it depends on.
> 
> Convert the module to a platform driver with its own alias. Moreover,
> drop whitelisted SOCs. Platform device will be created only for the
> compatible platforms.
> 
> Signed-off-by: Mian Yousaf Kaukab <ykaukab@suse.de>
> ---
>  drivers/cpufreq/qoriq-cpufreq.c | 76 ++++++++++++++++-------------------------
>  1 file changed, 29 insertions(+), 47 deletions(-)

For both patches,

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
