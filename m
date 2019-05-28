Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B78082CF2D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 21:08:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45D3Jp1zkNzDqPl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2019 05:08:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45D3HR0sNHzDqL8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2019 05:06:58 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4SJ6nn5101574
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 15:06:56 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ss88npwn5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 15:06:51 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bauerman@linux.ibm.com>;
 Tue, 28 May 2019 20:03:30 +0100
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 28 May 2019 20:03:25 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4SJ3OtQ34996472
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 May 2019 19:03:24 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F409AC059;
 Tue, 28 May 2019 19:03:24 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8FD62AC064;
 Tue, 28 May 2019 19:03:20 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.85.218.160])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 28 May 2019 19:03:20 +0000 (GMT)
References: <20190418035120.2354-1-bauerman@linux.ibm.com>
 <20190418035120.2354-2-bauerman@linux.ibm.com>
 <1557416528.10635.62.camel@linux.ibm.com>
User-agent: mu4e 1.0; emacs 26.2
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v10 01/12] MODSIGN: Export module signature definitions
In-reply-to: <1557416528.10635.62.camel@linux.ibm.com>
Date: Tue, 28 May 2019 16:03:15 -0300
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19052819-0064-0000-0000-000003E60CE6
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011176; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01209913; UDB=6.00635630; IPR=6.00990943; 
 MB=3.00027089; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-28 19:03:29
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052819-0065-0000-0000-00003DA623F4
Message-Id: <875zpu766k.fsf@morokweng.localdomain>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-28_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905280119
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-doc@vger.kernel.org,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, James Morris <jmorris@namei.org>,
 David Howells <dhowells@redhat.com>, "AKASHI,
 Takahiro" <takahiro.akashi@linaro.org>, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
 Jessica Yu <jeyu@kernel.org>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, David Woodhouse <dwmw2@infradead.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Mimi Zohar <zohar@linux.ibm.com> writes:

> On Thu, 2019-04-18 at 00:51 -0300, Thiago Jung Bauermann wrote:
>> IMA will use the module_signature format for append signatures, so export
>> the relevant definitions and factor out the code which verifies that the
>> appended signature trailer is valid.
>> 
>> Also, create a CONFIG_MODULE_SIG_FORMAT option so that IMA can select it
>> and be able to use mod_check_sig() without having to depend on either
>> CONFIG_MODULE_SIG or CONFIG_MODULES.
>> 
>> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>> Cc: Jessica Yu <jeyu@kernel.org>
>
> Just a couple minor questions/comments below.
>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>

Thanks for your review and your comments!

>> diff --git a/init/Kconfig b/init/Kconfig
>> index 4592bf7997c0..a71019553ee1 100644
>> --- a/init/Kconfig
>> +++ b/init/Kconfig
>> @@ -1906,7 +1906,7 @@ config MODULE_SRCVERSION_ALL
>>  config MODULE_SIG
>>  	bool "Module signature verification"
>>  	depends on MODULES
>> -	select SYSTEM_DATA_VERIFICATION
>> +	select MODULE_SIG_FORMAT
>>  	help
>>  	  Check modules for valid signatures upon load: the signature
>>  	  is simply appended to the module. For more information see
>> @@ -2036,6 +2036,10 @@ config TRIM_UNUSED_KSYMS
>>  
>>  endif # MODULES
>>  
>> +config MODULE_SIG_FORMAT
>> +	def_bool n
>> +	select SYSTEM_DATA_VERIFICATION
>
> Normally Kconfigs, in the same file, are defined before they are used.
>  I'm not sure if that is required or just a convention.

I think it's a convention, because it seemed to work in the current way.
For the next version I moved the config MODULE_SIG_FORMAT definition to
just before "menuconfig MODULES"

>> diff --git a/kernel/module_signature.c b/kernel/module_signature.c
>> new file mode 100644
>> index 000000000000..6d5e59f27f55
>> --- /dev/null
>> +++ b/kernel/module_signature.c
>> @@ -0,0 +1,45 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Module signature checker
>> + *
>> + * Copyright (C) 2012 Red Hat, Inc. All Rights Reserved.
>> + * Written by David Howells (dhowells@redhat.com)
>> + */
>> +
>> +#include <linux/errno.h>
>> +#include <linux/printk.h>
>> +#include <linux/module_signature.h>
>> +#include <asm/byteorder.h>
>> +
>> +/**
>> + * mod_check_sig - check that the given signature is sane
>> + *
>> + * @ms:		Signature to check.
>> + * @file_len:	Size of the file to which @ms is appended.
>
> "name" is missing.

Fixed.

-- 
Thiago Jung Bauermann
IBM Linux Technology Center

