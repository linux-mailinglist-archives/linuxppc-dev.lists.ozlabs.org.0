Return-Path: <linuxppc-dev+bounces-5575-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A66A1CFBA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2025 04:25:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhDMZ5M1Tz2yvs;
	Mon, 27 Jan 2025 14:25:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737948346;
	cv=none; b=dQ+ru1SMsxfLrVWSOYNFE5ibnpVKVW6cV3N/ycZJgsb4VbKXl8Sg+IiC5wKcyyZxqtllhMYSunkpuQjs2kEwKeV4zEMqP2aeFoMDrWKT0XAW7jErp1gP+MvhocPVTB3/g+4WspaxXiLeg6tsg7mnz+N3QWMH8+y2A1h5jU0zZmml7SOj1zXMUCRv6rxusXu2uHi9BncatHqYFrs4erdB8DKIwCkPXTfdDcP1mjOA5Epqqi84TMkvMnnZpqkeDyAgHmqIp5rla8vXEmg09eGJou7kNnJFLAaSo4CA55AhT4wvGoWDau9wNQKf5HCjfVbcIHaJNHroIWN66N78bWZ8Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737948346; c=relaxed/relaxed;
	bh=DaFRN6BHtPyEegbXwc84jzpqB0KhS9hwj7W19/ys0K4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ncy2nKDb67ZFX64IjogtFWSZfcNv/HpKoziZUjueI6QFLdUm9LoFxtvJq/UnIvG+dthMD+kox+qaoEmY3v32bxCMmo5B1yzpljwHHMDIVUaiSW8pmrzNJLX3Ak6n4bHfX2OgRtoCE+oEnD0tn15m0qLMvX+hOCRUiD9Ui2fIerlUf41iGxi9o9biEN0XCp8C2KMzOeyufz3ud3wjsnHfN/4qOBzTCAxYlMTaRlREmpYUyfkgj+0EAMUFf9BqkUTsMmf1tef575e/GZss/6/VIR6sDQCVWw5ef5sZLODBRMPRlMAHv4xaA5U9OBnz6Om3TyngXQD03TvzbCXyPy4QLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o7DuZKbA; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o7DuZKbA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YhDMY3ngFz2xjL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2025 14:25:44 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R19GbQ002169;
	Mon, 27 Jan 2025 03:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=DaFRN6
	BHtPyEegbXwc84jzpqB0KhS9hwj7W19/ys0K4=; b=o7DuZKbAks3Mm0bMPx3cpl
	rM8EmJ3KzQFMA1gcaWYbrrYhExP90xY2QJBu9BfVEkRLGo9WjhKugr/w00/fSuDq
	V7t0FIkqkk4sBGHj3LxhXarhvgUwPI634Cug9oRShmY+HdpaeVss996CbvSw/orv
	QEb7kax/GVhnNbYdCzStc3JyeP1R0Q3bX7R0/gvdjn6NdJdO2zVvmhOBVoYYQJUU
	bAot6zq+veXaUnSX85sAfojZil54J+eKHU4iTMmlInMOWHZlchaLzjsAvmaPZpp5
	sP+U7bqWSyCnu08g/UQEobpACR+uurxZe1j7CCHg3yjigVtMs1vqiSdREm56Yy0A
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44e0798d0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 03:25:35 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50R0B97o018935;
	Mon, 27 Jan 2025 03:25:35 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 44dd0142v8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 03:25:35 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50R3PVUZ45613366
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jan 2025 03:25:31 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 58E26200BB;
	Mon, 27 Jan 2025 03:25:31 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC5A7200B9;
	Mon, 27 Jan 2025 03:25:29 +0000 (GMT)
Received: from [9.109.204.94] (unknown [9.109.204.94])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 27 Jan 2025 03:25:29 +0000 (GMT)
Message-ID: <962804aa-bff5-4f19-8abb-80fd3060ba9c@linux.ibm.com>
Date: Mon, 27 Jan 2025 08:55:28 +0530
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
Subject: Re: [PATCH v3 4/4] Documentation/powerpc/fadump: add additional
 parameter feature details
To: mahesh@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, Avnish Chouhan <avnish@linux.ibm.com>,
        Brian King <brking@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>
References: <20250123114254.200527-1-sourabhjain@linux.ibm.com>
 <20250123114254.200527-5-sourabhjain@linux.ibm.com>
 <meqtpejxbyj447ec3l4fzh4dmcnigwrs7ptkddzu2ajctqfvru@k3cebam5uu57>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <meqtpejxbyj447ec3l4fzh4dmcnigwrs7ptkddzu2ajctqfvru@k3cebam5uu57>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RCRZJo7wAhn-hrxd01s1qTwJl6rK8RJm
X-Proofpoint-GUID: RCRZJo7wAhn-hrxd01s1qTwJl6rK8RJm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_01,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 mlxscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501270022
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Mahesh,


On 26/01/25 17:31, Mahesh J Salgaonkar wrote:
> On 2025-01-23 17:12:54 Thu, Sourabh Jain wrote:
>> Update the fadump document to include details about the fadump
>> additional parameter feature.
>>
>> The document includes the following:
>> - Significance of the feature
>> - How to use it
>> - Feature restrictions
>>
>> No functional changes are introduced.
>>
>> Cc: Avnish Chouhan <avnish@linux.ibm.com>
>> Cc: Brian King <brking@linux.ibm.com>
>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>   Documentation/ABI/testing/sysfs-kernel-fadump |  3 ++-
>>   .../arch/powerpc/firmware-assisted-dump.rst   | 22 +++++++++++++++++++
>>   2 files changed, 24 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump b/Documentation/ABI/testing/sysfs-kernel-fadump
>> index 2f9daa7ca55b..b64b7622e6fc 100644
>> --- a/Documentation/ABI/testing/sysfs-kernel-fadump
>> +++ b/Documentation/ABI/testing/sysfs-kernel-fadump
> [...]
>> +-- Support for Additional Kernel Arguments in Fadump
>> +   Fadump has a feature that allows passing additional kernel arguments
>> +   to the fadump kernel. This feature was primarily designed to disable
>> +   kernel functionalities that are not required for the fadump kernel
>> +   and to reduce its memory footprint while collecting the dump.
>> +
>> +  Command to Add Additional Kernel Parameters to Fadump:
>> +  e.g.
>> +  # echo "nr_cpus=16" > /sys/kernel/fadump/bootargs_append
>> +
>> +  The above command is sufficient to add additional arguments to fadump.
>> +  An explicit service restart is not required.
>> +
>> +  Command to Retrieve the Additional Fadump Arguments:
>> +  e.g.
>> +  # cat /sys/kernel/fadump/bootargs_append
>> +
>> +Note: Additional kernel arguments for fadump with HASH MMU is only
>> +      supported if the RMA size is greater than 768 MB. If the RMA
>> +      size is less than 768 MB, the kernel does not export the
>> +      /sys/kernel/fadump/bootargs_append sysfs node.
> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

Thanks for the review.

- Sourabh Jain

