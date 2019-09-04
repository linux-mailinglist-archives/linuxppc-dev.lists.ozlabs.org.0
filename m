Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5FBA7A88
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 07:03:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NWtf3gr2zDqjZ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 15:03:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=gromero@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NWpR1dv9zDqpy
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 14:59:59 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x844xKaa054915; Wed, 4 Sep 2019 00:59:54 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ut59ft61k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Sep 2019 00:59:54 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x844t6iQ009032;
 Wed, 4 Sep 2019 04:59:54 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 2uqgh74ryf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Sep 2019 04:59:53 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x844xqRp61342032
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Sep 2019 04:59:52 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 677C87805C;
 Wed,  4 Sep 2019 04:59:52 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6537378063;
 Wed,  4 Sep 2019 04:59:51 +0000 (GMT)
Received: from oc6336877782.ibm.com (unknown [9.80.235.180])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  4 Sep 2019 04:59:51 +0000 (GMT)
Subject: Re: [PATCH 3/3] powerpc/tm: Add tm-poison test
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20190903044718.13773-1-mikey@neuling.org>
 <20190903044718.13773-3-mikey@neuling.org>
 <87k1apr49n.fsf@mpe.ellerman.id.au>
From: Gustavo Romero <gromero@linux.vnet.ibm.com>
Message-ID: <59912aa2-336b-2e44-822f-e400d0decb9f@linux.vnet.ibm.com>
Date: Wed, 4 Sep 2019 01:59:50 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <87k1apr49n.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-04_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909040051
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
Cc: linuxppc-dev@lists.ozlabs.org, Gustavo Romero <gromero@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On 09/03/2019 08:46 AM, Michael Ellerman wrote:
> Michael Neuling <mikey@neuling.org> writes:
>> From: Gustavo Romero <gromero@linux.ibm.com>
>>
>> Add TM selftest to check if FP or VEC register values from one process
>> can leak into another process when both run on the same CPU.
>>
>> This tests for CVE-2019-15030 and CVE-2019-15031.
>>
>> Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
>> Signed-off-by: Michael Neuling <mikey@neuling.org>
>> ---
>>   tools/testing/selftests/powerpc/tm/.gitignore |   1 +
>>   tools/testing/selftests/powerpc/tm/Makefile   |   2 +-
>>   .../testing/selftests/powerpc/tm/tm-poison.c  | 180 ++++++++++++++++++
>>   3 files changed, 182 insertions(+), 1 deletion(-)
>>   create mode 100644 tools/testing/selftests/powerpc/tm/tm-poison.c
> 
> This doesn't build on 64-bit big endian:
> 
> tm-poison.c: In function 'tm_poison_test':
> tm-poison.c:118:10: error: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'uint64_t {aka long long unsigned int}' [-Werror=format=]
>     printf("Unknown value %#lx leaked into f31!\n", unknown);
>            ^
> tm-poison.c:166:10: error: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'uint64_t {aka long long unsigned int}' [-Werror=format=]
>     printf("Unknown value %#lx leaked into vr31!\n", unknown);
>            ^

Sorry. I sent a v2 addressing it. Now I tested the fix against Travis CI.

Thank you.

Cheers,
Gustavo
