Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71949C44F7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 02:25:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jcNf0lcRzDqQL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 10:25:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jcLt4VKMzDq61
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2019 10:23:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46jcLs6zMCz8wG3
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2019 10:23:49 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46jcLs6cgsz9sPj; Wed,  2 Oct 2019 10:23:49 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46jcLs2p8pz9sPL;
 Wed,  2 Oct 2019 10:23:48 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x920MDcf155641; Tue, 1 Oct 2019 20:23:39 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vbsjt75s7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 20:23:39 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x920MEUP155678;
 Tue, 1 Oct 2019 20:23:38 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vbsjt75re-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 20:23:38 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x920H4E2032344;
 Wed, 2 Oct 2019 00:23:35 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02wdc.us.ibm.com with ESMTP id 2v9y587q2v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Oct 2019 00:23:35 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x920NYta41812442
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Oct 2019 00:23:34 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47D4BBE05A;
 Wed,  2 Oct 2019 00:23:34 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85469BE054;
 Wed,  2 Oct 2019 00:23:29 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.85.154.167])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed,  2 Oct 2019 00:23:29 +0000 (GMT)
References: <1569594360-7141-1-git-send-email-nayna@linux.ibm.com>
 <1569594360-7141-4-git-send-email-nayna@linux.ibm.com>
 <877e5pwa1b.fsf@morokweng.localdomain>
 <84f057d0-6a0b-d486-0eb6-f1590f32e377@linux.vnet.ibm.com>
User-agent: mu4e 1.2.0; emacs 26.2
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Nayna <nayna@linux.vnet.ibm.com>
Subject: Re: [PATCH v6 3/9] powerpc: add support to initialize ima policy rules
In-reply-to: <84f057d0-6a0b-d486-0eb6-f1590f32e377@linux.vnet.ibm.com>
Date: Tue, 01 Oct 2019 21:23:25 -0300
Message-ID: <87eezwvvuq.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-01_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910020000
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nayna Jain <nayna@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>, linuxppc-dev@ozlabs.org,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Jeremy Kerr <jk@ozlabs.org>, Elaine Palmer <erpalmer@us.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, linux-integrity@vger.kernel.org,
 George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hi Nayna,

Nayna <nayna@linux.vnet.ibm.com> writes:

> On 09/30/2019 09:04 PM, Thiago Jung Bauermann wrote:
>>> diff --git a/arch/powerpc/kernel/ima_arch.c b/arch/powerpc/kernel/ima_arch.c
>>> new file mode 100644
>>> index 000000000000..39401b67f19e
>>> --- /dev/null
>>> +++ b/arch/powerpc/kernel/ima_arch.c
>>> @@ -0,0 +1,33 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Copyright (C) 2019 IBM Corporation
>>> + * Author: Nayna Jain
>>> + */
>>> +
>>> +#include <linux/ima.h>
>>> +#include <asm/secure_boot.h>
>>> +
>>> +bool arch_ima_get_secureboot(void)
>>> +{
>>> +	return is_powerpc_os_secureboot_enabled();
>>> +}
>>> +
>>> +/* Defines IMA appraise rules for secureboot */
>>> +static const char *const arch_rules[] = {
>>> +	"appraise func=KEXEC_KERNEL_CHECK appraise_type=imasig|modsig",
>>> +#if !IS_ENABLED(CONFIG_MODULE_SIG)
>>> +	"appraise func=MODULE_CHECK appraise_type=imasig|modsig",
>>> +#endif
>>> +	NULL
>>> +};
>>> +
>>> +/*
>>> + * Returns the relevant IMA arch policies based on the system secureboot state.
>>> + */
>>> +const char *const *arch_get_ima_policy(void)
>>> +{
>>> +	if (is_powerpc_os_secureboot_enabled())
>>> +		return arch_rules;
>>> +
>>> +	return NULL;
>>> +}
>> If CONFIG_MODULE_SIG is enabled but module signatures aren't enforced,
>> then IMA won't enforce module signature either. x86's
>> arch_get_ima_policy() calls set_module_sig_enforced(). Doesn't the
>> powerpc version need to do that as well?
>>
>> On the flip side, if module signatures are enforced by the module
>> subsystem then IMA will verify the signature a second time since there's
>> no sharing of signature verification results between the module
>> subsystem and IMA (this was observed by Mimi).
>>
>> IMHO this is a minor issue, since module loading isn't a hot path and
>> the duplicate work shouldn't impact anything. But it could be avoided by
>> having a NULL entry in arch_rules, which arch_get_ima_policy() would
>> dynamically update with the "appraise func=MODULE_CHECK" rule if
>> is_module_sig_enforced() is true.
>
> Thanks Thiago for reviewing.  I am wondering that this will give two meanings
> for NULL.

What are the two meanings? My understanding is that it only means "end
of array". The additional NULL just allows arch_get_ima_policy() to
dynamically append one item to the array.

But I hadn't thought of your other alternatives. They should work just
as well. Among those, I think option 1 is cleaner.

This addresses the second issue I mentioned, but not the first.

Also, one other thing I just noticed is that x86's arch policy has
measure rules but powerpc's policy doesn't. What is different in our
case?

> Can we do something like below, there are possibly two options ?
>
> 1. Set IMA_APPRAISED in the iint->flags if is_module_sig_enforced().
>
> OR
>
> 2. Let ima_get_action() check for is_module_sig_enforced() when policy is
> appraise and func is MODULE_CHECK.
>
> Thanks & Regards,
>    - Nayna


--
Thiago Jung Bauermann
IBM Linux Technology Center
