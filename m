Return-Path: <linuxppc-dev+bounces-13244-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E032BC04385
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 05:09:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ct7DJ17bLz30RJ;
	Fri, 24 Oct 2025 14:09:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.100
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761275376;
	cv=none; b=NCRKVzye3iS6S0iL9PQ0LIKvsD3t7GcSwl1eKwVKLR7Sp0mktm1slBczRZE0xKuhI2xTqkKSadYVv6MotqMVIpTJiNHh6owZsXoqzhjcwVrXXsnos2khZlih3DtDMOOER2tq2U8KfZdyIEThGBPDoR61zZMO2vcAT/Wr/bxqObkNB2bXKvNsJXiDA9M5ukBfzZSBAdd3yBZR+1HMX0w0CTgBdfwiR+WBH4/9OFjGgIupdIwidbd++UQx+cfNunAndFY/aB1m7JuyTTemmYSvpnGU+FpVw3KRl97uVhU35f2fFemdOMeUMeHhuNc9XK3Uo75nxq2zCzEcqklMd+isZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761275376; c=relaxed/relaxed;
	bh=pdaoYJ6/jp41uVjOn5ADQtwMyGMN5yCeVaz4/XBge20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l19CjOsVe1AgxDkVqxSt0cZUzbKx2iG3VX7bE6cG8Wd915Omi2LeoVByeHZ1uJMNMCy4cY+2zmy/TDBk5t1DK3eT5HH2hJScjQo17AdU4+H0TwqwtdThZhosswq35C2DkYefo8v7Dxu512yhu4qrhLOtyUGZP+VGupL5SAZYc0rJf1trN5Z4WzbV7MaH7OPIox3xlLIMdGyD6OojidA7/KJhJkUdwkhRKW9Rz5MjxYiHsBWx8tRCl3GOlHwCgpBeIYd+0FZa0SYfICrr7DPvP+stIfjyYDYU7JocF95a2P4vypHMQkBTNtQYPWcVSQW7XwOaeTUBgNYD36RGqiLheA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=wrW3K9eE; dkim-atps=neutral; spf=pass (client-ip=115.124.30.100; helo=out30-100.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=wrW3K9eE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.100; helo=out30-100.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ct7DG0D0Wz2yl2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 14:09:32 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1761275368; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=pdaoYJ6/jp41uVjOn5ADQtwMyGMN5yCeVaz4/XBge20=;
	b=wrW3K9eEbn+sg9bCo3gFo9CJS1AeS+4TnXjWBnnKiScMtrok8D4FqCB8WmrFQ3+Lfikyh9GCniU+2y6ORY+qKwOzCSwmNNDYBjYM38Nz3sKaHfFlKGmKl/xh7s8P0INefVRIkrhbGNx2rGctU7iVeiqFWK/xI5KPe59FBxjHsD4=
Received: from 30.246.161.241(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0Wqskgl9_1761275365 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 24 Oct 2025 11:09:26 +0800
Message-ID: <1eaf1f94-e26b-4313-b6b7-51ad966fe28e@linux.alibaba.com>
Date: Fri, 24 Oct 2025 11:09:25 +0800
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
To: Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kbusch@kernel.org,
 sathyanarayanan.kuppuswamy@linux.intel.com, mahesh@linux.ibm.com,
 oohall@gmail.com, Jonathan.Cameron@huawei.com, terry.bowman@amd.com,
 tianruidong@linux.alibaba.com
References: <20251015024159.56414-1-xueshuai@linux.alibaba.com>
 <20251015024159.56414-5-xueshuai@linux.alibaba.com>
 <aPYMO2Eu5UyeEvNu@wunner.de>
 <0fe95dbe-a7ba-4882-bfff-0197828ee6ba@linux.alibaba.com>
 <aPZAAPEGBNk_ec36@wunner.de>
 <645adbb6-096f-4af3-9609-ddc5a6f5239a@linux.alibaba.com>
 <aPoDbKebJD30NjKG@wunner.de>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <aPoDbKebJD30NjKG@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



在 2025/10/23 18:29, Lukas Wunner 写道:
> On Mon, Oct 20, 2025 at 10:45:31PM +0800, Shuai Xue wrote:
>> 	if (host->native_aer || pcie_ports_native) {
>> 		pcie_clear_device_status(bridge);
>> 		pci_aer_clear_nonfatal_status(bridge);
>> 	}
>>
>> This code clears both the PCIe Device Status register and AER status
>> registers when in native AER mode.
>>
>> pcie_clear_device_status() is renamed from
>> pci_aer_clear_device_status(). Does it intends to clear only AER error
>> status?
>>
>> - BIT 0: Correctable Error Detected
>> - BIT 1: Non-Fatal Error Detected
>> - BIT 2: Fatal Error Detected
>> - BIT 3: Unsupported Request Detected
>>
>>  From PCIe spec, BIT 0-2 are logged for functions supporting Advanced
>> Error Handling.
>>
>> I am not sure if we should clear BIT 3, and also BIT 6 (Emergency Power
>> Reduction Detected) and in case a AER error.
> 
> AFAIUI, bits 0 to 3 are what the PCIe r7.0 sec 6.2.1 calls
> "baseline capability" error reporting.  They're supported
> even if AER is not supported.
> 
> Bit 6 has nothing to do with this AFAICS.

Hi, Lukas,

Per PCIe r7.0 section 7.5.3.5:

   **For Functions supporting Advanced Error Handling**, errors are logged
   in this register regardless of the settings of the Uncorrectable Error
   Mask register. Default value of this bit is 0b.

 From this, it's clear that bits 0 to 2 are not logged unless AER is supported.

So, if dev->aer_cap is not true, there’s no need to clear bits 0 to 2.
This validates the dev->aer_cap sanity check in pcie_aer_is_native():

   int pcie_aer_is_native(struct pci_dev *dev)
   {
       struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);

       if (!dev->aer_cap)
           return 0;

       return pcie_ports_native || host->native_aer;
   }
   EXPORT_SYMBOL_NS_GPL(pcie_aer_is_native, "CXL");

Based on this, the introduction of pcie_aer_is_native() in the patch
seems reasonable and consistent with the PCIe specification.

Further, should we rename pcie_clear_device_status() back to
pci_aer_clear_device_status():

-void pcie_clear_device_status(struct pci_dev *dev)
+void pci_aer_clear_device_status(struct pci_dev *dev)
  {
         u16 sta;

         pcie_capability_read_word(dev, PCI_EXP_DEVSTA, &sta);
-       pcie_capability_write_word(dev, PCI_EXP_DEVSTA, sta);
+       /* Bits 0-2 are logged if AER is supported */
+       pcie_capability_write_word(dev, PCI_EXP_DEVSTA, sta & 0x7);
  }

I am still uncertain whether bit 3 ("Unsupported Request Detected")
should be cleared in this function. It’s not directly tied to AER
capability.


I’d love to hear your thoughts, as well as @Bjorn’s, on both the renaming
suggestion and whether bit 3 should be cleared alongside bits 0 to 2.

Thanks.
Shuai

