Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D30DEC3A0D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 18:09:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jPNv0fvjzDqVN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 02:09:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jPLF3z9NzDqJB
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2019 02:07:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46jPLF21tQz8sx3
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2019 02:07:33 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46jPLF1Jjxz9sP7; Wed,  2 Oct 2019 02:07:33 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nayna@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46jPLD0yNkz9sDB;
 Wed,  2 Oct 2019 02:07:31 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x91G2Q2X017754; Tue, 1 Oct 2019 12:07:18 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vc8e7m7mw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 12:07:18 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x91G2cZx018895;
 Tue, 1 Oct 2019 12:07:17 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vc8e7m7m7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 12:07:17 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x91G5EFo009042;
 Tue, 1 Oct 2019 16:07:15 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04wdc.us.ibm.com with ESMTP id 2v9y57vkwd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 16:07:15 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x91G7EKW59703610
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Oct 2019 16:07:14 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3C18BE05B;
 Tue,  1 Oct 2019 16:07:13 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 28767BE051;
 Tue,  1 Oct 2019 16:07:11 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.80.224.222])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Oct 2019 16:07:10 +0000 (GMT)
Subject: Re: [PATCH v6 3/9] powerpc: add support to initialize ima policy rules
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Nayna Jain <nayna@linux.ibm.com>
References: <1569594360-7141-1-git-send-email-nayna@linux.ibm.com>
 <1569594360-7141-4-git-send-email-nayna@linux.ibm.com>
 <877e5pwa1b.fsf@morokweng.localdomain>
From: Nayna <nayna@linux.vnet.ibm.com>
Message-ID: <84f057d0-6a0b-d486-0eb6-f1590f32e377@linux.vnet.ibm.com>
Date: Tue, 1 Oct 2019 12:07:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <877e5pwa1b.fsf@morokweng.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-01_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910010139
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-efi@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>, linuxppc-dev@ozlabs.org,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Jeremy Kerr <jk@ozlabs.org>, Elaine Palmer <erpalmer@us.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, linux-integrity@vger.kernel.org,
 George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 09/30/2019 09:04 PM, Thiago Jung Bauermann wrote:
> Hello,

Hi,

>
>> diff --git a/arch/powerpc/kernel/ima_arch.c b/arch/powerpc/kernel/ima_arch.c
>> new file mode 100644
>> index 000000000000..39401b67f19e
>> --- /dev/null
>> +++ b/arch/powerpc/kernel/ima_arch.c
>> @@ -0,0 +1,33 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2019 IBM Corporation
>> + * Author: Nayna Jain
>> + */
>> +
>> +#include <linux/ima.h>
>> +#include <asm/secure_boot.h>
>> +
>> +bool arch_ima_get_secureboot(void)
>> +{
>> +	return is_powerpc_os_secureboot_enabled();
>> +}
>> +
>> +/* Defines IMA appraise rules for secureboot */
>> +static const char *const arch_rules[] = {
>> +	"appraise func=KEXEC_KERNEL_CHECK appraise_type=imasig|modsig",
>> +#if !IS_ENABLED(CONFIG_MODULE_SIG)
>> +	"appraise func=MODULE_CHECK appraise_type=imasig|modsig",
>> +#endif
>> +	NULL
>> +};
>> +
>> +/*
>> + * Returns the relevant IMA arch policies based on the system secureboot state.
>> + */
>> +const char *const *arch_get_ima_policy(void)
>> +{
>> +	if (is_powerpc_os_secureboot_enabled())
>> +		return arch_rules;
>> +
>> +	return NULL;
>> +}
> If CONFIG_MODULE_SIG is enabled but module signatures aren't enforced,
> then IMA won't enforce module signature either. x86's
> arch_get_ima_policy() calls set_module_sig_enforced(). Doesn't the
> powerpc version need to do that as well?
>
> On the flip side, if module signatures are enforced by the module
> subsystem then IMA will verify the signature a second time since there's
> no sharing of signature verification results between the module
> subsystem and IMA (this was observed by Mimi).
>
> IMHO this is a minor issue, since module loading isn't a hot path and
> the duplicate work shouldn't impact anything. But it could be avoided by
> having a NULL entry in arch_rules, which arch_get_ima_policy() would
> dynamically update with the "appraise func=MODULE_CHECK" rule if
> is_module_sig_enforced() is true.

Thanks Thiago for reviewing.  I am wondering that this will give two 
meanings for NULL. Can we do something like below, there are possibly 
two options ?

1. Set IMA_APPRAISED in the iint->flags if is_module_sig_enforced().

OR

2. Let ima_get_action() check for is_module_sig_enforced() when policy 
is appraise and func is MODULE_CHECK.

Thanks & Regards,
    - Nayna
