Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C252C94C955
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 06:26:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jmCMhCHx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wg9pR50c6z2yXd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 14:26:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jmCMhCHx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wg9nm2fK0z2yRZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 14:25:47 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4793TF4n004951;
	Fri, 9 Aug 2024 04:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=2
	TvO/bORdMC4F+KaX/DIlZsEQvbNDC0m43Xnrul7KR4=; b=jmCMhCHxRP2/jr6rV
	YXqTaR541MmO3orUWA4MRYP3j95o6eAv+UyyYteBu6Z9GyfsgwjtWwreDNubw/sY
	bDPjH9j3ZdWuXTTQYQD72c2NvRoyh8lhRkfAwZwWPn0ELuKlLT0cmbEtYihZCGlm
	bEf2V1flMKE/GdMNsjp4taf9nIkkFsD0zJzXh0l6FmYcXI50yA5kwSMYPiSC23yx
	5sPutTs9isqPUP7VrgZpN+QYXj27cIZwcTICLZPHv2gNUGWhcOMi/QomuKpImL+7
	6/GQommPlM3Z3yfL53UGZOcOzS3O97zAN6nRkdK/WNS/unYD5rmCGtTteiYlX4xO
	P23Pw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40vwkbsycd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Aug 2024 04:25:35 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4794PZAX003132;
	Fri, 9 Aug 2024 04:25:35 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40vwkbsycb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Aug 2024 04:25:34 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4791W7fh018628;
	Fri, 9 Aug 2024 04:25:34 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 40sxvuj261-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Aug 2024 04:25:34 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4794PV5P32899778
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 Aug 2024 04:25:33 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 53B6F5803F;
	Fri,  9 Aug 2024 04:25:31 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 156155804E;
	Fri,  9 Aug 2024 04:25:29 +0000 (GMT)
Received: from [9.204.206.229] (unknown [9.204.206.229])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  9 Aug 2024 04:25:28 +0000 (GMT)
Message-ID: <6e26fec3-0c27-45da-bd3b-69d3b7e0e493@linux.ibm.com>
Date: Fri, 9 Aug 2024 09:55:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftest/powerpc/benchmark: remove requirement libc-dev
To: Christophe Leroy <christophe.leroy@csgroup.eu>, mpe@ellerman.id.au,
        npiggin@gmail.com, shuah@kernel.org
References: <20240805083008.1300853-1-maddy@linux.ibm.com>
 <f4ae0d9e-5d1f-4b5e-92b9-aabb513e3097@csgroup.eu>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <f4ae0d9e-5d1f-4b5e-92b9-aabb513e3097@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 46KJ_b-RWo2yD7eC9fXzA88MXMK9w9uK
X-Proofpoint-ORIG-GUID: 7Ou9u6bo2wQT-00gijvv5m_QTfR1PBMs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_01,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408090029
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 8/6/24 12:24 PM, Christophe Leroy wrote:
>
>
> Le 05/08/2024 à 10:30, Madhavan Srinivasan a écrit :
>> Currently exec-target.c file is linked as static and this
>> post a requirement to install libc dev package to build.
>> Without it, build-breaks when compiling selftest/powerpc/benchmark.
>>
>>    CC       exec_target
>> /usr/bin/ld: cannot find -lc: No such file or directory
>> collect2: error: ld returned 1 exit status
>>
>> exec_target.c is using "syscall" library function which
>> could be replaced with a inline assembly and the same is
>> proposed as a fix here.
>>
>> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
>> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>> ---
>>   tools/testing/selftests/powerpc/benchmarks/Makefile    |  2 +-
>>   .../testing/selftests/powerpc/benchmarks/exec_target.c | 10 ++++++++--
>>   2 files changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/tools/testing/selftests/powerpc/benchmarks/Makefile 
>> b/tools/testing/selftests/powerpc/benchmarks/Makefile
>> index 1321922038d0..ca4483c238b9 100644
>> --- a/tools/testing/selftests/powerpc/benchmarks/Makefile
>> +++ b/tools/testing/selftests/powerpc/benchmarks/Makefile
>> @@ -18,4 +18,4 @@ $(OUTPUT)/context_switch: LDLIBS += -lpthread
>>     $(OUTPUT)/fork: LDLIBS += -lpthread
>>   -$(OUTPUT)/exec_target: CFLAGS += -static -nostartfiles
>> +$(OUTPUT)/exec_target: CFLAGS += -nostartfiles
>> diff --git a/tools/testing/selftests/powerpc/benchmarks/exec_target.c 
>> b/tools/testing/selftests/powerpc/benchmarks/exec_target.c
>> index c14b0fc1edde..20027a23b594 100644
>> --- a/tools/testing/selftests/powerpc/benchmarks/exec_target.c
>> +++ b/tools/testing/selftests/powerpc/benchmarks/exec_target.c
>> @@ -7,10 +7,16 @@
>>    */
>>     #define _GNU_SOURCE
>> -#include <unistd.h>
>>   #include <sys/syscall.h>
>>     void _start(void)
>>   {
>> -    syscall(SYS_exit, 0);
>> +    asm volatile (
>> +        "li %%r0, %[sys_exit];"
>> +        "li %%r3, 0;"
>> +        "sc;"
>> +        :
>> +        : [sys_exit] "i" (SYS_exit)
>> +        : "r0", "r3"
>> +    );
>
> That looks ok because SYS_exit() is not supposed to return, but in the 
> general case you should take a lot more precautions regarding which 
> registers get clobbered when using sc.
>
> Maybe it is worth a comment.


ok sure and something like this will help?


+        : "r0", "r3" //clobber registers, r0 - syscall number, r3 - 
exit value

Maddy


>
> Christophe
>
>>   }
