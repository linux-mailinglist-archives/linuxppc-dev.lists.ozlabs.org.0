Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3C913D360
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 06:04:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ysYy03P0zDqXP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 16:04:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ysTS5tSjzDqVZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 16:00:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=dYNTOeCe; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47ysTR74dLz8vNH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 16:00:43 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47ysTR4wWtz9sRQ; Thu, 16 Jan 2020 16:00:43 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=dYNTOeCe; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47ysTN1Gmnz9sPW
 for <linuxppc-dev@ozlabs.org>; Thu, 16 Jan 2020 16:00:39 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id q10so9612137pfs.6
 for <linuxppc-dev@ozlabs.org>; Wed, 15 Jan 2020 21:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=lbMVnnfOh0rxSpd7nM1WMZj2bbfSD2O1czUhxijz+ik=;
 b=dYNTOeCekTqaTcojSIdZuhUZgkSC+ZhXSzKFX/UJwUCBWuIkp/4vvAA1QaXxTWR9wy
 132Hmm8S/kO+qXdLu0cuadXX6wUVBGzzJltVM5b3FcCJoRVaTWfkWRbgAkP/fEM4IXVi
 LTT8LGz0Oxpv0eXeYHD7vSMP+9OkiousSrHTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=lbMVnnfOh0rxSpd7nM1WMZj2bbfSD2O1czUhxijz+ik=;
 b=YGZfsvcKhhhplgHg0b4RcY8E1h7cKYwZcMFof5H8w8aH3aABWVwgOWTNu7KSxpKTRx
 cYcEB2Z+Zp5uuGpFyM59K2LfPplIGAgogxz/xm6wxWtOPMs+OFs7xcWtjRrSj1H9ilcv
 zvuO04IRQypIQWwaw7AOK/La4c61R7a6cZWBWf03URJTrMNwF6U3+TtyscvRSgfXATqG
 ASv5S3G9NRtKSu0iKRljSDakJ9CPgmn4chYJExpDXO2PhyUwny1YOIUWy7vWmdwETTDL
 as/8SeX0+3dxglNLsd9NES4jqC155Xg6vcDuCIxWFild+Z4fydTf8+gLfRZOGDM1tG+2
 XhpQ==
X-Gm-Message-State: APjAAAXsP9F+7RYRlyZo+lvsCjRbTaXwv/Z0Zvry0oirpijTj7EMfv59
 Os0Cwi/2tJPxasM2iVBP7KynIQ==
X-Google-Smtp-Source: APXvYqzAWm7yVpRibzv06ashzmpqDtv1DgyHNVab76a+suUGI344fSVYj1YvxE/EaPa1I4tjGO5ggA==
X-Received: by 2002:a63:5962:: with SMTP id j34mr38039900pgm.421.1579150836506; 
 Wed, 15 Jan 2020 21:00:36 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-097c-7eed-afd4-cd15.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:97c:7eed:afd4:cd15])
 by smtp.gmail.com with ESMTPSA id n2sm22452384pgn.71.2020.01.15.21.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 21:00:35 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH 7/9] powerpc/configs/skiroot: Enable security features
In-Reply-To: <20200116014808.15756-7-mpe@ellerman.id.au>
References: <20200116014808.15756-1-mpe@ellerman.id.au>
 <20200116014808.15756-7-mpe@ellerman.id.au>
Date: Thu, 16 Jan 2020 16:00:32 +1100
Message-ID: <871rs0knbj.fsf@dja-thinkpad.axtens.net>
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
Cc: nayna@linux.ibm.com, oohall@gmail.com, joel@jms.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

> From: Joel Stanley <joel@jms.id.au>
>
> This turns on HARDENED_USERCOPY with HARDENED_USERCOPY_PAGESPAN, and
> FORTIFY_SOURCE.
>
> It also enables SECURITY_LOCKDOWN_LSM with _EARLY and
> LOCK_DOWN_KERNEL_FORCE_CONFIDENTIALITY options enabled.
>

As I said before, this will disable xmon entirely. If we want to set
this, we should compile out xmon. But if we want xmon in read-only mode
to be an option, we should pick integrity mode.

I don't really mind, because I don't work with skiroot very
much. Oliver, Joel, Nayna, you all do stuff around this sort of level -
is this a problem for any of you?

Regards,
Daniel

> MODULE_SIG is selected by lockdown, so it is still enabled.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/configs/skiroot_defconfig | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
> index 24a210fe0049..bd661a9a9410 100644
> --- a/arch/powerpc/configs/skiroot_defconfig
> +++ b/arch/powerpc/configs/skiroot_defconfig
> @@ -49,7 +49,6 @@ CONFIG_JUMP_LABEL=y
>  CONFIG_STRICT_KERNEL_RWX=y
>  CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
> -CONFIG_MODULE_SIG=y
>  CONFIG_MODULE_SIG_FORCE=y
>  CONFIG_MODULE_SIG_SHA512=y
>  CONFIG_PARTITION_ADVANCED=y
> @@ -272,6 +271,16 @@ CONFIG_NLS_ASCII=y
>  CONFIG_NLS_ISO8859_1=y
>  CONFIG_NLS_UTF8=y
>  CONFIG_ENCRYPTED_KEYS=y
> +CONFIG_SECURITY=y
> +CONFIG_HARDENED_USERCOPY=y
> +# CONFIG_HARDENED_USERCOPY_FALLBACK is not set
> +CONFIG_HARDENED_USERCOPY_PAGESPAN=y
> +CONFIG_FORTIFY_SOURCE=y
> +CONFIG_SECURITY_LOCKDOWN_LSM=y
> +CONFIG_SECURITY_LOCKDOWN_LSM_EARLY=y
> +CONFIG_LOCK_DOWN_KERNEL_FORCE_CONFIDENTIALITY=y
> +# CONFIG_INTEGRITY is not set
> +CONFIG_LSM="yama,loadpin,safesetid,integrity"
>  # CONFIG_CRYPTO_HW is not set
>  CONFIG_CRC16=y
>  CONFIG_CRC_ITU_T=y
> -- 
> 2.21.1
