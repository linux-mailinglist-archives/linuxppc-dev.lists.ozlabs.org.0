Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A1A988F0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 03:26:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DRhW1fTKzDr2P
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 11:26:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DRfR0qcSzDqyk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 11:25:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46DRfP6zz4z8wQV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 11:25:01 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46DRfP5zcRz9s4Y; Thu, 22 Aug 2019 11:25:01 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cclaudio@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46DRfP10zsz9s7T;
 Thu, 22 Aug 2019 11:24:59 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7M16wLU145246; Wed, 21 Aug 2019 21:24:56 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uhfx5tevd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Aug 2019 21:24:56 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7M1NDrq007394;
 Thu, 22 Aug 2019 01:24:55 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 2ue9777yj3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Aug 2019 01:24:55 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7M1OsvY50332118
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Aug 2019 01:24:54 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A91EAAE05F;
 Thu, 22 Aug 2019 01:24:54 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1FA0AE05C;
 Thu, 22 Aug 2019 01:24:51 +0000 (GMT)
Received: from [9.80.203.17] (unknown [9.80.203.17])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 22 Aug 2019 01:24:51 +0000 (GMT)
Subject: Re: [PATCH v5 2/7] powerpc/kernel: Add ucall_norets() ultravisor call
 handler
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
References: <20190808040555.2371-1-cclaudio@linux.ibm.com>
 <20190808040555.2371-3-cclaudio@linux.ibm.com>
 <87wofgqb2g.fsf@concordia.ellerman.id.au>
From: Claudio Carvalho <cclaudio@linux.ibm.com>
Message-ID: <a470ac08-69cf-c30a-90ef-fb84e943cc00@linux.ibm.com>
Date: Wed, 21 Aug 2019 22:24:50 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <87wofgqb2g.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-22_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908220011
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 kvm-ppc@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 Ryan Grimm <grimm@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Guerney Hunt <gdhh@linux.ibm.com>, Thiago Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 8/14/19 7:46 AM, Michael Ellerman wrote:
> Claudio Carvalho <cclaudio@linux.ibm.com> writes:
>> diff --git a/arch/powerpc/kernel/ucall.S b/arch/powerpc/kernel/ucall.S
>> new file mode 100644
>> index 000000000000..de9133e45d21
>> --- /dev/null
>> +++ b/arch/powerpc/kernel/ucall.S
>> @@ -0,0 +1,20 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Generic code to perform an ultravisor call.
>> + *
>> + * Copyright 2019, IBM Corporation.
>> + *
>> + */
>> +#include <asm/ppc_asm.h>
>> +#include <asm/export.h>
>> +
>> +_GLOBAL(ucall_norets)
>> +EXPORT_SYMBOL_GPL(ucall_norets)
>> +	mfcr	r0
>> +	stw	r0,8(r1)
>> +
>> +	sc	2		/* Invoke the ultravisor */
>> +
>> +	lwz	r0,8(r1)
>> +	mtcrf	0xff,r0
>> +	blr			/* Return r3 = status */
> Paulus points that we shouldn't need to save CR here. Our caller will
> have already saved it if it needed to, and we don't use CR in this
> function so we don't need to save it.

Dropped the CR save/restore in the next patchset version:

_GLOBAL(ucall_norets)
EXPORT_SYMBOL_GPL(ucall_norets)
        sc      2       /* Invoke the ultravisor */
        blr             /* Return r3 = status */


Thanks,
Claudio


>
> That's assuming the Ultravisor follows the hcall ABI in which CR2-4 are
> non-volatile (PAPR § 14.5.3).
>
> I know plpar_hcall_norets() does save CR, but it shouldn't need to, that
> seems to be historical. aka. no one knows why it does it but it always
> has.
>
> cheers
>
