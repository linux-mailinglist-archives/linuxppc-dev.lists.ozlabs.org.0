Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F39E934AED1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 19:54:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6WPC6n0Rz3c7F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Mar 2021 05:54:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=joIbwIM2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32a;
 helo=mail-wm1-x32a.google.com; envelope-from=0x7f454c46@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=joIbwIM2; dkim-atps=neutral
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6WNm4BQ4z2xg6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Mar 2021 05:54:31 +1100 (AEDT)
Received: by mail-wm1-x32a.google.com with SMTP id
 r10-20020a05600c35cab029010c946c95easo3501751wmq.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 11:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=clGoW4et5bZn4mVDlkWFq54mP7/EgB1s6WZYv8qiD3A=;
 b=joIbwIM2vo1IxaB6u2EQoKPON9rs08UNtIXeyOn+toOgoHIwnAMZw3zs5qkBvJnkit
 TdW0dOJJSFFfqmpzJbuG2wCulbNms4ellWGFUYOBnR+Q3YEwfYOnxGFICxcDYRLVDKjl
 jK30gt0+acfB+QZh5jcGhDhce/HyGa3c7LGlk//HJus6Jwgq4zVgsO2W5kpkL1wVtNhw
 IaR0v5dRIAKjP1DniKvCxErCsUMoMya8cPnOnSO6ru7GE8pVcGKC6rTUJ+MIra0ptI5+
 kOf+1xFwnhwz4p4HI5UERKQGxcz6nLcrN+dgV7mmc8QWirgUj51aRO6eS+76s/TiT2TH
 wbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=clGoW4et5bZn4mVDlkWFq54mP7/EgB1s6WZYv8qiD3A=;
 b=Vjc45AAkQiCq5yGkANqYfLBVtx0mdTbq/5zMuQ/VBDwh2Qa+1SM/2BTbQ4ImdE63yG
 3WgLfi8S7McnNak0/7wUBhA1BL/QvIZ4FkwLVhJ7oT3xFG4gn9Hp1TtdeiZ7ayJaruE0
 R3cxXN5SPTdS9TSY4/ZppUTPfA1LpRRlpN6794j4u10XOLPFq53pWBACs45rOFBQmGIY
 5UjZgUMEPFPl9HRf1bouNEJ8sr9WXJ90uOa07Ky9hNgGxa5QXvPEswPxR0/nwukEAzqe
 jrqhFp9qyi9rjk+uDg1gmDDq4d03nyFMf6teyZWQQqspClB+7VCLl3+HrL12CzV5XEk7
 2Xpg==
X-Gm-Message-State: AOAM5335R0wE4gajQqFrWsBr0/9N/Vj5OREvo2FG+D+Va6560MreKU4B
 Or+GDzwOb4cOn762mfgmCnA=
X-Google-Smtp-Source: ABdhPJw9Pru2Ih3wnElYfS1sF95Bml5rXYqqLFmrrFel2UtntOS/XCrZjh15EDdMiJNSmIdGzyrUig==
X-Received: by 2002:a1c:e084:: with SMTP id x126mr14257427wmg.37.1616784865408; 
 Fri, 26 Mar 2021 11:54:25 -0700 (PDT)
Received: from ?IPv6:2a02:8084:e84:2480:228:f8ff:fe6f:83a8?
 ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
 by smtp.gmail.com with ESMTPSA id z66sm12881333wmc.4.2021.03.26.11.54.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Mar 2021 11:54:24 -0700 (PDT)
Subject: Re: VDSO ELF header
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Laurent Dufour <ldufour@linux.ibm.com>
References: <c45ae4f8-1cbc-c687-b6a2-9a431fafc85c@linux.ibm.com>
 <9366c258-127f-f105-abd1-6baa9a6745c5@csgroup.eu>
 <5b03e966-2cfd-5f0c-c48d-dea5e0001833@linux.ibm.com>
 <30c51951-332b-7aa8-13ba-44a0b6ae3498@linux.ibm.com>
 <87blb6gpkj.fsf@mpe.ellerman.id.au>
 <c7e0568f-786b-2c1c-fb6d-cd804bc1b539@csgroup.eu>
 <e8c2b4b5-f0b6-945e-4a42-c2308dd719a2@gmail.com>
 <3ce8811a-9216-6164-cdf2-974b13e400d3@csgroup.eu>
 <edf2547f-4705-764b-dadd-3ec1d2a6b8b3@gmail.com>
 <4904769a-be42-cdd2-1d97-8b1889f7f723@csgroup.eu>
 <46e49770-04ee-2455-f2f7-b3915ceea38a@gmail.com>
 <ec257b8b-d611-bbf4-86f3-bb0b758dbeaf@csgroup.eu>
From: Dmitry Safonov <0x7f454c46@gmail.com>
Message-ID: <e462ddff-c6c5-5c1b-a2f2-7352b85b332e@gmail.com>
Date: Fri, 26 Mar 2021 18:54:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <ec257b8b-d611-bbf4-86f3-bb0b758dbeaf@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/26/21 6:40 PM, Christophe Leroy wrote:
> 
> 
> Le 26/03/2021 à 18:11, Dmitry Safonov a écrit :
>> On 3/26/21 5:07 PM, Christophe Leroy wrote:
>>> No, the problem is that user access has to be allowed for the flush()
>>>
>>> A hacky solution would be to call user_access_begin() , will test that
>>> later
>>
>> Yeah, cool.
>>
>> Will it be fine if I send the vvar patch with your Tested-by?
>>
> 
> Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Thank you!
I'll properly submit it shortly..

> With the user access fixed on the flush, it sigreturn_vdso selftest is a
> success. I'll send a patch for it in the coming days.

Nice!

> What is the status of your series which adds generic vdso_base tracking ?

Yeah, I was doing a new version of patches and I always was unsatisfied
by the result and stuck between "good" and "best" (more code rewriting).
And then had some other work to finish.

I'll try to finish and send it next week, thanks for pinging :-)

--
           Dmitry
