Return-Path: <linuxppc-dev+bounces-14832-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 129C5CC606E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Dec 2025 06:19:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWMY235Fvz2yfl;
	Wed, 17 Dec 2025 16:19:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765948758;
	cv=none; b=Fprw2nn3FbTLZMsyGyefDWxXxKKS2mjp52/HnaC0cuNe4fWuQhbEFAtrNkEtvKfAylhe4ltNdnewZd/5zzvLMuueDcfSiy+HjHmARSmh/NrKxkzeVTQs//aPTbmtLVIRsRkTuV5rh5EAE1igxoHrHEexk6RGYUCyegx85dQJ6Zn4AvXAWf5Ah/37x4HWL01myJAlbSdB2kHNYXMbxRBHBp9i85g713Mh9xGRBPxVUNuSdJLbw5xjn04b2BjWxlPZ4NOH3D9Syb88LgJfx84FYKhXU43Izm8RLlGI5WqvajHkAqV5ViUJsp6tQjWA73xSet1Ud2/5f+GKPquHurROgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765948758; c=relaxed/relaxed;
	bh=IEj/V4BEBtCAXeoeESvEmt1J5auaw4tIt4d3UmFNkMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MGSWh9rev5Fb7B3wmV58b5yR71xcWGHcRAg8q7Ul/q9vldm7KRR/Soqpxxfm2Ou8xLfjoqQXSPY9LEYTXjSfZn+NNTYvqgByxOMxMH6R3twBIA3GbDKfOkTNTdK7VO3lRLd25t96FP7+wZeFN+uK7v2E/Y+oJUa3yzXKFKfsbX4Guqr0uMRX6WrLB3Kb7ArDgcWdYoo7yXEguyeFjj483l6YwkH4vcf4rIxoBevaKDa4dbri+QvFwa0BwONgaBOTbHJzKCSjLJ+6vnRPUlygyaVIsKPuL866ighr96u0glJQ1dZvrv+WjUwtaiRzYUrG1Jn6cQg4vXqry3M1xqN6mg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SWynUWbP; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SWynUWbP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWMY05rk0z2yYJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Dec 2025 16:19:16 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BH31JSJ016846;
	Wed, 17 Dec 2025 05:19:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=IEj/V4
	BEBtCAXeoeESvEmt1J5auaw4tIt4d3UmFNkMI=; b=SWynUWbPmjhIQyS2P/Qf7d
	Ms3sbiFkv3bPqtP3Or81kGkkjzdvTaHQ53G2imvUdwq5P2XiOPknmwe7XyNcjrWK
	MmJUzRJ37Jum8b+PKR9Q68cldT1pNp94J0AAIJKOEItLum/6x7aswCRLgDr9DFo1
	KMql5bwzmc/xbS2Ci3533Gw2Mmn5EMFxmY3BfZhOEouz06WciEDrLnXaKNv03tPG
	xoDllBtxeRpD0vlmBRb9xKauyAPBbFNuFeHqHjVEd/C/Z8WRZDQGuFZNf1D7aE7v
	as/xdQKfX9RHg7xpniJyvCxZC+N3ziPWKW7sqPxh1R/NF0TFfCX2WGjgB31TTc/A
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0wjq2kp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 05:19:02 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BH5J2xx012630;
	Wed, 17 Dec 2025 05:19:02 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0wjq2kp5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 05:19:02 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BH3LOYT014406;
	Wed, 17 Dec 2025 05:19:01 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4b1mpk07nw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 05:19:01 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BH5IxMs59834732
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Dec 2025 05:18:59 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9215E5805C;
	Wed, 17 Dec 2025 05:18:59 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B2EDF5805B;
	Wed, 17 Dec 2025 05:18:54 +0000 (GMT)
Received: from [9.98.107.249] (unknown [9.98.107.249])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 17 Dec 2025 05:18:54 +0000 (GMT)
Message-ID: <41a3a9ae-6d30-40d2-a74d-3a6a31054d50@linux.ibm.com>
Date: Wed, 17 Dec 2025 10:48:53 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] keys/trusted_keys: establish PKWM as a trusted source
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu,
        James.Bottomley@hansenpartnership.com, zohar@linux.ibm.com,
        nayna@linux.ibm.com, rnsastry@linux.ibm.com,
        linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
References: <20251213052618.190691-1-ssrish@linux.ibm.com>
 <20251213052618.190691-6-ssrish@linux.ibm.com> <aT286Y6UYCth0--4@kernel.org>
Content-Language: en-US
From: Srish Srinivasan <ssrish@linux.ibm.com>
In-Reply-To: <aT286Y6UYCth0--4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAwMSBTYWx0ZWRfX6kIxyAaSBgjf
 /EZSYKBXz0sERSI0tndVlNkFXkR+rbROICzcZdXjqNHAkwJ8CevnbcesCVYQD0K3L9/90BYFGQu
 Eqm15cM1YKaj4S4wi4TboNenOVLCOP7+rgkx0Fvvzv3vzxqzUOd+NbEaTWStOMAvgigDnaiXEc3
 k2u7kaxAB3pC6ZgyUU//FNISY2pf/XF1dG3znQyVzUG7ZfZGV1q7dofLoqFQVObbn39NmstyXJq
 1q03ar+zimLqxjdoUxrv5qiEL4VjyewJogG9KogY3DmmqtBCl4Yg/uULAxOvXRnFS5qj5rb9gxC
 27vbuDhocMoYEeT1sEqxzO1GvbDCVedFoUaW7dG9CtPpmgqynsaMcGu1IVpGa+7ox1JFDuBKTlj
 T2fsFfJ7x0v+O+vIQljifN6c8uFjFw==
X-Proofpoint-GUID: 9uRvE69LlVEO2GodtobJjjz-MqkZGjKk
X-Proofpoint-ORIG-GUID: pJd6d3HAj7iErOqERM15gWIZ6T-Er2bi
X-Authority-Analysis: v=2.4 cv=Kq5AGGWN c=1 sm=1 tr=0 ts=69423d46 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8 a=9NsRTiU2Kngsl67-uFcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512130001
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Jarkko,
thank you for taking a look and providing feedback.

On 12/14/25 12:52 AM, Jarkko Sakkinen wrote:
> On Sat, Dec 13, 2025 at 10:56:17AM +0530, Srish Srinivasan wrote:
>> The wrapping key does not exist by default and is generated by the
>> hypervisor as a part of PKWM initialization. This key is then persisted by
>> the hypervisor and is used to wrap trusted keys. These are variable length
>> symmetric keys, which in the case of PowerVM Key Wrapping Module (PKWM) are
>> generated using the kernel RNG. PKWM can be used as a trust source through
>> the following example keyctl command
>>
>> keyctl add trusted my_trusted_key "new 32" @u
>>
>> Use the wrap_flags command option to set the secure boot requirement for
>> the wrapping request through the following keyctl commands
>>
>> case1: no secure boot requirement. (default)
>> keyctl usage: keyctl add trusted my_trusted_key "new 32" @u
>> 	      OR
>> 	      keyctl add trusted my_trusted_key "new 32 wrap_flags=0x00" @u
>>
>> case2: secure boot required to in either audit or enforce mode. set bit 0
>> keyctl usage: keyctl add trusted my_trusted_key "new 32 wrap_flags=0x01" @u
>>
>> case3: secure boot required to be in enforce mode. set bit 1
>> keyctl usage: keyctl add trusted my_trusted_key "new 32 wrap_flags=0x02" @u
>>
>> NOTE:
>> -> Setting the secure boot requirement is NOT a must.
>> -> Only either of the secure boot requirement options should be set. Not
>> both.
>> -> All the other bits are requied to be not set.
>> -> Set the kernel parameter trusted.source=pkwm to choose PKWM as the
>> backend for trusted keys implementation.
>> -> CONFIG_PSERIES_PLPKS must be enabled to build PKWM.
>>
>> Add PKWM, which is a combination of IBM PowerVM and Power LPAR Platform
>> KeyStore, as a new trust source for trusted keys.
>>
>> Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
>> ---
>>   MAINTAINERS                               |   9 ++
>>   include/keys/trusted-type.h               |   7 +-
>>   include/keys/trusted_pkwm.h               |  30 ++++
>>   security/keys/trusted-keys/Kconfig        |   8 ++
>>   security/keys/trusted-keys/Makefile       |   2 +
>>   security/keys/trusted-keys/trusted_core.c |   6 +-
>>   security/keys/trusted-keys/trusted_pkwm.c | 168 ++++++++++++++++++++++
>>   7 files changed, 228 insertions(+), 2 deletions(-)
>>   create mode 100644 include/keys/trusted_pkwm.h
>>   create mode 100644 security/keys/trusted-keys/trusted_pkwm.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index aff3e162180d..bf78ab78a309 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -13993,6 +13993,15 @@ S:	Supported
>>   F:	include/keys/trusted_dcp.h
>>   F:	security/keys/trusted-keys/trusted_dcp.c
>>   
>> +KEYS-TRUSTED-PLPKS
>> +M:	Srish Srinivasan <ssrish@linux.ibm.com>
>> +M:	Nayna Jain <nayna@linux.ibm.com>
>> +L:	linux-integrity@vger.kernel.org
>> +L:	keyrings@vger.kernel.org
>> +S:	Supported
>> +F:	include/keys/trusted_plpks.h
>> +F:	security/keys/trusted-keys/trusted_pkwm.c
>> +
>>   KEYS-TRUSTED-TEE
>>   M:	Sumit Garg <sumit.garg@kernel.org>
>>   L:	linux-integrity@vger.kernel.org
>> diff --git a/include/keys/trusted-type.h b/include/keys/trusted-type.h
>> index 4eb64548a74f..45c6c538df22 100644
>> --- a/include/keys/trusted-type.h
>> +++ b/include/keys/trusted-type.h
>> @@ -19,7 +19,11 @@
>>   
>>   #define MIN_KEY_SIZE			32
>>   #define MAX_KEY_SIZE			128
>> -#define MAX_BLOB_SIZE			512
>> +#if IS_ENABLED(CONFIG_TRUSTED_KEYS_PKWM)
>> +#define MAX_BLOB_SIZE			1152
>> +#else
>> +#define MAX_BLOB_SIZE                   512
>> +#endif
>>   #define MAX_PCRINFO_SIZE		64
>>   #define MAX_DIGEST_SIZE			64
>>   
>> @@ -46,6 +50,7 @@ struct trusted_key_options {
>>   	uint32_t policydigest_len;
>>   	unsigned char policydigest[MAX_DIGEST_SIZE];
>>   	uint32_t policyhandle;
>> +	uint16_t wrap_flags;
>>   };
>>   
>>   struct trusted_key_ops {
>> diff --git a/include/keys/trusted_pkwm.h b/include/keys/trusted_pkwm.h
>> new file mode 100644
>> index 000000000000..736edfc1e1dd
>> --- /dev/null
>> +++ b/include/keys/trusted_pkwm.h
>> @@ -0,0 +1,30 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef __PKWM_TRUSTED_KEY_H
>> +#define __PKWM_TRUSTED_KEY_H
>> +
>> +#include <keys/trusted-type.h>
>> +
>> +extern struct trusted_key_ops pkwm_trusted_key_ops;
>> +
>> +#define PKWM_DEBUG 0
>> +
>> +#if PKWM_DEBUG
>> +static inline void dump_options(struct trusted_key_options *o)
>> +{
>> +	bool sb_audit_or_enforce_bit = o->policyhandle & BIT(0);
>> +	bool sb_enforce_bit = o->policyhandle & BIT(1);
>> +
>> +	if (sb_audit_or_enforce_bit)
>> +		pr_info("secure boot mode: audit or enforce");
>> +	else if (sb_enforce_bit)
>> +		pr_info("secure boot mode: enforce");
>> +	else
>> +		pr_info("secure boot mode: disabled");
>> +}
>> +#else
>> +static inline void dump_options(struct trusted_key_options *o)
>> +{
>> +}
>> +#endif
> Please use pr_debug() instead of emulating this with 'PKWM_DEBUG'.


Sure, I will fix this.


>> +
>> +#endif
>> diff --git a/security/keys/trusted-keys/Kconfig b/security/keys/trusted-keys/Kconfig
>> index 204a68c1429d..9e00482d886a 100644
>> --- a/security/keys/trusted-keys/Kconfig
>> +++ b/security/keys/trusted-keys/Kconfig
>> @@ -46,6 +46,14 @@ config TRUSTED_KEYS_DCP
>>   	help
>>   	  Enable use of NXP's DCP (Data Co-Processor) as trusted key backend.
>>   
>> +config TRUSTED_KEYS_PKWM
>> +	bool "PKWM-based trusted keys"
>> +	depends on PSERIES_PLPKS >= TRUSTED_KEYS
>> +	default y
>> +	select HAVE_TRUSTED_KEYS
>> +	help
>> +	  Enable use of IBM PowerVM Key Wrapping Module (PKWM) as a trusted key backend.
>> +
>>   if !HAVE_TRUSTED_KEYS
>>   	comment "No trust source selected!"
>>   endif
>> diff --git a/security/keys/trusted-keys/Makefile b/security/keys/trusted-keys/Makefile
>> index f0f3b27f688b..5fc053a21dad 100644
>> --- a/security/keys/trusted-keys/Makefile
>> +++ b/security/keys/trusted-keys/Makefile
>> @@ -16,3 +16,5 @@ trusted-$(CONFIG_TRUSTED_KEYS_TEE) += trusted_tee.o
>>   trusted-$(CONFIG_TRUSTED_KEYS_CAAM) += trusted_caam.o
>>   
>>   trusted-$(CONFIG_TRUSTED_KEYS_DCP) += trusted_dcp.o
>> +
>> +trusted-$(CONFIG_TRUSTED_KEYS_PKWM) += trusted_pkwm.o
>> diff --git a/security/keys/trusted-keys/trusted_core.c b/security/keys/trusted-keys/trusted_core.c
>> index b1680ee53f86..2d328de170e8 100644
>> --- a/security/keys/trusted-keys/trusted_core.c
>> +++ b/security/keys/trusted-keys/trusted_core.c
>> @@ -12,6 +12,7 @@
>>   #include <keys/trusted_caam.h>
>>   #include <keys/trusted_dcp.h>
>>   #include <keys/trusted_tpm.h>
>> +#include <keys/trusted_pkwm.h>
>>   #include <linux/capability.h>
>>   #include <linux/err.h>
>>   #include <linux/init.h>
>> @@ -31,7 +32,7 @@ MODULE_PARM_DESC(rng, "Select trusted key RNG");
>>   
>>   static char *trusted_key_source;
>>   module_param_named(source, trusted_key_source, charp, 0);
>> -MODULE_PARM_DESC(source, "Select trusted keys source (tpm, tee, caam or dcp)");
>> +MODULE_PARM_DESC(source, "Select trusted keys source (tpm, tee, caam, dcp or pkwm)");
>>   
>>   static const struct trusted_key_source trusted_key_sources[] = {
>>   #if defined(CONFIG_TRUSTED_KEYS_TPM)
>> @@ -46,6 +47,9 @@ static const struct trusted_key_source trusted_key_sources[] = {
>>   #if defined(CONFIG_TRUSTED_KEYS_DCP)
>>   	{ "dcp", &dcp_trusted_key_ops },
>>   #endif
>> +#if defined(CONFIG_TRUSTED_KEYS_PKWM)
>> +	{ "pkwm", &pkwm_trusted_key_ops },
>> +#endif
>>   };
>>   
>>   DEFINE_STATIC_CALL_NULL(trusted_key_seal, *trusted_key_sources[0].ops->seal);
>> diff --git a/security/keys/trusted-keys/trusted_pkwm.c b/security/keys/trusted-keys/trusted_pkwm.c
>> new file mode 100644
>> index 000000000000..7968601dcf42
>> --- /dev/null
>> +++ b/security/keys/trusted-keys/trusted_pkwm.c
>> @@ -0,0 +1,168 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2025 IBM Corporation, Srish Srinivasan <ssrish@linux.ibm.com>
>> + */
>> +
>> +#include <keys/trusted_pkwm.h>
>> +#include <keys/trusted-type.h>
>> +#include <linux/build_bug.h>
>> +#include <linux/key-type.h>
>> +#include <linux/parser.h>
>> +#include <asm/plpks.h>
>> +
>> +enum {
>> +	Opt_err,
>> +	Opt_wrap_flags,
>> +};
>> +
>> +static const match_table_t key_tokens = {
>> +	{Opt_wrap_flags, "wrap_flags=%s"},
>> +	{Opt_err, NULL}
>> +};
>> +
>> +static int getoptions(char *datablob, struct trusted_key_options **opt)
>> +{
>> +	substring_t args[MAX_OPT_ARGS];
>> +	char *p = datablob;
>> +	int token;
>> +	int res;
>> +	unsigned long wrap_flags;
>> +	unsigned long token_mask = 0;
>> +
>> +	if (!datablob)
>> +		return 0;
>> +
>> +	while ((p = strsep(&datablob, " \t"))) {
>> +		if (*p == '\0' || *p == ' ' || *p == '\t')
>> +			continue;
>> +
>> +		token = match_token(p, key_tokens, args);
>> +		if (test_and_set_bit(token, &token_mask))
>> +			return -EINVAL;
>> +
>> +		switch (token) {
>> +		case Opt_wrap_flags:
>> +			res = kstrtoul(args[0].from, 16, &wrap_flags);
>> +			if (res < 0 || wrap_flags > 2)
>> +				return -EINVAL;
>> +			(*opt)->wrap_flags = wrap_flags;
>> +			break;
>> +		default:
>> +			return -EINVAL;
>> +		}
>> +	}
>> +	return 0;
>> +}
>> +
>> +static struct trusted_key_options *trusted_options_alloc(void)
>> +{
>> +	struct trusted_key_options *options;
>> +
>> +	options = kzalloc(sizeof(*options), GFP_KERNEL);
>> +	return options;
>> +}
>> +
>> +static int trusted_pkwm_seal(struct trusted_key_payload *p, char *datablob)
>> +{
>> +	struct trusted_key_options *options = NULL;
>> +	u8 *input_buf, *output_buf;
>> +	u32 output_len, input_len;
>> +	int rc;
>> +
>> +	options = trusted_options_alloc();
>> +	if (!options)
>> +		return -ENOMEM;
>> +
>> +	rc = getoptions(datablob, &options);
>> +	if (rc < 0)
>> +		goto out;
>> +	dump_options(options);
>> +
>> +	input_len = p->key_len;
>> +	input_buf = kmalloc(ALIGN(input_len, 4096), GFP_KERNEL);
>> +	if (!input_buf) {
>> +		pr_err("Input buffer allocation failed. Returning -ENOMEM.");
>> +		return -ENOMEM;
>> +	}
>> +
>> +	memcpy(input_buf, p->key, p->key_len);
>> +
>> +	rc = plpks_wrap_object(&input_buf, input_len, options->wrap_flags,
>> +			       &output_buf, &output_len);
>> +	if (!rc) {
>> +		memcpy(p->blob, output_buf, output_len);
>> +		p->blob_len = output_len;
>> +		dump_payload(p);
>> +	} else {
>> +		pr_err("Invalid argument");
>> +	}
>> +
>> +	kfree(input_buf);
>> +	kfree(output_buf);
>> +
>> +out:
>> +	kfree_sensitive(options);
>> +	return rc;
>> +}
>> +
>> +static int trusted_pkwm_unseal(struct trusted_key_payload *p, char *datablob)
>> +{
>> +	u8 *input_buf, *output_buf;
>> +	u32 input_len, output_len;
>> +	int rc;
>> +
>> +	input_len = p->blob_len;
>> +	input_buf = kmalloc(ALIGN(input_len, 4096), GFP_KERNEL);
>> +	if (!input_buf)
>> +		return -ENOMEM;
>> +
>> +	memcpy(input_buf, p->blob, p->blob_len);
>> +
>> +	rc = plpks_unwrap_object(&input_buf, input_len, &output_buf,
>> +				 &output_len);
>> +	if (!rc) {
>> +		memcpy(p->key, output_buf, output_len);
>> +		p->key_len = output_len;
>> +		dump_payload(p);
>> +	} else {
>> +		pr_err("Invalid argument");
> I don't get this error message. What does this mean? pr_err() is used
> when you have actual malfunction.


Yes, the error message lacks clarity here.
It was meant to communicate that the unwrap operation failed.

I will provide a more meaningful error message with the error code
as that would be more helpful.

And thanks for pointing this out.

>
>> +	}
>> +
>> +	kfree(input_buf);
>> +	kfree(output_buf);
>> +
>> +	return rc;
>> +}
>> +
>> +static int trusted_pkwm_init(void)
>> +{
>> +	int ret;
>> +
>> +	if (!plpks_wrapping_is_supported()) {
>> +		pr_err("H_PKS_WRAP_OBJECT interface not supported\n");
>> +
>> +		return -ENODEV;
>> +	}
>> +
>> +	ret = plpks_gen_wrapping_key();
>> +	if (ret) {
>> +		pr_err("Failed to generate default wrapping key\n");
>> +
>> +		return -EINVAL;
>> +	}
>> +
>> +	return register_key_type(&key_type_trusted);
>> +}
>> +
>> +static void trusted_pkwm_exit(void)
>> +{
>> +	unregister_key_type(&key_type_trusted);
>> +}
>> +
>> +struct trusted_key_ops pkwm_trusted_key_ops = {
>> +	.migratable = 0, /* non-migratable */
>> +	.init = trusted_pkwm_init,
>> +	.seal = trusted_pkwm_seal,
>> +	.unseal = trusted_pkwm_unseal,
>> +	.exit = trusted_pkwm_exit,
>> +};
>> -- 
>> 2.47.3
>>
> BR, Jarkko
>

thanks,
Srish.

