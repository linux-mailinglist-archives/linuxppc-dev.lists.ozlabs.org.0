Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E244822031C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 05:55:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B63SZ1qC2zDqSh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 13:55:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=viresh.kumar@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ylZ7LAUr; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B63N61BnJzDqQK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 13:51:33 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id t6so1558757plo.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 20:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=XL4t1R7KO+iiuMm12j+xjnscuEfFndInUHw84PmBU/0=;
 b=ylZ7LAUr7v3nNsUSJz4QBwWUkMu5K8QLciZp5z1a5hp2fILGp0VPgza+2a7vL1RduE
 2orVyqzcsKEpygHUPltAqLIr7lS8ANkLD2UvrG3NeNrUr0iCJuegFHD/qgy9qiev1Ofh
 biJRAcpw2pf18vEbtOTRXsI0rlMQ8Hg0QHQi+R8s274ANV6PYW+FcTW8YAdnq+d2YVnn
 7Gjf2vX/8npSCLhwZnlk9c96vbwS9kVfhGLc9PZZmZOftJba8Va7Y+G1Dd4sIjKVt/IK
 TMd5jMtoM77db2UokF5JBiagwoOdQ5RHgFSmN+6T5mxXMd7VFZ8dMnyFpWHhRT7YVrCs
 lt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=XL4t1R7KO+iiuMm12j+xjnscuEfFndInUHw84PmBU/0=;
 b=Ive/MkhyKpvxC1Mpt4OmnbRQRWn+gsmuxDOL6oMkHUTzMHJq6eqYk5LgS+gXFjC7FF
 0HH1Oe4u6tdqEuawxIyv2jK/cCJYOMVrZn3vpcQDXtOtQjuQxixtJrqanBN/Bk5sMy6e
 SjDg8RLTwkx7hBUIdtqBIS8ZdRt0hq0e+JNSv4NOEmftwwFOOgLP1tdktFeYspuEqpq0
 DuWE1LLwW/fLvdMLdkPDDNnMUvpe2T5uG/gy92ViE9OEGtub49ullHqfx7+EIYALUZYA
 iY3cJv8kJTNouyvzWo7yKBby25wNvBGZpvrfbSE+M7Glfeq/WSgDmIY3TznRDEweTcVF
 umyA==
X-Gm-Message-State: AOAM531Qjel5L6tDZsuHjh/m485IJsqOhx0p0cpPxuGeASWhW4/lY+jv
 oTJvtTSeDBuZs6ObBEQbjGPOxA==
X-Google-Smtp-Source: ABdhPJz/fr4UJ94q97HnzrCpojOj2P5clVmMzwu1+0cWBhjM/jhe2/UJORYoOQc0tflEF8L9/1W8yQ==
X-Received: by 2002:a17:902:b193:: with SMTP id
 s19mr6492581plr.246.1594785090510; 
 Tue, 14 Jul 2020 20:51:30 -0700 (PDT)
Received: from localhost ([122.172.34.142])
 by smtp.gmail.com with ESMTPSA id r17sm546201pfg.62.2020.07.14.20.51.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 Jul 2020 20:51:29 -0700 (PDT)
Date: Wed, 15 Jul 2020 09:21:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 05/13] cpufreq/arch: powerpc: pasemi: Move prototypes to
 shared header
Message-ID: <20200715035128.3j7xegbdz4bourxz@vireshk-i7>
References: <20200714145049.2496163-1-lee.jones@linaro.org>
 <20200714145049.2496163-6-lee.jones@linaro.org>
 <20200715030706.prxya7fyylscoy25@vireshk-i7>
 <CAOesGMi1dfqPbFJ8YoUoJ75NdU1=XiNoYx+6+JLu44a4LuuYGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOesGMi1dfqPbFJ8YoUoJ75NdU1=XiNoYx+6+JLu44a4LuuYGA@mail.gmail.com>
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
Cc: linux-pm@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Lee Jones <lee.jones@linaro.org>,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 14-07-20, 20:49, Olof Johansson wrote:
> On Tue, Jul 14, 2020 at 8:07 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 14-07-20, 15:50, Lee Jones wrote:
> > > If function callers and providers do not share the same prototypes the
> > > compiler complains of missing prototypes.  Fix this by moving the
> > > already existing prototypes out to a mutually convenient location.
> > >
> > > Fixes the following W=1 kernel build warning(s):
> > >
> > >  drivers/cpufreq/pasemi-cpufreq.c:109:5: warning: no previous prototype for ‘check_astate’ [-Wmissing-prototypes]
> > >  109 | int check_astate(void)
> > >  | ^~~~~~~~~~~~
> > >  drivers/cpufreq/pasemi-cpufreq.c:114:6: warning: no previous prototype for ‘restore_astate’ [-Wmissing-prototypes]
> > >  114 | void restore_astate(int cpu)
> > >  | ^~~~~~~~~~~~~~
> > >
> > > Cc: Olof Johansson <olof@lixom.net>
> > > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > > Cc: Paul Mackerras <paulus@samba.org>
> > > Cc: linuxppc-dev@lists.ozlabs.org
> > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > ---
> > >  arch/powerpc/platforms/pasemi/pasemi.h    | 15 ------------
> >
> > Is there no sane way we can include this file directly to the cpufreq
> > file ?
> 
> Yep. arch/powerpc seems to be in the search path for modules on powerpc, so:
> 
> diff --git a/drivers/cpufreq/pasemi-cpufreq.c b/drivers/cpufreq/pasemi-cpufreq.c
> index c66f566a854cb..815645170c4de 100644
> --- a/drivers/cpufreq/pasemi-cpufreq.c
> +++ b/drivers/cpufreq/pasemi-cpufreq.c
> @@ -22,6 +22,8 @@
>  #include <asm/time.h>
>  #include <asm/smp.h>
> 
> +#include <platforms/pasemi/pasemi.h>
> +
>  #define SDCASR_REG             0x0100
>  #define SDCASR_REG_STRIDE      0x1000
>  #define SDCPWR_CFGA0_REG       0x0100

Fantastic. Thanks.

-- 
viresh
