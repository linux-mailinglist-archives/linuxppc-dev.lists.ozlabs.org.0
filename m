Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A25360D889
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Oct 2022 02:41:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mxqk65Sskz3bym
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Oct 2022 11:41:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OGVQx/2j;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82c; helo=mail-qt1-x82c.google.com; envelope-from=opendmb@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OGVQx/2j;
	dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mxnb12Rmcz2xJ7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Oct 2022 10:04:59 +1100 (AEDT)
Received: by mail-qt1-x82c.google.com with SMTP id g11so8763741qts.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Oct 2022 16:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ClspvyXTECiETgdUQTzdfSfb1fdhiX3Hnq3vM9YFJKg=;
        b=OGVQx/2jN+RSO85l2tT+FBBLDTg3+Zwd7kPErhrGyLOvARiBsC6CG7mlS5qehrVYjz
         ihtrkFKVyhxJhSYcMvV5NWm9PskAi/kmNQQmlfOa/Atw95eHt5E/xoWUmo4sZqo3vl6j
         CFQyTygR+2sMm/0/KV7GFc4CoMhIlc5XmYa/1tJQAXFJdrhS0cF3+wNUENeelrFXVU52
         B+fJaSn+KrN1P/cNjmuab6WTcWn/9XgYj18k3hKTDHoKhxqIHLAQQtgY7Ei3jjIvIsAG
         fcVYL7OzlTbJRpGXtu8aguc9N1G0gMaX45lDxLj2aL/avr2nXoN6LoTK0/S4kgTRI4RP
         T+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ClspvyXTECiETgdUQTzdfSfb1fdhiX3Hnq3vM9YFJKg=;
        b=LAFFRaOd36gkUDiXUrEyNm2GDQuUIccfvZCBLQxPvFuVpLKMZpeN38K2AvexdsY6I9
         N/5lBcSndDQk1L2utPux2kJsN6YXMr2lgB9YGBy8m83gr9JzQLselh4eZRmBPf3oeXFM
         AZcjaUQ/uDVsTFMdWrDAfvdTuiF51wxH3zFXDdELQXdO804sivDwMqp+9Gys25jstFe4
         MuEAQhIxOC6cNzMhN9hsKaFjJwPGfe8Km6F8wbtzCaKupm3LE4IpAb/0twXMAn5onyw8
         9qs0RfQPcZp8mJJWR7EbKJdMpSy36v80SRLlUa53p2ZDJ/4TD4+dlMr/+ogUyj5LrCTT
         6sNw==
X-Gm-Message-State: ACrzQf0wMto1GY7QxT6THw1NMsHmii3DeKpGVfZ/9sfrxo57vghuwvLr
	bxFC3hDwsctxnGgZCf/hn3g=
X-Google-Smtp-Source: AMsMyM7rTVsA7B/1nr6n/+LBGSf6vGViUcnpSdM2UVcJd2IwE+vvSTBrnUYbSAFzBatpLBuidNMdkw==
X-Received: by 2002:ac8:7d0f:0:b0:398:3029:3328 with SMTP id g15-20020ac87d0f000000b0039830293328mr34625420qtb.99.1666739095917;
        Tue, 25 Oct 2022 16:04:55 -0700 (PDT)
Received: from [10.69.53.73] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id t18-20020a05620a451200b006cfc7f9eea0sm2913312qkp.122.2022.10.25.16.04.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 16:04:55 -0700 (PDT)
Message-ID: <8fbc9d02-3c73-5990-85af-82eecb6d64e3@gmail.com>
Date: Tue, 25 Oct 2022 16:04:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [linux-next:master] BUILD REGRESSION
 89bf6e28373beef9577fa71f996a5f73a569617c
To: Jakub Kicinski <kuba@kernel.org>, kernel test robot <lkp@intel.com>
References: <63581a3c.U6bx8B6mFoRe2pWN%lkp@intel.com>
 <20221025154150.729bbbd0@kernel.org>
Content-Language: en-US
From: Doug Berger <opendmb@gmail.com>
In-Reply-To: <20221025154150.729bbbd0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 26 Oct 2022 11:40:32 +1100
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, linux-scsi@vger.kernel.org, netdev@vger.kernel.org, linux-mm@kvack.org, linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/25/2022 3:41 PM, Jakub Kicinski wrote:
> On Wed, 26 Oct 2022 01:17:48 +0800 kernel test robot wrote:
>> drivers/net/ethernet/broadcom/genet/bcmgenet.c:1497:5-13: ERROR: invalid reference to the index variable of the iterator on line 1475
> 
> CC Doug
Thanks for highlighting this for me, but I happened to catch it from the 
linux-mm list and was just looking into it.

It looks to me like a false positive since I am initializing the 
loc_rule variable in all paths outside of the list_for_each_entry() loop 
prior to its use on line 1497.

If desired I can submit a new patch to make coccinelle happy.
-Doug
