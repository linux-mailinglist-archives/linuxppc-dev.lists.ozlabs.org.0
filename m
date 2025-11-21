Return-Path: <linuxppc-dev+bounces-14385-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DC4C7702D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 03:31:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCK3L3WWPz2yG5;
	Fri, 21 Nov 2025 13:31:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.187
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763692286;
	cv=none; b=ZvpNugog3igOR3TyzSwwbsQlEN7P4JNIKxEahIz6DrdWGYwRv4ym8m+TLspfU8ISGhHViR84BHOsNoIYQB+cSISiVUo3JBw1p01a/tNMMAGQW/0IAp1PtE5tTxtuIJktTMey8sbxrskg4Knj/YbgEA1SqSKsCd4kBoUEUpuck1+0jnLWo8Jjx8O7JzLa7e//AlrlWdtEDwPKu22C2mhAZHkr4iQJq6cA8cdN4TA5r8IN8knh7aYWV1ksKUMSFERmWr+YmqwwRp0mR92gLf6GUJ5VvldNs9aWw1aaMYIQt51hXiUlAJxd9H+j4On3E31t2YtDC8QAdfVXrZcdkfyWOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763692286; c=relaxed/relaxed;
	bh=AQS3TZ1si/Ig2wkymXClxgNNI6FTrzeWsHMvwkBCMDg=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=htBDlVuVpbf823nTrVJufB9TSFrpYZAWpCJnUR4hYuWk5l1wyQrIuwgPM9BlrY5qmGSlZK5TRa0zxBcCEIcuK5kQRyXqAqGXhzcw6+h2EB2I/xgPrV1BJKXksGeUEMP7GvfuKFqL1m4uGfSMPo8pTlbyXOdDNT1nJQCBIzEi97wihFWk+DaDTy9Mmo3ufg2yrGrJuM+O/Z9uO4LP8dFWysVXTZqoJTBPJaMuslltOWdicm/JYYLXtqSbypz0V/QYLICOverTMSWYaQq7Oe3a98uN/VmZ7XcRsvIPhqVP4izsnzMqO16Wsq/771YcChsKTQQIkzNF27GjqDvTBO/xXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=u40LWVUi; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=u40LWVUi; dkim-atps=neutral; spf=pass (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=guohanjun@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=u40LWVUi;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=u40LWVUi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=guohanjun@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1140 seconds by postgrey-1.37 at boromir; Fri, 21 Nov 2025 13:31:23 AEDT
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCK3H2jCCz2xQs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 13:31:21 +1100 (AEDT)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=AQS3TZ1si/Ig2wkymXClxgNNI6FTrzeWsHMvwkBCMDg=;
	b=u40LWVUiaHDsbCA01CQYv9znHEwW+kbk7n9CJMnawfy/JqQjuFN1zeEfE52OVPOa1JJU3VvGc
	Af+Zmtn2UuTu37GoOwE5H7E42FZK4NDiMyUtsrwLKtr/EaNCO2dnV7B16f6EPBKaPAC+txl34X2
	rkqy9fpgxCj50OJgmLhLopc=
Received: from canpmsgout12.his.huawei.com (unknown [172.19.92.144])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4dCJcY0tv0z1BFNT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 10:11:41 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=AQS3TZ1si/Ig2wkymXClxgNNI6FTrzeWsHMvwkBCMDg=;
	b=u40LWVUiaHDsbCA01CQYv9znHEwW+kbk7n9CJMnawfy/JqQjuFN1zeEfE52OVPOa1JJU3VvGc
	Af+Zmtn2UuTu37GoOwE5H7E42FZK4NDiMyUtsrwLKtr/EaNCO2dnV7B16f6EPBKaPAC+txl34X2
	rkqy9fpgxCj50OJgmLhLopc=
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4dCJbV65TDznTWW;
	Fri, 21 Nov 2025 10:10:46 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 6C164140119;
	Fri, 21 Nov 2025 10:12:13 +0800 (CST)
Received: from [10.174.178.247] (10.174.178.247) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 21 Nov 2025 10:12:11 +0800
Subject: Re: [PATCH 3/6 v7] acpi/ghes: Make GHES select ACPI_APEI_PCIEAER
To: Jonathan Cameron <jonathan.cameron@huawei.com>, "Fabio M. De Francesco"
	<fabio.m.de.francesco@linux.intel.com>
CC: <linux-cxl@vger.kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Len
 Brown <lenb@kernel.org>, Tony Luck <tony.luck@intel.com>, Borislav Petkov
	<bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Shuai Xue
	<xueshuai@linux.alibaba.com>, Davidlohr Bueso <dave@stgolabs.net>, Dave Jiang
	<dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, Vishal
 Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, Dan
 Williams <dan.j.williams@intel.com>, Mahesh J Salgaonkar
	<mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas
	<bhelgaas@google.com>, <linux-kernel@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-pci@vger.kernel.org>
References: <20251104182446.863422-1-fabio.m.de.francesco@linux.intel.com>
 <20251104182446.863422-4-fabio.m.de.francesco@linux.intel.com>
 <20251111154220.00004767@huawei.com>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <19155ced-8702-71f9-6eba-4dbfdc7c88ad@huawei.com>
Date: Fri, 21 Nov 2025 10:12:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
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
In-Reply-To: <20251111154220.00004767@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.247]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025/11/11 23:42, Jonathan Cameron wrote:
> On Tue,  4 Nov 2025 19:22:34 +0100
> "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com> wrote:
> 
>> GHES handles the PCI Express Error Section and also the Compute Express
>> Link (CXL) Protocol Error Section. Two of its functions depend on the
>> APEI PCIe AER logging/recovering support (ACPI_APEI_PCIEAER).
>>
>> Make GHES select ACPI_APEI_PCIEAER and remove the conditional
>> compilation from the body of two static functions that handle the CPER
>> Error Sections mentioned above.
> 
> Hi Fabio,
> 
> I'm not seeing a justification here for the change and there may be
> APEI platforms without PCI support.  So is this just to simplify things or
> is there a functional reason that it is necessary?

I have the same worry, embedded system with ACPI support may don't have
PCI. And for APEI, AER is one of the error type and optional.

Thanks
Hanjun

