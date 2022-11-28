Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B188A639F59
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 03:13:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NL8CW3gLbz3cHF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 13:13:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=e7WGebTa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=e7WGebTa;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NL8Bc2MwPz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 13:12:54 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id 3-20020a17090a098300b00219041dcbe9so7717058pjo.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 18:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ngxs1MfsA4r//UGdsflMIxLlBL5zW80LKdsFrkLWVIM=;
        b=e7WGebTa9jKyafkPJlekugISiPlIAt87AtiIq+26nHJSKBvk0ztyCuU7fR9o+0AKab
         xSGYdAImRsYT2N0Cs6mvXZjSTYfglGISaM13n7cksV3i08CaQ1qVpwTVTSjxZFyH4xoo
         kHcRl6EzhGjViYXRzNGOtDIwRKYpx6j2QY+2NBWhznviW9J5Bh9xYUyAWjTbTDzxHG2Y
         b845vn0UXct25fndui2vo7TXlecS9XPEd5yM/5wO7iijCthg55M+0QOOhsCn9ip34Ign
         EgQZ5mofs84BOlwBDWjPU1UIW4RwOpjjjwPjCWCMJDHl9dKkZ803+7Aa1F/BivojY/tn
         dWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ngxs1MfsA4r//UGdsflMIxLlBL5zW80LKdsFrkLWVIM=;
        b=vACxaT28wu1m4mUvR+dxMi1JsADqg9sqDTTbgiB8cXXcovvbFpbnFJ/y0/+904o0Xw
         MOUYXjdycHsmaTonIrIYdGrglkDFYNgYKj0grJOmjMFGcD96tIkfjG7a6BO1GRcJo+ml
         2p5oukxTQkR/gUsqyd7UFLuKFJyRd8/g/UeKO+iZ8tl8sbLSCDZ58gs9+Ad/hhuVBTew
         o+9pXVYLi6guPulJ4596WmGisHxUR1tnAZSZMiyh683H5aZarA7E8ZgYEhHmMGDt1tLY
         FclJnYFiab2bBXccWZGe/1c1jkUc8vT9yLUG5ARgqhj5o6KmlozKYW0BsASUfB6PL5yk
         zu5Q==
X-Gm-Message-State: ANoB5pnxwe8i8cIwQfX6JC8o+d+MIUKZ24UqYvIS9KjyfWFqCvNUoeoU
	BX2yelbHBsZYIoHX55NKwRo=
X-Google-Smtp-Source: AA0mqf7hnRMfAbaOGGb8kOl4f04jMi9yDK2s9gkdoXqbzG5MPIfuaXQBv49IghgADmqOGIkmhLtVKA==
X-Received: by 2002:a17:902:9897:b0:186:a98c:4ab8 with SMTP id s23-20020a170902989700b00186a98c4ab8mr29638034plp.118.1669601572329;
        Sun, 27 Nov 2022 18:12:52 -0800 (PST)
Received: from localhost ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id ix11-20020a170902f80b00b00186b758c9fasm7501261plb.33.2022.11.27.18.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 18:12:51 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Nov 2022 12:12:47 +1000
Message-Id: <CONKCZH8X4AN.37OXY0MSXXXF6@bobo>
Subject: Re: [PATCH v2 4/4] powerpc/64s: Sanitise user registers on
 interrupt in pseries
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <20221107033202.1375238-1-rmclure@linux.ibm.com>
 <20221107033202.1375238-4-rmclure@linux.ibm.com>
In-Reply-To: <20221107033202.1375238-4-rmclure@linux.ibm.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Nov 7, 2022 at 1:32 PM AEST, Rohan McLure wrote:
> Cause pseries platforms to default to zeroising all potentially user-defi=
ned
> registers when entering the kernel by means of any interrupt source,
> reducing user-influence of the kernel and the likelihood or producing
> speculation gadgets.

For POWERNV as well?

Thanks,
Nick

>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> Resubmitting patches as their own series after v6 partially merged:
> Link: https://lore.kernel.org/all/166488988686.779920.1379487010269641628=
3.b4-ty@ellerman.id.au/t/
> ---
>  arch/powerpc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 9d3d20c6f365..2eb328b25e49 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -532,7 +532,7 @@ config HOTPLUG_CPU
>  config INTERRUPT_SANITIZE_REGISTERS
>  	bool "Clear gprs on interrupt arrival"
>  	depends on PPC64 && ARCH_HAS_SYSCALL_WRAPPER
> -	default PPC_BOOK3E_64
> +	default PPC_BOOK3E_64 || PPC_PSERIES
>  	help
>  	  Reduce the influence of user register state on interrupt handlers and
>  	  syscalls through clearing user state from registers before handling
> --=20
> 2.34.1

