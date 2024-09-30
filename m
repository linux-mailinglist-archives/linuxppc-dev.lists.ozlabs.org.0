Return-Path: <linuxppc-dev+bounces-1687-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B415989D8E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2024 11:02:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHFT71H4zz2yF6;
	Mon, 30 Sep 2024 19:02:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727686954;
	cv=none; b=FAUFsCD8/2m2oivKO2xeAhFrjQA9We8BFjodSk1TiJUcUxrQOCF/aFeuTF3Uxv2WeoY3C8p9HAicZ5DbDvLqpuWF9Rxd1avqpam0kLts8jwJV4Kg8+l5cK30uPBH/qmmYO6lAHWckOu/xD2UQsC3MW0QW8hJpaTLj77BDXFh2Z2rJNmujCPPkB80nS+zHOvke0Ihh8aaHzwVzW+dD9iPjKPPu9zdobVYHqD9Vj+m3IjHkpVS+jsVQ6OHBafEdBUg50SEfXlj3AFgITqawEnMjxNQkKBgJbceKU5tIRqaJfu2XkrpguJkgc6drf6kPgqocB6k+Gy8C4t697eUYqN3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727686954; c=relaxed/relaxed;
	bh=lVlxT0GJLndyn7+igP+7gUidHJ3IaRTzcYPImY4JgsE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VAUGj0KU/LzFmQpRXnW69oreRzFCZGKXc7CDOx1zvfgdzOx6X7hjg9m7thHy9b99STfKJeJZvJHir+t+1QTqhntFFQaAjxFskIOLos+WW5zzxUgiqXJonf7Pmakxuwm35fadFYwOcte95mQBim+q1McbPW3xUtpEEC2kdmC6f90lMYDU5LT4HdUHMwAm6DSOx1KtsY9EclghU2y3XnNJUb3q+KUcAknzHXYMlXKPN9L8mR7qtgLre6d5rpCDi7TUFHMSmsk46GaDA4xxYsGmAkCGP0w7RCcN38Etap+PvwY8ynrbVAlOZ3ktXUq+sMHvAZw+Y/xeIElzCpVWNJ7i8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kTcWnYNH; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kTcWnYNH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHFT54LRlz2xnS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2024 19:02:32 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48TKPMA0012820;
	Mon, 30 Sep 2024 09:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	lVlxT0GJLndyn7+igP+7gUidHJ3IaRTzcYPImY4JgsE=; b=kTcWnYNHp8gnh16o
	Ty3Gk1RzrFko8SwYrAxII0+eGQHoQLuYVIHQNGsgCLGrBM1Q/LcqQAuoKXhs2yZQ
	nURnKrhHN8lsOt3r5OtI2WViTBJQ+uurMg9LkriPHQN5iEUE7MQn2ZXxanZv+Zim
	FalteOepo2hKNVRQiaSegU+rHH6pxE9GRQI4zMdlBYm7TRWctg+OeYw2BQ5nLAf7
	j+/9bUVkcBk+TSXQSKgKEdXzSn+ZX0/OL38dFcST6Az2BtxyxJUOGRi0oo0LkM9n
	RAwVnxINW/owNbi0b9B5TzQXPDfmaZZXNmw/JnznTpHWswMPkiXFmfPbdwa8Zn5y
	Io1omw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41x9hb0t0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 09:02:00 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48U8u1vL005156;
	Mon, 30 Sep 2024 09:02:00 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41x9hb0t0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 09:02:00 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48U71x3t007947;
	Mon, 30 Sep 2024 09:01:58 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41xvgxnsf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 09:01:58 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48U91wc439649908
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Sep 2024 09:01:58 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B91658043;
	Mon, 30 Sep 2024 09:01:58 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A0EF5805D;
	Mon, 30 Sep 2024 09:01:54 +0000 (GMT)
Received: from [9.43.67.79] (unknown [9.43.67.79])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 30 Sep 2024 09:01:53 +0000 (GMT)
Message-ID: <67db60e6-8f61-4907-8a7c-93cd0d4cb034@linux.ibm.com>
Date: Mon, 30 Sep 2024 14:31:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/kexec: Fix the return of uninitialized variable
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Zhang Zekun <zhangzekun11@huawei.com>, mpe@ellerman.id.au,
        npiggin@gmail.com, naveen@kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: chenjun102@huawei.com
References: <20240930075628.125138-1-zhangzekun11@huawei.com>
 <37ee3c12-8a88-45ca-a70b-72af504e0d2b@csgroup.eu>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <37ee3c12-8a88-45ca-a70b-72af504e0d2b@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lalvqWfzitwKONwK-mwgb6uoZz8ZZSNP
X-Proofpoint-ORIG-GUID: 55aDVVye_-nL0gHPajFNRFrMXiFuFVZl
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-30_08,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 clxscore=1011 suspectscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=984 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409300063
X-Spam-Status: No, score=0.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 9/30/24 1:57 PM, Christophe Leroy wrote:
> 
> 
> Le 30/09/2024 à 09:56, Zhang Zekun a écrit :
>> [Vous ne recevez pas souvent de courriers de zhangzekun11@huawei.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
>>
>> The of_property_read_u64() can fail and remain the variable uninitialized,
> 
> Replace "remain" by "leave".
> 
>> which will then be used. Return error if we failed to read the property.
> 
> Rewrite to avoid "we".  For instance "Return error if reading the property failed"
> 
>>
>> Fixes: 2e6bd221d96f ("powerpc/kexec_file: Enable early kernel OPAL calls")
>> Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
>> ---
>>   arch/powerpc/kexec/file_load_64.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
>> index 9738adabeb1f..dc65c1391157 100644
>> --- a/arch/powerpc/kexec/file_load_64.c
>> +++ b/arch/powerpc/kexec/file_load_64.c
>> @@ -736,13 +736,18 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
>>          if (dn) {
>>                  u64 val;

Instead cant we init val as -1 ??
Why to add check?


>>
>> -               of_property_read_u64(dn, "opal-base-address", &val);
>> +               ret = of_property_read_u64(dn, "opal-base-address", &val);
>> +               if (ret)
>> +                       goto out;
>> +
>>                  ret = kexec_purgatory_get_set_symbol(image, "opal_base", &val,
>>                                                       sizeof(val), false);
>>                  if (ret)
>>                          goto out;
>>
>> -               of_property_read_u64(dn, "opal-entry-address", &val);
>> +               ret = of_property_read_u64(dn, "opal-entry-address", &val);
>> +               if (ret)
>> +                       goto out;
>>                  ret = kexec_purgatory_get_set_symbol(image, "opal_entry", &val,
>>                                                       sizeof(val), false);
>>          }
>> -- 
>> 2.17.1
>>


