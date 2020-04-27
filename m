Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 397B61B97FD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 09:03:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499bNM3XBZzDqbs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 17:03:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499bJH4MxWzDqTm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 17:00:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=oVU3dM+b; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 499bJG2gXjz9BR3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 17:00:14 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 499bJF6D8Yz9sSq; Mon, 27 Apr 2020 17:00:13 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::341;
 helo=mail-wm1-x341.google.com; envelope-from=daniel.lezcano@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=oVU3dM+b; dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 499bJD4Y1Gz9sSc
 for <linuxppc-dev@ozlabs.org>; Mon, 27 Apr 2020 17:00:12 +1000 (AEST)
Received: by mail-wm1-x341.google.com with SMTP id x25so18275627wmc.0
 for <linuxppc-dev@ozlabs.org>; Mon, 27 Apr 2020 00:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3LrBTWKR8RZnJsKdt2BtOUDXV0TQoOt0eUU0K5w5lSE=;
 b=oVU3dM+bm37jxxJCCv7t9xgHBlkV+VnyUx0PhitV+4aUyvSvxGbuKbY1MCIZSNFkvR
 T7p9ezgKUbyGfrOp4Oze9bFpL/3ydotXHT00ciKv3b86BxVITEt7m7uZj2T1wD8c/IeC
 t7QmPREZq3jeQEg1r9BHXEtttm9AZmW8ruOAnQoIle8CkJstrfLgDiAmupw6g1fTAC0D
 Ckb952dTIhkM5l3VF89XdQIOZnowREmoEnCwBqnKHcv1Kj6L9aIgn4nFMGEvuFSVTUXZ
 q1K77HYg9KMr1qsEGQnfmilHvf0fiCjko7rNtdy1zvRiKRlJp9qGH02KCYPlRKKfjFM9
 xJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3LrBTWKR8RZnJsKdt2BtOUDXV0TQoOt0eUU0K5w5lSE=;
 b=BoDUz1RuC8QCb6UAJ/B7XLoy6OEuQcW/bfU7KfvpXxeak9kZ8TbE6LtrtU9wB3fWDr
 aVizEVORdiek90SmlJSwJCxeehwNQ7ASTDHqEHRrAYDv9mb9+v7MDmCsX0KSEQgmEaJ/
 XAuQT5pmC3KNC4ZZr+6W4x9stkghOAngUrWTEbl62eLdkm4lcl7d2EYWK+7jyCAVgr/J
 uPlFfORYr2AwQjp03Qwrlw+ZbuEr+DMRUcjKn13oMdVCGfKTZVEfd1Xy3N8ZUGM+I8ZV
 qAaDPCP9l4rgz6i8wc/hqdYB4YRTxEDSzszq6Z2iOF/EAJzduXR28/Iaw4m0HwOMo77G
 2Vtg==
X-Gm-Message-State: AGi0PubISMYIEaV7mReHwRazfHqlYsrrd2fsLJ2z23WZGyv3E/bMB1Or
 dZuAgPt8mfaAPCxV19v86GdUsg==
X-Google-Smtp-Source: APiQypJodr4c4+fycbp55+jKelfPIyy5Mfb8pZxsys+qLWl4QK+n03MMhJxq9T3SNpJq6u+LIM4DhA==
X-Received: by 2002:a7b:c399:: with SMTP id s25mr23845990wmj.169.1587970807729; 
 Mon, 27 Apr 2020 00:00:07 -0700 (PDT)
Received: from [192.168.0.41] (lns-bzn-59-82-252-135-148.adsl.proxad.net.
 [82.252.135.148]) by smtp.googlemail.com with ESMTPSA id
 q143sm15169085wme.31.2020.04.27.00.00.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2020 00:00:07 -0700 (PDT)
Subject: Re: [PATCH] clocksource/drivers/timer-microchip-pit64b: Select
 CONFIG_TIMER_OF
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20200426124356.3929682-1-mpe@ellerman.id.au>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <50114298-7788-79bf-b9a8-26f399437c63@linaro.org>
Date: Mon, 27 Apr 2020 09:00:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200426124356.3929682-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@ozlabs.org, tglx@linutronix.de, linux-kernel@vger.kernel.org,
 claudiu.beznea@microchip.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 26/04/2020 14:43, Michael Ellerman wrote:
> This driver is an OF driver, it depends on OF, and uses
> TIMER_OF_DECLARE, so it should select CONFIG_TIMER_OF.
> 
> Without CONFIG_TIMER_OF enabled this can lead to warnings such as:
> 
>   powerpc-linux-ld: warning: orphan section `__timer_of_table' from
>   `drivers/clocksource/timer-microchip-pit64b.o' being placed in
>   section `__timer_of_table'.
> 
> Because TIMER_OF_TABLES in vmlinux.lds.h doesn't emit anything into
> the linker script when CONFIG_TIMER_OF is not enabled.
> 
> Fixes: 625022a5f160 ("clocksource/drivers/timer-microchip-pit64b: Add Microchip PIT64B support")
> Cc: stable@vger.kernel.org # v5.6+
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---

Applied, thanks

>  drivers/clocksource/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index f2142e6bbea3..f225c27b70f7 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -709,6 +709,7 @@ config MICROCHIP_PIT64B
>  	bool "Microchip PIT64B support"
>  	depends on OF || COMPILE_TEST
>  	select CLKSRC_MMIO
> +	select TIMER_OF
>  	help
>  	  This option enables Microchip PIT64B timer for Atmel
>  	  based system. It supports the oneshot, the periodic
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
