Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BF78F828
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 02:54:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468lFW5fWZzDq9s
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 10:54:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468lCj4693zDq6J
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 10:52:33 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7G0qGlT129741
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 20:52:30 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2udgrp2xjt-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 20:52:30 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bauerman@linux.ibm.com>;
 Fri, 16 Aug 2019 01:52:30 +0100
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 16 Aug 2019 01:52:26 +0100
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7G0qOSx42139982
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Aug 2019 00:52:25 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE6ACC6055;
 Fri, 16 Aug 2019 00:52:24 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B9BD7C6057;
 Fri, 16 Aug 2019 00:52:21 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.85.158.166])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 16 Aug 2019 00:52:21 +0000 (GMT)
References: <20190806052237.12525-1-bauerman@linux.ibm.com>
 <20190806052237.12525-9-bauerman@linux.ibm.com>
 <875zn2sgqs.fsf@concordia.ellerman.id.au>
 <87sgq6gium.fsf@morokweng.localdomain>
 <87tvakqap7.fsf@concordia.ellerman.id.au>
User-agent: mu4e 1.2.0; emacs 26.2
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v3 08/16] powerpc/pseries/svm: Use shared memory for
 LPPACA structures
In-reply-to: <87tvakqap7.fsf@concordia.ellerman.id.au>
Date: Thu, 15 Aug 2019 21:52:17 -0300
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19081600-0012-0000-0000-0000175B83EC
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011595; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01247410; UDB=6.00658345; IPR=6.01028917; 
 MB=3.00028192; MTD=3.00000008; XFM=3.00000015; UTC=2019-08-16 00:52:29
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19081600-0013-0000-0000-0000587E05A0
Message-Id: <87h86irkxq.fsf@morokweng.localdomain>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-15_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=914 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908160006
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
Cc: Anshuman Khandual <anshuman.linux@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Mike Anderson <andmike@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 Claudio Carvalho <cclaudio@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Michael Ellerman <mpe@ellerman.id.au> writes:

> Thiago Jung Bauermann <bauerman@linux.ibm.com> writes:
>> Michael Ellerman <mpe@ellerman.id.au> writes:
>>> Thiago Jung Bauermann <bauerman@linux.ibm.com> writes:
>>>> From: Anshuman Khandual <khandual@linux.vnet.ibm.com>
>>>>
>>>> LPPACA structures need to be shared with the host. Hence they need to be in
>>>> shared memory. Instead of allocating individual chunks of memory for a
>>>> given structure from memblock, a contiguous chunk of memory is allocated
>>>> and then converted into shared memory. Subsequent allocation requests will
>>>> come from the contiguous chunk which will be always shared memory for all
>>>> structures.
>>>>
>>>> While we are able to use a kmem_cache constructor for the Debug Trace Log,
>>>> LPPACAs are allocated very early in the boot process (before SLUB is
>>>> available) so we need to use a simpler scheme here.
>>>>
>>>> Introduce helper is_svm_platform() which uses the S bit of the MSR to tell
>>>> whether we're running as a secure guest.
>>>>
>>>> Signed-off-by: Anshuman Khandual <khandual@linux.vnet.ibm.com>
>>>> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>>>> ---
>>>>  arch/powerpc/include/asm/svm.h | 26 ++++++++++++++++++++
>>>>  arch/powerpc/kernel/paca.c     | 43 +++++++++++++++++++++++++++++++++-
>>>>  2 files changed, 68 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/powerpc/include/asm/svm.h b/arch/powerpc/include/asm/svm.h
>>>> new file mode 100644
>>>> index 000000000000..fef3740f46a6
>>>> --- /dev/null
>>>> +++ b/arch/powerpc/include/asm/svm.h
>>>> @@ -0,0 +1,26 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0+ */
>>>> +/*
>>>> + * SVM helper functions
>>>> + *
>>>> + * Copyright 2019 Anshuman Khandual, IBM Corporation.
>>>
>>> Are we sure this copyright date is correct?
>>
>> I may be confused about which year the copyright refers to. I thought it
>> was the year when the patch was committed. If it is the first time the
>> patch was published then this one should be 2018.
>
> I'm not a lawyer etc. but AIUI the date above is about the authorship,
> ie. when it was originally written, not when it was published or
> committed.
>
> In general I don't think it matters too much, but in this case I'm
> pretty sure Anshuman can't have possibly written it in 2019 on behalf of
> IBM :)
>
> So we can either change the date to 2018, or drop his name and just say
> it's copyright 2019 by IBM.

I think it's better to change the date to 2018. The same should be done
for svm.c, svm.h and mem_encrypt.h. I'll send a new patch series with
the correction.

-- 
Thiago Jung Bauermann
IBM Linux Technology Center

