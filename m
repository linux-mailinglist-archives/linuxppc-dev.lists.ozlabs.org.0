Return-Path: <linuxppc-dev+bounces-4466-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6F89FBCDA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2024 12:04:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YHX802w5Cz2xb3;
	Tue, 24 Dec 2024 22:04:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735038240;
	cv=none; b=HLxNrDW65qH8SpRi9rczIw0F2wv+dxRjuBmShOPkE9pcv6fYLUDQ3XtB15MDMmegyKqAWohwVocFAaZosGr33LgKpKzHHworjaEXn8IvD1+mr68QuSN66DtVU9A5Z8eBllcq+4BxMAyqps2D1oUvlNCC1nVfvxC3q3RW2aZCb2jH/rh0NjmSdR77Rso/TzI4UKUwq8NOdh3mFm/hWrIZI8Uj8K6Gs2hu7k9dTmvsGro666hCnUDj+nu7BEJ1fOzuFE0yQQFec/2Gde72fkUcYRsTYJlWHEpy5ojP4xYXbFxxoUjg9AJ2yw8Nq2odQkKpubXczC/Ans6CWXGsIO36bA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735038240; c=relaxed/relaxed;
	bh=mvF+dV1vOqypF3DXfAFYUzb9UKgwVp9yfkPjXxoAPvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xn8+uA8+XX26/MGu5IadnDdHmBysD5kqz7711IU8cAbkfYH+9+cH7OFJ36AADBs2KLOntGQXnGJMUG7fz/tj2oPUdvQViVX2isclaDQMXZv6TAU1o+TeQ8hJfe5Am+jAfe1x5yUv90r+y7sjN5NuQHDp+T/dqyRx3X8Cl61Ee+cVOx2kHjieOwqrtZBiv1z8BOJDypxa5rLlfL8nf8sb6aQk2h621Fo/0E0mUs5ykG/53KH+HTJuS1Q2UrwUFlbUh0mmknalhn9CIKEiqhCXZGNJZ0ZmLWtLC5ylj25BZGVTGFyUhrMgap/K/ApbXAPYKMP1nd9snJ21eg6VOuVNBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=QjNcArg8; dkim-atps=neutral; spf=pass (client-ip=115.124.30.131; helo=out30-131.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=QjNcArg8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.131; helo=out30-131.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YHX7w3jMBz2xWZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2024 22:03:54 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1735038228; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=mvF+dV1vOqypF3DXfAFYUzb9UKgwVp9yfkPjXxoAPvw=;
	b=QjNcArg8R3VnbFkWSHzKV+5HPHZIvovArD5bT0TRF1b/fI3t0ZKPMa2SJeEUdHwcn6inBLgHtdBBUb1JEUMK9gVpiBlKTGtGHixnW1joChcplM64XT5l1ulOCz/QMWuy4hijqlY38KRngIVcHgumWWiMWH4xeAD8QzXqlPdQ2H8=
Received: from 30.246.161.240(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WMBoiH8_1735038225 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 24 Dec 2024 19:03:46 +0800
Message-ID: <07a8c3b9-c14d-4754-900c-e08ea1051393@linux.alibaba.com>
Date: Tue, 24 Dec 2024 19:03:45 +0800
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
To: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com, kbusch@kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com,
 sathyanarayanan.kuppuswamy@linux.intel.com
References: <20241112135419.59491-1-xueshuai@linux.alibaba.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20241112135419.59491-1-xueshuai@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



在 2024/11/12 21:54, Shuai Xue 写道:
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
>    pcieport 0000:30:03.0: EDR: EDR event received
>    pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
>    pcieport 0000:30:03.0: DPC: ERR_FATAL detected
>    pcieport 0000:30:03.0: AER: broadcast error_detected message
>    nvme nvme0: frozen state error detected, reset controller
>    nvme 0000:34:00.0: ready 0ms after DPC
>    pcieport 0000:30:03.0: AER: broadcast slot_reset message
> 
> AER status registers are sticky and Write-1-to-clear. If the link recovered
> after hot reset, we can still safely access AER status of the error device.
> In such case, report fatal errors which helps to figure out the error root
> case.
> 
> - Patch 1/2 identifies the error device by SOURCE ID register
> - Patch 2/3 reports the AER status if link recoverd.
> 
> After this patch set, the logs like:
> 
>    pcieport 0000:30:03.0: EDR: EDR event received
>    pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
>    pcieport 0000:30:03.0: DPC: ERR_FATAL detected
>    pcieport 0000:30:03.0: AER: broadcast error_detected message
>    nvme nvme0: frozen state error detected, reset controller
>    pcieport 0000:30:03.0: waiting 100 ms for downstream link, after activation
>    nvme 0000:34:00.0: ready 0ms after DPC
>    nvme 0000:34:00.0: PCIe Bus Error: severity=Uncorrectable (Fatal), type=Data Link Layer, (Receiver ID)
>    nvme 0000:34:00.0:   device [144d:a804] error status/mask=00000010/00504000
>    nvme 0000:34:00.0:    [ 4] DLP                    (First)
>    pcieport 0000:30:03.0: AER: broadcast slot_reset message
> 
> Shuai Xue (2):
>    PCI/DPC: Run recovery on device that detected the error
>    PCI/AER: Report fatal errors of RCiEP and EP if link recoverd
> 
>   drivers/pci/pci.h      |  5 +++--
>   drivers/pci/pcie/aer.c | 11 +++++++----
>   drivers/pci/pcie/dpc.c | 32 +++++++++++++++++++++++++-------
>   drivers/pci/pcie/edr.c | 35 ++++++++++++++++++-----------------
>   drivers/pci/pcie/err.c |  9 +++++++++
>   5 files changed, 62 insertions(+), 30 deletions(-)
> 

Hi, all,

Gentle ping.

Best Regards,
Shuai

