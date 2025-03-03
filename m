Return-Path: <linuxppc-dev+bounces-6605-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC71A4B5F1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 03:03:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5htw5fFcz30Qk;
	Mon,  3 Mar 2025 13:03:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740967432;
	cv=none; b=k97BrK1kldsz6n+uxKss5SmC4mFs7YbJ8+t3Ir4TuDVv7WrgfYSCXs9I7VeyD/9SI97Vf6lJKz8XNX4DVs92cgPbXQMQmhC53M3BFlPKR80/GY2wWuIExXDyH0X/ypNM8ilioDp7KMLyX5ujnelFjWswc9GinzokoyedQ5tR63H5kdE9jTmg/g9yKA3Zw5w3/gdbAtngQSxNQiwvJwp5agPsrgaj5zPNgCAoguQY3XyDMMaIB3ppIDiA+dnHPDleFiDQgOVpX9VRYIcTxrVMtSEIGL6hqczZgeIwv53xapYBPSodTorELiqxvf2B7czYxWEstDzhgWW0bSsXMBemaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740967432; c=relaxed/relaxed;
	bh=ovJU3Q9h8hU/G3fkOoZ1jgiNl8W2k7s8Lwa5u8Ka3Hk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GAkJ3xCpmWKvvyRU3JJffJV/l2xMHm3LMFH5YEL6HfQtwIwfSxRfCanULlZ8lCm+YwQBETvRRLLBSDQQ7rx3ee3KjnXCz27FKUi6XFs/+Nu/Rn+K6KjALiTAZfwKR1ZxDM6od578jLs45F/8bNSV7COKiVaRpO5B1jJsR1Jhxk0mtwOg7oC90CdKlfGJQ4sj1UXUMoN3txJk4tIW9fyELQWreumy+8OKrLUZq6XeX0K+bM+FLQJu07Kq8CKTYlLYllu8dZL9oZiQnzCI6kyfD3rFW103mf+4toBW17QKXMlvsWXtZhPgDfQnjw27AuXlnfz1OURCNs9WfZW2U2w5yQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=k+Sk2+6n; dkim-atps=neutral; spf=pass (client-ip=115.124.30.130; helo=out30-130.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=k+Sk2+6n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.130; helo=out30-130.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z5htt2vD3z30CF
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Mar 2025 13:03:49 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1740967425; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=ovJU3Q9h8hU/G3fkOoZ1jgiNl8W2k7s8Lwa5u8Ka3Hk=;
	b=k+Sk2+6noQgM5yirscYZfq4vG/G8hZCO3SPVJm3K2kDP7xNEqgQGvhHHLRVSF9tNHzHu3Tsn0tRd3LMVnCWRr3SmgGG7e8arB5JVIaFL/Qx8iThi1z1dvnu+8NxW2ihben8tzw8/TmAj8mG72AMLh7/SoJPOAyT9tvB5WJiEKg0=
Received: from 30.246.161.128(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WQWfcKP_1740967421 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 03 Mar 2025 10:03:42 +0800
Message-ID: <8c7b0cbf-fc93-4d97-b388-bfd0f13e404b@linux.alibaba.com>
Date: Mon, 3 Mar 2025 10:03:41 +0800
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
Subject: Re: [PATCH v4 0/3] PCI/AER: Report fatal errors of RCiEP and EP if
 link recoverd
To: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com, kbusch@kernel.org,
 sathyanarayanan.kuppuswamy@linux.intel.com
Cc: mahesh@linux.ibm.com, oohall@gmail.com, Jonathan.Cameron@huawei.com,
 terry.bowman@amd.com, tianruidong@linux.alibaba.com
References: <20250217024218.1681-1-xueshuai@linux.alibaba.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20250217024218.1681-1-xueshuai@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



在 2025/2/17 10:42, Shuai Xue 写道:
> changes since v3:
> - squash patch 1 and 2 into one patch per Sathyanarayanan
> - add comments note for dpc_process_error per Sathyanarayanan
> - pick up Reviewed-by tag from Sathyanarayanan
> 
> changes since v2:
> - moving the "err_port" rename to a separate patch per Sathyanarayanan
> - rewrite comments of dpc_process_error per Sathyanarayanan
> - remove NULL initialization for err_dev per Sathyanarayanan
> 
> changes since v1:
> - rewrite commit log per Bjorn
> - refactor aer_get_device_error_info to reduce duplication per Keith
> - fix to avoid reporting fatal errors twice for root and downstream ports per Keith
> 
> The AER driver has historically avoided reading the configuration space of an
> endpoint or RCiEP that reported a fatal error, considering the link to that
> device unreliable. Consequently, when a fatal error occurs, the AER and DPC
> drivers do not report specific error types, resulting in logs like:
> 
>     pcieport 0000:30:03.0: EDR: EDR event received
>     pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
>     pcieport 0000:30:03.0: DPC: ERR_FATAL detected
>     pcieport 0000:30:03.0: AER: broadcast error_detected message
>     nvme nvme0: frozen state error detected, reset controller
>     nvme 0000:34:00.0: ready 0ms after DPC
>     pcieport 0000:30:03.0: AER: broadcast slot_reset message
> 
> AER status registers are sticky and Write-1-to-clear. If the link recovered
> after hot reset, we can still safely access AER status of the error device.
> In such case, report fatal errors which helps to figure out the error root
> case.
> 
> After this patch set, the logs like:
> 
>     pcieport 0000:30:03.0: EDR: EDR event received
>     pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
>     pcieport 0000:30:03.0: DPC: ERR_FATAL detected
>     pcieport 0000:30:03.0: AER: broadcast error_detected message
>     nvme nvme0: frozen state error detected, reset controller
>     pcieport 0000:30:03.0: waiting 100 ms for downstream link, after activation
>     nvme 0000:34:00.0: ready 0ms after DPC
>     nvme 0000:34:00.0: PCIe Bus Error: severity=Uncorrectable (Fatal), type=Data Link Layer, (Receiver ID)
>     nvme 0000:34:00.0:   device [144d:a804] error status/mask=00000010/00504000
>     nvme 0000:34:00.0:    [ 4] DLP                    (First)
>     pcieport 0000:30:03.0: AER: broadcast slot_reset message
> 
> Shuai Xue (3):
>    PCI/DPC: Clarify naming for error port in DPC Handling
>    PCI/DPC: Run recovery on device that detected the error
>    PCI/AER: Report fatal errors of RCiEP and EP if link recoverd
> 
>   drivers/pci/pci.h      |  5 +++--
>   drivers/pci/pcie/aer.c | 11 +++++++----
>   drivers/pci/pcie/dpc.c | 34 +++++++++++++++++++++++++++-------
>   drivers/pci/pcie/edr.c | 35 ++++++++++++++++++-----------------
>   drivers/pci/pcie/err.c |  9 +++++++++
>   5 files changed, 64 insertions(+), 30 deletions(-)
> 


Hi, All,

Gentle ping.

Thanks.
Shuai

