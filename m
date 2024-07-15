Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A669318FE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 19:12:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=igaXHuVa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WN7zQ07tzz3cZs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 03:12:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=igaXHuVa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::c2e; helo=mail-oo1-xc2e.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WN7yj277jz2y8W
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 03:11:22 +1000 (AEST)
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-5ccfdc3157dso1297015eaf.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2024 10:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721063479; x=1721668279; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9lkVsVegZWb4nDKyM/hEerXFr2vdLkv9KD3h/brW3Bc=;
        b=igaXHuVa88zSyaG/yS8CI7t1RaEeRniZWffi6jns5jgo2EWRqVbcC13REP9nUbWK/J
         UF2YI712zZ66CaAx0MRyi9sagqqF7dQGrswBWA5e5PLDCOpXPrJhkcYcjuG7vhESSBFD
         ii/JsAnQJyoMpPoDa45UcgzWKXcD72+S773MO9bafHrH4HsCJFavVYLvwAQFv+B5OV8+
         yrFrG1D1nzC3EjIAZxcdIFKtu4RAbLKLBLkw8UfTZsI5f31tfJo1kGaLYJ9qUwKPr/iP
         PCZhoMcsyeDy6n1rzU8MomhEoGLEpUqgdrMa9UN4IdcXVWtcOkWVbnqN3/uGjME78QUK
         u1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721063479; x=1721668279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lkVsVegZWb4nDKyM/hEerXFr2vdLkv9KD3h/brW3Bc=;
        b=qy3FDvZ7Ld0UJ8ZEeNeHvLqNgg72zQCPmJ9t/LMeGz5fYF9Qj/nvv3OaoJd9QqK4i4
         sjoBwZ9yNClSx12OQm3BfQueDPDRH1zjj86F89/EE3vzwPSrhYQGn298CY40QUWSG2lZ
         b88jB6T4j/YCA1rT6icVXG9Y5rfzXgkS3sCWlJff6cTy6ZhToEzRD40lIvhr8JmgWFow
         mPpR+ZfF/4Aa4LCfmefh8Go1dkCfo88PV5gea2dIsH2TpIR/bDObG/2owNvq/8IrCrbu
         I9As/7Fyq2JEmD4pFDXzi8ympJG27/KbmfiJ8rz9MIBDytZIir2zDLa67bWzhOjHS6Fa
         O+7w==
X-Forwarded-Encrypted: i=1; AJvYcCX5g6OUK6CIJ/BvdKEISungKqNiLih40cb86gtmqcQlZ+WWRyQBL/xYLkEoesEYLEx8tUUaMmHG3Ju4ZiqbVAQQa6j1Ww9dV2w2pbXGBw==
X-Gm-Message-State: AOJu0YytlfnJHo/pYr0LSa3m8sxvWcxA0PRSLp6LhUgD0mUnEwGq1YpR
	SKKxA4OEmpknOzZu7OXKe9PKzxJEcJiPpQ/XygPc7DRHMf3hXVzGJ5gl8M8WJiE=
X-Google-Smtp-Source: AGHT+IF3Y5r7ANdidB8C985shaZ7Y4HsbOHKtwwiZnz6qoF9sy+jIhyV9aA0zqaSYAUY8dPs31frdQ==
X-Received: by 2002:a4a:c3cc:0:b0:5c6:989b:a1ca with SMTP id 006d021491bc7-5cc99922016mr4589202eaf.3.1721063478879;
        Mon, 15 Jul 2024 10:11:18 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:750c:19a4:cf5:50a9])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5ce753d22ccsm897578eaf.15.2024.07.15.10.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 10:11:18 -0700 (PDT)
Date: Mon, 15 Jul 2024 12:11:10 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v4] cxl: Fix possible null pointer dereference in
 read_handle()
Message-ID: <6630fb82-9836-453d-a8bb-cf8f19b5665f@stanley.mountain>
References: <20240715025442.3229209-1-make24@iscas.ac.cn>
 <87y163w4n4.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y163w4n4.fsf@mail.lhotse>
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
Cc: ajd@linux.ibm.com, arnd@arndb.de, Ma Ke <make24@iscas.ac.cn>, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, manoj@linux.vnet.ibm.com, imunsie@au1.ibm.com, fbarrat@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, clombard@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 15, 2024 at 04:28:15PM +1000, Michael Ellerman wrote:
> Ma Ke <make24@iscas.ac.cn> writes:
> > In read_handle(), of_get_address() may return NULL if getting address and
> > size of the node failed. When of_read_number() uses prop to handle
> > conversions between different byte orders, it could lead to a null pointer
> > dereference. Add NULL check to fix potential issue.
> >
> > Found by static analysis.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 14baf4d9c739 ("cxl: Add guest-specific code")
> > Signed-off-by: Ma Ke <make24@iscas.ac.cn>

The bug is real and the fix looks okay to me. I'm surprised that Smatch doesn't
print a warning about "size" being uninitialized.  I must not have it enabled
in the .configs that I test.  But I also wouldn't have reported that because
it's from 2016 so it's too old.

> > ---
> > Changes in v4:
> > - modified vulnerability description according to suggestions, making the 
> > process of static analysis of vulnerabilities clearer. No active research 
> > on developer behavior.
> > Changes in v3:
> > - fixed up the changelog text as suggestions.
> > Changes in v2:
> > - added an explanation of how the potential vulnerability was discovered,
> > but not meet the description specification requirements.
> > ---
> >  drivers/misc/cxl/of.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/misc/cxl/of.c b/drivers/misc/cxl/of.c
> > index bcc005dff1c0..d8dbb3723951 100644
> > --- a/drivers/misc/cxl/of.c
> > +++ b/drivers/misc/cxl/of.c
> > @@ -58,7 +58,7 @@ static int read_handle(struct device_node *np, u64 *handle)
> >  
> >  	/* Get address and size of the node */
> >  	prop = of_get_address(np, 0, &size, NULL);
> > -	if (size)
> > +	if (!prop || size)
> >  		return -EINVAL;
> >  
> >  	/* Helper to read a big number; size is in cells (not bytes) */
> 
> If you expand the context this could just use of_property_read_reg(),
> something like below.
> 

You're a domain expert so I trust you, but as a static checker person, there is
no way I'd feel comfortable sending a patch like that...  It's way too
complicated and I wouldn't be able to test it.  If this were my patch I would
ask you to handle send that patch and give me Reported-by credit.

regards,
dan carpenter

