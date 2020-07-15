Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FC2220578
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 08:52:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B67PC5jzZzDqjg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 16:52:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::441;
 helo=mail-wr1-x441.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ewtG6vxm; dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B67LZ6pbgzDqnD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 16:50:30 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id f7so1234611wrw.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 23:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=QXxsUHXZZVvciOYyph5eTHTPiBdhp1mxQINCgx07QDQ=;
 b=ewtG6vxm01w1JIzwzDhJdWMLY/+0V92Fc+vPbVOWwVLQVkslmUoLcL1Q8LeomG+CtR
 lOjTr8zoJfC9wW+HSs2BUP+ScSBz/0tOMxYmpWrbBv+p30nzUHA2ouD1poHBzLD81qS7
 9k63lSwHfwqri3RB/ciA/vA6RgoqsiHFx1eLccJERN+dKZGkovOaqeDli5iEXdPUIXaF
 Woql8b1SpBHKHEhDUERvRnfzKOriQMmrLbPgjF2eXFYfU4LUylJ07vBNUh7NC82RZOV/
 9t6O9ObqTCJYqjiqDWoApz0crtbiiPo8c0jLFnODN5He91Iftt0YwxHDwvl9RPlEU5k0
 I54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QXxsUHXZZVvciOYyph5eTHTPiBdhp1mxQINCgx07QDQ=;
 b=eazLOTq8uxgK4HvLQV+KIrykZ5NilR5487+yrWJnpcyf8WCMTtCMrQqbz5v3AvD4HE
 OrXW1fhtEqW4jXhpIPrE3mfmfuqGZk+R9Rkl8RQ8s83UiYIfZGjv5n+GdsIkol79xwzG
 1AezeL5B7lzLH7rLDIVai32sVefoS72/nQFjKdTXan0zzGe4Z4WMJUosHUnNDsZQQWTQ
 icMUjB58aWwdhJR7NpKtHlChkBHZN/1Ka3jA6S4QXDm3CbGBHzZYHCMEPyTETndxgSH8
 mmdzEPOiglnOQeh5GgG04A5LSsbS26ya9UEcHGG8Q4jUE8epsVoc5VBwmOBBtBZ0lsH4
 H5pQ==
X-Gm-Message-State: AOAM533IHJYn6RDpXgQUO+JX7za64zaUmrBoluvITo6PHLVdzgi3kFLY
 l/nAwfE2IuKm0S6N+35PL1zBiQ==
X-Google-Smtp-Source: ABdhPJxVnyrCBXXko1nLLezo1Q5D+MxGRXdY9bVywIB6NcrXeSsJKk6xydd+B2XaLMoM15IQEvYvRw==
X-Received: by 2002:adf:ea4f:: with SMTP id j15mr9681935wrn.253.1594795826684; 
 Tue, 14 Jul 2020 23:50:26 -0700 (PDT)
Received: from dell ([2.31.163.61])
 by smtp.gmail.com with ESMTPSA id x18sm2010537wrq.13.2020.07.14.23.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 23:50:25 -0700 (PDT)
Date: Wed, 15 Jul 2020 07:50:24 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH -next] cpufreq: powernv: Make some symbols static
Message-ID: <20200715065024.GV1398296@dell>
References: <20200714142355.29819-1-weiyongjun1@huawei.com>
 <20200715034125.6x37w3csqmnia2jg@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200715034125.6x37w3csqmnia2jg@vireshk-i7>
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
Cc: linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Hulk Robot <hulkci@huawei.com>, Wei Yongjun <weiyongjun1@huawei.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 15 Jul 2020, Viresh Kumar wrote:

> On 14-07-20, 22:23, Wei Yongjun wrote:
> > The sparse tool complains as follows:
> > 
> > drivers/cpufreq/powernv-cpufreq.c:88:1: warning:
> >  symbol 'pstate_revmap' was not declared. Should it be static?
> > drivers/cpufreq/powernv-cpufreq.c:383:18: warning:
> >  symbol 'cpufreq_freq_attr_cpuinfo_nominal_freq' was not declared. Should it be static?
> > drivers/cpufreq/powernv-cpufreq.c:669:6: warning:
> >  symbol 'gpstate_timer_handler' was not declared. Should it be static?
> > drivers/cpufreq/powernv-cpufreq.c:902:6: warning:
> >  symbol 'powernv_cpufreq_work_fn' was not declared. Should it be static?
> > 
> > Those symbols are not used outside of this file, so mark
> > them static.
> > 
> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> > ---
> >  drivers/cpufreq/powernv-cpufreq.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> Lee also sent a fix for this, but yours look complete :)
> 
> https://lore.kernel.org/lkml/20200714145049.2496163-7-lee.jones@linaro.org/
> 
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Yes, looks good to me.

Reviewed-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
