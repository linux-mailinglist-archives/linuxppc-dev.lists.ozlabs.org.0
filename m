Return-Path: <linuxppc-dev+bounces-16658-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIyqJXmphWnUEgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16658-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 09:42:33 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5D4FBA12
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 09:42:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6ndx341tz2yFc;
	Fri, 06 Feb 2026 19:42:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.110
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770367349;
	cv=none; b=ndbTeBpdd3lXbQticGcNIVYk3ZOtl7vs+GKcZNb+STHCqsGcfBB7Hr/uy+tAZzNQSi59i3DXM2hw4zQhIft6uhxpKWyA7vNVtEpvDpBQlVVdyyT9vYmcoP8lXgwIlNcrwRNZ7jIjVQqPdy+hQQMslYKyZ/hQCOc4ukHRtZdNtEl/9Y4JW5wfeqtPO92WcZX8NzEfWocSnAcrfK9jLVQluiI1pyCzsNpcmyQleGk4i6WVCuanS7rQh6Az5sV6enmltMGChjBBwqkxywzEFlsVDQ4jTB0VAM7WGQN31a4EADmypGYcHnvTsnKPRzRaFaGvN5DI+ZAs8O8JQyhxvsYqMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770367349; c=relaxed/relaxed;
	bh=roeuOg0Rv1qCNNC6wf86NafkQzf+jUxSv4eS8pnA4tE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hSgJHvnr2xIxAbUktIavQodkZpKy8XVQhdEoaB7IC60AKdtzuBkv6aBuQll4+T6+HTPfCU1MgYFylLpdv+hrNAj/zm7JdHagV9TC1kv61K7zAy4mkb9Um2s6F+9E0OPSwa5G4O2lM8gdBoZdAi+pPkGd2YVrvoML0BaOb0MLYKm5jVqp2zuBYOrFCA3UlrLPxYyGArPskd75M2zxJp7JMkdg4oAFe+h3FYkBg8muz9JquG5LSHNtl90LGBHLTxcY2I2Dtd4z4deN3MVO6teRtoQGRWTyEXCBEIDOGbO8c+3t0ZuhjwDj1jsYCCRBZICqlQ/x21mgQfmg8GMDhFRZag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=r0JNAib6; dkim-atps=neutral; spf=pass (client-ip=115.124.30.110; helo=out30-110.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=r0JNAib6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.110; helo=out30-110.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6ndt2SB8z2xWJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Feb 2026 19:42:24 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1770367336; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=roeuOg0Rv1qCNNC6wf86NafkQzf+jUxSv4eS8pnA4tE=;
	b=r0JNAib6Uy1JwpiTkHPNNTLehXrMXJgVwRBFeckxgjsVfs9m1nStTA2qTRmQMgXwbTtAnTv/wx3HhmHYzFQ0SPMksKMzDXD2U4aeVTu0jyfsr77OMUI0rYfcfvvE4u7wvlruAkwYsncBhx+3PCQlBCqFFlDeVF59gOsa/V/eczo=
Received: from 30.246.162.188(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0Wye3ZUk_1770367332 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Feb 2026 16:42:13 +0800
Message-ID: <ab4dd988-8140-4ade-b26f-e6f9e4e8e67d@linux.alibaba.com>
Date: Fri, 6 Feb 2026 16:41:06 +0800
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
Subject: Re: [PATCH v7 2/5] PCI/DPC: Run recovery on device that detected the
 error
To: Lukas Wunner <lukas@wunner.de>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com, kbusch@kernel.org,
 sathyanarayanan.kuppuswamy@linux.intel.com, mahesh@linux.ibm.com,
 oohall@gmail.com, Jonathan.Cameron@huawei.com, terry.bowman@amd.com,
 tianruidong@linux.alibaba.com
References: <20260124074557.73961-1-xueshuai@linux.alibaba.com>
 <20260124074557.73961-3-xueshuai@linux.alibaba.com>
 <aYCujqZIvxElSsOE@wunner.de>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <aYCujqZIvxElSsOE@wunner.de>
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[linux.alibaba.com:s=default];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16658-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lukas@wunner.de,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:bhelgaas@google.com,m:kbusch@kernel.org,m:sathyanarayanan.kuppuswamy@linux.intel.com,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:Jonathan.Cameron@huawei.com,m:terry.bowman@amd.com,m:tianruidong@linux.alibaba.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xueshuai@linux.alibaba.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,google.com,kernel.org,linux.intel.com,linux.ibm.com,gmail.com,huawei.com,amd.com,linux.alibaba.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xueshuai@linux.alibaba.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linux.alibaba.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.alibaba.com:mid,linux.alibaba.com:dkim]
X-Rspamd-Queue-Id: 4E5D4FBA12
X-Rspamd-Action: no action



On 2/2/26 10:02 PM, Lukas Wunner wrote:
> On Sat, Jan 24, 2026 at 03:45:54PM +0800, Shuai Xue wrote:
>> +++ b/drivers/pci/pcie/dpc.c
>> @@ -372,10 +388,11 @@ static irqreturn_t dpc_handler(int irq, void *context)
>>   		return IRQ_HANDLED;
>>   	}
>>   
>> -	dpc_process_error(err_port);
>> +	err_dev = dpc_process_error(err_port);
>>   
>>   	/* We configure DPC so it only triggers on ERR_FATAL */
>> -	pcie_do_recovery(err_port, pci_channel_io_frozen, dpc_reset_link);
>> +	pcie_do_recovery(err_dev, pci_channel_io_frozen, dpc_reset_link);
>> +	pci_dev_put(err_dev);
>>   
>>   	return IRQ_HANDLED;
>>   }
> 
> You're assuming that the parent of the Requester is always identical
> to the containing Downstream Port.  But that's not necessarily the case:
> 
> E.g., imagine a DPC-capable Root Port with a PCIe switch below
> whose Downstream Ports are not DPC-capable.  Let's say an Endpoint
> beneath the PCIe switch sends ERR_FATAL upstream.  AFAICS, your patch
> will cause pcie_do_recovery() to invoke dpc_reset_link() with the
> Downstream Port of the PCIe switch as argument.  That function will
> then happily use pdev->dpc_cap even though it's 0.

I see. Goot point.

> 
> A possible solution may be to amend dpc_reset_link() to walk upwards,
> starting at pdev, and search for a pci_dev whose pdev->dpc_cap is
> non-zero.  That should be the containing DPC-capable port.

See my reply in your later patch.

> 
> I don't really like the err_dev and err_port terminology invented here.
> We generally use spec terms to make it easy to connect the code to the
> spec.  The spec uses the term "Downstream Port" to denote the containing
> Downstream Port, so a name such as "dport" may be better than "err_port".
 >
> 
> Similarly, the spec uses "Requester" or "Source" for the reporting agent,
> so "req", "requester", "src" or "source" may all be better names than
> "err_dev".

Sure, I wll use the common "dport" and "req" term from spec to make it more readable.


> 
> Thanks,
> 
> Lukas

Thanks for valuable comments.
Shuai


