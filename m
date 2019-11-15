Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4B2FD7C7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 09:13:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Drhm3wZjzF6wS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 19:13:44 +1100 (AEDT)
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
 header.b="bhvYGZ1l"; dkim-atps=neutral
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DrfX5TgVzF3g2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 19:11:47 +1100 (AEDT)
Received: by mail-lf1-x141.google.com with SMTP id v8so7288509lfa.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 00:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cSkg4y8vQ0fWUekpUvYTG37APlVQNKH+BU4UyQZbeZs=;
 b=bhvYGZ1lTQHiSLEBGy316WOg8uJmr19WMwnbnCNIAe+g9dECIpGAveiykIv51Zsp5H
 q5H02EIco+WEDC56pAH5UpavswZnVJ6/TzgN01/XvbZ3WOk6dfiSFEIqLOP91nIopmjO
 i5sekMVyCaqS+WJFufl8nVmciwx4GpUp4vHh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cSkg4y8vQ0fWUekpUvYTG37APlVQNKH+BU4UyQZbeZs=;
 b=j+4GdVFf3tX6VQaPJsGcTvCdHqwnIx8qbPg+54wUpDBugS0TXHML2sui8kLSOV0JAM
 27sHthut/QwjyHDLjJJeu/xNeQfAjT2iEXPjkg712JM3XnnRB62s9uOAbyotNVOtfFY5
 LKG05BiqjxF2jKXBJO3BBxa3CbeZk3ZPYMcTL2ITGbRcWyfJ1hf3SPvJ5plta0//+gls
 YAErRq9mMVlI/ZAntA2TyfAFDYMSU+zBUiXKA6JhiWRk9wz2ARDowC2N3PdkLfUPGKCi
 c9lkE9hz5xJWeRK3sksdoSR1XNRlU9nouAkOEIqlTF8jqYxptwXR0eQr6ZKfSOnDVgBx
 7G3Q==
X-Gm-Message-State: APjAAAUvKN8oRgZB2ySZalr1dadBGde+E4xpMY0qvI/+GnWY4ZSZCyYw
 06zVl0wK058H96gstUJHb3TMgA==
X-Google-Smtp-Source: APXvYqx6iGcHvwJhuRwgIveFwGhIs3bltyGjSHCtX4coi17em4/eMuEjk9toc+eYfX3AS6UqL2gs4g==
X-Received: by 2002:a19:8104:: with SMTP id c4mr317478lfd.165.1573805503320;
 Fri, 15 Nov 2019 00:11:43 -0800 (PST)
Received: from [172.16.11.28] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id m8sm3414243ljj.80.2019.11.15.00.11.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 15 Nov 2019 00:11:42 -0800 (PST)
Subject: Re: [PATCH v4 07/47] soc: fsl: qe: qe.c: guard use of
 pvr_version_is() with CONFIG_PPC32
To: Timur Tabi <timur@kernel.org>
References: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
 <20191108130123.6839-8-linux@rasmusvillemoes.dk>
 <CAOZdJXXHK9U_Y7_VgVmuOFKDAh4OqBJ7hZx58hisZZ6Cz6xE2w@mail.gmail.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <027c2b7a-a235-cecf-9f08-f71736f2ea55@rasmusvillemoes.dk>
Date: Fri, 15 Nov 2019 09:11:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAOZdJXXHK9U_Y7_VgVmuOFKDAh4OqBJ7hZx58hisZZ6Cz6xE2w@mail.gmail.com>
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
Cc: lkml <linux-kernel@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 15/11/2019 05.50, Timur Tabi wrote:
> On Fri, Nov 8, 2019 at 7:04 AM Rasmus Villemoes
> <linux@rasmusvillemoes.dk> wrote:
>>
>> +static bool qe_general4_errata(void)
>> +{
>> +#ifdef CONFIG_PPC32
>> +       return pvr_version_is(PVR_VER_836x) || pvr_version_is(PVR_VER_832x);
>> +#endif
>> +       return false;
>> +}
>> +
>>  /* Program the BRG to the given sampling rate and multiplier
>>   *
>>   * @brg: the BRG, QE_BRG1 - QE_BRG16
>> @@ -223,7 +231,7 @@ int qe_setbrg(enum qe_clock brg, unsigned int rate, unsigned int multiplier)
>>         /* Errata QE_General4, which affects some MPC832x and MPC836x SOCs, says
>>            that the BRG divisor must be even if you're not using divide-by-16
>>            mode. */
> 
> Can you also move this comment (and fix the comment formatting so that
> it's a proper function comment) to qe_general4_errata()?
> 

I actually thought of doing that, but decided against it because the
comment not only mentions the SOCs affected, but also explains the
following math/logic. I mean, without that comment nearby, the code is

  if (qe_general4_errata())
     if (some weird condition)
        divisor++;

In contrast, I think the qe_general4_errata() is pretty self-explanatory
- is this a SOC affected by that errata (whatever that errata may be
about and what the software workaround is).

Rasmus
