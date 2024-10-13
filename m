Return-Path: <linuxppc-dev+bounces-2169-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5240499B9A3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Oct 2024 15:41:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRM2l6v07z2yN3;
	Mon, 14 Oct 2024 00:41:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::534"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728826879;
	cv=none; b=dSyCQOnFAuln5djkVL2t2WfZrgWrW2x9O88xtnHzltaBotJtL7CoftE9LvVpI3qm19lPjNuL0rlVRt60tlq9CGbs5/HfMdvTDALosXweuLqhtWDpRNU54lhXXXJ5PSH2BAHuT8HhTqHa4Q081Yq0WFMzQngHO7whFNUImApFlzT2D5A3ArpldyWE+ojLC4WJn5h/4N2I7Qk2mCj0wAcqRWS2pDYlZq4Frkz3o4o5Wt9XETr0ka7mpcMbZi2iBY576MKZCTYDvVy+Xtg33Q0smzqs9fvHrJnIvFads/W1hSecfPTUDH3r1hxen4HpAhBveFWUrMdmjoS19kF4PmCukg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728826879; c=relaxed/relaxed;
	bh=aDIoBQ9YvQk/WPHiA1xukRw9F4LXWDJBsa2YUNZUMcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H77L0S+9kOXzYltw1ej63MCPeX6QKmOPtqRmJVYP1Or7/0SVl+tQv1fPTxB7leCey0/XjJsWN1LFKOnaZVXqfh7bpR8fEG2gtWWUyO38nSk3GPsTjzbik72zgCtlQ71EMvSnBRGS16dkqcYG8JoFLNaV000jZNlcUkHwgwAIPz8ElNeaqN7N8O9te/+1MgZnkPmlhtl1lvl8GLi6eGwMREz75qkyFYu6nok4QM3WZrucqOscsUaDtQz7WpZu18ssdZgsfF0Flq+NXvFL1XIwf6aEGGXCvbcAaFjKIxQ9MvTCai7VleCjZm7H+eFLN9DjO6WxzCPtaXyFDvIP8vTisg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=e0widzNX; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=e0widzNX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRM2k4Wy2z2yN2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 00:41:16 +1100 (AEDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5c40aea5c40so6598053a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Oct 2024 06:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728826873; x=1729431673; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aDIoBQ9YvQk/WPHiA1xukRw9F4LXWDJBsa2YUNZUMcA=;
        b=e0widzNXA5eAdkAFTRo+rgTQ18cCXD0te3bz1SNsSYzMefh2G5vK4qahdvdz6f3c1J
         75KEDWe4QWCzebAQUG4MxyFDSrDlJBemw4tqov8e1lZG62LjQQURlfixRxL7yGJVAEO8
         Vfs8i9Zq03pbG4I2IqNTB9kqIm/MumoT/KsOwMhj+VWXIRYxWtSdL8QGNtqS6mfxC2Xs
         /tgWeu4i+m5NdPKhPC6/zyPsGRTnILZpsz/x8+QFeemSJ+hIBZoJH0qO2/trVxnbnkjh
         X0eCbPzxSXlhqas9SBRPvG7e62yz/eo6wf1NgDZS9u1Q4thLCf+alIfsFRyYZ4lufKSU
         AE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728826873; x=1729431673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDIoBQ9YvQk/WPHiA1xukRw9F4LXWDJBsa2YUNZUMcA=;
        b=NhmOvqds/LOT/JnqYEY23etmU/+/ap1DfbcCxYAX7ww4cIiru4XibVvfOOcUHPakG4
         pzdK4LttjcwraWF1jkXBxbmtG3CukF1hDxsTFxAFTpJygekIkk7zqyWNzKRraeoAgRmo
         fu3w1wKFk7vDUA8EsfosoYnilHza1yfnrnFAIDs77cmKYH2Q7MdGvVxNgimucAB/5kll
         TW0sfWg0/aUTudz6YhNhuqG9Q1HY846UGNS/409h88t8D5tG21MeJ1tD7sxwpB5FdYdc
         oRMpY1cfFu5OOnJ8E+y9BMy4sROhvPsbmeECTIJHuSNE1rfUfezHNJMXCjq9bt7GLEpl
         2+Og==
X-Forwarded-Encrypted: i=1; AJvYcCVsLRXAx56h9a6rLbjjlgv0YJzQU2+N6KeKby0OyI9JzEvvQ5u1e7SugzvRst3yn1xxWOHesGTCjfTX//Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzXmJ1uiBkr41VTPwnimXl/5cFJS4YmlcwdC7Ma5yu7iQ+Ud6BX
	8xm1cP2DFyqEowG4I6eatFOM2EAfUhWC17rBUa0GK+dwMj0mLTXP3WgapszFcQkw3Q3gZFJYnHF
	U
X-Google-Smtp-Source: AGHT+IFwr5789q2rbkowSIKm0Pi3d3HKo85MzqqbcL5zX+y8/Sv/FkZN0o1+dV1o6r6DNh6wikURkg==
X-Received: by 2002:a05:6402:2688:b0:5c8:88f2:adf6 with SMTP id 4fb4d7f45d1cf-5c94754c124mr7916665a12.13.1728826872833;
        Sun, 13 Oct 2024 06:41:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c9370d273fsm3931876a12.16.2024.10.13.06.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 06:41:12 -0700 (PDT)
Date: Sun, 13 Oct 2024 16:41:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Markus Elfring <Markus.Elfring@web.de>, linuxppc-dev@lists.ozlabs.org,
	Jani Nikula <jani.nikula@intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paul Mackerras <paulus@samba.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] powermac: Use of_property_match_string() in
 pmac_has_backlight_type()
Message-ID: <e50907a9-6df7-4cbf-97a6-47acd5d8ce01@stanley.mountain>
References: <b7e69e04-e15c-41ec-b62b-37253debc654@web.de>
 <d9bdc1b6-ea7e-47aa-80aa-02ae649abf72@csgroup.eu>
 <ede25e03-7a14-4787-ae1b-4fc9290add5a@web.de>
 <c629e544-f768-4063-bd2c-f72382bdf69b@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c629e544-f768-4063-bd2c-f72382bdf69b@csgroup.eu>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Oct 11, 2024 at 06:25:45PM +0200, Christophe Leroy wrote:
> > diff --git a/arch/powerpc/platforms/powermac/backlight.c b/arch/powerpc/platforms/powermac/backlight.c
> > index 12bc01353bd3..79741370c40c 100644
> > --- a/arch/powerpc/platforms/powermac/backlight.c
> > +++ b/arch/powerpc/platforms/powermac/backlight.c
> > @@ -57,18 +57,10 @@ struct backlight_device *pmac_backlight;
> >   int pmac_has_backlight_type(const char *type)
> >   {
> >   	struct device_node* bk_node = of_find_node_by_name(NULL, "backlight");
> > +	int i = of_property_match_string(bk_node, "backlight-control", type);
> > 
> > -	if (bk_node) {
> > -		const char *prop = of_get_property(bk_node,
> > -				"backlight-control", NULL);
> > -		if (prop && strncmp(prop, type, strlen(type)) == 0) {
> > -			of_node_put(bk_node);
> > -			return 1;
> > -		}
> > -		of_node_put(bk_node);
> > -	}
> > -
> > -	return 0;
> > +	of_node_put(bk_node);
> > +	return i >= 0;
> 
> Could have been:
> 
> 	return !IS_ERR_VALUE(i);
> 

IS_ERR_VALUE() macro should only be used when you're dealing with memory
addresses.  What I mean is there places in mm/ where we pass addresses as
unsigned long values instead of pointers.  For example, get_unmapped_area()
returns unsigned long.  The IS_ERR_VALUE() macro is necessary for that.

For regular error codes, we can just check for negatives.  we don't have do
anything fancy.

Of course, you can find counter examples, like msm_iommu_attach_dev() or
st_fdma_of_xlate().  <small joke>But in those cases, it's done to deliberately
to ensure that the code will never accidentally get built on 64bit systems.
</small joke>

regards,
dan carpenter


