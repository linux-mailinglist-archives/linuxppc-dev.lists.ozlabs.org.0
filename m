Return-Path: <linuxppc-dev+bounces-6608-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE43AA4B700
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 04:48:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5lCw3R4kz30VV;
	Mon,  3 Mar 2025 14:48:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.110
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740973724;
	cv=none; b=QjfyIGomy0VufE5nm9LcmD6tDn056WK92ozzjrMGGKjfzzE/r7k3JBAHTO4Br5sDuDeK6NPGWcXns0PCFLD/A28MIhS0I5aiCTymzrmu2ZaWY/QGnB3aAcGadrYz75vUq5OUhQCugwRt2uf/QwaRmopOuqpfXeSqls2f7gAFyHY0bRgpzTtxX0fxKA5bZw5rNDPIsuk6fDvfdJ4RjisZYZURIxNsFOh/GnmQ5nti0/WaiQOC982ufMYRQGLNfxuJTKzUw3xxO9V9n453HWVhlHlSRrWGnFYSQIMFC1oTdyHSQVcAq8gR2BMUxNEUmGjjGM6/1pxOda8hpdLiFMgyGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740973724; c=relaxed/relaxed;
	bh=x6zF8fFARCSUTdMgI1FTCddqWiaaLjFTVKmfeG7gs9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SZ2ejnzELNI+V35UXyT+4VuAXsM89P1Na/+tIEYdSXiQmXHY69DjuzC10DJ/PN6R7zB9A938QzyXcz6klckjTN/xMPeHoJ4p8cmvSnu8BghMUh8Gi5owH6yNVC0lHcM6WGrx9XnPKj4eJek6++2ULYnsrqLQA6ws3cS0W4kQzeg+GKX5BJjvein4yqGjnr57Pf84cukzYgqpnjwrbJEgnQ0gku8ebiB5S7pq2b3luVXKyLffvWdWUY2+p9SucMVUqOdMCAnr5e7F2BblQgJ/xnB/Gzu5/Oy1H76wFo7PgqGsLbcpni+9+PscPDuqhWeY9TqjM+w9l47qK3ubVRnMfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=g29kH/mG; dkim-atps=neutral; spf=pass (client-ip=115.124.30.110; helo=out30-110.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=g29kH/mG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.110; helo=out30-110.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z5lCt4zWBz30VQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Mar 2025 14:48:41 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1740973717; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=x6zF8fFARCSUTdMgI1FTCddqWiaaLjFTVKmfeG7gs9E=;
	b=g29kH/mG7Cr6vvqiXD/EhVW65HFAIJKZG3N/OhrEofhyc1QuxkJHPCr2yU/l9ZEKIi6ek25uCU2inDp1kpDVXVbVMi5Vk18EwwqXwkEapQ+Wf+lnSrA31zrWn/cCjqGerCvMdASWK+SkikKFz30ZcqbidBUqsRk9cwn03PZ0NsI=
Received: from 30.246.161.128(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WQY07TD_1740973714 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 03 Mar 2025 11:48:35 +0800
Message-ID: <24c07fb8-8a85-42fb-87fe-9f5dbd53eea3@linux.alibaba.com>
Date: Mon, 3 Mar 2025 11:48:34 +0800
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
Subject: Re: [PATCH v4 2/3] PCI/DPC: Run recovery on device that detected the
 error
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com, kbusch@kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com, Jonathan.Cameron@huawei.com,
 terry.bowman@amd.com, tianruidong@linux.alibaba.com
References: <20250217024218.1681-1-xueshuai@linux.alibaba.com>
 <20250217024218.1681-3-xueshuai@linux.alibaba.com>
 <8bb49ca2-6b27-4b05-9ad7-ed10cfa841d5@linux.intel.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <8bb49ca2-6b27-4b05-9ad7-ed10cfa841d5@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



在 2025/3/3 11:36, Sathyanarayanan Kuppuswamy 写道:
> 
> On 2/16/25 6:42 PM, Shuai Xue wrote:
>> The current implementation of pcie_do_recovery() assumes that the
>> recovery process is executed on the device that detected the error.
>> However, the DPC driver currently passes the error port that experienced
>> the DPC event to pcie_do_recovery().
>>
>> Use the SOURCE ID register to correctly identify the device that
>> detected the error. When passing the error device, the
>> pcie_do_recovery() will find the upstream bridge and walk bridges
>> potentially AER affected. And subsequent patches will be able to
>> accurately access AER status of the error device.
>>
>> Should not observe any functional changes.
>>
>> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
>> ---
> 
> Looks good to me
> 
> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> 

Thanks.
Shuai

