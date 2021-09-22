Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF31414B80
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 16:12:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HF0cn1zJrz2yQ4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 00:12:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=eGKcXmt+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.123;
 helo=smtp-relay-internal-1.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=eGKcXmt+; 
 dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HF0c44lhXz2xY2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Sep 2021 00:12:20 +1000 (AEST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0693B3F4BC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 14:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632319937;
 bh=1MyjqmNhxVLX0Wufgh2lr5w4a4DBCWtXfhO1i67wwOg=;
 h=Subject:To:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=eGKcXmt+UmBN/fiWfI3D01Ya4GFC28k+tp3WzB/b+nV8eSryIdDkaq74yrmNxP/W6
 ZL0wz3v3LV0P8c16nWHEnGgQMZwNkBoyXj2lFoFjmUi4ks1RpLZPE5gvbejxBXWLaS
 c6gSBlCtWse66wiDvrgLvYwRrcq9P/hLfE8RmPRuPuw3p2e84nRZMlIPoweDEp+pyi
 0a5aTtyHG96S5vPfrBd0/RhcX5jXuEHsa7XF11wHy7pcKDO5meVilHrJAhrg2x6pfX
 GyhUJhj1IPmyA4nU57LB23xa6xQhJxFTMjqx3Y6IAVArV13tEZ0cyW2jq/HtLKBp1Y
 A3aJYtHBlYlBg==
Received: by mail-ed1-f70.google.com with SMTP id
 s12-20020a05640217cc00b003cde58450f1so3236121edy.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1MyjqmNhxVLX0Wufgh2lr5w4a4DBCWtXfhO1i67wwOg=;
 b=KEB5E5oAUqzo/YeJ82Y+SQ1QIGcbS0O2HaCO6Gg8ozXBCwk+HyZKKkW3uqIjzwfxIK
 9KeYpIODSc1oZbgC6mxm3a4PEnL+mpg3TatbSJoqEtjGm9FY8Dryv27JARlPbSLh7UhT
 5oUUyuxMBmBcAVlSTJhD92IYGpz7euufCCMaOMoVuanc7oL8CzYF8iu1kHNbQl5R3Jlc
 eSIuCaavGxs84UMzxhqfuSscZTyM6ftkfNxbthG8Pyvoy+igJ50SD1vajIxCtd2KCbdz
 fayguOHhCTcDEoKHb/+j22XGV6rVbxwilUpOUYirgrNHCyXi40PDIe93unT0LXjhCYZI
 tp2w==
X-Gm-Message-State: AOAM531uiJ/D4sqs3e5nAaU3JuMmHmrQxLINrvsqvwTw0myzyF/m11Nn
 6ERs3WomSL6n/LiNWAhczGQGMKeNDQqSPkxql14wAp1oPtiKWJkZqGLcdxAxhOhnmf5VPpfHSut
 3ZNAdCWsvQeBJqmVMBMBJph4JASNNjxNl8LE1wa4/i0c=
X-Received: by 2002:a17:906:9452:: with SMTP id
 z18mr41241574ejx.25.1632319935045; 
 Wed, 22 Sep 2021 07:12:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLJOGVcmp4cOqCkF2TmMYwWKyogj1WUZOHnXr8vCsNJVqDjhbsu8od+4HSV9f8jRwxTRDePA==
X-Received: by 2002:a17:906:9452:: with SMTP id
 z18mr41241545ejx.25.1632319934825; 
 Wed, 22 Sep 2021 07:12:14 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net.
 [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id bw25sm1150757ejb.20.2021.09.22.07.12.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 07:12:14 -0700 (PDT)
Subject: Re: [RESEND PATCH 2/2] powerpc/powermac: constify device_node in
 of_irq_parse_oldworld()
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20210922084415.18269-1-krzysztof.kozlowski@canonical.com>
 <20210922084415.18269-2-krzysztof.kozlowski@canonical.com>
 <a33f0978-b617-6a07-7240-ec011f894680@csgroup.eu>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <2ccf5861-257f-42cc-395f-4d1f053f6035@canonical.com>
Date: Wed, 22 Sep 2021 16:12:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a33f0978-b617-6a07-7240-ec011f894680@csgroup.eu>
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

On 22/09/2021 15:55, Christophe Leroy wrote:
> 
> 
> Le 22/09/2021 à 10:44, Krzysztof Kozlowski a écrit :
>> The of_irq_parse_oldworld() does not modify passed device_node so make
>> it a pointer to const for safety.
> 
> AFAIKS this patch is unrelated to previous one so you should send them 
> out separately instead of sending as a series.

The relation it's a series of bugfixes. Although they can be applied
independently, having a series is actually very useful - you run "b4 am"
on one message ID and get everything. The same with patchwork, if you
use that one.

> 
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>   arch/powerpc/platforms/powermac/pic.c | 2 +-
>>   include/linux/of_irq.h                | 4 ++--
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/powermac/pic.c b/arch/powerpc/platforms/powermac/pic.c
>> index 4921bccf0376..af5ca1f41bb1 100644
>> --- a/arch/powerpc/platforms/powermac/pic.c
>> +++ b/arch/powerpc/platforms/powermac/pic.c
>> @@ -384,7 +384,7 @@ static void __init pmac_pic_probe_oldstyle(void)
>>   #endif
>>   }
>>   
>> -int of_irq_parse_oldworld(struct device_node *device, int index,
>> +int of_irq_parse_oldworld(const struct device_node *device, int index,
>>   			struct of_phandle_args *out_irq)
>>   {
>>   	const u32 *ints = NULL;
>> diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
>> index aaf219bd0354..6074fdf51f0c 100644
>> --- a/include/linux/of_irq.h
>> +++ b/include/linux/of_irq.h
>> @@ -20,12 +20,12 @@ typedef int (*of_irq_init_cb_t)(struct device_node *, struct device_node *);
>>   #if defined(CONFIG_PPC32) && defined(CONFIG_PPC_PMAC)
>>   extern unsigned int of_irq_workarounds;
>>   extern struct device_node *of_irq_dflt_pic;
>> -extern int of_irq_parse_oldworld(struct device_node *device, int index,
>> +extern int of_irq_parse_oldworld(const struct device_node *device, int index,
>>   			       struct of_phandle_args *out_irq);
> 
> Please remove 'extern' which is useless for prototypes.

OK


Best regards,
Krzysztof
