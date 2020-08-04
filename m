Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3E823BE59
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 18:47:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLgfb43YgzDqZT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 02:47:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLgcN1L02zDqWG
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 02:45:55 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 074GXZXF183245; Tue, 4 Aug 2020 12:45:47 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32q9sm3dxy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Aug 2020 12:45:47 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 074GeMCi023519;
 Tue, 4 Aug 2020 16:45:45 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 32n0183gmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Aug 2020 16:45:44 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 074GjgR626476854
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Aug 2020 16:45:42 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4240A404D;
 Tue,  4 Aug 2020 16:45:42 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E1D9A4057;
 Tue,  4 Aug 2020 16:45:42 +0000 (GMT)
Received: from [9.199.38.35] (unknown [9.199.38.35])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  4 Aug 2020 16:45:41 +0000 (GMT)
Subject: Re: [merge] Build failure selftest/powerpc/mm/pkey_exec_prot
To: Michael Ellerman <mpe@ellerman.id.au>
References: <37C1E196-B35D-46C4-AAA7-BC250078E4F2@linux.vnet.ibm.com>
 <63dc2f90-9a16-21f8-51fa-cfef9df80676@linux.ibm.com>
 <C44DC5C2-5133-49AA-BAA6-58E334EB70BA@linux.vnet.ibm.com>
 <875za00z75.fsf@mpe.ellerman.id.au>
 <3ada0268-9474-5ee6-b1aa-82e8d245615d@linux.ibm.com>
 <87mu3bz083.fsf@mpe.ellerman.id.au>
 <185c2277-91fd-74eb-3c04-75caeb90ed9e@linux.ibm.com>
 <877duezjk3.fsf@mpe.ellerman.id.au>
From: Sandipan Das <sandipan@linux.ibm.com>
Message-ID: <a2e6d27e-7e92-ff33-a930-9bb132392759@linux.ibm.com>
Date: Tue, 4 Aug 2020 22:15:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <877duezjk3.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-04_04:2020-08-03,
 2020-08-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=2 priorityscore=1501 bulkscore=0
 impostorscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008040123
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 04/08/20 5:53 pm, Michael Ellerman wrote:
> Sandipan Das <sandipan@linux.ibm.com> writes:
>> On 04/08/20 6:38 am, Michael Ellerman wrote:
>>> Sandipan Das <sandipan@linux.ibm.com> writes:
>>>> On 03/08/20 4:32 pm, Michael Ellerman wrote:
>>>>> Sachin Sant <sachinp@linux.vnet.ibm.com> writes:
>>>>>>> On 02-Aug-2020, at 10:58 PM, Sandipan Das <sandipan@linux.ibm.com> wrote:
>>>>>>> On 02/08/20 4:45 pm, Sachin Sant wrote:
>>>>>>>> pkey_exec_prot test from linuxppc merge branch (3f68564f1f5a) fails to
>>>>>>>> build due to following error:
>>>>>>>>
>>>>>>>> gcc -std=gnu99 -O2 -Wall -Werror -DGIT_VERSION='"v5.8-rc7-1276-g3f68564f1f5a"' -I/home/sachin/linux/tools/testing/selftests/powerpc/include  -m64    pkey_exec_prot.c /home/sachin/linux/tools/testing/selftests/kselftest_harness.h /home/sachin/linux/tools/testing/selftests/kselftest.h ../harness.c ../utils.c  -o /home/sachin/linux/tools/testing/selftests/powerpc/mm/pkey_exec_prot
>>>>>>>> In file included from pkey_exec_prot.c:18:
>>>>>>>> /home/sachin/linux/tools/testing/selftests/powerpc/include/pkeys.h:34: error: "SYS_pkey_mprotect" redefined [-Werror]
>>>>>>>> #define SYS_pkey_mprotect 386
>>>>>>>>
>>>>>>>> In file included from /usr/include/sys/syscall.h:31,
>>>>>>>>                 from /home/sachin/linux/tools/testing/selftests/powerpc/include/utils.h:47,
>>>>>>>>                 from /home/sachin/linux/tools/testing/selftests/powerpc/include/pkeys.h:12,
>>>>>>>>                 from pkey_exec_prot.c:18:
>>>>>>>> /usr/include/bits/syscall.h:1583: note: this is the location of the previous definition
>>>>>>>> # define SYS_pkey_mprotect __NR_pkey_mprotect
>>>>>>>>
>>>>>>>> commit 128d3d021007 introduced this error.
>>>>>>>> selftests/powerpc: Move pkey helpers to headers
>>>>>>>>
>>>>>>>> Possibly the # defines for sys calls can be retained in pkey_exec_prot.c or
>>>>>>>>
>>>>>>>
>>>>>>> I am unable to reproduce this on the latest merge branch (HEAD at f59195f7faa4).
>>>>>>> I don't see any redefinitions in pkey_exec_prot.c either.
>>>>>>>
>>>>>>
>>>>>> I can still see this problem on latest merge branch.
>>>>>> I have following gcc version
>>>>>>
>>>>>> gcc version 8.3.1 20191121
>>>>>
>>>>> What libc version? Or just the distro & version?
>>>>
>>>> Sachin observed this on RHEL 8.2 with glibc-2.28.
>>>> I couldn't reproduce it on Ubuntu 20.04 and Fedora 32 and both these distros
>>>> are using glibc-2.31.
>>>
>>> OK odd. Usually it's newer glibc that hits this problem.
>>>
>>> I guess on RHEL 8.2 we're getting the asm-generic version? But that
>>> would be quite wrong if that's what's happening.
>>
>> If I let GCC dump all the headers that are being used for the source file, I always
>> see syscall.h being included on the RHEL 8.2 system. That is the header with the
>> conflicting definition.
>>
>>   $ cd tools/testing/selftests/powerpc/mm
>>   $ gcc -H -std=gnu99 -O2 -Wall -Werror -DGIT_VERSION='"v5.8-rc7-1456-gf59195f7faa4-dirty"' \
>>         -I../include -m64 pkey_exec_prot.c ../../kselftest_harness.h ../../kselftest.h ../harness.c ../utils.c \
>>         -o pkey_exec_prot 2>&1 | grep syscall
>>
>> On Ubuntu 20.04 and Fedora 32, grep doesn't find any matching text.
>> On RHEL 8.2, it shows the following.
>>   ... /usr/include/sys/syscall.h
>>   .... /usr/include/bits/syscall.h
>>   In file included from /usr/include/sys/syscall.h:31,
>>   /usr/include/bits/syscall.h:1583: note: this is the location of the previous definition
>>   In file included from /usr/include/sys/syscall.h:31,
>>   /usr/include/bits/syscall.h:1575: note: this is the location of the previous definition
>>   In file included from /usr/include/sys/syscall.h:31,
>>   /usr/include/bits/syscall.h:1579: note: this is the location of the previous definition
>>   /usr/include/bits/syscall.h
>>   .. /usr/include/sys/syscall.h
>>   ... /usr/include/bits/syscall.h
>>   /usr/include/bits/syscall.h
>>   .. /usr/include/sys/syscall.h
>>   ... /usr/include/bits/syscall.h
>>   /usr/include/bits/syscall.h
>>
>> So utils.h is also including /usr/include/sys/syscall.h for glibc versions older than 2.30
>> because of commit 743f3544fffb ("selftests/powerpc: Add wrapper for gettid") :)
> 
> Haha, of course. :facepalm_emoji:
> 
>> [...]
>> . ../include/pkeys.h
>> [...]
>> .. ../include/utils.h
>> [...]
>> ... /usr/include/sys/syscall.h
>> .... /usr/include/asm/unistd.h
>> .... /usr/include/bits/syscall.h
>> In file included from pkey_exec_prot.c:18:
>> ../include/pkeys.h:34: error: "SYS_pkey_mprotect" redefined [-Werror]
>>  #define SYS_pkey_mprotect 386
>>
>> In file included from /usr/include/sys/syscall.h:31,
>>                  from ../include/utils.h:47,
>>                  from ../include/pkeys.h:12,
>>                  from pkey_exec_prot.c:18:
>> /usr/include/bits/syscall.h:1583: note: this is the location of the previous definition
>>  # define SYS_pkey_mprotect __NR_pkey_mprotect
> 
> Aha, that explains why redefining gives us an error, because we're
> defining it to the literal 386 whereas the system header is defining it
> to the __NR value.
> 
> Is there a reason to use the SYS_ name?
> 

That's just something I borrowed from the pkey tests under selftests/vm
... but without the #ifndefs

> Typically we just use the __NR value directly, and that would avoid any
> problems with redefinition I think, as long as we're using the same
> value as the system header (which we always should be).
> 

Agreed. David Laight suggested this too. Will send v4 with these changes.

- Sandipan

> eg:
> 
> diff --git a/tools/testing/selftests/powerpc/include/pkeys.h b/tools/testing/selftests/powerpc/include/pkeys.h
> index 6ba95039a034..3312cb1b058d 100644
> --- a/tools/testing/selftests/powerpc/include/pkeys.h
> +++ b/tools/testing/selftests/powerpc/include/pkeys.h
> @@ -31,9 +31,9 @@
>  
>  #define SI_PKEY_OFFSET	0x20
>  
> -#define SYS_pkey_mprotect	386
> -#define SYS_pkey_alloc		384
> -#define SYS_pkey_free		385
> +#define __NR_pkey_mprotect	386
> +#define __NR_pkey_alloc		384
> +#define __NR_pkey_free		385
>  
>  #define PKEY_BITS_PER_PKEY	2
>  #define NR_PKEYS		32
> @@ -62,17 +62,17 @@ void pkey_set_rights(int pkey, unsigned long rights)
>  
>  int sys_pkey_mprotect(void *addr, size_t len, int prot, int pkey)
>  {
> -	return syscall(SYS_pkey_mprotect, addr, len, prot, pkey);
> +	return syscall(__NR_pkey_mprotect, addr, len, prot, pkey);
>  }
>  
>  int sys_pkey_alloc(unsigned long flags, unsigned long rights)
>  {
> -	return syscall(SYS_pkey_alloc, flags, rights);
> +	return syscall(__NR_pkey_alloc, flags, rights);
>  }
>  
>  int sys_pkey_free(int pkey)
>  {
> -	return syscall(SYS_pkey_free, pkey);
> +	return syscall(__NR_pkey_free, pkey);
>  }
>  
>  int pkeys_unsupported(void)
> 
