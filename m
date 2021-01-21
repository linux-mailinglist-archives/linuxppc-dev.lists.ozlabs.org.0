Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7419A2FEE52
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 16:20:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DM5gD4xHXzDqgw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 02:20:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cVegAoeL; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DM5cR03j0zDrQ6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jan 2021 02:17:58 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10LF3065132417; Thu, 21 Jan 2021 10:17:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=ZwCqDLvURQTzikupODkfrJJ6B1CwILev7OOhbTHepgw=;
 b=cVegAoeLTl/P8h6jN2+JNniXEZl7FVJVP0kKRMsFyn6ZSsJlGkLgpGtaMCgWCLhxU6iR
 GF6Nk6+Ox9VrWtb9jog5R9iH2E3/x2bYglYUFfEczYLIFOLyPaiCs96Z7/pIzIxzHujI
 RqkIfPEIh1TiZpI62/KWig5Us7AzGS1lQLBx+wAySyZTo6UyfJrbSoVV1urFn1TgD4/O
 uzQO2gwxgdBLJMgWDmyI/zES8NdKG0qiJpGf6PLpIpVXtiQUHGt4i4qwFpqMy8ACrq1J
 GfKBrmGeILC6iiaKxylhIQgkvBVsGgcSDGC6eT7gpI/oDoowP/eVe5feC1Lj9WnVI1cI BA== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 367bs1h0g3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 10:17:55 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10LFCaPg024929;
 Thu, 21 Jan 2021 15:17:54 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma05wdc.us.ibm.com with ESMTP id 3668nwcwra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 15:17:54 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10LFHqo827459934
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jan 2021 15:17:52 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68F9B7805F;
 Thu, 21 Jan 2021 15:17:52 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41F1578069;
 Thu, 21 Jan 2021 15:17:52 +0000 (GMT)
Received: from localhost (unknown [9.211.72.22])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 21 Jan 2021 15:17:52 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 5/6] powerpc/rtas: rename RTAS_RMOBUF_MAX to
 RTAS_USER_REGION_SIZE
In-Reply-To: <7988dce5-6cf3-df79-1276-7bc91ce7c8b2@ozlabs.ru>
References: <20210114220004.1138993-1-nathanl@linux.ibm.com>
 <20210114220004.1138993-6-nathanl@linux.ibm.com>
 <d91c5b15-7c3d-a332-45ac-1b865341e962@ozlabs.ru>
 <87a6taxkgf.fsf@linux.ibm.com>
 <6905c3d2-e524-b6d8-036f-7812ea3f8b85@ozlabs.ru>
 <87y2gowgo6.fsf@linux.ibm.com>
 <7988dce5-6cf3-df79-1276-7bc91ce7c8b2@ozlabs.ru>
Date: Thu, 21 Jan 2021 09:17:51 -0600
Message-ID: <87sg6uwc80.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-21_08:2021-01-21,
 2021-01-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101210081
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
Cc: tyreld@linux.ibm.com, brking@linux.ibm.com, ajd@linux.ibm.com,
 aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexey Kardashevskiy <aik@ozlabs.ru> writes:
> On 20/01/2021 12:17, Nathan Lynch wrote:
>> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
>>> On 16/01/2021 02:56, Nathan Lynch wrote:
>>>> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
>>>>> On 15/01/2021 09:00, Nathan Lynch wrote:
>>>>>> +#define RTAS_WORK_AREA_SIZE   4096
>>>>>> +
>>>>>> +/* Work areas allocated for user space access. */
>>>>>> +#define RTAS_USER_REGION_SIZE (RTAS_WORK_AREA_SIZE * 16)
>>>>>
>>>>> This is still 64K but no clarity why. There is 16 of something, what
>>>>> is it?
>>>>
>>>> There are 16 4KB work areas in the region. I can name it
>>>> RTAS_NR_USER_WORK_AREAS or similar.
>>>
>>>
>>> Why 16? PAPR (then add "per PAPR") or we just like 16 ("should be
>>> enough")?
>> 
>> PAPR doesn't know anything about the user region; it's a Linux
>> construct. It's been 64KB since pre-git days and I'm not sure what the
>> original reason is. At this point, maintaining a kernel-user ABI seems
>> like enough justification for the value.
>
> I am not arguing keeping the numbers but you are replacing one magic 
> number with another and for neither it is horribly obvious where they 
> came from.

When I wrote it I viewed it as changing one of the factors in (64 *
1024) to a named constant that better expresses how the region is used
and adjusting the remaining factor to arrive at the same end result. I
considered it a net improvement even if we're not sure how 64K was
arrived at in the first place, although I suspect it was chosen to
support multiple concurrent users, and to be compatible with both 4K
and 64K page sizes. Then again 64K pages came a bit after this was
introduced.

The change that introduced RTAS_RMOBUF_MAX (here renamed to
RTAS_USER_REGION_SIZE) does not explain how the value was derived:

================
Author: Andrew Morton <akpm@osdl.org>
Date:   Sun Jan 18 18:17:30 2004 -0800

    [PATCH] ppc64: add rtas syscall, from John Rose
    
    From: Anton Blanchard <anton@samba.org>
    
    Added RTAS syscall.  Reserved lowmem rtas_rmo_buf for userspace use.  Created
    "rmo_buffer" proc file to export bounds of rtas_rmo_buf.

[...]

diff --git a/include/asm-ppc64/rtas.h b/include/asm-ppc64/rtas.h
index 42a0b484077c..d9e426161044 100644
--- a/include/asm-ppc64/rtas.h
+++ b/include/asm-ppc64/rtas.h
@@ -19,6 +19,9 @@
 #define RTAS_UNKNOWN_SERVICE (-1)
 #define RTAS_INSTANTIATE_MAX (1UL<<30) /* Don't instantiate rtas at/above this value */
 
+/* Buffer size for ppc_rtas system call. */
+#define RTAS_RMOBUF_MAX (64 * 1024)
+
================

The comment "Buffer size for ppc_rtas system call" (removed by my
change) is not really appropriate because 1. not all sys_rtas
invocations use the buffer, and 2. no callers use the entire buffer.

> Is 16 the max number of concurrently running sys_rtas system 
> calls? Does the userspace ensure there is no more than 16?

No and no; not all calls to sys_rtas need to use a work area. However,
librtas uses record locking to arbitrate access to the user region, and
the unit of allocation is 4KB. This is a reasonable choice: many RTAS
calls which take a work area require 4KB alignment. But some do not
(ibm,get-system-parameter), and librtas conceivably could be made to
perform finer-grained allocations.

It's not the kernel's concern how librtas partitions the user region, so
I'm inclined to leave the (64 * 1024) expression alone now. Thanks for
your review.

> btw where is that userspace code? I thought
> https://github.com/power-ras/ppc64-diag.git but no. Thanks,

librtas, of which ppc64-diag and powerpc-utils are users:

https://github.com/ibm-power-utilities/librtas
