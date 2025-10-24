Return-Path: <linuxppc-dev+bounces-13252-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34044C04684
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 07:37:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctBWH4Vkpz30RJ;
	Fri, 24 Oct 2025 16:37:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761284267;
	cv=none; b=g6k8HGMv+55q9OMntbfDC92+TQt/JHSlPRnJNHLc3gnqLjZFlUuSmzHtg35q7vCgR5EvLqHXJp263YBvxQP450A2IE/i424v6g+kzmrjjEZ8kVlin8w3eJP49+mFN0gML8II8TsjucS4xz4j4tPjdn025Jfv3DZwuIUKpIdTrrqAv4cq1OUtbgGdktUppJm+DtBVQE8Az0/FiLAZoWfBhgQZAerDmOuyM99U35K9k52fQLsqMerunV2sUxS0PLfxqaiiTSPXd+kdAL3iE7lMxaLEX4mXF40rjNz46chyChguTTK9/4W3OKLoi8NqZVon14ldiz8YbH/rRpmPclq24g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761284267; c=relaxed/relaxed;
	bh=Sp+hJRz+WWV/IDIJ1UXPhHVGxPXYYI9AFpPwtJzLdQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HMLq3qLin1Ks1yIVSVepfRetMO4x7Sfe8Z3Kh2oOh/pb2CY7FL8ixLs+Ii/4TMnF9bzPRqp94+GAmn/IrCagiwooNI4J/ewLkPxzG1Tegr/2cYMvtrwEC70EzT7bas/xmZ4i1xGTyqV8m7uPu1KI+ouKOmmyEKgvMnsAsogXbn1cusSmf4zE+VwTE1VFhvaeuV9vl7AbmYB6bz+OgSVoPlQOLl4GXRKkkdyx/zTOMdC3StZvLzA1wKIboHcSsk/LSVethenxdaWVdOPGRJIH0k6QCr2xMduL/KYxUXZglKL4wKlWPG100b1jjvaUAB3q7Wk4yqN66jUGgysOIE7B1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=EGuaOB0i; dkim-atps=neutral; spf=pass (client-ip=115.124.30.124; helo=out30-124.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=EGuaOB0i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.124; helo=out30-124.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctBWF2Gh6z2yl2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 16:37:43 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1761284259; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Sp+hJRz+WWV/IDIJ1UXPhHVGxPXYYI9AFpPwtJzLdQA=;
	b=EGuaOB0iw2NTv8IOZ6vVxkCUSU438+blxF98ILkNaM+WvP8K2Xp+eht/2YmbWONbiisKAbIeNqi93AEGSC+3wxYEio1JhgdjbshWBnU0maKsbgUpL86RkwU3g3jpPKJb6NSKK+37l7iBz/sbBlY4n5ZnpTU3y/Gc9PIW6H3G9Gc=
Received: from 30.246.161.241(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0Wqt6g34_1761284257 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 24 Oct 2025 13:37:38 +0800
Message-ID: <2cc91a94-a444-4d15-b714-fe8502da1586@linux.alibaba.com>
Date: Fri, 24 Oct 2025 13:37:37 +0800
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kbusch@kernel.org, sathyanarayanan.kuppuswamy@linux.intel.com,
 mahesh@linux.ibm.com, oohall@gmail.com, Jonathan.Cameron@huawei.com,
 terry.bowman@amd.com, tianruidong@linux.alibaba.com
References: <20251015024159.56414-1-xueshuai@linux.alibaba.com>
 <20251015024159.56414-5-xueshuai@linux.alibaba.com>
 <aPYMO2Eu5UyeEvNu@wunner.de>
 <0fe95dbe-a7ba-4882-bfff-0197828ee6ba@linux.alibaba.com>
 <aPZAAPEGBNk_ec36@wunner.de>
 <645adbb6-096f-4af3-9609-ddc5a6f5239a@linux.alibaba.com>
 <aPoDbKebJD30NjKG@wunner.de>
 <1eaf1f94-e26b-4313-b6b7-51ad966fe28e@linux.alibaba.com>
 <aPrvEZ3X4_tiD2Fh@wunner.de>
 <91cf33b4-7f67-4f3a-b095-e8f04d8c18e9@linux.alibaba.com>
 <aPr6dBDUUohRUzYg@wunner.de>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <aPr6dBDUUohRUzYg@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



在 2025/10/24 12:03, Lukas Wunner 写道:
> On Fri, Oct 24, 2025 at 11:38:10AM +0800, Shuai Xue wrote:
>> The remaining question is whether it would make more sense to rename
>> pcie_clear_device_status() to pci_clear_device_error_status() and refine
>> its behavior by adding a mask specifically for bits 0 to 3. Here's an
>> example of the proposed change:
> 
> I don't see much value in renaming the function.
> 
> However clearing only bits 0-3 makes sense.  PCIe r5.0 defined bit 6
> as Emergency Power Reduction Detected with type RW1C in 2019.  The
> last time we touched pcie_clear_device_status() was in 2018 with
> ec752f5d54d7 and we've been clearing all bits since forever,
> not foreseeing that new ones with type RW1C might be added later.

Thank you for the detailed explanation and pointing out the history
behind bit 6 and the evolution since PCIe r5.0.

> 
> I suggest defining a new macro in include/uapi/linux/pci_regs.h
> instead of using 0xf, say PCI_EXP_DEVSTA_ERR.  Then you don't
> need the code comment because the code is self-explanatory.
> 

I’ll prepare a patch to implement this fix and submit it shortly.
Thanks again for the guidance!

Thanks.
Shuai





