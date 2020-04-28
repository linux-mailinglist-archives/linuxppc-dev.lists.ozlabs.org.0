Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A95F1BBBD3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 13:03:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BJfV1q0zzDqsd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 21:03:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=viresh.kumar@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Fp6Rdy7X; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BJcF2pxczDqlW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 21:01:32 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id 7so1026570pjo.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 04:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZECYmOh8GHeDtWKEVN9mB2cMfDA4CqdHy3DVPieFtU8=;
 b=Fp6Rdy7X/Au1Bogcm9JL1jp6M4qSLsYbzFhSC9yOg6l+3kkiXKIi8rdJl0lMmjYsMm
 q2eAMBXUdoiBgNdIcVvDdJtwn51TJIBDUoRmMmMRO65okmPBGBQnqa4N2mW34RVNy+NS
 /ExDJhJme0OTu0O+ThAbuwtuOn9QVCqcocS2OAbos64IX7v99N7dXsjYPfR94kImkQdL
 2C4SKfj5IHeZRVtrj9RCGzxPkrzc+ekNRHs9yMP7N2wdx0Z331vPSyXPvI3E7ud8GKzg
 HCR2Mo3MrY6wCTSX+YaHkiccIMPd/cE90wlzZDas+3LNmUPVv3C3TMpQqP+CqlpbyaYl
 Oc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZECYmOh8GHeDtWKEVN9mB2cMfDA4CqdHy3DVPieFtU8=;
 b=Sik/ESfwrXrf4c9LDfJ0dtQxNITgalsFC5lMv+jp4v+rfKInHOx9SJdutIUPyjREgu
 YepDn3G2SU3habtkCFUEOy537Zn68H3cvPrLIoMt5IFDavY2lDbm2M43gL070wK/RT5C
 4198aSu7XCc/Nrrd+MIuUV+iEiHwuIZhH4ZZvliHKXkCGLkY5+O9b2QFYqBiLkvF+JB3
 r/pawNrIY1jrJhym4Y0kyLUDmwDAEgiGlI5z06V/rEe5vj83XL0KnqpGnTEGgezdI42p
 NsXClJh7f0JA35g2kFktD2C4ZL6sIHtWRU50neo0/zaYNAD9BIAHHLsnWajJpVErvSXc
 FbLQ==
X-Gm-Message-State: AGi0PuY0RyKN5zfaKjFUzdsLuo10ZUX8n8KlPjKKubBo2fjIgh2hLPh9
 KFrDftKfBiK8qbPcV2F+YxISlw==
X-Google-Smtp-Source: APiQypKCUoSWq+WSJVcxTjVfaz6aX0BH3kxmg8S6JEc81aCuemoUOA0OgzndCgwVZlV3UAjOtj9NPQ==
X-Received: by 2002:a17:902:7793:: with SMTP id
 o19mr28241721pll.107.1588071688818; 
 Tue, 28 Apr 2020 04:01:28 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id b24sm14158840pfi.4.2020.04.28.04.01.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Apr 2020 04:01:28 -0700 (PDT)
Date: Tue, 28 Apr 2020 16:31:25 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: rjw@rjwysocki.net, Mian Yousaf Kaukab <ykaukab@suse.de>
Subject: Re: [PATCH v2 1/2] cpufreq: qoriq: convert to a platform driver
Message-ID: <20200428110125.lobyrsbma6astfmq@vireshk-i7>
References: <20200421083000.16740-1-ykaukab@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200421083000.16740-1-ykaukab@suse.de>
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
Cc: andy.tang@nxp.com, linux-pm@vger.kernel.org, sboyd@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 leoyang.li@nxp.com, shawnguo@kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 21-04-20, 10:29, Mian Yousaf Kaukab wrote:
> The driver has to be manually loaded if it is built as a module. It
> is neither exporting MODULE_DEVICE_TABLE nor MODULE_ALIAS. Moreover,
> no platform-device is created (and thus no uevent is sent) for the
> clockgen nodes it depends on.
> 
> Convert the module to a platform driver with its own alias. Moreover,
> drop whitelisted SOCs. Platform device will be created only for the
> compatible platforms.
> 
> Reviewed-by: Yuantian Tang <andy.tang@nxp.com>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Mian Yousaf Kaukab <ykaukab@suse.de>
> ---
> v2:
>  +Rafael, Stephen, linux-clk
>  Add Reviewed-by and Acked-by tags
> 
>  drivers/cpufreq/qoriq-cpufreq.c | 76 ++++++++++++++++-------------------------
>  1 file changed, 29 insertions(+), 47 deletions(-)

@Rafael,

Though this looks to be PPC stuff, but it is used on both ARM and PPC. Do you
want to pick them up or should I do that ?

-- 
viresh
