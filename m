Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D281C4B1E8A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 07:28:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jw3Zn3Kh7z3bcj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 17:28:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=PhKG9VFn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=PhKG9VFn; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jw3Z63jH8z30hm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 17:27:25 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id
 c5-20020a17090a1d0500b001b904a7046dso9426960pjd.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Feb 2022 22:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=JhnvwkrC36+ZtBCSmsX8E71vUbd01PT5UHf/8Lx3bYI=;
 b=PhKG9VFn/JmTyURd15Sm5JvSvvHeDltFHCnOaYECW9yQEcKi7QXtGCXEjjcrWiaM+V
 St3/XiNEFe8yGswKO4+6+jemFpF28TMNolHqtVhi/zNuu1HMKrZUkbpdXnRIkd9LotAY
 OGj5EppaCiBgFVN+OJdqIxuwLEsVNYY4dsgu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=JhnvwkrC36+ZtBCSmsX8E71vUbd01PT5UHf/8Lx3bYI=;
 b=LQjnCKC75UPHLIQZb93GXsYFuNKlfCbNKYJrKwTu+3XEH81ucW2X2a57ZnD62u7IQm
 mUF6WkFp95Mlzh21o2TJds4sj5nmnjYX7wdHmspclNR8dTbFaDDfgRIEA+/hrLtxw7mL
 tl1SzbULf07/a5iEfEbtbDC1/L4FmPm0op7sndCG20ixu1e12/pVR6n1c0QuidBg8IVU
 4OnyOvAudxSFBNbjUDJo6ir1A1ckZOil0rsxfJ6BY//pVrmyFCdnipDSiO4MygxmaGql
 4eQiz9anUEBIquuscy8KQGpo3+R5rROZgWnxe2/D0kqqvAbSDqGrbgEVjvpgr8Ry7+by
 yB/A==
X-Gm-Message-State: AOAM532oSDw9ZOgSJ5nI2tJVgSq0D19Cdco3KJNVNX9D+mJEs4osTeL3
 8dpszG+I1PRt4BqLCHCABGL1ow==
X-Google-Smtp-Source: ABdhPJz5ANcTe3+INLtHZyy5LDDfipqUtY9os4gw6Lm8N3C26gsFfqTBRgoChXV9aGU8ErX1TizrTQ==
X-Received: by 2002:a17:90b:380f:: with SMTP id
 mq15mr300828pjb.84.1644560842505; 
 Thu, 10 Feb 2022 22:27:22 -0800 (PST)
Received: from localhost ([2001:4479:e300:600:d3de:3045:38b4:5296])
 by smtp.gmail.com with ESMTPSA id u33sm25826267pfg.195.2022.02.10.22.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 22:27:22 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH 3/3] crypto/nx: Constify static attribute_group structs
In-Reply-To: <20220210202805.7750-4-rikard.falkeborn@gmail.com>
References: <20220210202805.7750-1-rikard.falkeborn@gmail.com>
 <20220210202805.7750-4-rikard.falkeborn@gmail.com>
Date: Fri, 11 Feb 2022 17:27:19 +1100
Message-ID: <87tud5rk8o.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Rikard,

> The only usage of these is to pass their address to
> sysfs_{create,remove}_group(), which takes pointers to const struct
> attribute_group. Make them const to allow the compiler to put them in
> read-only memory.

I checked the file. Indeed, those structs are only used in
sysfs_{create,remove}_group. So I agree that they can be constified.

They also pass all the automated tests:
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220210202805.7750-4-rikard.falkeborn@gmail.com/

Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel

>
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
> ---
>  drivers/crypto/nx/nx-common-pseries.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/crypto/nx/nx-common-pseries.c b/drivers/crypto/nx/nx-common-pseries.c
> index 4e304f6081e4..7584a34ba88c 100644
> --- a/drivers/crypto/nx/nx-common-pseries.c
> +++ b/drivers/crypto/nx/nx-common-pseries.c
> @@ -962,7 +962,7 @@ static struct attribute *nx842_sysfs_entries[] = {
>  	NULL,
>  };
>  
> -static struct attribute_group nx842_attribute_group = {
> +static const struct attribute_group nx842_attribute_group = {
>  	.name = NULL,		/* put in device directory */
>  	.attrs = nx842_sysfs_entries,
>  };
> @@ -992,7 +992,7 @@ static struct attribute *nxcop_caps_sysfs_entries[] = {
>  	NULL,
>  };
>  
> -static struct attribute_group nxcop_caps_attr_group = {
> +static const struct attribute_group nxcop_caps_attr_group = {
>  	.name	=	"nx_gzip_caps",
>  	.attrs	=	nxcop_caps_sysfs_entries,
>  };
> -- 
> 2.35.1
