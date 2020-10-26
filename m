Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F9E2989EB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Oct 2020 11:00:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKVhB6ZHkzDqK3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Oct 2020 21:00:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=h79Q3qFN; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKVfW2tyVzDq5f
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Oct 2020 20:58:59 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09Q9WVG0012853; Mon, 26 Oct 2020 05:58:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=VcuUwMtt/J6p1hY+Ejg2Yth/I3T/fJiF8hYLKrLksxo=;
 b=h79Q3qFNjJP/FLu6jd23rJMM4oQ3UbY3aRWQ8rMCk2x07LNvLujoIZtaivf42R0Bp3yP
 W7tC/X0hB+YhhZgnQFNHVTNvgLUSlZRNTQ/QCxNigCMwrUbpAuVmuACrwA4VS7YNwfkF
 XMQFrgYf8R2RTpvesG84xARwqb6zGEA50mKKV5QBjUEj5ZK6w9l4bvHSDiQpFf9/FF5x
 Lv5Czxn19ZqskLUv5I8la11OxZQ/p2iXqkJPo+Ge0kcgQlQDfqyRr4/2Ah6RaWOcOeXo
 nBzCXi0XQKfizAhlgHbrKsJXNzhYBE8fB4+B0FOLzSiKInJ8tAqLhH2MmA+vGkuPwg8C HA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34dcqd9nwc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Oct 2020 05:58:47 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09Q9WjJG013408;
 Mon, 26 Oct 2020 05:58:47 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34dcqd9nub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Oct 2020 05:58:46 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09Q9rIMb010054;
 Mon, 26 Oct 2020 09:58:42 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 34cbw7t2j2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Oct 2020 09:58:42 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 09Q9wdg929295080
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Oct 2020 09:58:39 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CEFF24C04A;
 Mon, 26 Oct 2020 09:58:39 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3FD64C044;
 Mon, 26 Oct 2020 09:58:37 +0000 (GMT)
Received: from [9.199.39.123] (unknown [9.199.39.123])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 26 Oct 2020 09:58:37 +0000 (GMT)
Subject: Re: [PATCH 1/2] powerpc: Introduce POWER10_DD1 feature
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20201020054454.194343-1-ravi.bangoria@linux.ibm.com>
 <87ft66xzm7.fsf@mpe.ellerman.id.au>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Message-ID: <911f16ea-352f-2764-d11b-474f9e8ebffa@linux.ibm.com>
Date: Mon, 26 Oct 2020 15:28:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <87ft66xzm7.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-26_04:2020-10-26,
 2020-10-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2010260066
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: christophe.leroy@c-s.fr, Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 mikey@linux.ibm.com, jniethe5@gmail.com, npiggin@gmail.com,
 maddy@linux.ibm.com, paulus@samba.org, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

>> +static void __init fixup_cpu_features(void)
>> +{
>> +	unsigned long version = mfspr(SPRN_PVR);
>> +
>> +	if ((version & 0xffffffff) == 0x00800100)
>> +		cur_cpu_spec->cpu_features |= CPU_FTR_POWER10_DD1;
>> +}
>> +
>>   static int __init early_init_dt_scan_cpus(unsigned long node,
>>   					  const char *uname, int depth,
>>   					  void *data)
>> @@ -378,6 +386,7 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
>>   
>>   		check_cpu_feature_properties(node);
>>   		check_cpu_pa_features(node);
>> +		fixup_cpu_features();
>>   	}
> 
> This is not the way we normally do CPU features.
> 
> In the past we have always added a raw entry in cputable.c, see eg. the
> Power9 DD 2.0, 2.1 entries.

True. But that won't work PowerVM guests because kernel overwrites "raw"
mode cpu_features with "architected" mode cpu_features.

> 
> Doing it here is not really safe, if you're running with an architected
> PVR (via cpu-version property), you can't set the DD1 feature, because
> you might be migrated to a future CPU that doesn't have the DD1 quirks.

Okay.. I suppose, that mean kernel need to check real PVR every time when it
encounters spurious exception. i.e. instead of using

   if (cpu_has_feature(CPU_FTR_POWER10_DD1) && ...)

it need to use

   if (mfspr(SPRN_PVR) == 0x800100 && ...)

in patch 2. Right?

Thanks,
Ravi
