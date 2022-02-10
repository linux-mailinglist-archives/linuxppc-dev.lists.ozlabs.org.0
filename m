Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DED84B044B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 05:13:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvNf515mZz3cLN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 15:13:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YNCRH02A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YNCRH02A; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvNdJ4VScz30KW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Feb 2022 15:12:51 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21A0ULdK010183; 
 Thu, 10 Feb 2022 04:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=HGgqYKlknenAdjcbiaWaaZFGXBMcfKbexxJhz30X6yo=;
 b=YNCRH02AYpfRaNUCgucDKwK3wg5T9YOcgnCG7AKIEX5ZrMYSwFXDZZarUfgHN0maewvP
 PqtLGvb7pN4aGvavSlCloDss3VaaFJeaUbE+J2eWewrreBDJLUHTzqgNHf1Alsh+4LJ9
 mLIINpVB/HBEgsPqA+O4WkjAEwrBvoGDMSdgwqBTHwsqnM0FYMmG5IrU4eYhsLcB+B6r
 IcBcRzr+omtUMEv2WeJwRsyH9eTD7VQrAalUpuA+UanyvP8EGB2t2LMcuPc85Insh9Uf
 mjoagICrUcpKp6bDj17kdIq519+jZQHv5xuNcVGyhSV3kMrZ0e5pY4Wy7VYshk44XlRc 9A== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e4r7jbjxa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 04:12:33 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21A49pRW015726;
 Thu, 10 Feb 2022 04:12:32 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 3e1gvc065f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 04:12:32 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21A4CVXY22348048
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 04:12:31 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A50156E05F;
 Thu, 10 Feb 2022 04:12:31 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBA9E6E05E;
 Thu, 10 Feb 2022 04:12:26 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.23.209])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 10 Feb 2022 04:12:26 +0000 (GMT)
X-Mailer: emacs 29.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Shuah Khan <skhan@linuxfoundation.org>, linux-mm@kvack.org,
 akpm@linux-foundation.org
Subject: Re: [PATCH] selftest/vm: Use correct PAGE_SHIFT value for ppc64
In-Reply-To: <84508bb4-9400-f429-e6d2-d8b05a1e8368@linuxfoundation.org>
References: <20220209154301.42024-1-aneesh.kumar@linux.ibm.com>
 <84508bb4-9400-f429-e6d2-d8b05a1e8368@linuxfoundation.org>
Date: Thu, 10 Feb 2022 09:42:21 +0530
Message-ID: <87zgmz9x7e.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: crRP15SMbCibQDLUJPQaofUdXCl4Qq2R
X-Proofpoint-ORIG-GUID: crRP15SMbCibQDLUJPQaofUdXCl4Qq2R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-10_01,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202100022
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
Cc: Shuah Khan <shuah@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Shuah Khan <skhan@linuxfoundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Shuah Khan <skhan@linuxfoundation.org> writes:

> On 2/9/22 8:43 AM, Aneesh Kumar K.V wrote:
>> Keep it simple by using a #define and limiting hugepage size to 2M.
>> This keeps the test simpler instead of dynamically finding the page size
>> and huge page size.
>> 
>> Without this tests are broken w.r.t reading /proc/self/pagemap
>> 
>> 	if (pread(pagemap_fd, ent, sizeof(ent),
>> 			(uintptr_t)ptr >> (PAGE_SHIFT - 3)) != sizeof(ent))
>> 		err(2, "read pagemap");
>> 
>> Cc: Shuah Khan <shuah@kernel.org>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   tools/testing/selftests/vm/ksm_tests.c        | 8 ++++++++
>>   tools/testing/selftests/vm/transhuge-stress.c | 8 ++++++++
>>   2 files changed, 16 insertions(+)
>> 
>> diff --git a/tools/testing/selftests/vm/ksm_tests.c b/tools/testing/selftests/vm/ksm_tests.c
>> index 1436e1a9a3d3..8200328ff018 100644
>> --- a/tools/testing/selftests/vm/ksm_tests.c
>> +++ b/tools/testing/selftests/vm/ksm_tests.c
>> @@ -22,8 +22,16 @@
>>   #define KSM_MERGE_ACROSS_NODES_DEFAULT true
>>   #define MB (1ul << 20)
>>   
>> +#ifdef __powerpc64__
>> +#define PAGE_SHIFT	16
>> +/*
>> + * This will only work with radix 2M hugepage size
>> + */
>> +#define HPAGE_SHIFT 21
>> +#else
>>   #define PAGE_SHIFT 12
>>   #define HPAGE_SHIFT 21
>> +#endif
>>   
>>   #define PAGE_SIZE (1 << PAGE_SHIFT)
>>   #define HPAGE_SIZE (1 << HPAGE_SHIFT)
>> diff --git a/tools/testing/selftests/vm/transhuge-stress.c b/tools/testing/selftests/vm/transhuge-stress.c
>> index 5e4c036f6ad3..f04c8aa4bcf6 100644
>> --- a/tools/testing/selftests/vm/transhuge-stress.c
>> +++ b/tools/testing/selftests/vm/transhuge-stress.c
>> @@ -16,8 +16,16 @@
>>   #include <string.h>
>>   #include <sys/mman.h>
>>   
>> +#ifdef __powerpc64__
>> +#define PAGE_SHIFT	16
>> +/*
>> + * This will only work with radix 2M hugepage size
>> + */
>> +#define HPAGE_SHIFT 21
>
> Why not have this is in common code?

Can you suggest where I can move that. We also have helper functions
like allocate_transhuge() duplicated between tests. I didn't find
libutil.a or anything similar supported by the selftets build. 

>
>> +#else
>>   #define PAGE_SHIFT 12
>>   #define HPAGE_SHIFT 21
>
> Same here.
>
>> +#endif
>>   
>>   #define PAGE_SIZE (1 << PAGE_SHIFT)
>>   #define HPAGE_SIZE (1 << HPAGE_SHIFT)
>> 
>
> Please cc linux-kselftest mailing list in the future.
>
> With the above fixed.
>
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
>
> thanks,
> -- Shuah

-aneesh
