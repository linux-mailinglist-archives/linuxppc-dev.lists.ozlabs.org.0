Return-Path: <linuxppc-dev+bounces-6110-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA641A31C45
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2025 03:48:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yt2mZ0x2hz2yDp;
	Wed, 12 Feb 2025 13:47:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.99
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739328478;
	cv=none; b=kZAlMSoYYLM7lLzGbxHnd27av5/PG4Lh8NjCIUyN/u41wDqDNX6cJMDTLZQG/4UpJgJfh8+qcdgNP+H+effgrR+wLrHKMYHTQy2CQMab3TIDD8Xvgcm+y3BMi5O58ifg4u9pbj3J8tevgCFPcbKtavQ7ZYSLxN7PN5vdeZzsUqxuUV9XH/d0JVnm0NB78nXcMfaAyEQL1GyWE2VEn8VJ5/aRIGYWg1m23ZTbN0a4otvYJrKYo3hSZzo+W8zLVVzse5wBaSO885XAy3pactm+5HDNVwnlzadbQuytChinVE4ciyRwlGgQxph3wwngWpkqdYI/rctbrSdYkm541Ig19Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739328478; c=relaxed/relaxed;
	bh=8n/C4hqIHv1YHRAmzi0gJ/oE8TghePZSYBhBlvYwJL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hb/+1tuqwSjgUsL0PfrBfIDvcqvZFA2fQMuNttyw2SpGQW065F7B250D0rIe1e77EKbmOA3euyIvC3wLC+lNVPItPhwr1tI5tVM3O+SUnqaRy0miXV0Ssm4mThp1E4ptonie2hLePdyTseu6i6wOCy+foS0mZHayyS/kezvN800ZQtT4riP84JSXmiGCbX5wsb6R1yauH0e7qxEklrX76EtCVg0RmT8WNTotqsGUagZC8eyW/JKkV5LakXdAF8HsXNfZbZtKiYD2KLlxvk391TV6UKdqNFW+yM1toKapS58ibkL9XOxVDztsYlhXoMxMgtZdMZbgZWu0aSOgqTcqqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=shfsAcWG; dkim-atps=neutral; spf=pass (client-ip=115.124.30.99; helo=out30-99.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=shfsAcWG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.99; helo=out30-99.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yt2mX07lDz2xsd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2025 13:47:54 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1739328470; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=8n/C4hqIHv1YHRAmzi0gJ/oE8TghePZSYBhBlvYwJL4=;
	b=shfsAcWGingznMwwBDinnrV6spDCq8IGpO/vlqf0/ahwJ3Rhaxe5W8Wnqh4BLn2dzXx/vvihN09n9YAp9hYJKHXlTPp9E8zSOrYrURvDtVJv/T0/oQQIS29EIpKmxJlsxyx9A6e7PYONxuEDl4I2hRK8MJ2CkwBOceXkPsg1uhQ=
Received: from 30.246.161.128(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WPIHpDm_1739328468 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 12 Feb 2025 10:47:48 +0800
Message-ID: <5452e267-4c96-4fe5-99f7-44610b4a8b85@linux.alibaba.com>
Date: Wed, 12 Feb 2025 10:47:47 +0800
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
Subject: Re: [PATCH v3 1/4] PCI/DPC: Rename pdev to err_port for dpc_handler
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com, kbusch@kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com, Jonathan.Cameron@huawei.com,
 terry.bowman@amd.com
References: <20250207093500.70885-1-xueshuai@linux.alibaba.com>
 <20250207093500.70885-2-xueshuai@linux.alibaba.com>
 <f4d2579c-97ab-41d7-a496-7c711243517f@linux.intel.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <f4d2579c-97ab-41d7-a496-7c711243517f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



在 2025/2/12 05:17, Sathyanarayanan Kuppuswamy 写道:
> 
> On 2/7/25 1:34 AM, Shuai Xue wrote:
>> The irq handler is registered for error port which recevie DPC
>> interrupt. Rename pdev to err_port.
>>
>> No functional changes.
>>
>> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
>> ---
> 
> I think you can combine patch 1 & 2 into a single patch. Change wise, it looks
> fine to me.
> 
> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

Will do in next version.

Thanks.
Shuai




