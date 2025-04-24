Return-Path: <linuxppc-dev+bounces-7957-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A135EA9AC5E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Apr 2025 13:49:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZjvQF23Pcz30W9;
	Thu, 24 Apr 2025 21:49:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745495349;
	cv=none; b=JUbv9nJvmyvIYL1rSUZJPihrKwm0LX4lbEyBbeHOczhIx5sa4I+LCIjsaH68EyO4EdA/oNKPW6l59X8fBnyMrEmKhZ2x9ABmnFPEJ4n6E4dkvqd8hXukE+eyVcZJSSvoX+qg/ERkCJXBDbMw0lthf3XecEZ75D7EjXymaB5KqMj0G6kznEO/mA38Gee2HZ612OXExumnseAPWlBJhqN5tXrOZy3Wuo9cAl84GKmr8ZBUbncPfy4qt/5vjslOFH82AMB3V2xg0VYBuLzN3T3ScN6zM90loV0xiG98bcqbSGbcH7i6YKOaAYJ12TpsTBdsLOSdZp/NyPWARxa4hG7t0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745495349; c=relaxed/relaxed;
	bh=qs4/QnFg9rNhrfOh3L9B6LkK0j0hm6vYUMcuTxooLVc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=PEZMVwcFKszYOyJluF1QdpZiMKxWb62jS56oJwuAKF+qosJwnFmGC9Tev5szNR+WKrLbwCR+o0K3oVKoHTMcpucega2mC+2R69WhJ37/dUQkINdrLfWKJIja2cROqFQatjKlWoBPS5+KRetK5/K5X8RhbWxIWmjyZzT8jWY6aNWlda8Jt3QGj7ztmlJfYGU5s/1GWEsYsuTOfGb8kiop6rF2331tt1It/nPFS37spZyL5wfDe8PSkIeBunPcrhVHWsFnILgH1oBAXX+GJ3U5nasu669oEfB4dNdjasXzkFLYboI+PwjdzZOaxMLCRCmC0RYoISqveYSzibu5Q89oKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=SFoNtqqe; dkim-atps=neutral; spf=pass (client-ip=115.124.30.101; helo=out30-101.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=SFoNtqqe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.101; helo=out30-101.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZjvQB42Ncz2yk3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Apr 2025 21:49:05 +1000 (AEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1745495341; h=Message-ID:Date:MIME-Version:Subject:From:To:Content-Type;
	bh=qs4/QnFg9rNhrfOh3L9B6LkK0j0hm6vYUMcuTxooLVc=;
	b=SFoNtqqeta0elpMwlWQKbHlgh6QDFtp3KeMn8Hm/yGnUSHAf+zGfqDb8KG2X4j7ZbviZ9fFPxmY1qwrO5S0PDcsptJc9YtQ6yFER03eHBH2jfwcJI0hfhbpYlQ0TIzQ0t6DyuHWTm1t0kwbvoVs/uUmOXFUvfZFYYFwseAMptfE=
Received: from 30.246.162.65(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WXzJaco_1745495338 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 24 Apr 2025 19:48:59 +0800
Message-ID: <7f6c49d5-e11e-488b-bb67-4051abcb02f4@linux.alibaba.com>
Date: Thu, 24 Apr 2025 19:48:57 +0800
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
Subject: Re: [PATCH v4 3/3] PCI/AER: Report fatal errors of RCiEP and EP if
 link recoverd
From: Shuai Xue <xueshuai@linux.alibaba.com>
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com, kbusch@kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com, Jonathan.Cameron@huawei.com,
 terry.bowman@amd.com, tianruidong@linux.alibaba.com
References: <20250217024218.1681-1-xueshuai@linux.alibaba.com>
 <20250217024218.1681-4-xueshuai@linux.alibaba.com>
 <8a833aaf-53aa-4e56-a560-2b84a6e9c28c@linux.intel.com>
 <1dea64ef-3c9f-4bff-820f-34d8f3a6a1d4@linux.alibaba.com>
 <362fcb01-8d9c-49e6-be83-5a784c1e5f3e@linux.alibaba.com>
In-Reply-To: <362fcb01-8d9c-49e6-be83-5a784c1e5f3e@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



在 2025/3/17 14:02, Shuai Xue 写道:
> 
> 
> 在 2025/3/3 12:33, Shuai Xue 写道:
>>
>>
>> 在 2025/3/3 11:43, Sathyanarayanan Kuppuswamy 写道:
>>>
>>> On 2/16/25 6:42 PM, Shuai Xue wrote:
>>>> The AER driver has historically avoided reading the configuration space of
>>>> an endpoint or RCiEP that reported a fatal error, considering the link to
>>>> that device unreliable. Consequently, when a fatal error occurs, the AER
>>>> and DPC drivers do not report specific error types, resulting in logs like:
>>>>
>>>>    pcieport 0000:30:03.0: EDR: EDR event received
>>>>    pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
>>>>    pcieport 0000:30:03.0: DPC: ERR_FATAL detected
>>>>    pcieport 0000:30:03.0: AER: broadcast error_detected message
>>>>    nvme nvme0: frozen state error detected, reset controller
>>>>    nvme 0000:34:00.0: ready 0ms after DPC
>>>>    pcieport 0000:30:03.0: AER: broadcast slot_reset message
>>>>
>>>> AER status registers are sticky and Write-1-to-clear. If the link recovered
>>>> after hot reset, we can still safely access AER status of the error device.
>>>> In such case, report fatal errors which helps to figure out the error root
>>>> case.
>>>>
>>>> After this patch, the logs like:
>>>>
>>>>    pcieport 0000:30:03.0: EDR: EDR event received
>>>>    pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
>>>>    pcieport 0000:30:03.0: DPC: ERR_FATAL detected
>>>>    pcieport 0000:30:03.0: AER: broadcast error_detected message
>>>>    nvme nvme0: frozen state error detected, reset controller
>>>>    pcieport 0000:30:03.0: waiting 100 ms for downstream link, after activation
>>>>    nvme 0000:34:00.0: ready 0ms after DPC
>>>>    nvme 0000:34:00.0: PCIe Bus Error: severity=Uncorrectable (Fatal), type=Data Link Layer, (Receiver ID)
>>>>    nvme 0000:34:00.0:   device [144d:a804] error status/mask=00000010/00504000
>>>>    nvme 0000:34:00.0:    [ 4] DLP                    (First)
>>>>    pcieport 0000:30:03.0: AER: broadcast slot_reset message
>>>
>>> IMO, above info about device error details is more of a debug info. Since the
>>> main use of this info use to understand more details about the recovered
>>> DPC error. So I think is better to print with debug tag. Lets see what others
>>> think.
>>>
>>> Code wise, looks fine to me.
>>
>> thanks, looking forward to more feedback.
>>>
>>>
> 
> Hi, all,
> 
> Gentle ping.
> 
> Thanks.
> Shuai
> 


Hi, all,
  
Gentle ping.
  
Thanks.
Shuai

