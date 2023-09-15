Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D324F7A155A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 07:26:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Qe3kA7Op;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rn2k54mvjz3byH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 15:26:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Qe3kA7Op;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rn2gp44VSz3byH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 15:24:54 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-68fac346f6aso1576551b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 22:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694755490; x=1695360290; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x0qVdiNnNK1x44nux0ZGC5YO/63axRdKDDjAcPyMmoU=;
        b=Qe3kA7OpQopwbC9d2HYprK1ZAAPTcbfSG8UOIVSPiElwWLitqZSuayMz9ySnTLSNEp
         EnEBMHZdEv0P8vbvCZ1PAO3uaUTpmKNgmVJiK3rv+sU13u/9xYq20I3KQmmHM//u39pe
         DgcBhavWJAKHjHX4e0FbtSpju6cUF5YkT4Cw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694755490; x=1695360290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0qVdiNnNK1x44nux0ZGC5YO/63axRdKDDjAcPyMmoU=;
        b=SVHfD6VyOei8s4L7uiTwksOrgoKxAzYw+bPiJBZdHZOl602ylJrpC9IZO6ipxnUC3q
         +Sm3E+JaHFAsN+2/Hl8Rb/KbOruaXRx2RTR4TISKJT+BeY2Ceyl0HsBfOI+padOa56KL
         akIbMjChANF/5OoQCSK6XDNh6fe0b65BoFZjFe4AkxwbHMZOZb4HmpVAZ6oNm/rhoSdi
         OvtpGfe8D1fW/vGlPM5UHxNm+gcXWA7fIlCdcn4OqS7PFHRIzPSATh6asTreTBkUD5gm
         vwv1sDfXGr3k0KKSvqzoP8ZuHL3iuUCwWxjoaC62+9aMFSudU2y0OI8vRkhXQ9/8EWlt
         3OVg==
X-Gm-Message-State: AOJu0YxVUWAxXyMmla47uUMbGwkrScdFoYYIkBfYReHqRanC9HDPol5A
	rkFo2ZR/TmDtSD34Fk4HFqDeHQ==
X-Google-Smtp-Source: AGHT+IFED1FDb4BajsYclNy37LUDYQbCJaFpMaXLXHfXnR4m0zHZlA65aGamnmGLaiEoj43nxFWQ+w==
X-Received: by 2002:a05:6a20:244e:b0:134:8d7f:f4d9 with SMTP id t14-20020a056a20244e00b001348d7ff4d9mr1002623pzc.52.1694755490009;
        Thu, 14 Sep 2023 22:24:50 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902c18500b001aadd0d7364sm2521635pld.83.2023.09.14.22.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 22:24:49 -0700 (PDT)
Date: Thu, 14 Sep 2023 22:24:48 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH] hwmon: (ibmpowernv) refactor deprecated strncpy
Message-ID: <202309142223.D16446A30D@keescook>
References: <20230914-strncpy-drivers-hwmon-ibmpowernv-c-v1-1-ba6b7f42c98c@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914-strncpy-drivers-hwmon-ibmpowernv-c-v1-1-ba6b7f42c98c@google.com>
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Guenter Roeck <linux@roeck-us.net>, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 14, 2023 at 11:21:06PM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> We should prefer more robust and less ambiguous string interfaces.
> 
> A suitable replacement is `strscpy` [2] due to the fact that it
> guarantees NUL-termination on the destination buffer without
> unnecessarily NUL-padding since `buf` is already zero-initialized.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
>  drivers/hwmon/ibmpowernv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/ibmpowernv.c b/drivers/hwmon/ibmpowernv.c
> index 594254d6a72d..57d829dbcda6 100644
> --- a/drivers/hwmon/ibmpowernv.c
> +++ b/drivers/hwmon/ibmpowernv.c
> @@ -234,7 +234,7 @@ static int get_sensor_index_attr(const char *name, u32 *index, char *attr)
>  	if (copy_len >= sizeof(buf))
>  		return -EINVAL;
>  
> -	strncpy(buf, hash_pos + 1, copy_len);
> +	strscpy(buf, hash_pos + 1, copy_len);

This is another case of precise byte copying -- this just needs to be
memcpy. Otherwise this truncates the trailing character. Imagine a name
input of "fan#2-data". "buf" wants to get "2". copy_len is 1, and
strscpy would eat it. :)

-Kees

>  
>  	err = kstrtou32(buf, 10, index);
>  	if (err)
> 
> ---
> base-commit: 3669558bdf354cd352be955ef2764cde6a9bf5ec
> change-id: 20230914-strncpy-drivers-hwmon-ibmpowernv-c-80a03f16d93a
> 
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
> 

-- 
Kees Cook
