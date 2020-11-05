Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 450292A7988
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 09:38:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRcNY54DrzDqdM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 19:38:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::443;
 helo=mail-wr1-x443.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=n9Gsyc5z; dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRcLz4QNHzDqVr
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 19:36:37 +1100 (AEDT)
Received: by mail-wr1-x443.google.com with SMTP id p1so689017wrf.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Nov 2020 00:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=fVjcjfrrmXORahZp/hVfTr8m+lXVmFllNiKKjDMWxII=;
 b=n9Gsyc5zxdSKZ/TXEy7Q1nx0i1xElsOyId6HnuuHMzeVeqN9iSVzatw05vGO7/5K5m
 ecn+0SclYkXIFCNHBHmiQPvqp3o1KfVg+9wX7/Ap9yfDp/7ZiSu4G80c0x9MX7cINAcD
 Z4WBcZGVgXXuQSkfrmZZmcuFCkOtVHCVT4oleIgD22cVRVECpWH7ri2rjNeYagsqKZy5
 gS9edt1U92OFeICdQ4olSaflYMshl5zfYrietGxMgb3+kfGzsWNtpwZgFpUtnHBJB4sc
 pLwSML8QcLiVydeeQPpfwmAcQ6OPTm0W+PjsOYKGIrRfUxiXYeHdsvYTzismMOnLcRjN
 W7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=fVjcjfrrmXORahZp/hVfTr8m+lXVmFllNiKKjDMWxII=;
 b=lI+YVLDgFOFXSLbOwsylpWqtZYtPkdb/M172awJ2/kwimvdqzDySjVEsHHTdEz3wzh
 bfCRkS+hRkaUrCkxaXeTw6M17huNxfju7t+HQqzdCfoSbWMENxEJRM1zLmPeY2ZGdoXP
 FbXDDgf2j4atlsy27H6SXdD58pGp00g1froQy2Crq1Buu74PUbXc3FSxSW/zv80qnsxa
 ItilBt1P9VdLhclDFVyHCDaAD61dwJcpAX554jPOVhaNNiDGKP7qq9pAhe7pzztBi0kR
 NdHhXtCUPIaxdR3WUDD1PBRuDbKsSXvJnyWUfK+OmgEoYKxBezLQ0dLUvfeM26Jfu9oc
 JhxQ==
X-Gm-Message-State: AOAM532KEHeyQKMC4sGjxB5OmPhy7ywChnwrrw7RcOwR9rcDMpQoUODn
 IL9dbez/h8q3wYkHNCYzR/cP7w==
X-Google-Smtp-Source: ABdhPJywWSiq38BqbSd7YukFXshDJiCN4Em7tr9zBcurHrSuOGtYsiYwTQM9YCvQ5PvPaKd8VwAPwA==
X-Received: by 2002:a5d:55c8:: with SMTP id i8mr1461048wrw.194.1604565389496; 
 Thu, 05 Nov 2020 00:36:29 -0800 (PST)
Received: from dell ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id u16sm1337124wrn.55.2020.11.05.00.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 00:36:28 -0800 (PST)
Date: Thu, 5 Nov 2020 08:36:26 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH 34/36] tty: serial: pmac_zilog: Make disposable variable
 __always_unused
Message-ID: <20201105083626.GW4488@dell>
References: <20201104193549.4026187-1-lee.jones@linaro.org>
 <20201104193549.4026187-35-lee.jones@linaro.org>
 <445a6440-b4c8-4536-891b-0cefc78e5f57@csgroup.eu>
 <e027b620-56f8-7d8b-84ff-54839f94a4c7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e027b620-56f8-7d8b-84ff-54839f94a4c7@kernel.org>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 05 Nov 2020, Jiri Slaby wrote:

> On 05. 11. 20, 8:04, Christophe Leroy wrote:
> > 
> > 
> > Le 04/11/2020 à 20:35, Lee Jones a écrit :
> > > Fixes the following W=1 kernel build warning(s):
> > > 
> > >   drivers/tty/serial/pmac_zilog.h:365:58: warning: variable
> > > ‘garbage’ set but not used [-Wunused-but-set-variable]
> > 
> > Explain how you are fixing this warning.
> > 
> > Setting  __always_unused is usually not the good solution for fixing
> > this warning, but here I guess this is likely the good solution. But it
> > should be explained why.

There are normally 3 ways to fix this warning;

 - Start using/checking the variable/result
 - Remove the variable
 - Mark it as __{always,maybe}_unused

The later just tells the compiler that not checking the resultant
value is intentional.  There are some functions (as Jiri mentions
below) which are marked as '__must_check' which *require* a dummy
(garbage) variable to be used.

> Or, why is the "garbage =" needed in the first place? read_zsdata is not
> defined with __warn_unused_result__.

I used '__always_used' here for fear of breaking something.

However, if it's safe to remove it, then all the better.

> And even if it was, would (void)!read_zsdata(port) fix it?

That's hideous. :D

*Much* better to just use '__always_used' in that use-case.

> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Cc: Jiri Slaby <jirislaby@kernel.org>
> > > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > > Cc: Paul Mackerras <paulus@samba.org>
> > > Cc: linux-serial@vger.kernel.org
> > > Cc: linuxppc-dev@lists.ozlabs.org
> > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > ---
> > >   drivers/tty/serial/pmac_zilog.h | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/tty/serial/pmac_zilog.h
> > > b/drivers/tty/serial/pmac_zilog.h
> > > index bb874e76810e0..968aec7c1cf82 100644
> > > --- a/drivers/tty/serial/pmac_zilog.h
> > > +++ b/drivers/tty/serial/pmac_zilog.h
> > > @@ -362,7 +362,7 @@ static inline void zssync(struct uart_pmac_port
> > > *port)
> > >   /* Misc macros */
> > >   #define ZS_CLEARERR(port)    (write_zsreg(port, 0, ERR_RES))
> > > -#define ZS_CLEARFIFO(port)   do { volatile unsigned char garbage; \
> > > +#define ZS_CLEARFIFO(port)   do { volatile unsigned char
> > > __always_unused garbage; \
> > >                        garbage = read_zsdata(port); \
> > >                        garbage = read_zsdata(port); \
> > >                        garbage = read_zsdata(port); \
> > > 
> 
> thanks,

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
