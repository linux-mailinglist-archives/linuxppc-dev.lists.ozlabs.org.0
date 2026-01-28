Return-Path: <linuxppc-dev+bounces-16362-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGHUMCQFemlE1gEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16362-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 13:46:28 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFB6A181B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 13:46:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1MTY2wyzz2xm3;
	Wed, 28 Jan 2026 23:46:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.112
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769604385;
	cv=none; b=StFIkVcGqVBV7Lql7QkugnRv38tpjVwASOoYOS1r3YPRhR+qk3Luy43xTwP+3q85IfkzCGh94NboB2SZOdDFneDHk7DipEOO6b3/OnFoUgdUuWwqcwtgeVoecOqiJrL8pOy+MsxQgsXF2czIg2sWp7k4JQ6Dur3w0/hibOZ71bwB8fJGAzHRB2ntSK+JKHbdFBtPcUxRoE8ESQv6thpw1GRD5rcjeSpYfrVetFMy5XN0alWa5ogZP/RXWqhtek7Q5DiKDcoyuNlC8AMKeJva9+lA5obPC44SzTvaJi1GIX9+X1Dx2vWO/98Z0GgewdFFkcJwjp7n3W8SvtZhcC5otg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769604385; c=relaxed/relaxed;
	bh=5H1octHPUjq8reaBdfqr3YD7JWEdTZNHksph57o+qWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TlHzwp4S95TMQMDL9hzryu2xCGbitzQ52tyFkw6+UTCTZv8CEVtIeH02lluvDM3UhtFLIMtC6J6vekS8mFsQSy3+0cUU4G7WJqL0sqN3yJe+ILWnxXkPiYfzzqb9HNEqsY3O3GfPYIFCSQ8ysfXQsexhhuJaFESxMJpReljK0AEcQ6jYiG0JE/YGpB0Kbodco1TRLRUl+fADgv+GSCzCnZdagneHDx1vZO08CkLtY/b/v2D/garkg1ZNTg085AUcAkf2CK/jD2x3wMzV1sGUR1hu62paODlo0yuFWITJmEy1Aj9YAPreCTkwSiu4JuJYYftUWSEqmzzhPC5DlGbGnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=K+jL5h2b; dkim-atps=neutral; spf=pass (client-ip=115.124.30.112; helo=out30-112.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=K+jL5h2b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.112; helo=out30-112.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1MTW1w5dz2xjK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 23:46:20 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1769604375; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=5H1octHPUjq8reaBdfqr3YD7JWEdTZNHksph57o+qWM=;
	b=K+jL5h2bKihFStA1PGTChJGBcJkMiucwKXn7y2YjQ8ct9sYkAEKhaIqwy2UoSj6NsCp4Ch+5Imf7iyWupkxmDij9SGICQVRcoFKQVvDACtA5wM3yItkSZFVDt+VF76vG2dYJBiuiPhrArGl1aCRHw38gPO/z/prXBLNBaAiGBWA=
Received: from 30.246.162.115(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0Wy3VVn-_1769604373 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 28 Jan 2026 20:46:14 +0800
Message-ID: <881e57b7-aa73-4df6-b37b-d71571567436@linux.alibaba.com>
Date: Wed, 28 Jan 2026 20:45:36 +0800
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
Subject: Re: [PATCH v7 5/5] PCI/AER: Only clear error bits in
 pcie_clear_device_status()
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com, kbusch@kernel.org,
 sathyanarayanan.kuppuswamy@linux.intel.com, mahesh@linux.ibm.com,
 oohall@gmail.com, terry.bowman@amd.com, tianruidong@linux.alibaba.com,
 lukas@wunner.de
References: <20260124074557.73961-1-xueshuai@linux.alibaba.com>
 <20260124074557.73961-6-xueshuai@linux.alibaba.com>
 <20260127104520.0000579c@huawei.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20260127104520.0000579c@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-9.21 / 15.00];
	WHITELIST_DMARC(-7.00)[alibaba.com:D:+];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.alibaba.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[linux.alibaba.com:s=default];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16362-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jonathan.cameron@huawei.com,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:bhelgaas@google.com,m:kbusch@kernel.org,m:sathyanarayanan.kuppuswamy@linux.intel.com,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:terry.bowman@amd.com,m:tianruidong@linux.alibaba.com,m:lukas@wunner.de,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xueshuai@linux.alibaba.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,google.com,kernel.org,linux.intel.com,linux.ibm.com,gmail.com,amd.com,linux.alibaba.com,wunner.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xueshuai@linux.alibaba.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linux.alibaba.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.alibaba.com:mid,linux.alibaba.com:dkim,alibaba.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,wunner.de:email]
X-Rspamd-Queue-Id: CBFB6A181B
X-Rspamd-Action: no action



On 1/27/26 6:45 PM, Jonathan Cameron wrote:
> On Sat, 24 Jan 2026 15:45:57 +0800
> Shuai Xue <xueshuai@linux.alibaba.com> wrote:
> 
>> Currently, pcie_clear_device_status() clears the entire PCIe Device
>> Status register (PCI_EXP_DEVSTA), which includes both error status bits
>> and other status bits such as AUX Power Detected (AUXPD) and
>> Transactions Pending (TRPND).
>>
>> Clearing non-error status bits can interfere with other drivers or
>> subsystems that may rely on these bits. To fix it, only clear the error
>> bits (0xf) while preserving other status bits.
>>
>> Fixes: ec752f5d54d7 ("PCI/AER: Clear device status bits during ERR_FATAL and ERR_NONFATAL")
>> Cc: stable@vger.kernel.org
>> Suggested-by: Lukas Wunner <lukas@wunner.de>
>> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
> Similar to previous. Drag to start of series to make backports easier if
> we think this is a fix that affects real cases.  

Thank you for the detailed feedback.

I'll move this patch to the start of the series for easier backporting.

> For stuff that's defined
> in the PCI 6.2 spec, AUX power and Transactions Pending are RO, but
> the interesting one is Emergency Power Reduction Detected which is RW1C
> and hence reason this fix is potentially needed  + future features using
> remaining bits.
> 
> I'd be more explicit in the commit message for that.  Talk about it not
> mattering for AUXPD or TRPND because they are RO, vs the ones we
> aren't using yet in Linux with the emergency power reduction detected
> as an example that clearly shows we need to mask this!
> 

You're absolutely right - the commit
message should be more explicit about the different bit types and their
implications.

The revised the commit message is:

PCI/AER: Only clear error bits in PCIe Device Status register

Currently, pcie_clear_device_status() clears the entire PCIe Device
Status register (PCI_EXP_DEVSTA), which includes both error status bits
and other status bits.

According to PCIe Base Spec r6.0 sec 7.5.3.5, the Device Status register
contains different types of status bits:

- Read-only bits (AUXPD, TRPND): Writing to these has no effect, but
   clearing them is unnecessary.

- RW1C (read/write 1 to clear) non-error bits: For example, Emergency
   Power Reduction Detected (bit 6). Unconditionally clearing these bits
   can interfere with other drivers or subsystems that rely on them.

- Reserved bits: May be used for future features and should be preserved.

To prevent unintended side effects, modify pcie_clear_device_status() to
only clear the four error status bits (CED, NFED, FED, URD) while
preserving all other status bits.

Fixes: ec752f5d54d7 ("PCI/AER: Clear device status bits during ERR_FATAL and ERR_NONFATAL")
Cc: stable@vger.kernel.org
Suggested-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>

> J

Thanks.

Best Regards,
Shuai

