Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DA679CB27
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 11:07:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L1N3JWWA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlHmR6j67z3dF3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 19:07:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L1N3JWWA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlHlY688Bz3byW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 19:07:05 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38C91vIP025553;
	Tue, 12 Sep 2023 09:06:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Y8OCtdSde7iA1uZkyu+o7yedisY27qz84tjNtsqMNEg=;
 b=L1N3JWWA0vO4qs2PA9t33mqpO5GRCth/e0c7r1OmHofpL4k3WMKb18l+IjEeUBOo/fq3
 hOu0tIqphoTl7zWjKWRnPr3bwUep7Yp1Qj4YIKwExB6Cll3GaZ6OeOsmpdtijBwkQpJE
 IL0e5cG20KcduTM78UdSaN1dsGIK/QzsyNpdBA+v01uNtVRCjhv7tCMvPRlMphQvRWhx
 rrOse1BwBDvPIkAwafQ9VvUdy2EqV6uEBwIvF16k/TsC7or7+rI3UkDu4XB7rBzIUKQh
 y/Er71hu5DJT9C9khxlSkXep03ArOVbisRM4iYKAtV7fvU29gK6k12d/aluiJh8adCyd 2A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t2n01g8tx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 09:06:54 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38C91qhh025374;
	Tue, 12 Sep 2023 09:06:51 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t2n01g881-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 09:06:51 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38C7XstN012005;
	Tue, 12 Sep 2023 08:31:19 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3t15r1s348-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 08:31:19 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38C8VGL624838720
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Sep 2023 08:31:17 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D36B42004B;
	Tue, 12 Sep 2023 08:31:16 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1CD8520040;
	Tue, 12 Sep 2023 08:31:15 +0000 (GMT)
Received: from [9.203.106.137] (unknown [9.203.106.137])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 12 Sep 2023 08:31:14 +0000 (GMT)
Message-ID: <ad792aec-412e-27da-f39e-fd9c208ba154@linux.ibm.com>
Date: Tue, 12 Sep 2023 14:01:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/3] vmcore: allow fadump to export vmcore even if
 is_kdump_kernel() is false
Content-Language: en-US
To: Baoquan He <bhe@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <20230905183604.568996-1-hbathini@linux.ibm.com>
 <20230905183604.568996-2-hbathini@linux.ibm.com> <8734zltc6z.fsf@mail.lhotse>
 <ZP7si3UMVpPfYV+w@MiWiFi-R3L-srv>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <ZP7si3UMVpPfYV+w@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UmsV8Qg1inj0-tWnQ5ORHQ9HC3NGCT4b
X-Proofpoint-GUID: GbOruLY-scl7YyZ4pQ8FUQ1KOR7yBjmF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=737 mlxscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309120076
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Kexec-ml <kexec@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, Sourabh Jain <sourabhjain@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Dave Young <dyoung@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/09/23 4:01 pm, Baoquan He wrote:
> On 09/11/23 at 05:13pm, Michael Ellerman wrote:
>> Hari Bathini <hbathini@linux.ibm.com> writes:
>>> Currently, is_kdump_kernel() returns true when elfcorehdr_addr is set.
>>> While elfcorehdr_addr is set for kexec based kernel dump mechanism,
>>> alternate dump capturing methods like fadump [1] also set it to export
>>> the vmcore. Since, is_kdump_kernel() is used to restrict resources in
>>> crash dump capture kernel and such restrictions are not desirable for
>>> fadump, allow is_kdump_kernel() to be defined differently for fadump
>>> case. With that change, include is_fadump_active() check in functions
>>> is_vmcore_usable() & vmcore_unusable() to be able to export vmcore for
>>> fadump case too.
>> ...
>>> diff --git a/include/linux/crash_dump.h b/include/linux/crash_dump.h
>>> index 0f3a656293b0..de8a9fabfb6f 100644
>>> --- a/include/linux/crash_dump.h
>>> +++ b/include/linux/crash_dump.h
>>> @@ -50,6 +50,7 @@ void vmcore_cleanup(void);
>>>   #define vmcore_elf64_check_arch(x) (elf_check_arch(x) || vmcore_elf_check_arch_cross(x))
>>>   #endif
>>>   
>>> +#ifndef is_kdump_kernel
>>>   /*
>>>    * is_kdump_kernel() checks whether this kernel is booting after a panic of
>>>    * previous kernel or not. This is determined by checking if previous kernel
>>> @@ -64,6 +65,19 @@ static inline bool is_kdump_kernel(void)
>>>   {
>>>   	return elfcorehdr_addr != ELFCORE_ADDR_MAX;
>>>   }
>>> +#endif
>>> +
>>> +#ifndef is_fadump_active
>>> +/*
>>> + * If f/w assisted dump capturing mechanism (fadump), instead of kexec based
>>> + * dump capturing mechanism (kdump) is exporting the vmcore, then this function
>>> + * will be defined in arch specific code to return true, when appropriate.
>>> + */
>>> +static inline bool is_fadump_active(void)
>>> +{
>>> +	return false;
>>> +}
>>> +#endif
>>>   
>>>   /* is_vmcore_usable() checks if the kernel is booting after a panic and
>>>    * the vmcore region is usable.
>>> @@ -75,7 +89,8 @@ static inline bool is_kdump_kernel(void)
>>>   
>>>   static inline int is_vmcore_usable(void)
>>>   {
>>> -	return is_kdump_kernel() && elfcorehdr_addr != ELFCORE_ADDR_ERR ? 1 : 0;
>>> +	return (is_kdump_kernel() || is_fadump_active())
>>> +		&& elfcorehdr_addr != ELFCORE_ADDR_ERR ? 1 : 0;
>>>   }
>>>   
>>>   /* vmcore_unusable() marks the vmcore as unusable,
>>> @@ -84,7 +99,7 @@ static inline int is_vmcore_usable(void)
>>>   
>>>   static inline void vmcore_unusable(void)
>>>   {
>>> -	if (is_kdump_kernel())
>>> +	if (is_kdump_kernel() || is_fadump_active())
>>>   		elfcorehdr_addr = ELFCORE_ADDR_ERR;
>>>   }
>>
>> I think it would be cleaner to decouple is_vmcore_usable() and
>> vmcore_usable() from is_kdump_kernel().
>>
>> ie, make them operate solely based on the value of elforehdr_addr:
>>
>> static inline int is_vmcore_usable(void)
>> {
>> 	elfcorehdr_addr != ELFCORE_ADDR_ERR && \
>> 		elfcorehdr_addr != ELFCORE_ADDR_MAX;
> 
> Agree. I fell into the blind corner of thinking earlier. Above change
> is better.

Thanks for the reviews.
Posted v3.

- Hari
