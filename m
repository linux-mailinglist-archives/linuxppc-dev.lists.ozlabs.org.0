Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A372A7991
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 09:42:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRcTr1PHYzDqRD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 19:42:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::343;
 helo=mail-wm1-x343.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Hz1iWtTM; dkim-atps=neutral
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRcQN03c2zDqQR
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 19:39:39 +1100 (AEDT)
Received: by mail-wm1-x343.google.com with SMTP id h22so724537wmb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Nov 2020 00:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=EuWZSrVi9knNvYJnSN3RychJR53ENGdBNfnOyxgGxcg=;
 b=Hz1iWtTMlWRAwjHOfszeYpxfuoK4vHOgzZKs90QMyIu2h2rXdHDhQ6fX3TrFCeJrfD
 NFFrri7HD19a9x9cjXmOr2peByCKUvB9exU2TwjTkvG+lQa+WlUVMaryeRDhQyy5UKmc
 2dOJgTdbWIxlLpepbWxa+tNdlXkunBy09UheLimiN1v00Q96B2nVJyPWI5U6eSqrcssN
 5z9FmbFKDQpJW3CzJthejpixX9cLE4WhpmCN6FbbqLbhdmvqJNhxloygE3lVsOiJkXLm
 QS5aAbgq1+i1JzkOGNUT4GN4KBce3FTF3i7jxo3fWlqYQUH0Pk2UnLoEet8Xyr6cmBTF
 6SLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EuWZSrVi9knNvYJnSN3RychJR53ENGdBNfnOyxgGxcg=;
 b=p5MHIzxQZ/tnPDjhoDslZe9PMEVQWVnY+1XeklEHfqa2YOPDbyCaY9l/BjoGqEhzw3
 jb0kizsgmTc/9Z05G8Jc/CTknvv39cxuFWG8XO8tS+lg9gs0sBgHytaBKjWnAeYeW+XR
 eRSofMTb8HKlx1NCukyx9wqOFWOiw5MA0oqbB7xCKr8TvQj15n+bbnUFJMhc7oxw++CO
 flRlL6gTleTh6v1cfUdCJeJBnowcEF9xreh/h+9U/I89ZJU4f1gpODoRqlWIA5+YFrI4
 CVDYQnvCDrGF0uDnDQkL3EplYVoamYAaD62HfJK0wo3J3l3ORZqBeabT0vxOnVhiBawP
 T95Q==
X-Gm-Message-State: AOAM5303B8CEorturzJajZ381jEJWwh5KO/3IOYP3yOSHUcNT6AHdULk
 dufID+HNzkfm+NrqijHdMaJinw==
X-Google-Smtp-Source: ABdhPJzigf5oR8A5V2hobQV1yIWRpdACLg0Wp9kbmXTqvZc9e+xjEZU6Pg5BjWZiblA0wS+bMv+aVQ==
X-Received: by 2002:a1c:2e0d:: with SMTP id u13mr1414382wmu.179.1604565575083; 
 Thu, 05 Nov 2020 00:39:35 -0800 (PST)
Received: from dell ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id z15sm1425758wrq.24.2020.11.05.00.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 00:39:34 -0800 (PST)
Date: Thu, 5 Nov 2020 08:39:32 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 31/36] powerpc: asm: hvconsole: Move
 'hvc_vio_init_early's prototype to shared location
Message-ID: <20201105083932.GY4488@dell>
References: <20201104193549.4026187-1-lee.jones@linaro.org>
 <20201104193549.4026187-32-lee.jones@linaro.org>
 <87r1p8u230.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87r1p8u230.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 05 Nov 2020, Michael Ellerman wrote:

> Lee Jones <lee.jones@linaro.org> writes:
> > Fixes the following W=1 kernel build warning(s):
> >
> >  drivers/tty/hvc/hvc_vio.c:385:13: warning: no previous prototype for ‘hvc_vio_init_early’ [-Wmissing-prototypes]
> >  385 | void __init hvc_vio_init_early(void)
> >  | ^~~~~~~~~~~~~~~~~~
> >
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > Cc: Paul Mackerras <paulus@samba.org>
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  arch/powerpc/include/asm/hvconsole.h     | 3 +++
> >  arch/powerpc/platforms/pseries/pseries.h | 3 ---
> >  arch/powerpc/platforms/pseries/setup.c   | 1 +
> >  3 files changed, 4 insertions(+), 3 deletions(-)
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au>

Thanks.

> > diff --git a/arch/powerpc/include/asm/hvconsole.h b/arch/powerpc/include/asm/hvconsole.h
> > index 999ed5ac90531..936a1ee1ac786 100644
> > --- a/arch/powerpc/include/asm/hvconsole.h
> > +++ b/arch/powerpc/include/asm/hvconsole.h
> > @@ -24,5 +24,8 @@
> >  extern int hvc_get_chars(uint32_t vtermno, char *buf, int count);
> >  extern int hvc_put_chars(uint32_t vtermno, const char *buf, int count);
> >  
> > +/* Provided by HVC VIO */
> > +extern void hvc_vio_init_early(void);
> 
> extern isn't needed, but don't feel you need to respin just to drop it.

That's fine.  I don't mind re-spinning.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
