Return-Path: <linuxppc-dev+bounces-3907-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 596089EAFC8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 12:23:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6xDT12FQz2y8P;
	Tue, 10 Dec 2024 22:23:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733829785;
	cv=none; b=XogJfCNop3lDcx47UnqDZGVo0waY6AcNABIR1Ek7M5xL1YlamvnJm1tO2KiqvTs5TLATQRATXEG4lQaUmbht8WdGY9jgD2o2b/rmlfKGzkcPTE23optE0HmjskfVjfAz/e5Q05ZZhZZ71tP0VNM8xz7baH/JhpKwbLmO0g6Fy1f1UjLPKUdp/N4cOXSgoPVuTyl2AZP9ZZ4V1tLvxr2SiOoK5gutF35B7mjtlK5jo7yPgtDrjcDD5Jdfk73ypDk7aj6a1hAjoO+kCHGsVyqz2QMdbsfIVSXLJ86nvgUN2adlh6en5BbMiT0S8+m8T+UjUHyF6+sGgLvLH+Pj127JuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733829785; c=relaxed/relaxed;
	bh=3Etygb1S5JD3SBkniCuVFCsMk1p5rd6f1kwfYbyymK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PRMaZBBzCXakaoZ7/vJBaAhzn4fiQ0mTjl7OWGHIzAJycm6GAmDQdzcf79QKjlpkQ+HgEnkRE61RkNVQP69xIg110HXrkHBd4ipAqQ3259EnIP3Rbmgu7+fNWu/ZrxHR9udKt/K398zRBbi5y5f84ptdiNn3CTeUXPawyS31L71xzIDYuXFc4ljybi+4oBjNMzZT//JbTwFTOPuqh3dVU0UC4QiTBYi6FIRDMNJU9Nyrk76NskPnyDKYFOCChaLk5JM1itlP/p7jgSF1W0xxGghbMjNiySn2iwiaer2Co2qpKtQIMFkadF2muVkvDGMVPq2XIfsC0IByqs7r7nHU9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H455Qbf4; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H455Qbf4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6xDR2vWbz2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 22:23:02 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAA5Q7H016921;
	Tue, 10 Dec 2024 11:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=3Etygb
	1S5JD3SBkniCuVFCsMk1p5rd6f1kwfYbyymK4=; b=H455Qbf4KJis+OHkeu7tiT
	HNSnMf8uWPzwoH+ynPjKM9FXQ/jROPkQClL1bymxMZbcHdbfTj5XvvQQVuSaO3Ps
	UaUIDiSHpR2lo/1NYatrgTkYW7WTh7VZp9ve2+xCV5vH//PEw8WH0298K3sknoAJ
	oC+cG6dHWtzu9CiwbHfUcTXT6ZcyjGRsiDn6lRYodJblppJqEOWjVx2Dg8Dgxsul
	UUSyMhWl8uyfm2vASjCkUoQvkivcKUy8TfvbRWoui3FK0q7l1hKW3iDpErYSX3Fj
	NxitZVlT8OLwpXFT3AFnN5Nl4Yu/kczhLc73H/KiXZOvTSyd4njIGPCkZruwexAg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ce38ppns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 11:22:41 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BABMfQA015952;
	Tue, 10 Dec 2024 11:22:41 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ce38ppnp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 11:22:41 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAB04SK016910;
	Tue, 10 Dec 2024 11:22:40 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43d12y3gyb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 11:22:39 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BABMcTn33882460
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Dec 2024 11:22:38 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F30552004B;
	Tue, 10 Dec 2024 11:22:37 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4BE7020040;
	Tue, 10 Dec 2024 11:22:36 +0000 (GMT)
Received: from [9.124.213.130] (unknown [9.124.213.130])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Dec 2024 11:22:36 +0000 (GMT)
Message-ID: <fe858c1c-4941-460c-98b4-7aa18a7830fe@linux.ibm.com>
Date: Tue, 10 Dec 2024 16:52:35 +0530
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
Subject: Re: [PATCH v2 0/2] powerpc: Enable lazy preemption
To: mpe@ellerman.id.au, maddy@linux.ibm.com
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, bigeasy@linutronix.de,
        ankur.a.arora@oracle.com, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
References: <20241116192306.88217-1-sshegde@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20241116192306.88217-1-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qFGp4cZyfHY4VQHUpvHeX1Slqnl1i7tr
X-Proofpoint-ORIG-GUID: DSoq0-uXG7HHhbhJkC-seEbLOJPTlu71
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 malwarescore=0 mlxlogscore=604
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100082
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 11/17/24 00:53, Shrikanth Hegde wrote:
> preempt=lazy has been merged into tip[1]. Lets Enable it for PowerPC.
> 
> This has been very lightly tested and as michael suggested could go
> through a test cycle. If needed, patches can be merged. I have kept it
> separate for easier bisect.
> 
> Lazy preemption support for kvm on powerpc is still to be done.
> 
> Refs:
> [1]: https://lore.kernel.org/lkml/20241007074609.447006177@infradead.org/
> v1: https://lore.kernel.org/all/20241108101853.277808-1-sshegde@linux.ibm.com/
> 
> Changes since v1:
> - Change for vmx copy as suggested by Sebastian.
> - Add rwb tags
> 
> Shrikanth Hegde (2):
>    powerpc: Add preempt lazy support
>    powerpc: Large user copy aware of full:rt:lazy preemption
> 
>   arch/powerpc/Kconfig                   | 1 +
>   arch/powerpc/include/asm/thread_info.h | 9 ++++++---
>   arch/powerpc/kernel/interrupt.c        | 4 ++--
>   arch/powerpc/lib/vmx-helper.c          | 2 +-
>   4 files changed, 10 insertions(+), 6 deletions(-)
> 

Hi mpe, maddy.

I see the lazy scheduling related changes are in powerpc tree.
If there are no objections, can we please add support for lazy 
preemption so it goes through a cycle?

Let me know your thoughts.

