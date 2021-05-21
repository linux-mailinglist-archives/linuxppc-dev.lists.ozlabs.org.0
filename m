Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2116E38CE50
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 21:41:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fmxn90fv6z3bwn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 May 2021 05:41:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EgOMDthD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=msc@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=EgOMDthD; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmxmZ6S3Lz2yWJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 May 2021 05:41:02 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14LJYMvI034006; Fri, 21 May 2021 15:40:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=references : from : to :
 cc : subject : message-id : in-reply-to : date : content-type :
 mime-version; s=pp1; bh=qMykcIuYawdYRjvJyzIEJbpxErll2khR6P6J5+MZgDs=;
 b=EgOMDthDfsGaA+r3W+BTBQM2c9nsku0Y3ngQhWJCVvdAN7bm2EKJNTlxEGtbXUOp2TWc
 Xsj5wn1O9TaCh3UKRPZHqfUN2DI5wEAMx5G0etp2YxUxH/9oSaOkXojv7+3NzDwYr6sF
 Vy5HuZlAroBaReS6njXVaSghqfP77QZbqRhjhwJyKauW5JlKJdLo/s355TwqK+Rowq34
 /SX7YKoLKdwJvi5ERsmpqq4Wr4sOKjGKPODbQD6XrVmX+9xW4Sp0q+gL/dunoEz5MosJ
 hyujCgmQKr1u1xo/rwEZJYVrSCaP3ibpGWG2U6+QsOlOQpZd8BgNTTDWBxEc0xf6/68O pQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38pjdp13nr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 15:40:36 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14LJYNL0034110;
 Fri, 21 May 2021 15:40:35 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38pjdp13ng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 15:40:35 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14LJctPU008089;
 Fri, 21 May 2021 19:40:34 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04dal.us.ibm.com with ESMTP id 38j5xaxmjt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 19:40:34 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14LJeYB327394346
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 19:40:34 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02BC4AE063;
 Fri, 21 May 2021 19:40:34 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2403BAE067;
 Fri, 21 May 2021 19:40:32 +0000 (GMT)
Received: from TP480.linux.ibm.com (unknown [9.160.176.31])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 21 May 2021 19:40:31 +0000 (GMT)
References: <20200611081203.995112-1-npiggin@gmail.com>
 <20210518231331.GA8464@altlinux.org>
 <1621385544.nttlk5qugb.astroid@bobo.none>
 <1621400263.gf0mbqhkrf.astroid@bobo.none>
User-agent: mu4e 1.4.10; emacs 27.2
From: Matheus Castanho <msc@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Linux powerpc new system call instruction and ABI
Message-ID: <87a6oo4312.fsf@linux.ibm.com>
In-reply-to: <1621400263.gf0mbqhkrf.astroid@bobo.none>
Date: Fri, 21 May 2021 16:40:30 -0300
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FmX8gShoI7DNy5B3IP4XWytJ3AtWUCi7
X-Proofpoint-ORIG-GUID: HyvNHvMilIbfmniBGeykewaTqxRx90wx
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_08:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2105210103
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
Cc: libc-alpha@sourceware.org, musl@lists.openwall.com,
 "Dmitry V. Levin" <ldv@altlinux.org>, linux-api@vger.kernel.org,
 libc-dev@lists.llvm.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Nicholas Piggin <npiggin@gmail.com> writes:

> Excerpts from Nicholas Piggin's message of May 19, 2021 12:50 pm:
>> Excerpts from Dmitry V. Levin's message of May 19, 2021 9:13 am:
>>> Hi,
>>>
>>> On Thu, Jun 11, 2020 at 06:12:01PM +1000, Nicholas Piggin wrote:
>>> [...]
>>>> - Error handling: The consensus among kernel, glibc, and musl is to move to
>>>>   using negative return values in r3 rather than CR0[SO]=1 to indicate error,
>>>>   which matches most other architectures, and is closer to a function call.
>>>
>>> Apparently, the patchset merged by commit v5.9-rc1~100^2~164 was
>>> incomplete: all functions defined in arch/powerpc/include/asm/ptrace.h and
>>> arch/powerpc/include/asm/syscall.h that use ccr are broken when scv is used.
>>> This includes syscall_get_error() and all its users including
>>> PTRACE_GET_SYSCALL_INFO API, which in turn makes strace unusable
>>> when scv is used.
>>>
>>> See also https://bugzilla.redhat.com/1929836
>>
>> I see, thanks. Using latest strace from github.com, the attached kernel
>> patch makes strace -k check results a lot greener.
>>
>> Some of the remaining failing tests look like this (I didn't look at all
>> of them yet):
>>
>> signal(SIGUSR1, 0xfacefeeddeadbeef)     = 0 (SIG_DFL)
>> write(1, "signal(SIGUSR1, 0xfacefeeddeadbe"..., 50signal(SIGUSR1, 0xfacefeeddeadbeef) = 0 (SIG_DFL)
>> ) = 50
>> signal(SIGUSR1, SIG_IGN)                = 0xfacefeeddeadbeef
>> write(2, "errno2name.c:461: unknown errno "..., 41errno2name.c:461: unknown errno 559038737) = 41
>> write(2, ": Unknown error 559038737\n", 26: Unknown error 559038737
>> ) = 26
>> exit_group(1)                           = ?
>>
>> I think the problem is glibc testing for -ve, but it should be comparing
>> against -4095 (+cc Matheus)
>>
>>   #define RET_SCV \
>>       cmpdi r3,0; \
>>       bgelr+; \
>>       neg r3,r3;
>
> This glibc patch at least gets that signal test working. Haven't run the
> full suite yet because of trouble making it work with a local glibc
> install...
>
> Thanks,
> Nick
>
> ---
>
> diff --git a/sysdeps/powerpc/powerpc64/sysdep.h b/sysdeps/powerpc/powerpc64/sysdep.h
> index c57bb1c05d..1ea4c3b917 100644
> --- a/sysdeps/powerpc/powerpc64/sysdep.h
> +++ b/sysdeps/powerpc/powerpc64/sysdep.h
> @@ -398,8 +398,9 @@ LT_LABELSUFFIX(name,_name_end): ; \
>  #endif
>
>  #define RET_SCV \
> -    cmpdi r3,0; \
> -    bgelr+; \
> +    li r9,-4095; \
> +    cmpld r3,r9; \
> +    bltlr+; \
>      neg r3,r3;
>
>  #define RET_SC \

Hi Nick,

I agree the current code is accepting more values as errors than it
should. This change looks good to me. All glibc tests are passing with
it. I also built strace and checked one of the failing tests against a
glibc with your patch:

~/src/strace/tests$ uname -r
5.10.16-1-default

~/src/strace/tests$ /lib64/libc.so.6
GNU C Library (GNU libc) release release version 2.33 (git 9826b03b74).
[...]

~/src/strace/tests$ ./signal.gen.test
errno2name.c:461: unknown errno 559038737: Unknown error 559038737
signal.gen.test: failed test: ../signal failed with code 1

~/src/strace/tests$ ./signal
signal(SIGUSR1, SIG_IGN) = 0 (SIG_DFL)
signal(SIGUSR1, SIG_DFL) = 0x1 (SIG_IGN)
signal(SIGUSR1, 0xfacefeeddeadbeef) = 0 (SIG_DFL)
errno2name.c:461: unknown errno 559038737: Unknown error 559038737


Running with glibc containing the patch:

~/src/strace/tests$ ~/build/glibc/testrun.sh ./signal
signal(SIGUSR1, SIG_IGN) = 0 (SIG_DFL)
signal(SIGUSR1, SIG_DFL) = 0x1 (SIG_IGN)
signal(SIGUSR1, 0xfacefeeddeadbeef) = 0 (SIG_DFL)
signal(SIGUSR1, SIG_IGN) = 0xfacefeeddeadbeef
signal(-559038737, SIG_IGN) = -1 EINVAL (Invalid argument)
+++ exited with 0 +++



If the patch below looks OK to you and no one objects, I'll commit it to
glibc on Monday.

Thanks,
Matheus Castanho

---

From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 1/1] powerpc: Fix handling of scv return error codes

When using scv on templated ASM syscalls, current code interprets any
negative return value as error, but the only valid error codes are in
the range -4095..-1 according to the ABI.

Reviewed-by: Matheus Castanho <msc@linux.ibm.com>
---
 sysdeps/powerpc/powerpc64/sysdep.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sysdeps/powerpc/powerpc64/sysdep.h b/sysdeps/powerpc/powerpc64/sysdep.h
index c57bb1c05d..1ea4c3b917 100644
--- a/sysdeps/powerpc/powerpc64/sysdep.h
+++ b/sysdeps/powerpc/powerpc64/sysdep.h
@@ -398,8 +398,9 @@ LT_LABELSUFFIX(name,_name_end): ; \
 #endif

 #define RET_SCV \
-    cmpdi r3,0; \
-    bgelr+; \
+    li r9,-4095; \
+    cmpld r3,r9; \
+    bltlr+; \
     neg r3,r3;

 #define RET_SC \
--
2.31.1
