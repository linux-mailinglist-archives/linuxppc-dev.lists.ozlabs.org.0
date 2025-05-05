Return-Path: <linuxppc-dev+bounces-8277-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14637AA8B63
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 May 2025 06:03:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZrSYH5g4rz2xqD;
	Mon,  5 May 2025 14:02:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746417779;
	cv=none; b=Hs4BoVX6hbH4037hHkxQU8VlZEPU+WO1c94HTz3AhsgYOFeOuedN/zJO742JxH4yomtP3YhcNa4dtR5dAGkOIdDz70w/nZO2LUZAzUW6T/La6Rlg4JCy6YrSL55ljECbRO2+Jyw3TfuRdwUYaf7xup39hyf44Zz9p75A3aMo3Ucyom9x/duT2xr1OQxgAvfxw0fRQfhivi2EOCGAsH1cDq+QWfPYVzM/l05WQBzti8am/Te1Xf94z7JFUfSew/wyXHY91AocRFHXT7v8ZLkqbr1qP4eMz7wAluf6Agv/Mr6fUQtGHmcpLV4/mpvFHgpjSnRxWAsOtyJOaz/51CnLqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746417779; c=relaxed/relaxed;
	bh=CozjIKxbf8eHl86evTFP43PyS7GDovRxQk/b/4pkDiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VLCoa6TC93PtRTrf7nhOEgsAPlbBKbLXfd8dEmoNypKuoZVmvA9urGK0zDai6HAUXVL/78mlp2UzKK8anvblrtTRHjMty7Kk4Kw+fl65dJ9JCO0Fl5wcW9+u8v5l3SZOZqZZw2P7mNCg9KuQdefMedSRYiXOjGza/pERtjd6Wo4KJ5PRrawMTQCXNkshuGzmIwhDie+Ovyavzc8FbHc6Nhub6jpM1cJ+OfETjpPzadpClUGOIi6kXo9Q5O65DcxRkbcGK+n+oh/VivN0NnJb5/gTO8m38BsWEFzB2IowTJA1pUrtBBiO+gX5IPE7iWz7l67syMMFyeC8s8kzCNRQRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CAQXVsOg; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CAQXVsOg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZrSYG3F2Vz2xd4
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 May 2025 14:02:57 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544L3qtQ030478;
	Mon, 5 May 2025 04:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=CozjIK
	xbf8eHl86evTFP43PyS7GDovRxQk/b/4pkDiA=; b=CAQXVsOgkbSON0sKW5cWYD
	komiMGmwrdZxuiaqtwk9hshZxoMgZxmCjM8Pdom/eXstawB6gCnCuv6hPHC1g20Q
	zWAk+8IaNKnufJoajflGSm4jCRbQn0/DDOXjARkyUeJ4BKJCeUVGvi39ApzIO5xr
	0xGq0Pw9FrdyjnZKIIVUQo+dKwgTsH+gol0TvofSqueWInjzaYhV16gLpcjL/H5E
	b2nHVpsqazu3kuiVqoYyPP3RL/Ogz8IgD2eQHchMPF9fdvIfpLTnIlpdWbkHjGCU
	E8bLyiDUjAsWv7WAtR5s7g2IJl/Xc7AyOMQoIWtzKN18R1u68xTSaMRgTwBlGWlw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46eftkgyu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 04:02:41 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54541feH017048;
	Mon, 5 May 2025 04:02:40 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46eftkgyu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 04:02:40 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5453M6bw002729;
	Mon, 5 May 2025 04:02:39 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46dxfnmgr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 04:02:39 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54542Z1o34210410
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 04:02:35 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 45D7220040;
	Mon,  5 May 2025 04:02:35 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BDDD220043;
	Mon,  5 May 2025 04:02:32 +0000 (GMT)
Received: from [9.109.215.252] (unknown [9.109.215.252])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 May 2025 04:02:32 +0000 (GMT)
Message-ID: <77b4129d-f975-495b-a837-4393bc0d515e@linux.ibm.com>
Date: Mon, 5 May 2025 09:32:31 +0530
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
Subject: Re: [PATCH v2 6/6] powerpc: sysdev: use lock guard for mutex
To: Srikar Dronamraju <srikar@linux.ibm.com>
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, mpe@ellerman.id.au, peterz@infradead.org,
        fbarrat@linux.ibm.com, ajd@linux.ibm.com, mahesh@linux.ibm.com,
        oohall@gmail.com, hbathini@linux.ibm.com, dhowells@redhat.com,
        haren@linux.ibm.com, linux-kernel@vger.kernel.org
References: <20250314114502.2083434-1-sshegde@linux.ibm.com>
 <20250314114502.2083434-7-sshegde@linux.ibm.com>
 <aBIhMiNTpu6t8Hej@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <aBIhMiNTpu6t8Hej@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAzMyBTYWx0ZWRfX8wPVefHHLq5/ G4jx+eC3sxdDH4Zd2mVMcqZKTwUfrVOyAZ/KM21EBbrmDtEtDWXLvgGXRVbv7QAc3ESoMWnSG4j BePS61p46Zv8k26c5a+76uB0CxsLMa3dfeRZQTgEt3tUCvFHkN9P9JD7eyslXAicra+fvyAJlIl
 PcrwRRjKcDa+uHWhP7HpueYq6VjnaI5FQyFIYvkxjqk4ZzHokDIOjw3/n/vP1dl86IDK9YdZc52 N2cqKOm6KP9OSz3rOXGwMXy2sL+BeWc20MBedvZmRsmYf8bIbmUhut+OVa0st5WCWUxHGKdyUaN xFex1MzUsyfq0n8GnwyGz0qGGVxKuUI7b2BuF4QVCt1SQoh70SKWPxzpj9DXczVM+rc0q16jIrc
 epdsKhDwVC7G9gRiMIA57U6O5qq0cBu96Cm7Jbnza7gCzMiiy2qKbJEx2MGxNL5r6KvRVVTU
X-Proofpoint-GUID: CvdJ1bNgkQN9oHq0EXTDlr_-DyKp2gFD
X-Authority-Analysis: v=2.4 cv=Q7vS452a c=1 sm=1 tr=0 ts=68183861 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=VnNF1IyMAAAA:8 a=hxR3HYdLQCKF7G9SLD8A:9
 a=QEXdDO2ut3YA:10 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: A3lRK_A8S7woU98tJosiXyNIIWeChrJY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050033
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org








Hi





On 4/30/25 18:40, Srikar Dronamraju wrote:
> * Shrikanth Hegde <sshegde@linux.ibm.com> [2025-03-14 17:15:02]:
>

Hi Srikar.

>> use guard(mutex) for scope based resource management of mutex
>> This would make the code simpler and easier to maintain.
>>
>> More details on lock guards can be found at
>> https://lore.kernel.org/all/20230612093537.614161713@infradead.org/T/#u
>>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>>   arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c | 8 +-------
>>   1 file changed, 1 insertion(+), 7 deletions(-)
>>
>> diff --git a/arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c b/arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c
>> index ce6c739c51e5..bbfc7c39b957 100644
>> --- a/arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c
>> +++ b/arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c
>> @@ -75,7 +75,7 @@ static ssize_t fsl_timer_wakeup_store(struct device *dev,
>>   	if (kstrtoll(buf, 0, &interval))
>>   		return -EINVAL;
>>   
>> -	mutex_lock(&sysfs_lock);
>> +	guard(mutex)(&sysfs_lock);
>>   
>>   	if (fsl_wakeup->timer) {
>>   		disable_irq_wake(fsl_wakeup->timer->irq);
>> @@ -84,14 +84,12 @@ static ssize_t fsl_timer_wakeup_store(struct device *dev,
>>   	}
>>   
>>   	if (!interval) {
>> -		mutex_unlock(&sysfs_lock);
>>   		return count;
>>   	}
> 
> Nit: Here and the next change, due to the current change, there is no need
> for curly braces.

Ok. will fix it next version.

> 
> Other than this nit looks good to me.
> 
> Reviewed-by: Srikar Dronamraju <srikar@linux.ibm.com>

Thanks for the reviews.

> 


