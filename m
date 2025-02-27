Return-Path: <linuxppc-dev+bounces-6536-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CED2AA481FC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2025 15:50:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z3Z4t0hp8z3bpn;
	Fri, 28 Feb 2025 01:50:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740667806;
	cv=none; b=JNqO+AyhTLh5DptNW601l17btc8pZUzpEVGgCwqHfluBY6x5U9LV8AdqTGtwYOdmiOXFBptvQvJSMgLD3TfEc29+9oSPIOpvL5MepeTmatW0sZdSECGTUR77p37+xPMP6mfyKQmwVl0aQ/EYZPPjZCC3FrQHTgOIs/03WLDK4NDkoq7JMPZ7ZdO+aiyozcm0uUXxjoQCfDvHaGkW/WFTbUR2hG6EBR9mPwRIcM3PwHMcSCfn5/Y8ZXhyqwz/WCrAi95xCvtzDOBDUO+gWjVd9DPXclOjFKtZQR/oPm8UCND7Q5NSXYhRELhmh3c3bbCoU2TctzQCWJPhScKGj4ZJMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740667806; c=relaxed/relaxed;
	bh=hQFRPHodhxMJqiRjDyMtrPkuMrxNOL/hTi3fUUY8ogA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k8tfvijUrgI4h31ctWJ1aQSCJFNgC/HII1DwnkF4q4A7CMHY384XPruxbzL19NNBIiIVRufZNNKye4fnQm185eWzgFU2AI/evgOebCQ4GSBU6PN6MMQp5psOpn/CjB2iaxAonhEOH2Vn8UaKo/Z/OqNTOsfqifCoZRqY3NOuTu+a7bwlPznRzArDxkCulM1kxTbefJXxUxCi8Lrk09H52n1OWq/Yun/3dVPnWnGgyrvcsESmOIaAe7p+y8++cJQm7NRJCDCmgf5yyDfn+oFb3RXtmMM2ZvYJVYr3rX9usCli0TzVpfVXL7BF7V2Pyy0VCusk8lfCYaMbVQ8xCMGPNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z3Z4s1pKsz3bpJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2025 01:50:04 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z3YK96mwzz9sTK;
	Thu, 27 Feb 2025 15:15:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PdWIFlqYCtlL; Thu, 27 Feb 2025 15:15:41 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z3YK36WdMz9sSr;
	Thu, 27 Feb 2025 15:15:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CC23B8B78B;
	Thu, 27 Feb 2025 15:15:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id MJ5KskemWaxm; Thu, 27 Feb 2025 15:15:35 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 72F768B77C;
	Thu, 27 Feb 2025 15:15:35 +0100 (CET)
Message-ID: <c68287f7-ad00-46fc-a92e-06e0c9074139@csgroup.eu>
Date: Thu, 27 Feb 2025 15:15:35 +0100
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
Subject: Re: [next-20250226]Build Failure
To: Michael Kelley <mhklinux@outlook.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Kees Cook <kees@kernel.org>
References: <adbe8dd1-a725-4811-ae7e-76fe770cf096@linux.vnet.ibm.com>
 <20250227123804.5dd71cef@canb.auug.org.au>
 <14193c98-fb30-4ee8-a19a-fe85d1230d74@csgroup.eu>
 <SN6PR02MB4157A0C1B4F85D8A289E5CE9D4CD2@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <SN6PR02MB4157A0C1B4F85D8A289E5CE9D4CD2@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 27/02/2025 à 15:05, Michael Kelley a écrit :
> From: Christophe Leroy <christophe.leroy@csgroup.eu> Sent: Thursday, February 27, 2025 2:43 AM
>>
>> Le 27/02/2025 à 02:38, Stephen Rothwell a écrit :
>>> Hi Venkat,
>>>
>>> CC Kees Cook for advice.  This is a result of the tests added in commit
>>>
>>>     bbeb38b8487a ("string.h: Validate memtostr*()/strtomem*() arguments more carefully")
>>>
>>> from the kspp tree.
>>>
>>> I note that the comment about memtostr() says "Copy a possibly
>>> non-NUL-term string".
>>
>> Can you tell more about your config and your environment ?
>>
>> I just tested with ppc64_defconfig and ppc64le_defconfig, with gcc 12.4,
>> gcc 13.2 and gcc 14.2 and didn't get that build error.
>>
>> Christophe
> 
> FWIW, I see the same build failures related to __must_be_noncstr()
> when building natively on x86 and on arm64. In both cases, it's an
> Ubuntu 20.04 installation with gcc 9.4.0 and binutils 2.34.
> 

Looks like I get that problem only with GCC 8.5 and GCC 9.5.

I don't get it with gcc 10.3 nor 11.3 nor 12.4 nor 13.2 nor 14.2
I don't get it either with gcc 5.5 or 7.5

Christophe


