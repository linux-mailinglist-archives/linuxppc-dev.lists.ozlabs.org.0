Return-Path: <linuxppc-dev+bounces-13079-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E311DBF441B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 03:33:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crFDX19nmz300M;
	Tue, 21 Oct 2025 12:33:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.110
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761010396;
	cv=none; b=HWcLsd3plH2dBc1Hs2bNyKm7o7kUn2oxfAgBHfHOMXSM1QjWsvTMM8H7jylmRMIUbzZPgmx5z3Kot9tYSKDVKzKvLVv5J+8KXhbvotCZpAaL4lpb/QduwFjvKOL0ocT8Y7LMRjdXZf8ZHsbpVe84/ox483KynTghN2cV0gwntnS0BvODkRFy8pDWE4psfzDKE2Zv/RFh979S3GcP2Sv2aOwsULLg5IFFeaE5OLz3I7Tc6+pM+fXFhK/pxqDqnnKRcAJw7X0Caf+WFoGK3qcYB6vywofLlsK1EdXJRNbn04xkNDEh5BSr/XMmXYvH/z3byPqH6VHj0cDNcOwYCNiXQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761010396; c=relaxed/relaxed;
	bh=JftLKudts6AlugdH0e5sXukUNjaz5n6bWnIRDr7FQDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KbWu5mfhzccwG4qDYcmuyDXCNyCMiiGa++9w0guhHieS2C67I6wqbGJCZsKkoYkIl1aLIvmhpCBCsrFCqljnyykk16OU/FR4rf+c6vsnu1xoo8xzpMXgAbsBA8PxTv5svz8RNNELk7q4W0gQ5vA/v3nnS2L41IyMaedJlyI4IQRuCrmPsvD3HWwNi0hW5G0kQHBqBeGs9cDHD1avWqKxbeUhwqpoHNRE1qCG9Zwn/bNtMFiAPyYdwOnUepdd34/xEUdDPBn1IKjqDdykMY4KaVS2v2Y4bmXf1vJNfWpeCEBPFbe/0I6ROicMIRegv4JASrTDwoNeErdj8hAw6jNEtg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=pbe7d50u; dkim-atps=neutral; spf=pass (client-ip=115.124.30.110; helo=out30-110.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=pbe7d50u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.110; helo=out30-110.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crFDV1xblz2ypV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 12:33:12 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1761010388; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=JftLKudts6AlugdH0e5sXukUNjaz5n6bWnIRDr7FQDU=;
	b=pbe7d50u2HF8gVBAiPrd09VY920LDEtXmnp/I9L5QWoW7H7mAQIWHW05dl+JRKy799OY3WjUzHbgB9yHdpoL/15TOV3ual3kgpv10zIOySXVvaVO01hx6sGEW+3WkHjuaVRdkB3My4gR0wnRiEbEsbX42pQZpJVfUgnbNIamOFE=
Received: from 30.246.161.241(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0Wqgxi9._1761010386 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 21 Oct 2025 09:33:07 +0800
Message-ID: <cd36a39b-fc63-4c4b-aa67-215656b86990@linux.alibaba.com>
Date: Tue, 21 Oct 2025 09:33:02 +0800
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
Subject: Re: [PATCH v6 5/5] PCI/AER: Clear both AER fatal and non-fatal status
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com, kbusch@kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com, Jonathan.Cameron@huawei.com,
 terry.bowman@amd.com, tianruidong@linux.alibaba.com, lukas@wunner.de
References: <20251015024159.56414-1-xueshuai@linux.alibaba.com>
 <20251015024159.56414-6-xueshuai@linux.alibaba.com>
 <8cfebb7f-e557-493f-9458-f770fd459d06@linux.intel.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <8cfebb7f-e557-493f-9458-f770fd459d06@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



在 2025/10/21 02:44, Kuppuswamy Sathyanarayanan 写道:
> 
> On 10/14/25 19:41, Shuai Xue wrote:
>> The DPC driver clears AER fatal status for the port that reported the
>> error, but not for the downstream device that deteced the error.  The
>> current recovery code only clears non-fatal AER status, leaving fatal
>> status bits set in the error device.
>>
>> Use pci_aer_raw_clear_status() to clear both fatal and non-fatal error
>> status in the error device, ensuring all AER status bits are properly
>> cleared after recovery.
>>
>> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
>> ---
> 
> I think it needs to go to stable tree. Any Fixes: commit ?

Got it. I will add a Fixes tag and cc stable.

Thanks.
Shuai

