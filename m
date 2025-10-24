Return-Path: <linuxppc-dev+bounces-13246-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E838C04452
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 05:38:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ct7sS0q0lz30RJ;
	Fri, 24 Oct 2025 14:38:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.98
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761277099;
	cv=none; b=ZtbHLYs4rHCwA9eYKfMeS1FAAsY28sTcfBC4Ac5YGKzieKW865yvVtNGmQfOE2YN3C9xeMGnmw4hq9Hfl4r9D98ZroqDvBKgQl3Honwxc7B5/R/PUVo2h3r3embZdY3MQpQOTZDDN/LAixLpcAVPvB6T3KSHigNNKzQn0Y0iWR8wMs6wX5iSR990Jk28FrZ/U53wYC35Gsmimnjpi3nGxuezlOijOXm0brP9F+jWODbWU1/alvL3IWCXM8XL0IOWQm7KQ/nv1QpyN6B/suWFHzxIjtG5FyZNguIxDUsEHVIsnu5UWVt5sG3K/cT33m8n1pvEbEK48OwHoYgUdaoLtg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761277099; c=relaxed/relaxed;
	bh=PbKaT848m86AFJ7rPP/TZd4RMwVP1HqCrdS58KEB1IU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HAsJqSnCG2b8ozpLK2dSUSZf0DrReEQODuUWVxWfKNgC7qWT9EyGDW31Fj2yXNl4FxqMRaTYQhIYNslCaoVg48Y99I6d8MEXpBEbmCFDiSHXoRxBuqNrIEPxCNZpnEWbfrUi5pK237hgBmYDACYl09wVEm8uuOBGXPCAs8QMFfopJLFbvlQAfdD9brGwld53MjvV3Q1KvSxBZGtJWn36SQXEhe59h+Dg3D6X/LG7GUQBJoKdrtKjyKwVLOvBWA/n8WOz3P+B4uY3DmbV6gvkGEmZZgGj32TPZo4zkp1pywzb51QSwX3Ty6+0DSUOaxZLruAVvaeMXP4/uwUWVptzzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Dq5caVGD; dkim-atps=neutral; spf=pass (client-ip=115.124.30.98; helo=out30-98.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Dq5caVGD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.98; helo=out30-98.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ct7sQ27Dgz2yl2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 14:38:16 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1761277093; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=PbKaT848m86AFJ7rPP/TZd4RMwVP1HqCrdS58KEB1IU=;
	b=Dq5caVGDmIsHXFattIuW2zxtW2dNhH5t9p3s9R8dXyFKoCHdZxpyKqU+v8XMr6+FXnnruHMxuN0vKyS49pwY+5xQtvULiG8Lokm2tY04r42F4e6dQEyk0jmHLhOUFPrjZGV7wmfJnMrGwTnbNPkrvLAMzfaFnW0Vg/zdXMcL3qs=
Received: from 30.246.161.241(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0Wqsw-7-_1761277090 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 24 Oct 2025 11:38:11 +0800
Message-ID: <91cf33b4-7f67-4f3a-b095-e8f04d8c18e9@linux.alibaba.com>
Date: Fri, 24 Oct 2025 11:38:10 +0800
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
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <aPrvEZ3X4_tiD2Fh@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



在 2025/10/24 11:14, Lukas Wunner 写道:
> On Fri, Oct 24, 2025 at 11:09:25AM +0800, Shuai Xue wrote:
>> 2025/10/23 18:29, Lukas Wunner:
>>> On Mon, Oct 20, 2025 at 10:45:31PM +0800, Shuai Xue wrote:
>>>>  From PCIe spec, BIT 0-2 are logged for functions supporting Advanced
>>>> Error Handling.
>>>>
>>>> I am not sure if we should clear BIT 3, and also BIT 6 (Emergency Powerjj
>>>> Reduction Detected) and in case a AER error.
>>>
>>> AFAIUI, bits 0 to 3 are what the PCIe r7.0 sec 6.2.1 calls
>>> "baseline capability" error reporting.  They're supported
>>> even if AER is not supported.
>>>
>>> Bit 6 has nothing to do with this AFAICS.
>>
>> Per PCIe r7.0 section 7.5.3.5:
>>
>>    **For Functions supporting Advanced Error Handling**, errors are logged
>>    in this register regardless of the settings of the Uncorrectable Error
>>    Mask register. Default value of this bit is 0b.
>>
>>  From this, it's clear that bits 0 to 2 are not logged unless AER is supported.
> 
> No.  It just means that if AER is supported, the Uncorrectable Error Mask
> register has no bearing on whether the bits in the Device Status register
> are set.  It does not mean that the bits are only set if AER is supported.
> 

Thank you for pointing that out. I now understand that my interpretation
was incorrect.

As such, I will drop this patch that introduced the dev->aer_cap check.

The remaining question is whether it would make more sense to rename
pcie_clear_device_status() to pci_clear_device_error_status() and refine
its behavior by adding a mask specifically for bits 0 to 3. Here’s an
example of the proposed change:

-void pcie_clear_device_status(struct pci_dev *dev)
+void pci_clear_device_error_status(struct pci_dev *dev)
  {
         u16 sta;

         pcie_capability_read_word(dev, PCI_EXP_DEVSTA, &sta);
-       pcie_capability_write_word(dev, PCI_EXP_DEVSTA, sta);
+       /* clear error-related bits: 0-3   */
+       pcie_capability_write_word(dev, PCI_EXP_DEVSTA, sta & 0xF);
  }

Renaming the function to pci_clear_device_error_status() better
reflects its current focus on clearing error-related bits, and
introducing the mask ensures that only those relevant bits (0-3) are
cleared, rather than modifying the entire register. What do you think
about these changes?

Thanks.
Shuai

