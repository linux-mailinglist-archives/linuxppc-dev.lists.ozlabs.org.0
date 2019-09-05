Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7E9AA189
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 13:34:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PJWF2RkyzDr5N
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 21:34:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PJTG2YFKzDqck
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2019 21:32:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46PJTG1fgpz8t7L
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2019 21:32:50 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46PJTG16kXz9sNf; Thu,  5 Sep 2019 21:32:50 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46PJTF4gB3z9sDQ;
 Thu,  5 Sep 2019 21:32:49 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x85BWW6T017256; Thu, 5 Sep 2019 07:32:40 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2usu18rqm8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Sep 2019 07:32:39 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x85BQFvB010338;
 Thu, 5 Sep 2019 11:32:25 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 2uqgh7gv2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Sep 2019 11:32:25 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x85BWNS546268754
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Sep 2019 11:32:23 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 594EB6A047;
 Thu,  5 Sep 2019 11:32:23 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B1C86A04D;
 Thu,  5 Sep 2019 11:32:21 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.80.196.15])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  5 Sep 2019 11:32:21 +0000 (GMT)
Subject: Re: [PATCH v5 1/2] powerpc: detect the secure boot mode of the system
To: Michael Ellerman <mpe@ellerman.id.au>, Nayna Jain <nayna@linux.ibm.com>,
 linuxppc-dev@ozlabs.org, linux-integrity@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1566218108-12705-1-git-send-email-nayna@linux.ibm.com>
 <1566218108-12705-2-git-send-email-nayna@linux.ibm.com>
 <87tv9usynv.fsf@mpe.ellerman.id.au>
From: Nayna <nayna@linux.vnet.ibm.com>
Message-ID: <8366281f-5b24-63cf-bd79-9794298b5bf7@linux.vnet.ibm.com>
Date: Thu, 5 Sep 2019 07:32:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <87tv9usynv.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-05_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909050117
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>, Paul Mackerras <paulus@samba.org>,
 Jeremy Kerr <jk@ozlabs.org>, Elaine Palmer <erpalmer@us.ibm.com>,
 George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 09/02/2019 07:52 AM, Michael Ellerman wrote:
> Hi Nayna,

Hi Michael,

>
> Sorry I've taken so long to get to this series, there's just too many
> patches that need reviewing :/

No problem. I understand. Thanks for reviewing.

>
> Nayna Jain <nayna@linux.ibm.com> writes:
>> Secure boot on POWER defines different IMA policies based on the secure
>> boot state of the system.
> The terminology throughout is a bit vague, we have POWER, PowerPC, Linux
> on POWER etc.
>
> What this patch is talking about is a particular implemention of secure
> boot on some OpenPOWER machines running bare metal - am I right?
>
> So saying "Secure boot on POWER defines different IMA policies" is a bit
> broad I think. Really we've just decided that a way to implement secure
> boot is to use IMA policies.

I think the idea was to convey that the same design can be reused or 
extended as needed.
But I agree for now it is currently only OpenPOWER machines running on 
bare metal, I will fix the wordings to use "PowerNV" consistently.



>
>> This patch defines a function to detect the secure boot state of the
>> system.
>>
>> The PPC_SECURE_BOOT config represents the base enablement of secureboot
>> on POWER.
>>
>> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
>> ---
>>   arch/powerpc/Kconfig               | 11 +++++
>>   arch/powerpc/include/asm/secboot.h | 27 ++++++++++++
>>   arch/powerpc/kernel/Makefile       |  2 +
>>   arch/powerpc/kernel/secboot.c      | 71 ++++++++++++++++++++++++++++++
>>   4 files changed, 111 insertions(+)
>>   create mode 100644 arch/powerpc/include/asm/secboot.h
>>   create mode 100644 arch/powerpc/kernel/secboot.c
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 77f6ebf97113..c902a39124dc 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -912,6 +912,17 @@ config PPC_MEM_KEYS
>>   
>>   	  If unsure, say y.
>>   
>> +config PPC_SECURE_BOOT
>> +	prompt "Enable PowerPC Secure Boot"
> How about "Enable secure boot support"

Yes. Sounds better.

>
>> +	bool
>> +	default n
> The default is 'n', so you don't need that default line.

Sure.


>
>> +	depends on PPC64
> Should it just depend on POWERNV for now? AFAIK there's nothing in here
> that's necessarily going to be shared with the guest secure boot code is
> there?

Yes. sounds good.


>
>> +	help
>> +	  Linux on POWER with firmware secure boot enabled needs to define
>> +	  security policies to extend secure boot to the OS.This config
>> +	  allows user to enable OS Secure Boot on PowerPC systems that
>> +	  have firmware secure boot support.
> Again POWER vs PowerPC.
>
> I think something like:
>
> "Enable support for secure boot on some systems that have firmware
> support for it. If in doubt say N."

Sure.

>
>
>> diff --git a/arch/powerpc/include/asm/secboot.h b/arch/powerpc/include/asm/secboot.h
> secure_boot.h would be fine.

Sure.

>
>> new file mode 100644
>> index 000000000000..e726261bb00b
>> --- /dev/null
>> +++ b/arch/powerpc/include/asm/secboot.h
>> @@ -0,0 +1,27 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * PowerPC secure boot definitions
>> + *
>> + * Copyright (C) 2019 IBM Corporation
>> + * Author: Nayna Jain <nayna@linux.ibm.com>
> I prefer to not have email addresses in copyright headers, as they just
> bit rot. Your email is in the git log.

Sure.


>
>> + *
>> + */
>> +#ifndef POWERPC_SECBOOT_H
>> +#define POWERPC_SECBOOT_H
> We usually do _ASM_POWERPC_SECBOOT_H (or _ASM_POWERPC_SECURE_BOOT_H).

Sure.

>
>> +#ifdef CONFIG_PPC_SECURE_BOOT
>> +extern struct device_node *is_powerpc_secvar_supported(void);
>> +extern bool get_powerpc_secureboot(void);
> You don't need 'extern' for functions in headers.

Yes. will fix.

>
>> +#else
>> +static inline struct device_node *is_powerpc_secvar_supported(void)
>> +{
>> +	return NULL;
>> +}
>> +
>> +static inline bool get_powerpc_secureboot(void)
>> +{
>> +	return false;
>> +}
>> +
>> +#endif
>> +#endif
>> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
>> index ea0c69236789..d310ebb4e526 100644
>> --- a/arch/powerpc/kernel/Makefile
>> +++ b/arch/powerpc/kernel/Makefile
>> @@ -157,6 +157,8 @@ endif
>>   obj-$(CONFIG_EPAPR_PARAVIRT)	+= epapr_paravirt.o epapr_hcalls.o
>>   obj-$(CONFIG_KVM_GUEST)		+= kvm.o kvm_emul.o
>>   
>> +obj-$(CONFIG_PPC_SECURE_BOOT)	+= secboot.o
>> +
>>   # Disable GCOV, KCOV & sanitizers in odd or sensitive code
>>   GCOV_PROFILE_prom_init.o := n
>>   KCOV_INSTRUMENT_prom_init.o := n
>> diff --git a/arch/powerpc/kernel/secboot.c b/arch/powerpc/kernel/secboot.c
>> new file mode 100644
>> index 000000000000..5ea0d52d64ef
>> --- /dev/null
>> +++ b/arch/powerpc/kernel/secboot.c
>> @@ -0,0 +1,71 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2019 IBM Corporation
>> + * Author: Nayna Jain <nayna@linux.ibm.com>
>> + *
>> + * secboot.c
>> + *      - util function to get powerpc secboot state
> That's not really necessary.

Sure.

>
>> + */
>> +#include <linux/types.h>
>> +#include <linux/of.h>
>> +#include <asm/secboot.h>
>> +
>> +struct device_node *is_powerpc_secvar_supported(void)
> This is a pretty weird signature. The "is_" implies it will return a
> bool, but then it actually returns a device node *.

Yes. Agree. Will fix.

>
>> +{
>> +	struct device_node *np;
>> +	int status;
>> +
>> +	np = of_find_node_by_name(NULL, "ibm,secureboot");
>> +	if (!np) {
>> +		pr_info("secureboot node is not found\n");
>> +		return NULL;
>> +	}
> There's no good reason to search by name. You should just search by compatible.
>
> eg. of_find_compatible_node()

Sure.


>
>> +	status = of_device_is_compatible(np, "ibm,secureboot-v3");
>> +	if (!status) {
>> +		pr_info("Secure variables are not supported by this firmware\n");
>> +		return NULL;
>> +	}
>> +
>> +	return np;
>> +}
>> +
>> +bool get_powerpc_secureboot(void)
>> +{
>> +	struct device_node *np;
>> +	struct device_node *secvar_np;
>> +	const u64 *psecboot;
>> +	u64 secboot = 0;
>> +
>> +	np = is_powerpc_secvar_supported();
>> +	if (!np)
>> +		goto disabled;
>> +
>> +	/* Fail-safe for any failure related to secvar */
>> +	secvar_np = of_get_child_by_name(np, "secvar");
> Finding a child by name is not ideal, it encodes the structure of the
> tree in the API. It's better to just search by compatible.
>
> eg. of_find_compatible_node("ibm,secvar-v1")
>
> You should also define what that means, ie. write a little snippet of
> doc to define what the expected properties are and their meaning and so
> on.

It is part of the skiboot patches 
(https://patchwork.ozlabs.org/patch/1157346/)
Sure. I will add one in the kernel as well.


>
>> +	if (!secvar_np) {
>> +		pr_err("Expected secure variables support, fail-safe\n");
> I'm a bit confused by this. This is the exact opposite of what I
> understand fail-safe to mean. We shouldn't tell the user the system is
> securely booted unless we're 100% sure it is. Right?

Yes. Thanks for pointing this out. "Fail secure" is the correct term. 
This is the situation where secure variables are supported. Any failure 
reading the secure variables may be an attack, so we fail securely.


>
>> +		goto enabled;
>> +	}
>> +
>> +	if (!of_device_is_available(secvar_np)) {
>> +		pr_err("Secure variables support is in error state, fail-safe\n");
>> +		goto enabled;
>> +	}
> It seems a little weird to use the status property to indicate ok/error
> and then also have a "secure-mode" property. Wouldn't just "secure-mode"
> be sufficient with several states to represent what we need?

Before we check in which mode the system booted (e.g. setup, user, etc) 
using "secure mode" property, the "status" check helps to ensure that 
the system secure boot initialized correctly. We will look into
combining the two variables.



>
>> +	psecboot = of_get_property(secvar_np, "secure-mode", NULL);
>> +	if (!psecboot)
>> +		goto enabled;
> Please use of_read_property_u64() or similar.

Sure.

>
>> +	secboot = be64_to_cpup((__be64 *)psecboot);
>> +	if (!(secboot & (~0x0)))
> I'm not sure what that's trying to do.

We are exposing secure modes from the skiboot to the kernel via a 
bitfield, partitioned into generic modes and backend specific modes. I 
will update this code so that it is clearer.

Thanks & Regards,
       - Nayna
