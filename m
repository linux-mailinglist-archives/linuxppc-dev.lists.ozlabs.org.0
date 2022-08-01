Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B36585871A4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Aug 2022 21:46:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxTCT6TDJz3c1n
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 05:46:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cGQBHGG/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cGQBHGG/;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxTBh1kktz2xRq
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Aug 2022 05:46:03 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 271JftBe029530;
	Mon, 1 Aug 2022 19:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=iW79CqCDUqzydRd5v87euDMCXfRZtOiblsNH53VoKSs=;
 b=cGQBHGG/kifoics0z4o9RRchxYvo8gNXA/p/m2fF25InUB69kdJpOWzqDc7DNSHqNf8u
 tRDVmknZ5/413PFjS8+tAIqJLjwsgoH6KzYvw0bqWcKeuIwLe9AK0GC6nYn+nT977/f+
 cxjU9dfmg62lpr2u6nJGnPfgQPuegLWtYUoqLIhNIDWb0Hh+RnFWNVK9zFsEDXo6OKnD
 ecbukX2tXAZrWS5nioRKONUtM5Qz3QshESTYW3GAVJ8k+WxnSdfOGHt/oJXUMQXOdCzI
 jx85FpNatxR4TWOLddIZvig+PSl5vT/PIefx+zfAoX8FXZBq/B9Xy05x/1tpNfJ95YUh yA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hpn7bg2xs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Aug 2022 19:45:49 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 271JglXE003102;
	Mon, 1 Aug 2022 19:45:49 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hpn7bg2xf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Aug 2022 19:45:49 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 271Ja3pO027967;
	Mon, 1 Aug 2022 19:45:48 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com [9.57.198.25])
	by ppma03dal.us.ibm.com with ESMTP id 3hmv999awr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Aug 2022 19:45:48 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 271JjlgY64880976
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 1 Aug 2022 19:45:47 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3D810AC062;
	Mon,  1 Aug 2022 19:45:47 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E3F35AC059;
	Mon,  1 Aug 2022 19:45:45 +0000 (GMT)
Received: from [9.211.133.43] (unknown [9.211.133.43])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
	Mon,  1 Aug 2022 19:45:45 +0000 (GMT)
Message-ID: <61ebf904-8ce1-eeac-888a-4040711e7903@linux.vnet.ibm.com>
Date: Mon, 1 Aug 2022 15:45:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v3 1/2] lib: generic accessor functions for arch keystore
Content-Language: en-US
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <20220801123426.585801-1-gjoyce@linux.vnet.ibm.com>
 <20220801123426.585801-2-gjoyce@linux.vnet.ibm.com>
 <20220801134018.GY17705@kitsune.suse.cz>
From: Nayna <nayna@linux.vnet.ibm.com>
In-Reply-To: <20220801134018.GY17705@kitsune.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MZkIk_L72aOUv5iJ1rYAbAa2zfpPpVLU
X-Proofpoint-ORIG-GUID: VvUDwBTybJDOcIEpe_2sH59i8Hjlz4zp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-01_10,2022-08-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1011
 suspectscore=0 mlxlogscore=999 spamscore=0 adultscore=0 mlxscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208010096
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
Cc: axboe@kernel.dk, Christophe Leroy <christophe.leroy@c-s.fr>, gjoyce@linux.vnet.ibm.com, nayna@linux.ibm.com, Nick Piggin <npiggin@gmail.com>, linux-block@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, gjoyce@ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 8/1/22 09:40, Michal Suchánek wrote:
> Hello,
>
> On Mon, Aug 01, 2022 at 07:34:25AM -0500, gjoyce@linux.vnet.ibm.com wrote:
>> From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
>>
>> Generic kernel subsystems may rely on platform specific persistent
>> KeyStore to store objects containing sensitive key material. In such case,
>> they need to access architecture specific functions to perform read/write
>> operations on these variables.
>>
>> Define the generic variable read/write prototypes to be implemented by
>> architecture specific versions. The default(weak) implementations of
>> these prototypes return -EOPNOTSUPP unless overridden by architecture
>> versions.
>>
>> Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
>> ---
>>   include/linux/arch_vars.h | 23 +++++++++++++++++++++++
>>   lib/Makefile              |  2 +-
>>   lib/arch_vars.c           | 25 +++++++++++++++++++++++++
>>   3 files changed, 49 insertions(+), 1 deletion(-)
>>   create mode 100644 include/linux/arch_vars.h
>>   create mode 100644 lib/arch_vars.c
>>
>> diff --git a/include/linux/arch_vars.h b/include/linux/arch_vars.h
>> new file mode 100644
>> index 000000000000..9c280ff9432e
>> --- /dev/null
>> +++ b/include/linux/arch_vars.h
>> @@ -0,0 +1,23 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Platform variable opearations.
>> + *
>> + * Copyright (C) 2022 IBM Corporation
>> + *
>> + * These are the accessor functions (read/write) for architecture specific
>> + * variables. Specific architectures can provide overrides.
>> + *
>> + */
>> +
>> +#include <linux/kernel.h>
>> +
>> +enum arch_variable_type {
>> +	ARCH_VAR_OPAL_KEY      = 0,     /* SED Opal Authentication Key */
>> +	ARCH_VAR_OTHER         = 1,     /* Other type of variable */
>> +	ARCH_VAR_MAX           = 1,     /* Maximum type value */
>> +};
>> +
>> +int arch_read_variable(enum arch_variable_type type, char *varname,
>> +		       void *varbuf, u_int *varlen);
>> +int arch_write_variable(enum arch_variable_type type, char *varname,
>> +			void *varbuf, u_int varlen);
>> diff --git a/lib/Makefile b/lib/Makefile
>> index f99bf61f8bbc..b90c4cb0dbbb 100644
>> --- a/lib/Makefile
>> +++ b/lib/Makefile
>> @@ -48,7 +48,7 @@ obj-y += bcd.o sort.o parser.o debug_locks.o random32.o \
>>   	 bsearch.o find_bit.o llist.o memweight.o kfifo.o \
>>   	 percpu-refcount.o rhashtable.o \
>>   	 once.o refcount.o usercopy.o errseq.o bucket_locks.o \
>> -	 generic-radix-tree.o
>> +	 generic-radix-tree.o arch_vars.o
>>   obj-$(CONFIG_STRING_SELFTEST) += test_string.o
>>   obj-y += string_helpers.o
>>   obj-$(CONFIG_TEST_STRING_HELPERS) += test-string_helpers.o
>> diff --git a/lib/arch_vars.c b/lib/arch_vars.c
>> new file mode 100644
>> index 000000000000..e6f16d7d09c1
>> --- /dev/null
>> +++ b/lib/arch_vars.c
>> @@ -0,0 +1,25 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Platform variable operations.
>> + *
>> + * Copyright (C) 2022 IBM Corporation
>> + *
>> + * These are the accessor functions (read/write) for architecture specific
>> + * variables. Specific architectures can provide overrides.
>> + *
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/arch_vars.h>
>> +
>> +int __weak arch_read_variable(enum arch_variable_type type, char *varname,
>> +			      void *varbuf, u_int *varlen)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
>> +
>> +int __weak arch_write_variable(enum arch_variable_type type, char *varname,
>> +			       void *varbuf, u_int varlen)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
>> -- 
> Doesn't EFI already have some variables?
>
> And even powernv?
>
> Shouldn't this generalize the already existing variables?
>
> Or move to powerpc and at least generalize the powerpc ones?

Yes, EFI and PowerNV do have variables, but I am not exactly clear about 
your reference to them in this context. What do you mean by generalize 
already existing variables ?

This interface is actually generalizing calls to access platform 
specific keystores. It is explained in cover letter that this patch is 
defining generic interface and these are default implementations which 
needs to be overridden by arch specific versions.  For PowerVM PLPAR 
Platform KeyStore, the arch specific version is implemented in Patch 2.

Access to EFI variables should be implemented by EFI arch specific 
interface and PowerNV will have to do the same if it needs to.

Hope it helps.

Thanks & Regards,

     - Nayna

