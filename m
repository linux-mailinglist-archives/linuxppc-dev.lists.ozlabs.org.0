Return-Path: <linuxppc-dev+bounces-13058-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 361C1BF174D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Oct 2025 15:09:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cqwkr6YRlz3020;
	Tue, 21 Oct 2025 00:09:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760965796;
	cv=none; b=AqoRKyipop9akiw8FpOBUYjY7jqHNMnTLAqWQmjU/fPzcPm8hK49IHyrIoue+f53JIIToRMnpMduyWrbq2uEjs0ejcgscZ2CxSx/0gfHGKev1pnYyDtpdvoIZ76MT8+LqhclQGGlcz7Zwgo6P/W3KSn3lr0WJA+sdvMOP5QBzVR8/8izQI6JBodPabZyYKnQf/xc0x431MDagQpfwhyOGj4O7O5GgudBugvPLrzsBCdREo1txiLYhWjlcWFQlhC1EbOr8G6TyS4hEN+bwKSrCxXNots/OorDjyC0ufI772OjF4Bh0Q1vDpW5Po1slziGJmj53KFlgHYIxVUR0MCAbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760965796; c=relaxed/relaxed;
	bh=A/YVSIfENMg7a+CnApsjKhHaaNSfgBvr9Vz+qTSmgCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WJiucJs/Sp/gIlCBNYzJu+bLJpBO7rYtRSkF1cVre3V0g+eUGLLVdYxGs9z9HxRVRkf7A3wnU5oC/VDvOUQuwEhgaeTYi9OtZx9c3mHrVW3aySTHDz4CFZnp683ih4IGKT4F8MBH1L58FBhertF9PwLUEQl+bOVpL0Zy8BdiptGLbzWSk3/eTNwpHD1/HI3JxO6SQP4wXJF8f+5Pi7qVMqKDRnpLoQbm94QKIYFHau91cevceHNnpiyrMoEhSYQLyxr4hVrfQr6f3FFj9kHviUEKq8eL8/rKLTMjAegPk5eiunTqZhv3m57rGLUV3u3iDjW5P/zc17uWud4Sr3cZvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=dwyQ/qjt; dkim-atps=neutral; spf=pass (client-ip=115.124.30.124; helo=out30-124.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=dwyQ/qjt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.124; helo=out30-124.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cqwkq0DSqz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 00:09:54 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1760965790; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=A/YVSIfENMg7a+CnApsjKhHaaNSfgBvr9Vz+qTSmgCU=;
	b=dwyQ/qjt2LPm4K5AQhRWVJkdL21EIssMXhyqEcgHzKHWSNsWa8BmYJ24olrEE2otzFbggZAqwBzUnwkK9edUTwPw6zRqaBVazExh/xShgLMRCrak551sm+Z5KmQaBxhTQ4sLF95yoK5b0e1cmIPXmBFNz3NhXsh8hX9ETMeDi4Y=
Received: from 30.246.161.241(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WqcnHlY_1760965785 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 20 Oct 2025 21:09:46 +0800
Message-ID: <0fe95dbe-a7ba-4882-bfff-0197828ee6ba@linux.alibaba.com>
Date: Mon, 20 Oct 2025 21:09:41 +0800
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
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <aPYMO2Eu5UyeEvNu@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



在 2025/10/20 18:17, Lukas Wunner 写道:
> On Wed, Oct 15, 2025 at 10:41:58AM +0800, Shuai Xue wrote:
>> Replace the manual checks for native AER control with the
>> pcie_aer_is_native() helper, which provides a more robust way
>> to determine if we have native control of AER.

Hi, Lukas,

Thank you for your question.

> 
> Why is it more robust?

IMHO, the pcie_aer_is_native() helper is more robust because it includes
additional safety checks that the manual approach lacks:

int pcie_aer_is_native(struct pci_dev *dev)
{
	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);

	if (!dev->aer_cap)
		return 0;

	return pcie_ports_native || host->native_aer;
}
EXPORT_SYMBOL_NS_GPL(pcie_aer_is_native, "CXL");

Specifically, it performs a sanity check for dev->aer_cap before
evaluating native AER control.

And I think this is more maintainable than manual checks scattered
throughout the code, as the helper encapsulates the exact conditions
required to determine native AER control.

> 
> Thanks,
> 
> Lukas

Thanks.

Shuai

