Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E37C22E477
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 05:30:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFQLT3bT8zDrBB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 13:30:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFQHT6KjNzF0QP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 13:28:05 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06R31qnb172746; Sun, 26 Jul 2020 23:27:52 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32ggwwpbq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Jul 2020 23:27:52 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06R3MHZ6025695;
 Sun, 26 Jul 2020 23:27:52 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32ggwwpbpt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Jul 2020 23:27:51 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06R3DJEG014882;
 Mon, 27 Jul 2020 03:27:50 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 32gcqghrak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 03:27:50 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06R3RkIS61145292
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jul 2020 03:27:47 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF9EF11C04A;
 Mon, 27 Jul 2020 03:27:46 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 642CF11C050;
 Mon, 27 Jul 2020 03:27:45 +0000 (GMT)
Received: from [9.199.36.51] (unknown [9.199.36.51])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 27 Jul 2020 03:27:45 +0000 (GMT)
Subject: Re: [PATCH 5/5] selftests/powerpc: Add test for pkey siginfo
 verification
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <cover.1594897099.git.sandipan@linux.ibm.com>
 <af137a935684955a60f13de2eb4ca358284f3d7c.1594897099.git.sandipan@linux.ibm.com>
 <87365egymc.fsf@mpe.ellerman.id.au>
 <20200726164009.Horde.J2bKDAPkYDkRMsx2Qnk8OQ8@messagerie.si.c-s.fr>
 <87zh7lg7g5.fsf@mpe.ellerman.id.au>
From: Sandipan Das <sandipan@linux.ibm.com>
Message-ID: <7c0b5b72-d82b-ac6a-8f5c-f1a7c55d14dc@linux.ibm.com>
Date: Mon, 27 Jul 2020 08:57:44 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87zh7lg7g5.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-27_02:2020-07-24,
 2020-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 impostorscore=0 clxscore=1011 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007270016
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
Cc: fweimer@redhat.com, aneesh.kumar@linux.ibm.com, linuxram@us.ibm.com,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 27/07/20 5:22 am, Michael Ellerman wrote:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> Michael Ellerman <mpe@ellerman.id.au> a écrit :
>>> Sandipan Das <sandipan@linux.ibm.com> writes:
>>>> diff --git a/tools/testing/selftests/powerpc/mm/pkey_siginfo.c  
>>>> b/tools/testing/selftests/powerpc/mm/pkey_siginfo.c
>>>> new file mode 100644
>>>> index 0000000000000..58605c53d495d
>>>> --- /dev/null
>>>> +++ b/tools/testing/selftests/powerpc/mm/pkey_siginfo.c
>>>> @@ -0,0 +1,332 @@
>>> ...
>>>> +
>>>> +static void *protect(void *p)
>>>> +{
>>>> +	unsigned long rights;
>>>> +	unsigned int *base;
>>>> +	size_t size;
>>>> +	int tid, i;
>>>> +
>>>> +	tid = gettid();
>>>
>>> pkey_siginfo.c: In function 'protect':
>>> pkey_siginfo.c:103:8: error: implicit declaration of function  
>>> 'gettid' [-Werror=implicit-function-declaration]
>>>   tid = gettid();
>>>         ^
>>>
>>>
>>> On Ubuntu 18.04 at least.
>>
>> See https://man7.org/linux/man-pages/man2/gettid.2.html
>>
>> Added in glibc 2.30
> 
> Thanks, this seems to work:
> 
> diff --git a/tools/testing/selftests/powerpc/include/utils.h b/tools/testing/selftests/powerpc/include/utils.h
> index 69d16875802d..71d2924f5b8b 100644
> --- a/tools/testing/selftests/powerpc/include/utils.h
> +++ b/tools/testing/selftests/powerpc/include/utils.h
> @@ -42,6 +42,16 @@ int perf_event_enable(int fd);
>  int perf_event_disable(int fd);
>  int perf_event_reset(int fd);
>  
> +#if !defined(__GLIBC_PREREQ) || !__GLIBC_PREREQ(2, 30)
> +#include <unistd.h>
> +#include <sys/syscall.h>
> +
> +static inline pid_t gettid(void)
> +{
> +	return syscall(SYS_gettid);
> +}
> +#endif
> +
>  static inline bool have_hwcap(unsigned long ftr)
>  {
>  	return ((unsigned long)get_auxv_entry(AT_HWCAP) & ftr) == ftr;
> 
> 
> cheers
> 

Thanks for catching this. Will add these changes to v2.

- Sandipan
