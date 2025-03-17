Return-Path: <linuxppc-dev+bounces-7102-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BA3A6408B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 07:02:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGPWy0Kpsz2ySZ;
	Mon, 17 Mar 2025 17:02:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742191357;
	cv=none; b=joqZ9Hu+3WMNnA+/ekPN+2SDPluc8zFqyhHy/Hf+oPsOSSkajV1zNzWDrY9gFTUWrTrIkW9179Oyt09bFXePUoilEOzlvGV8VtNfj9R08/hMWDZYm46asVfkmxdyJmtGHYZajyS189EEIhREQ6+SBYRwNm7pbX3ag+zw5qYGzfFL6wW8LMEIbmWAG4KlJ8CzN/ntggl9cKxzppsBpYp/IDN6vMf6CbM6w3R8YXz7Ds1z7iZl/0PT8G9wmsgyRJ9RfYBT6TQ1wxQNOqrOSSU71bUnYVyPgKblOA1Uwnbs9buknrcvYFp1K4pfl/IgAP3lv7RAtb5ymmaDAay8r6fO+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742191357; c=relaxed/relaxed;
	bh=b5GxWT6HNGG5WO59UC9kgPZf/Ys/EEvS9UccUUiRohs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Af8A8Q7y8IBE38W8a4UmEvaUIllRhHpJ2sVQA335Uc/ssQ04ADvnR/tnI/dISTQRnvWv41DV568zVuJlgwaProrY2sSECKo8C2q6ubKgt62QeSA43wPcKaASrHIZ+iWL3WV9LhftwV0ryySzw/4qvcmhTzLOjYi4j54wTF5pJDwa2IzY/iwhcnGpLlFJW2eNgOxDqZ13V98ESpVssoJVUdSqzUs9SXzzWszoW06wPtx6ylsbouVjISa9TaZksS8zXw/yKWzNVqj7c569iI1LNYlteFeG9rVkRMHUWVyRmnYFuPe8i61h7Ndo30uWugfCEJqQ0JUNNfMoLnJsU7hRtw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=uuroSi7t; dkim-atps=neutral; spf=pass (client-ip=115.124.30.101; helo=out30-101.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=uuroSi7t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.101; helo=out30-101.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGPWw0yB5z2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Mar 2025 17:02:34 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1742191350; h=Message-ID:Date:MIME-Version:Subject:From:To:Content-Type;
	bh=b5GxWT6HNGG5WO59UC9kgPZf/Ys/EEvS9UccUUiRohs=;
	b=uuroSi7tzP0aO0rRsDS3FcPRpYumSWPJvUfPuetq8NCzuoTDakoeAKwmy6SUGSRMOJn7ppfV4ZTwdGzmo/iERh2eTxDU2MJ2aHsSbfN43thr21cTaI840OGY2b3cNr3fLPmVOkLnQEgnvnkMK+Hv3nkmdu9HfuSzwEsfvD4hzwc=
Received: from 30.246.160.93(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WRZvNEt_1742191346 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 17 Mar 2025 14:02:27 +0800
Message-ID: <362fcb01-8d9c-49e6-be83-5a784c1e5f3e@linux.alibaba.com>
Date: Mon, 17 Mar 2025 14:02:26 +0800
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
In-Reply-To: <1dea64ef-3c9f-4bff-820f-34d8f3a6a1d4@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



在 2025/3/3 12:33, Shuai Xue 写道:
> 
> 
> 在 2025/3/3 11:43, Sathyanarayanan Kuppuswamy 写道:
>>
>> On 2/16/25 6:42 PM, Shuai Xue wrote:
>>> The AER driver has historically avoided reading the configuration space of
>>> an endpoint or RCiEP that reported a fatal error, considering the link to
>>> that device unreliable. Consequently, when a fatal error occurs, the AER
>>> and DPC drivers do not report specific error types, resulting in logs like:
>>>
>>>    pcieport 0000:30:03.0: EDR: EDR event received
>>>    pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
>>>    pcieport 0000:30:03.0: DPC: ERR_FATAL detected
>>>    pcieport 0000:30:03.0: AER: broadcast error_detected message
>>>    nvme nvme0: frozen state error detected, reset controller
>>>    nvme 0000:34:00.0: ready 0ms after DPC
>>>    pcieport 0000:30:03.0: AER: broadcast slot_reset message
>>>
>>> AER status registers are sticky and Write-1-to-clear. If the link recovered
>>> after hot reset, we can still safely access AER status of the error device.
>>> In such case, report fatal errors which helps to figure out the error root
>>> case.
>>>
>>> After this patch, the logs like:
>>>
>>>    pcieport 0000:30:03.0: EDR: EDR event received
>>>    pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
>>>    pcieport 0000:30:03.0: DPC: ERR_FATAL detected
>>>    pcieport 0000:30:03.0: AER: broadcast error_detected message
>>>    nvme nvme0: frozen state error detected, reset controller
>>>    pcieport 0000:30:03.0: waiting 100 ms for downstream link, after activation
>>>    nvme 0000:34:00.0: ready 0ms after DPC
>>>    nvme 0000:34:00.0: PCIe Bus Error: severity=Uncorrectable (Fatal), type=Data Link Layer, (Receiver ID)
>>>    nvme 0000:34:00.0:   device [144d:a804] error status/mask=00000010/00504000
>>>    nvme 0000:34:00.0:    [ 4] DLP                    (First)
>>>    pcieport 0000:30:03.0: AER: broadcast slot_reset message
>>
>> IMO, above info about device error details is more of a debug info. Since the
>> main use of this info use to understand more details about the recovered
>> DPC error. So I think is better to print with debug tag. Lets see what others
>> think.
>>
>> Code wise, looks fine to me.
> 
> thanks, looking forward to more feedback.
>>
>>

Hi, all,

Gentle ping.

Thanks.
Shuai


