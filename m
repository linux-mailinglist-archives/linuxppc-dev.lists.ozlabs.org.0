Return-Path: <linuxppc-dev+bounces-15012-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D739ECDE8A3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Dec 2025 10:36:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dd0qb1fk5z2yFQ;
	Fri, 26 Dec 2025 20:36:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766741787;
	cv=none; b=LN5gOIVRmOricLN7cD3ABSUNZNoRR/Fg2xc9JSVGUKFyZgHS85xoHAgLXjOjS28T0c0D8iW+61z20Lz+yPWBQ+XuUHQMZQJ97EOqSddg5Sus4CDQjiy+TGEdZCDmUSxnEk7/cCRicXa0v8qt182x7xFfdP8f5BKOwKJ3OPRHnpHSsn6BKv34yJEy1QrwBUBxVPp6LQVvxiJHcW3Rt7AfxlwP77iZLk88lBe783oIp6mc3CQ6z7Wjkih2Y1qDOXcfc5AgnFK6nA0Rj1X8ZtiLzpPcW782kVmk2LgXKiFROaVOsttdog7hPrWWMpBOGvvIm7x7EsgwSqRGsQ8j/r7aWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766741787; c=relaxed/relaxed;
	bh=rpUYSN7LOfndvWeXD71hxMCopt3fFad/Uy55qlltHmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=newq7rsrOaO5ic3D1Z50AQKsgjfHHgJGeDYYtDCBkSt+EUiUEoFIwHrxnif/0t/qvCkEA84OhGEtPMfCYpIdv2HxHvP57ieohxLtfmreQEQ42bVdzWqGR9Ub/Zk1iExBt0xWaJPg5XNBDsNDpCgi8+SVKi0YQleXRFB9DEGykXj93XYk3V0rj8N6ztDhi7R29bPeniPFz328OfNfKowBySPupCfDRrxmCvo+5DW+BqUhX0sIhG27e9NpcuemSlrUvCxkyBeOOCozzPvh/CyS8zvKq/717/liE5ljGgoiFSaVpstTbWMSxP/LcFSrmoG0P9rMxxbacv2+i2KcQUBGYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gmon/TnI; dkim-atps=neutral; spf=pass (client-ip=209.85.128.51; helo=mail-wm1-f51.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gmon/TnI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=209.85.128.51; helo=mail-wm1-f51.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dd0qY0XbLz2xcB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Dec 2025 20:36:23 +1100 (AEDT)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so38334095e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Dec 2025 01:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766741720; x=1767346520; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rpUYSN7LOfndvWeXD71hxMCopt3fFad/Uy55qlltHmQ=;
        b=gmon/TnIYl0WP92JDWvZJVErdr6I5h1Ju3tOWw1H+UI9SvoToqjfDpoIJJwbezQx7y
         al/ynI4Rt71hQ1lUc+XTBUyhFGDvAsu/hNe89IiswgZX8CosMPi+PMImhKVmnn2KNTtI
         Eclz815vvNQjiBewNtilkUptRuNVPBjGod2HMPRzOFqvK9j/07pPzJXw5nlN285b+LpQ
         9pTvq0WPNWVK33M8pVDKk6YdosQNBk99VY8SWfNaMn/v97J7y9VobJnhCUEiJYFzTpq3
         rpoLe4Ch++/Ls1LvOGA/Bn8+LhWYLl5kMhExwWfC64H5aYiNKOpjY+tDtwBwt7aaZL/6
         7cXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766741720; x=1767346520;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rpUYSN7LOfndvWeXD71hxMCopt3fFad/Uy55qlltHmQ=;
        b=nM7CYPp21I/ZZCqf2X6Wmkx01onc+nD1en9pkzW74NAuQy9fxSvGXXuWb1csHwOPVC
         pYYBC9toXssmMdkz5IQEIhQcLA++zbkdmagxhy/nZHUz3UDr6PEJ5nUZtYVmaOirxEvu
         BUp5e92CNRBcAZ3zySS8hPx+GLNhBLJ32Kz6LBXfAxVQe0/i0Qcc1yZewe0wA7Nc566P
         FOyNzOL7FugJry70GOnfd7S1EO4o1oM6VfdsGECTJQD7QVTwcx9hOw5ssx4MMkzg18fv
         +ln84qzf0nWB6I2lSe/m0WIl0Gbc3NT+h3X1l99vGZQBusUFnG+7d3vuWJQrb1IwS6b/
         SogA==
X-Forwarded-Encrypted: i=1; AJvYcCUFO1CxtlLlOUGrOkKIwa5QCPpwRTrk7y4is7fRT3c2nW6OLXVAXmzJED9gfCLFiUSpm3RP5sqqzjqWm50=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz1yQ/5wx4uGmcv8L5llpm5sVtNGrUiXosvNAYU5HkWkADPAPGm
	2rKym1ELK7f+8ITX+z4xDEg6lBkTg7YkYkF3F25e47IJE324gI6kdf14Bdi/y1JQ+LgyZxCxadP
	JCGiF
X-Gm-Gg: AY/fxX5bVRaXtSAwQ8WAkpuMhwqGTeyhCMJd5L3f0oSxcv+hjpp1S3rqQSvk2dkMMbu
	8NPoxT39OTeQp7AgbAObQQKa6cjPQ518S3WPsflSi4aN5TFQB31Yjjdm5zVeQW9WA06MXvycZDN
	vOns7/zJbrDfTXZ153fU92rlHwIs9rfx5NuDMp3YiDiKUDIM+6vCtv7iWoZU8Dtw29NpHMx/2he
	4wZ3vuKCrcxezPPFK3nZeOPMnoqgPSQJxMxoqJJEHPMEvejvRACGpE6LpY6SXJX2+DsA4SZcZRX
	L/t2ycAdPxuldEL4XycgM9FiDdxddHXpe0gt72eYjcK+vL7d+qiaiu/iWYlVZhWytL3JHOlZrnA
	SQXJLLlD+y7ea5+alCzNDI7fAGTfIG/EA6G7w9fI2y1u+2mkJjaUstwD+abuzgIdfiOGh5qAWYb
	n0uNtAOMWrQ77oaEhc
X-Google-Smtp-Source: AGHT+IETp9OnXTxIUo3XNBLgddP7lEA3N3rRTgRdN8yeWCcT0DcWuRaZ5faTgsy/Xb0aILvmgm3E5A==
X-Received: by 2002:a05:600c:848c:b0:47b:d949:9b87 with SMTP id 5b1f17b1804b1-47d1954a485mr210168905e9.12.1766741720119;
        Fri, 26 Dec 2025 01:35:20 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be26a81b6sm447635155e9.0.2025.12.26.01.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 01:35:19 -0800 (PST)
Date: Fri, 26 Dec 2025 12:35:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, ioana.ciornei@nxp.com,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Su Hui <suhui@nfschina.com>
Subject: Re: [PATCH] bus: fsl-mc: fix an error handling in fsl_mc_device_add()
Message-ID: <aU5W1HKL4amapLrM@stanley.mountain>
References: <20251222074958.992911-1-lihaoxiang@isrc.iscas.ac.cn>
 <cce0a0ca-9ea1-437a-a857-17a2bfa28791@kernel.org>
 <aUucPsDoPQJE5Ucj@stanley.mountain>
 <ad465fd1-4b5a-4fa1-b4fc-1ca7bd6fe5b4@kernel.org>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad465fd1-4b5a-4fa1-b4fc-1ca7bd6fe5b4@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Dec 24, 2025 at 10:57:52AM +0100, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 24/12/2025 à 08:54, Dan Carpenter a écrit :
> > On Tue, Dec 23, 2025 at 04:34:44PM +0100, Christophe Leroy (CS GROUP) wrote:
> > > 
> > > 
> > > Le 22/12/2025 à 08:49, Haoxiang Li a écrit :
> > > > If device_add() fails, call put_device() to drop the device
> > > > reference and do the cleanp.
> > > > 
> > > > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > > Closes: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2Fb767348e-d89c-416e-acea-1ebbff3bea20%40stanley.mountain%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cfd3865935a164c2083cc08de42c1b5a5%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639021596902232212%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=j5%2BqptzXvrxcnaaH3PIDorAYMexoPmf3PWi5GbpVD9s%3D&reserved=0
> > > > Signed-off-by: Su Hui <suhui@nfschina.com>
> > > > Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
> > > > ---
> > > >    drivers/bus/fsl-mc/fsl-mc-bus.c | 3 ++-
> > > >    1 file changed, 2 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
> > > > index 25845c04e562..90a2107a9905 100644
> > > > --- a/drivers/bus/fsl-mc/fsl-mc-bus.c
> > > > +++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
> > > > @@ -896,7 +896,8 @@ int fsl_mc_device_add(struct fsl_mc_obj_desc *obj_desc,
> > > >    		dev_err(parent_dev,
> > > >    			"device_add() failed for device %s: %d\n",
> > > >    			dev_name(&mc_dev->dev), error);
> > > > -		goto error_cleanup_dev;
> > > > +		put_device(&mc_dev->dev)
> > > 
> > > This change has obviously not been tested, not even built.
> > > 
> > 
> > Yeah, it doesn't build.
> > 
> > > And by droping the goto, the kfree() are not done anymore, leaking
> > > mc_bus/mc_dev p kzalloced areas.
> > > 
> > 
> > Calling put_device() triggers fsl_mc_device_release() which does the
> > free.
> 
> Ok, then this needs to be said in the commit message.
> 
> By the way I'm a bit puzzled by the device_add() doc versus the
> put_device(), because it looks like device_add() already calls put_device()
> in its error path, see
> https://elixir.bootlin.com/linux/v6.19-rc2/source/drivers/base/core.c#L3716
> 

It's refcounted.  It calls dev = get_device(dev) at the start so it
gives up its own reference at the end.  We need another put_device() to
free everything.

regards,
dan carpetner


