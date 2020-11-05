Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F842A79E6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 09:58:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRcqT28JNzDqk8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 19:57:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.218.65; helo=mail-ej1-f65.google.com;
 envelope-from=jirislaby@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRcmd3r2dzDqjY
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 19:55:26 +1100 (AEDT)
Received: by mail-ej1-f65.google.com with SMTP id i19so1459761ejx.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Nov 2020 00:55:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GGv1/NsFYMq8a8x8p1Q5v+BEw3Nc7uWhGOg4cbDcIXA=;
 b=W2PmT8bQ2LZu/e+BasLwCKWjkQZX81T+pqOQVftaoUTxvcmlvsd7vaLXFOp3gw1Ef3
 Qk56y7MUoZ82qeLLLIid2u20uw2kA6dTCnwFO0p8Slbal1y6ykZ5Llnk4S9577YqwuIF
 pIeQST4hC9yfUX9DNCOGYcZb2DdbLPEd0S77gYsnCqoCSVA+klyuga3AEj0hCfVRstj7
 cQQH+03Ut0Lv3b60C/z8WxhXOGffa3ara7kfh2bvJM1koYxnukszb2HQG5Aprh3RdMHy
 D5plYhZ+aIfQYe8KlED/QjrHA3ni5FRzpCfaT79/znA+eN1IaiB1IaNQj0/rBmFuJOiJ
 VWcg==
X-Gm-Message-State: AOAM532/FswPa+n6LFtiWQrTWbDgd7veBUvArcpCfpC3u3HYmm12wV1/
 sEraHY40F5cQvMssPgL9zMo=
X-Google-Smtp-Source: ABdhPJwlV6BHk/ukWXn9K8mMtuqyPYhxriyIPdn8c/NN7zuf0Gv4HEl392plPlhi70fVhuuDI3r/kg==
X-Received: by 2002:a17:906:c43:: with SMTP id
 t3mr1234400ejf.219.1604566523454; 
 Thu, 05 Nov 2020 00:55:23 -0800 (PST)
Received: from ?IPv6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
 by smtp.gmail.com with ESMTPSA id b12sm492530edn.86.2020.11.05.00.55.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2020 00:55:22 -0800 (PST)
Subject: Re: [PATCH 34/36] tty: serial: pmac_zilog: Make disposable variable
 __always_unused
To: Lee Jones <lee.jones@linaro.org>
References: <20201104193549.4026187-1-lee.jones@linaro.org>
 <20201104193549.4026187-35-lee.jones@linaro.org>
 <445a6440-b4c8-4536-891b-0cefc78e5f57@csgroup.eu>
 <e027b620-56f8-7d8b-84ff-54839f94a4c7@kernel.org>
 <20201105083626.GW4488@dell>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <a6b63789-1315-cec1-9575-0d858a6da1d5@kernel.org>
Date: Thu, 5 Nov 2020 09:55:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201105083626.GW4488@dell>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05. 11. 20, 9:36, Lee Jones wrote:
> On Thu, 05 Nov 2020, Jiri Slaby wrote:
> 
>> On 05. 11. 20, 8:04, Christophe Leroy wrote:
>>>
>>>
>>> Le 04/11/2020 à 20:35, Lee Jones a écrit :
>>>> Fixes the following W=1 kernel build warning(s):
>>>>
>>>>    drivers/tty/serial/pmac_zilog.h:365:58: warning: variable
>>>> ‘garbage’ set but not used [-Wunused-but-set-variable]
>>>
>>> Explain how you are fixing this warning.
>>>
>>> Setting  __always_unused is usually not the good solution for fixing
>>> this warning, but here I guess this is likely the good solution. But it
>>> should be explained why.
> 
> There are normally 3 ways to fix this warning;
> 
>   - Start using/checking the variable/result
>   - Remove the variable
>   - Mark it as __{always,maybe}_unused
> 
> The later just tells the compiler that not checking the resultant
> value is intentional.  There are some functions (as Jiri mentions
> below) which are marked as '__must_check' which *require* a dummy
> (garbage) variable to be used.
> 
>> Or, why is the "garbage =" needed in the first place? read_zsdata is not
>> defined with __warn_unused_result__.
> 
> I used '__always_used' here for fear of breaking something.
> 
> However, if it's safe to remove it, then all the better.

Yes please -- this "garbage" is one of the examples of volatile misuses. 
If readb didn't work on volatile pointer, marking the return variable as 
volatile wouldn't save it.

>> And even if it was, would (void)!read_zsdata(port) fix it?
> 
> That's hideous. :D

Sure, marking reads as must_check would be insane.

> *Much* better to just use '__always_used' in that use-case.

Then using a dummy variable to fool must_check must mean must_check is 
used incorrectly, no :)? But there are always exceptions…

thanks,
-- 
js
suse labs
