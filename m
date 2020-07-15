Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8672202C1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 05:10:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B62T81yD1zDqWg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 13:10:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=viresh.kumar@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=T6AbBGKL; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B62Nx4lLfzDqcD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 13:07:12 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id b92so1670918pjc.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 20:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=0035V8bnG3whIAu8f7LLUznLFIPtedBFd2Vvyt7nBVE=;
 b=T6AbBGKLFGiO0rMZSPzPGLvnhapccenwdvNWp3pzTj2roNEx6srIAWKTBvrEsL/hBA
 IZkPg8mUeuKB1PT4pOTI4RjF5htA4bxX6dyCndlvlQe4G3ODxC2ZOvhPWx+05HCv9rDZ
 va/MRhxP+3uW57aWLqjD3o2VwG34nmWoW4VDWWaVLnO2XyVSQ6mxJiYqPIYyBouwaDte
 gFQTXx4zqagvxCcyT8kLl6jPMhLAi7mmed0AH0wF+KddDCiP8oCCatuOk/jTqvTazoK2
 EjDKeUpPihFzsLsxEaEe6MTwtmRnr+fQ9s2ka4YKgYXJJjwdcjX1AxKMspjlcbaQ/Gx8
 Vajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=0035V8bnG3whIAu8f7LLUznLFIPtedBFd2Vvyt7nBVE=;
 b=bfdRt1h1wFw1qKjRlgkQRde+us8j7/6aGyWH8ZL9M5g6uEpC11cVsgUe02vFfj/vpy
 mBYawzCQuRmlu20p0y/lV8lQ/RmaEqxSGViA7Q64dB7ysZZqm4EwjDObQCVguXu+egNr
 EdJmw5CQq6N4qPzGED3HF0YaFCugEKuMp3tLQ6HntXcPw26QveKI8MPMABLKMuSzqA1I
 oIM4pXN1bvJJUynxiqBP9z4FC5txB5MnHRak57N0gT9XLgw8PqGvPz1RciYimxckkBCp
 2o+cSGEePT7TAdM9dAhctSozFoPRQiIksSS9rOxcchqHMW46hVxcWHc+66UQlMJQr4z/
 Fv+w==
X-Gm-Message-State: AOAM532qO9qEtXuMw1yc5T1/U3YYTM7U6MNss2tljIZxZOp68puIiUZ9
 r/7MRK+Pol6r7oG7hyHRv04pfA==
X-Google-Smtp-Source: ABdhPJy2AmTOb51BDdwUOYzF95HLQmIbML6+9DPgV2vlmfNf/gS+QQumkK0XzVQ3zBHzkUs41mvn/g==
X-Received: by 2002:a17:902:8bc7:: with SMTP id
 r7mr6673755plo.57.1594782428813; 
 Tue, 14 Jul 2020 20:07:08 -0700 (PDT)
Received: from localhost ([122.172.34.142])
 by smtp.gmail.com with ESMTPSA id h100sm388981pjb.46.2020.07.14.20.07.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 Jul 2020 20:07:07 -0700 (PDT)
Date: Wed, 15 Jul 2020 08:37:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 05/13] cpufreq/arch: powerpc: pasemi: Move prototypes to
 shared header
Message-ID: <20200715030706.prxya7fyylscoy25@vireshk-i7>
References: <20200714145049.2496163-1-lee.jones@linaro.org>
 <20200714145049.2496163-6-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200714145049.2496163-6-lee.jones@linaro.org>
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
Cc: linux-pm@vger.kernel.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Olof Johansson <olof@lixom.net>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 14-07-20, 15:50, Lee Jones wrote:
> If function callers and providers do not share the same prototypes the
> compiler complains of missing prototypes.  Fix this by moving the
> already existing prototypes out to a mutually convenient location.
> 
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/cpufreq/pasemi-cpufreq.c:109:5: warning: no previous prototype for ‘check_astate’ [-Wmissing-prototypes]
>  109 | int check_astate(void)
>  | ^~~~~~~~~~~~
>  drivers/cpufreq/pasemi-cpufreq.c:114:6: warning: no previous prototype for ‘restore_astate’ [-Wmissing-prototypes]
>  114 | void restore_astate(int cpu)
>  | ^~~~~~~~~~~~~~
> 
> Cc: Olof Johansson <olof@lixom.net>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  arch/powerpc/platforms/pasemi/pasemi.h    | 15 ------------

Is there no sane way we can include this file directly to the cpufreq
file ?

>  arch/powerpc/platforms/pasemi/powersave.S |  2 ++
>  drivers/cpufreq/pasemi-cpufreq.c          |  1 +
>  include/linux/platform_data/pasemi.h      | 28 +++++++++++++++++++++++
>  4 files changed, 31 insertions(+), 15 deletions(-)
>  create mode 100644 include/linux/platform_data/pasemi.h

-- 
viresh
