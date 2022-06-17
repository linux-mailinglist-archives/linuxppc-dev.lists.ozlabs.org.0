Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3FF54F7E2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 14:54:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPfBx0Xl1z3cd2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 22:54:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FR4loS9D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::32; helo=mail-oa1-x32.google.com; envelope-from=danielhb413@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FR4loS9D;
	dkim-atps=neutral
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPfBF5Bhkz3bp8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 22:54:12 +1000 (AEST)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-101bc0d279cso407197fac.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 05:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7ftkbXNEpCj75kv+GVHhgsHyy3L0bk9/lbo7U73Ht+A=;
        b=FR4loS9DSHUGmM5o51bq/z8cK8jPqYby/QIpeypLsTxq+Wr108RpNP4bYMMjnJhhyj
         tZt3aaN9pxsSPxecFGk1x1/cf3yQ7evsyBk4v97AURibi4tZxwiHLm2pdjV4CZzZHf2U
         hWnoDv2fIBu/TDM2yeio9TynlkmaLnnpi0ct6FBSdD6SlP8ZIlvP8ah0+Vo14g2GBkMq
         oZWHHFTjcYh2wIE/zQp5yGk5Tlc0caD7y/jitihmB9baBbylK0Tef9CkglhBAvyPTvX6
         jmSR8MWaaOJJmmJLwU1GD3VSg62A4VfrR1rEC5CPnp23Ak6ig/nRnMYSUiBA3owy5akU
         6lTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7ftkbXNEpCj75kv+GVHhgsHyy3L0bk9/lbo7U73Ht+A=;
        b=hVpFiubynRQ+h3txXhWixOPKF5eHJJAMB+wFcYRUdXUBuqyiR8bmFmr95F5FVEHb7r
         5/EbIISY8XAq9oRDFY8ZA4a/3iu5/kbdnRWDPt9boNt6pB/VLZ/Gfjyudp6C7Q0Q/VYO
         mf9ww56vuoLAANonjr9UsyxtrRn7q5P03ISTn/oGw68yZg8saXPmy0wrYi5kC+rs2Y8j
         BUmJSHjL3Uwy/c25EmBU0VX/ocp4PqcjOqsFfdYuFtTuNP4xOYRovk9YKhGmmzhIs0HL
         jboJfJd8NP53G3GUDbpVNhgh50tHWtuust1nF3px3KlVWVpRJQyoXpmz1IgsyXG8pI9t
         C9pQ==
X-Gm-Message-State: AJIora9z1oq2jyDeFc4a8D4bu9eMUmWqutHcaSHtDu+Ez3s6lcF0tVH2
	/bjY9IQoGOF8E+mNZYWIkUA=
X-Google-Smtp-Source: AGRyM1sxkKC24H5zCy4MAIbAh3/EfJmzqi4AFzaX1enKLKjPoi4/Tr+RDNZHMZXQTdZ/Q/E/+pVwgQ==
X-Received: by 2002:a05:6870:d29d:b0:fb:3915:2ce0 with SMTP id d29-20020a056870d29d00b000fb39152ce0mr5553987oae.132.1655470448082;
        Fri, 17 Jun 2022 05:54:08 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c6:ccc8:8e07:268b:a09:2834? ([2804:431:c7c6:ccc8:8e07:268b:a09:2834])
        by smtp.gmail.com with ESMTPSA id o7-20020a9d5c07000000b0060bf6213084sm2401139otk.27.2022.06.17.05.54.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 05:54:07 -0700 (PDT)
Message-ID: <d5c8c055-5856-7fbe-0415-edc7b2ce26a6@gmail.com>
Date: Fri, 17 Jun 2022 09:54:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 0/4] pseries-wdt: initial support for H_WATCHDOG-based
 watchdog timers
Content-Language: en-US
To: Scott Cheloha <cheloha@linux.ibm.com>, linux-watchdog@vger.kernel.org
References: <20220602175353.68942-1-cheloha@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220602175353.68942-1-cheloha@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: nathanl@linux.ibm.com, wvoigt@us.ibm.com, aik@ozlabs.ru, vaishnavi@linux.ibm.com, npiggin@gmail.com, tzungbi@kernel.org, brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux@roeck-us.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/2/22 14:53, Scott Cheloha wrote:
> PAPR v2.12 defines a new hypercall, H_WATCHDOG.  This patch series
> adds support for this hypercall to powerpc/pseries kernels and
> introduces a new watchdog driver, "pseries-wdt", for the virtual
> timers exposed by the hypercall.
> 
> This series is preceded by the following:
> 
> RFC v1: https://lore.kernel.org/linux-watchdog/20220413165104.179144-1-cheloha@linux.ibm.com/
> RFC v2: https://lore.kernel.org/linux-watchdog/20220509174357.5448-1-cheloha@linux.ibm.com/
> PATCH v1: https://lore.kernel.org/linux-watchdog/20220520183552.33426-1-cheloha@linux.ibm.com/

Tested successfully with mainline QEMU plus Alexey's new h_watchdog patches in
https://patchwork.ozlabs.org/project/qemu-ppc/list/?series=305226.


All patches of this series:

Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>


Thanks,


Daniel

> 
> Changes of note from PATCH v1:
> 
> - Trim down the large comment documenting the H_WATCHDOG hypercall.
>    The comment is likely to rot, so remove anything we aren't using
>    and anything overly obvious.
> 
> - Remove any preprocessor definitions not actually used in the module
>    right now.  If we want to use other features offered by the hypercall
>    we can add them in later.  They're just clutter until then.
> 
> - Simplify the "action" module parameter.  The value is now an index
>    into an array of possible timeoutAction values.  This design removes
>    the need for the custom get/set methods used in PATCH v1.
> 
>    Now we merely need to check that the "action" value is a valid
>    index during pseries_wdt_probe().  Easy.
> 
> - Make the timeoutAction a member of pseries_wdt, "action".  This
>    eliminates the use of a global variable during pseries_wdt_start().
> 
> - Use watchdog_init_timeout() idiomatically.  Check its return value
>    and error out of pseries_wdt_probe() if it fails.
> 
> 
