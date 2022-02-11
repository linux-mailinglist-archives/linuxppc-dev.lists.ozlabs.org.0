Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D18F4B2776
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 14:56:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JwFXG6WRVz3cCG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Feb 2022 00:56:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XqY433t5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XqY433t5; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwFWW15Yvz3bXR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Feb 2022 00:55:50 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21BCFhd5027637; 
 Fri, 11 Feb 2022 13:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=mBPgybp6OrwydxljgX7Um006NukbHAzD/i6637UsiS8=;
 b=XqY433t5sTYdyAuAmqahZ+yYPaJ5dSMij2ro0bivqhEYT4pt036uTKYkr1Ef91d7D0ep
 NeVeIwIOnb6IKGX+w1NAQk1cMvREoncN8EIJXSr51ESg7QlQe0sf10D0IN3HfesmI0fe
 F0UxLJWm1nlqUWRsPZW6rnx9zRN74jP9n5xaMAN9/3pwGq4sEclmWS+Fnbmp8DU1E49z
 KKLlWpxkPNjoSArMpnbZyN3i1nDEtcILhpStfT/LFMxUBOIdWv0DCxcgjeUc3jUeBAaW
 UW4HOMNjmvaMrvd4j45PJ7Ziz+w04zbbUFr4+t3qj4Ac6Fy4MclJnLSlRRuElzoIlc+r WA== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e5mrjwmrn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 13:55:39 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21BDWM8i016162;
 Fri, 11 Feb 2022 13:55:37 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 3e1ggjyyn8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 13:55:37 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21BDtYYN32833958
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Feb 2022 13:55:34 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D183AA406B;
 Fri, 11 Feb 2022 13:55:34 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8DFFAA405E;
 Fri, 11 Feb 2022 13:55:32 +0000 (GMT)
Received: from [9.43.15.152] (unknown [9.43.15.152])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 11 Feb 2022 13:55:32 +0000 (GMT)
Message-ID: <fa5f1b27-8b46-764c-973e-c2c8656e8ceb@linux.ibm.com>
Date: Fri, 11 Feb 2022 19:25:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] selftest/vm: Use correct PAGE_SHIFT value for ppc64
Content-Language: en-US
To: Mike Rapoport <rppt@kernel.org>
References: <20220211063330.99648-1-aneesh.kumar@linux.ibm.com>
 <YgY7lDToiQ0pM6U6@kernel.org>
 <27a71056-489a-4099-b094-64766bea84db@linux.ibm.com>
 <YgZke383drSXTekO@kernel.org>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <YgZke383drSXTekO@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TC787ZeHA1cZwOxiUecA2XnKv0MaIcd7
X-Proofpoint-GUID: TC787ZeHA1cZwOxiUecA2XnKv0MaIcd7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-11_04,2022-02-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202110076
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
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/11/22 18:58, Mike Rapoport wrote:
> Hi Aneesh,
> 
> On Fri, Feb 11, 2022 at 05:22:13PM +0530, Aneesh Kumar K V wrote:
>> On 2/11/22 16:03, Mike Rapoport wrote:
>>> On Fri, Feb 11, 2022 at 12:03:28PM +0530, Aneesh Kumar K.V wrote:
>>>> Keep it simple by using a #define and limiting hugepage size to 2M.
>>>> This keeps the test simpler instead of dynamically finding the page size
>>>> and huge page size.
>>>>
>>>> Without this tests are broken w.r.t reading /proc/self/pagemap
>>>>
>>>> 	if (pread(pagemap_fd, ent, sizeof(ent),
>>>> 			(uintptr_t)ptr >> (PAGE_SHIFT - 3)) != sizeof(ent))
>>>> 		err(2, "read pagemap");
>>>>
>>>> Cc: Shuah Khan <shuah@kernel.org>
>>>> Cc: linux-kselftest@vger.kernel.org
>>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>>> ---
>>>>    tools/testing/selftests/vm/ksm_tests.c        | 9 ++++++++-
>>>>    tools/testing/selftests/vm/transhuge-stress.c | 9 ++++++++-
>>>>    2 files changed, 16 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/tools/testing/selftests/vm/ksm_tests.c b/tools/testing/selftests/vm/ksm_tests.c
>>>> index 1436e1a9a3d3..cae72872152b 100644
>>>> --- a/tools/testing/selftests/vm/ksm_tests.c
>>>> +++ b/tools/testing/selftests/vm/ksm_tests.c
>>>> @@ -22,7 +22,14 @@
>>>>    #define KSM_MERGE_ACROSS_NODES_DEFAULT true
>>>>    #define MB (1ul << 20)
>>>> -#define PAGE_SHIFT 12
>>>> +#ifdef __powerpc64__
>>>> +#define PAGE_SHIFT	16
>>>> +#else
>>>> +#define PAGE_SHIFT	12
>>>> +#endif
>>>
>>> Page size can be other than 4096 for other configurations as well. And even
>>> on ppc64 it's not necessarily 64k.
>>>
>>
>> But most common test config is with 64K page size.
>>
>>> Ideally page size in selftests/vm should be sysconf(_SC_PAGESIZE)
>>
>>
>> yes. As explained in commit message, the idea was to keep it simpler.
> 
> I think it's simple enough (compile tested on x86 only):
> 
>  From 219577d87041f19f2c00dc7c23e0fd5aad8b02d5 Mon Sep 17 00:00:00 2001
> From: Mike Rapoport <rppt@linux.ibm.com>
> Date: Fri, 11 Feb 2022 15:24:13 +0200
> Subject: [PATCH] selftest/vm: add helpers to detect PAGE_SIZE and PAGE_SHIFT
> 
> PAGE_SIZE is not 4096 in many configurations, particularily ppc64 uses
> 64K pages in majority of cases.
> 
> Add helpers to detect PAGE_SIZE and PAGE_SHIFT dynamically.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>   tools/testing/selftests/vm/gup_test.c         |  3 +-
>   tools/testing/selftests/vm/ksm_tests.c        |  8 +----
>   tools/testing/selftests/vm/transhuge-stress.c |  9 ++----
>   tools/testing/selftests/vm/util.h             | 29 +++++++++++++++++++
>   4 files changed, 34 insertions(+), 15 deletions(-)
>   create mode 100644 tools/testing/selftests/vm/util.h
> 
> diff --git a/tools/testing/selftests/vm/gup_test.c b/tools/testing/selftests/vm/gup_test.c
> index fe043f67798b..cda837a14736 100644
> --- a/tools/testing/selftests/vm/gup_test.c
> +++ b/tools/testing/selftests/vm/gup_test.c
> @@ -10,8 +10,9 @@
>   #include <assert.h>
>   #include "../../../../mm/gup_test.h"
>   
> +#include "util.h"
> +
>   #define MB (1UL << 20)
> -#define PAGE_SIZE sysconf(_SC_PAGESIZE)
>   
>   /* Just the flags we need, copied from mm.h: */
>   #define FOLL_WRITE	0x01	/* check pte is writable */
> diff --git a/tools/testing/selftests/vm/ksm_tests.c b/tools/testing/selftests/vm/ksm_tests.c
> index cae72872152b..7faafd24446f 100644
> --- a/tools/testing/selftests/vm/ksm_tests.c
> +++ b/tools/testing/selftests/vm/ksm_tests.c
> @@ -12,6 +12,7 @@
>   
>   #include "../kselftest.h"
>   #include "../../../../include/vdso/time64.h"
> +#include "util.h"
>   
>   #define KSM_SYSFS_PATH "/sys/kernel/mm/ksm/"
>   #define KSM_FP(s) (KSM_SYSFS_PATH s)
> @@ -22,17 +23,10 @@
>   #define KSM_MERGE_ACROSS_NODES_DEFAULT true
>   #define MB (1ul << 20)
>   
> -#ifdef __powerpc64__
> -#define PAGE_SHIFT	16
> -#else
> -#define PAGE_SHIFT	12
> -#endif
>   /*
>    * On ppc64 this will only work with radix 2M hugepage size
>    */
>   #define HPAGE_SHIFT 21
> -
> -#define PAGE_SIZE (1 << PAGE_SHIFT)
>   #define HPAGE_SIZE (1 << HPAGE_SHIFT)
>   
>   #define PAGEMAP_PRESENT(ent)	(((ent) & (1ull << 63)) != 0)
> diff --git a/tools/testing/selftests/vm/transhuge-stress.c b/tools/testing/selftests/vm/transhuge-stress.c
> index b1f8d98355c5..baf90a745d28 100644
> --- a/tools/testing/selftests/vm/transhuge-stress.c
> +++ b/tools/testing/selftests/vm/transhuge-stress.c
> @@ -16,17 +16,12 @@
>   #include <string.h>
>   #include <sys/mman.h>
>   
> -#ifdef __powerpc64__
> -#define PAGE_SHIFT	16
> -#else
> -#define PAGE_SHIFT	12
> -#endif
> +#include "util.h"
> +
>   /*
>    * On ppc64 this will only work with radix 2M hugepage size
>    */
>   #define HPAGE_SHIFT 21
> -
> -#define PAGE_SIZE (1 << PAGE_SHIFT)
>   #define HPAGE_SIZE (1 << HPAGE_SHIFT)
>   
>   #define PAGEMAP_PRESENT(ent)	(((ent) & (1ull << 63)) != 0)
> diff --git a/tools/testing/selftests/vm/util.h b/tools/testing/selftests/vm/util.h
> new file mode 100644
> index 000000000000..1c85d7583bac
> --- /dev/null
> +++ b/tools/testing/selftests/vm/util.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __KSELFTEST_VM_UTIL_H
> +#define __KSELFTEST_VM_UTIL_H
> +
> +#include <string.h> /* ffsl() */
> +#include <unistd.h> /* _SC_PAGESIZE */
> +
> +static unsigned __page_size;
> +static unsigned __page_shift;
> +
> +static inline unsigned page_size(void)
> +{
> +	if (!__page_size)
> +		__page_size = sysconf(_SC_PAGESIZE);
> +	return __page_size;
> +}
> +
> +static inline unsigned page_shift(void)
> +{
> +	if (!__page_shift)
> +		__page_shift = (ffsl(page_size()) - 1);
> +	return __page_shift;
> +}
> +
> +#define PAGE_SHIFT	(page_shift())
> +#define PAGE_SIZE	(page_size())
> +
> +#endif /* __KSELFTEST_VM_UTIL_H */

This is on top of patch 1 I sent i guess. Should I add it to the series 
because v2 also consolidate allocate_transhuge()? Or do you want to sent 
it as an independent patch?

-aneesh

