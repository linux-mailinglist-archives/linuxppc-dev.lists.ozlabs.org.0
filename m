Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0384E4364F9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 17:02:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZrLW3glzz3c9t
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 02:02:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=Dj2oeub0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.123;
 helo=smtp-relay-internal-1.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=Dj2oeub0; 
 dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZrKt0fvqz2yHW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 02:01:52 +1100 (AEDT)
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 536A03F4BA
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 15:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634828506;
 bh=ZUIZEJuyKtv0ydIDTpE9Z2jbuj2YrNWtkrCDhtR1+Bo=;
 h=To:References:From:Subject:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=Dj2oeub0qrnlPBEoiba5dzCTx6xXY/L9VGX4qXtQoX6UFfHOX+HYIIVzaKRtl2VNB
 G513+dfHzK7qWw866DVxqImjFAml9Jmji9kXa9Y511/XgAR3E6Wt9dq2fT1teb6sYa
 8Pb2LT3sc90NRCWIlUHbkodx0Ag2qoRbg584OBzl1U1PIZ0NOGNmaKufmqvzRCXxGU
 p6bqvYhXCh6syNkzUUxZeBnAJGSOXdmYix77Y8bYijjfijsGNzsjpEdYfwFybELKCW
 OW7YtWsnHwMX5rALPtZJBIoy5Evn32YQzV58ZGee0+5NYclyzuA0zp/CMsIcp5zZNG
 Cw4kXQLG5Txpw==
Received: by mail-lj1-f198.google.com with SMTP id
 f6-20020a2e9e86000000b00211349f9ce3so129856ljk.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 08:01:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZUIZEJuyKtv0ydIDTpE9Z2jbuj2YrNWtkrCDhtR1+Bo=;
 b=2+aMjAjFejRhvp84SAjayAO8WZZjEIyEWUV5bolQwEl/EAs5errgOdp2FKrr4xWS5F
 Nvdl/UaYbaaZKT3mua9g9eJIlT9CP59VHxsSW+2BmOS9UpK8nYLVDp2e3WfvNVrpsY5q
 yw0vmlxHd3K+A8Mqyipfh4XlDlJDJIq7KMIFni/6rioDxnXWMJo+HGouE8OrSKcXhUJz
 mDwhk1x9FhNeeRL8vX10L1/1ACfqKusWELR1si+S+JSKlSNlOVHZUVFXP+wdnJYzKVzE
 Q5NlEPZgbgqTpj/t0qsH8eWTUnWpvP1WG3n1x5Sgdqi5wHA39WqRjXSxoUuAgqsmoACS
 9y1Q==
X-Gm-Message-State: AOAM533xrQe13JwgUr7r4aDPaXhWBJiTnewTwGcMDO3msiDWtJVKEPwO
 VVZuFjIOQOBqz/ZfKc0yuoUW3ybbVyBOi2BnLjXoipM6uGuPTtmZCUwsladYl+LZbjfzMN6NP0d
 p0XuZs2CNhwZL81VTf4gmSZTWOQvYLpuvkrTNNxZsXIw=
X-Received: by 2002:a2e:a552:: with SMTP id e18mr6501952ljn.78.1634828504173; 
 Thu, 21 Oct 2021 08:01:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypsn4LIHCjKo6yG+8tIz9jVFOAoJjFIkmV8XNjxayXwvBQoZuBQPGrSGfQWZCl7vxCZOJmUg==
X-Received: by 2002:a2e:a552:: with SMTP id e18mr6501834ljn.78.1634828503359; 
 Thu, 21 Oct 2021 08:01:43 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id k21sm613963ljn.126.2021.10.21.08.01.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 08:01:42 -0700 (PDT)
To: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
 linuxppc-dev@lists.ozlabs.org
References: <YUpIqytZqpohq4EM@mussarela>
 <1632500323.sp1p885nv8.naveen@linux.ibm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: coherency issue observed after hotplug on POWER8
Message-ID: <42491f5a-593b-535c-b28c-41fbdbb43f99@canonical.com>
Date: Thu, 21 Oct 2021 17:01:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1632500323.sp1p885nv8.naveen@linux.ibm.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24/09/2021 19:17, Naveen N. Rao wrote:
> Hi Cascardo,
> Thanks for reporting this.
> 
> 
> Thadeu Lima de Souza Cascardo wrote:
>> Hi, there.
>>
>> We have been investigating an issue we have observed on POWER8 POWERNV systems.
>> When running the kernel selftests reuseport_bpf_cpu after a CPU hotplug, we see
>> crashes, in different forms. [1]
> 
> Just to re-confirm: you are only seeing this on P8 powernv, and not in a 
> P8 guest/LPAR? I haven't been able to reproduce this on a firestone -- 
> can you share more details about your power8 machine?
> 
> Also, do you only see this with ubuntu kernels, or are you also able to 
> reproduce this with the upstream tree?

Let me just covert this part of your email:

Upstream trees (5.11, 5.13, 5.14). See also:
https://bugs.launchpad.net/ubuntu-power-systems/+bug/1927076/comments/28

I could not reproduce it on Power8 LPAR. Neither on Power9 QEMU guest.

Reproduced on few machines:
IBM, POWER8NVL, 8335-GTB
POWER8, 8001-22C and 8335-GTA

lspcpu for the last one:
https://bugs.launchpad.net/ubuntu-power-systems/+bug/1927076/comments/15


Best regards,
Krzysztof
