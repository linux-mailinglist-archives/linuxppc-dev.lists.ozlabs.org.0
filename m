Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D27DDA1D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2019 20:34:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46wWlS5ZLMzDqcS
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Oct 2019 05:34:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46wWbL1lxWzDqXK
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Oct 2019 05:27:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46wWbK0Shmz8tTR
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Oct 2019 05:27:25 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 46wWbJ5H0qz9sP4; Sun, 20 Oct 2019 05:27:24 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46wWbJ1CBLz9sP3;
 Sun, 20 Oct 2019 05:27:23 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9JI6gdE139327; Sat, 19 Oct 2019 14:27:14 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vqv3tfb2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Oct 2019 14:27:14 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x9JI75Hl140249;
 Sat, 19 Oct 2019 14:27:14 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vqv3tfb2e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Oct 2019 14:27:13 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9JIPMQS000439;
 Sat, 19 Oct 2019 18:27:13 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04wdc.us.ibm.com with ESMTP id 2vqt46msw1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Oct 2019 18:27:13 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9JIRBnc63373698
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Oct 2019 18:27:11 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13B36136060;
 Sat, 19 Oct 2019 18:27:11 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79FD3136051;
 Sat, 19 Oct 2019 18:27:08 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.85.146.216])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 19 Oct 2019 18:27:08 +0000 (GMT)
Subject: Re: [PATCH v7 4/8] powerpc/ima: add measurement rules to ima arch
 specific policy
To: Michael Ellerman <mpe@ellerman.id.au>, Nayna Jain <nayna@linux.ibm.com>,
 linuxppc-dev@ozlabs.org, linux-efi@vger.kernel.org,
 linux-integrity@vger.kernel.org
References: <1570497267-13672-1-git-send-email-nayna@linux.ibm.com>
 <1570497267-13672-5-git-send-email-nayna@linux.ibm.com>
 <8736fuuu0x.fsf@mpe.ellerman.id.au>
From: Nayna <nayna@linux.vnet.ibm.com>
Message-ID: <6f1d20dc-fb1e-58ed-a060-1537c19beed0@linux.vnet.ibm.com>
Date: Sat, 19 Oct 2019 14:27:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <8736fuuu0x.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-19_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910190171
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
 Eric Ricther <erichte@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>, Paul Mackerras <paulus@samba.org>,
 Jeremy Kerr <jk@ozlabs.org>, Elaine Palmer <erpalmer@us.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oliver O'Halloran <oohall@gmail.com>, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,


On 10/15/2019 07:29 AM, Michael Ellerman wrote:
> Nayna Jain <nayna@linux.ibm.com> writes:
>> This patch adds the measurement rules to the arch specific policies on
>> trusted boot enabled systems.
>>
>> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
>> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
>> ---
>>   arch/powerpc/kernel/ima_arch.c | 45 +++++++++++++++++++++++++++++++---
>>   1 file changed, 42 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/ima_arch.c b/arch/powerpc/kernel/ima_arch.c
>> index c22d82965eb4..88bfe4a1a9a5 100644
>> --- a/arch/powerpc/kernel/ima_arch.c
>> +++ b/arch/powerpc/kernel/ima_arch.c
>> @@ -12,8 +12,19 @@ bool arch_ima_get_secureboot(void)
>>   	return is_powerpc_os_secureboot_enabled();
>>   }
>>   
>> -/* Defines IMA appraise rules for secureboot */
>> +/*
>> + * The "arch_rules" contains both the securebot and trustedboot rules for adding
>> + * the kexec kernel image and kernel modules file hashes to the IMA measurement
>> + * list and verifying the file signatures against known good values.
>> + *
>> + * The "appraise_type=imasig|modsig" option allows the good signature to be
>> + * stored as an xattr or as an appended signature. The "template=ima-modsig"
>> + * option includes the appended signature, when available, in the IMA
>> + * measurement list.
>> + */
>>   static const char *const arch_rules[] = {
>> +	"measure func=KEXEC_KERNEL_CHECK template=ima-modsig",
>> +	"measure func=MODULE_CHECK template=ima-modsig",
>>   	"appraise func=KEXEC_KERNEL_CHECK appraise_type=imasig|modsig",
>>   #if !IS_ENABLED(CONFIG_MODULE_SIG_FORCE)
>>   	"appraise func=MODULE_CHECK appraise_type=imasig|modsig",
>> @@ -22,12 +33,40 @@ static const char *const arch_rules[] = {
>>   };
>>   
>>   /*
>> - * Returns the relevant IMA arch policies based on the system secureboot state.
>> + * The "measure_rules" are enabled only on "trustedboot" enabled systems.
>> + * These rules add the kexec kernel image and kernel modules file hashes to
>> + * the IMA measurement list.
>> + */
>> +static const char *const measure_rules[] = {
>> +	"measure func=KEXEC_KERNEL_CHECK",
>> +	"measure func=MODULE_CHECK",
> Why do these ones not have "template=ima-modsig" on the end?

ima-modsig template is applicable only when IMA "collects" the appended 
signatures. IMA can then include it in the measurement list.

>
>> +	NULL
>> +};
>> +
>> +/*
>> + * Returns the relevant IMA arch policies based on the system secureboot
>> + * and trustedboot state.
>>    */
>>   const char *const *arch_get_ima_policy(void)
>>   {
>> -	if (is_powerpc_os_secureboot_enabled())
>> +	const char *const *rules;
>> +	int offset = 0;
>> +
>> +	for (rules = arch_rules; *rules != NULL; rules++) {
>> +		if (strncmp(*rules, "appraise", 8) == 0)
>> +			break;
>> +		offset++;
>> +	}
> This seems like kind of a hack, doesn't it? :)
>
> What we really want is three sets of rules isn't it? But some of them
> are shared between the different sets. But they just have to be flat
> arrays of strings.
>
> I think it would probably be cleaner to just use a #define for the
> shared part of the rules, eg something like:
>
> #ifdef CONFIG_MODULE_SIG_FORCE
> #define APPRAISE_MODULE
> #else
> #define APPRAISE_MODULE \
> 	"appraise func=MODULE_CHECK appraise_flag=check_blacklist appraise_type=imasig|modsig",
> #endif
>
> #define APPRAISE_KERNEL \
> 	"appraise func=KEXEC_KERNEL_CHECK appraise_flag=check_blacklist appraise_type=imasig|modsig"
>
> #define MEASURE_KERNEL \
> 	"measure func=KEXEC_KERNEL_CHECK"
>
> #define MEASURE_MODULE \
> 	"measure func=MODULE_CHECK"
>
> #define APPEND_TEMPLATE_IMA_MODSIG		\
> 	" template=ima-modsig"
>
> static const char *const secure_and_trusted_rules[] = {
> 	MEASURE_KERNEL APPEND_TEMPLATE_IMA_MODSIG,
> 	MEASURE_MODULE APPEND_TEMPLATE_IMA_MODSIG,
> 	APPRAISE_KERNEL,
> 	APPRAISE_MODULE
> 	NULL
> };
>
> static const char *const secure_rules[] = {
> 	APPRAISE_KERNEL,
> 	APPRAISE_MODULE
> 	NULL
> };
>
> static const char *const trusted_rules[] = {
> 	MEASURE_KERNEL,
> 	MEASURE_MODULE,
> 	NULL
> };

Yes, I agree it is sort of a hack to walk through the rules to find the 
start of the appraise policy.  While trying your suggestion, I realized 
that defining three arrays, with some rule duplication, can fix the hack 
without #defines. This also improves readability of the rules. I have 
just now posted the new version with the changes. Please let me know if 
this looks ok.

Thanks & Regards,
      - Nayna

