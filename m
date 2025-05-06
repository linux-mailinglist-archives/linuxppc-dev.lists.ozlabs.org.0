Return-Path: <linuxppc-dev+bounces-8357-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E675AACDA1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 21:00:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsSQw1c3Pz305S;
	Wed,  7 May 2025 05:00:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746558056;
	cv=none; b=SLrmoVby/GhN9y84QZNW1vex3khLXAuRujIUj7pepfaAr7HnFTOIKfChSvop08JytSLXOdCL3Z1dLLrZiy6UYZjGCEbdbBlbh3Qjt7PIodmZuFCb6TSRREyvRjwxXM+Hu87s2uV/tdfwGHCE65puZ9LNsL6yYwyJgdG/oz8S5kdmHge38876GVsUoqqH44zGymAiYM4LJbFb3E3twJk5GAgUOwXrqwUo8Fgq1XMR/S2r+wO6tOiHajXwJ5Lptp4aaYTnKfOWOVVZPg3cnyYfbgLJxRhVJkg8ozkxRGgCUwwKbnfLDEScmHOa2evj5WOySFJ/Awevmfu6NibHNWqZrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746558056; c=relaxed/relaxed;
	bh=x/s7JUBoM4k8BGS4+ZvJdmZ3hnp+6iAj7ePq1iDZaA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D2pvVVZ2asLHn9xNgDsY3dMzdsHtO60vRJDZtx/Uzj7uPQDk9YdL5BmNDKYNnxE+4KahXDHZ819TMeqzwReVyzRlpfz4pqRSgyG3kZoJtiW9NSQu1oCcfqmp3/v5D6z+rifVBDI4YyvFfvq25JkEFpLwU+fVOXUzxURIU/c7SpSwH8xP0C+Y31EyajqpT2tJlbxvoPvM679jqSEa+dUy5nOZaCJyNmEWu9Z8VVtZ6fB4APKOvW3cN1LwT0PvBPbsSHNrygmCYTr9R/vha2cLcWyQwTkhL2J8+BXq+P8hi2okqmdYR/ewFh77d5dBXg/y57ViS3+XmufxU5DwAAWHgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rezgzJwn; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rezgzJwn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsSQv28w0z3024
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 May 2025 05:00:55 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546G7o5f005968;
	Tue, 6 May 2025 19:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=x/s7JU
	BoM4k8BGS4+ZvJdmZ3hnp+6iAj7ePq1iDZaA0=; b=rezgzJwnhh/zRcpFhfOr4X
	hFrOcPUBKSXKQs2Zhur13P2HHM/DO97bZHXMsPpiqeHKG9jfv2kLogl2JW7qnrsy
	/OoST9T+CcnRc2TLD6IbDSY1AG3nge/ZOV/Z0fVBo9Q4W5JcsG4x6j2Y3akUKSwE
	x0hKL9WyaZ/Os3FI2BvWDjH+SKf+N0ti6gwBypVdt4b9DoPgKYTPEeoFFGIbL9sL
	GeephmdaFNIA76vc5ZRWBAXBrfOp6sTEGOFFRuxPchyDnjgRT85KG18b9QESZL+k
	GlJpi0oHiO2F4fiH6ohXTibcJ2SxIrCh2N7+L4viX/NHjhFLHVWsYBUozVf55uFw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46fcgy3jdb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 19:00:43 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 546ItxVS010866;
	Tue, 6 May 2025 19:00:43 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46fcgy3jd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 19:00:43 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 546FiVBt004253;
	Tue, 6 May 2025 19:00:42 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46fjb21gc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 19:00:42 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 546J0f2Y27263720
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 19:00:41 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EBF385805C;
	Tue,  6 May 2025 19:00:40 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6189858054;
	Tue,  6 May 2025 19:00:37 +0000 (GMT)
Received: from [9.39.22.34] (unknown [9.39.22.34])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 May 2025 19:00:37 +0000 (GMT)
Message-ID: <6438e933-a234-4fd3-8fc2-cf0a17285e7c@linux.ibm.com>
Date: Wed, 7 May 2025 00:30:36 +0530
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
Subject: Re: [PATCH 3/3] integrity/platform_certs: Allow loading of keys in
 static key management mode
To: Andrew Donnellan <ajd@linux.ibm.com>, linux-integrity@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, zohar@linux.ibm.com,
        nayna@linux.ibm.com, linux-kernel@vger.kernel.org
References: <20250430090350.30023-1-ssrish@linux.ibm.com>
 <20250430090350.30023-4-ssrish@linux.ibm.com>
 <94b81671ec25c305e0cc6a7d2df0c03cce979d0f.camel@linux.ibm.com>
Content-Language: en-US
From: Srish Srinivasan <ssrish@linux.ibm.com>
In-Reply-To: <94b81671ec25c305e0cc6a7d2df0c03cce979d0f.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CnQUdVuvSH1a8grTvHx66mXuPfDXKA2L
X-Authority-Analysis: v=2.4 cv=Pa7/hjhd c=1 sm=1 tr=0 ts=681a5c5b cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=1EPZ4DANQMTxip0FO3oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: DhpailZ_b5KpmNzWsNYx4nPB-iK8CiZw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDE3NSBTYWx0ZWRfXwjFp+3QnEkpT h1d/bVVop76v2/QaEuiNnUYKrPy7pq8faCLN9NUoSqytyAUqPLalgRFIubHmwI0nyEohjeOCiMU Kdlz+Gjbtk3PL12ogHbfaxe/VWturw3NBf86dZsY1azjNI05P2PpoCLI5o3+t1YMPA3hQUhoxma
 tARnr+HriFYlQweSKS3ts7cjq39Q7Gfq7c2H6LL5YYr0Y96Ba2InCh/nLysic/Ezk5NSPdRHIRy AtW7hBBz4GJ0Uojhx/SvIT889wbIHlzYkwdpJ9F/Mf5/S5LZfIQ7fRyxohTKuTyqa8Tc8TbBllt 9tojQY6lz4MkPFJgTqDgdUpJC48yMqyTb+OY6JKN5kkhKU9ozPe7pXKtv92MyBQ+Sdsk/7I8Y0D
 cMrA4yB5tWTGpoKI5BBZ3XY120soM8OVH6elUmqmcvR3GwChCzcCuwStMNem/kbNiJldCUKQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_08,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060175
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/5/25 1:25 PM, Andrew Donnellan wrote:
> On Wed, 2025-04-30 at 14:33 +0530, Srish Srinivasan wrote:
>> On PLPKS enabled PowerVM LPAR, there is no provision to load signed
>> third-party kernel modules when the key management mode is static.
>> This
>> is because keys from secure boot secvars are only loaded when the key
>> management mode is dynamic.
>>
>> Allow loading of the trustedcadb and moduledb keys even in the static
>> key management mode, where the secvar format string takes the form
>> "ibm,plpks-sb-v0".
>>
>> Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
>> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
>> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
Hi Andrew,
Thanks a lot for the review.

Thanks and Regards,
Srish
>> ---
>>   security/integrity/platform_certs/load_powerpc.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/security/integrity/platform_certs/load_powerpc.c
>> b/security/integrity/platform_certs/load_powerpc.c
>> index c85febca3343..714c961a00f5 100644
>> --- a/security/integrity/platform_certs/load_powerpc.c
>> +++ b/security/integrity/platform_certs/load_powerpc.c
>> @@ -75,12 +75,13 @@ static int __init load_powerpc_certs(void)
>>   		return -ENODEV;
>>   
>>   	// Check for known secure boot implementations from OPAL or
>> PLPKS
>> -	if (strcmp("ibm,edk2-compat-v1", buf) && strcmp("ibm,plpks-
>> sb-v1", buf)) {
>> +	if (strcmp("ibm,edk2-compat-v1", buf) && strcmp("ibm,plpks-
>> sb-v1", buf) &&
>> +	    strcmp("ibm,plpks-sb-v0", buf)) {
>>   		pr_err("Unsupported secvar implementation \"%s\",
>> not loading certs\n", buf);
>>   		return -ENODEV;
>>   	}
>>   
>> -	if (strcmp("ibm,plpks-sb-v1", buf) == 0)
>> +	if (strcmp("ibm,plpks-sb-v1", buf) == 0 ||
>> strcmp("ibm,plpks-sb-v0", buf) == 0)
>>   		/* PLPKS authenticated variables ESL data is
>> prefixed with 8 bytes of timestamp */
>>   		offset = 8;
>>   

