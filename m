Return-Path: <linuxppc-dev+bounces-3982-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C32229ECBBB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 13:06:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7Z7f687Xz304x;
	Wed, 11 Dec 2024 23:06:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733918766;
	cv=none; b=DzLqjgc2lholkbd2Z1hpsVfRzQ3GeMlYi+nrIOpkyw6oVVs8HnnyC7JQQNPkEZvRCZrw4QjKcsj2hCvNWIrTMwpr/Jyx/eqUmT9o4/7K9+8Gxx/Pkf5olJALxFAMaGMlkSaiYuOx0u/Qa97OiVSc0A6vmsvalCHRqfkTS2jsaSTDm7oQm4K5DUt3UMrdPAH3PHAHkAIUb6vdxmqzv8KgM0H1AvPfzh8Bf28vLMzuEL+AaJrt9Ntkfx2co403EZ4IzmbfCL+WmioY4mdMkTtPN8TFm4TjriYIKD6y/O2md+Ki361bnq2wSyKEbhquKavGdqq9QYljmoq8PHdRsulP6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733918766; c=relaxed/relaxed;
	bh=VuuQaVBjgIREiRO4cc9JGlg08zXjU3JughFoIKiiiH4=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=Ff8ElO7+rBZeF9RcbDb6mNGTmKRt+Nkk7ZNr8stvJEKcjo61E5lFB+1s0eMMxVvwTr0byRmjyd2dZT7tgSKrvjVtW64AhAy9WgARS2l+uh3kMbLEo33iuqp67zv5S+AKlRodJtcaieqWOyrxo2MdE/nqKp36ssaRMU4kWJlwTFWdG6Nn5A/B/svZA2emASHFB7m8pzN02Idvokx/Nk3k6VKfO2DGFfiimGONkPOCw6p8cLYizFHuDk5XAuXpRXaF8p5oh1z3VViSV0OeNXzXggrQm7fa/1iyf8yVxZXFMokc+hV5WS/V1Z37GWGu8B17brRySZ5P/hRHwwNjb8IUqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MrQUm6Fy; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=avnish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MrQUm6Fy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=avnish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7Z7d5D7Yz2yZZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 23:06:05 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBBZO1Z004001;
	Wed, 11 Dec 2024 12:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=VuuQaV
	BjgIREiRO4cc9JGlg08zXjU3JughFoIKiiiH4=; b=MrQUm6FyCMJzFyZVrinsQi
	FqbKCDtrRLj0/qh0K8T8nejqGZ5hWswUSP5ijKwpAof0UqPglaGXV1ZXXO23tkrC
	gCcspKSqHyTmIk/yp9qw6flCkV0zpFFS6qhSe1KoIaQwBqNwrlI1DButRsL6Qdph
	YTi+rdT8IyNiMeCUaKXbYt4rKEvEdQ/NZGKfHQ414S8VrcK2xPU0vkeH51rPmoMS
	eoLhCQa0RqIyMHbD+d057IzuCY7KZNGqxB3xye8zBEETNeuI5gD47ijktyHotc78
	H57hpNEUDlcEYgibYucisoIW3SlkLPAE53IhxPrwMEG19bk8B1HG3XLX+5mYgo1A
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ce0xkvuv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 12:05:56 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB8tT5x016944;
	Wed, 11 Dec 2024 12:05:55 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43d12y9fv5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 12:05:55 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BBC5q9i43581790
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Dec 2024 12:05:53 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B82CE58055;
	Wed, 11 Dec 2024 12:05:52 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 77E0258043;
	Wed, 11 Dec 2024 12:05:52 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.5.196.140])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 11 Dec 2024 12:05:52 +0000 (GMT)
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
Date: Wed, 11 Dec 2024 17:35:52 +0530
From: Avnish Chouhan <avnish@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, brking@linux.ibm.com,
        meghanaprakash@in.ibm.com, sourabhjain@linux.ibm.com,
        maddy@linux.ibm.com
Subject: Re: [PATCH v2] powerpc: increase MIN RMA size for CAS negotiation
In-Reply-To: <87ser05k5z.fsf@mpe.ellerman.id.au>
References: <20241206065545.14815-1-avnish@linux.ibm.com>
 <87ser05k5z.fsf@mpe.ellerman.id.au>
Message-ID: <6bd020f2d62ff62e8ce3fe3bab0de3fe@linux.ibm.com>
X-Sender: avnish@linux.ibm.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bOhP1Cm_y1WWkcEPqatjjmSeCwqqi4Qq
X-Proofpoint-ORIG-GUID: bOhP1Cm_y1WWkcEPqatjjmSeCwqqi4Qq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1011 impostorscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110085
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Michael,
Hope you're doing wonderful!

Thank you so much for your response. I have checked on your queries. 
Please find the findings below:

1. Did you consider just increasing it to 1GB?

We have observed in our recent Out Of Memory issues, a shortage of 
around 50-60 MBs space in RMA in current issues. So we decided to 
increase the RMA by 256 MBs. Please give me couple of days, I'm 
analyzing this 1 GB change and update you on it soon.

2. an LPAR with less than 768MB of RAM

I have analyzed the multiple RAM scenarios. The behavior seems similar 
regardless of RMA size 512 or 768 MBs, as the RMA region is used by PFW 
and GRUB2 for booting. Even if GRUB is able to load the kernel for 
booting, the machines isn't booting and behaving well in low amount of 
RAM. We observe kernel panics, mostly "Out of memory: Killed 
process...." when RAM is less than 3 GBs. The different RAM configs (via 
HMC LPAR properties) and behaviors are given below:

i. RAM (3 GBs)
    System boot fine when RAM is minimum 3 GBs (It does depend on system 
config as well).
ii. RMA (512 MBs)
     With RAM as 512 MB, the system fails to boot with firmware error (eg 
B2006006).
iii. RAM (768 MB and 1 GB)
      With RAM as 768 MB and 1 GB, System boot with kernel panic as 
"Kernel panic - not syncing: System is    deadlocked on memory".
iv. RAM (2 GBs)
     System does boot fine, but abnormal behavior after the boot. I 
observed system panic in one scenario while doing a reboot. "Out of 
memory: Killed process 167....."


Regards,
Avnish Chouhan


On 2024-12-07 07:28, Michael Ellerman wrote:
> Avnish Chouhan <avnish@linux.ibm.com> writes:
>> Change RMA size from 512 MB to 768 MB which will result
>> in more RMA at boot time for PowerPC.
> 
> Did you consider just increasing it to 1GB?
> 
> It's possible there's some folks running LPARs with less than 1GB, but
> they are unlikely to continue doing so by the time this change trickles
> into distros. To be supported modern RHEL requires 2GB minimum RAM
> anyway.
> 
> Can you also describe the behaviour users will see when they configure
> an LPAR with less than 768MB of RAM.
> 
> cheers

