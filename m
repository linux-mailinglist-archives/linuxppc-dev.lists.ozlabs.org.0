Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AF62A798E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 09:40:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRcRL42tSzDqv4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 19:40:30 +1100 (AEDT)
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
 header.s=google header.b=UV5ABRhp; dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRcPR2bbnzDq9T
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 19:38:50 +1100 (AEDT)
Received: by mail-wr1-x441.google.com with SMTP id 33so712333wrl.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Nov 2020 00:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=otFckZIXS18ZjK9MEqOur4ngqmLv0/zND2eNmr8zaUU=;
 b=UV5ABRhpQmAOptW3q1HYavNDWUwFaOf0baHBw+piJrIQg6p8VaXGRwzK5j/6sU5U8X
 x61Wh6IPT1RBrtmP2cFfZhtbUxG2tLh/v5W+WDLlkbFg49OEY78P1+VONAsJp0SBfjD1
 6TGpBEyJuLkqoOwETI9ONmtRjINrlM0zqgwH1h1ILZL0xKW3l2vlrKKaAhwJLeHEBSWm
 re5Vy8ilPX8FGyBup2ufBo6ROWI6OZAwRk6DYIaVW27nq3npXGpbFWyout+PukZTGD8z
 7wTzcRtpKdxrToRCO0t5CMsfKcnFHfdogfVzfKCjjZ4V6aaOYDYkX07w/bYPd2WwXDu4
 9rig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=otFckZIXS18ZjK9MEqOur4ngqmLv0/zND2eNmr8zaUU=;
 b=dXhGHGYaKYBmAk8xQXfm8dxCN/UkqIP7O1P9/GYX1qzmu8R3LhRFkHMMwOnD20UZxC
 O4fbfPAiHiECSQLDdSSvDatseB8izGTzLCrMbuRsriXYgxmESp7V5GoK7XqF9ZW+DO4i
 G12TCxiGV6ijNHhZ7OKJCcSsqXBbpdaSmcskF4cAcAg5xclJajmiAG8hM4trjO9pIlaD
 Y2DA5MKHoA5U12cY6UHiIt0yvNVqgoIQU+9yBj0pHvgfHzr6PG6Ix9HmAY4EvZlKMht8
 o82z5E4BG5Kd9iRM1wDSH06ThZaa/ubWwsEwcLB6Jlnmfc1+QBMqncPcMvgVxJQbmK5j
 5t8g==
X-Gm-Message-State: AOAM530j4D7VosEbtiDZLp3XiTOo4enZ7x3GAJZeYYPTgjEtje5JMzWw
 nJDtWMfFVJFEgVmFVReBD6fPvA==
X-Google-Smtp-Source: ABdhPJzc8axgaXbSHS8yEQMM9YXbzH0DsVHt+cad6dLb8q767w0vWXu9gnWs76g72ZA2+oybyEMB9w==
X-Received: by 2002:adf:e443:: with SMTP id t3mr1544244wrm.14.1604565527069;
 Thu, 05 Nov 2020 00:38:47 -0800 (PST)
Received: from dell ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id w1sm1485228wro.44.2020.11.05.00.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 00:38:46 -0800 (PST)
Date: Thu, 5 Nov 2020 08:38:44 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 31/36] powerpc: asm: hvconsole: Move
 'hvc_vio_init_early's prototype to shared location
Message-ID: <20201105083844.GX4488@dell>
References: <20201104193549.4026187-1-lee.jones@linaro.org>
 <20201104193549.4026187-32-lee.jones@linaro.org>
 <d2a23842-631e-cd5e-84ec-48485328ba52@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d2a23842-631e-cd5e-84ec-48485328ba52@csgroup.eu>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 05 Nov 2020, Christophe Leroy wrote:

> 
> 
> Le 04/11/2020 à 20:35, Lee Jones a écrit :
> > Fixes the following W=1 kernel build warning(s):
> > 
> >   drivers/tty/hvc/hvc_vio.c:385:13: warning: no previous prototype for ‘hvc_vio_init_early’ [-Wmissing-prototypes]
> >   385 | void __init hvc_vio_init_early(void)
> >   | ^~~~~~~~~~~~~~~~~~
> > 
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > Cc: Paul Mackerras <paulus@samba.org>
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >   arch/powerpc/include/asm/hvconsole.h     | 3 +++
> >   arch/powerpc/platforms/pseries/pseries.h | 3 ---
> >   arch/powerpc/platforms/pseries/setup.c   | 1 +
> >   3 files changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/hvconsole.h b/arch/powerpc/include/asm/hvconsole.h
> > index 999ed5ac90531..936a1ee1ac786 100644
> > --- a/arch/powerpc/include/asm/hvconsole.h
> > +++ b/arch/powerpc/include/asm/hvconsole.h
> > @@ -24,5 +24,8 @@
> >   extern int hvc_get_chars(uint32_t vtermno, char *buf, int count);
> >   extern int hvc_put_chars(uint32_t vtermno, const char *buf, int count);
> > +/* Provided by HVC VIO */
> > +extern void hvc_vio_init_early(void);
> > +
> 
> Declaring a prototype 'extern' is pointless. Don't add new misuse of 'extern' keyword.

No new code (misuse or otherwise) is being added in this patch.

It's just moved from one place to another.

I can also strip out 'extern' if it's preferred.

> >   #endif /* __KERNEL__ */
> >   #endif /* _PPC64_HVCONSOLE_H */
> > diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
> > index 13fa370a87e4e..7be5b054dfc36 100644
> > --- a/arch/powerpc/platforms/pseries/pseries.h
> > +++ b/arch/powerpc/platforms/pseries/pseries.h
> > @@ -43,9 +43,6 @@ extern void pSeries_final_fixup(void);
> >   /* Poweron flag used for enabling auto ups restart */
> >   extern unsigned long rtas_poweron_auto;
> > -/* Provided by HVC VIO */
> > -extern void hvc_vio_init_early(void);
> > -
> >   /* Dynamic logical Partitioning/Mobility */
> >   extern void dlpar_free_cc_nodes(struct device_node *);
> >   extern void dlpar_free_cc_property(struct property *);
> > diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
> > index 633c45ec406da..6999b83f06612 100644
> > --- a/arch/powerpc/platforms/pseries/setup.c
> > +++ b/arch/powerpc/platforms/pseries/setup.c
> > @@ -71,6 +71,7 @@
> >   #include <asm/swiotlb.h>
> >   #include <asm/svm.h>
> >   #include <asm/dtl.h>
> > +#include <asm/hvconsole.h>
> >   #include "pseries.h"
> >   #include "../../../../drivers/pci/pci.h"
> > 
> 
> Christophe

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
