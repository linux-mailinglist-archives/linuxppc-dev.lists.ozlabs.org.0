Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D966E77EDCF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 01:26:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=J+2GZw9s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RR45x4clYz3cQg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 09:26:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=J+2GZw9s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f33; helo=mail-qv1-xf33.google.com; envelope-from=mr.bossman075@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RR3B73XXBz2yTc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 08:45:17 +1000 (AEST)
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6418c819c3cso32381296d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Aug 2023 15:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692225914; x=1692830714;
        h=content-transfer-encoding:subject:from:reply-to:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MGoBkEwlCnbJad+CecbjRY+VjiJK8E7bojDgpjg7FvU=;
        b=J+2GZw9sDgAuPCvyYPqSvvzp1lVg6wE6qeMOlcYMGPuThPNLCGYiiW2dwFVq91l/vl
         NT/yeq5xZ4Ufc7IZxR6ugOwOZQfg5nMbUshmMxhNTewriji8eUuaNn0c360FPsW5tkH4
         6cS/vKC7K0l0lZLKGVqDi2VTUmRXgo+WSJJ9fOFjLJU7uhgHYQzddKm06zxNwf3BXFjN
         SCDUE56G1UeYAPYGs2dGSOsKeDDFiUZRdgQwqGIeL2NpPJhlcnrVVGytRXUYD0OF20a4
         87SE8XWZHMx/EGlk2yISP6pygxQx+aQ11VINZVZvJIAIyOIfvz+sxSaS9uqbom35csu9
         8sYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692225914; x=1692830714;
        h=content-transfer-encoding:subject:from:reply-to:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MGoBkEwlCnbJad+CecbjRY+VjiJK8E7bojDgpjg7FvU=;
        b=YtekNW+NEeq5JC0T/o1W7Lt+nSQj81PP+WxgC0jkY2XuHP4pDeq8/XbtAq3zGX3KrC
         iGnD6l0XGQ+XLj+wY6smcc2ftjxTPOmLMqj5kQB9s5FO8ygkAgZc4QXdzXN/Uu21VdGF
         wdi8+LbyH8BlJurzWp7mxwIbvpH/6oTE1mCNfDESl/AvgvMEcA/Ndiv3ixnnHev6M+iR
         0FxESwZITTQeCNSlvmnQKJoyqVN+FPXdzyAToThjfc3FaG6P8dMYeBzK46FlZcUwSjvI
         B2O57kdedaovVI4eho5IBh3Tc2ixWVSeUo10EFngQMn692jhSMu/9Lfd+aVnyEItxu3/
         keDw==
X-Gm-Message-State: AOJu0Yy1XymGFlnWAyhJCDizcwXK/jQ2pVKobMZL5vXHyZ9+TrrdNYIE
	gVVzxwv9NpsYIVZ6tIamE9k=
X-Google-Smtp-Source: AGHT+IFsHNXunRgp3X8hlKrWnp7WXFK/+sVXWgsvRCLnJDzFjNXPGtXcdWLNPeHWJ41d2OTBT7Z5iQ==
X-Received: by 2002:a0c:e4c7:0:b0:649:980c:4ee1 with SMTP id g7-20020a0ce4c7000000b00649980c4ee1mr1626603qvm.5.1692225914347;
        Wed, 16 Aug 2023 15:45:14 -0700 (PDT)
Received: from ?IPV6:2600:4040:57a3:100:5b2e:7da0:3ac1:56bd? ([2600:4040:57a3:100:5b2e:7da0:3ac1:56bd])
        by smtp.gmail.com with ESMTPSA id w13-20020a0ce10d000000b00645cbb3b6bbsm3864703qvk.115.2023.08.16.15.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 15:45:13 -0700 (PDT)
Message-ID: <38e1a01b-1e8b-7c66-bafc-fc5861f08da9@gmail.com>
Date: Wed, 16 Aug 2023 18:45:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>
From: Jesse Taube <mr.bossman075@gmail.com>
Subject: Re: [PATCH] treewide: drop CONFIG_EMBEDDED
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 17 Aug 2023 09:24:54 +1000
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
Reply-To: 20230816055010.31534-1-rdunlap@infradead.org
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-kernel@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-riscv@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Masahiro Yamada <masahiroy@kernel.org>, Russell King <linux@armlinux.org.uk>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, Jonas Bonn <jonas@southpole.se>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thomas Boge
 ndoerfer <tsbogend@alpha.franken.de>, Max Filippov <jcmvbkbc@gmail.com>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi, Randy

 > diff -- a/init/Kconfig b/init/Kconfig
 > --- a/init/Kconfig
 > +++ b/init/Kconfig
 > @@ -1790,14 +1790,6 @@ config DEBUG_RSEQ
 >
 >  	  If unsure, say N.
 >
 > -config EMBEDDED
 > -	bool "Embedded system"
 > -	select EXPERT
 > -	help
 > -	  This option should be enabled if compiling the kernel for
 > -	  an embedded system so certain expert options are available
 > -	  for configuration.

Wouldn't removing this break many out of tree configs?
Should there be a warning here to update change it instead of removal?

Thanks,
Jesse Taube
