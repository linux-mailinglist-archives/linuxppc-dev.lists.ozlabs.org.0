Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA40E218812
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 14:54:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1zlw629DzDqf4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 22:54:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=desnesn@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1zjB5FnvzDqM3
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 22:52:13 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 068C2kSZ108250; Wed, 8 Jul 2020 08:52:10 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 325bew6616-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 08:52:10 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 068CobbD004392;
 Wed, 8 Jul 2020 12:52:09 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 322hd8r38t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 12:52:09 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 068Cq5QU29819196
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Jul 2020 12:52:05 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 655D6BE04F;
 Wed,  8 Jul 2020 12:52:08 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76675BE058;
 Wed,  8 Jul 2020 12:52:07 +0000 (GMT)
Received: from [9.160.130.219] (unknown [9.160.130.219])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  8 Jul 2020 12:52:07 +0000 (GMT)
Subject: Re: [PATCH] selftests/powerpc: Purge extra count_pmc() calls of ebb
 selftests
To: Sachin Sant <sachinp@linux.vnet.ibm.com>
References: <20200626164737.21943-1-desnesn@linux.ibm.com>
 <F0DC61BE-076E-4977-812F-532C6F76CFBB@linux.vnet.ibm.com>
From: Desnes Augusto Nunes do Rosario <desnesn@linux.ibm.com>
Message-ID: <22442b0b-c917-c277-687c-31f30533a549@linux.ibm.com>
Date: Wed, 8 Jul 2020 09:52:06 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <F0DC61BE-076E-4977-812F-532C6F76CFBB@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-08_08:2020-07-08,
 2020-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 priorityscore=1501 cotscore=-2147483648 lowpriorityscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 spamscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2007080088
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
Cc: shuah@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 7/8/20 7:38 AM, Sachin Sant wrote:
>
>> On 26-Jun-2020, at 10:17 PM, Desnes A. Nunes do Rosario <desnesn@linux.ibm.com> wrote:
>>
>> An extra count on ebb_state.stats.pmc_count[PMC_INDEX(pmc)] is being per-
>> formed when count_pmc() is used to reset PMCs on a few selftests. This
>> extra pmc_count can occasionally invalidate results, such as the ones from
>> cycles_test shown hereafter. The ebb_check_count() failed with an above
>> the upper limit error due to the extra value on ebb_state.stats.pmc_count.
>>
>> Furthermore, this extra count is also indicated by extra PMC1 trace_log on
>> the output of the cycle test (as well as on pmc56_overflow_test):
>>
>> ==========
>>    ...
>>    [21]: counter = 8
>>    [22]: register SPRN_MMCR0 = 0x0000000080000080
>>    [23]: register SPRN_PMC1  = 0x0000000080000004
>>    [24]: counter = 9
>>    [25]: register SPRN_MMCR0 = 0x0000000080000080
>>    [26]: register SPRN_PMC1  = 0x0000000080000004
>>    [27]: counter = 10
>>    [28]: register SPRN_MMCR0 = 0x0000000080000080
>>    [29]: register SPRN_PMC1  = 0x0000000080000004
>>>> [30]: register SPRN_PMC1  = 0x000000004000051e
>> PMC1 count (0x280000546) above upper limit 0x2800003e8 (+0x15e)
>> [FAIL] Test FAILED on line 52
>> failure: cycles
>> ==========
>>
>> Signed-off-by: Desnes A. Nunes do Rosario <desnesn@linux.ibm.com>
>> ---
> I too have run into similar failure with cycles_test. I will add that the failure
> is inconsistent. I have run into this issue 1 out of 25 times. The failure always
> happen at first instance. Subsequent tries work correctly.
Indeed; on my tests I was running 100 times to validate.
Thanks for the review Sachin
>
> With this patch applied the test completes successfully 25 out of 25 times.
>
> # ./cycles_test
> test: cycles
> …..
> …..
>    [25]: register SPRN_MMCR0 = 0x0000000080000080
>    [26]: register SPRN_PMC1  = 0x0000000080000004
>    [27]: counter = 10
>    [28]: register SPRN_MMCR0 = 0x0000000080000080
>    [29]: register SPRN_PMC1  = 0x0000000080000004
>    [30]: register SPRN_PMC1  = 0x000000004000048f
> PMC1 count (0x2800004b7) above upper limit 0x2800003e8 (+0xcf)
> [FAIL] Test FAILED on line 52
> failure: cycles
>
> With the patch
>
> # ./cycles_test
> test: cycles
> …..
> …..
>    [25]: register SPRN_MMCR0 = 0x0000000080000080
>    [26]: register SPRN_PMC1  = 0x0000000080000004
>    [27]: counter = 10
>    [28]: register SPRN_MMCR0 = 0x0000000080000080
>    [29]: register SPRN_PMC1  = 0x0000000080000004
> PMC1 count (0x280000028) is between 0x27ffffc18 and 0x2800003e8 delta +0x410/-0x3c0
> success: cycles
> #
>
> FWIW   Tested-by : Sachin Sant <sachinp@linux.vnet.ibm.com>
>
> Thanks
> -Sachin

-- 
Desnes A. Nunes do Rosario
--------------------------------
Advisory Software Engineer - IBM
Virtual Onsite Engineer - Red Hat

