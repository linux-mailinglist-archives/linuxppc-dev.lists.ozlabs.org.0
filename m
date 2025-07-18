Return-Path: <linuxppc-dev+bounces-10313-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E545BB098B7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jul 2025 02:05:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjqmx3LDNz30WF;
	Fri, 18 Jul 2025 10:05:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752797121;
	cv=none; b=EPCgI9KH0DRH2P/yVhsKsaakiyISNCEE9Y5pDn15PMGq3OZqmQ89KkePnIA+XGCFTZw+A4uiAr4NCcPri9WjoofWbMQ5x8kXYwuLdm9r6U6JSRmx1jKPSDT9ILU7E94AZVUOEz6tpItWqq5dAfhoVARwqUCY5QEcPoAJuMkr8pteep8ovcdk3ICHGoTWW5OOtvBDfpZ+RDHtDIu/zGXu71aE17eCZ6p4tHBW7hImJ6LKnRsC3JyZaQgCsaJYlc5SMYnSdSPtHYiTnVtw8G3PUz90PUL0ehslzchMMxsq+zt+FcdNbNqC1fg96IQOzY3+1/fgVZWUUjOnh+UGAHzamQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752797121; c=relaxed/relaxed;
	bh=HH/9mXt7gkyzrKXSj6txN9ECfNMdRVxJxuDvf9QCG70=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Kq+Rlexn2xZoqos18U1DmqE+BuhGH7WPHo1AggLLugntXGajmyuQLYWo9+MzOucA7e+QvRHi3GLTGKfV64P7pJD2X33ecmAepyEixFAVppcCDhTwsYzhN718CSDw9qpkcmxPc442FspW6XM9l7LCK7jTq091DyiNHf5kbnY0WIX9jIKVUltmIri4CQgiJYDEpy/fiRTwHKlfnXX8MEioSW3+mtsT0lMgzkysCL8zhmh7L8lgyXGb0I3rA2HRxnOmm0uSFUbjA1xpf21grWbDfVTx8c2vFoUcvOELrnNnanbxdU8p4gc+zM7WavBDwyjFritar3pL+ozg1wf6eOM1iA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=VjdYPlHm; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=VjdYPlHm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjqmt6x7hz30RK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jul 2025 10:05:18 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 02D168285589;
	Thu, 17 Jul 2025 19:05:16 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id joaj3DPirEEm; Thu, 17 Jul 2025 19:05:12 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 39E43828775B;
	Thu, 17 Jul 2025 19:05:12 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 39E43828775B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1752797112; bh=HH/9mXt7gkyzrKXSj6txN9ECfNMdRVxJxuDvf9QCG70=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=VjdYPlHmlBacwsUZm4AkIqdRIbHvyx+3JPKcvOjHoutc761D7ZA51jRKEcrqPLhE9
	 CsOlf/ZlO+CJCsH5X7vjU2K0Nsgoj9flw5in3flUi0hd2q9fsRgeGOzuR6VffvdEec
	 uEyR39exZl4EO6NvYCZNE0yoSQlqG1JypmQkjYts=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 6FN37W4-erl3; Thu, 17 Jul 2025 19:05:11 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id DC84D8285589;
	Thu, 17 Jul 2025 19:05:11 -0500 (CDT)
Date: Thu, 17 Jul 2025 19:05:08 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Timothy Pearson <tpearson@raptorengineering.com>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-pci <linux-pci@vger.kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, 
	christophe leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>
Message-ID: <551742074.1370228.1752797108649.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <20250717232745.GA2662794@bhelgaas>
References: <20250717232745.GA2662794@bhelgaas>
Subject: Re: [PATCH v3 5/6] PCI: pnv_php: Fix surprise plug detection and
 recovery
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC138 (Linux)/8.5.0_GA_3042)
Thread-Topic: pnv_php: Fix surprise plug detection and recovery
Thread-Index: SRr2FJcjkaGgIRkFlhO9QWQJ8V6vhw==
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



----- Original Message -----
> From: "Bjorn Helgaas" <helgaas@kernel.org>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel" <linux-kernel@vger.kernel.org>, "linux-pci"
> <linux-pci@vger.kernel.org>, "Madhavan Srinivasan" <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>,
> "christophe leroy" <christophe.leroy@csgroup.eu>, "Naveen N Rao" <naveen@kernel.org>, "Bjorn Helgaas"
> <bhelgaas@google.com>, "Shawn Anastasio" <sanastasio@raptorengineering.com>
> Sent: Thursday, July 17, 2025 6:27:45 PM
> Subject: Re: [PATCH v3 5/6] PCI: pnv_php: Fix surprise plug detection and recovery

> On Tue, Jul 15, 2025 at 04:39:06PM -0500, Timothy Pearson wrote:
>> The existing PowerNV hotplug code did not handle surprise plug events
>> correctly, leading to a complete failure of the hotplug system after
>> device removal and a required reboot to detect new devices.
> 
>> +++ b/drivers/pci/hotplug/pnv_php.c
>> @@ -4,12 +4,14 @@
>>   *
>>   * Copyright Gavin Shan, IBM Corporation 2016.
>>   * Copyright (C) 2025 Raptor Engineering, LLC
>> + * Copyright (C) 2025 Raptor Computing Systems, LLC
> 
> Just to double-check that you want both copyright lines here?

Yes, both entities ended up sponsoring this part of the work over time.  Thank you for double checking!

