Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 472EE30A051
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 03:18:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DTWpM1fG6zDrQn
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 13:18:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DTWmX3WH2zDrHl
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Feb 2021 13:17:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=O08DvLTE; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by ozlabs.org (Postfix) with ESMTP id 4DTWmW5PJZz9t2g
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Feb 2021 13:17:15 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4DTWmW4x26z9t1D; Mon,  1 Feb 2021 13:17:15 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=f.fainelli@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=O08DvLTE; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4DTWmW29mlz9srY
 for <linuxppc-dev@ozlabs.org>; Mon,  1 Feb 2021 13:17:12 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id md11so9423151pjb.0
 for <linuxppc-dev@ozlabs.org>; Sun, 31 Jan 2021 18:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uHn5YUv9e330lQDTQ77kfOkIk6WrBv4Ux60Mjf3/6uI=;
 b=O08DvLTEZyROugy37vCryitaoyD11No3JUrc609+BRDDm0DYAw7lHNvYmAPQE8iQ3l
 /DQCCYCVkM9McnoHSxwgDZSRSEysPVoKyO8rsGxLaIF746c8YlwNcj323tZpMH5upYN9
 RIDXECW9RopMx5nWoWIdtXS1RlpSzFFchicGbalvg93FaN8aH8OzMiRuYRA/Z+XlpGi5
 dLDl1xPhNYW+SRlfwCRzxU8rTthSyHsuN3CUP4g8u/17bviKhm0XnO5/9UurrQYEckmX
 BeOWq+5K3Tm5Qx5R/sJ3xsj5U2OlFINNYAMV517XYGqQr8H1d0fCNZjfY7EYJlbi+Xz3
 gxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uHn5YUv9e330lQDTQ77kfOkIk6WrBv4Ux60Mjf3/6uI=;
 b=uEQ0UmTVeixyvKsQI7JuJ30xszBEYhHy0pqXs3aBR9cN5utGK3ODkqplVE6mAUBcA6
 oODMeHtdvJ9PrjZjzAiUgLc02bzGReOTq5gEhy1pNL2lbqSUaDm7teHZi72hVDzSfiE8
 tMtI+7GKrR7w3oZRAeqD0WsHiRrCE/h5qu8UosLtwo8znk1gQoxi0Ie2/64nWBUrQCZ0
 xtvGoGiVA+VRwB906ujRPBtL3tNt2Py+PARIHzHGVQpNDuQqMmj7OwT/sTosr9YrH6cW
 f/z4Vp07D/0U87q1sg+VtXjZVk3PvE8cs+iZHefqNnepm3u+XK1g5e+dni+lwiQa0197
 sdRg==
X-Gm-Message-State: AOAM532WTUHzRXJSN7Km6AC6oDUMM+CiwROfDI34YKTxWDXE6w+dTOBQ
 iA5scJFXy6kelPyAvMuSLYs=
X-Google-Smtp-Source: ABdhPJyzH4E1+6FYwPToK4vGHuBzSZNtsOTB99mG8You2tvWWERt4zcBFhrNZE9thCEdZxi0LYMLsw==
X-Received: by 2002:a17:90a:5993:: with SMTP id
 l19mr14587538pji.203.1612145829633; 
 Sun, 31 Jan 2021 18:17:09 -0800 (PST)
Received: from [10.230.29.30] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id h12sm15702907pgs.7.2021.01.31.18.17.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 18:17:08 -0800 (PST)
Subject: Re: [PATCH] powerpc/akebono: Fix unmet dependency errors
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
References: <20210201012503.940145-1-mpe@ellerman.id.au>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <7c9b6874-7623-13e6-1423-971ac1551b5c@gmail.com>
Date: Sun, 31 Jan 2021 18:17:05 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210201012503.940145-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: rdunlap@infradead.org, yury.norov@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 1/31/2021 5:25 PM, Michael Ellerman wrote:
> The AKEBONO config has various selects under it, including some with
> user-selectable dependencies, which means those dependencies can be
> disabled. This leads to warnings from Kconfig.
> 
> This can be seen with eg:
> 
>   $ make allnoconfig
>   $ ./scripts/config --file build~/.config -k -e CONFIG_44x -k -e CONFIG_PPC_47x -e CONFIG_AKEBONO
>   $ make olddefconfig
> 
>   WARNING: unmet direct dependencies detected for ATA
>     Depends on [n]: HAS_IOMEM [=y] && BLOCK [=n]
>     Selected by [y]:
>     - AKEBONO [=y] && PPC_47x [=y]
> 
>   WARNING: unmet direct dependencies detected for NETDEVICES
>     Depends on [n]: NET [=n]
>     Selected by [y]:
>     - AKEBONO [=y] && PPC_47x [=y]
> 
>   WARNING: unmet direct dependencies detected for ETHERNET
>     Depends on [n]: NETDEVICES [=y] && NET [=n]
>     Selected by [y]:
>     - AKEBONO [=y] && PPC_47x [=y]
> 
>   WARNING: unmet direct dependencies detected for MMC_SDHCI
>     Depends on [n]: MMC [=n] && HAS_DMA [=y]
>     Selected by [y]:
>     - AKEBONO [=y] && PPC_47x [=y]
> 
>   WARNING: unmet direct dependencies detected for MMC_SDHCI_PLTFM
>     Depends on [n]: MMC [=n] && MMC_SDHCI [=y]
>     Selected by [y]:
>     - AKEBONO [=y] && PPC_47x [=y]
> 
> The problem is that AKEBONO is using select to enable things that are
> not true dependencies, but rather things you probably want enabled in
> an AKEBONO kernel. That is what a defconfig is for.
> 
> So drop those selects and instead move those symbols into the
> defconfig. This fixes all the kconfig warnings, and the result of make
> 44x/akebono_defconfig is the same before and after the patch.
> 
> Reported-by: Yury Norov <yury.norov@gmail.com>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Much better than my patch, thanks!
-- 
Florian
