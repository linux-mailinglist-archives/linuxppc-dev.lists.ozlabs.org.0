Return-Path: <linuxppc-dev+bounces-5622-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF794A20A04
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 12:57:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yj3h41nsYz2yDr;
	Tue, 28 Jan 2025 22:57:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738065476;
	cv=none; b=L3fh8f8IvLgyITVM4X/g6NH8CvJimzgs2pa+wH9Yv7oKR7Zc0V7cTgV1DwxlIzXrhYO345k+Wekzs6PK96ZBsq3z3zxtzBGDN+ZwP+kuFqxEHKDZfKf6L/FIhLXviSfg7lZi6N8Zxab68tsWVANotL5txeRmyMyKHophU5L9Fi7Y/Az0I98b7A6WYhum3/KOW+cWQdwVhXy/msUVOxgQ7hyrU7BrEwC/3F+0a7wk+EMBvvcdWuC72VgFdFC5gvhg0W+QSDaHkFjoSfrxGDjeiekqP9SSeimutizaKb9aYJitY+wx8cv9aCxugQQoviY64pfxYbYc2J2jL6dC/7Xu+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738065476; c=relaxed/relaxed;
	bh=r7X8KGofGjzXyiXmNpCqfsbsuZB60462r6ZQo2dzXl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hUotkhoshGstXYWqRjlwZ4z5gOpZSAIMnC2piOA3SFS08lGV5T2ng7js7w63ptXYEyC8Ti8Xr5uJ5efHdAI15/42jqNuskNLPRVEihwH2AeyxHXVQjsf2l4WcYPVJ7NOy98c9CJEA+1FidP8mNsRmd5FOYev3uZnGmLmc6+gzUz/02B0oBsLCWkVbtrgd7aInGXSQb9zrTquKmeVwD12uDjeWm0yEEXtT+E4TykVr4bQCKYH9yhdAhlts30kfbWlicGRtfgCwgf/HRdav17PSevNt2Mk77P0sOoqbGcurZrGw7FHfOnGtClkPD8KVgC9Sm6Ga6V6Ym1UrnUXqifpNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ayYcsvup; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ayYcsvup;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yj3h30yLlz2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2025 22:57:54 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S7X5hL023185;
	Tue, 28 Jan 2025 11:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=r7X8KG
	ofGjzXyiXmNpCqfsbsuZB60462r6ZQo2dzXl8=; b=ayYcsvupPRKoRP/G+OPys1
	QycJqFRxlExFL71+Y+8MCKAm6S1eALhR9up6ADp3MbVEqBKOshE/ZYtSHJiMqyL5
	tmr2CCEkfCgeCMaAnWbOYrn43csIYdq6hgajcdaDtRWbQQifCae0mL/R2u++ata5
	ogooXpH9EldEpu4pukHkOVBLdOeKtWYstJ6YFhIpqIGCaRfJJaLQ0AOkyLMTdp+e
	ulQ+nD402A07THf8Qw6jVJEamD4nKzuZvkoBm3w/O5OksjGmS1ci+dQFIEFte1+D
	GPJqES0cmvlqnKilTldeOzX14lQd5/w2D0I5G9KrgTIM9LVcpCFyQIPrqekhN+gw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44etxrs2p0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 11:57:45 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50SBs3oD013874;
	Tue, 28 Jan 2025 11:57:44 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44etxrs2nw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 11:57:44 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50S88cr2012444;
	Tue, 28 Jan 2025 11:57:43 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44dany38gc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 11:57:43 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50SBvg2M22282896
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Jan 2025 11:57:42 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 64A8D58055;
	Tue, 28 Jan 2025 11:57:42 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B5505803F;
	Tue, 28 Jan 2025 11:57:38 +0000 (GMT)
Received: from [9.204.206.207] (unknown [9.204.206.207])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 28 Jan 2025 11:57:38 +0000 (GMT)
Message-ID: <27978f31-6b66-4d4c-886b-e2bfb41d5261@linux.ibm.com>
Date: Tue, 28 Jan 2025 17:27:36 +0530
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
Subject: Re: [PATCH v3 4/6] kvm powerpc/book3s-apiv2: Introduce kvm-hv
 specific PMU
To: Vaibhav Jain <vaibhav@linux.ibm.com>,
        Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
        sbhat@linux.ibm.com, gautam@linux.ibm.com, kconsul@linux.ibm.com,
        amachhiw@linux.ibm.com
References: <20250123120749.90505-1-vaibhav@linux.ibm.com>
 <20250123120749.90505-5-vaibhav@linux.ibm.com>
 <40C19755-ABE4-4E23-A75A-1F6F6DDC505A@linux.vnet.ibm.com>
 <87y0ywu2ri.fsf@vajain21.in.ibm.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <87y0ywu2ri.fsf@vajain21.in.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MNESt_Kp7udNeKkgSEzO62Q2Ay1u4sAz
X-Proofpoint-GUID: ENHdIdwhxCCLeW6MK-1CsGIb68TQgiQs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 mlxlogscore=710
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501280089
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 1/27/25 1:06 PM, Vaibhav Jain wrote:
> Hi Athira,
> 
> Thanks for reviewing this patch series. My responses to your review
> comment inline below:
> 
> 
> Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
> 
>>> On 23 Jan 2025, at 5:37 PM, Vaibhav Jain <vaibhav@linux.ibm.com> wrote:
>>>
>>> Introduce a new PMU named 'kvm-hv' to report Book3s kvm-hv specific
> <snip>
>>
>> Hi Vaibhav
>>
>> All PMU specific code is under “arch/powerpc/perf in the kernel source. Here since we are introducing a kvm-hv specific PMU, can we please have it in arch/powerpc/perf ?
> 
> Is it common convention to put PMU specific code in
> arch/powerpc/perf across ppc achitecture variants ? If its there can you
> please mention the reasons behind it.
> 

My concern is about fragmentation. Would prefer to have
the pmu code under perf folder. Secondly, we did handle
module case for vpa-pmu.

Maddy


> Also the code for this PMU, will be part of kvm-hv kernel module as it
> utilizes the functionality implemented there. Moving this PMU code to
> arch/powerpc/perf will need this to be converted in yet another new
> kernel module, adding a dependency to kvm-hv module and exporting a
> bunch of functionality from kvm-hv. Which looks bit messy to me
> 
> <snip>
> 


