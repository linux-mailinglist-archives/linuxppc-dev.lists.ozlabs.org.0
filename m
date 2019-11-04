Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 108DBEDAAB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 09:39:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4765p11K7xzF4lQ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 19:39:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::141;
 helo=mail-lf1-x141.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="CRqPRRvM"; dkim-atps=neutral
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4765m521HLzF4hB
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2019 19:38:12 +1100 (AEDT)
Received: by mail-lf1-x141.google.com with SMTP id y127so11565435lfc.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Nov 2019 00:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aAvLvQnBn2etU9QWbHrMgTtrty/V9iZf2pUKjOUNug8=;
 b=CRqPRRvMc4CiyGWwN0n+HhobnmdoLfjL+0AzezW7ETOIFz5sHfNHH5JNGG6YI+/403
 MsQNEzWz0NSvbA0uWvsbCgqAT3tGi1qsOO0oSW4TRw1r9cIbKDUlQ9wzYhXtlrQDdRZs
 PV5CVnB5sUcQ4tEXqmk5O+Wt9y6sGHLcWmnV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aAvLvQnBn2etU9QWbHrMgTtrty/V9iZf2pUKjOUNug8=;
 b=M4WfzATyfaNLu+QI5k7C/l++UdJeQS8gPFchUVqTOkBu4zmas4uxlr8AYOyyN4xweU
 ve3Vt4OI+EncEPqpHVF1OjotPaqLQ1a9YbIP+tMuFG1vavuSCSaQy+O+mmscaS20y4Kz
 yQLiIgk/YPFP/MpLDJOHelCt1EoDlKqXX2/vQ2agRUNqO9AR/y8+Mf8jYBi9m5ANmKek
 +vb+984f101H6mB4xpRvFo4Yb5/WcqHd+WoR4sYnK46myatGW7ZexiO9uiEfqCy6uZWm
 PYuqhK/FOfGUKp9OsBC/Z/AWqIBpEmU8piWFIKT5IRddJQ7z11i2XL/Uf6VzT1fignKv
 VzKQ==
X-Gm-Message-State: APjAAAUrORz/3/FtbGIMyQhknXgtQzwGdPSw5fn1BKxQr+xOEboEsZjp
 Gqv59fJwQ2lEKg55STp8ygNinA==
X-Google-Smtp-Source: APXvYqzGJdH19phuRzqBS1a9feyj40vilK5OuKVvLX9t8OwmcbQ9em9T2maQ71sFqH2o8LzrUCr3gg==
X-Received: by 2002:ac2:549a:: with SMTP id t26mr15512173lfk.25.1572856688914; 
 Mon, 04 Nov 2019 00:38:08 -0800 (PST)
Received: from [172.16.11.28] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id u11sm8744096lfq.54.2019.11.04.00.38.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 Nov 2019 00:38:08 -0800 (PST)
Subject: Re: [PATCH v3 35/36] net/wan: make FSL_UCC_HDLC explicitly depend on
 PPC32
To: Leo Li <leoyang.li@nxp.com>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Qiang Zhao <qiang.zhao@nxp.com>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191101124210.14510-1-linux@rasmusvillemoes.dk>
 <20191101124210.14510-36-linux@rasmusvillemoes.dk>
 <4e2ac670-2bf4-fb47-2130-c0120bcf0111@c-s.fr>
 <VE1PR04MB6687D4620E32176BDC120DBA8F620@VE1PR04MB6687.eurprd04.prod.outlook.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <24ea27b6-adea-cc74-f480-b68de163f531@rasmusvillemoes.dk>
Date: Mon, 4 Nov 2019 09:38:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <VE1PR04MB6687D4620E32176BDC120DBA8F620@VE1PR04MB6687.eurprd04.prod.outlook.com>
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
Cc: Scott Wood <oss@buserror.net>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01/11/2019 23.31, Leo Li wrote:
> 
> 
>> -----Original Message-----
>> From: Christophe Leroy <christophe.leroy@c-s.fr>
>> Sent: Friday, November 1, 2019 11:30 AM
>> To: Rasmus Villemoes <linux@rasmusvillemoes.dk>; Qiang Zhao
>> <qiang.zhao@nxp.com>; Leo Li <leoyang.li@nxp.com>
>> Cc: linuxppc-dev@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org;
>> linux-kernel@vger.kernel.org; Scott Wood <oss@buserror.net>;
>> netdev@vger.kernel.org
>> Subject: Re: [PATCH v3 35/36] net/wan: make FSL_UCC_HDLC explicitly
>> depend on PPC32
>>
>>
>>
>> Le 01/11/2019 à 13:42, Rasmus Villemoes a écrit :
>>> Currently, FSL_UCC_HDLC depends on QUICC_ENGINE, which in turn
>> depends
>>> on PPC32. As preparation for removing the latter and thus allowing the
>>> core QE code to be built for other architectures, make FSL_UCC_HDLC
>>> explicitly depend on PPC32.
>>
>> Is that really powerpc specific ? Can't the ARM QE perform HDLC on UCC ?

I think the driver would build on ARM. Whether it works I don't know. I
know it does not build on 64 bit hosts (see kbuild report for v2,23/23).

> No.  Actually the HDLC and TDM are the major reason to integrate a QE on the ARM based Layerscape SoCs.

[citation needed].

> Since Rasmus doesn't have the hardware to test this feature Qiang Zhao probably can help verify the functionality of TDM and we can drop this patch.

No, this patch cannot be dropped. Please see the kbuild complaints for
v2,23/23 about use of IS_ERR_VALUE on not-sizeof(long) entities. I see
kbuild has complained about the same thing for v3 since apparently the
same thing appears in ucc_slow.c. So I'll fix that.

Moreover, as you say and know, I do not have the hardware to test it, so
I'm not going to even attempt to fix up fsl_ucc_hdlc.c. If Qiang Zhao or
somebody else can verify that it works just fine on ARM and fixes the
allmodconfig problem(s), he/she is more than welcome to sign off on a
patch that removes the CONFIG_PPC32 dependency or replaces it with
something else.

Rasmus
