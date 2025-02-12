Return-Path: <linuxppc-dev+bounces-6114-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EC8A31E43
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2025 06:51:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yt6rn16Mxz2yVT;
	Wed, 12 Feb 2025 16:51:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.99
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739339513;
	cv=none; b=ZcXrbztkNFanjOA9h/YI5QsiPx28hSvMg/Zx+9PgQjZ9yNw+ZJpJAsQMJ1RsVb9/8DQMMAXaHcZ39i6yBOfa41DmsQ9qqxi9o5+ZnLX95km7Hh13qgEmamKPfosZs57hWjBwakalZLQ4/H96N9nVpqOPSAN2J4APfkr5BNBZo/7K/wU6GctjMuZ62grktrcDww6zKyyV67ccyVfV21P+oxjp4XvOiBYQMQ7nJuMNfNMJoSPBvAf+sq78vkuv2fIvaXsKJaY9I4nrslpYiZ3x9/xplVD32ifispgFVfg6JZDo0+uK6kxYan8UgD5m3g7ws3jXn+5edwuaOpO3Sk0cxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739339513; c=relaxed/relaxed;
	bh=KvRmoe/zsC7m2wXD5OYDHglu/jPFjgfHTsdUpjdqzNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NwuE2kK6twShe7C5cZPor1NqqCUqHgUuUTVVvKAk4eWd1gJSNGDOxmIi53JKdwDo2ZzQfBuJPRLEbsh6IaX3pj8DIm+PhTpZ4nWwyiPucW2vI3NXNstVIvDgy7n08889G9ZtfJfSDjANS/UOhlBrIKUGqkNoeyurRPWwiYdsPxFhwryKmWUgXQPYiCtzbGEXwtorDWcNFxC4vK8DUMTTXmQfsBPhAR79ebAyhAUbr/9IHSqtoiIJt2GDoRVs9o9PP3d2epvCo9qv1gRFXtiF/spMeZCzxIw2FOKMNgeT/sFnInn6fzh4Sg+J+1pUMjfr6Uyb7HyhGDmuDNWsDV0q1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=uF9s1OR8; dkim-atps=neutral; spf=pass (client-ip=115.124.30.99; helo=out30-99.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=uF9s1OR8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.99; helo=out30-99.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yt6rl12wHz2yF4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2025 16:51:49 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1739339506; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=KvRmoe/zsC7m2wXD5OYDHglu/jPFjgfHTsdUpjdqzNE=;
	b=uF9s1OR8vDtv1WMVx2CJGcceHaaipU0JCBQvGEv0jH1waYKjrZxVLTF0uumv4rWen2U7cBMyyP3xU7Owj8Qy1QJrJgFauvW5yTfbY0AYZwQlya+f1nr8YJ8qc11sKZh0YdPIE59kg4fhMJ2yN1zN3xjQsPjoOgeIjgq/Xy9a+Sc=
Received: from 30.246.161.128(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WPIso2v_1739339502 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 12 Feb 2025 13:51:42 +0800
Message-ID: <a89b973e-a168-49f1-8a82-2e9280cc08b6@linux.alibaba.com>
Date: Wed, 12 Feb 2025 13:51:41 +0800
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
Subject: Re: [PATCH v3 3/4] PCI/DPC: Run recovery on device that detected the
 error
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com, kbusch@kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com, Jonathan.Cameron@huawei.com,
 terry.bowman@amd.com
References: <20250207093500.70885-1-xueshuai@linux.alibaba.com>
 <20250207093500.70885-4-xueshuai@linux.alibaba.com>
 <c1837324-98b0-4548-893f-b14e89ced9db@linux.intel.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <c1837324-98b0-4548-893f-b14e89ced9db@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



在 2025/2/12 05:23, Sathyanarayanan Kuppuswamy 写道:
> 
> On 2/7/25 1:34 AM, Shuai Xue wrote:
>> The current implementation of pcie_do_recovery() assumes that the
>> recovery process is executed on the device that detected the error.
>> However, the DPC driver currently passes the error port that experienced
>> the DPC event to pcie_do_recovery().
>>
>> Use the SOURCE ID register to correctly identify the device that detected the
>> error. By passing this error device to pcie_do_recovery(), subsequent
>> patches will be able to accurately access AER status of the error device.
> 
> I also recommend adding info about the fact that pcie_do_recovery() finds
> upstream bridge to run the recovery process and hence should not observe
> any functional changes (compared to previous version)

Got it.  Will add it.
> 
>>
>> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
>> ---
>>   drivers/pci/pci.h      |  2 +-
>>   drivers/pci/pcie/dpc.c | 25 +++++++++++++++++++++----
>>   drivers/pci/pcie/edr.c |  7 ++++---
>>   3 files changed, 26 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
>> index 01e51db8d285..870d2fbd6ff2 100644
>> --- a/drivers/pci/pci.h
>> +++ b/drivers/pci/pci.h
>> @@ -572,7 +572,7 @@ struct rcec_ea {
>>   void pci_save_dpc_state(struct pci_dev *dev);
>>   void pci_restore_dpc_state(struct pci_dev *dev);
>>   void pci_dpc_init(struct pci_dev *pdev);
>> -void dpc_process_error(struct pci_dev *pdev);
>> +struct pci_dev *dpc_process_error(struct pci_dev *pdev);
>>   pci_ers_result_t dpc_reset_link(struct pci_dev *pdev);
>>   bool pci_dpc_recovered(struct pci_dev *pdev);
>>   unsigned int dpc_tlp_log_len(struct pci_dev *dev);
>> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
>> index 1a54a0b657ae..a91440f3b118 100644
>> --- a/drivers/pci/pcie/dpc.c
>> +++ b/drivers/pci/pcie/dpc.c
>> @@ -253,10 +253,17 @@ static int dpc_get_aer_uncorrect_severity(struct pci_dev *dev,
>>       return 1;
>>   }
>> -void dpc_process_error(struct pci_dev *pdev)
>> +/**
>> + * dpc_process_error - handle the DPC error status
>> + * @pdev: the port that experienced the containment event
>> + *
>> + * Return the device that detected the error.
>> + */
> 
> Add a note about calling pci_dev_put() after using this function.

Will add it in next version.

Thanks.
Shuai



