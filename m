Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81859CFB1C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2019 15:15:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ndBS5c9hzDqKq
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2019 00:15:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nd703GcDzDqLP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2019 00:12:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46nd6z3wgjz8tS0
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2019 00:12:27 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 46nd6z2YYgz9sNF; Wed,  9 Oct 2019 00:12:27 +1100 (AEDT)
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
 by ozlabs.org (Postfix) with ESMTPS id 46nd6y4B9vz9sN1;
 Wed,  9 Oct 2019 00:12:25 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x98DC8GZ068584; Tue, 8 Oct 2019 09:12:14 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vgqvrys19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Oct 2019 09:12:14 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x98DCDZE069161;
 Tue, 8 Oct 2019 09:12:13 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vgqvryryy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Oct 2019 09:12:13 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x98DAAHg014302;
 Tue, 8 Oct 2019 13:12:14 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01wdc.us.ibm.com with ESMTP id 2vejt6seb9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Oct 2019 13:12:14 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x98DCBrY52166922
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Oct 2019 13:12:11 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42B3FAC065;
 Tue,  8 Oct 2019 13:12:11 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD24DAC062;
 Tue,  8 Oct 2019 13:12:09 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.85.189.174])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  8 Oct 2019 13:12:09 +0000 (GMT)
Subject: Re: [PATCH v6 3/9] powerpc: add support to initialize ima policy rules
To: Mimi Zohar <zohar@linux.ibm.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Nayna Jain <nayna@linux.ibm.com>
References: <1569594360-7141-1-git-send-email-nayna@linux.ibm.com>
 <1569594360-7141-4-git-send-email-nayna@linux.ibm.com>
 <877e5pwa1b.fsf@morokweng.localdomain>
 <84f057d0-6a0b-d486-0eb6-f1590f32e377@linux.vnet.ibm.com>
 <1570052950.4421.70.camel@linux.ibm.com>
From: Nayna <nayna@linux.vnet.ibm.com>
Message-ID: <2d4a1890-5fb0-3bef-cd78-8cb75ca73076@linux.vnet.ibm.com>
Date: Tue, 8 Oct 2019 09:12:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1570052950.4421.70.camel@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-08_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910080127
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
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>, linuxppc-dev@ozlabs.org,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Jeremy Kerr <jk@ozlabs.org>, Elaine Palmer <erpalmer@us.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, linux-integrity@vger.kernel.org,
 George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/02/2019 05:49 PM, Mimi Zohar wrote:
> On Tue, 2019-10-01 at 12:07 -0400, Nayna wrote:
>> On 09/30/2019 09:04 PM, Thiago Jung Bauermann wrote:
>>> Hello,
>> Hi,
>>
>>>> diff --git a/arch/powerpc/kernel/ima_arch.c b/arch/powerpc/kernel/ima_arch.c
>>>> new file mode 100644
>>>> index 000000000000..39401b67f19e
>>>> --- /dev/null
>>>> +++ b/arch/powerpc/kernel/ima_arch.c
>>>> @@ -0,0 +1,33 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * Copyright (C) 2019 IBM Corporation
>>>> + * Author: Nayna Jain
>>>> + */
>>>> +
>>>> +#include <linux/ima.h>
>>>> +#include <asm/secure_boot.h>
>>>> +
>>>> +bool arch_ima_get_secureboot(void)
>>>> +{
>>>> +	return is_powerpc_os_secureboot_enabled();
>>>> +}
>>>> +
>>>> +/* Defines IMA appraise rules for secureboot */
>>>> +static const char *const arch_rules[] = {
>>>> +	"appraise func=KEXEC_KERNEL_CHECK appraise_type=imasig|modsig",
>>>> +#if !IS_ENABLED(CONFIG_MODULE_SIG)
>>>> +	"appraise func=MODULE_CHECK appraise_type=imasig|modsig",
>>>> +#endif
>>>> +	NULL
>>>> +};
>>>> +
>>>> +/*
>>>> + * Returns the relevant IMA arch policies based on the system secureboot state.
>>>> + */
>>>> +const char *const *arch_get_ima_policy(void)
>>>> +{
>>>> +	if (is_powerpc_os_secureboot_enabled())
>>>> +		return arch_rules;
>>>> +
>>>> +	return NULL;
>>>> +}
>>> If CONFIG_MODULE_SIG is enabled but module signatures aren't enforced,
>>> then IMA won't enforce module signature either. x86's
>>> arch_get_ima_policy() calls set_module_sig_enforced(). Doesn't the
>>> powerpc version need to do that as well?
>>>
>>> On the flip side, if module signatures are enforced by the module
>>> subsystem then IMA will verify the signature a second time since there's
>>> no sharing of signature verification results between the module
>>> subsystem and IMA (this was observed by Mimi).
>>>
>>> IMHO this is a minor issue, since module loading isn't a hot path and
>>> the duplicate work shouldn't impact anything. But it could be avoided by
>>> having a NULL entry in arch_rules, which arch_get_ima_policy() would
>>> dynamically update with the "appraise func=MODULE_CHECK" rule if
>>> is_module_sig_enforced() is true.
>> Thanks Thiago for reviewing.  I am wondering that this will give two
>> meanings for NULL. Can we do something like below, there are possibly
>> two options ?
>>
>> 1. Set IMA_APPRAISED in the iint->flags if is_module_sig_enforced().
>>
>> OR
>>
>> 2. Let ima_get_action() check for is_module_sig_enforced() when policy
>> is appraise and func is MODULE_CHECK.
> I'm a bit hesitant about mixing the module subsystem signature
> verification method with the IMA measure "template=ima-modsig" rules.
>   Does it actually work?
>
> We can at least limit verifying the same appended signature twice to
> when "module.sig_enforce" is specified on the boot command line, by
> changing "!IS_ENABLED(CONFIG_MODULE_SIG)" to test
> "CONFIG_MODULE_SIG_FORCE".

Yes this seems to be a better idea. I have implemented this in the v7 
version of the ima_arch version.

Thanks & Regards,
      - Nayna
