Return-Path: <linuxppc-dev+bounces-4482-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 980449FCAF4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Dec 2024 13:28:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YJnx32M7mz2yNP;
	Thu, 26 Dec 2024 23:28:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735216135;
	cv=none; b=nV0EcTUKyfGr/AOkyOGbw9YwESHTnqVbBRm9QmOtyLqTfkmS9+IpR43zZ95VmsL3FCR9xUGmV2YdFwvbaFntPz2TnoTnLi74RzgZhzVbnBnH3L8e+ibPh3mSYOpMcV1pRo995E0zzD4S4a0yJ2C0aO7PCMoiinwQVc6jJQbTkhx3balTJkN6jFX5XPShOxI42cnp5Gb6orMUKab0EDw1tMDqL+UiWCiZ+n3b+h4GhOsKIoWPAZUaOCEMowW3TV6GQGK/Im410REouySinEwnFphQZv10LUE7LGUsn+s14U2D+G08Z1D43jGfHqDZeO9sAbmVeM2R871vgKad1qrBQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735216135; c=relaxed/relaxed;
	bh=+zwpLnjl9L3WRLyxVo7AONhy8GcwJmaoi/rjBNSpGfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WvKJI47DW0wnZRRMl4FRaTtK/lZ8S7n7Wqg3PYOMkvAeUzJsX136sOuqotfFlRODGi3bpaMhzauwiWlrMUYp+8IAKlVP+wJkSVO4qX8+RcAwadr+aT0xRDCgHpzP8I6AXUuSGrAzuHm92vCSWktbGbRSXVVKhCeSWiml2nukVAy/i+ggD19CxDoYqbxLL3rMnAnEoja7DI7VYg1EoXBwn3PgGhMN7EtwNUlRzSw7zqw18152GLPROvC0OTyClFOtwm/5z2OiFJqdRB0VjvsObvdL3UkCJq/Cw22IW9/DNrTZtJxo/zGEszgHbqLz+uTIWenD1h9S5LbjB2vSd0GMcA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QC/XxmNW; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QC/XxmNW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YJnx16K0Yz2xs8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Dec 2024 23:28:53 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQ85Yft020270;
	Thu, 26 Dec 2024 12:28:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=+zwpLn
	jl9L3WRLyxVo7AONhy8GcwJmaoi/rjBNSpGfo=; b=QC/XxmNWGm9U9Kba8THLNZ
	ut8UYwZnI4JdWOoqRdpqUqxFVB7jvaV/dS2yZGvqDTXB8WHZJ05rcV9e4jqQ1ubh
	1dtBaMIsdEEk1Tg3jc6ZbAPCiz96qSg5WHrdcVzBK8ccXyY2PVQoQ3Q1DAKx06mf
	Q0NBo65sNixuZAUaRyLhC6WgDYOBeQgpToMAESrAGN7Pgjb/E6mtQJfNatfOjNuT
	Mdk6svKbnZIhS2bC2gFWeQ4ZBZ/EnR3zWB+bBK43Su94Zp4ESf1JTWZ1iNK6LeH6
	Nm76+P3hjXWIc/neP+EhZydLLzm6usUhOyDC51lp2Gi6GFeVvAtyGxDmzDfqiy3Q
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43s3b2rr14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 12:28:10 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQAUg8E010617;
	Thu, 26 Dec 2024 12:28:09 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43p90n9wxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 12:28:09 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BQCS7sU38470100
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Dec 2024 12:28:07 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3E9962004B;
	Thu, 26 Dec 2024 12:28:07 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC20620040;
	Thu, 26 Dec 2024 12:28:01 +0000 (GMT)
Received: from [9.124.219.96] (unknown [9.124.219.96])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 26 Dec 2024 12:28:01 +0000 (GMT)
Message-ID: <04c9757c-98e9-4c5d-9759-8a9ac9d6a803@linux.ibm.com>
Date: Thu, 26 Dec 2024 17:58:00 +0530
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
Subject: Re: [PATCH v10 0/4] Support SMT control on arm64
To: Yicong Yang <yangyicong@huawei.com>
Cc: yangyicong@hisilicon.com, linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
        linux-kernel@vger.kernel.org, morten.rasmussen@arm.com,
        msuchanek@suse.de, gregkh@linuxfoundation.org, rafael@kernel.org,
        jonathan.cameron@huawei.com, prime.zeng@hisilicon.com,
        linuxarm@huawei.com, xuwei5@huawei.com, guohanjun@huawei.com,
        catalin.marinas@arm.com, will@kernel.org, sudeep.holla@arm.com,
        tglx@linutronix.de, peterz@infradead.org, mpe@ellerman.id.au,
        linux-arm-kernel@lists.infradead.org, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, pierre.gondois@arm.com,
        dietmar.eggemann@arm.com, "Nysal Jan K.A." <nysal@linux.ibm.com>
References: <20241220075313.51502-1-yangyicong@huawei.com>
 <d0e73e64-cdf7-443b-a8e3-7c1f25533000@linux.ibm.com>
 <a9e19d83-cfc4-910c-7bca-b2dd17647c5f@huawei.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <a9e19d83-cfc4-910c-7bca-b2dd17647c5f@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RnwgPUKSd5jtFDJmCXbPrRtXbk406JvN
X-Proofpoint-ORIG-GUID: RnwgPUKSd5jtFDJmCXbPrRtXbk406JvN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxlogscore=935 clxscore=1015 impostorscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412260107
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 12/26/24 17:20, Yicong Yang wrote:
> On 2024/12/26 17:23, Shrikanth Hegde wrote:
>>
>>
>> On 12/20/24 13:23, Yicong Yang wrote:
>>> From: Yicong Yang <yangyicong@hisilicon.com>
>>>
>>> The core CPU control framework supports runtime SMT control which
>>> is not yet supported on arm64. Besides the general vulnerabilities
>>> concerns we want this runtime control on our arm64 server for:
>>>
>>> - better single CPU performance in some cases
>>> - saving overall power consumption
>>>
>>
>> EAS is disabled when SMT is present.
>> I am curious to know how power saving happens here.
> 
> EAS shouldn't work on non-asymmetic systems, so it's not the case here.

Ok. so this is a symmetric system then?

> System wide power consumption comes down from the CPU offlining here.
> 

Ok. So SMT is enabled by default and then at runtime disable it to save 
power by off-lining the sibling threads?


Note: When enabling SMT, current behavior differs when a core is fully 
offline on different archs. You may want to see which is behavior you 
need in that case. i.e either online or skip.

PowerPC change where we are skipping a fully offline core.
https://lore.kernel.org/all/20240731030126.956210-1-nysal@linux.ibm.com/

> Thanks.
> 
>>
>>> This patchset implements it in the following aspects:
>>>
>>> - Provides a default topology_is_primary_thread()
>>> - support retrieve SMT thread number on OF based system
>>> - support retrieve SMT thread number on ACPI based system
>>> - select HOTPLUG_SMT for arm64
>>>
>>> Tests has been done on our ACPI based arm64 server and on ACPI/OF\
>>> based QEMU VMs.
>>>
>> .


