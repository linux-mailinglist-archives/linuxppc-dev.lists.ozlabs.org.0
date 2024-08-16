Return-Path: <linuxppc-dev+bounces-113-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 283CF95400E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2024 05:32:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=127.0.0.1
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KEXBllFZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WlSGY644Mz2yDs;
	Fri, 16 Aug 2024 13:32:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KEXBllFZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WlSGY26fYz2xfS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2024 13:32:05 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47FJxXe3001400;
	Fri, 16 Aug 2024 03:31:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:message-id:date:mime-version:subject:to:cc
	:references:from:in-reply-to; s=pp1; bh=d6t3+VYdJwm4K3C4Eogf3gfp
	Y6DYe8SPv0Uu8O+MX+8=; b=KEXBllFZpZ3FB8k87aqgdmhWTd38K5ZanEjOdnO6
	hBsm9RnrVArLPtjkQYGemlOKHwUAuaVRKmTVlsZ+71LwQbRtC+K8GdiT5qoDo2H4
	DeC8PzeWXDDX1hD73/Vo9l4KwZqc/jhFHcYqlRI5j/GHRSdgcK0U5m3V3aHuvjlO
	uI2F3PykQOtvTC1d3Zxzxd3ekP+bVlsT0BIhZFTxjFKIghkJB5t7fxgRIy+23VC+
	EGxJfRP4BO8hNU1yGWjS5+oQWKkRVI/uD/nMBRy8yEUIOiTwzYugO6tHhwv14fkd
	qmyHcSAT13ln/ipEjQ3qaR31VFyOh5ExcB2CDTJZ7NYYDQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4111j5xmrp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 03:31:52 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47G3SWV3028174;
	Fri, 16 Aug 2024 03:31:51 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4111j5xmrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 03:31:51 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 47FMiZkG029759;
	Fri, 16 Aug 2024 03:31:51 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 40xmrmsjmx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 03:31:50 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47G3VlcB19857970
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Aug 2024 03:31:50 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CDD7B58060;
	Fri, 16 Aug 2024 03:31:47 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3E1EB58073;
	Fri, 16 Aug 2024 03:31:45 +0000 (GMT)
Received: from [9.43.78.5] (unknown [9.43.78.5])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Aug 2024 03:31:44 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------YsdaHKBxlQ7ZfsTogyqxL8WT"
Message-ID: <ac8e76a3-35e4-41c0-a4f5-4987128fce26@linux.ibm.com>
Date: Fri, 16 Aug 2024 09:01:43 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftest/powerpc/benchmark: remove requirement
 libc-dev
To: Michael Ellerman <mpe@ellerman.id.au>, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, shuah@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org
References: <20240812094152.418586-1-maddy@linux.ibm.com>
 <87wmkk27ka.fsf@mail.lhotse>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <87wmkk27ka.fsf@mail.lhotse>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: g6QURvJLzwfl_7gzonLa8yuy6VNg67dh
X-Proofpoint-GUID: PJStNLLIlpdGvuKUmGdpKEQH73GPpS2f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_18,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408160021

This is a multi-part message in MIME format.
--------------YsdaHKBxlQ7ZfsTogyqxL8WT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/13/24 1:11 PM, Michael Ellerman wrote:
> Madhavan Srinivasan<maddy@linux.ibm.com>  writes:
>> Currently exec-target.c file is linked as static and this
>> post a requirement to install libc dev package to build.
> I think specifically the problem is that the test requires a static
> libc, which is packaged separately in some distros from the regular libc
> headers, am I right?
Thats right
> On Fedora the package is glibc-static, as opposed to glibc-devel, which
> the tests still require.
>
> So this patch removes the requirement to have glibc-static installed.
> Any idea what the package is called on Debian/Ubuntu?
This is what i could find in ubuntu VM, package is "libgcc-13-dev"
Description about this package

Binary package "libgcc-13-dev" in ubuntu noble Noble (24.04) 
libgcc-13-dev GCC support library (development files) This package 
contains the headers and static library files necessary for building C 
programs which use libgcc, libgomp, libquadmath, libssp or libitm.

Maddy
>
> cheers
>
>> Without it, build-break when compiling selftest/powerpc/benchmark.
>>
>>    CC       exec_target
>> /usr/bin/ld: cannot find -lc: No such file or directory
>> collect2: error: ld returned 1 exit status
>>
>> exec_target.c is using "syscall" library function which
>> could be replaced with a inline assembly and the same is
>> proposed as a fix here.
>>
>> Suggested-by: Michael Ellerman<mpe@ellerman.id.au>
>> Signed-off-by: Madhavan Srinivasan<maddy@linux.ibm.com>
>> ---
>> Chnagelog v1:
>> - Add comment for clobber register and proper list of
>>    clobber registers as suggested by Michael Ellerman and
>>    Christophe Leroy
>>
>>   .../selftests/powerpc/benchmarks/Makefile        |  2 +-
>>   .../selftests/powerpc/benchmarks/exec_target.c   | 16 ++++++++++++++--
>>   2 files changed, 15 insertions(+), 3 deletions(-)
>>
>> diff --git a/tools/testing/selftests/powerpc/benchmarks/Makefile b/tools/testing/selftests/powerpc/benchmarks/Makefile
>> index 1321922038d0..ca4483c238b9 100644
>> --- a/tools/testing/selftests/powerpc/benchmarks/Makefile
>> +++ b/tools/testing/selftests/powerpc/benchmarks/Makefile
>> @@ -18,4 +18,4 @@ $(OUTPUT)/context_switch: LDLIBS += -lpthread
>>   
>>   $(OUTPUT)/fork: LDLIBS += -lpthread
>>   
>> -$(OUTPUT)/exec_target: CFLAGS += -static -nostartfiles
>> +$(OUTPUT)/exec_target: CFLAGS += -nostartfiles
>> diff --git a/tools/testing/selftests/powerpc/benchmarks/exec_target.c b/tools/testing/selftests/powerpc/benchmarks/exec_target.c
>> index c14b0fc1edde..a6408d3f26cd 100644
>> --- a/tools/testing/selftests/powerpc/benchmarks/exec_target.c
>> +++ b/tools/testing/selftests/powerpc/benchmarks/exec_target.c
>> @@ -7,10 +7,22 @@
>>    */
>>   
>>   #define _GNU_SOURCE
>> -#include <unistd.h>
>>   #include <sys/syscall.h>
>>   
>>   void _start(void)
>>   {
>> -	syscall(SYS_exit, 0);
>> +	asm volatile (
>> +		"li %%r0, %[sys_exit];"
>> +		"li %%r3, 0;"
>> +		"sc;"
>> +		:
>> +		: [sys_exit] "i" (SYS_exit)
>> +		/*
>> +		 * "sc" will clobber r0, r3-r13, cr0, ctr, xer and memory.
>> +		 * Even though sys_exit never returns, handle clobber
>> +		 * registers.
>> +		 */
>> +		: "r0", "r3", "r4", "r5", "r6", "r7", "r8", "r9", "r10",
>> +		  "r11", "r12", "r13", "cr0", "ctr", "xer", "memory"
>> +	);
>>   }
>> -- 
>> 2.45.2
--------------YsdaHKBxlQ7ZfsTogyqxL8WT
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/13/24 1:11 PM, Michael Ellerman
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87wmkk27ka.fsf@mail.lhotse">
      <pre class="moz-quote-pre" wrap="">Madhavan Srinivasan <a class="moz-txt-link-rfc2396E" href="mailto:maddy@linux.ibm.com">&lt;maddy@linux.ibm.com&gt;</a> writes:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Currently exec-target.c file is linked as static and this
post a requirement to install libc dev package to build.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I think specifically the problem is that the test requires a static
libc, which is packaged separately in some distros from the regular libc
headers, am I right?
</pre>
    </blockquote>
    <font face="monospace">Thats right<br>
    </font>
    <blockquote type="cite" cite="mid:87wmkk27ka.fsf@mail.lhotse">
      <pre class="moz-quote-pre" wrap="">
On Fedora the package is glibc-static, as opposed to glibc-devel, which
the tests still require.

So this patch removes the requirement to have glibc-static installed.
Any idea what the package is called on Debian/Ubuntu?</pre>
    </blockquote>
    <font face="monospace">This is what i could find in ubuntu VM,
      package is "libgcc-13-dev"<br>
      Description about this package <br>
    </font>
    <p><span
style="color: rgb(29, 28, 29); font-family: Monaco, Menlo, Consolas, &quot;Courier New&quot;, monospace; font-size: 12px; font-style: normal; font-variant-ligatures: none; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgba(29, 28, 29, 0.04); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Binary package "libgcc-13-dev" in ubuntu noble

    Noble (24.04) libgcc-13-dev 

GCC support library (development files)

 This package contains the headers and static library files necessary for
 building C programs which use libgcc, libgomp, libquadmath, libssp or libitm.</span>
    </p>
    <font face="monospace">Maddy</font><br>
    <blockquote type="cite" cite="mid:87wmkk27ka.fsf@mail.lhotse">
      <pre class="moz-quote-pre" wrap="">

cheers

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Without it, build-break when compiling selftest/powerpc/benchmark.

  CC       exec_target
/usr/bin/ld: cannot find -lc: No such file or directory
collect2: error: ld returned 1 exit status

exec_target.c is using "syscall" library function which
could be replaced with a inline assembly and the same is
proposed as a fix here.

Suggested-by: Michael Ellerman <a class="moz-txt-link-rfc2396E" href="mailto:mpe@ellerman.id.au">&lt;mpe@ellerman.id.au&gt;</a>
Signed-off-by: Madhavan Srinivasan <a class="moz-txt-link-rfc2396E" href="mailto:maddy@linux.ibm.com">&lt;maddy@linux.ibm.com&gt;</a>
---
Chnagelog v1:
- Add comment for clobber register and proper list of
  clobber registers as suggested by Michael Ellerman and
  Christophe Leroy

 .../selftests/powerpc/benchmarks/Makefile        |  2 +-
 .../selftests/powerpc/benchmarks/exec_target.c   | 16 ++++++++++++++--
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/powerpc/benchmarks/Makefile b/tools/testing/selftests/powerpc/benchmarks/Makefile
index 1321922038d0..ca4483c238b9 100644
--- a/tools/testing/selftests/powerpc/benchmarks/Makefile
+++ b/tools/testing/selftests/powerpc/benchmarks/Makefile
@@ -18,4 +18,4 @@ $(OUTPUT)/context_switch: LDLIBS += -lpthread
 
 $(OUTPUT)/fork: LDLIBS += -lpthread
 
-$(OUTPUT)/exec_target: CFLAGS += -static -nostartfiles
+$(OUTPUT)/exec_target: CFLAGS += -nostartfiles
diff --git a/tools/testing/selftests/powerpc/benchmarks/exec_target.c b/tools/testing/selftests/powerpc/benchmarks/exec_target.c
index c14b0fc1edde..a6408d3f26cd 100644
--- a/tools/testing/selftests/powerpc/benchmarks/exec_target.c
+++ b/tools/testing/selftests/powerpc/benchmarks/exec_target.c
@@ -7,10 +7,22 @@
  */
 
 #define _GNU_SOURCE
-#include &lt;unistd.h&gt;
 #include &lt;sys/syscall.h&gt;
 
 void _start(void)
 {
-	syscall(SYS_exit, 0);
+	asm volatile (
+		"li %%r0, %[sys_exit];"
+		"li %%r3, 0;"
+		"sc;"
+		:
+		: [sys_exit] "i" (SYS_exit)
+		/*
+		 * "sc" will clobber r0, r3-r13, cr0, ctr, xer and memory.
+		 * Even though sys_exit never returns, handle clobber
+		 * registers.
+		 */
+		: "r0", "r3", "r4", "r5", "r6", "r7", "r8", "r9", "r10",
+		  "r11", "r12", "r13", "cr0", "ctr", "xer", "memory"
+	);
 }
-- 
2.45.2
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------YsdaHKBxlQ7ZfsTogyqxL8WT--


