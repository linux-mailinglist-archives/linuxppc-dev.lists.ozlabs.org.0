Return-Path: <linuxppc-dev+bounces-13064-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB51BF1E75
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Oct 2025 16:45:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cqysP38pCz304h;
	Tue, 21 Oct 2025 01:45:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.98
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760971545;
	cv=none; b=hMa/qUKRHmQCfC+bryhWlF5+j2hOaPZhjnEtHjzJDGLVuNQLUCIPaxSSA2G18/OK2riavWbYsklJcFqpLbKFZW9On6gnACFPsOdQ8OHnXwJfhwrD0c8khYn60ZEGydmIqtrBesAhlebMf98x4baGWjv3t+BYalVp8j8G54DkBzjBW7soFnF/oJ2HsNiZw0jADSIhuOOger2N9TrLuREYq7wGvMArDRwWRRJnJdL6jPcXCRzAHd+wQbY89tfHnKL/oZluG4At1xWv45pWRfSA/lmBucVlZ3TuZSIhoHNkwz0S4vNqftJuoLez7RE8cHUtIWqnr7petE93JzzfIOKUfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760971545; c=relaxed/relaxed;
	bh=hCe3ut/WXfuVO1xIbv9Xf6/wnz4HbVZxWnU0T5Zbwk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cJ/wamGAuxfWfuGWk+wv46TReQm2bzDwc/BV+nzbb023zUFPQmHKzxF9tstpOtw+IB+lFqSKLEq3MkALsbO/K7dHui2Fw6LS93lPrk5pMgrfjH7jum4cYXgpabqRwwRXrKuPuo7gCXaEJc4+YmAVMRi/PlUH0fL3uW3ZHF2M8PtcGou8jx96dgAlCYzgdCyqiewPjDuqrPiZs9YpaWIMQkRMz9O7wjZeyGJLwtVEAl9a8z5LQgB78jekSC3sTrb1BCHkEwsGvcH6FlwTRKdcyVDV36szGM3zlVI1ZwMmvlYtejkUIwc4wnp4KCvE8+c94M4rqTFVmCuJvEKlOGVbCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=qTyQtMfJ; dkim-atps=neutral; spf=pass (client-ip=115.124.30.98; helo=out30-98.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=qTyQtMfJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.98; helo=out30-98.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cqysM4cgwz2yrm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 01:45:41 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1760971538; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=hCe3ut/WXfuVO1xIbv9Xf6/wnz4HbVZxWnU0T5Zbwk4=;
	b=qTyQtMfJg8DMVxxQG+UOg1sv9s15244XAebIlTEbNdY1LDRi+EP6J7DjEpECPqQ7gwm3NWK2IiFrmjOPDdEJv8z9ypTUOpIQrivJBHw5iMYBo2Nnbohcb1zHwffxuql/KQRDGQrj/yvuUdN8OR1Pev8fo/QlYc5+wbolgvbjneg=
Received: from 30.246.161.241(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WqdeIFD_1760971535 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 20 Oct 2025 22:45:36 +0800
Message-ID: <645adbb6-096f-4af3-9609-ddc5a6f5239a@linux.alibaba.com>
Date: Mon, 20 Oct 2025 22:45:31 +0800
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] PCI/ERR: Use pcie_aer_is_native() to check for
 native AER control
To: Lukas Wunner <lukas@wunner.de>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com, kbusch@kernel.org,
 sathyanarayanan.kuppuswamy@linux.intel.com, mahesh@linux.ibm.com,
 oohall@gmail.com, Jonathan.Cameron@huawei.com, terry.bowman@amd.com,
 tianruidong@linux.alibaba.com
References: <20251015024159.56414-1-xueshuai@linux.alibaba.com>
 <20251015024159.56414-5-xueshuai@linux.alibaba.com>
 <aPYMO2Eu5UyeEvNu@wunner.de>
 <0fe95dbe-a7ba-4882-bfff-0197828ee6ba@linux.alibaba.com>
 <aPZAAPEGBNk_ec36@wunner.de>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <aPZAAPEGBNk_ec36@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



在 2025/10/20 21:58, Lukas Wunner 写道:
> On Mon, Oct 20, 2025 at 09:09:41PM +0800, Shuai Xue wrote:
>> ??? 2025/10/20 18:17, Lukas Wunner ??????:
>>> On Wed, Oct 15, 2025 at 10:41:58AM +0800, Shuai Xue wrote:
>>>> Replace the manual checks for native AER control with the
>>>> pcie_aer_is_native() helper, which provides a more robust way
>>>> to determine if we have native control of AER.
>>>
>>> Why is it more robust?
>>
>> IMHO, the pcie_aer_is_native() helper is more robust because it includes
>> additional safety checks that the manual approach lacks:
> [...]
>> Specifically, it performs a sanity check for dev->aer_cap before
>> evaluating native AER control.
> 
> I'm under the impression that aer_cap must be set, otherwise the
> error wouldn't have been reported and we wouldn't be in this code path?
> 
> If we can end up in this code path without aer_cap set, your patch
> would regress devices which are not AER-capable because it would
> now skip clearing of errors in the Device Status register via
> pcie_clear_device_status().

Hi Lukas,

You raise an excellent point about the potential regression.

The origin code is:

	if (host->native_aer || pcie_ports_native) {
		pcie_clear_device_status(bridge);
		pci_aer_clear_nonfatal_status(bridge);
	}

This code clears both the PCIe Device Status register and AER status
registers when in native AER mode.

pcie_clear_device_status() is renamed from
pci_aer_clear_device_status(). Does it intends to clear only AER error
status?

- BIT 0: Correctable Error Detected
- BIT 1: Non-Fatal Error Detected
- BIT 2: Fatal Error Detected
- BIT 3: Unsupported Request Detected

 From PCIe spec, BIT 0-2 are logged for functions supporting Advanced
Error Handling.

I am not sure if we should clear BIT 3, and also BIT 6 (Emergency Power
Reduction Detected) and in case a AER error.

> 
> Thanks,
> 
> Lukas

Thanks.
Shuai

