Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A0F5B93CE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 07:07:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSlYw3Y5gz3bqx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 15:07:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Us21GJca;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Us21GJca;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSlY81NDPz3010
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 15:06:35 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28F3sZ89027677
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 05:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=pgBrXJ8VlPzGkovjkwhDfTsNP0RsplA35EESJu9sUP8=;
 b=Us21GJcaVAYQYcQZjq39Qf+rdN2KEhhgnA1u+8k6V+NIWYCxXwaWmY5jMt66Kn7E4qR9
 czOmOiGhQx8Ea+bCnxQ/wXca52vr6zbGSk9u7ZwA0sNBtFyURx0rXU79UWEnYDFHsewf
 8raLlFmTBNAEwk2aTuDTXBIJ3Ri5sxvgL6A+qX1kNd9YqzWEOpNitZD6B87kBxylH66a
 ieamoszest0ugEvD7Kc2nGVCJiMIc7yADDC4Bby6+7IWBNPMSD7OEBoWDV2lLvjZlMmR
 R0UgFHF19qgWkmVoOZx3aNqCFac8U+ySq3FN3vSK3RMqeZxcq81MBeOPyeMDG8KYlyFF qg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jksyr5hje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 05:06:32 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28F4T2MY031477
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 05:06:32 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jksyr5hhn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Sep 2022 05:06:32 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28F54jE4012249;
	Thu, 15 Sep 2022 05:06:30 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma01fra.de.ibm.com with ESMTP id 3jjy2j9dsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Sep 2022 05:06:30 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28F56R6d22610296
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Sep 2022 05:06:27 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF05CA4055;
	Thu, 15 Sep 2022 05:06:27 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 21275A4051;
	Thu, 15 Sep 2022 05:06:27 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 15 Sep 2022 05:06:27 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.192.255.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 226B46016C;
	Thu, 15 Sep 2022 15:06:23 +1000 (AEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v4 06/20] powerpc: Remove direct call to mmap2 syscall
 handlers
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <CMUBT12P8ZWV.VDK394MP3MSI@bobo>
Date: Thu, 15 Sep 2022 15:06:22 +1000
Content-Transfer-Encoding: quoted-printable
Message-Id: <9E5B02CE-139F-407B-901E-42EEB7E78E1F@linux.ibm.com>
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
 <20220824020548.62625-7-rmclure@linux.ibm.com>
 <CMUBT12P8ZWV.VDK394MP3MSI@bobo>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nNw2H6SfAQ1iDeEguir-z7PFa_4lwW9N
X-Proofpoint-ORIG-GUID: 6wpvK607GT-gEGiwBjByQLDch1LZ72Sx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-15_02,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 mlxlogscore=999 spamscore=0 phishscore=0 bulkscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2208220000 definitions=main-2209150025
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 12 Sep 2022, at 7:47 pm, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> On Wed Aug 24, 2022 at 12:05 PM AEST, Rohan McLure wrote:
>> Syscall handlers should not be invoked internally by their symbol =
names,
>> as these symbols defined by the architecture-defined SYSCALL_DEFINE
>> macro. Move the compatibility syscall definition for mmap2 to
>> syscalls.c, so that all mmap implementations can share an inline =
helper
>> function, as is done with the personality handlers.
>>=20
>> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
>=20
> Is there any point to keping sys_ppc32.c at all? Might as well move =
them
> all to syscall.c IMO.

Currently serves as a fairly arbitrary distinginction between compat =
calls
and others, noting that a compat variant of personality is in =
syscalls.c.
May as well get rid of it.

> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
>=20
>> ---
>> V1 -> V2: Move mmap2 compat implementation to asm/kernel/syscalls.c.
>> V3 -> V4: Move to be applied before syscall wrapper introduced.
>> ---
>> arch/powerpc/kernel/sys_ppc32.c |  9 ---------
>> arch/powerpc/kernel/syscalls.c  | 11 +++++++++++
>> 2 files changed, 11 insertions(+), 9 deletions(-)
>>=20
>> diff --git a/arch/powerpc/kernel/sys_ppc32.c =
b/arch/powerpc/kernel/sys_ppc32.c
>> index f4edcc9489fb..bc6491ed6454 100644
>> --- a/arch/powerpc/kernel/sys_ppc32.c
>> +++ b/arch/powerpc/kernel/sys_ppc32.c
>> @@ -25,7 +25,6 @@
>> #include <linux/poll.h>
>> #include <linux/personality.h>
>> #include <linux/stat.h>
>> -#include <linux/mman.h>
>> #include <linux/in.h>
>> #include <linux/syscalls.h>
>> #include <linux/unistd.h>
>> @@ -48,14 +47,6 @@
>> #include <asm/syscalls.h>
>> #include <asm/switch_to.h>
>>=20
>> -unsigned long compat_sys_mmap2(unsigned long addr, size_t len,
>> -			  unsigned long prot, unsigned long flags,
>> -			  unsigned long fd, unsigned long pgoff)
>> -{
>> -	/* This should remain 12 even if PAGE_SIZE changes */
>> -	return sys_mmap(addr, len, prot, flags, fd, pgoff << 12);
>> -}
>> -
>> /*=20
>>  * long long munging:
>>  * The 32 bit ABI passes long longs in an odd even register pair.
>> diff --git a/arch/powerpc/kernel/syscalls.c =
b/arch/powerpc/kernel/syscalls.c
>> index b8461128c8f7..32fadf3c2cd3 100644
>> --- a/arch/powerpc/kernel/syscalls.c
>> +++ b/arch/powerpc/kernel/syscalls.c
>> @@ -56,6 +56,17 @@ SYSCALL_DEFINE6(mmap2, unsigned long, addr, =
size_t, len,
>> 	return do_mmap2(addr, len, prot, flags, fd, pgoff, =
PAGE_SHIFT-12);
>> }
>>=20
>> +#ifdef CONFIG_COMPAT
>> +COMPAT_SYSCALL_DEFINE6(mmap2,
>> +		       unsigned long, addr, size_t, len,
>> +		       unsigned long, prot, unsigned long, flags,
>> +		       unsigned long, fd, unsigned long, pgoff)
>> +{
>> +	/* This should remain 12 even if PAGE_SIZE changes */
>> +	return do_mmap2(addr, len, prot, flags, fd, pgoff << 12, =
PAGE_SHIFT-12);
>> +}
>> +#endif
>> +
>> SYSCALL_DEFINE6(mmap, unsigned long, addr, size_t, len,
>> 		unsigned long, prot, unsigned long, flags,
>> 		unsigned long, fd, off_t, offset)
>> --=20
>> 2.34.1
>=20

