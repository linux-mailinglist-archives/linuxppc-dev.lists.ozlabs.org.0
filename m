Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13533678F3D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 05:27:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1DTM6j2bz3cDt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 15:27:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YNlNht7g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YNlNht7g;
	dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1DSP3SVfz3bvZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 15:26:27 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id 78so10537874pgb.8
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 20:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikIw7tYX2YkOjJ1SBheZ8OfWLQDqLfvM0gBP+Ityw34=;
        b=YNlNht7gd21co35WmXhV01ktN9SoD09xYeIHaYwsev8FzKFhr5Ny+jRT+oSkqttK/a
         K/BJMen8KHFwmsjrqhGD/YRaWrS08UzGHW4YbOE7Hdr4uoSXXSJ0v0x6kqV+H5IdfQro
         iuuulzywBlLaGHcWPDFDf/MDUY5iB4M0EksWeVGBvP/2wRSg0ZU72fX0cZh2FSv2k90O
         ylcAuC/EP+v6pG+zsgwJN/AYFwQ1SGhGL9z3NCk5yqWONR4gjNKeZ5h1I6T3U/YG6N6y
         XJQzIemFQbtyoIl3vpdhO47cyRn/GQtjRDKa1uMSEfBpzmLyR9KBGCAQrb1C1cfDYn/B
         TLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ikIw7tYX2YkOjJ1SBheZ8OfWLQDqLfvM0gBP+Ityw34=;
        b=QDeRVRQdEzS/xlxiOzl76R7ulWdGkQBda7Bc5ROf9aLYV8qlaNWqYJbO87xkWrXSbD
         WezkfHQipXl+mH+lG+S46VKr9+D2s+Zqz1iVMInAeO3U3MMnxGAgSwpfRJ4Xy/OPRVvJ
         QuasiShoBP2BM124/3a74asXCpfeams3cIM/DJOFIAdUEIP03bPYwQMQEkkuwCG+GJIM
         Iykrb9DfP7ILUH86hMR5zzyDNJfbGAKkQqs4n2wnJ0oL5+4zlacSCLdDN81MKe+jjQwr
         d6lvBYLd4mhsn9tHGUTt38ZlRDycNNElwQi+h1PvM7egMc1QdgwJfZNI3camVflCOBSE
         bVBQ==
X-Gm-Message-State: AFqh2kpXeFVSSx+0ZthLCbcynfvai5XL6Gt/Zb0fCm/uPAI+oE0C2VTc
	4v3zXeQh6dBDeVobWei6ptk=
X-Google-Smtp-Source: AMrXdXsLjmAMJ1SONTARwenlQNQ6MHRz8aPxQSqwXjj4XO+jhxTE8p6ynWlTQmYvGB+ZI66aMrWXxw==
X-Received: by 2002:a05:6a00:2354:b0:580:cf1a:f2b5 with SMTP id j20-20020a056a00235400b00580cf1af2b5mr39660928pfj.12.1674534384476;
        Mon, 23 Jan 2023 20:26:24 -0800 (PST)
Received: from localhost (121-44-64-35.tpgi.com.au. [121.44.64.35])
        by smtp.gmail.com with ESMTPSA id p35-20020a056a0026e300b005898fcb7c1bsm426882pfw.177.2023.01.23.20.26.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 20:26:23 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Jan 2023 14:26:16 +1000
Message-Id: <CQ04W8MPPQT5.KT3IQUOE2YPG@bobo>
Subject: Re: [PATCH v4 19/24] powerpc/pseries: Turn PSERIES_PLPKS into a
 hidden option
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Andrew Donnellan" <ajd@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-integrity@vger.kernel.org>
X-Mailer: aerc 0.13.0
References: <20230120074306.1326298-1-ajd@linux.ibm.com>
 <20230120074306.1326298-20-ajd@linux.ibm.com>
In-Reply-To: <20230120074306.1326298-20-ajd@linux.ibm.com>
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
> It seems a bit unnecessary for the PLPKS code to have a user-visible
> config option when it doesn't do anything on its own, and there's existin=
g
> options for enabling Secure Boot-related features.
>
> It should be enabled by PPC_SECURE_BOOT, which will eventually be what
> uses PLPKS to populate keyrings.
>
> However, we can't get of the separate option completely, because it will
> also be used for SED Opal purposes.
>
> Change PSERIES_PLPKS into a hidden option, which is selected by
> PPC_SECURE_BOOT.
>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> Signed-off-by: Russell Currey <ruscur@russell.cc>
>
> ---
>
> v3: New patch
> ---
>  arch/powerpc/Kconfig                   |  1 +
>  arch/powerpc/platforms/pseries/Kconfig | 11 +----------
>  2 files changed, 2 insertions(+), 10 deletions(-)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index b8c4ac56bddc..d4ed46101bec 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -1029,6 +1029,7 @@ config PPC_SECURE_BOOT
>  	depends on PPC_POWERNV || PPC_PSERIES
>  	depends on IMA_ARCH_POLICY
>  	imply IMA_SECURE_AND_OR_TRUSTED_BOOT
> +	select PSERIES_PLPKS if PPC_PSERIES
>  	help
>  	  Systems with firmware secure boot enabled need to define security
>  	  policies to extend secure boot to the OS. This config allows a user
> diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platfo=
rms/pseries/Kconfig
> index a3b4d99567cb..82b6f993be0f 100644
> --- a/arch/powerpc/platforms/pseries/Kconfig
> +++ b/arch/powerpc/platforms/pseries/Kconfig
> @@ -151,16 +151,7 @@ config IBMEBUS
> =20
>  config PSERIES_PLPKS
>  	depends on PPC_PSERIES
> -	bool "Support for the Platform Key Storage"
> -	help
> -	  PowerVM provides an isolated Platform Keystore(PKS) storage
> -	  allocation for each LPAR with individually managed access
> -	  controls to store sensitive information securely. It can be
> -	  used to store asymmetric public keys or secrets as required
> -	  by different usecases. Select this config to enable
> -	  operating system interface to hypervisor to access this space.

Not a big deal but you could turn this into a small Kconfig comment
instead (people got strangely angry when I tried to just use help text
in hidden options as comments). But if it's easy enough to grep for and
pretty straightforward then maybe it doesn't matter. I like know what
these things do at a glance.

Thanks,
Nick
