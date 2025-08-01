Return-Path: <linuxppc-dev+bounces-10510-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D53B183EE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Aug 2025 16:35:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4btpQ81D0Dz2yfL;
	Sat,  2 Aug 2025 00:35:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754058912;
	cv=none; b=FVIbrlQNfDsIDNGEUIvhdZbbk0Q9HMO8+YdaWG2WqO96MvrQA+G1F95ituwA+O9V31G9giizNj3YFe52p/2q0RvdbyOK0Cy5ky2+fanUq24jL1ObOUmTWje6t9qF9VRWwGCqlkh/O8dH2P2OXe2QeKR9qeRp0AVprbXJjz45qBcuE6Ck7Mabsmuby879hN0CZ+NPJYl6YfKJXLchkuhmsHrWfGSQYkvu87IM9GGnOxwtEcak1jTaOctEvsuCWj4o7HHMYfFcj/RyTbc0hgv8yLnyrzSxGRm94qJEZi5o80F4lFkyKcrYNuiEbxuPxl6SCPpZch2OBmhsG0fzPJweOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754058912; c=relaxed/relaxed;
	bh=0Fh54UwRV2BtBP8uMeZ/klACHAuZ+qlHEHSV5od96Mw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eFpxlB8dkE+XN8x9Mwql1gcsqX8OD7O74MsymlWlujFw7VOIqprKxS5SIxoEggAo3IBjCKXidepsYUpOyEMLzsMj67ykH5kkpTMiPmMKpPDpU3VqWhjvnO0JHaPKJzt7AxPWBjqNval80wl7H/ywR1W+Kqa3OgQivMhOGSMBV6EXxgjFIQTYG8fSPqQnkwF6tQf2g5y0QOV9V3awLQowvfQZNef+IcJHegmDSrBMl+q3V1Z1tvDihdCaIEMgrCjpDEZB0uXRIBgBBUMX1kkGILCqSQQ8RK/mHYFGKdGhoOCmjKRAEAW5s74w5+oFUmXcDhgt7eHrilYkDUMlGuYYxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aENFPpjm; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aENFPpjm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4btpQ62q3Pz2xHY
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Aug 2025 00:35:10 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5716IvOJ015303;
	Fri, 1 Aug 2025 14:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=0Fh54U
	wRV2BtBP8uMeZ/klACHAuZ+qlHEHSV5od96Mw=; b=aENFPpjmI6dFI7fwlcsV5G
	5FTKYKVqlYru1SIt62pXoEPDXDJ9Va6pRmTie9F6ZXX2GO8yrBRFJ57P9HGXq3nu
	E4w603Dnmsk7m6KRuP7L6xF5CjH+wQBVO/BCgBXB97YkCovMwSnWj595zPK5t8Cj
	7h6PZoW3O9a76W9RMIMZSoYvdyw0aYPlphYo7inluGfLgHuQS/N5UUorUiPhbZI3
	1uYnXLjUB8DCAF2jsfg7CpVx1xu77+8F4Yn1NOoHUtFH9tBGSRz64O0g0Pt9Atqm
	csV5e6OaPyCqpHwnNE6rAAV0znAd8qbBB7klcc9Ce3yUr2X2ELazeWNYQUrKK18g
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 484qfr978n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 14:34:46 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 571ENkjn023507;
	Fri, 1 Aug 2025 14:34:45 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 484qfr978h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 14:34:45 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 571EJQiM006269;
	Fri, 1 Aug 2025 14:34:44 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 485bjmhk47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 14:34:44 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 571EYZ2D8848086
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 1 Aug 2025 14:34:35 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5A26C58056;
	Fri,  1 Aug 2025 14:34:42 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2852E58052;
	Fri,  1 Aug 2025 14:34:41 +0000 (GMT)
Received: from [9.61.166.13] (unknown [9.61.166.13])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  1 Aug 2025 14:34:41 +0000 (GMT)
Message-ID: <48f22e9a-7212-49f1-8989-128bbc2d6d32@linux.ibm.com>
Date: Fri, 1 Aug 2025 10:34:40 -0400
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
To: GONG Ruiqi <gongruiqi1@huawei.com>, Mimi Zohar <zohar@linux.ibm.com>,
        Roberto Sassu <roberto.sassu@huawei.com>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Eric Snowberg <eric.snowberg@oracle.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>, "Lee, Chun-Yi" <jlee@suse.com>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-integrity@vger.kernel.org,
        keyrings@vger.kernel.org, Lu Jialin <lujialin4@huawei.com>
References: <20250628063251.321370-1-gongruiqi1@huawei.com>
 <eb91dcf034db28e457a4482faa397dd7632f00fd.camel@linux.ibm.com>
 <4c59f417-86cc-4dec-ae45-8fcf8c7eb16a@huawei.com>
 <e8aa7f94-3e52-488d-a858-564d3d1edd4b@linux.ibm.com>
 <362b3e8a-0949-42d1-a1d0-90bd12d86b09@huawei.com>
 <683380bb-ef1b-44ab-b7df-83c23dd76ff7@linux.ibm.com>
 <a8bec841-149c-4349-b7a0-ffebe43dd671@huawei.com>
Content-Language: en-US
From: Nayna Jain <nayna@linux.ibm.com>
In-Reply-To: <a8bec841-149c-4349-b7a0-ffebe43dd671@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwOSBTYWx0ZWRfX+WIeMAV0XBKN
 RaWK1tzAuLZnSdyc9E70QdXieA9k3Jd59+L1Jg5pBMBa2Gm8L+jbYrgFd+OFE46ZuVvqW3TBC2J
 cloJ9fwXRbT+MopZGRTx4sA2AYoAHRwo9ke9Io/O8NkDimxcPl+7CVTsMQB4hVFZqITcrs7qn0K
 YhpEELuU5wPL4n2NULMyHcXz6HBsz4kX8dSJY+Fc9DwEsLWXnv0BdB/9PL2qCT0e11oGyWYMh7j
 nZ6dHp1dZURen/ZYTtin4sirodAqzsYLaaKQArepNpABIvoZJO5jN/lO7q7lYiMFRJZ7Wxm3+Xv
 ZeXodmZDoLaKPsIaMGNTppXcFmfrRmzNt/1AiLp0O0GnsVJ1CSX5Av9/xxtsn3s7yysz0vQ7mlX
 G+XH6WNHilNnhMcgkF1SDCC9xJJ8DLj2S7Um+8e3c6Tb8nW+gIaPe1MGjJGDV9A/xAdEUbT4
X-Authority-Analysis: v=2.4 cv=Je28rVKV c=1 sm=1 tr=0 ts=688cd086 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=BvK2hnnmbDh7ilCDGIwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: OrGcTJJWHdqCDmgNhoqcU4YEqchGXRbd
X-Proofpoint-ORIG-GUID: nLWSheMwDMjNSBon4kmqOoX4VrsiAC_G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 mlxscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010109
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 7/28/25 8:17 AM, GONG Ruiqi wrote:
> On 7/26/2025 2:29 AM, Nayna Jain wrote:
>> On 7/17/25 8:29 AM, GONG Ruiqi wrote:
>>> On 7/8/2025 4:35 AM, Nayna Jain wrote:
>>>> On 7/2/25 10:07 PM, GONG Ruiqi wrote:
>>>>> ...
>>> Yes, IMA_ARCH_POLICY was not set. The testing was conducted on
>>> openEuler[1], a Linux distro mainly for arm64 & x86, and the kernel was
>>> compiled based on its own openeuler_defconfig[2], which set
>>> IMA_ARCH_POLICY to N.
>> Thanks Ruiqi for the response.
>>
>> It seems the main cause of the problem was that IMA_ARCH_POLICY config
>> wasn't enabled; and it sounds like you don't need IMA arch policies but
>> you do need the arch specific function to get the secure boot status.
>>
>> In that case, removing IMA_SECURE_AND_OR_TRUSTED_BOOT config dependency
>> on IMA_ARCH_POLICY config and updating the corresponding help is all
>> that is needed.
> I think it doesn't solve the real problems, which are: 1. the implicit
> dependency of LOAD_UEFI_KEYS to IMA_SECURE_AND_OR_TRUSTED_BOOT, which
> surprises people, and 2. what arch_ima_get_secureboot() does is
> essentially a stand-alone function and it's not necessarily be a part of
> IMA, but it's still controlled by IMA_SECURE_AND_OR_TRUSTED_BOOT.
>
> I agree that adjusting Kconfig could be simpler, but breaking
> IMA_SECURE_AND_OR_TRUSTED_BOOT's dependency to IMA_ARCH_POLICY doesn't
> help on both. If that's gonna be the way we will take, what I would
> propose is to let LOAD_UEFI_KEYS select IMA_SECURE_AND_OR_TRUSTED_BOOT,
> which states the dependency explicitly so at least solves the problem 1.

Hi Ruiqi,

IMA_SECURE_AND_OR_TRUSTED_BOOT is already enabled by different 
architectures. Having LOAD_UEFI_KEYS select it would help only if 
IMA_ARCH_POLICY is also selected.

Thanks & Regards,

    - Nayna


