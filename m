Return-Path: <linuxppc-dev+bounces-3245-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 217BC9CDB7D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2024 10:23:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XqWlZ1bC9z2xGr;
	Fri, 15 Nov 2024 20:23:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.119
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731662586;
	cv=none; b=MYXB902+3rMWIfLBOuYE/0V3jJjSShr7hqJ5BMk8EE3fDX4fMxU2K2NymrHUt8LgJavBOwdGozc2qFF/AqyoJ8Ht1niI2Laho0e151SVIwEwW+DyciFlaS+Rjxn25M6bpFsUXm6Uo64iPIiUUCodSdQQAEmS/0Zy+W26XedjtfcDwZboqRCuHnmykFURKPXq+kxe87UqxlErkzpvCy1q50tMQrRbNikBkMiV3VVkkk0rtrFCsbUqrO3lr09YapBeqW64RHvpmILb0UHpZ6YAdctqNbNLsDvQtd07Opv9u1Jx9hnp7naSeVN9Ipz2wayW6bnDCmb0xBClmq4RE6114A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731662586; c=relaxed/relaxed;
	bh=jQVm0XiX/O8PJTXPSVm2F+Gp9S8SqG9V8Sljy7gMQ70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XD6fZVeqKGz+NDfmIP0GoZKz/WeGznOcfOD4UnY98+TPKwxLX5iqdY46DGsqUOLJ7wqYGct17EkiIHyk9kuH3nns/BE+B2Pi/ibYqNpWt/QJ57pWiQt9YhlxElpRR1dP/6FQ0ISewTO/u/ZxGHzsoKDV1UlLjIu61NeqJcJo9orH6PWFSVEL7r5FVRl61/a/tMj13/z5L9zJSizSUdQ8ZsTP3uIw2MZ9DER+S/oO+c43B3KKNvGm4kKSnaM6cyHzOS2oN/6RXdXWC0g5ynu5uwrNmQGqwyNnoAt4Bdk+Nl+OcG2V/iBouIQDqFxWaunzy2RVLGyOjGxo/mCwrGZQSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=uYJEPmCE; dkim-atps=neutral; spf=pass (client-ip=115.124.30.119; helo=out30-119.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=uYJEPmCE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.119; helo=out30-119.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XqWlV0cq5z2yGf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 20:22:55 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1731662572; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=jQVm0XiX/O8PJTXPSVm2F+Gp9S8SqG9V8Sljy7gMQ70=;
	b=uYJEPmCE9TiKvpvLe39ISJWAXR2z1bFkBKEb3pDkb+sMFRB935bJVwsf7bvhVLdEQIiM8G0aGr/BEQzZeoaZ8155bqGcAp/Eu8TD4WkwQ/KYwuWv6DuPK3BB0t1ofS9EsaD6OklRut1B4c/UNPavjgDjpz1mfvNqsMFsyfDxpVQ=
Received: from 30.246.162.170(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WJTCOoc_1731662568 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 15 Nov 2024 17:22:50 +0800
Message-ID: <ae12f2f1-3626-4af7-b42a-b3a16e8a7a95@linux.alibaba.com>
Date: Fri, 15 Nov 2024 17:22:47 +0800
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
Subject: Re: [PATCH v2 2/2] PCI/AER: Report fatal errors of RCiEP and EP if
 link recoverd
To: Lukas Wunner <lukas@wunner.de>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com, kbusch@kernel.org,
 mahesh@linux.ibm.com, oohall@gmail.com,
 sathyanarayanan.kuppuswamy@linux.intel.com
References: <20241112135419.59491-1-xueshuai@linux.alibaba.com>
 <20241112135419.59491-3-xueshuai@linux.alibaba.com>
 <ZzcPMxWqtvDWh3cq@wunner.de>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <ZzcPMxWqtvDWh3cq@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



在 2024/11/15 17:06, Lukas Wunner 写道:
> On Tue, Nov 12, 2024 at 09:54:19PM +0800, Shuai Xue wrote:
>> The AER driver has historically avoided reading the configuration space of
>> an endpoint or RCiEP that reported a fatal error, considering the link to
>> that device unreliable.
> 
> It would be good if you could mention the relevant commit here:
> 
> 9d938ea53b26 ("PCI/AER: Don't read upstream ports below fatal errors")
> 
> Thanks,
> 
> Lukas

Sure, will add it.

Thank you.
Best Regards,
Shuai

