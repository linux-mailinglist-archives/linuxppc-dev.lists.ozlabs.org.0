Return-Path: <linuxppc-dev+bounces-15013-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16820CDE8BB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Dec 2025 10:41:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dd0ww4svWz2yFb;
	Fri, 26 Dec 2025 20:41:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766742064;
	cv=none; b=SuEmXbqcKih9ly44ABa7HvVeXlaYImqy4Dr/sRrgfcQrX+xQ0DR4HVwRpqSsUpaoA0QPehYAOGFP3lHWD1hMvQHGcDAbHE6pzuVhmC5RZQDpOyd7Z3MzmNEgcsYMNP68jeuicdpDIzEHEFbPa0J4nPw4omxE3JpdOXq6raZZQj5IdhsMx/GDRLurnB0DDpvSGRaDvu/uuAXeSG1KM11IH3fvphlMU9mn5n+JiGwOLGLeQEKH8mZa6iIeH1vQ6gAq+9kFHP3v2x1xwvaD+EWcLCiBiSEENpUgY49pPK0Eg0fAWoe6UpJiqMLeBIpytr6xKRhTLt4S1FvhuBZ9dQVJvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766742064; c=relaxed/relaxed;
	bh=az+/i3OnvpeSw9QBjkFEo+G8RK0rnKgYizEwvKs3SkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z/tQW6SoPZB1jURUUdYkGR5l6tW5mdd6vCR4H8b6gTleiZg9mtacrVMoKHZjoMbkz7BE7a43Rt3xR0cuSRR1udh3AYR47vsu2qIW5d9aBjURbt3FH9VFkbjsZcE1v4regloUyygZ3bt5b3by7PncjpE/aBbn34rRpFkPwgKUE+UUxb6iXxMXTeaMLn/GIX3mWsD4IbkrsLQxKN0lpOlynkFUCirkQbe5FC6Y1sY7FeL8kZvq+15DmN6Rur6U0Zq5nfJEABQil7dLsKI3bCkhM6BhIImsmeY8bQjUq4OWIxdeb11fWwNwf00Ed9S8GA3aUv2TXoYT+gMb8xSbcdtpxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Cgp8bw4m; dkim-atps=neutral; spf=pass (client-ip=209.85.128.53; helo=mail-wm1-f53.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Cgp8bw4m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=209.85.128.53; helo=mail-wm1-f53.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dd0wv5S1Nz2xg9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Dec 2025 20:41:03 +1100 (AEDT)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso69009565e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Dec 2025 01:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766742000; x=1767346800; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=az+/i3OnvpeSw9QBjkFEo+G8RK0rnKgYizEwvKs3SkI=;
        b=Cgp8bw4mySAiKMCEmN/ElZpEop9IC3t0QBLCits8aU9MHC4AILjEwH4zfGD72ZAKVK
         KvdKxs3EsaWyyQeAWijoMeEEFWLz03BuKoq4YR1G9JDVB5GxSHcJ02PLcrQ2MLFGaBsy
         sq52GYQjHLU0eKnbofGwvzDCflCXvBoM05OGBrDLN7fJXfgg77blYPk1I/xj61jiatZ1
         FlEdVP4jIEqO8jTi3CLpi2FJOGedv2LceM/oNl2AMfVaRbUvxRaUmyBYGvOM9j46Xe8e
         rdYM5XBNvB2Iqi6bqBLhNx2X69J+CXxI0ZcMbrXIlWmuUO1D3iYMzbkwtNmGb0ydpKlk
         Jy8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766742000; x=1767346800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=az+/i3OnvpeSw9QBjkFEo+G8RK0rnKgYizEwvKs3SkI=;
        b=CMqqNi89cckfaoQw7t0n+p6I8qK5M7PUE5dHJNOAm11LalrI64mJM/Te3mKquhQqsp
         bvWdi0O1n1o+SkTnFgsUHAsz8sBZ2axpGy7RQXstWPiLdhdtUBGHXuDlmEAW7PMrfCB0
         /OFAnu9gK3aqWmMQ42oBPHNfOaDSLUmHk2nz8y7j6wKO01NLst0sapld1qTS8HYqg5uv
         T77uzgGMV6HEnNah/griPQGjNUQANTCReU8fr//uT34kkR4fM+4AjTXVorjkiHn33Dn5
         Y38SViDVE4zO0lzGRwmxUKJvBjrn8tpjmTGL9roV8hqEF8vX3hHtpj0ZsEjBQuZv5Am0
         5pfg==
X-Forwarded-Encrypted: i=1; AJvYcCVwaU4h7Ikeu3+Ep/YRH1Alm3b/nGxd0+97iC9EOkejmBhYno6fp8fQkDFxU+GoebVKARFwrWy2ja6zuBQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yywd2FjWjV3kHuE4NqQpowRh/8hio4GZplnnf/2ICVRe7Wa6dx4
	VqtE+nJ0w0ZpIx/KtE11wclsNusRFZcTTZBq9vXGYMLcBWJOH1xtYdTStRuLlhf6dTw=
X-Gm-Gg: AY/fxX4sDz1ROXoy1ewdbIFVw7x4joZW0lWQleIHaNZmFpkBcgd0KQJvNN8M15/QdtM
	w4FU9DFZ32z9GxrLLbxs+QNVAp8ekzRAYsR/KdfNRONt5LY0TQJDn43I6ELzZLIcNZk1qoABAhA
	AvmYTuuShvrw3Pa1HM8eWqaxjKM3PqGXvLx+xCR4zCaCOfKP7AKMXQoD9j1jwW4bp6DFrnkOFp+
	n8otKV4K3qoFn3KKheJ1yYv1Yup4trbBS/yPC6iGbutBp8ICnCp0Ji3Cc7wRRh1kQaAVmCjBHTV
	9uaKy3SruL9igrlEirBXJYS8yXl48tP5bCOwvD9xOwCeQzhh5UI5x3f6JY5iVxBevQ2472AUuUI
	cTgTctvCbxyPS+AGimiVkGr4NI8eDgUaZebk+G5UBZ3aodaYarKKwMs9GbJ+zBDFywXwscLg0sJ
	vAAkkfd0TNsoYjfJhq
X-Google-Smtp-Source: AGHT+IE9OFj2HfnlgFleWoTH3rxJpkalg7/y6n0R4uHDNui9njYMj6Eh/CedwIxzu80u1IRcIdtN2w==
X-Received: by 2002:a05:600c:4e42:b0:47b:de05:aa28 with SMTP id 5b1f17b1804b1-47d1956eb65mr193897495e9.2.1766742000394;
        Fri, 26 Dec 2025 01:40:00 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193cba81sm376536275e9.10.2025.12.26.01.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 01:39:59 -0800 (PST)
Date: Fri, 26 Dec 2025 12:39:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: chleroy@kernel.org, ioana.ciornei@nxp.com, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, suhui@nfschina.com
Subject: Re: [PATCH] bus: fsl-mc: fix an error handling in fsl_mc_device_add()
Message-ID: <aU5X7bpTSgjsSfMm@stanley.mountain>
References: <b7f7e968-a683-4e1e-8ccc-5dd19f0f15c5@kernel.org>
 <20251224112600.1592218-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224112600.1592218-1-lihaoxiang@isrc.iscas.ac.cn>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Dec 24, 2025 at 07:26:00PM +0800, Haoxiang Li wrote:
> On Wed, 24 Dec 2025 12:07:22 +0100, Christophe Leroy wrote:
> > Ah yes, I see.
> > 
> > But then all exit paths in fsl_mc_device_add() after device_initialize() 
> > should call put_device() ?
> 
> > Then in fact the fix should instead be the following, shouldn't it ?
> 
> > diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c 
> > b/drivers/bus/fsl-mc/fsl-mc-bus.c
> > index 25845c04e562..6d132144ce25 100644
> > --- a/drivers/bus/fsl-mc/fsl-mc-bus.c
> > +++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
> > @@ -905,11 +905,7 @@ int fsl_mc_device_add(struct fsl_mc_obj_desc *obj_desc,
> >   	return 0;
> > 
> >   error_cleanup_dev:
> > -	kfree(mc_dev->regions);
> > -	if (mc_bus)
> > -		kfree(mc_bus);
> > -	else
> > -		kfree(mc_dev);
> > +	put_device(&mc_dev->dev);
> > 
> >   	return error;
> >   }
> 
> Yes, I think so.
> However, I submit a same fix months ago and got a reply:
> https://lore.kernel.org/all/2025052622-nautical-suitably-486c@gregkh/
> 
> I didn't figure out why, and look forward to experts' guidance.

That's a different patch.  Perhaps it didn't apply?  *shrug*.
Christophe's patch looks correct to me.

regards,
dan carpenter


