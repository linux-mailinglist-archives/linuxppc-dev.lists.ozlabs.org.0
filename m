Return-Path: <linuxppc-dev+bounces-10424-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCD3B13A53
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jul 2025 14:17:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4brHXz6F4Dz30Nl;
	Mon, 28 Jul 2025 22:17:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.189
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753705043;
	cv=none; b=aXq2VACDqMvMPI17RZqCRJqoMXSr+8WCbuQ0VnDWvLKsZC9mQHGEvjdv7uH66ElIZhyIprXDMxRzaQnnFKov7x5f+8X3+gLrPzo3+KbHLJFANZRdW7O76YMBjJtpDggVRQ8zTEugnA38aCm8T+QmtBWjTvfcE1F6hRF9vfdj0CBrqOZzDWQttT53bURyhRfta7jqe6KWlzQIo8tSW34ku3z+OWe8RN8H+xTnweVE6WNI5Nsc+c4vXplI15vySo8whmUQfV3DWz1k2snqaJorDuy79FtU8+canqoRDxYm+DW3MDX9aThCcxwCLmKfQUHg6F1ilCpNJLZeCiuiqChglA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753705043; c=relaxed/relaxed;
	bh=inZscz3FaGMweZ79cxuFZA4873l4hvFjm90jEC127fM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=I4/TIXxv8oyyMbf2T6bj92W1IMkw2ciKszvGPgj9RHsE9YTvEWG9QzNMprQLqSddA5VBkQC4zFOOuMEZ9W0TGDVKjUgY7Jx2Cwt7IBlRVyJSrOjb/EJycpdklnbQ8n4lkSw7hi69JzqN808Z5yX/0t5PwFjKuvf9/+Q/E+jvDeUV5GvyDneab+eOqcPwiJl9SLXEi3hmEtwaVxDn6HoTfq3zJnNvY0B2s6kAeWZRtYwEq2plFfa3pDi6Br2FKUs0TIzfXjLqhi9tzFHynVZiej4nzRGaW2Fpl0TqKp0mpg50gZB5W4rOIXhEeWV0do8++B8hj9CbRRnu/J2qLaKWbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=gongruiqi1@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=gongruiqi1@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4brHXy3D3lz2xRq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jul 2025 22:17:19 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4brHRw6X1Bzdbw2;
	Mon, 28 Jul 2025 20:13:00 +0800 (CST)
Received: from kwepemg100016.china.huawei.com (unknown [7.202.181.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 939681402EA;
	Mon, 28 Jul 2025 20:17:13 +0800 (CST)
Received: from [10.67.110.48] (10.67.110.48) by kwepemg100016.china.huawei.com
 (7.202.181.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 28 Jul
 2025 20:17:12 +0800
Message-ID: <a8bec841-149c-4349-b7a0-ffebe43dd671@huawei.com>
Date: Mon, 28 Jul 2025 20:17:12 +0800
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
Subject: Re: [PATCH v2] integrity: Extract secure boot enquiry function out of
 IMA
To: Nayna Jain <nayna@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin
	<dmitry.kasatkin@gmail.com>, Jarkko Sakkinen <jarkko@kernel.org>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>
CC: Eric Snowberg <eric.snowberg@oracle.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
	"Lee, Chun-Yi" <jlee@suse.com>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <linux-s390@vger.kernel.org>,
	<linux-integrity@vger.kernel.org>, <keyrings@vger.kernel.org>, Lu Jialin
	<lujialin4@huawei.com>
References: <20250628063251.321370-1-gongruiqi1@huawei.com>
 <eb91dcf034db28e457a4482faa397dd7632f00fd.camel@linux.ibm.com>
 <4c59f417-86cc-4dec-ae45-8fcf8c7eb16a@huawei.com>
 <e8aa7f94-3e52-488d-a858-564d3d1edd4b@linux.ibm.com>
 <362b3e8a-0949-42d1-a1d0-90bd12d86b09@huawei.com>
 <683380bb-ef1b-44ab-b7df-83c23dd76ff7@linux.ibm.com>
Content-Language: en-US
From: GONG Ruiqi <gongruiqi1@huawei.com>
In-Reply-To: <683380bb-ef1b-44ab-b7df-83c23dd76ff7@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.48]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemg100016.china.huawei.com (7.202.181.57)
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 7/26/2025 2:29 AM, Nayna Jain wrote:
> 
> On 7/17/25 8:29 AM, GONG Ruiqi wrote:
>> On 7/8/2025 4:35 AM, Nayna Jain wrote:
>>> On 7/2/25 10:07 PM, GONG Ruiqi wrote:
>>>> ...
>>
>> Yes, IMA_ARCH_POLICY was not set. The testing was conducted on
>> openEuler[1], a Linux distro mainly for arm64 & x86, and the kernel was
>> compiled based on its own openeuler_defconfig[2], which set
>> IMA_ARCH_POLICY to N.
> 
> Thanks Ruiqi for the response.
> 
> It seems the main cause of the problem was that IMA_ARCH_POLICY config
> wasn't enabled; and it sounds like you don't need IMA arch policies but
> you do need the arch specific function to get the secure boot status.
> 
> In that case, removing IMA_SECURE_AND_OR_TRUSTED_BOOT config dependency
> on IMA_ARCH_POLICY config and updating the corresponding help is all
> that is needed.

I think it doesn't solve the real problems, which are: 1. the implicit
dependency of LOAD_UEFI_KEYS to IMA_SECURE_AND_OR_TRUSTED_BOOT, which
surprises people, and 2. what arch_ima_get_secureboot() does is
essentially a stand-alone function and it's not necessarily be a part of
IMA, but it's still controlled by IMA_SECURE_AND_OR_TRUSTED_BOOT.

I agree that adjusting Kconfig could be simpler, but breaking
IMA_SECURE_AND_OR_TRUSTED_BOOT's dependency to IMA_ARCH_POLICY doesn't
help on both. If that's gonna be the way we will take, what I would
propose is to let LOAD_UEFI_KEYS select IMA_SECURE_AND_OR_TRUSTED_BOOT,
which states the dependency explicitly so at least solves the problem 1.

-Ruiqi

> 
> The help text can be updated to:
> This option is selected by architectures to detect systems with secure
> and/or trusted boot enabled, in order to load the appropriate IMA
> runtime policies and keys.
> 
> Thanks & Regards,
> 
>     - Nayna
> 


