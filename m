Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA60F4E98A5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 15:47:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRvCR5hFJz3c1m
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 00:47:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Casp3ieH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32c;
 helo=mail-wm1-x32c.google.com; envelope-from=daniel.thompson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Casp3ieH; dkim-atps=neutral
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRvBp6q9gz3073
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Mar 2022 00:47:12 +1100 (AEDT)
Received: by mail-wm1-x32c.google.com with SMTP id
 10-20020a1c020a000000b0038d043aac51so256247wmc.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Mar 2022 06:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=lqWUovhT3deFfz1zrmG2BdScTmfXFTXlEBWbC7kOkUc=;
 b=Casp3ieHRH0PsmFMjKH7TFdpT/TNQBYWEewfJb+0xu+uR1ofg9WJFp8XZHfsoJ6hWp
 C3nRcv1dmEeOPPKeVzOxrD+erWCy3JA6tU8mIHsAGm/8BjsYzwvx7P5mI7L1KmNHeogG
 38uNEFuvu5fJtLpThq9lRBZu4UJTQpGAB9zPox6v7iYfXD/Z14PGXT9t5owO2tQYWh0P
 3dUo+G/1/czVs79WbHUKkU/6h2niPOopvKPMU5QpP07x/qfD1LrC5Cesac25l5SMzvon
 esMFddga3HKSH7nNwn2IpXtOjAEGaytpRSosc2jrznnt1TPvUIg3fMjEdTz9d4Vfr7yu
 igag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=lqWUovhT3deFfz1zrmG2BdScTmfXFTXlEBWbC7kOkUc=;
 b=0etZ7h8U/6+exPrZzJZpNrk2qwPjKmvuCEGOSwXVeZh9j7dNwFhc+2gJy6gD42C7AS
 xam/1jKSOgWT31K7gC9O9lPl2rL5pMMCSzAoHQSclf/w2t99qNJ/DAhiwciTzDmCZlXD
 dRxMRVna+kCONxLGqoUOpFrrtWtB9/f/XERLpdNEa10RlbLnv7uh/Z6cvdVBtjzNA8wp
 2TZkdl2f6BWyQFCTs4aGUJROVDd7MRTm5QtwE9AY/NRRxS/IP2p5IGBqOClrx/OsHlCu
 HAmFQYj4AqG8Fe0Wd4QWu+KbYoVI5//umQxm2dF8oKU7CUSO3i2xP/FqCm8cBniEAj+t
 wQng==
X-Gm-Message-State: AOAM530+B3eXpqg5IggjmvawcngslfSxjc0Tg+fvp4Cc1GyYBLqzgmEh
 am+TiHpr1WOs3h9UDMyNqmX2hA==
X-Google-Smtp-Source: ABdhPJwB0pYnLloiCs6wa/2INWNx44L+qT5u6Nb9H+6gXgQ9TsmBu3vjwmvbBF2kaoxeBO0KJ0MWbQ==
X-Received: by 2002:a05:600c:4401:b0:38c:8df8:9797 with SMTP id
 u1-20020a05600c440100b0038c8df89797mr35783652wmn.13.1648475228582; 
 Mon, 28 Mar 2022 06:47:08 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 t4-20020a05600001c400b00203fb5dcf29sm12145898wrx.40.2022.03.28.06.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 06:47:08 -0700 (PDT)
Date: Mon, 28 Mar 2022 14:47:05 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Benjamin =?utf-8?B?U3TDvHJ6?= <benni@stuerz.xyz>
Subject: Re: [PATCH 00/22] Replace comments with C99 initializers
Message-ID: <20220328134705.lnxwwznhw622r2pr@maple.lan>
References: <20220326165909.506926-1-benni@stuerz.xyz>
 <8f9271b6-0381-70a9-f0c2-595b2235866a@stuerz.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8f9271b6-0381-70a9-f0c2-595b2235866a@stuerz.xyz>
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
Cc: linux-atm-general@lists.sourceforge.net, linux-ia64@vger.kernel.org,
 linus.walleij@linaro.org, dave.hansen@linux.intel.com,
 linux-pci@vger.kernel.org, robert.moore@intel.com, laforge@gnumonks.org,
 alim.akhtar@samsung.com, hpa@zytor.com, wcn36xx@lists.infradead.org,
 pkshih@realtek.com, linux-samsung-soc@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-edac@vger.kernel.org,
 dennis.dalessandro@cornelisnetworks.com, linux-rdma@vger.kernel.org,
 gregory.clement@bootlin.com, rafael.j.wysocki@intel.com, linux@armlinux.org.uk,
 krzk@kernel.org, jgg@ziepe.ca, mingo@redhat.com, 3chas3@gmail.com,
 linux-input@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com,
 lenb@kernel.org, mike.marciniszyn@cornelisnetworks.com, rric@kernel.org,
 ajd@linux.ibm.com, arnd@arndb.de, kvalo@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 loic.poulain@linaro.org, bp@alien8.de, bhelgaas@google.com, tglx@linutronix.de,
 mchehab@kernel.org, linux-media@vger.kernel.org, linux@simtec.co.uk,
 linux-arm-kernel@lists.infradead.org, devel@acpica.org, isdn@linux-pingi.de,
 tony.luck@intel.com, nico@fluxnic.net, gregkh@linuxfoundation.org,
 dmitry.torokhov@gmail.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, james.morse@arm.com,
 netdev@vger.kernel.org, fbarrat@linux.ibm.com, sebastian.hesselbarth@gmail.com,
 pali@kernel.org, brgl@bgdev.pl
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Mar 27, 2022 at 02:46:00PM +0200, Benjamin Stürz wrote:
> This patch series replaces comments with C99's designated initializers
> in a few places. It also adds some enum initializers. This is my first
> time contributing to the Linux kernel, therefore I'm probably doing a
> lot of things the wrong way. I'm sorry for that.

Welcome!


> I've gotten a few emails so far stating that this patch series is
> unnecessary. Yes, in fact this patch series is not necessary by itself,
> but it could help me understand how the whole process works and maybe I
> could help somewhere, where help is actually needed.

Have you been told the series is unnecessary or too big?

Although all patches represent a variant of the same mechanical
transformation but they are mostly unrelated to each other and, if
accepted, they will be applied by many different people.

Taken as a whole presenting this to maintainers as a 22 patch set is too
big. I'd recommend starting with a smaller patch or patch series where
all the patches get picked up by the same maintainer.


> This patch itself is a no-op.

PATCH 0/XX is for the covering letter. You should generate a template for
it using the --cover-letter option of git format-patch. That way patch 0
will contain the diffstat for the whole series (which is often useful
to help understand what the series is for) and there is no need to
make no-op changes.


Daniel.

> 
> Signed-off-by: Benjamin Stürz <benni@stuerz.xyz>
> ---
>  .gitignore | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitignore b/.gitignore
> index 7afd412dadd2..706f667261eb 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -20,7 +20,7 @@
>  *.dtb
>  *.dtbo
>  *.dtb.S
> -*.dwo
> +*.dwo
>  *.elf
>  *.gcno
>  *.gz
> -- 
> 2.35.1
