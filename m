Return-Path: <linuxppc-dev+bounces-12408-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3A0B87A0E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Sep 2025 03:42:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSZxQ4Kj2z30RJ;
	Fri, 19 Sep 2025 11:42:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.132
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758246122;
	cv=none; b=AUhP7lXR+vcZEMfOUsjd+cNXlDJnqktTczL5eAsbi2dWhjmeaU/emEJq4oUCDEUZhrGuy5JZ0gjD2gBO9HCZRsDV+KvwLAKtTYyAkFx5HSZetf/oCie8Ym4w4+Gbn5xcD+q+Ye20fFAQX6+PSu89sFGuA+B1Tm3w2Mf2ZLPaY64rOw7JL+G6MakxFilA8JLbiLuBuiOyeELMMrtQefvq5jNPA9XQINBI3qeuyzIQKCTNOBePUbsBoK39+VKmuOuomaKznrAe7hWmyYblZ0IQgfUJduRXB5BKfP2fJDOZx29gzA5bGkfRY3/7mYj6xtqrUpQLkPmlo5pa2qidSkPiNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758246122; c=relaxed/relaxed;
	bh=5F2mu+HPJmOD+g9xW2Kjsqxc2iUpO4ZGC562yuztetI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DUjZU02MRkZJwqA+DZODf0unxyDqOKE2O3i/KP8uBGobhPcVMbyVMSs9ePr+aSG26FfA6TS9U80gHaVyuraov4jH8vDenzMkKFr9PdoJdG7JLhISEI7GDR2gbGlABXNtvKdwPS0JzpVL9/ElTGm8nCdheAwUvDvw7jFt3tKOreTn2Awk5rFlowZx3NCvNAA7Mube/Z85duTEeQurW9BYnGNw+eSIopnMSw4V659uCy6Qwpa3fWf6hwBGDaeP/lI6KiU8zTXQ5fqLYSjTNzpFEeDIFzvjA3PZQlbyzKmA7um7MPup0RQaV0m5XaPq5ufkVRC2wQIJ4w9h0oFyfLfoGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=HshGbMEH; dkim-atps=neutral; spf=pass (client-ip=115.124.30.132; helo=out30-132.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=HshGbMEH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.132; helo=out30-132.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSZxN3rW7z2yys
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 11:41:59 +1000 (AEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1758246115; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=5F2mu+HPJmOD+g9xW2Kjsqxc2iUpO4ZGC562yuztetI=;
	b=HshGbMEHaqXn/WUJSD8VGo5/avZyhn4JyiAMahWOPN/R4aHDtNlvXfEahnvJlPZRFjkjardOj9cIRxynGoz2eyUUsegJ7Rx+RuMU7XaxYEajpA3YGgGACND3ySYEMYc/E5sdfvPJBdWxIScldEO+Ps/WUdIxlwHOxVFOO8fBvsk=
Received: from 30.246.178.33(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WoHzP3E_1758246112 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 19 Sep 2025 09:41:53 +0800
Message-ID: <47b52f6f-d27d-49bc-a999-382441aa310e@linux.alibaba.com>
Date: Fri, 19 Sep 2025 09:41:52 +0800
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
Subject: Re: [PATCH v5 3/3] PCI/AER: Report fatal errors of RCiEP and EP if
 link recoverd
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: bhelgaas@google.com, mahesh@linux.ibm.com, mani@kernel.org,
 Jonathan.Cameron@huawei.com, sathyanarayanan.kuppuswamy@linux.intel.com,
 oohall@gmail.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20250918203315.GA1920702@bhelgaas>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20250918203315.GA1920702@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



在 2025/9/19 04:33, Bjorn Helgaas 写道:
> On Wed, Sep 17, 2025 at 02:33:52PM +0800, Shuai Xue wrote:
>> The AER driver has historically avoided reading the configuration space of
>> an endpoint or RCiEP that reported a fatal error, considering the link to
>> that device unreliable. Consequently, when a fatal error occurs, the AER
>> and DPC drivers do not report specific error types, resulting in logs like:
>>
>> 	pcieport 0015:00:00.0: EDR: EDR event received
>> 	pcieport 0015:00:00.0: EDR: Reported EDR dev: 0015:00:00.0
>> 	pcieport 0015:00:00.0: DPC: containment event, status:0x200d, ERR_FATAL received from 0015:01:00.0
>> 	pcieport 0015:00:00.0: AER: broadcast error_detected message
>> 	pcieport 0015:00:00.0: AER: broadcast mmio_enabled message
>> 	pcieport 0015:00:00.0: AER: broadcast resume message
>> 	pcieport 0015:00:00.0: pciehp: Slot(21): Link Down/Up ignored
>> 	pcieport 0015:00:00.0: AER: device recovery successful
>> 	pcieport 0015:00:00.0: EDR: DPC port successfully recovered
>> 	pcieport 0015:00:00.0: EDR: Status for 0015:00:00.0: 0x80
> 
> When you update this series, can you indent these messages with two
> spaces instead of a tab?  That will preserve a little space and also
> preserve the formatting when "git log" adds its own indentation.


Sure, will align with space.

Thanks.
Shuai

