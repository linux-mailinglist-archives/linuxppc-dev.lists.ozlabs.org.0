Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F504EA27D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 23:35:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KS5b15dLBz3c2f
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 08:35:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YPALESBK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::432;
 helo=mail-wr1-x432.google.com; envelope-from=daniel.thompson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YPALESBK; dkim-atps=neutral
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRtXk5FFtz2ync
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Mar 2022 00:17:42 +1100 (AEDT)
Received: by mail-wr1-x432.google.com with SMTP id r13so20332510wrr.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Mar 2022 06:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=tpXnN0VHB6iUEh42xZkIfKz+h2Jc2+CMtnusz63fzes=;
 b=YPALESBKVO/yFKv+lXwz8leucUW/QtFuB0hl8JHZCqjO5xu4w5wIoQ5+pwQ+QRVXb9
 3B2L4bQYw0N2jb7N56M5R7JWYxgho8xdRwRmv4vnJodlkTGVC2bN4KorM9+VarCUvhfz
 rq7UuF1pwztE+IwdlG9cbNz+sqpgQ/NI9IDLUETHwbQomOpQYmH+MNVfGvC/MeWvzE8P
 lVgleUzejo6opEuHS9sTuvN1v42e4fq5Sl4PYl0tj9Ag7RHSYKvKr2OYJJ4Wgi/PE7G+
 XZp5RIOP+vUQXZXu/Ec0fSds9Y00Tni8973wJOMtSetYycYYe8h/qByU8h8Ok03tSfRP
 ibtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=tpXnN0VHB6iUEh42xZkIfKz+h2Jc2+CMtnusz63fzes=;
 b=zA2l6P+uitz08nYqO48K9tL4hoje2n14dngjRZRW81pEOlgoM5orBARAZvRHX4AEL3
 jFr8W7Jy0Pfrc/uW/wjj3T75VT0N1Elkk8e7/0mlj9TJKxNxwG3NR23CNMYaddMSK3HP
 xDuexeUeuvavpSjAgMajw1wxMhPUYqS8nC8V8soxbkC0gkPdK+LELtTDQowhOHHGOu46
 asL/2HCklofajLInItaPogafbItNzGbcvR7tIFEYXSiKT41zFSBN8siYIbbXT76Yp8ex
 QaPrB4ZiFFIk48SMZxya8GSFEmCLAT9gdKiWxVa3aNvGXqlW45ffP8rvu9kw7lWIV6Tt
 BjXg==
X-Gm-Message-State: AOAM530fsOuQeBiUK2zQ0LgHiOXT0DgzzwBJAnQjozpFrytkX0/OxCAZ
 JP2FNsIsv200xnZfvQwzdiqkIg==
X-Google-Smtp-Source: ABdhPJxNq7t8QyUoAz9PQk4czd3rKFhq8Qof4HJlKz+Grc5sLrrh91AI45J9TNBzEfnY5jgV4oClHQ==
X-Received: by 2002:a05:6000:1ac8:b0:204:2917:acd4 with SMTP id
 i8-20020a0560001ac800b002042917acd4mr23551818wry.31.1648473457317; 
 Mon, 28 Mar 2022 06:17:37 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 j7-20020a05600c410700b0038c72ef3f15sm15290807wmi.38.2022.03.28.06.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 06:17:36 -0700 (PDT)
Date: Mon, 28 Mar 2022 14:17:33 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Benjamin =?utf-8?B?U3TDvHJ6?= <benni@stuerz.xyz>
Subject: Re: [PATCH 01/22] orion5x: Replace comments with C99 initializers
Message-ID: <20220328131733.akhkwnldtldp7nyn@maple.lan>
References: <20220326165909.506926-1-benni@stuerz.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220326165909.506926-1-benni@stuerz.xyz>
X-Mailman-Approved-At: Tue, 29 Mar 2022 08:33:34 +1100
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
Cc: andrew@lunn.ch, linux-atm-general@lists.sourceforge.net,
 linux-ia64@vger.kernel.org, linus.walleij@linaro.org,
 dave.hansen@linux.intel.com, linux-pci@vger.kernel.org, robert.moore@intel.com,
 laforge@gnumonks.org, alim.akhtar@samsung.com, hpa@zytor.com,
 wcn36xx@lists.infradead.org, pkshih@realtek.com,
 linux-samsung-soc@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-edac@vger.kernel.org, dennis.dalessandro@cornelisnetworks.com,
 linux-rdma@vger.kernel.org, gregory.clement@bootlin.com,
 rafael.j.wysocki@intel.com, linux@armlinux.org.uk, krzk@kernel.org,
 jgg@ziepe.ca, mingo@redhat.com, 3chas3@gmail.com, linux-input@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com, lenb@kernel.org,
 mike.marciniszyn@cornelisnetworks.com, rric@kernel.org, ajd@linux.ibm.com,
 arnd@arndb.de, kvalo@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, loic.poulain@linaro.org, bp@alien8.de,
 bhelgaas@google.com, tglx@linutronix.de, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux@simtec.co.uk,
 linux-arm-kernel@lists.infradead.org, devel@acpica.org, isdn@linux-pingi.de,
 tony.luck@intel.com, nico@fluxnic.net, gregkh@linuxfoundation.org,
 dmitry.torokhov@gmail.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, james.morse@arm.com,
 netdev@vger.kernel.org, fbarrat@linux.ibm.com, sebastian.hesselbarth@gmail.com,
 pali@kernel.org, brgl@bgdev.pl
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Mar 26, 2022 at 05:58:48PM +0100, Benjamin Stürz wrote:
> This replaces comments with C99's designated
> initializers because the kernel supports them now.

This commit description seems wrong to me. This patch doesn't include
use C99 designated initializers (or AFAICT any other language feature
that has recently been enabled in the kernel).

The changes here are just plain constant-expressions in enumeration
lists and were included in C89/C90.


Daniel.


> 
> Signed-off-by: Benjamin Stürz <benni@stuerz.xyz>
> ---
>  arch/arm/mach-orion5x/dns323-setup.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/mach-orion5x/dns323-setup.c b/arch/arm/mach-orion5x/dns323-setup.c
> index 87cb47220e82..d762248c6512 100644
> --- a/arch/arm/mach-orion5x/dns323-setup.c
> +++ b/arch/arm/mach-orion5x/dns323-setup.c
> @@ -61,9 +61,9 @@
>  
>  /* Exposed to userspace, do not change */
>  enum {
> -	DNS323_REV_A1,	/* 0 */
> -	DNS323_REV_B1,	/* 1 */
> -	DNS323_REV_C1,	/* 2 */
> +	DNS323_REV_A1 = 0,
> +	DNS323_REV_B1 = 1,
> +	DNS323_REV_C1 = 2,
>  };
>  
>  
> -- 
> 2.35.1
> 
