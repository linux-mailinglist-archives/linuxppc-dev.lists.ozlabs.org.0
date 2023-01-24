Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE3C678FD1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 06:25:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1FmT4XgGz3c6C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 16:25:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZfxguGrg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZfxguGrg;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1FlZ0BYlz3c3m
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 16:24:39 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id mm11-20020a17090b358b00b0022bf61de7beso73448pjb.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 21:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EPflxlzn7J3IhwXMqkbeD44ht96unETWIQ75Qp5FCss=;
        b=ZfxguGrgsLcY0Sq2+g0kbtCLDOQn3UY9YpncBNNH3WXAXs6UuShB7ggTMjxNLWBRjS
         4S2X4T6qfadLoMDptTXfGxpyzDxNWD0Mvm6hXftn2Lo1du7fO/Wgelose8ln1gXxxAnV
         1ufbzEVQ1fiSBbzhMDfUDsZRajZhptf2gdv4k5wJZ3zuhE/qJ94/PW6HVgFQwyCBJkih
         J2w2im5PbQOYqqfvagGdJqgoYAIFOzd3c57/LwIlI/igZvZSBJZVoxo5fvn/y9QHxZXS
         6RgHH6s63RFqcET7pCffXuuFWsoLNKYoKi47uZwKzlT5UZMJkVSxosnChe+QDzKFoFtL
         rpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EPflxlzn7J3IhwXMqkbeD44ht96unETWIQ75Qp5FCss=;
        b=ubAX3qzsQXXRHatEVPAdNs6sYsyQiB6eRplo3KbIZGn1mVNmYW7NcG4OyvwAipIg33
         S+/BnWPRAetDaqtkhYtIGPvLMvrPD9XQEFuKa6vIudRwPv2dPxDBScAKaU/Ry3jcKG4+
         GPlIC0lZPSZRrMGF8np48MX4AnxHS2QLgTtExy/Ry4HNvPvA0XSehn4/RhiToh2rp0OV
         YAoM/1nJQX4Ae22kzFHoqWB4tN7q85W/UN9runHIvBu1WJaHPetLBvsXat7pHofebqTw
         FtVbW5YTjw26lIEvbp5ACmygjgFOwejYsQKShi1ZjjTGg4wGtVg0YORtpgTWlWWGrJyG
         UXfw==
X-Gm-Message-State: AFqh2kopzwcYTURw3010tl6vILUN2S7lngG/8lo/vlsGrYzVkY5R7gEt
	7fpk+JibX1cHSCbwvpETwI5k1M7GiSQ=
X-Google-Smtp-Source: AMrXdXsxQsqTnL+GRVS6OYc23i7BV4V8GyCJ1wcsXO8yFBZz0e4RWJrhVbXXTmgGKft8W5rGH5tVOg==
X-Received: by 2002:a05:6a20:3d0f:b0:af:9539:a2c0 with SMTP id y15-20020a056a203d0f00b000af9539a2c0mr35468533pzi.26.1674537877942;
        Mon, 23 Jan 2023 21:24:37 -0800 (PST)
Received: from localhost (121-44-64-35.tpgi.com.au. [121.44.64.35])
        by smtp.gmail.com with ESMTPSA id g5-20020a170902c38500b00196047fc25dsm657743plg.42.2023.01.23.21.24.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 21:24:37 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Jan 2023 15:24:25 +1000
Message-Id: <CQ064REW0ZEO.1LUHVNN78TBRJ@bobo>
Subject: Re: [PATCH v4 24/24] integrity/powerpc: Support loading keys from
 pseries secvar
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Andrew Donnellan" <ajd@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-integrity@vger.kernel.org>
X-Mailer: aerc 0.13.0
References: <20230120074306.1326298-1-ajd@linux.ibm.com>
 <20230120074306.1326298-25-ajd@linux.ibm.com>
In-Reply-To: <20230120074306.1326298-25-ajd@linux.ibm.com>
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
Cc: gjoyce@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, sudhakar@linux.ibm.com, ruscur@russell.cc, joel@jms.id.au, bgray@linux.ibm.com, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Jan 20, 2023 at 5:43 PM AEST, Andrew Donnellan wrote:
> From: Russell Currey <ruscur@russell.cc>
>
> The secvar object format is only in the device tree under powernv.
> We now have an API call to retrieve it in a generic way, so we should
> use that instead of having to handle the DT here.
>
> Add support for pseries secvar, with the "ibm,plpks-sb-v1" format.
> The object format is expected to be the same, so there shouldn't be any
> functional differences between objects retrieved from powernv and
> pseries.
>
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
>
> ---
>
> v3: New patch
>
> v4: Pass format buffer size (stefanb, npiggin)
> ---
>  .../integrity/platform_certs/load_powerpc.c     | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/security/integrity/platform_certs/load_powerpc.c b/security/=
integrity/platform_certs/load_powerpc.c
> index dee51606d5f4..d4ce91bf3fec 100644
> --- a/security/integrity/platform_certs/load_powerpc.c
> +++ b/security/integrity/platform_certs/load_powerpc.c
> @@ -10,7 +10,6 @@
>  #include <linux/cred.h>
>  #include <linux/err.h>
>  #include <linux/slab.h>
> -#include <linux/of.h>
>  #include <asm/secure_boot.h>
>  #include <asm/secvar.h>
>  #include "keyring_handler.h"
> @@ -59,16 +58,22 @@ static int __init load_powerpc_certs(void)
>  	void *db =3D NULL, *dbx =3D NULL;
>  	u64 dbsize =3D 0, dbxsize =3D 0;
>  	int rc =3D 0;
> -	struct device_node *node;
> +	ssize_t len;
> +	char buf[32];
> =20
>  	if (!secvar_ops)
>  		return -ENODEV;
> =20
> -	/* The following only applies for the edk2-compat backend. */
> -	node =3D of_find_compatible_node(NULL, NULL, "ibm,edk2-compat-v1");
> -	if (!node)
> +	len =3D secvar_ops->format(buf, 32);

sizeof(buf)?

Thanks,
Nick

