Return-Path: <linuxppc-dev+bounces-5475-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B518FA1902E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2025 11:59:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YdLg83Tdnz2yRM;
	Wed, 22 Jan 2025 21:59:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.98
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737543556;
	cv=none; b=MmGrBa9l3v/SlqOQpCqQKG5Y/RORlS4NAuvJY/o2r3uzDZZbNSqt31trdL6C0YLu9qSYBdYCCelqN+/yUEwdWvpZa13AdCYQJABAQeDyXWLif5ouDG3kj/km/UcIdqJf5nUDCUyBc52NXPnWG97hT3xHUbBSZaYTtpbJqVsrJeIv/Um6TJ1NJkldj6eKZZ/oVOAfE3AkXyN8w2yU+z8ClyyWiT2guIehuRJloxOb49pIaWdSl88pIo+sLGYs2qFZLKtA/iMr+JB0c0CS5hdVB1XAYSqUIWPXS7L5HWUAH6+rAbyYenBYfw5KUUBkThU3HGS83D9JNg+WEGqANHFx+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737543556; c=relaxed/relaxed;
	bh=3cS1NupOfPb8WLvVbyrxEZgH8DoM9HSXnNPe+WOzLRg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=PlKOdj92GI0ZqOYIA60Dm/0Ih98nYc69g+4HAabjrmn4id7Bk+1JoV9Q2CfNcT18KjAjK67Xr1roanUoX7N5DNc4KHBYLzGJQB4AhUHqah0d0/AUjTsbDaTxk+TVbJAFQfdX8SQx68GjaBcFboH7PGR9irQKbOE670FtRAEvgnhbrQERdqNsvYCx0w74tzgQSP73CPzfXVCmbON5mmhy5GJ5yRKyrZfBObTWS5bVDd0rA734bamBfGh7MHNPz9RLOUm3pdCLQXKa6PGcpVi96QIs5OVN9f0XU6Fom9aTuSaHve26VOAlhALz4sjU/dH8vPrBIsjlEZ2pbBH7BvpnrQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=ak9TdZNr; dkim-atps=neutral; spf=pass (client-ip=115.124.30.98; helo=out30-98.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=ak9TdZNr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.98; helo=out30-98.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YdLg62wj3z2xdr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2025 21:59:12 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1737543547; h=Message-ID:Date:MIME-Version:Subject:From:To:Content-Type;
	bh=3cS1NupOfPb8WLvVbyrxEZgH8DoM9HSXnNPe+WOzLRg=;
	b=ak9TdZNrxybZtHqlgbBhcR+yUoo00KL6inKEhZ6HJy8U7s1tCuRmHzb+tsV8WiEW9/5PSb0x7c0VRiWMC13QNyivmnhHOMdlOQyvT08QjDxbX5n6vD/lG2mnXqbnjZIfaQR7dZpo3FQnUci9eUMEGoE/mSh0/tfo4I13AhFOj4Q=
Received: from 30.246.161.230(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WO8Ek8._1737543545 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 22 Jan 2025 18:59:06 +0800
Message-ID: <01ac07c9-0cd6-4b63-a244-8a6dfa853ebc@linux.alibaba.com>
Date: Wed, 22 Jan 2025 18:59:04 +0800
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
Subject: Re: [PATCH v2 0/2] PCI/AER: Report fatal errors of RCiEP and EP if
 link recoverd
From: Shuai Xue <xueshuai@linux.alibaba.com>
To: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com, kbusch@kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com,
 sathyanarayanan.kuppuswamy@linux.intel.com
References: <20241112135419.59491-1-xueshuai@linux.alibaba.com>
 <07a8c3b9-c14d-4754-900c-e08ea1051393@linux.alibaba.com>
In-Reply-To: <07a8c3b9-c14d-4754-900c-e08ea1051393@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi, all,

Gentle ping.
  
Best Regards,
Shuai

在 2024/12/24 19:03, Shuai Xue 写道:
> 
> 
> 在 2024/11/12 21:54, Shuai Xue 写道:
>> changes since v1:
>> - rewrite commit log per Bjorn
>> - refactor aer_get_device_error_info to reduce duplication per Keith
>> - fix to avoid reporting fatal errors twice for root and downstream ports per Keith
>>
>> The AER driver has historically avoided reading the configuration space of an
>> endpoint or RCiEP that reported a fatal error, considering the link to that
>> device unreliable. Consequently, when a fatal error occurs, the AER and DPC
>> drivers do not report specific error types, resulting in logs like:
>>
>>    pcieport 0000:30:03.0: EDR: EDR event received
>>    pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
>>    pcieport 0000:30:03.0: DPC: ERR_FATAL detected
>>    pcieport 0000:30:03.0: AER: broadcast error_detected message
>>    nvme nvme0: frozen state error detected, reset controller
>>    nvme 0000:34:00.0: ready 0ms after DPC
>>    pcieport 0000:30:03.0: AER: broadcast slot_reset message
>>
>> AER status registers are sticky and Write-1-to-clear. If the link recovered
>> after hot reset, we can still safely access AER status of the error device.
>> In such case, report fatal errors which helps to figure out the error root
>> case.
>>
>> - Patch 1/2 identifies the error device by SOURCE ID register
>> - Patch 2/3 reports the AER status if link recoverd.
>>
>> After this patch set, the logs like:
>>
>>    pcieport 0000:30:03.0: EDR: EDR event received
>>    pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
>>    pcieport 0000:30:03.0: DPC: ERR_FATAL detected
>>    pcieport 0000:30:03.0: AER: broadcast error_detected message
>>    nvme nvme0: frozen state error detected, reset controller
>>    pcieport 0000:30:03.0: waiting 100 ms for downstream link, after activation
>>    nvme 0000:34:00.0: ready 0ms after DPC
>>    nvme 0000:34:00.0: PCIe Bus Error: severity=Uncorrectable (Fatal), type=Data Link Layer, (Receiver ID)
>>    nvme 0000:34:00.0:   device [144d:a804] error status/mask=00000010/00504000
>>    nvme 0000:34:00.0:    [ 4] DLP                    (First)
>>    pcieport 0000:30:03.0: AER: broadcast slot_reset message
>>
>> Shuai Xue (2):
>>    PCI/DPC: Run recovery on device that detected the error
>>    PCI/AER: Report fatal errors of RCiEP and EP if link recoverd
>>
>>   drivers/pci/pci.h      |  5 +++--
>>   drivers/pci/pcie/aer.c | 11 +++++++----
>>   drivers/pci/pcie/dpc.c | 32 +++++++++++++++++++++++++-------
>>   drivers/pci/pcie/edr.c | 35 ++++++++++++++++++-----------------
>>   drivers/pci/pcie/err.c |  9 +++++++++
>>   5 files changed, 62 insertions(+), 30 deletions(-)
>>
> 
> Hi, all,
> 
> Gentle ping.
> 
> Best Regards,
> Shuai


