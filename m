Return-Path: <linuxppc-dev+bounces-6001-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC063A2DD2E
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Feb 2025 12:53:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YrR183MQGz2yDt;
	Sun,  9 Feb 2025 22:53:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739101996;
	cv=none; b=UC4hD5SKSczAABMIZrJw5VW/n2w8q+PNAw/lLF1DBkkom+ww+cgAH7bpQNiYeoJQYAvwxKLzdZiuCFwzldHjgs3Ls0mUAI3+nZABdnCqpqX1XOCufaqOCXn9P4Hc9Evno9DeX9ApWBp+9WZpN1dWcbHRSW1bymMjd7kz+xyGtP32D4AylXTwQnQrEMz8Z8b8S2jChT/9bcOOdcdYWb9WMhesvu2e8kEah1VYxVSHl3zkGUVj6G+bEu323zcBN6hMb0reSCroKfr6FC1k9ONpGqF2br5oz3Z9Jm8/adwR+HcYzuhbxFubMm/uLMfXuPGKL5J6veEQhhNEzobA9dHRDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739101996; c=relaxed/relaxed;
	bh=jLSLghMasTDx86lV/S59OCcHiw086kUYUqJjjTP6bVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VnfTWKo4c8YKukSCgvEMJS7dHxPF1Z9pEm3sOzse8SGbXMq1ugL2HRW51o2fco2WG84pEdGemXwh6U6nwUVMAOIbbcGFX70iZohPYN28+mldbSBwm8JoyZgu2Z1srChQ1yEXwvbOz0awilKc+2qOk3n8Q3Qyfzxbm1E1KMj7T9QV49h2j9vL6xXIbZCk30rTerNW9/ma0+SZ5RrS9PyWk/awBc3PVuhDVwS8h+wldkErxcZcEhlsIh+egx4PLr32ku3vd7yK8oJZMKK6tWnRvrli1vO8VN4PlwmiQPCVjCjQYpFF7Iu8ZEXhTUVzVbHyEW7+++KcGvc+vaIfIXPN4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VfaCYuSc; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=hkallweit1@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VfaCYuSc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=hkallweit1@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YrR163QZDz2xrb
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Feb 2025 22:53:13 +1100 (AEDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so639901166b.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Feb 2025 03:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739101988; x=1739706788; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jLSLghMasTDx86lV/S59OCcHiw086kUYUqJjjTP6bVg=;
        b=VfaCYuScgQeoQCKmHVH4o7ATlcwXj/T84T3+eh3sNtiMdjVBmKKL4FxkMjfua/9s2+
         R9BHIgVaJd7poM2V3XZ4oUdXVI93vYSC2IGrGmVOc29Jxe9mUrYzX0DzHpO9ZLTkE5m4
         C2XYBHf1VLbB4UxProNPpAtvBGYC4oLZ+FaFiZGdTZSkQWBbW23FWhcNOyABm/8XAy2V
         4ReZHL9tHGQs+1mAeBC70XhQJPEIGsCaQQ4UyiVYsO141/HbMNBjayOEkNbqPat7XwXr
         FeA53nj/2B+yp1G0sbajciyTMml6aOEakZ0To9dNU8MRyPavSzJOnm2jLP9BjqhxT1Vp
         6PyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739101988; x=1739706788;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLSLghMasTDx86lV/S59OCcHiw086kUYUqJjjTP6bVg=;
        b=uECqiG9m7MhlpkvEMcxx9gaXvA7ZmeyLFcV/EqiivMYCvBUlwCMTO1SGpZEhNyBMGz
         9ZXHojIyDuWYCjnwmSI3oMXe5GfSOcDftccV5isHJFOMFqd8NnN45x7J/skt3Q4KDfsO
         L2/zpcYz13cR5yiEWXM24FV8ASX00Nj9VI9e7cmw6R/+jrZ/KFox2/lhVoWAuvtIz49J
         iwZvdq8cocbvZ4yoN6vY2mEN7n59pvHqnHjUjkxhfRyrSSTKUwewIDHwwaIJ4fn1hg1a
         uJfTNu1VP6ZvePC8vZA1mWwz8v9uvwrDM3+xjwfN01LDKV3bNu0jjFO1jXaAGL6ITDZG
         XwCw==
X-Forwarded-Encrypted: i=1; AJvYcCV7DoimBZpvwmUJFoyi2rw+njL6cxb+T4ttDYNqMBHOmHTWuHP/jjBv/MVFYlT3T1CezQHXkWa2QnKxTwk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz4kyUI+ZqnV7qJaFXP8zT0kk0U4UYBor9s4SBQ+67qU4bLZEUf
	45Os4L7ffskN3UNlQ4x2lpYXwkRH15yGRW7hLc5ddhvUw2xzRrsy
X-Gm-Gg: ASbGncvdCMA+GnO11IP/PmSu306LgYV8WG1R/MCHfRaxQzOSuqsyyElJnOcUKtRhdCo
	O15oNcOba/fXGXRlssFy7gmfdSssg9eftmzu2oZ5Q/hV/OsEHUeigPMwSzM6L1t06zH3bn+hLps
	KeASPEHFxmBl9QVpCv11SLaY7bpF+ehyrjdPneCXeiiCjsUlF1xzQWqEw/70JbZfdKPpF/a4s10
	1gZO4r66De6o8T9OLjwMIllOS0qOIE7Aor8om1Dy2vg/mldQMmCXOmMAm5vNlDrck0HmPfSuHCP
	52HuWtYobRG2WIOsytwgB90AJvseVh7BPYjUyS+xSckn+UCoXOCkoXFx0OW42mm/XlPj0USJW3U
	5ew7ElPKZ83Tj31uZZep/efhh7ycCIt7JAUaqnTfQLS6wEuQCKZlZ9VfiWt0s86O0h+dnf78Uzr
	5HtKfhGRs=
X-Google-Smtp-Source: AGHT+IEAmRFatxs5HFZpaqxhC6KAsurPDfElH5RS0jBNWRJQo3BlU7WLnlPdq2L8wy4k2OiUDwlHUw==
X-Received: by 2002:a17:906:f5a4:b0:ab7:b08:dab2 with SMTP id a640c23a62f3a-ab789b39591mr1133994966b.22.1739101987651;
        Sun, 09 Feb 2025 03:53:07 -0800 (PST)
Received: from ?IPV6:2a02:3100:acf0:cb00:e533:c1d0:f45f:da1c? (dynamic-2a02-3100-acf0-cb00-e533-c1d0-f45f-da1c.310.pool.telefonica.de. [2a02:3100:acf0:cb00:e533:c1d0:f45f:da1c])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ab78d5771easm489169366b.83.2025.02.09.03.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 03:53:07 -0800 (PST)
Message-ID: <2257559d-6528-48c9-a2cf-b60a3a976037@gmail.com>
Date: Sun, 9 Feb 2025 12:53:33 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: phy: remove unused PHY_INIT_TIMEOUT
 definitions
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <11be8192-b722-4680-9d1c-3e4323afc27f@gmail.com>
 <0203253b-4bda-4e66-b7e6-e74300c44c80@csgroup.eu>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <0203253b-4bda-4e66-b7e6-e74300c44c80@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 09.02.2025 10:28, Christophe Leroy wrote:
> 
> 
> Le 08/02/2025 à 22:14, Heiner Kallweit a écrit :
>> Both identical definitions of PHY_INIT_TIMEOUT aren't used,
>> so remove them.
> 
> Would be good to say when it stopped being used, ie which commit or commits removed its use.
> 
> Also why only remove PHY_INIT_TIMEOUT ? For instance PHY_FORCE_TIMEOUT also seems to be unused. PHY_CHANGE_TIME as well.
> 
I stumbled just across PHY_INIT_TIMEOUT. You're right, I will include other apparently unused
definitions as well.

>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>   drivers/net/ethernet/freescale/ucc_geth.h | 1 -
>>   include/linux/phy.h                       | 1 -
>>   2 files changed, 2 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/freescale/ucc_geth.h b/drivers/net/ethernet/freescale/ucc_geth.h
>> index 38789faae..03b515240 100644
>> --- a/drivers/net/ethernet/freescale/ucc_geth.h
>> +++ b/drivers/net/ethernet/freescale/ucc_geth.h
>> @@ -890,7 +890,6 @@ struct ucc_geth_hardware_statistics {
>>                                  addresses */
>>     #define TX_TIMEOUT                              (1*HZ)
>> -#define PHY_INIT_TIMEOUT                        100000
>>   #define PHY_CHANGE_TIME                         2
>>     /* Fast Ethernet (10/100 Mbps) */
>> diff --git a/include/linux/phy.h b/include/linux/phy.h
>> index 3028f8abf..9cb86666c 100644
>> --- a/include/linux/phy.h
>> +++ b/include/linux/phy.h
>> @@ -293,7 +293,6 @@ static inline long rgmii_clock(int speed)
>>       }
>>   }
>>   -#define PHY_INIT_TIMEOUT    100000
>>   #define PHY_FORCE_TIMEOUT    10
>>     #define PHY_MAX_ADDR    32
> 
--
pw-bot: cr


