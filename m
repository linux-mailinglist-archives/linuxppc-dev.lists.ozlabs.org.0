Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC5C130D32
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2020 06:30:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47rkbr0tCyzDqFC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2020 16:30:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="B/CwpXbV"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47rkYn3TwKzDq75
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2020 16:28:12 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id x184so26430043pfb.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Jan 2020 21:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=ymhTcMEmDFG9TKBAl66QxLJ2ntfziG/odU0UA166lJg=;
 b=B/CwpXbVt3NAU1qBeDI6Lzg+yNnfGsl+vtj89sjvSQ8lJb870b2kZTDO8VFoFr4jW0
 jZ5A7irZ5E6FY0XzFQq8dnv7Wb2CicWzIg4yADZ1boeO+JyCk+hvl+g+cCMRxUyTCfck
 uCgtoNg2zF3IUyVra9q3fmCi/fGbgRfEjefu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=ymhTcMEmDFG9TKBAl66QxLJ2ntfziG/odU0UA166lJg=;
 b=OR6bEwBnjTIZbFzIydk9gLXRsUOi9EAFfxFPLHsABlS0k4/N3uGkVANQPCrsimfxhL
 NpdjiC54zKh/m2olKFHkC52A7QHeh13Ul5BJjNEdv5FBq2BVMxWPnZMkHqZya/PpXPSE
 gsxrPMeFDV8Lg4pG5bp9ziEWn1s1DihwwpJsUPJlHjOh3ZyKwp8JFNV7GXSkGoOJ7svu
 uTG7hGio/I7sBtf1XvU8Hp+zTcBU9E24U3LZ4SO0dYPItAdCeQOFx4F9SKrmTjquqhHa
 gUH76vENRaMeojqN/NHyUyyaz7rliaQrPYFkDpaogsWQknGIQCYijOZDlAwhiVfP+uC0
 jrTQ==
X-Gm-Message-State: APjAAAXk+XZbInXpTNm5t+XwTNs0qQ8OXrzO5OHr8GSlqk1ddD6Oegd2
 CvcBZ1l068DNIUFpswBOIqqJBw==
X-Google-Smtp-Source: APXvYqwLFfLytt/PqtgNJEI4iGFyg7rJ2DqmH5gW6HxA7fBWai+ycfQJPihyxISe4/AIybjVe+vI/g==
X-Received: by 2002:aa7:8e8f:: with SMTP id
 a15mr105811812pfr.153.1578288489198; 
 Sun, 05 Jan 2020 21:28:09 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-3463-e857-4ed0-a740.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:3463:e857:4ed0:a740])
 by smtp.gmail.com with ESMTPSA id 5sm23204917pjt.28.2020.01.05.21.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2020 21:28:08 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Joel Stanley <joel@jms.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/config: Enable secuity features in skiroot
In-Reply-To: <20200102073058.163746-1-joel@jms.id.au>
References: <20200102073058.163746-1-joel@jms.id.au>
Date: Mon, 06 Jan 2020 16:28:04 +1100
Message-ID: <87k165nogr.fsf@dja-thinkpad.axtens.net>
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
Cc: linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Joel Stanley <joel@jms.id.au> writes:

> This turns on HARDENED_USERCOPY with HARDENED_USERCOPY_PAGESPAN, and
> FORTIFY_SOURCE.
>
> It also enables SECURITY_LOCKDOWN_LSM with _EARLY and
> LOCK_DOWN_KERNEL_FORCE_CONFIDENTIALITY options enabled.

This will completely disable xmon when combined with 69393cb03ccd
("powerpc/xmon: Restrict when kernel is locked down"). I don't
personally have a problem with this, but I think not disabling xmon has
come up before as a requirement of some developers.

Is forcing integrity not sufficient? What confidential data held by the
skiroot kernel are you trying to protect? If you just force integrity
you'll get xmon in read-only mode, which should be fine for most
debugging...

Regards,
Daniel

>
> MODULE_SIG is selected by lockdown, so it is still enabled.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/powerpc/configs/skiroot_defconfig | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
> index 069f67f12731..0a441c414a57 100644
> --- a/arch/powerpc/configs/skiroot_defconfig
> +++ b/arch/powerpc/configs/skiroot_defconfig
> @@ -33,7 +33,6 @@ CONFIG_JUMP_LABEL=y
>  CONFIG_STRICT_KERNEL_RWX=y
>  CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
> -CONFIG_MODULE_SIG=y
>  CONFIG_MODULE_SIG_FORCE=y
>  CONFIG_MODULE_SIG_SHA512=y
>  CONFIG_PARTITION_ADVANCED=y
> @@ -297,5 +296,15 @@ CONFIG_WQ_WATCHDOG=y
>  CONFIG_XMON=y
>  CONFIG_XMON_DEFAULT=y
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
>  # CONFIG_CRYPTO_ECHAINIV is not set
>  # CONFIG_CRYPTO_HW is not set
> -- 
> 2.24.1
