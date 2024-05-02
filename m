Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E968D8B9690
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2024 10:35:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QDGruwhx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VVS1w3sqCz3cf8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2024 18:35:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QDGruwhx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VVS172Bl6z3c71
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2024 18:35:07 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4428XVT0015598;
	Thu, 2 May 2024 08:34:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ttmupHIofpSj42mqEG+rYKvLa1BL0Zney6yYHW57Bd4=;
 b=QDGruwhx015McfSz0LctLiVDvAJ0SxeOwaW9yv/W3NmuU+Rvm6/Utov51H5jXrFGeO+h
 VW+6kwK4kSD36/LN/gsKvYSoLlRamcZh0WWmjb+ts7/FBp3zWCFg7AZESxttv/Zjoxxh
 8vVw0MYSgjDnFxa4XKJr2LuQsLUeFnV1Vkiz9xCJgmiABo6VJZSLlwhDwa+02EtstZ1V
 70DfEKFwHZui5rzWhZCEkAeBGLWnvv21PicoavA4KKH8mIvze/46PO74mEI2xlu8OaGr
 SqbEuhSsr2iTddW7oPvDgRwLQdJnQkeSXDc2lbiOeIl19vfiyVA3vslsC62ZIWXTdNeT gw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xv7dr804y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 May 2024 08:34:54 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4428YrOf017373;
	Thu, 2 May 2024 08:34:53 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xv7dr804v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 May 2024 08:34:53 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44275Ovf001461;
	Thu, 2 May 2024 08:34:53 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xsbpu788a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 May 2024 08:34:53 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4428Ykc534144886
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 May 2024 08:34:49 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D83FB20040;
	Thu,  2 May 2024 08:34:46 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2760F20043;
	Thu,  2 May 2024 08:34:44 +0000 (GMT)
Received: from [9.171.50.201] (unknown [9.171.50.201])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  2 May 2024 08:34:43 +0000 (GMT)
Message-ID: <fef9ac16-a6b0-4a44-a240-fc3ae469d62f@linux.ibm.com>
Date: Thu, 2 May 2024 14:04:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] selftest/powerpc: Add flags.mk to support pmu
 buildable
To: Michael Ellerman <mpe@ellerman.id.au>, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org,
        naveen.n.rao@linux.ibm.com, shuah@kernel.org
References: <20240229093711.581230-1-maddy@linux.ibm.com>
 <20240229093711.581230-2-maddy@linux.ibm.com> <874jbkjm54.fsf@mail.lhotse>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <874jbkjm54.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: O4i50ZNSRHl73czmrM0E97NhzVHWg7dL
X-Proofpoint-ORIG-GUID: LYc511mKKYZ4fRZ6RU81j2SqLD4X_J-B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-01_16,2024-05-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1011
 priorityscore=1501 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2404010000 definitions=main-2405020050
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, Sachin Sant <sachinp@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 4/29/24 7:39 PM, Michael Ellerman wrote:
> Madhavan Srinivasan <maddy@linux.ibm.com> writes:
>> When running `make -C powerpc/pmu run_tests` from top level selftests
>> directory, currently this error is being reported
>>
>> make: Entering directory '/home/maddy/linux/tools/testing/selftests/powerpc/pmu'
>> Makefile:40: warning: overriding recipe for target 'emit_tests'
>> ../../lib.mk:111: warning: ignoring old recipe for target 'emit_tests'
>> gcc -m64    count_instructions.c ../harness.c event.c lib.c ../utils.c loop.S  -o /home/maddy/selftest_output//count_instructions
>> In file included from count_instructions.c:13:
>> event.h:12:10: fatal error: utils.h: No such file or directory
>> 12 | #include "utils.h"
>>    |          ^~~~~~~~~
>> compilation terminated.
>>
>> This is due to missing of include path in CFLAGS. That is, CFLAGS and
>> GIT_VERSION macros are defined in the powerpc/ folder Makefile which
>> in this case not involved.
>>
>> To address the failure incase of executing specific sub-folder test directly,
>> a new rule file has been addded by the patch called "flags.mk" under
>> selftest/powerpc/ folder and is linked to all the Makefile of powerpc/pmu
>> sub-folders.
> This patch made my selftest build go from ~10s to ~50s !
>
> I tracked it down to "git describe" being run hundreds of times.
>
>> diff --git a/tools/testing/selftests/powerpc/flags.mk b/tools/testing/selftests/powerpc/flags.mk
>> new file mode 100644
>> index 000000000000..28374f470126
>> --- /dev/null
>> +++ b/tools/testing/selftests/powerpc/flags.mk
>> @@ -0,0 +1,12 @@
>> +#This checks for any ENV variables and add those.
>> +
>> +#ifeq ($(GIT_VERSION),)
>   
> This isn't right, # is a comment in make syntax, so this line is just a
> comment. It needs to be "ifeq".

oops, my bad :(
But nice catch. Thanks

Maddy


>
>> +GIT_VERSION = $(shell git describe --always --long --dirty || echo "unknown")
>   
> Using '=' here means Make re-runs the command every time the variable is
> used. Previously that was OK because the variable was set once and then
> exported. But now that it's a Make variable in each file it leads to
> "git describe" being run a few hundred times.
>
> I've squashed in those fixes, no need to send a v2.
>
> cheers
