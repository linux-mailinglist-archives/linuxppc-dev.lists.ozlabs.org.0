Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A20181C16
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 16:11:39 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cwQw5Z4szDqhD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 02:11:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.215.196;
 helo=mail-pg1-f196.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bq9a47th; dkim-atps=neutral
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cwPD4tn5zDqLg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Mar 2020 02:10:08 +1100 (AEDT)
Received: by mail-pg1-f196.google.com with SMTP id t24so1369495pgj.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 08:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=SzPZSXP14NkzscV5DleAKzqm85L61ntsbY9ghopjt6s=;
 b=bq9a47th/jJJjrVJC91MGeBK1PCRiAt14iryhx6x0Hy9UzpvBla4OQoL1GBeyq4EOD
 Obvb2uFN6lEWduwJuOENsok15S10uzjq+xjDgfkHY7Eucl6PazIL78O3/T1yn919swwS
 /oqJknbXKvGmlyJ2RuS5/7vE1aVpuHuz1j0+8VOIIslhd2+co8SFLTIGslSKi55VyNYK
 p/JUvJPGOBbGojnB/rP2uI+UwNABZ3bmPaY4691cHFXfIFg+Geq26B4kZlY81pY8xOqK
 yJn4v+rXvOoiQRp1rAjsx17gehmSOZ8HkDRUht3lLamkHaWLhwU/H/8StUVMjmhMJ1Ii
 4Wow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mime-version:content-disposition:user-agent;
 bh=SzPZSXP14NkzscV5DleAKzqm85L61ntsbY9ghopjt6s=;
 b=s6noJP1/E+vEiiqzSj02/Auwk1zdEnncD/IZ/VsJt4SywepMRZbSSVeuMbzlKW79Vs
 lYtXIoIqvtClmtU2BqV0zXAK8Sa3Ul/VCnU/mDutDyuGp1AJeZPKOVEV1SAm1X4cTPSu
 L6ncEj8tviDbrGkPjl1Y14mX9JGPiwhxVEo9eJ+r+wF2dFaguew+b7zCkdbFSLI+waTJ
 THVzNybf3CBwQ48TS3pv/vGNsbxZXS2MBper7FsUTes+HLobepBYq75HVseMAk2LHfuc
 xZJ3EjKchxYyZY9TxS51BaY8+5mMedn1cnW/n9tgdgQkK8h/3k9zkmRKczCGU/cdE6Qr
 7VgQ==
X-Gm-Message-State: ANhLgQ2eDKx2WLpqouxMo/gnsoyZH2sPcS8CDcbDv/2GfGnsqFsCNIgX
 /T4fyEa30gNC7GEp9uQdpNw=
X-Google-Smtp-Source: ADFU+vvXQ6Wilrn2WD3lGYfIAEgqIS4ce+464O8gOZ5mvljOhED6km4oQ2CRFgQWVIuLYsLA/0EXvg==
X-Received: by 2002:a63:2:: with SMTP id 2mr3221746pga.102.1583939396321;
 Wed, 11 Mar 2020 08:09:56 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id g5sm959149pfo.192.2020.03.11.08.09.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 11 Mar 2020 08:09:55 -0700 (PDT)
Date: Wed, 11 Mar 2020 08:09:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] hwmon: (ibmpowernv) Use scnprintf() for avoiding
 potential buffer overflow
Message-ID: <20200311150954.GA10207@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 11, 2020 at 08:39:44AM +0100, Takashi Iwai wrote:
> Since snprintf() returns the would-be-output size instead of the
> actual output size, the succeeding calls may go beyond the given
> buffer limit.  Fix it by replacing with scnprintf().
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/ibmpowernv.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/ibmpowernv.c b/drivers/hwmon/ibmpowernv.c
> index 0e525cfbdfc5..a750647e66a4 100644
> --- a/drivers/hwmon/ibmpowernv.c
> +++ b/drivers/hwmon/ibmpowernv.c
> @@ -186,7 +186,7 @@ static void make_sensor_label(struct device_node *np,
>  	u32 id;
>  	size_t n;
>  
> -	n = snprintf(sdata->label, sizeof(sdata->label), "%s", label);
> +	n = scnprintf(sdata->label, sizeof(sdata->label), "%s", label);
>  
>  	/*
>  	 * Core temp pretty print
> @@ -199,11 +199,11 @@ static void make_sensor_label(struct device_node *np,
>  			 * The digital thermal sensors are associated
>  			 * with a core.
>  			 */
> -			n += snprintf(sdata->label + n,
> +			n += scnprintf(sdata->label + n,
>  				      sizeof(sdata->label) - n, " %d",
>  				      cpuid);
>  		else
> -			n += snprintf(sdata->label + n,
> +			n += scnprintf(sdata->label + n,
>  				      sizeof(sdata->label) - n, " phy%d", id);
>  	}
>  
> @@ -211,7 +211,7 @@ static void make_sensor_label(struct device_node *np,
>  	 * Membuffer pretty print
>  	 */
>  	if (!of_property_read_u32(np, "ibm,chip-id", &id))
> -		n += snprintf(sdata->label + n, sizeof(sdata->label) - n,
> +		n += scnprintf(sdata->label + n, sizeof(sdata->label) - n,
>  			      " %d", id & 0xffff);
>  }
>  
> -- 
> 2.16.4
> 
