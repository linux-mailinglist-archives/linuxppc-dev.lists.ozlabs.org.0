Return-Path: <linuxppc-dev+bounces-3870-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 790729E94A6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2024 13:45:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6M5v3xnWz2yFD;
	Mon,  9 Dec 2024 23:45:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733748323;
	cv=none; b=fNdaD7e+A5Cc2dN+HhHy1hrjoEurvXeGvVPeJPBrQhm51djfqxEdgBgf9j8Tbuuei4B5CgGbiN0UMs5vKXNj2HJb1fDvGbF6TOdTqe8mi877/OJwqe8wWqWsk3I67Y2lK4/4zfaIk+WXMJNP1r1HOWKQ3Wy+rwOUi5xDEUAoRSaaMNeikd46Mb1CL/z4dSIczyDrUEE5yYbB/x9qXkTqDLG0k6SBp+d/+CuYKv6h5nbziJCEFWzhg5AlC/VO7qjc9vyPpXO7X19ydMYRc9+A8640obyu0F8lAtkP9pUnm8WNKFd9K5j71Ja4UeO3brBb+Hbk/Owk65y5k3i7LfWNWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733748323; c=relaxed/relaxed;
	bh=ZJ7nOY4JZQnL45adJO0lC+Z9TbwWMhwmJf7E4yaDNec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JhpklayYk1V9ZDxgWN3jQyWQ/pzNqB1aPh2j26sTufmlKINr8cpg4G0Erdw8555Q+68A1bX2naq4muobHTAee3iWO/zBzXA0cIfz/vUoE/Y/MpMUPkEZcXHlsBvzZmb2UPH9jLL93tXfaVwjOO5UhLuaS8Pjgm5FA3cZdM/mmiaDMBz1vZzttTOh2c8tmevGncXDqMHxXQ4yYcZkGmDsu6NjyaJ9vfYfBwhWAcj2qM4jx5mW4lEG8M/Ta/ASS/oe7ajxGPUjwP2hN6Yx2aVlSfAo97gNIcPPCSVZ96cKA6qib4//LLc7qXfyhIdFl/JvP++Qtjrwg+0DFk6zlXVySw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6M5t20dCz2xWt
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2024 23:45:21 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Y6M5p179vz9tBf;
	Mon,  9 Dec 2024 13:45:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ad8aC7rBW98b; Mon,  9 Dec 2024 13:45:18 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Y6M5p0DxHz9tBd;
	Mon,  9 Dec 2024 13:45:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E8A068B766;
	Mon,  9 Dec 2024 13:45:17 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id OUa8UHFVNS_8; Mon,  9 Dec 2024 13:45:17 +0100 (CET)
Received: from [10.25.209.139] (unknown [10.25.209.139])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A70C18B763;
	Mon,  9 Dec 2024 13:45:17 +0100 (CET)
Message-ID: <95a461ca-3ed6-4380-ad1a-da12e1109675@csgroup.eu>
Date: Mon, 9 Dec 2024 13:45:17 +0100
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
Subject: Re: [PATCH v2 00/21] Converge on using secs_to_jiffies()
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, cocci@inria.fr,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, linux-mm@kvack.org,
 linux-bluetooth@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 live-patching@vger.kernel.org, linux-sound@vger.kernel.org,
 etnaviv@lists.freedesktop.org, oss-drivers@corigine.com,
 linuxppc-dev@lists.ozlabs.org, Anna-Maria Behnsen <anna-maria@linutronix.de>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <b9fcb12a-b7a4-4c33-836e-67109ce07deb@intel.com>
 <dab77729-682f-4182-9fb2-cd522ac29b5f@linux.microsoft.com>
 <72c8eb66-eb67-4f8b-b0c0-13f1aa001698@intel.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <72c8eb66-eb67-4f8b-b0c0-13f1aa001698@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 09/12/2024 à 13:01, Przemek Kitszel a écrit :
> On 12/6/24 9:58 PM, Easwar Hariharan wrote:
>> On 11/29/2024 4:57 AM, Przemek Kitszel wrote:
>>>
>>> [removed most non-list recipients, it's just too much]
>>>
>>> On 11/15/24 10:26 PM, Easwar Hariharan wrote:
>> <snip>
> 
>>>
>>> Regarding code - you could also convert msecs_to_jiffies(const * HZ),
>>> there are 10 that are greppable.
>>>
>>
>> Those seem to be mistakes. const*HZ is a seconds-denominated timeout,
>> being passed to msecs_to_jiffies() which will treat it as a
>> millisecond-denominated timeout resulting in an excessively long
>> timeout. I suppose that's better than a too-short timeout, and
>> apparently it's been working fine all along since hardware responds
>> before the too-long timeout expires. Half of them are in
>> drivers/scsi/arcmsr/arcmsr_hba.c and the pattern has apparently been
>> there since 2010.
> 
> my point was that, the default value of HZ is 1000, and most of the code
> that is just `$value*HZ` was meant as "$value seconds, in ms unit".

I can't follow you here. The default value of HZ is 250 as far as I can see.

Regardless, HZ is the number of jiffies per second, nothing else.

> 
> Same for HZ/const, HZ/2 being 500ms.
> 
> HZ is awful in that it is not 1s but 1/s, but it was easy to abuse the
> value in simple context.

Why is that awful ?

HZ is a nice macro that gives you the number of ticks per second, so 
that you are able to easily calculate the number of ticks for a given 
duration, regardless of the configured number of ticks per second.

Christophe

